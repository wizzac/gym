<div class="sidebar" data-image="<g:resource dir="images" file="loginBackground.jpg"/>">
    <div class="logo">
        <g:link controller="verify" action="index" class="simple-text logo-mini">
            ${grailsApplication.config.gym.application.title.substring(0, 2)}
        </g:link>
        <g:link controller="verify" action="index" class="simple-text logo-normal">
            ${grailsApplication.config.gym.application.title}
        </g:link>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <g:each in="${grailsApplication.config.gym.menus}" var="menu">
                %{--<g:if test="${!menu.permission || menu.permission == "" || session.permisos.contains(menu.permission)}">--}%
                    <g:if test="${menu.submenus}">
                        <g:if test="${menu.submenus.size() == 1}">
                            <li class="nav-item">
                            %{--<g:remoteLink controller="${menu.controller}" action="${menu.action}" update="trabajo" onSuccess="closeMenu()">--}%
                            %{----}%
                                <g:remoteLink class="nav-link" controller="${menu.submenus[0].controller}" action="${menu.submenus[0].action}"  aria-expanded="false" update="trabajo">
                                    <i class="material-icons">${menu.submenus[0].icon}</i>
                                    <p><g:message code="menu.title.${menu.submenus[0].title.code}" default="${menu.submenus[0].title.default}"/></p>
                                </g:remoteLink>
                            </li>
                        </g:if>
                        <g:else>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="collapse" href="#menu${menu.id}">
                                    <i class="material-icons">${menu.icon}</i>
                                    <p><g:message code="menu.title.${menu.title.code}" default="${menu.title.default}"/>
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <div class="collapse" id="menu${menu.id}">
                                    <ul class="nav">
                                        <g:each in="${menu.submenus}" var="submenu">
                                            <g:if test="${!submenu.permission || submenu.permission == '' || session.permisos.contains(submenu.permission)}">
                                                <li class="nav-item">
                                                    <g:remoteLink class="nav-link" controller="${submenu.controller}" action="${submenu.action}" aria-expanded="false" update="trabajo">
                                                    %{--<g:link class="nav-link" controller="${submenu.controller}" action="${submenu.action}">--}%
                                                        <span class="sidebar-mini"><g:message code="menu.title.${submenu.titleMini.code}" default="${submenu.titleMini.default}"/></span>
                                                        <span class="sidebar-normal"><g:message code="menu.title.${submenu.title.code}" default="${submenu.title.default}"/></span>
                                                    </g:remoteLink>
                                                </li>
                                            </g:if>
                                        </g:each>
                                    </ul>
                                </div>
                            </li>
                        </g:else>
                    </g:if>
                    <g:else>
                        <li class="nav-item">
                            <g:remoteLink class="nav-link" controller="${menu.controller}" action="${menu.action}" aria-expanded="false" update="trabajo">
                                <i class="material-icons">${menu?.icon}</i>
                                <p><g:message code="menu.title.${menu?.title?.code}" default="${menu?.title.default}"/></p>
                            </g:remoteLink>
                        </li>
                    </g:else>

                %{--</g:if>--}%
            </g:each>
        </ul>
    </div>

</div>