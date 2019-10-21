<div id="divAlumno">
    <g:hiddenField name="alumnoId" id="alumnoId" value="${alumno?.id}"></g:hiddenField>
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <label class="label text-dark font-weight-bold"> Nombre: ${alumno?.nombre} </label>
            </div>
            <div class="row">
                <label class="label text-dark font-weight-bold"> Dni:${alumno?.dni}</label>
            </div>
            <div class="row">
                <label class="label text-dark font-weight-bold">  Fecha de nacimiento:${alumno?.fechaDeNacimiento}</label>
            </div>
            <div class="row">
                <label class="label text-dark font-weight-bold"> Puntaje:${alumno?.puntaje}</label>
            </div>
            <div class="row">
                <label class="text-warning"> Notas:${alumno?.notas}</label>
            </div>
        </div>

        <div class="col-md-6">
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <br>
            <g:each in="${listClases}" var="clase">
                <div class="row">
                    <label class="label text-dark font-weight-bold"> Clase:${clase?.clase?.nombre}</label>
                </div>
                <div class="row">
                    <label class="label text-dark font-weight-bold"> Valido Hasta:${clase?.hasta?.format("dd/MM/yyyy")}</label>
                </div>
                <div class="row">
                    <g:if test="${clase?.free==null}">
                        <label class="label text-dark font-weight-bold"> Clases restantes:${clase?.cantClases}</label>
                    </g:if>
                </div>
                <g:if test="${clase?.cantClases >0 }">
                        <button class="btn btn-dark pull-right asistir" id="asistir" value="${clase?.id}">Asistir</button>
                </g:if>
                <g:if test="${clase?.free!=null}">
                    <button class="btn btn-dark pull-right asistir" id="asistir" value="${clase?.id}">Asistir</button>
                </g:if>
            </g:each>
        </div>
    </div>
</div>

<script>

    $(".asistir").click(function() {
            var alumnoId= $("#alumnoId").val();
            var claseId= $(this).val();

            ${remoteFunction(
               controller: "Asiste",
               action: "registrarAsistencia",
               update:'divAlumno',
                params:"{claseId:claseId,alumnoId:alumnoId}"
            )}
        }
    );



</script>