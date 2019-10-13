<script>
    <g:if test="${good}">
        goodUsername = true
    </g:if>
    <g:else>
        goodUsername = false
        $(".user").addClass("has-error")
    </g:else>
</script>