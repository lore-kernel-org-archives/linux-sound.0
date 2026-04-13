Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF33E3C48
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 19:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776109547; cv=none; b=l4KHVmQe0+eCxsgqiiYMjr1/7sl5WvvRreA7JCd/moK9d1HfMWp130cXeqjnuYGxHQYZREUxz7p8fkFENEONZjuYR1wSwCKNeLpCzVMJA/Qexlc8Dcxz4yPCWykGOzfp+nXSa53TzCvPltacdsaV7Onsr/QR2cAnyOL4h3NHUiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776109547; c=relaxed/simple;
	bh=C36cdi/djshwJDRoZ+EGzcag7jwPRv8sQFG2+lNnvdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SQ6soy81dzzZ17aoydHzlUWBNAdxJaO5glkQD4bg5rD1CSorqQQ8s9rtitpx8kqDlr2r5o5fx9iUdN2tuuNA9FGHbfltZtqPu8JsyoRzlq64pvw0OGQw21PYZS9E90l57HiC/0FnBmZEnnoThFkf+zkzeGyAhqYyspyBKkTYHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnwhzKVc; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnwhzKVc"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2dbb4ad19a5so325933eec.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776109545; x=1776714345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZw8P8bwG8C65J9dWLuc7qg0tcndd8Rczg2TM0CVamg=;
        b=JnwhzKVcCXnKuhpXfMeRBlGjNt2L3FPO0u5yrGJieLd6MPleEnSWjOgrtQCU3xIDMN
         71EbA8FskA9d025d8E0HHVgg0yoyD+aoHRgP7UP1COj1dkXkQvl71D6fVzMUv8cAbkce
         K1ZCYEjSWgXC8HMLWSLoTk78/oX7k6hjTA4eU77Th25k2KBWejfyixtL+YxK3mVdv0HK
         QpPX7A3ejNDnH7kallhRqRBZp9rn2T3Ehg0iuhxxFiQy9D5SCXilOGH/zorp18S9BdR2
         l4oimTZFDypc5k08Y91F5RzHfC6DaJ/GVIpp3+/G7N/9KAjYEERrBxzTu0mQaFSm7pDZ
         s6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776109545; x=1776714345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZw8P8bwG8C65J9dWLuc7qg0tcndd8Rczg2TM0CVamg=;
        b=Gw9SF0yN+9cWw6n9dKCHfFdtV5URWbPxgkwD9ZV10BJyUNC56mgvUdEn+ZglDJIsk6
         sqlYWyIf0NSWJsxIMaEcEqYNz9Lo+/0nys4KdeivdPl69OBymbdRPh1iQClsyuEgB3jS
         r8IZy4AhwpVXMjWMPxhhqJCYGrZWwMEPa1yHio15vKAr84NSnJT7yJ/JTtK9+nUutrYx
         WUL16JStO0ufdKWXkff9RcAEpxrhLv97fbuwHvaAmfH2hyxCWAOOExihtfljFYTdzfp4
         NWLZ4yQHTwEABG6AHBBHWWAoEMTz4Hs2FtzzO8/bM6qeOyO5hpKX1kSopt0HQCmi/cF0
         /TDg==
X-Gm-Message-State: AOJu0YyQDiKsYzrgEGQQR6KuypMTyAMpzk28xTRrYBNOO5ABBouUEZ4P
	DELH0EmGr2iErGsaDyw2ICqQGcaIBY3DoEJ1V3sHQuyVUVtgRrcEG1he
X-Gm-Gg: AeBDieu8j1OywKKMugHpLICAMWE0TdamHzM31fhA04ZxLnXRPpARafIKzo0GbNkodQC
	LmeMO74k0YTVk70P6iZQRZAe79gD5UJvIGK3eM4e/kZ/t+Q6QjnYsfeAaRSCaluxhf/dqlbLPcn
	norUGLwp7sdXj7HdMRQa7yt5rCQ0DF4aDN6LDqd3Y0wWchh0uLrKYWZdPc3s9rVArHkTHYgGIfW
	c/YPaJJD1LKjaHvpcURB+eFdHDGjEvPnlZVtamkCdseDDMh9Qec3us5a9n3gVa6gz9nFi3O/HM1
	YCm0vWRMaaHDttAhdk6Q+0FzPN/GpI0GKECWLlJLv2wnFcSJlmkuzGpI3mijrWUj6KHMk8go1BN
	zqwXqqwSRhF0VpzySTcn/wZY//yE6n3eI8N1RfHXJLZEg6cHi+dpJdMp9tiK7q8EbXhQUKMjuFU
	iypekjW4BccZmNjMIdfcNZyhJBbchA2qVpSAil+zNRdB9TwK1sGSbC1hRqHQD6Wa69WWDu5O873
	QoZ
X-Received: by 2002:a05:7300:8c85:b0:2c5:50fe:c782 with SMTP id 5a478bee46e88-2d5871bc6b9mr8117190eec.3.1776109544540;
        Mon, 13 Apr 2026 12:45:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d851e5bb3csm9784135eec.1.2026.04.13.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 12:45:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 13 Apr 2026 16:45:34 -0300
Subject: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMT3cSc4kTd3MyifN2CXF2zZIvUpNRE80QTUwsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA2HEGznAAAAA=
X-Change-ID: 20260404-alsa-miro-pm-6c8ebea7a458
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11003;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=C36cdi/djshwJDRoZ+EGzcag7jwPRv8sQFG2+lNnvdk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl33Z+mr7zAszT6b5CfB39fgk3ti6arotvkrNgPFlis5
 HYWUNnTUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABe5yshwe9PrHdEn9J7HX2d6
 EqB27JYE22/vd78WLd8pcuW4idQVJoZ/Kj9vylsIzp27WHSH0dq8uOuPEg//sPm2TNbHqqfy+oR
 +ZgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd-miro has no PM callbacks, so system resume leaves the OPTi
master-control registers and the board-specific ACI mixer state
unrestored.

Like snd-opti9xx, the driver needs to reprogram the OPTi routing
registers before bringing the codec back. snd-miro also keeps mixer
state in the ACI block, so the codec resume callback alone is not
enough here. Save the ACI mixer state on suspend, reinitialize the
OPTi and ACI state on resume, replay the saved ACI values, and then
resume the WSS codec. Hook the PM handlers into both the ISA and PnP
paths.

Also initialize miro->card on the ISA path for the existing dev_*()
logging and keep the cached solo-mode value aligned with the value
written to hardware.

PCM20 radio tuner state remains outside this driver's PM scope.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/opti9xx/miro.c | 268 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 256 insertions(+), 12 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index c320af3e9a05..e5870e5e07db 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -88,6 +88,25 @@ MODULE_PARM_DESC(isapnp, "Enable ISA PnP detection for specified soundcard.");
 
 #define OPTi9XX_MC_REG(n)	n
 
+enum {
+	MIRO_ACI_MASTER,
+	MIRO_ACI_MIC,
+	MIRO_ACI_LINE,
+	MIRO_ACI_CD,
+	MIRO_ACI_SYNTH,
+	MIRO_ACI_PCM,
+	MIRO_ACI_LINE1,
+	MIRO_ACI_LINE2,
+	MIRO_ACI_EQ1,
+	MIRO_ACI_EQ2,
+	MIRO_ACI_EQ3,
+	MIRO_ACI_EQ4,
+	MIRO_ACI_EQ5,
+	MIRO_ACI_EQ6,
+	MIRO_ACI_EQ7,
+	MIRO_ACI_COUNT,
+};
+
 struct snd_miro {
 	unsigned short hardware;
 	unsigned char password;
@@ -102,6 +121,7 @@ struct snd_miro {
 
 	spinlock_t lock;
 	struct snd_pcm *pcm;
+	struct snd_wss *codec;
 
 	long wss_base;
 	int irq;
@@ -113,6 +133,12 @@ struct snd_miro {
 
 	struct snd_card *card;
 	struct snd_miro_aci *aci;
+#ifdef CONFIG_PM
+	unsigned char aci_saved[MIRO_ACI_COUNT][2];
+	unsigned char aci_saved_amp;
+	unsigned char aci_saved_preamp;
+	unsigned char aci_saved_solomode;
+#endif
 };
 
 static struct snd_miro_aci aci_device;
@@ -664,6 +690,44 @@ static const unsigned char aci_init_values[][2] = {
 	{ ACI_SET_MASTER + 1, 0x20 },
 };
 
+#ifdef CONFIG_PM
+static const unsigned char snd_miro_saved_get_regs[MIRO_ACI_COUNT] = {
+	[MIRO_ACI_MASTER] = ACI_GET_MASTER,
+	[MIRO_ACI_MIC] = ACI_GET_MIC,
+	[MIRO_ACI_LINE] = ACI_GET_LINE,
+	[MIRO_ACI_CD] = ACI_GET_CD,
+	[MIRO_ACI_SYNTH] = ACI_GET_SYNTH,
+	[MIRO_ACI_PCM] = ACI_GET_PCM,
+	[MIRO_ACI_LINE1] = ACI_GET_LINE1,
+	[MIRO_ACI_LINE2] = ACI_GET_LINE2,
+	[MIRO_ACI_EQ1] = ACI_GET_EQ1,
+	[MIRO_ACI_EQ2] = ACI_GET_EQ2,
+	[MIRO_ACI_EQ3] = ACI_GET_EQ3,
+	[MIRO_ACI_EQ4] = ACI_GET_EQ4,
+	[MIRO_ACI_EQ5] = ACI_GET_EQ5,
+	[MIRO_ACI_EQ6] = ACI_GET_EQ6,
+	[MIRO_ACI_EQ7] = ACI_GET_EQ7,
+};
+
+static const unsigned char snd_miro_saved_set_regs[MIRO_ACI_COUNT] = {
+	[MIRO_ACI_MASTER] = ACI_SET_MASTER,
+	[MIRO_ACI_MIC] = ACI_SET_MIC,
+	[MIRO_ACI_LINE] = ACI_SET_LINE,
+	[MIRO_ACI_CD] = ACI_SET_CD,
+	[MIRO_ACI_SYNTH] = ACI_SET_SYNTH,
+	[MIRO_ACI_PCM] = ACI_SET_PCM,
+	[MIRO_ACI_LINE1] = ACI_SET_LINE1,
+	[MIRO_ACI_LINE2] = ACI_SET_LINE2,
+	[MIRO_ACI_EQ1] = ACI_SET_EQ1,
+	[MIRO_ACI_EQ2] = ACI_SET_EQ2,
+	[MIRO_ACI_EQ3] = ACI_SET_EQ3,
+	[MIRO_ACI_EQ4] = ACI_SET_EQ4,
+	[MIRO_ACI_EQ5] = ACI_SET_EQ5,
+	[MIRO_ACI_EQ6] = ACI_SET_EQ6,
+	[MIRO_ACI_EQ7] = ACI_SET_EQ7,
+};
+#endif
+
 static int snd_set_aci_init_values(struct snd_miro *miro)
 {
 	int idx, error;
@@ -702,11 +766,116 @@ static int snd_set_aci_init_values(struct snd_miro *miro)
 	}
 	aci->aci_amp = 0;
 	aci->aci_preamp = 0;
-	aci->aci_solomode = 1;
+	aci->aci_solomode = 0;
+
+	return 0;
+}
+
+static int snd_miro_aci_force_known_state(struct snd_miro_aci *aci)
+{
+	int i, err;
+
+	for (i = 0; i < 3; i++) {
+		err = snd_aci_cmd(aci, ACI_ERROR_OP, -1, -1);
+		if (err < 0)
+			return err;
+	}
 
 	return 0;
 }
 
+static int snd_miro_aci_initialize(struct snd_miro_aci *aci)
+{
+	int err;
+
+	err = snd_aci_cmd(aci, ACI_INIT, -1, -1);
+	if (err < 0)
+		return err;
+	err = snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP);
+	if (err < 0)
+		return err;
+
+	return snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP);
+}
+
+#ifdef CONFIG_PM
+static int snd_miro_save_aci_state(struct snd_miro *miro)
+{
+	struct snd_miro_aci *aci = miro->aci;
+	int i, limit, value;
+
+	limit = aci->aci_product == 'C' ? MIRO_ACI_COUNT : MIRO_ACI_LINE2 + 1;
+	for (i = 0; i < limit; i++) {
+		value = aci_getvalue(aci, snd_miro_saved_get_regs[i]);
+		if (value < 0)
+			return value;
+		miro->aci_saved[i][1] = value;
+
+		value = aci_getvalue(aci, snd_miro_saved_get_regs[i] + 1);
+		if (value < 0)
+			return value;
+		miro->aci_saved[i][0] = value;
+	}
+
+	miro->aci_saved_amp = aci->aci_amp;
+	if (aci->aci_version <= 176) {
+		miro->aci_saved_preamp = aci->aci_preamp;
+	} else {
+		value = aci_getvalue(aci, ACI_GET_PREAMP);
+		if (value < 0)
+			return value;
+		miro->aci_saved_preamp = value;
+	}
+
+	value = aci_getvalue(aci, ACI_S_GENERAL);
+	if (value < 0)
+		return value;
+	miro->aci_saved_solomode = !(value & 0x20);
+
+	return 0;
+}
+
+static int snd_miro_restore_aci_state(struct snd_miro *miro)
+{
+	struct snd_miro_aci *aci = miro->aci;
+	int i, limit, err, left_reg;
+
+	err = snd_set_aci_init_values(miro);
+	if (err < 0)
+		return err;
+
+	limit = aci->aci_product == 'C' ? MIRO_ACI_COUNT : MIRO_ACI_LINE2 + 1;
+	for (i = 0; i < limit; i++) {
+		left_reg = snd_miro_saved_set_regs[i] == ACI_SET_MASTER ?
+			snd_miro_saved_set_regs[i] + 1 :
+			snd_miro_saved_set_regs[i] + 8;
+		err = aci_setvalue(aci, left_reg, miro->aci_saved[i][0]);
+		if (err < 0)
+			return err;
+		err = aci_setvalue(aci, snd_miro_saved_set_regs[i],
+				   miro->aci_saved[i][1]);
+		if (err < 0)
+			return err;
+	}
+
+	err = aci_setvalue(aci, ACI_SET_POWERAMP, miro->aci_saved_amp);
+	if (err < 0)
+		return err;
+	err = aci_setvalue(aci, ACI_SET_PREAMP, miro->aci_saved_preamp);
+	if (err < 0)
+		return err;
+	err = aci_setvalue(aci, ACI_SET_SOLOMODE, miro->aci_saved_solomode);
+	if (err < 0)
+		return err;
+
+	aci->aci_amp = miro->aci_saved_amp;
+	aci->aci_preamp = miro->aci_saved_preamp;
+	aci->aci_solomode = miro->aci_saved_solomode;
+
+	return 0;
+}
+#endif
+
 static int snd_miro_mixer(struct snd_card *card,
 			  struct snd_miro *miro)
 {
@@ -1203,7 +1372,7 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 				    struct snd_miro *miro)
 {
 	unsigned char regval;
-	int i;
+	int err;
 	struct snd_miro_aci *aci = &aci_device;
 
 	miro->aci = aci;
@@ -1224,12 +1393,12 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 		return -ENOMEM;
 	}
 
-        /* force ACI into a known state */
-	for (i = 0; i < 3; i++)
-		if (snd_aci_cmd(aci, ACI_ERROR_OP, -1, -1) < 0) {
-			dev_err(card->dev, "can't force aci into known state.\n");
-			return -ENXIO;
-		}
+	/* force ACI into a known state */
+	err = snd_miro_aci_force_known_state(aci);
+	if (err < 0) {
+		dev_err(card->dev, "can't force aci into known state.\n");
+		return -ENXIO;
+	}
 
 	aci->aci_vendor = snd_aci_cmd(aci, ACI_READ_IDCODE, -1, -1);
 	aci->aci_product = snd_aci_cmd(aci, ACI_READ_IDCODE, -1, -1);
@@ -1246,9 +1415,8 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 		return -ENXIO;
 	}
 
-	if (snd_aci_cmd(aci, ACI_INIT, -1, -1) < 0 ||
-	    snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP) < 0 ||
-	    snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP) < 0) {
+	err = snd_miro_aci_initialize(aci);
+	if (err < 0) {
 		dev_err(card->dev, "can't initialize aci.\n");
 		return -ENXIO;
 	}
@@ -1299,6 +1467,7 @@ static int snd_miro_probe(struct snd_card *card)
 			       WSS_HW_DETECT, 0, &codec);
 	if (error < 0)
 		return error;
+	miro->codec = codec;
 
 	error = snd_wss_pcm(codec, 0);
 	if (error < 0)
@@ -1408,6 +1577,7 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 		return error;
 
 	miro = card->private_data;
+	miro->card = card;
 
 	error = snd_card_miro_detect(card, miro);
 	if (error < 0) {
@@ -1470,12 +1640,69 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_miro_suspend(struct snd_card *card)
+{
+	struct snd_miro *miro = card->private_data;
+	int error;
+
+	error = snd_miro_save_aci_state(miro);
+	if (error < 0)
+		return error;
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	miro->codec->suspend(miro->codec);
+	return 0;
+}
+
+static int snd_miro_resume(struct snd_card *card)
+{
+	struct snd_miro *miro = card->private_data;
+	int error;
+
+	error = snd_miro_configure(miro);
+	if (error < 0)
+		return error;
+	error = snd_miro_aci_force_known_state(miro->aci);
+	if (error < 0) {
+		dev_err(card->dev, "can't force aci into known state\n");
+		return error;
+	}
+	error = snd_miro_aci_initialize(miro->aci);
+	if (error < 0) {
+		dev_err(card->dev, "can't initialize aci\n");
+		return error;
+	}
+	error = snd_miro_restore_aci_state(miro);
+	if (error < 0)
+		return error;
+
+	miro->codec->resume(miro->codec);
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+
+static int snd_miro_isa_suspend(struct device *dev, unsigned int n,
+				pm_message_t state)
+{
+	return snd_miro_suspend(dev_get_drvdata(dev));
+}
+
+static int snd_miro_isa_resume(struct device *dev, unsigned int n)
+{
+	return snd_miro_resume(dev_get_drvdata(dev));
+}
+#endif
+
 #define DEV_NAME "miro"
 
 static struct isa_driver snd_miro_driver = {
 	.match		= snd_miro_isa_match,
 	.probe		= snd_miro_isa_probe,
-	/* FIXME: suspend/resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_miro_isa_suspend,
+	.resume		= snd_miro_isa_resume,
+#endif
 	.driver		= {
 		.name	= DEV_NAME
 	},
@@ -1591,12 +1818,29 @@ static void snd_miro_pnp_remove(struct pnp_card_link *pcard)
 	snd_miro_pnp_is_probed = 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_miro_pnp_suspend(struct pnp_card_link *pcard,
+				pm_message_t state)
+{
+	return snd_miro_suspend(pnp_get_card_drvdata(pcard));
+}
+
+static int snd_miro_pnp_resume(struct pnp_card_link *pcard)
+{
+	return snd_miro_resume(pnp_get_card_drvdata(pcard));
+}
+#endif
+
 static struct pnp_card_driver miro_pnpc_driver = {
 	.flags		= PNP_DRIVER_RES_DISABLE,
 	.name		= "miro",
 	.id_table	= snd_miro_pnpids,
 	.probe		= snd_miro_pnp_probe,
 	.remove		= snd_miro_pnp_remove,
+#ifdef CONFIG_PM
+	.suspend	= snd_miro_pnp_suspend,
+	.resume		= snd_miro_pnp_resume,
+#endif
 };
 #endif
 

---
base-commit: 3abf0a99c3487e1ad259464dbbcec94e58608748
change-id: 20260404-alsa-miro-pm-6c8ebea7a458

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

