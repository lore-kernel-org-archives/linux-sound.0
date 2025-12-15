Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6B327BE1
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786486; cv=none; b=pDj2WLGxXwCiAJcLQq+1PfOrnWm5FLCPiehrt411y/Sun6/Hc3Fe9stW00z8inJAFFwEL+64TW+FmD3NHHjDn6kTqq+1ik7IHV6UptdkxMsg235UMS5cOs4hv3hE1ZwBrDBaTkEg7mm1K8s9V1DgN3zkVfAY1kyDhAOWMW3puCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786486; c=relaxed/simple;
	bh=9VprdvrDclc97uyoktWnCnUOZ0WpEQ7ZppjjIMiwlTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLqkcJCQ8pFCVSFYbTKsVuu4v3fqP3FwEiswCnOw/l9oUVwmwQWrnMmkgGoYIIeN0j8VQJJDFvxyNn16hZ8t4L6KNdb5TaLg2DDztWNQtOnRRkhX/cckVBjTcQLh/W9Az1aKvxqdqbKY6OyF7pMcd/R3usvZUZp50HxsEr1ggOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwyqXuim; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwyqXuim"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so2788662b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 00:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765786482; x=1766391282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5HLohBXAas9jbs4W4e7L8I8lHMRaCBg0b6CX2mTD2Y=;
        b=bwyqXuimb/LmT/eunztYRCr9ksL0TwycfuWJYw9LXIrSaxCZm+6CqLuGP8kia+Txa1
         gRn2Ht90q7PU9/xfvCvMxBJOe5+j9uHhiE6JlxN6VkWutnP2v4fsQpru3HyjFWZFWH5d
         woVIuZCn7JvnYYFqYTPOFLjE10PpYefIcPQ+SdA91K0WpUXjIxBjI61/uVy2kUrLrfac
         xI1vw3c4S+HHci4HH2zKEml2uV6gkrPGIa5/Jxlr80WvdMGT4fEX6aj39mnenELT4hw7
         Un9IlQvoTMlGF46hA1h6m4KXugT2UvrT24gZLYNWvrWu89fIoansgiM2EdCQjykmIcR2
         1FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765786482; x=1766391282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5HLohBXAas9jbs4W4e7L8I8lHMRaCBg0b6CX2mTD2Y=;
        b=Av7s/OMyTKlQ3LpMhX1rAiHxOvpcx7BsdjI1A5Myus1Yt9OEdKx0CAwtKEAWcxVRg8
         urxYMG8etkzolm52VwOdHsdIuzHFYANbZ3ZtxSBn3I1l5bz/Ae4RxJZE8SYjhGVRhd7V
         U8NJCYZoV0htQ7wir0rtjLOree9AgOdLnDsfzpkV1COjQb2dC7OQrWbGK18UmXGmE0o2
         wdPvJn1T2s9cCr7zOchn+eEVYqRBppW5Z+VXRt7hPtGj3duUr5TS5BXiLsRgNTOL2hHx
         WBdakTCEanqHKSOTYwnhmU7SqxIOJUhBjFJ+Ev2/xmmEJkX5liev+241XvaawGj8Z6bw
         BgmA==
X-Forwarded-Encrypted: i=1; AJvYcCX1acbYUJQPtelKi1yKl0MHC62kMDi+HW1dxw2PZHxV5EasYckHrH7wjNT9d9ORaO1gx7FRtEYuwv6cDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPeHZNTk4a2M9WdqokYTtpY2zyYFogftVNM6pqSLZ+3nzCsPj
	wXbl53Wn91kj+3f1eM/QE1MOsU45kCBRip3jgbI6lvQqGqKJkzGxKbKB
X-Gm-Gg: AY/fxX7sR8tTMdI7+WpGdtoeslkIsIDu31HB27AjWw4b+ktYbmsIjq7NWaxibMsLFfg
	gm6CusXkN/HemUGehFg5FEG/FtGeyfm+XBkzb9TEXRfsnbdD2wPjgHRbyXmmKUU93Ub4SFVUIQR
	QdjgynLSf8BcPzYHEiBpvnBeyApgLb3H1cxC11cLh+aAdYWYiPH99cKhHIqjS2tjArw7Q6xZu6v
	q8VnEkbUMaMH1mrtybvw4KiO4bzChVw5jLoFgZF3fgMQBG/6I0KukTvzf1h0WrU9xCmH7Mahnin
	gHROoFmOFRksSEkVvEf6/s19MrayapDzlD5PEQ+u13IOPoMYtrR2ivAh5S3/vSfXhg3oIyayk6u
	iNQA+nJmgdsTIlk52k34ZgzNtdlwtV3SusIOiMtCydenc+oUOD75SGyww/NzP3tyNanQBjZhZt9
	wwK9fmqMY9qFlvOMuYyDt5+5+/GBLcWciLAvARBZugADJCoESpwWdr8ea1sA==
X-Google-Smtp-Source: AGHT+IFAlqP7e7wr6Y8H/MMUceHYwQSBIyWP5IwWFSnOQYYaS2nRzhJ6QAKJedVnUmcquwv5SIeddw==
X-Received: by 2002:a05:6a00:430a:b0:7e8:4398:b36b with SMTP id d2e1a72fcca58-7f669c8517bmr8732360b3a.62.1765786482296;
        Mon, 15 Dec 2025 00:14:42 -0800 (PST)
Received: from smtp.gmail.com (220-128-132-142.hinet-ip.hinet.net. [220.128.132.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f66e12698asm8514367b3a.22.2025.12.15.00.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:14:42 -0800 (PST)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
Date: Mon, 15 Dec 2025 16:14:21 +0800
Message-ID: <20251215081422.3771-1-antivirus621@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GENE_TWL7 project is an AAEON platform with a fixed audio
configuration consisting of line-out, line-in, and mic-in.
The audio routing and pin assignments are defined according to
the board-level hardware design and are not intended to be
dynamically changed.

Signed-off-by: Leo Tsai <antivirus621@gmail.com>
---
 sound/hda/codecs/cm9825.c | 315 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 303 insertions(+), 12 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index 5c474ce44348..d92b3df582af 100644
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
@@ -42,6 +48,8 @@ struct cmi_spec {
 	const struct hda_verb *chip_hp_present_verbs;
 	const struct hda_verb *chip_hp_remove_verbs;
 	struct hda_codec *codec;
+	struct delayed_work unsol_linein_work;
+	struct delayed_work unsol_lineout_work;
 	struct delayed_work unsol_hp_work;
 	int quirk;
 };
@@ -80,10 +88,8 @@ static const struct hda_verb cm9825_std_d0_verbs[] = {
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
@@ -111,6 +117,72 @@ static const struct hda_verb cm9825_hp_remove_verbs[] = {
 	{}
 };
 
+/*
+ * To save power, AD/CLK is turned off.
+ */
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
+/*
+ * Enable CLK/ADC to start recording.
+ */
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
+/*
+ * Enable DAC to start playback.
+ */
+static const struct hda_verb cm9825_gene_twl7_playback_start_verbs[] = {
+	{0x43, CM9825_VERB_SET_D2S, 0xf2},
+	{0x43, CM9825_VERB_SET_VDO, 0xd4},
+	{0x43, CM9825_VERB_SET_SNR, 0x30},
+	{}
+};
+
+/*
+ * Disable DAC and enable de-pop noise mechanism.
+ */
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
@@ -162,6 +234,94 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
 }
 
+static void cm9825_unsol_linein_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_linein_work);
+	struct hda_jack_tbl *jack;
+
+	hda_nid_t linein_pin = spec->gen.autocfg.inputs[1].pin;
+
+	bool linein_jack_plugin = false;
+
+	linein_jack_plugin = snd_hda_jack_detect(spec->codec, linein_pin);
+
+	codec_dbg(spec->codec,
+		    "%s, lineout_jack_plugin %d, linein_pin 0x%X, line%d\n",
+		    __func__, (int)linein_jack_plugin, linein_pin, __LINE__);
+
+	jack = snd_hda_jack_tbl_get(spec->codec, linein_pin);
+
+	if (jack) {
+		jack->block_report = 0;
+		snd_hda_jack_report_sync(spec->codec);
+	}
+}
+
+static void linein_callback(struct hda_codec *codec,
+			    struct hda_jack_callback *cb)
+{
+	struct cmi_spec *spec = codec->spec;
+	struct hda_jack_tbl *tbl;
+
+	/* Delay enabling the line, to let the linein-detection
+	 * state machine run.
+	 */
+
+	codec_dbg(codec, "%s, cb->nid 0x%X, line%d\n", __func__,
+		    (int)cb->nid, __LINE__);
+
+	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
+	if (tbl)
+		tbl->block_report = 1;
+	schedule_delayed_work(&spec->unsol_linein_work, msecs_to_jiffies(200));
+}
+
+static void cm9825_unsol_lineout_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_lineout_work);
+	struct hda_jack_tbl *jack;
+
+	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
+
+	bool lineout_jack_plugin = false;
+
+	lineout_jack_plugin = snd_hda_jack_detect(spec->codec, lineout_pin);
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
+static void lineout_callback(struct hda_codec *codec,
+			     struct hda_jack_callback *cb)
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
+	schedule_delayed_work(&spec->unsol_lineout_work, msecs_to_jiffies(200));
+}
+
 static void cm9825_setup_unsol(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
@@ -171,6 +331,44 @@ static void cm9825_setup_unsol(struct hda_codec *codec)
 	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
 }
 
+static void cm9825_gene_twl7_setup_unsol(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
+
+	hda_nid_t lineint_pin = spec->gen.autocfg.inputs[0].pin;
+
+	codec_dbg(codec, "%s, lineout_pin 0x%X, lineint_pin 0x%X, line%d\n",
+		    __func__, lineout_pin, lineint_pin, __LINE__);
+
+	snd_hda_jack_detect_enable_callback(codec, lineout_pin,
+					    lineout_callback);
+	snd_hda_jack_detect_enable_callback(codec, lineint_pin,
+					    linein_callback);
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
+		snd_hda_sequence_write(spec->codec,
+				       cm9825_gene_twl7_playback_start_verbs);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		snd_hda_sequence_write(spec->codec,
+				       cm9825_gene_twl7_playback_stop_verbs);
+		break;
+	default:
+		return;
+	}
+}
+
 static int cm9825_init(struct hda_codec *codec)
 {
 	snd_hda_gen_init(codec);
@@ -179,26 +377,61 @@ static int cm9825_init(struct hda_codec *codec)
 	return 0;
 }
 
-static void cm9825_remove(struct hda_codec *codec)
+static void cm9825_cm_std_remove(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
 
 	cancel_delayed_work_sync(&spec->unsol_hp_work);
+}
+
+static void cm9825_gene_twl7_remove(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_linein_work);
+	cancel_delayed_work_sync(&spec->unsol_lineout_work);
+}
+
+static void cm9825_remove(struct hda_codec *codec)
+{
+	if (codec->core.subsystem_id == QUIRK_CM_STD)
+		cm9825_cm_std_remove(codec);
+	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		cm9825_gene_twl7_remove(codec);
+
 	snd_hda_gen_remove(codec);
 }
 
-static int cm9825_suspend(struct hda_codec *codec)
+static void cm9825_cm_std_suspend(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
 
 	cancel_delayed_work_sync(&spec->unsol_hp_work);
+}
+
+static void cm9825_gene_twl7_suspend(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_linein_work);
+	cancel_delayed_work_sync(&spec->unsol_lineout_work);
+}
+
+static int cm9825_suspend(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	if (codec->core.subsystem_id == QUIRK_CM_STD)
+		cm9825_cm_std_suspend(codec);
+	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		cm9825_gene_twl7_suspend(codec);
 
 	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
 
 	return 0;
 }
 
-static int cm9825_resume(struct hda_codec *codec)
+static int cm9825_cm_std_resume(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
 	hda_nid_t hp_pin = 0;
@@ -213,7 +446,7 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	msleep(150);		/* for depop noise */
 
-	snd_hda_codec_init(codec);
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	hp_pin = spec->gen.autocfg.hp_pins[0];
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
@@ -232,6 +465,18 @@ static int cm9825_resume(struct hda_codec *codec)
 		snd_hda_sequence_write(codec, cm9825_hp_remove_verbs);
 	}
 
+	return 0;
+}
+
+static int cm9825_resume(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	if (codec->core.subsystem_id == QUIRK_CM_STD)
+		cm9825_cm_std_resume(codec);
+	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
+		snd_hda_sequence_write(codec, spec->chip_d0_verbs);
+
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 
@@ -242,13 +487,16 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct cmi_spec *spec;
 	struct auto_pin_cfg *cfg;
-	int err;
+	int err = 0;
+	unsigned int val = 0;
 
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (spec == NULL)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
+	codec_dbg(codec, "chip_name: %s, ssid: 0x%X\n",
+		  codec->core.chip_name, codec->core.subsystem_id);
+
 	codec->spec = spec;
 	spec->codec = codec;
 	cfg = &spec->gen.autocfg;
@@ -258,6 +506,51 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
 	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
 
+	switch (codec->core.subsystem_id) {
+	case QUIRK_CM_STD:
+		snd_hda_codec_set_name(codec, "CM9825 STD");
+		INIT_DELAYED_WORK(&spec->unsol_hp_work,
+				  cm9825_unsol_hp_delayed);
+		spec->chip_d0_verbs = cm9825_std_d0_verbs;
+		spec->chip_d3_verbs = cm9825_std_d3_verbs;
+		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
+		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
+		cm9825_setup_unsol(codec);
+		break;
+	case QUIRK_GENE_TWL7_SSID:
+		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
+		INIT_DELAYED_WORK(&spec->unsol_linein_work,
+				  cm9825_unsol_linein_delayed);
+		INIT_DELAYED_WORK(&spec->unsol_lineout_work,
+				  cm9825_unsol_lineout_delayed);
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
+		cm9825_gene_twl7_setup_unsol(codec);
+		break;
+	default:
+		err = -ENXIO;
+		break;
+	}
+
+	if (err < 0)
+		goto error;
+
+	/* Support OMTP Jack */
+	val = snd_hda_codec_read(codec, 0x46, 0, 0xfec, 0x0);
+	snd_hda_codec_write(codec, 0x46, 0, 0x7ef, (val >> 24) & 0x7f);
+
 	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
@@ -267,8 +560,6 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	if (err < 0)
 		goto error;
 
-	cm9825_setup_unsol(codec);
-
 	return 0;
 
  error:
-- 
2.43.0

