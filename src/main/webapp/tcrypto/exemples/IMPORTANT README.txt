> Degut a un bug conegut de la nova versi� de java 1.7.0.45, els exemples html que es distribueixen no funcionen directament executats en local amb aquesta versi�, per a poder-los
provar s'han de posar p.e dins de la carpeta htdocs d'un apache. En teoria aix� �s un bug catalogat per els propis desenvolupadors d'oracle amb el que entenem quedar� corregit
en properes versions.

(http://www.oracle.com/technetwork/java/javase/7u45-relnotes-2016950.html)

Area: Deployment/Plugin
Synopsis: Non-JNLP trusted applet fails to load using the file:\\ URL.

Local trusted applets that do not deploy using a JNLP file will fail to load by throwing a java.lang.NullPointerException. You can work around this issue by using one of the following methods:

Use a JNLP file to launch the applet.
Try loading the applet over HTTP or HTTPS.


> ELS APPLET DESPLEGATS EN SERVIDOR NO TINDR�N AQUEST PROBLEMA.

> La nova versi� de java 1.7.0.51 ja no t� aquest problema.
