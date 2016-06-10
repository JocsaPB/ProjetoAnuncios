<!--My styles-->
<spring:url value="/resources/_css/style.css" var="styleCSS"></spring:url>
<link rel="stylesheet" type="text/css" href="${styleCSS}" />

<!--BOOTSTRAP and JSbootstrap-->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<spring:url value="/resources/_css/bootstrap.min.css" var="bootstrapMinCSS"></spring:url>
<link href="${bootstrapMinCSS}" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<spring:url value="/resources/_javascript/bootstrap.min.js"	var="bootstrapMinJS"></spring:url>
<script src="${bootstrapMinJS}"></script>

<spring:url value="/resources/_javascript/javascript.js" var="myJs"></spring:url>
<script type="text/javascript" src="${myJs}"></script>

<!-- DEPENDENCIAS PARA O MODAL DO MEUS DADOS -->



<script>
//DESLOGADO E LOGADO
function voltar() { location.href = "javascript:history.back()" }

//LOGADO
function cadastrarAnuncio(){ location.href = "meusAnuncios"}
function cadastrarAnuncio(){ location.href = "formCadastrarAnuncio" }
</script>