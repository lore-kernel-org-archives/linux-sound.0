Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01F3B3C0A
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095952; cv=none; b=TCaFbf6zPAoxP/djPhT+Ii5CLEdCHEFjiVzbuLXoeBlD2AfZE9vjiRZSa59Flzkgr0IgwaBjWBCjQHONdHR/eABxoA571PwHNsw3GzxrPUoaQHOXgIQ9rDcj4S0R/lE9rln/LsJkzzRh06yJFc1KAcSYuS8PR3VzKGVgchRWmDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095952; c=relaxed/simple;
	bh=aX1Ge3b6X4pMuxGtErm8H2BEydPy/Y+VYmMgcIUVsGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XC4WfumYXA/0lvCGfGA8yz7clt5QLIC3gdxZt9ZEmCbeGtOfIBLAOUfbqpycRMdHVa6KqMp4KWpiSU3ZOadzjmn8DVAZuAGHCqffKjxCOJIcLbszoWX828azld+Hrs9cpFwtP7UVl2Acgp0uhXOe55d/kGj9XXfqAw7N/JCslfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgLSo09V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgLSo09V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1027505f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095949; x=1779700749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIxQ+Yspo/kff7nqH7vPza1AWSJyB0L37cRLebW+FyM=;
        b=JgLSo09VRmzCEBHxtjHrk5tyEhRBh9ChqLVdY83SY0dXMZxFC/hLd5ctxqFoz23RoZ
         Ft0Wuav2WiSwmz/gao4f5sYJFOU0MnU1fqry0sBm+R7EwBRCryFuHhit94zINRrRd3jN
         CvGfG6vy188PzE6KHoenW6/9rYfsHLLj5nmUr1QAQiXz1V7HUqyUd7fuw7A4PpbwNL3t
         vrIwm1HbtzDhrQox5wGLhmUJoC8SjEdAlh4iKwYopd3UD3/R6k3m3KXevA6uP3qwjuVf
         MltZ1Ok/BfRPm/cjC+xlb1OvF93qB059OIGcSZSn9sw9g8ZgbztNK7VwfAvWKfOaCDyv
         bRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095949; x=1779700749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIxQ+Yspo/kff7nqH7vPza1AWSJyB0L37cRLebW+FyM=;
        b=IEbzePHE7iWsuxfS0WyMWAXx8PMR2oPhIecjM3/BgSwfX9WVvBy11f0GahhcsjGdB6
         Eawx++nPUSj9KU6Xh9zPysFjclK2qQWi4qY3KJtblhNLEmenDcGkustl2Wjj40AAjNIb
         ZbNLMawUujNDycRUreNIf0aC+axS9EFB2Z5EGHYij1fdMu4XxZFaakX5DneO+Wi8mWmh
         Gzh7uJrT6dyaDyMxXjqAjltP79CsCR3CkGXlJ60sBRlSDOJLx7OjJsezwB+PW1E9FSL4
         HkcHLajE5GPl5QXSmEfKVegPO8tIeGmxFZIh9QCWs1KgZfC/plm41ojtC+y2M8Q7Pl3/
         2Kmg==
X-Forwarded-Encrypted: i=1; AFNElJ/3qMdjgGmZfKrxd7Aqb9MHhz7b/qR3N5PXNNXFe3e6Ddh1XS2Rqw1/86q177918xX6YB7LFhkEWfpn8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5xxejPD68neY8NZIWprUkMC2G12ANFXtLj+B5wo4+2sVigBL
	8j1P/39Whx3Uf9wxmgfKqKYa/CUXSGKmFvCVHNrwnHpI8kmeTQFQLqIN
X-Gm-Gg: Acq92OHORFay4mBDHLWCA9nvc0+q4W6gA2p2YshldafXywoG14NRC22PdX/gZrUL/Li
	IPNY52WalWWqOUmNhS+WIvOS6AMwaK2qCTY4nHe3nqhhvBUJ7aB9YF2+hlfagjNymjqDq+9hMPO
	E89e8R8c/4PrmkIa8vorA9naGrHW4+CxTRZNt5NV7cIBvJ491H8cH4MLA30RFJYbf7+wqiUG6or
	2rNGwETE/nEqfimzBWmje82Uu5tCk9U8YARaqi1N76JhU9nkfVwW9FHbVKx0atv5oNogXi8MCg1
	nm3jS8gSfWDyOCfgAhyiOOXcT6iqBBdbUpqATBwcarI3WvgmJj9/V2b4px1GxUUduaGxsfXY++P
	EiZO8YzU9AS+f4PHQcjq7gsYous+QcQdiqlf2E+3Iuy9QBDIKEu8T/prLupQY9QxLlQj7VsNatY
	Ey/B3BBe5CryO3nJEj/w==
X-Received: by 2002:a5d:5f90:0:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-45e5c5be273mr21756208f8f.11.1779095948761;
        Mon, 18 May 2026 02:19:08 -0700 (PDT)
Received: from [0.0.0.0] ([151.67.112.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm37421215f8f.23.2026.05.18.02.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:19:08 -0700 (PDT)
Message-ID: <e8048031-ac1c-43dd-b0ff-733bbffccbf8@gmail.com>
Date: Mon, 18 May 2026 11:19:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte,
 GA-Z170X-Gaming G1
Content-Language: it
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela ` <perex@perex.cz>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <a1dd5dfd-8678-4dd9-b6af-68a1e078168a@gmail.com>
 <87tss7xyj5.wl-tiwai@suse.de>
 <2f45fd6e-0a5b-4f47-9f2b-75d8b323ced8@gmail.com>
 <87h5o5ersn.wl-tiwai@suse.de>
From: "eziogale@gmail.com" <eziogale@gmail.com>
In-Reply-To: <87h5o5ersn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some CA0132 implementations (e.g. Gigabyte GA-Z170X-Gaming G1) produce 
white noise when using the DSP firmware path. Add a QUIRK_GENERIC path 
that uses the standard HDA generic parser instead, with custom pin configs.
This patch applies against v6.18.24.

Signed-off-by: Ezio Galeazzi <eziogale@gmail.com>

---
  sound/hda/codecs/Kconfig  |   1 +
  sound/hda/codecs/ca0132.c | 111 +++++++++++++++++++++++++++++++++-----
  2 files changed, 99 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/Kconfig b/sound/hda/codecs/Kconfig
index addbc94..dcf340e 100644
--- a/sound/hda/codecs/Kconfig
+++ b/sound/hda/codecs/Kconfig
@@ -69,6 +69,7 @@ comment "Set to Y if you want auto-loading the codec 
driver"

  config SND_HDA_CODEC_CA0132
  	tristate "Build Creative CA0132 codec support"
+	select SND_HDA_GENERIC
  	help
  	  Say Y or M here to include Creative CA0132 codec support in
  	  snd-hda-intel driver.
diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index dd054ae..92fc93f 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -24,6 +24,7 @@
  #include "hda_local.h"
  #include "hda_auto_parser.h"
  #include "hda_jack.h"
+#include "generic.h"

  #include "ca0132_regs.h"

@@ -1060,6 +1061,8 @@ enum dsp_download_state {
   */

  struct ca0132_spec {
+	struct hda_gen_spec gen;
+
  	const struct snd_kcontrol_new *mixers[5];
  	unsigned int num_mixers;
  	const struct hda_verb *base_init_verbs;
@@ -1174,6 +1177,7 @@ enum {
  	QUIRK_R3D,
  	QUIRK_AE5,
  	QUIRK_AE7,
+	QUIRK_GENERIC,
  	QUIRK_NONE = HDA_FIXUP_ID_NOT_SET,
  };

@@ -1292,6 +1296,20 @@ static const struct hda_pintbl ae7_pincfgs[] = {
  	{}
  };

+static const struct hda_pintbl ca0132_generic_pincfgs[] = {
+	{ 0x0b, 0x41014111 },
+	{ 0x0c, 0x414520f0 }, /* SPDIF out */
+	{ 0x0d, 0x01014010 }, /* lineout */
+	{ 0x0e, 0x41c501f0 },
+	{ 0x0f, 0x411111f0 }, /* disabled */
+	{ 0x10, 0x411111f0 }, /* disabled */
+	{ 0x11, 0x41012014 },
+	{ 0x12, 0x37a790f0 }, /* mic */
+	{ 0x13, 0x77a701f0 },
+	{ 0x18, 0x500000f0 },
+	{}
+};
+
  static const struct hda_quirk ca0132_quirks[] = {
  	SND_PCI_QUIRK(0x1028, 0x057b, "Alienware M17x R4", 
QUIRK_ALIENWARE_M17XR4),
  	SND_PCI_QUIRK(0x1028, 0x0685, "Alienware 15 2015", QUIRK_ALIENWARE),
@@ -1304,6 +1322,7 @@ static const struct hda_quirk ca0132_quirks[] = {
  	SND_PCI_QUIRK(0x1458, 0xA016, "Recon3Di", QUIRK_R3DI),
  	SND_PCI_QUIRK(0x1458, 0xA026, "Gigabyte G1.Sniper Z97", QUIRK_R3DI),
  	SND_PCI_QUIRK(0x1458, 0xA036, "Gigabyte GA-Z170X-Gaming 7", QUIRK_R3DI),
+	SND_PCI_QUIRK(0x1458, 0xA046, "Gigabyte GA-Z170X-Gaming G1", 
QUIRK_GENERIC),
  	SND_PCI_QUIRK(0x3842, 0x1038, "EVGA X99 Classified", QUIRK_R3DI),
  	SND_PCI_QUIRK(0x3842, 0x104b, "EVGA X299 Dark", QUIRK_R3DI),
  	SND_PCI_QUIRK(0x3842, 0x1055, "EVGA Z390 DARK", QUIRK_R3DI),
@@ -1325,6 +1344,7 @@ static const struct hda_model_fixup 
ca0132_quirk_models[] = {
  	{ .id = QUIRK_R3D, .name = "r3d" },
  	{ .id = QUIRK_AE5, .name = "ae5" },
  	{ .id = QUIRK_AE7, .name = "ae7" },
+	{ .id = QUIRK_GENERIC, .name = "generic" },
  	{}
  };

@@ -9882,14 +9902,57 @@ static void sbz_detect_quirk(struct hda_codec 
*codec)
  	}
  }

+static void ca0132_generic_init_hook(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	snd_hda_sequence_write(codec, spec->spec_init_verbs);
+}
+
+static int ca0132_generic_probe(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+	int err;
+
+	snd_hda_gen_spec_init(&spec->gen);
+
+	snd_hda_apply_pincfgs(codec, ca0132_generic_pincfgs);
+
+	ca0132_init_chip(codec);
+
+	err = ca0132_prepare_verbs(codec);
+	if (err < 0)
+		return err;
+
+	err = snd_hda_parse_pin_def_config(codec, cfg, NULL);
+	if (err < 0)
+		return err;
+	err = snd_hda_gen_parse_auto_config(codec, cfg);
+	if (err < 0)
+		return err;
+
+	spec->gen.init_hook = ca0132_generic_init_hook;
+	spec->gen.automute_speaker = 0;
+	spec->gen.automute_lo = 0;
+
+	snd_hda_sequence_write(codec, spec->spec_init_verbs);
+	return 0;
+}
+
  static void ca0132_codec_remove(struct hda_codec *codec)
  {
  	struct ca0132_spec *spec = codec->spec;

-	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_GENERIC:
+		snd_hda_gen_remove(codec);
+		return;
+	case QUIRK_ZXR_DBPRO:
  		return dbpro_free(codec);
-	else
+	default:
  		return ca0132_free(codec);
+	}
  }

  static int ca0132_codec_probe(struct hda_codec *codec,
@@ -9906,14 +9969,21 @@ static int ca0132_codec_probe(struct hda_codec 
*codec,
  	codec->spec = spec;
  	spec->codec = codec;

-	/* Detect codec quirk */
-	snd_hda_pick_fixup(codec, ca0132_quirk_models, ca0132_quirks, NULL);
-	if (ca0132_quirk(spec) == QUIRK_SBZ)
-		sbz_detect_quirk(codec);
-
+	/* These must be set before any path is taken */
  	codec->pcm_format_first = 1;
  	codec->no_sticky_stream = 1;

+	/* Detect codec quirk */
+	snd_hda_pick_fixup(codec, ca0132_quirk_models, ca0132_quirks, NULL);
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_SBZ:
+		sbz_detect_quirk(codec);
+		break;
+	case QUIRK_GENERIC:
+		return ca0132_generic_probe(codec);
+	default:
+		break;
+	}

  	spec->dsp_state = DSP_DOWNLOAD_INIT;
  	spec->num_mixers = 1;
@@ -10014,36 +10084,51 @@ static int ca0132_codec_build_controls(struct 
hda_codec *codec)
  {
  	struct ca0132_spec *spec = codec->spec;

-	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_GENERIC:
+		return snd_hda_gen_build_controls(codec);
+	case QUIRK_ZXR_DBPRO:
  		return dbpro_build_controls(codec);
-	else
+	default:
  		return ca0132_build_controls(codec);
+	}
  }

  static int ca0132_codec_build_pcms(struct hda_codec *codec)
  {
  	struct ca0132_spec *spec = codec->spec;

-	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_GENERIC:
+		return snd_hda_gen_build_pcms(codec);
+	case QUIRK_ZXR_DBPRO:
  		return dbpro_build_pcms(codec);
-	else
+	default:
  		return ca0132_build_pcms(codec);
+	}
  }

  static int ca0132_codec_init(struct hda_codec *codec)
  {
  	struct ca0132_spec *spec = codec->spec;

-	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_GENERIC:
+		return snd_hda_gen_init(codec);
+	case QUIRK_ZXR_DBPRO:
  		return dbpro_init(codec);
-	else
+	default:
  		return ca0132_init(codec);
+	}
  }

  static int ca0132_codec_suspend(struct hda_codec *codec)
  {
  	struct ca0132_spec *spec = codec->spec;

+	if (ca0132_quirk(spec) == QUIRK_GENERIC)
+		return 0;
+
  	cancel_delayed_work_sync(&spec->unsol_hp_work);
  	return 0;
  }
-- 
2.54.0
