From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Mon, 28 Feb 2000 10:13:41 +0000
Subject: [PATCH] sb_card.c
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOUNDARY.144265400.2"
Message-Id: <marc-linux-sound-95173722927703@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

Warning: This is a message in MIME format. Your mail reader does not
support MIME. Some parts of this message will be readable as plain text.
To see the rest, you will need to upgrade your mail reader. Following are
some URLs where you can find MIME-capable mail programs for common platforms:

  Amiga............: YAM          http://www.yam.ch/
  Unix.............: Metamail     ftp://ftp.bellcore.com/nsb/
  Windows/Macintosh: Eudora       http://www.qualcomm.com/

General info about MIME can be found at:

http://www.cis.ohio-state.edu/hypertext/faq/usenet/mail/mime-faq/top.html


--BOUNDARY.144265400.2
Content-Type: text/plain


 This one adds support for ESS1688.

 Patch is against plain 2.3.48 kernel tree. 

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

--BOUNDARY.144265400.2
Content-Type: text/plain; charset=iso-8859-1; name="sb_patch.2.3.48"
Content-Disposition: attachment; filename="sb_patch.2.3.48"
Content-Transfer-Encoding: quoted-printable

--- linux/drivers/sound/sb_card.c	Sun Feb 27 22:29:45 2000
+++ sb-linux/drivers/sound/sb_card.c	Mon Feb 28 13:09:09 2000
@@ -491,6 +491,7 @@
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x009D), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x00C5), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
 	{ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x00E4), 0,	&sb_init_awe,	=
	"Sound Blaster AWE 64" },
+	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x0968), SBF_DEV,	&sb_init=
_ess,		"ESS 1688" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1868), SBF_DEV,	&sb_init=
_ess,		"ESS 1868" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x8611), SBF_DEV,	&sb_init=
_ess,		"ESS 1868" },
 	{ISAPNP_VENDOR('E','S','S'), ISAPNP_FUNCTION(0x1869), SBF_DEV,	&sb_init=
_ess,		"ESS 1869" },

--BOUNDARY.144265400.2--
