select c.nomedacidade,
       cl.codigocliente,
       cl.nome,
       ct.contrato,
case
when
ct.formapagamento=1 then 'Boleto Bancário'
when
ct.formapagamento=2 then 'Depósito'
when
ct.formapagamento=3 then 'Débito automático'
when
ct.formapagamento=4 then 'Cartão de Crédito'
end as forma_de_pagamento_contrato,
      case
when
dr.formadepagamento = 1 then 'Boleto'
when
dr.formadepagamento = 4 then 'Cartão de Credito'
end as forma_pagamento_fatura,
      dr.numerodocumento,
      dr.d_datavencimento,
      dr.d_datapagamento,
      dr.url_pdf_terceiros
from docreceber dr
join fatura f on f.numerofatura = dr.fatura
join contratos ct on ct.cidade = f.codigodacidade and ct.contrato = f.numerodocontrato
join public.cidade c on c.codigodacidade = ct.cidade
join public.clientes cl on cl.cidade = ct.cidade and cl.codigocliente =
ct.codigodocliente