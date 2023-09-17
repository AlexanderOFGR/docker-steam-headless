
echo "**** Configure Desktop ****"

if ([ "${MODE}" != "s" ] && [ "${MODE}" != "secondary" ]); then
    echo "Enable Desktop service."
    sed -i 's|^autostart.*=.*$|autostart=true|' /etc/supervisor.d/desktop.ini
else
    echo "Desktop service not available when container is run in 'secondary' mode."
    sed -i 's|^autostart.*=.*$|autostart=false|' /etc/supervisor.d/desktop.ini
fi
echo "Ensure home directory template is owned by the default user."
chown -R ${PUID}:${PGID} /templates/home_directory_template

echo "DONE"
