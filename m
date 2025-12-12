Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD83B2A0
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531937; cv=none; b=CU9naqHKIV1RKHLCV9fPrxdHGvTCrPEvrLKOcnsaxfC7YWQjET+99ojJ7c4jqizry0WI4AX9eU6kKtPVhUncaeVoXgu7AC0/fVMaJdBGIqgmfmSZtEihvAKfMmJh9mqwsW2lBQgt1+kiqAeCBTQ2WKcBHBgPH2706SiWKgpvz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531937; c=relaxed/simple;
	bh=F2kGpPjTjl+ds78GJkb6r8krPQKstADgSoF/b8xKuzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7/1FVj/7UpXPiKfC4zV1Yj9tvYkr2NCOGFmvRLTSYSQE/y489dmMAoG2fjOyjFc3yfoVeVUeVTR5dES6hL6tR2D7xtJeWhoYGeNnVmFa9j3xmSC8l1+m4AlficQ6NtWOL1c+gwFc/Taw4JmrhYXW13w2hxUd3+4v2ng6KrLMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfW2z6uC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfW2z6uC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29586626fbeso13413955ad.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 01:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765531935; x=1766136735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+y7eN0J2T6Ss4EZrn0oVR9n8YFCSQO6NxtkJ2iN8TDE=;
        b=gfW2z6uCU6AUv1LEHbfN9vF+HgU6NA4mBU+83dgTJS1zVH1SvkMV1K5nVKIz83BBlJ
         Zt8v/erz5R0x7sL1M7jVYPI0B7hKSywcc8cKE7cOsOhQ0bUUuW99ecGe7tL5egr9wIjz
         oBmcOpFvdoqE9AWK7faYtwNvP0xYul6BLGL+QNhnggRGXykoVBRB1TkAFDMKRGZNuh2R
         VnIhMPUmFwF9W6olvVtenox8y2t8AjOaLbjjNqh6n1rSdo7TgcC5WGiV6Nk9SbbKLHh/
         lmYfLb0DITyLd1rIiiqV2bAVtYkr7U92B+yBV2onOTg9OvD75jMzR1Bk43Fn9NKpVWJ1
         zwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531935; x=1766136735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y7eN0J2T6Ss4EZrn0oVR9n8YFCSQO6NxtkJ2iN8TDE=;
        b=RHnTKsJaJr++0ztryDc2CqB0uJFtRxtlKrtGyavw36iRT8p9ymBN4tEJ2SZQDbm7+d
         jn0fkzRZcwmDzBRBaTg181b38+gx33HJn1lYjxU5ipH0BsFhPxptNYdxLCv7gp952pS7
         V4f1z0vx9FdaxFV741vamVsyyOdDQiofUjUAyeXFQf2DFZM0sWZR4zBvTSSozVDGtYj4
         Rzvu6zxliJ2ImKCZYmZVKmfRmqJ61jYPZay9VohK3VtKqAoVFaw81DcXeYaiiS1YoXkb
         rtPrEk13FQwID3ZNksc6Zsj9h6z7twGBT66fA0v+XAAsEXeIQzSkdmpSY28e6PQIdkrq
         Sx/g==
X-Forwarded-Encrypted: i=1; AJvYcCV1XNAccKyn+5otIzPSDFBeSt4Ma6m0V4v8eIWKjlb1l8a7p6HiQuv7VApDiB+czs8/1wSKliUFnaosug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsJS+pZWt4qt1PpJoyQ3eW8deKPOfcfhrJjRBJddvY3lgl46r
	AYDdKJWAI250eG15UDZUwuJUhFuMhxSNCrreEVF2Uk5MUaj0yCyeE757
X-Gm-Gg: AY/fxX4+I8c3U8F0C6yjF9x9OQh1f4F0BuB1e1VNOWOPmaqZw8fmb96EHDiV3k3+ZGr
	em/5NheToOc8ZVdKQ8RLWe8W0Xs2Qj9vDy4Xe6indToHEqH4K94Ceso+rWTC3h+vfuRpI6gMoKM
	6e2CGhoYBLs6HgnWdktdG0/iscEj6rcQMNXhzMGrFDaYjnYgyDMzzrBYPtl3tTqIONHqPmdDlP+
	JWi3jzJBVo2incKPhyyDRbnbG2cZjM82jHetAKO0o3hLXMS+x+6L3c7sQmeYTbeG05cgbB7GdI1
	FAqK77EhzKts7sRJIqqh/YMGD5OXpre2gYt1/YYHBj/Y1ZxExoYZVeaM7UYyu9x8RSvlJR5nuCD
	x+eoqf//HD0rXp3QBo9SzyzHHrLcWpF2WPPPDMOpGhy5qrBarBGkvYBZxyhEpFUuLX+/GG8nZTA
	iwpTkQ8BNsE/MA/EfDg7LfjxIqOeO6YqK4n//LOuJWbd2vHxYzkpyHLUo96CiMFmoGdMne
X-Google-Smtp-Source: AGHT+IGmoUl2cbjyJ1EHEQ8fp3WXPHUAFBFxlC363yt/8hhcWrsMfhX4CysA3uiX3kjo3crHvXU0Tg==
X-Received: by 2002:a17:903:238b:b0:295:5b68:9967 with SMTP id d9443c01a7336-29f24484ec0mr17010205ad.49.1765531935054;
        Fri, 12 Dec 2025 01:32:15 -0800 (PST)
Received: from smtp.gmail.com (220-128-132-142.hinet-ip.hinet.net. [220.128.132.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f13d6a887sm20358355ad.91.2025.12.12.01.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:32:13 -0800 (PST)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
Date: Fri, 12 Dec 2025 17:31:57 +0800
Message-ID: <20251212093157.5618-1-antivirus621@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update CM9825 to support GENE_TWL7 which supports Line-out, Line-in, and Mic-in.

Signed-off-by: Leo Tsai <antivirus621@gmail.com>
---
 sound/hda/codecs/cm9825.c | 219 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 210 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index 5c474ce44348..1c08cef8050d 100644
--- a/sound/hda/codecs/cm9825.c
+++ b/sound/hda/codecs/cm9825.c
@@ -13,6 +13,11 @@
 #include "hda_jack.h"
 #include "generic.h"
 
+enum {
+	QUIRK_CM_STD = 0x0,
+	QUIRK_GENE_TWL7_SSID = 0x160dc000
+};
+
 /* CM9825 Offset Definitions */
 
 #define CM9825_VERB_SET_HPF_1 0x781
@@ -25,6 +30,7 @@
 #define CM9825_VERB_SET_VNEG 0x7a8
 #define CM9825_VERB_SET_D2S 0x7a9
 #define CM9825_VERB_SET_DACTRL 0x7aa
+#define CM9825_VERB_SET_P3BCP 0x7ab
 #define CM9825_VERB_SET_PDNEG 0x7ac
 #define CM9825_VERB_SET_VDO 0x7ad
 #define CM9825_VERB_SET_CDALR 0x7b0
@@ -42,6 +48,7 @@ struct cmi_spec {
 	const struct hda_verb *chip_hp_present_verbs;
 	const struct hda_verb *chip_hp_remove_verbs;
 	struct hda_codec *codec;
+	struct delayed_work unsol_line_work;
 	struct delayed_work unsol_hp_work;
 	int quirk;
 };
@@ -80,10 +87,8 @@ static const struct hda_verb cm9825_std_d0_verbs[] = {
 	{0x43, CM9825_VERB_SET_OCP, 0x33},	/* OTP set */
 	{0x43, CM9825_VERB_SET_GAD, 0x07},	/* ADC -3db */
 	{0x43, CM9825_VERB_SET_TMOD, 0x26},	/* Class D clk */
-	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
-		AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT, 0x2d},	/* Gain set */
-	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
-		AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT, 0x2d},	/* Gain set */
+	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0xa0, 0x2d},	/* Gain set */
+	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0x90, 0x2d},	/* Gain set */
 	{0x43, CM9825_VERB_SET_HPF_1, 0x40},	/* HPF set */
 	{0x43, CM9825_VERB_SET_HPF_2, 0x40},	/* HPF set */
 	{}
@@ -111,6 +116,60 @@ static const struct hda_verb cm9825_hp_remove_verbs[] = {
 	{}
 };
 
+static const struct hda_verb cm9825_gene_twl7_d3_verbs[] = {
+	{0x43, CM9825_VERB_SET_D2S, 0x62},
+	{0x43, CM9825_VERB_SET_PLL, 0x01},
+	{0x43, CM9825_VERB_SET_NEG, 0xc2},
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},
+	{0x43, CM9825_VERB_SET_DACL, 0x02},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},
+	{0x43, CM9825_VERB_SET_VNEG, 0x50},
+	{0x43, CM9825_VERB_SET_PDNEG, 0x04},
+	{0x43, CM9825_VERB_SET_CDALR, 0xf6},
+	{0x43, CM9825_VERB_SET_OTP, 0xcd},
+	{}
+};
+
+static const struct hda_verb cm9825_gene_twl7_d0_verbs[] = {
+	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},
+	{0x43, CM9825_VERB_SET_SNR, 0x38},
+	{0x43, CM9825_VERB_SET_PLL, 0x00},
+	{0x43, CM9825_VERB_SET_ADCL, 0xcf},
+	{0x43, CM9825_VERB_SET_DACL, 0xaa},
+	{0x43, CM9825_VERB_SET_MBIAS, 0x1c},
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
+	{0x43, CM9825_VERB_SET_HPF_1, 0x40},
+	{0x43, CM9825_VERB_SET_HPF_2, 0x40},
+	{0x40, AC_VERB_SET_CONNECT_SEL, 0x00},
+	{0x3d, AC_VERB_SET_CONNECT_SEL, 0x01},
+	{0x46, CM9825_VERB_SET_P3BCP, 0x20},
+	{}
+};
+
+static const struct hda_verb cm9825_gene_twl7_playback_start_verbs[] = {
+	{0x43, CM9825_VERB_SET_D2S, 0xf2},
+	{0x43, CM9825_VERB_SET_VDO, 0xd4},
+	{0x43, CM9825_VERB_SET_SNR, 0x30},
+	{}
+};
+
+static const struct hda_verb cm9825_gene_twl7_playback_stop_verbs[] = {
+	{0x43, CM9825_VERB_SET_VDO, 0xc0},
+	{0x43, CM9825_VERB_SET_D2S, 0x62},
+	{0x43, CM9825_VERB_SET_VDO, 0xd0},
+	{0x43, CM9825_VERB_SET_SNR, 0x38},
+	{}
+};
+
 static void cm9825_unsol_hp_delayed(struct work_struct *work)
 {
 	struct cmi_spec *spec =
@@ -120,6 +179,9 @@ static void cm9825_unsol_hp_delayed(struct work_struct *work)
 	bool hp_jack_plugin = false;
 	int err = 0;
 
+	if (spec->codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		hp_pin = 0x36;
+
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
 
 	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
@@ -132,10 +194,13 @@ static void cm9825_unsol_hp_delayed(struct work_struct *work)
 		if (err)
 			codec_dbg(spec->codec, "codec_write err %d\n", err);
 
-		snd_hda_sequence_write(spec->codec, spec->chip_hp_remove_verbs);
+		if (spec->codec->core.subsystem_id == QUIRK_CM_STD)
+			snd_hda_sequence_write(spec->codec,
+					       spec->chip_hp_remove_verbs);
 	} else {
-		snd_hda_sequence_write(spec->codec,
-				       spec->chip_hp_present_verbs);
+		if (spec->codec->core.subsystem_id == QUIRK_CM_STD)
+			snd_hda_sequence_write(spec->codec,
+					       spec->chip_hp_present_verbs);
 	}
 
 	jack = snd_hda_jack_tbl_get(spec->codec, hp_pin);
@@ -162,13 +227,104 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
 }
 
+static void cm9825_unsol_line_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_line_work);
+	struct hda_jack_tbl *jack;
+	hda_nid_t lineout_pin = 0x3b;
+	bool lineout_jack_plugin = false;
+
+	lineout_jack_plugin = snd_hda_jack_detect(spec->codec, 0x3b);
+
+	codec_dbg(spec->codec,
+		  "%s, lineout_jack_plugin %d, lineout_pin 0x%X, line%d\n",
+		  __func__, (int)lineout_jack_plugin, lineout_pin, __LINE__);
+
+	jack = snd_hda_jack_tbl_get(spec->codec, lineout_pin);
+
+	if (jack) {
+		jack->block_report = 0;
+		snd_hda_jack_report_sync(spec->codec);
+	}
+}
+
+static void line_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
+{
+	struct cmi_spec *spec = codec->spec;
+	struct hda_jack_tbl *tbl;
+
+	/* Delay enabling the line, to let the linein-detection
+	 * state machine run.
+	 */
+
+	codec_dbg(codec, "%s, cb->nid 0x%X, line%d\n", __func__,
+		  (int)cb->nid, __LINE__);
+
+	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
+	if (tbl)
+		tbl->block_report = 1;
+	schedule_delayed_work(&spec->unsol_line_work, msecs_to_jiffies(200));
+}
+
 static void cm9825_setup_unsol(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
 
 	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
 
+	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		hp_pin = 0x36;
+
 	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
+
+	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
+		hda_nid_t linein_pin = 0x3b;
+
+		snd_hda_jack_detect_enable_callback(codec, linein_pin,
+						    line_callback);
+	}
+}
+
+static void cm9825_init_hook(struct hda_codec *codec)
+{
+	unsigned int val;
+
+	codec_dbg(codec, "init hook\n");
+
+	/* OMTP */
+	val = snd_hda_codec_read(codec, 0x46, 0, 0xfec, 0x0);
+	snd_hda_codec_write(codec, 0x46, 0, 0x7ef, (val >> 24) & 0x7f);
+
+	// link reset
+	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		snd_hda_sequence_write(codec, cm9825_gene_twl7_d0_verbs);
+}
+
+static void cm9825_playback_pcm_hook(struct hda_pcm_stream *hinfo,
+				     struct hda_codec *codec,
+				     struct snd_pcm_substream *substream,
+				     int action)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
+			snd_hda_sequence_write(spec->codec,
+					       cm9825_gene_twl7_playback_start_verbs);
+		}
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
+			snd_hda_sequence_write(spec->codec,
+					       cm9825_gene_twl7_playback_stop_verbs);
+		}
+		break;
+	default:
+		return;
+	}
 }
 
 static int cm9825_init(struct hda_codec *codec)
@@ -184,6 +340,7 @@ static void cm9825_remove(struct hda_codec *codec)
 	struct cmi_spec *spec = codec->spec;
 
 	cancel_delayed_work_sync(&spec->unsol_hp_work);
+	cancel_delayed_work_sync(&spec->unsol_line_work);
 	snd_hda_gen_remove(codec);
 }
 
@@ -195,6 +352,9 @@ static int cm9825_suspend(struct hda_codec *codec)
 
 	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
 
+	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		cancel_delayed_work_sync(&spec->unsol_line_work);
+
 	return 0;
 }
 
@@ -213,7 +373,7 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	msleep(150);		/* for depop noise */
 
-	snd_hda_codec_init(codec);
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	hp_pin = spec->gen.autocfg.hp_pins[0];
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
@@ -229,7 +389,9 @@ static int cm9825_resume(struct hda_codec *codec)
 		if (err)
 			codec_dbg(codec, "codec_write err %d\n", err);
 
-		snd_hda_sequence_write(codec, cm9825_hp_remove_verbs);
+		if (codec->core.subsystem_id == QUIRK_CM_STD)
+			snd_hda_sequence_write(codec,
+					       spec->chip_hp_remove_verbs);
 	}
 
 	snd_hda_regmap_sync(codec);
@@ -248,9 +410,13 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	if (spec == NULL)
 		return -ENOMEM;
 
+	codec_dbg(codec, "chip_name: %s, ssid: 0x%X\n",
+		   codec->core.chip_name, codec->core.subsystem_id);
+
 	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
 	codec->spec = spec;
 	spec->codec = codec;
+	spec->gen.init_hook = cm9825_init_hook;
 	cfg = &spec->gen.autocfg;
 	snd_hda_gen_spec_init(&spec->gen);
 	spec->chip_d0_verbs = cm9825_std_d0_verbs;
@@ -258,6 +424,41 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
 	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
 
+	switch (codec->core.subsystem_id) {
+	case QUIRK_CM_STD:
+		snd_hda_codec_set_name(codec, "CM9825 STD");
+		spec->chip_d0_verbs = cm9825_std_d0_verbs;
+		spec->chip_d3_verbs = cm9825_std_d3_verbs;
+		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
+		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
+		break;
+	case QUIRK_GENE_TWL7_SSID:
+		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
+		INIT_DELAYED_WORK(&spec->unsol_line_work,
+				  cm9825_unsol_line_delayed);
+		spec->gen.hp_mic = 0;
+		cfg->line_outs = 1;
+		cfg->line_out_pins[0] = 0x36;
+		cfg->line_out_type = AUTO_PIN_LINE_OUT;
+		cfg->num_inputs = 2;
+		cfg->inputs[0].pin = 0x3b;
+		cfg->inputs[0].type = AUTO_PIN_LINE_IN;
+		cfg->inputs[1].pin = 0x37;
+		cfg->inputs[1].type = AUTO_PIN_MIC;
+		cfg->inputs[1].is_headphone_mic = 1;
+		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
+		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
+		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
+		snd_hda_codec_set_pincfg(codec, 0x37, 0x24A70100);
+		break;
+	default:
+		spec->chip_d0_verbs = cm9825_std_d0_verbs;
+		spec->chip_d3_verbs = cm9825_std_d3_verbs;
+		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
+		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
+		break;
+	}
+
 	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
-- 
2.43.0

