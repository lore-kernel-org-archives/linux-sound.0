Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4F1E0DD8
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797791; cv=none; b=uwGPx2gFyCBPnXsmPQD6BwMtMH6SLyxMYl9aeEKE92jC/MM4AakrlgjRNySLWOn7TP50m5CGXKD21paw+fYqJlU15asrjEzs63hSjT/0GcVQrrPNETugymYn3ySQhwLlEVMsRRjrXuNxr+djF0SgWsfCZbEX5KNgJRf2XOyfN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797791; c=relaxed/simple;
	bh=gLf7suGzuW1CNRqhLYrxy2nAeSaF/GiVB56qwc6YQBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=No9G2RlLGQ6iD9l2pO/bQZBXRMIQi+nZX4k1X3oFAnf6VG8TI7IDu3rmVzIRZPJVrqhuapQ4VqGJM7qcagtTGMMFtEjncQgwUy+oL9V+Hh98la1mB2m6gec/KyfSFinAHzmMP2nRm5UNpSVO1sfGGofDwLB7uCn0hhXVVQk30QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEDRm7KN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEDRm7KN"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso3682588b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765797789; x=1766402589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwFyn6tj2q1POnIljG3XR1Ny1mH9gHde8uTvmrn24JQ=;
        b=fEDRm7KNIAIrsfA3aCIxCm3s5nFDrwsQ0BheY6VI13gIWYzXmVXtB6H3t2CcqVa4Af
         /Y5o3/2lrkBOAr8m4OwvUaj0T4Svxj+xKDm8n0nB1UY4c4wa7/q4G4nQGQCXm0EyHDBm
         NGurGWIJaL7zj1Rz22jgbQbSxyOOfaWknBxz7xsAd+WmZfXF9/jOYOMW+yBvlDBSUzLm
         Re8splNAgnl01BGXuntT4ZELwCtg0UfJB8jb8afcKCmhgzY7Y9b/LGqDFlwavLnqEuHK
         pZ0CaSyMJd7GfLlOHwK4wEhzU0/Bj+HxLtVxkV3xbPsU0T1gl67LF+Gf3KAv2JODkbcu
         74vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797789; x=1766402589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFyn6tj2q1POnIljG3XR1Ny1mH9gHde8uTvmrn24JQ=;
        b=q8IwgFLdN5QHUr+AX2VDF6S4ySHB/l2/oLR7OGZAKCrSs4cGBaHQdlJTDUgwrWvCIx
         Zfl5L/aHcziIbrLH6cOypizvjXr5pn61Yh8LqIQVFRk7Tee3xgvNr60+1APChgb4I5lE
         j5DSD/CTzexT9gup1U4WSrwNC5AOGIHfHvpOVVU/255HEDcYDwm5NrZAwqYkI/x6wY3T
         M9wrJR3IHYi8cUS/9gQ79oZZ1GYFc2HVd+DyrWwKAqZBb3EBvslt8QrQNNeSlq0g6YHY
         yfo1cVEvloLJrra5S6F4QojCyzanU+a1wSYU4gXK00clIvRM5mrV9SntDPWEgeRGbOvR
         fYiw==
X-Forwarded-Encrypted: i=1; AJvYcCXPmQ+ZNzWVVLrzfqEFwWRKYpQ4/dGObqrgvj3+jgUc14XTsSdwnIwKkJfWIU1Bq0xYzMO4H+GjphBopA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEJ8DVDBdi/UIDXs/xde2fM9wzPpFDLkOWPs9MbrhzpSKIRJm
	Cs9i6rpr0kbA49x9D3bstdJkLwKbvG5LmfIyY3KIeJ2uskKZN/9AYwON
X-Gm-Gg: AY/fxX4QsHv5gUsfq0IW/nGeumZ/f8YE4rDlBltCJiNovTfR73t/0MqBj0kP1h93os0
	k7us0NfnNjqUByGatIpVo2Q5qPelruY6ic1yJLk38RMLwZFt1OB6Rcfc1YOhtuub80m5NG0UbYe
	M+9JQ0BfMVbi3xZpEyYrRcDC1fIcJoTAy+SDHmsLWMQCmbPv+SqBpAZj23w5Gi83sXM/U8Wz0Km
	D2QBSmxC9u/gAyliyJEMHZk8xvj+P+zvN4l+5gq370XO2GOynXEi2KNT9ZI7frx24iMgw0xnL1j
	EBqxQ915HELszpeth0hGpRkrnhls+r6zPXNN9r995wlVgbNnQ0Do8MatnYljw9CBaSPJFFJYDC5
	awU6Q0U7qTx7PnmLaQPFUcqaYoU/YW9IBLtpGqsC0KyAQC7JA1j4RjUJrXJ8CrdjpVN6YdGSAUV
	FzA+4BlGD0IrnhRVNHkjEDNnmGa0eh12670zY5KdKXWbRQIo/EF98KajWGBw==
X-Google-Smtp-Source: AGHT+IHLMbVTeQCNIE8x6dnzGCzIW+7Zbm47metsepbPiaj6TRc7KQAfZk55oHt/Ev1MYwAx6qI6lg==
X-Received: by 2002:a05:6a20:1584:b0:35d:7f7:4aac with SMTP id adf61e73a8af0-369afa01e9emr10637494637.47.1765797788985;
        Mon, 15 Dec 2025 03:23:08 -0800 (PST)
Received: from smtp.gmail.com (220-128-132-252.hinet-ip.hinet.net. [220.128.132.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1361b76c4bsm4507174a12.35.2025.12.15.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:23:08 -0800 (PST)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
Date: Mon, 15 Dec 2025 19:22:46 +0800
Message-ID: <20251215112246.37980-1-antivirus621@gmail.com>
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
 sound/hda/codecs/cm9825.c | 292 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 285 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index 5c474ce44348..5532dde89ebe 100644
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
@@ -111,6 +119,72 @@ static const struct hda_verb cm9825_hp_remove_verbs[] = {
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
@@ -162,13 +236,138 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
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
 
 	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
 
-	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
+	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
+
+	hda_nid_t linein_pin = spec->gen.autocfg.inputs[1].pin;
+
+	if (hp_pin != 0)
+		snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
+
+	if (lineout_pin != 0)
+		snd_hda_jack_detect_enable_callback(codec, lineout_pin, lineout_callback);
+
+	if (linein_pin != 0)
+		snd_hda_jack_detect_enable_callback(codec, linein_pin, linein_callback);
+
+
+	codec_dbg(codec, "%s, hp_pin 0x%X, lineout_pin 0x%X, linein_pin 0x%X, line%d\n", __func__,
+		  (int)hp_pin, lineout_pin, linein_pin, __LINE__);
+
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
 }
 
 static int cm9825_init(struct hda_codec *codec)
@@ -179,26 +378,61 @@ static int cm9825_init(struct hda_codec *codec)
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
@@ -213,7 +447,7 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	msleep(150);		/* for depop noise */
 
-	snd_hda_codec_init(codec);
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	hp_pin = spec->gen.autocfg.hp_pins[0];
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
@@ -232,6 +466,18 @@ static int cm9825_resume(struct hda_codec *codec)
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
 
@@ -242,13 +488,15 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct cmi_spec *spec;
 	struct auto_pin_cfg *cfg;
-	int err;
+	int err = 0;
 
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
@@ -258,6 +506,36 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
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
+		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
+		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
+		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
+		snd_hda_codec_set_pincfg(codec, 0x37, 0x24A70100);
+		break;
+	default:
+		err = -ENXIO;
+		break;
+	}
+
+	if (err < 0)
+		goto error;
+
 	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
 
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
-- 
2.43.0

