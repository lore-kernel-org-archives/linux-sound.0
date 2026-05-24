Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9139BFE0;
	Sun, 24 May 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637307; cv=none; b=mWa3oIsCBQTWniOKJ6UPcoXO/v5q36TIeAUlkBMJJgsRN3xWL1nSSY1gp5Wdk/vjgq5UUmeEL2WgHciNxUP6dJNsDE9er+chIxcRYw5BgZ8oE+efGZGPHXm7NN+nYfOQmunPy8b1Ui1hApf9rM5khRJhVZ8whaJLFI29ZyudLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637307; c=relaxed/simple;
	bh=G/2ioAqA6Da71i1yqXNG8Glf4xidelgW8BGpCPWPKDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DooQz21UzmGAIATdZdnfCX1zWOwGZIeagHnSoNVwUZa2tTAN1NuLUmzURRZPj8m+qYzUb/MH4HDRjHlRSMzs+r0J1OXSmr6AsYjYruH7fceTrgMyM8egD24W+GdweSXXWU4BGh98Wf2dG9qqsO1Jj8VYuNKhJ5edukqhMxayIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=fKCZiG4h; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="fKCZiG4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1779637298; x=1780242098; i=len.bao@gmx.us;
	bh=oDlgc9zt+VJ0WGOGUoaRXfI3Y0+YoTtSrs9/rB4EP1g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fKCZiG4hvbrhvWgy4F9AXjadYDfyU+wAkzYm9uYUqbgNtmngGkyZeQQPXM8wCtzH
	 yueWM1a6yatUS58KtSt3CX+V57k0hYysuw0tbdh0K0TM3ssPpdemJD/03G6TSrT8H
	 MZmboIgPlakP2m7cUNvbj4pnC+cve9vWTv01GwAaKgheRLFFVmMY7WEJ9Laqhz4IW
	 yNdxA67qBUVVRli+deKl2bEsBKrz4506/VXrau83GgecM5JIFjg/8tzbRMXd+ROMF
	 Y3nJwYWQ1GToNyzG/VLLNixILjVXCNVvkSFTucSQga1zaNtdtZPvhvk1ry8TB+xbf
	 P39SLDitQNGbFUiS0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MnakX-1xAAPU2xeP-00piHh; Sun, 24
 May 2026 17:41:38 +0200
From: Len Bao <len.bao@gmx.us>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: isa: Mark '*_registered' variables as __ro_after_init
Date: Sun, 24 May 2026 15:40:49 +0000
Message-ID: <20260524154051.45258-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T7AKYbaDAaeVJppW63bO9ZTNmZLwtahYAbIc3zUDGOJt/Lalmn1
 x5mYIvNoI5lyEqy6AL/jrIiWn7sItVRWjYOyD7cQx+4Oko2N/HSnR2RvB8nY8N8/5t00Ujd
 VR6ARbQmm92RrLlzM9Ep+0dyPYUkg64TtSRvyzZyIc+wty/kNBzmdMLxRNHdanhLTGeVEw5
 OeNf2mmhl7jsjxt2K4Vww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C1UtqO629sc=;VKOSyYwLvQRfLUj7ju/jINIZYrg
 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
 HDx3hoqHk=

The '*_registered' variables are initialized only during the init
phase in the '__init' functions and never changed. So, mark them as
__ro_after_init to reduce the attack surface.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 sound/isa/cmi8330.c             | 4 ++--
 sound/isa/cs423x/cs4236.c       | 6 +++---
 sound/isa/es18xx.c              | 6 +++---
 sound/isa/gus/interwave.c       | 4 ++--
 sound/isa/msnd/msnd_pinnacle.c  | 4 ++--
 sound/isa/opl3sa2.c             | 6 +++---
 sound/isa/sb/sb16.c             | 4 ++--
 sound/isa/sscape.c              | 4 ++--
 sound/isa/wavefront/wavefront.c | 4 ++--
 9 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index 3d1f19321..ecff52195 100644
=2D-- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -103,8 +103,8 @@ MODULE_PARM_DESC(mpuport, "MPU-401 port # for CMI8330/=
CMI8329 driver.");
 module_param_hw_array(mpuirq, int, irq, NULL, 0444);
 MODULE_PARM_DESC(mpuirq, "IRQ # for CMI8330/CMI8329 MPU-401 port.");
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
 #endif
=20
 #define CMI8330_RMUX3D    16
diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index e36cc1476..238065ffa 100644
=2D-- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -69,9 +69,9 @@ module_param_hw_array(dma2, int, dma, NULL, 0444);
 MODULE_PARM_DESC(dma2, "DMA2 # for " IDENT " driver.");
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnpc_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnpc_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
 #endif /* CONFIG_PNP */
=20
 struct snd_card_cs4236 {
diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 1da7b400a..df88d91e0 100644
=2D-- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1924,9 +1924,9 @@ module_param_hw_array(dma2, int, dma, NULL, 0444);
 MODULE_PARM_DESC(dma2, "DMA 2 # for ES18xx driver.");
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
-static int pnpc_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
+static int pnpc_registered __ro_after_init;
=20
 static const struct pnp_device_id snd_audiodrive_pnpbiosids[] =3D {
 	{ .id =3D "ESS1869" },
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 6c3a2977d..115f900fa 100644
=2D-- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -111,8 +111,8 @@ struct snd_interwave {
=20
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
=20
 static const struct pnp_card_device_id snd_interwave_pnpids[] =3D {
 #ifndef SNDRV_STB
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle=
.c
index 5b729bb02..0d5f4461a 100644
=2D-- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -1199,8 +1199,8 @@ static int snd_msnd_pnp_resume(struct pnp_card_link =
*pcard)
 }
 #endif
=20
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
=20
 static const struct pnp_card_device_id msnd_pnpids[] =3D {
 	/* Pinnacle PnP */
diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 8c1767697..88eada933 100644
=2D-- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -69,9 +69,9 @@ module_param_array(opl3sa3_ymode, int, NULL, 0444);
 MODULE_PARM_DESC(opl3sa3_ymode, "Speaker size selection for 3D Enhancemen=
t mode: Desktop/Large Notebook/Small Notebook/HiFi.");
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
-static int pnpc_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
+static int pnpc_registered __ro_after_init;
 #endif
=20
 /* control ports */
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index 208d1942a..866d7f5c5 100644
=2D-- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -99,8 +99,8 @@ MODULE_PARM_DESC(seq_ports, "Number of sequencer ports f=
or WaveTable synth.");
 #endif
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
 #endif
=20
 struct snd_card_sb16 {
diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 553ceb92d..ce8a59650 100644
=2D-- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -71,8 +71,8 @@ module_param_array(joystick, bool, NULL, 0444);
 MODULE_PARM_DESC(joystick, "Enable gameport.");
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
=20
 static const struct pnp_card_device_id sscape_pnpids[] =3D {
 	{ .id =3D "ENS3081", .devs =3D { { "ENS0000" } } }, /* Soundscape PnP */
diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefro=
nt.c
index 07c685680..cacc1479b 100644
=2D-- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -71,8 +71,8 @@ module_param_array(use_cs4232_midi, bool, NULL, 0444);
 MODULE_PARM_DESC(use_cs4232_midi, "Use CS4232 MPU-401 interface (inaccess=
ibly located inside your computer)");
=20
 #ifdef CONFIG_PNP
-static int isa_registered;
-static int pnp_registered;
+static int isa_registered __ro_after_init;
+static int pnp_registered __ro_after_init;
=20
 static const struct pnp_card_device_id snd_wavefront_pnpids[] =3D {
 	/* Tropez */
=2D-=20
2.43.0

