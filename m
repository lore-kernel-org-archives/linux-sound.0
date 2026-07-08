Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A433689D
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783482971; cv=none; b=OexvJyOyuniBjcUOnkdzgUzQjgcmVokHjdsw/04utM0FFaRKVviyPuoDyjuX8QoZBG2HiaABczZUNK7Y31LZpa1UCgbe91Jb2LyLUcgn+0kHZWD2nZ6vkiHLWMTZHPPaYX7wr6qYMC7nrVgXN2kP/AahajAT0em8akYNAb3hzBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783482971; c=relaxed/simple;
	bh=K6vik4guiSTNKrrKW+A1H+E9jEMt1tzaTiFCNr9OWAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCYUFpJiCUzHUcggSddOBMcBhSAVTK8jGFxKl9qtMPvfV+KaqUothUB/+P1raUYNdwp1EDYyNxM/uzeqvgIr/D7yQrkSKd6Vuf1q4p5mxQCF7Y83T1x+YVXIzLI///vaLGs+yi7wmCLrqta7Uv+R4wqLvXxAqohsuGcya0YAiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnWo7UWH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnWo7UWH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc80b585bfso2167445ad.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 20:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783482970; x=1784087770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2calCiUAVla/FHXIpJXp3OjSIoYay+4HlHSrroHSZXU=;
        b=fnWo7UWHgdBcjiIrXI2Bd3LhfHy3c8+Rg+gCFQVRfoj2kMD0Ncg0Qbhh5+9C5s6rcH
         vIUV4av4yBntddGfWpQBQxvI1P/TvulM6y7eFE0Sf/gdmsGD2oNwWGOCTl9q+ti6vxoK
         0pu6E8Ujy7fuaQ3SR1DOm2FxGeU9YQ6WC3MlT7Ao3PZQA20gjyvZF1Ft5gFAsiLnPFPJ
         qw0nWfpUIZBk98HaHq0573ROmjhrLKb/xHEhk+kOgvGjy/mARunWmV9vgLpsDIogDfTc
         fW60ikI8IVdK6ZOpiWXz6uC/n54D2x6ZAHQQfeuiioisr0U+QsXWejiFtQMxqBA+s111
         xdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783482970; x=1784087770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2calCiUAVla/FHXIpJXp3OjSIoYay+4HlHSrroHSZXU=;
        b=YwcQTRHuCL1iyp+PXcOPvHpCUOER2SqCynsufxubRHa9jrZCl/qDJeCFWzxJhfny9K
         9J8vA/pH7SSPb62Pgs65yoT8vCuOH/7hU2rhBejFM5jEbhmR99DTI1irO8ph6zOBiBJG
         Y86wjkfujkD6GoftAXZXw96GodcnCuq+rvX+a/9pEP/y7BbpkHGmhOYytVL6l2Ge4Frz
         tdDBLJxcQGR6Cfdqd8LeItaUkFphbPmyHFl1/tguADpNaLl8RHvpW5tewl20/zTlxkdc
         Zm0M1Bc3+6yfcyU0kWkWV4PbNRBbMK0NGD2KqHUae0X0p3rLyNWG18SSRwN6B/EGXotN
         Pgmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqek+cFCSrEv29Vf4JwSS0t/IRCjNKo17xU7/loyUI0/lLFjA04uG+Q6yH+jBCQdf6XnkSmuItI9fnugA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvuPWc/79CVDN26mJQ2cFwwqz+rrDv75NAaeMRwCmyVaJ2GsEK
	a9du7vC37aVYlorMXLomnkgiMRtwDMcHFqsR3XIqcHWL4kcLSE7J0q6OOyaAdd+W
X-Gm-Gg: AfdE7cl+x50q52zfofI6gYo6WN2oIMEdveZ17pIUmhNbhwkzX5p8ibg8yhBCIqXeHaz
	xspvM0DJDuhZir8SAoSkerDB2yptt+M190wi6pkf49YWQe6kCtUchUDG9bPfXKQ0rpCEHeBErZc
	8NzyDtSdIcqchGbeRhVFJNtWTBcM526K37x9nqQcbUE6ADDOuOds3nXwEUMmcbMa0/C6lnaQaLI
	rZnhBBuDY3e3PSS8QWo/8ogKzg8kwYT5r4uGqRnhn4GpGFnXbx+dbe+WspjAXCPSZuuRqqphnmK
	8tsbqxNeDAdCC3V7bFqn0ktQr9cVRrzLGcJGOlPL7mMkd/xc2Uqut78Qh4J8KmBXPsOSse0JOg4
	QQ/iAZMOm953+8Mzea0LOGPzOxV76lR9W/Axq47HPrQos5dCw/ZIgYFkpxI7irdK9LytVmrmacm
	j8879ppO2tLXKmWCx79PgfHljxIsUCS/jnychbPpnmZ6Rxcz6arVisPFy4tBM=
X-Received: by 2002:a17:903:120d:b0:2cc:864b:539 with SMTP id d9443c01a7336-2ccea37df87mr8583805ad.6.1783482969706;
        Tue, 07 Jul 2026 20:56:09 -0700 (PDT)
Received: from smtp.gmail.com (220-128-132-142.hinet-ip.hinet.net. [220.128.132.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c25fccsm20582945ad.35.2026.07.07.20.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:56:09 -0700 (PDT)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] [PATCH v1] ALSA: hda/cm9825: Add IBP support for DFI
Date: Wed,  8 Jul 2026 11:55:52 +0800
Message-ID: <20260708035552.44429-1-antivirus621@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IBP project is an DFI platform with a fixed audio
configuration consisting of headset(headphone and mic-in).
The audio routing and pin assignments are defined according to
the board-level hardware design and are not intended to be
dynamically changed.

Signed-off-by: Leo Tsai <antivirus621@gmail.com>
---
 sound/hda/codecs/cm9825.c | 148 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 142 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index eeb9ca38d2d8..8a74862d8a81 100644
--- a/sound/hda/codecs/cm9825.c
+++ b/sound/hda/codecs/cm9825.c
@@ -15,7 +15,8 @@
 
 enum {
 	QUIRK_CM_STD = 0x0,
-	QUIRK_GENE_TWL7_SSID = 0x160dc000
+	QUIRK_GENE_TWL7_SSID = 0x160dc000,
+	QUIRK_IBP_SSID = 0x15bd3275
 };
 
 /* CM9825 Offset Definitions */
@@ -40,13 +41,19 @@ enum {
 #define CM9825_VERB_SET_GAD 0x7b4
 #define CM9825_VERB_SET_TMOD 0x7b5
 #define CM9825_VERB_SET_SNR 0x7b6
+#define CM9825_VERB_SET_OMTP 0x7ef
+#define CM9825_VERB_READ_OMTP 0xfec
 
 struct cmi_spec {
 	struct hda_gen_spec gen;
 	const struct hda_verb *chip_d0_verbs;
 	const struct hda_verb *chip_d3_verbs;
+	const struct hda_verb *chip_playback_start_verbs;
+	const struct hda_verb *chip_playback_stop_verbs;
 	const struct hda_verb *chip_hp_present_verbs;
 	const struct hda_verb *chip_hp_remove_verbs;
+	const struct hda_verb *chip_lineout_present_verbs;
+	const struct hda_verb *chip_lineout_remove_verbs;
 	struct hda_codec *codec;
 	struct delayed_work unsol_inputs_work;
 	struct delayed_work unsol_lineout_work;
@@ -193,6 +200,94 @@ static const struct hda_verb cm9825_gene_twl7_playback_stop_verbs[] = {
 	{}
 };
 
+/*
+ * To save power, AD/CLK is turned off.
+ */
+static const struct hda_verb cm9825_ibp_d3_verbs[] = {
+	{0x43, CM9825_VERB_SET_D2S, 0x62},
+	{0x43, CM9825_VERB_SET_PLL, 0x01},
+	{0x43, CM9825_VERB_SET_NEG, 0xc2},
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},
+	{0x43, CM9825_VERB_SET_DACL, 0x02},
+	{0x43, CM9825_VERB_SET_VNEG, 0x50},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},
+	{0x43, CM9825_VERB_SET_PDNEG, 0x04},
+	{0x43, CM9825_VERB_SET_CDALR, 0xf6},
+	{0x43, CM9825_VERB_SET_OTP, 0xcd},
+	{}
+};
+
+/*
+ * D0 configuration: enable PLL/CLK/ADC/DAC and optimize performance
+ */
+static const struct hda_verb cm9825_ibp_d0_verbs[] = {
+	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},
+	{0x43, CM9825_VERB_SET_SNR, 0x38},
+	{0x43, CM9825_VERB_SET_PLL, 0x00},
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},
+	{0x43, CM9825_VERB_SET_DACL, 0x02},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},
+	{0x43, CM9825_VERB_SET_VNEG, 0x56},
+	{0x43, CM9825_VERB_SET_D2S, 0x62},
+	{0x43, CM9825_VERB_SET_DACTRL, 0x00},
+	{0x43, CM9825_VERB_SET_PDNEG, 0x0c},
+	{0x43, CM9825_VERB_SET_CDALR, 0xf4},
+	{0x43, CM9825_VERB_SET_OTP, 0xcd},
+	{0x43, CM9825_VERB_SET_MTCBA, 0x61},
+	{0x43, CM9825_VERB_SET_OCP, 0x33},
+	{0x43, CM9825_VERB_SET_GAD, 0x07},
+	{0x43, CM9825_VERB_SET_TMOD, 0x26},
+	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0xa0, 0x2d},
+	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0x90, 0x2d},
+	{0x43, CM9825_VERB_SET_HPF_1, 0x40},
+	{0x43, CM9825_VERB_SET_HPF_2, 0x40},
+	{}
+};
+
+/*
+ * Enable mbias, ADC.
+ */
+static const struct hda_verb cm9825_ibp_lineout_present_verbs[] = {
+	{0x43, CM9825_VERB_SET_ADCL, 0x8c},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x10},
+	{}
+};
+
+/*
+ * Disable mbias, ADC.
+ */
+static const struct hda_verb cm9825_ibp_lineout_remove_verbs[] = {
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},
+	{}
+};
+
+/*
+ * Turn on the DAC (widget NID 0x43) in the playback path by writing
+ * a sequence of vendor-specific verbs.
+ */
+static const struct hda_verb cm9825_ibp_playback_start_verbs[] = {
+	{0x43, CM9825_VERB_SET_DACL, 0xaa},
+	{0x43, CM9825_VERB_SET_D2S, 0xf2},
+	{0x43, CM9825_VERB_SET_VDO, 0xc4},
+	{0x43, CM9825_VERB_SET_SNR, 0x30},
+	{}
+};
+
+/*
+ * Shut down the playback path. The order differs slightly from the
+ * enable sequence, likely to avoid audible pop noise when powering
+ * down the output stage.
+ */
+static const struct hda_verb cm9825_ibp_playback_stop_verbs[] = {
+	{0x43, CM9825_VERB_SET_VDO, 0xc0},
+	{0x43, CM9825_VERB_SET_DACL, 0x02},
+	{0x43, CM9825_VERB_SET_D2S, 0x62},
+	{0x43, CM9825_VERB_SET_VDO, 0x80},
+	{0x43, CM9825_VERB_SET_SNR, 0x38},
+	{}
+};
+
 static void cm9825_update_jk_plug_status(struct hda_codec *codec, hda_nid_t nid)
 {
 	struct cmi_spec *spec = codec->spec;
@@ -232,6 +327,23 @@ static void cm9825_unsol_lineout_delayed(struct work_struct *work)
 	struct cmi_spec *spec =
 	    container_of(to_delayed_work(work), struct cmi_spec,
 			 unsol_lineout_work);
+	hda_nid_t line_out_pin = spec->gen.autocfg.line_out_pins[0];
+	bool line_out_jack_plugin = false;
+
+	line_out_jack_plugin = snd_hda_jack_detect(spec->codec, line_out_pin);
+
+	codec_dbg(spec->codec, "lineout_jack_plugin %d, lineout_pin 0x%X\n",
+		  (int)line_out_jack_plugin, line_out_pin);
+
+	if (!line_out_jack_plugin) {
+		/* Jack plugout */
+		snd_hda_sequence_write(spec->codec,
+				       spec->chip_lineout_remove_verbs);
+	} else {
+		/* Jack plugin */
+		snd_hda_sequence_write(spec->codec,
+				       spec->chip_lineout_present_verbs);
+	}
 
 	cm9825_update_jk_plug_status(spec->codec,
 				     spec->gen.autocfg.line_out_pins[0]);
@@ -362,12 +474,10 @@ static void cm9825_playback_pcm_hook(struct hda_pcm_stream *hinfo,
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_PREPARE:
-		snd_hda_sequence_write(spec->codec,
-				       cm9825_gene_twl7_playback_start_verbs);
+		snd_hda_sequence_write(codec, spec->chip_playback_start_verbs);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
-		snd_hda_sequence_write(spec->codec,
-				       cm9825_gene_twl7_playback_stop_verbs);
+		snd_hda_sequence_write(codec, spec->chip_playback_stop_verbs);
 		break;
 	default:
 		return;
@@ -471,7 +581,8 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	if (codec->core.subsystem_id == QUIRK_CM_STD)
 		cm9825_cm_std_resume(codec);
-	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
+	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID ||
+		 codec->core.subsystem_id == QUIRK_IBP_SSID) {
 		snd_hda_codec_init(codec);
 		snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 	}
@@ -487,6 +598,7 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	struct cmi_spec *spec;
 	struct auto_pin_cfg *cfg;
 	int err = 0;
+	unsigned int val;
 
 	spec = kzalloc_obj(*spec);
 	if (spec == NULL)
@@ -523,9 +635,33 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
 		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
 		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
+		spec->chip_playback_start_verbs =
+		    cm9825_gene_twl7_playback_start_verbs;
+		spec->chip_playback_stop_verbs =
+		    cm9825_gene_twl7_playback_stop_verbs;
 		/* Internal fixed device, Rear, Mic-in, 3.5mm */
 		snd_hda_codec_set_pincfg(codec, 0x37, 0x24A70100);
 		break;
+	case QUIRK_IBP_SSID:
+		snd_hda_codec_set_name(codec, "CM9825 IBP");
+		spec->chip_d0_verbs = cm9825_ibp_d0_verbs;
+		spec->chip_d3_verbs = cm9825_ibp_d3_verbs;
+		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
+		spec->chip_lineout_present_verbs =
+		    cm9825_ibp_lineout_present_verbs;
+		spec->chip_lineout_remove_verbs =
+		    cm9825_ibp_lineout_remove_verbs;
+		spec->chip_playback_start_verbs =
+		    cm9825_ibp_playback_start_verbs;
+		spec->chip_playback_stop_verbs = cm9825_ibp_playback_stop_verbs;
+
+		/* OMTP */
+		val =
+		    snd_hda_codec_read(codec, 0x46, 0, CM9825_VERB_READ_OMTP,
+				       0x0);
+		snd_hda_codec_write(codec, 0x46, 0, CM9825_VERB_SET_OMTP,
+				    (val >> 24) & 0x7f);
+		break;
 	default:
 		err = -ENXIO;
 		break;
-- 
2.43.0

