From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Thu, 28 Dec 2006 08:17:41 +0000
Subject: [PATCH] sound/pci/ac97/ac97_codec.c: Refactoring
Message-Id: <80ec54e90612280017t8210f24h2704a014e1447483@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@gmail.com>
--- linux-2.6.20-rc2/sound/pci/ac97/ac97_codec.c	2006-12-27
10:00:04.000000000 +0100
+++ linux/sound/pci/ac97/ac97_codec.c	2006-12-28 10:08:47.000000000 +0100
@@ -205,24 +205,16 @@ static int snd_ac97_valid_reg(struct snd
 	switch (ac97->id) {
 	case AC97_ID_AK4540:
 	case AC97_ID_AK4542:
-		if (reg <=3D 0x1c || reg =3D 0x20 || reg =3D 0x26 || reg >=3D 0x7c)
-			return 1;
-		return 0;
+		return (reg <=3D 0x1c || reg =3D 0x20 || reg =3D 0x26 || reg >=3D 0x7c);
 	case AC97_ID_AD1819:	/* AD1819 */
 	case AC97_ID_AD1881:	/* AD1881 */
 	case AC97_ID_AD1881A:	/* AD1881A */
-		if (reg >=3D 0x3a && reg <=3D 0x6e)	/* 0x59 */
-			return 0;
-		return 1;
+		return (reg < 0x3a || reg > 0x6e);	/* 0x59 */
 	case AC97_ID_AD1885:	/* AD1885 */
 	case AC97_ID_AD1886:	/* AD1886 */
 	case AC97_ID_AD1886A:	/* AD1886A - !!verify!! --jk */
 	case AC97_ID_AD1887:	/* AD1887 - !!verify!! --jk */
-		if (reg =3D 0x5a)
-			return 1;
-		if (reg >=3D 0x3c && reg <=3D 0x6e)	/* 0x59 */
-			return 0;
-		return 1;
+		return (reg =3D 0x5a || reg < 0x3c || reg > 0x6e);	/* 0x59 */
 	case AC97_ID_STAC9700:
 	case AC97_ID_STAC9704:
 	case AC97_ID_STAC9705:
@@ -230,9 +222,7 @@ static int snd_ac97_valid_reg(struct snd
 	case AC97_ID_STAC9721:
 	case AC97_ID_STAC9744:
 	case AC97_ID_STAC9756:
-		if (reg <=3D 0x3a || reg >=3D 0x5a)
-			return 1;
-		return 0;
+		return (reg <=3D 0x3a || reg >=3D 0x5a);
 	}
 	return 1;
 }
