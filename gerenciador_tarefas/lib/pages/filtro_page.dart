
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas/model/tarefa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltroPage extends StatefulWidget{

  static const ROUTE_NAME = '/filtro';
  static const CHAVE_CAMPO_ORDENACAO = 'campoOrdenacao';
  static const CHAVE_ORDENAR_DECRECENTE = 'usarOrdemDecrescente';
  static const CHAVE_FILTRO_DESCRICAO = 'filtroDescricao';

  _FiltroPageState createState() => _FiltroPageState();

}

@override
class _FiltroPageState extends State<FiltroPage>{
  final camposParaOrdenacao={
    Tarefa.campo_id: 'Código', Tarefa.campo_descricao: 'Descrição', Tarefa.campo_prazo: 'Prazo'
  };

  late final SharedPreferences prefs;
  final _descricaoController = TextEditingController();
  String _campoOrdenacao = Tarefa.campo_id;
  bool _usarOrdemDecrescente = false;
  bool _alterouValores = false;


  @override
  Widget build(BuildContext context){
    return WillPopScope(
        onWillPop: null,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              title: Text('Filtro e Ordenação')
          ),
          body: _criarBody(),
        ),
    );
  }

  Widget _criarBody(){
    return ListView(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
          child: Text('Campos para Ordenação'),
        ),
        for (final campo in camposParaOrdenacao.keys)
          Row(
            children: [
              Radio(
                  value: campo,
                  groupValue: _campoOrdenacao,
                  onChanged: _onCampoOrdenacaoChanged,
              ),
              Text(camposParaOrdenacao[campo] ?? ''),
            ],
          ),
        Divider(),
        Row(
          children: [
            Checkbox(
                value: _usarOrdemDecrescente,
                onChanged: null
            ),
            Text('Usar ordem decrescente')
          ],
        ),
        Divider(),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(labelText: 'a descrição começa com'),
          ),

        ),
      ],
    );
  }

  void _onCampoOrdenacaoChanged(String? valor){
    prefs.setString(FiltroPage.CHAVE_CAMPO_ORDENACAO, valor ?? '');
    _alterouValores = true;
    setState(() {
      _campoOrdenacao = valor ?? '';
    });
  }

}