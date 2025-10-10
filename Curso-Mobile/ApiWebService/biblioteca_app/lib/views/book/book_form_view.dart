import 'package:biblioteca_app/models/book_model.dart';
import 'package:biblioteca_app/controllers/book_controller.dart';
import 'package:flutter/material.dart';

class BookFormView extends StatefulWidget {
  final BookModel? book;

  const BookFormView({super.key, this.book});

  @override
  State<BookFormView> createState() => _BookFormViewState();
}

class _BookFormViewState extends State<BookFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = BookController();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  bool _available = true;

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _titleController.text = widget.book!.title;
      _authorController.text = widget.book!.author;
      _available = widget.book!.available;
    }
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final book = BookModel(
        title: _titleController.text,
        author: _authorController.text,
        available: _available,
      );
      await _controller.create(book);
      Navigator.pop(context);
    }
  }

  void _update() async {
    if (_formKey.currentState!.validate() && widget.book != null) {
      final book = BookModel(
        id: widget.book!.id,
        title: _titleController.text,
        author: _authorController.text,
        available: _available,
      );
      await _controller.update(book);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? "Novo Livro" : "Editar Livro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o título" : null,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: "Autor"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o autor" : null,
              ),
              SwitchListTile(
                title: Text("Disponível"),
                value: _available,
                onChanged: (value) {
                  setState(() {
                    _available = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.book == null ? _save : _update,
                child: Text(widget.book == null ? "Salvar" : "Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
