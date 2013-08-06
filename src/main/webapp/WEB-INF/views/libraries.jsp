<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="librariesContainer">
    <c:if test="${!empty libList}">
        <table class="list tablesorter">
            <thead>
            <tr>
                <th>Vendor</th>
                <th>Library Name</th>
                <th>Library Version</th>
                <th>License</th>
                <th>Language</th>
                <th>Secunia ID</th>
                <th>&nbsp;</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${libList}" var="libList">
                <tr>
                    <td><c:out value="${libList.library.libraryVendor.vendor}"/></td>
                    <td><c:out value="${libList.library.libraryname}"/></td>
                    <td><c:out value="${libList.libraryversion}"/></td>
                    <td><a data-toggle="modal" class="open-LicenseLibrariesModal" data-licensefiletype ="${libList.library.license.contenttype}" data-licenseid ="${libList.library.license.id}" data-licensename ="${libList.library.license.licensename}" data-licensfileename ="${libList.library.license.filename}"href="#licenseLibrariesModal">${libList.library.license.licensename}</a></td>
                    <td><c:out value="${libList.library.language}"/></td>
                    <td><c:out value="${libList.library.secunia}"/></td>
                    <td style="vertical-align:top;text-align:right;">
                        <div class="btn-group">
                            <a data-toggle="modal"
                               data-libraryid ="${libList.library.id}"
                               data-vendorid ="${libList.library.libraryVendor.id}"
                               data-licenseid ="${libList.library.license.id}"
                               data-libraryversionid ="${libList.id}"


                               data-vendor ="${libList.library.libraryVendor.vendor}"
                               data-libraryname ="${libList.library.libraryname}"
                               data-libraryversion ="${libList.libraryversion}"
                               data-licensename ="${libList.library.license.licensename}"
                               data-language ="${libList.library.language}"
                               data-secunia ="${libList.library.secunia}"
                               class="open-EditLibrariesModal btn" href="#editLibrariesModal">Edit</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<div id="libraryModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="applicationModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="applicationModalLabel">New Library</h4>
    </div>
        <form:form id="addLibrariesForm" style="margin-bottom:0" action="${pageContext.request.contextPath}/addlibraries" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
            <table>
                <tr>
                    <div style="display:inline">
                    <td><label for="libraryname">Library Name</label></td>
                    <td>
                        <select id="librarynameid" name="libraryname" autofocus="autofocus"  onchange="populatetextbox('input#libraryname',this)">
                            <option value="">--</option>
                            <c:forEach items="${uniquelibList}" var="libList">
                                <option value="${libList.libraryname}"><c:out value="${libList.libraryname}"/></option>
                            </c:forEach>
                        </select>
                        <input id="libraryname" name ="libnamesel" type="text" style="  position:relative; height: 20px; border: 0px; left: -223px; width: 183px;" />
                    </td>
                    </div>
                </tr>


                <tr>
                    <td><label for="libraryversion">Library Version</label></td>
                    <td>
                        <div style="display:inline">
                        <select id="libraryversionid" name="libraryname"   onchange="$('input#libraryversion').val($(this).val());">
                            <option value="">--</option>
                            <c:forEach items="${uniqueVer}" var="libList">
                                <option value="${libList}"><c:out value="${libList}"/></option>
                            </c:forEach>
                        </select>
                        <input id="libraryversion" name ="libversel" type="text" style="  position:relative; height: 20px; border: 0px; left: -223px; width: 183px;" />
                    </div></td>
                </tr>


                <tr>
                    <td><label for="vendor">Vendor</label></td>
                    <td>
                        <div style="display:inline">
                        <select id="vendorid" name="libraryname"  onchange="$('input#vendor').val($(this).val());">
                            <option value="">--</option>
                            <c:forEach items="${uniquevenList}" var="libList">
                                <option value="${libList.vendor}"><c:out value="${libList.vendor}"/></option>
                            </c:forEach>
                        </select>
                        <input id="vendor" name ="vendorsel" type="text" style="  position:relative; height: 20px; border: 0px; left: -223px; width: 183px;" />
                         </div>
                    </td>
                </tr>


                <tr>
                    <td><label for="license">License</label></td>
                    <td>
                        <div style="display:inline">
                        <select id="licenseids" name="license"  onchange="$('input#license').val($(this).val());">
                            <option value="">--</option>
                            <c:forEach items="${uniquelicList}" var="libList">
                                <option value="${libList.licensename}"><c:out value="${libList.licensename}"/></option>
                            </c:forEach>
                        </select>
                        <input id="license" name ="licensesel" type="text" style="  position:relative; height: 20px; border: 0px; left: -223px; width: 183px;" />
                            </div>
                    </td>
                </tr>

                <tr>
                    <td><label for="Licensefile">License File</label></td>
                    <td><input id="Licensefile" name="Licensefile" type="file" /></td>

                </tr>



                <tr>
                    <td><label for="language">Language</label></td>
                    <td>
                        <div style="display:inline">
                        <select id="languageid" name="language"  onchange="$('input#language').val($(this).val());">
                            <option value="">--</option>
                            <c:forEach items="${uniqueLang}" var="libList">
                                <option value="${libList}"><c:out value="${libList}"/></option>
                            </c:forEach>
                        </select>
                        <input id="language" name ="languagesel" type="text" style="  position:relative; height: 20px; border: 0px; left: -223px; width: 183px;" />
                            </div>
                    </td>
                </tr>


                <tr>
                    <td><label for="secuniaID">SecuniaID</label></td>
                    <td><input id="secuniaID" name="secuniaID" type="text" /></td>

                </tr>

            </table>
        </div>

            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                <button class="modalSubmit btn btn-primary">Add Library</button>
            </div>

            <tr>
        </form:form>
</div>

   <%--editting libraries without being associated to applications--%>

<div id="editLibrariesModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editLibrariesModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="editLibrariesModalLabel">Edit Library
            <span class="delete-span">
				<a class="btn btn-danger header-button" id="deleteLibrary" href="" onclick="return confirm('Possibly Deleting a library bound to multiple application.Are you sure you want to delete the application?')">Delete</a>
			</span>
        </h4>
    </div>
    <form:form id="editLibrariesForm" style="margin-bottom:0" action="${pageContext.request.contextPath}/updatelibrary" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
                <table>
                    <tr>
                        <td><label for="libraryname">Library Name</label></td>
                        <td><input id="librarynameedit" name="libraryname" type="text" value=""/></td>

                    </tr>

                    <tr>
                        <td><label for="libraryversion">Library Version</label></td>
                        <td><input id="libraryversionedit" name="libraryversion" type="text" value=""/></td>

                    </tr>
                    <tr>
                        <td><label for="vendor">Vendor</label></td>
                        <td><input id="vendoredit" name="vendor" type="text" value=""/></td>

                    </tr>
                    <tr>
                        <td><label for="license">License</label></td>
                        <td><input id="licenseedit" name="license" type="text" value=""/></td>

                    </tr>
                    <tr>
                        <td><label for="Licensefile">License File</label></td>
                        <td><input id="Licensefileedit" name="Licensefile" type="file" /></td>

                    </tr>

                    <tr>
                        <td><label for="language">Language</label></td>
                        <td><input id="languageedit" name="language" type="text" value=""/></td>

                    </tr>
                    <tr>
                        <td><label for="secuniaID">SecuniaID</label></td>
                        <td><input id="secuniaIDedit" name="secuniaID" type="text" value=""/></td>

                    </tr>

                </table>
                    <%--<input type="hidden" id="addid" name="id" value=""/>--%>
                <input type="hidden" id="editvendorid" name="editvendorid" value=""/>
                <input type="hidden" id="editlicenseid" name="editlicenseid" value=""/>
                <input type="hidden" id="editlibraryid" name="editlibraryid" value=""/>
                <input type="hidden" id="editlibraryversionid" name="editlibraryversionid" value=""/>
            </div>



        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            <button class="modalSubmit btn btn-primary">Save Changes</button>
        </div>
    </form:form>
</div>

<div id="licenseLibrariesModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="licenseLibrariesModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="licenseLibrariesModalLabel">View License

        </h4>
    </div>
    <form:form id="licenseLibrariesForm" style="margin-bottom:0" action="${pageContext.request.contextPath}/downloadlicense" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
            <table>
                <tr>
                    <td><label for="licensename">License Name</label></td>
                    <td><input id="licensename" name="licensename" type="text" value="" readonly/></td>

                </tr>
                <tr>
                    <td><label for="licensfileename">License File</label></td>
                    <td><input id="licensfileename" name="licensfileename" type="text" value="" readonly/></td>

                </tr>
                <tr>
                    <td><label for="viewlicense">View File</label></td>
                    <td>
                <iframe id="viewlicense" src="" width="400" height="400" seamless> </iframe>  </td>
                </tr>
            </table>


                <input type="hidden" id="licenseid" name="licenseid" value=""/>

        </div>



        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
            <button class="modalSubmit btn btn-primary">Download</button>
        </div>
    </form:form>
</div>
