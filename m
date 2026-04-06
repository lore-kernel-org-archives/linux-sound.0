Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9234EF0C
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445622; cv=none; b=EPptgocKvc8+orCtKhktAr+UEvdlGwVQw+iDFXC+B98j+b3x/c/ePTO1BT8J/Z9AZT52f+k14arg9bGT0L0SOmQ6Spk2BkUUtFt10KGx1ITzuqhkcw23gejP5/QmC+0HfF+bAbw24vR9UshSoozgHowntsAGmA5RaKRj6DfVuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445622; c=relaxed/simple;
	bh=RguDGz8h/rrrWD2cTbBLxH+mDSZzcOeQwZ54p3UGGQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=merEkJ9OeZxO7mUGdKLAp9G7FXYrdbm9Pzv1DvyllO3BF80ILa+theJmobWGDveqO26X60avMQToVGbmz+ReV0ou3v933PQUEFTZug17V5nOE3h4rrD6R5NzPbwSY2dwDwpfFRm7o491WTFqOXy9sL40MxUmzC5J0WBghHeZRJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdUTEm71; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdUTEm71"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-950bcf4df06so998066241.2
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775445620; x=1776050420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaXOUdfTDOzAAAnykF1sMhRPk4OSoZf3KJ6n7qQxtHs=;
        b=HdUTEm71euvRfYS4+qYSwhzoDrhiEiFK0Swr8Dpf0tkXjn7ZJIo0IFGrofZyykbh2u
         tAZfwuTeNB2RFLhHAe1PGgqhuQZb6Vat6O4ymHRnQQJagtX8Zbx+Ix5dyS60cpSnPoNZ
         xAH7ZDkHlHM2QuE5IvsDzXZPng/vrg/LBkhOHCmPM59pEfFoqdiJ6KHA7bmNECv8arhO
         05QW1Pl8IYFekxIa2tVRWJDHgkaTG0G8ATP30bU35dH3ynZ2AJkKU9AtoKV25w4/Kxww
         jFeoH4+kWxY26VNa6IioKpf1Be6sQfO/lILlTfEPGsXEk2ufyCklNanl9dWnAg3xWjES
         hEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775445620; x=1776050420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaXOUdfTDOzAAAnykF1sMhRPk4OSoZf3KJ6n7qQxtHs=;
        b=YkA8TrJrFWVvy5l1eGkAX6+NBDynFZuMROJ5cF5cu+nazpwcEqR9XrozXMY2TMxFjY
         ssWF4KSfgADtV+8FlbQVOAk7FcVtnL8PfTXJCT81S76xPpdXIwVvlyvu0EP93TwPbW2o
         SnQ0SoHg7DTVaSKjie1HB3QtYtBRPhis3J8FnCqhA5WX/g53MfAuKR8qqZw+a/Vvf6Ac
         jnFQ0VTBq6xGUTJUJN8v5tDWUQrWZZ7MOCL++cdXw8Z3/kt1YUuNtGKIBatmRuYbifdQ
         pF6l1XcQJZnpKy7EYMuMC5m+LxtynDR8NEF17SffmldY0GbRv1ifL40bVaXSbVo9m0HE
         f/OQ==
X-Gm-Message-State: AOJu0YxevWv5GcKmVOIlE2fehCCbIlRe7fxMU0pgwGKQv3be9RR9y4bg
	40hSFOPmB8OhqbTFklCo3PQuUKrUOETh+44eimFzqgCy2cmKLGrdxAyT
X-Gm-Gg: AeBDiesx6yeHfY8a3a8hTmFrXsIKXyP0nlbrb+kkczsbJ/CRMIuibSt5W5Qv+S67e3n
	yWvNE8k4XmuVfrTft+3VxlcYGYHH088N3WP8VibTS+8ZxT0OZwaKEMgCM2jg1OtjWvoNb9zOivn
	ZzwKYbKzvrFnxp3M0hxo3lgX0CzIxiF7zZha56VEaRTIbaLRLLuXlwhQCUZ2yiQO6eB1NVk9sqE
	bGjADDfg1WkPW5imDgRL0101WA2oxaMRsw1vYiadotSAxKDV+VBFrDFOsUpGjULgLLvXdQViUDN
	UomFkiNKY7VbXQdFPwnUiD8P408XgfPWZPojQ6uGqsuJqCYENxT1h/Vq+lxPlE/HLhCVMFDDVW6
	5NXscg1aW2zzaKYQQdXqJ2mQzzhWfzxUxOpmmRae3RgVLSO6jyoTxkXwR4f2GxfOna6PCkeg07V
	GGoapR7pm0bmqb538t7BfMMBrerTC1siBSKNSbhkFlQrlJor6ZYnsqAL24BFTW+BrQjAYYhJfie
	n47
X-Received: by 2002:a05:6102:f89:b0:602:a9f3:74d7 with SMTP id ada2fe7eead31-605a4dbe20cmr3734393137.13.1775445620148;
        Sun, 05 Apr 2026 20:20:20 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm9162146137.5.2026.04.05.20.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:20:19 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 00:20:05 -0300
Subject: [PATCH 3/4] ALSA: gusextreme: add ISA suspend and resume callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-b4-alsa-gus-isa-pm-v1-3-b6829a7457cd@gmail.com>
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
In-Reply-To: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=RguDGz8h/rrrWD2cTbBLxH+mDSZzcOeQwZ54p3UGGQg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmX1bKXPfsoe9Rq2+HN/7lqXXTDtv/N6pEVv3exqe/yz
 v+MywwedJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEhDIYGfZucXzkm3tBRH2W
 +p9DwnpXK6al2mgIGG4V6HD+3hcZoMjIMJutsSTWTtV6eXiH5YFE5bU5ExY/9M4tjHHbfG/BwjU
 XWAE=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

gusextreme still leaves its ISA PM callbacks disabled because the shared
GF1 core had no suspend and resume path suitable for PM recovery.

Resume on this board needs one extra step before the shared GF1 path can
touch the chip again: the ES1688 side must restore the GF1 routing. Split
that routing sequence into a helper, reuse it for probe and resume, reset
the ES1688 side first on resume, and then wire the driver up to the shared
GUS PM helpers.

This restores usable post-resume GF1 operation on GUS Extreme without
rerunning probe-only detection in the shared GF1 path.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/gus/gusextreme.c | 57 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index ed921b89b00a..0984731740c4 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -44,6 +44,11 @@ static int joystick_dac[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 29};
 static int channels[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 24};
 static int pcm_channels[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
 
+struct snd_gusextreme {
+	struct snd_es1688 es1688;
+	struct snd_gus_card *gus;
+};
+
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for " CRD_NAME " soundcard.");
 module_param_array(id, charp, NULL, 0444);
@@ -142,17 +147,15 @@ static int snd_gusextreme_gus_card_create(struct snd_card *card,
 			0, channels[n], pcm_channels[n], 0, rgus);
 }
 
-static int snd_gusextreme_detect(struct snd_gus_card *gus,
-				 struct snd_es1688 *es1688)
+static void snd_gusextreme_enable_gf1(struct snd_gus_card *gus,
+				      struct snd_es1688 *es1688)
 {
-	unsigned char d;
-
 	/*
 	 * This is main stuff - enable access to GF1 chip...
 	 * I'm not sure, if this will work for card which have
 	 * ES1688 chip in another place than 0x220.
-         *
-         * I used reverse-engineering in DOSEMU. [--jk]
+	 *
+	 * I used reverse-engineering in DOSEMU. [--jk]
 	 *
 	 * ULTRINIT.EXE:
 	 * 0x230 = 0,2,3
@@ -172,7 +175,14 @@ static int snd_gusextreme_detect(struct snd_gus_card *gus,
 		outb(0, 0x201);
 		outb(gus->gf1.port & 0x010 ? 3 : 1, ES1688P(es1688, INIT1));
 	}
+}
+
+static int snd_gusextreme_detect(struct snd_gus_card *gus,
+				 struct snd_es1688 *es1688)
+{
+	unsigned char d;
 
+	snd_gusextreme_enable_gf1(gus, es1688);
 	udelay(100);
 
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
@@ -223,16 +233,18 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 {
 	struct snd_card *card;
 	struct snd_gus_card *gus;
+	struct snd_gusextreme *gusextreme;
 	struct snd_es1688 *es1688;
 	struct snd_opl3 *opl3;
 	int error;
 
 	error = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE,
-				  sizeof(struct snd_es1688), &card);
+				  sizeof(*gusextreme), &card);
 	if (error < 0)
 		return error;
 
-	es1688 = card->private_data;
+	gusextreme = card->private_data;
+	es1688 = &gusextreme->es1688;
 
 	if (mpu_port[n] == SNDRV_AUTO_PORT)
 		mpu_port[n] = 0;
@@ -250,6 +262,7 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 	error = snd_gusextreme_gus_card_create(card, dev, n, &gus);
 	if (error < 0)
 		return error;
+	gusextreme->gus = gus;
 
 	error = snd_gusextreme_detect(gus, es1688);
 	if (error < 0)
@@ -321,10 +334,36 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_gusextreme_suspend(struct device *dev, unsigned int n,
+				  pm_message_t state)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct snd_gusextreme *gusextreme = card->private_data;
+
+	return snd_gus_suspend(gusextreme->gus);
+}
+
+static int snd_gusextreme_resume(struct device *dev, unsigned int n)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct snd_gusextreme *gusextreme = card->private_data;
+	int err;
+
+	err = snd_es1688_reset(&gusextreme->es1688);
+	if (err < 0)
+		return err;
+
+	snd_gusextreme_enable_gf1(gusextreme->gus, &gusextreme->es1688);
+	usleep_range(100, 200);
+	return snd_gus_resume(gusextreme->gus);
+}
+#endif
+
 static struct isa_driver snd_gusextreme_driver = {
 	.match		= snd_gusextreme_match,
 	.probe		= snd_gusextreme_probe,
-#if 0	/* FIXME */
+#ifdef CONFIG_PM
 	.suspend	= snd_gusextreme_suspend,
 	.resume		= snd_gusextreme_resume,
 #endif

-- 
2.53.0

