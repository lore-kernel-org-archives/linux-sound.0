Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D8C346799
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765872136; cv=none; b=O2+ftrGtLMxKlhJK+3z141NrgVu2R2A28UIrQgQodrgvk0DxMneCJ6WynsbXVZVqt1Lfttf0IOitoJkZYTADYajg8AnAKDqL6+ZwvzJBuX9h033f++ZgN1y6bzRFrydGZHf9QwKKh0DOWmEaQddqn2pg1fCgBXLcCZpyplVgOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765872136; c=relaxed/simple;
	bh=KUwtOnRj2QBP05MRGQ+aAc8ibv+sWFxIiIF4NoxkfYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVCY+2/CxVoTwhk6o/htcDla4ewzqiQg3RQhe99fF7+M5k8dU8hsR62kRUbwS5et6P/sU6/Mwfb7hg+qd+mKpQNWjlcmTlsn2gqImXN5YGeMlpIIDVYbZgQ3fOzfAPgoQCpNiFQ2yzO3DkeL4UmTsBBOmHBsF7CQnkR6/H9nufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNzvS6o2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNzvS6o2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c902f6845so2447796a91.2
        for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 00:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765872129; x=1766476929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NcKHLBgqHU1zeLNI5DDollIF853YGcgjBcJrJ5Orh2o=;
        b=NNzvS6o2K8Z+h+MUo+TfoqQxshXeZ2BKYh3Z54G7zXFQ4UiU/fFTOwfritVJ7EWvJr
         7h4c1Pa/rYZfHhIpw/r75c48+YUltaLsopTu/f7iKay0VjoXZ/3W1nOMPCxkAYH5A3xt
         PE/PVlVng1+ih8WOIboZueRdWh2oraC/lW0+Kln/OtXq9I74cqaErjirey1qcvDqZtQ2
         HYHy0r6xhFjXLx6Koashhxxsnxwd2R8dENVQEXruTyBsGMQds+tahp8NauFSpt9+5UcG
         EEIdoeIKvwwkFJdWujf7m50gPoJ+G3OFWhi07h1r0wnwLUFB7Hbnow67nuPTWP+6qzFP
         JTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765872129; x=1766476929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcKHLBgqHU1zeLNI5DDollIF853YGcgjBcJrJ5Orh2o=;
        b=L6n6JqejQQwHzhDtTTD41JhvI9mHYvXFTxgosEx1c1i3mXcXPJ3KS/Pv/Vmwqa6pAT
         1EpfgzOv2ssDBvHyCxBsotb+F8p09E817Eu8PXIzOc/dTDwqiBbBlICHvZer8EH3bYSU
         zE3qkW/mCAl19Aucca6Xm7DT3cgc4qsn3yN9DqdekAV65p28bBL1t35gmd+BtzEkyMnb
         A7nf47nyQI6r3UB1gI3NqsUJ5+zJmdnaOC2Hxoj5bww5GmplwtjNT83JRGsW/4Kt2N7A
         pkzkQorHztOQIS6bt4Sgmbc2QnMij/Iz8znoKKVlpjJ8k85kyZD5gLs33N2pezshUVbD
         zNjw==
X-Forwarded-Encrypted: i=1; AJvYcCUliUkRt4fFCCyMkLQ6eqfQjGjfH6BqbLXW+s9F/drlfHYfOkE8YZs+Yn8V+22pF+vDg8MFxw1wbKRVgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JHfaVAmRyReqs5DEUipvXz2pC3sJ0D4Wz2ghY0hItWyWGpg8
	M2rILCIaVbbxSm5sNGyEbggbUqgZYNbR74n/Eg64kDFvRCURzyrsmc7t
X-Gm-Gg: AY/fxX5LVNWibLwxW0YLK1Ai3SagrHmFEA9IgG5vNPs79Yu/u61ab8U6SkJ/QIaMyxB
	0f7AYCExprR4OHt22Mv2ySuqvqa1aUyBw5PvA0fjATz5dQSMVvgIZvHlIOYDxxJQYRON+pQHy1K
	9eX5Ex2DS7iOw9IiUO/P3HPS72Iur4nYXt0E8Ankx1orkRsZpJ7aTVscTkfSQZEePsrEcv2iXxX
	kJxF6MhIhHyortQC+qmknsPzk1MqCR0H/OT9dLtJByel859x0nn+hGtW+GELIRL6t08y9XVNVwg
	18Vw0sjkNxpRFK/BzexJeVPJMjWJ0cmduKob0nSPgyxlKdiA6X65zDgzRkqvP9mse6NJR9aaxxi
	4RCK4oJF8sTIrA7CriRWM6kCtkK0ksxlO9ChpulUrTHzvJ2D5u3fIr06vjQAhUL3A/BJ0D/eWjq
	3O7Ku7SC6jVjamrKkklFTAJHW+SQWIrUBbbE8Xq2rgA5KFkG/k/AaqLjYlDRJ6nUsOmPyr
X-Google-Smtp-Source: AGHT+IHm4jRhZ9THx0H1eiPZJg1kvndejqPdibRgl12gzhxHqS+vmYOtDV3DKSPdWDI0gugU/yCP0g==
X-Received: by 2002:a17:90b:58c5:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-34abd78fb31mr13417675a91.24.1765872129063;
        Tue, 16 Dec 2025 00:02:09 -0800 (PST)
Received: from smtp.gmail.com (220-128-132-142.hinet-ip.hinet.net. [220.128.132.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe129a87sm11057445a91.0.2025.12.16.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:02:08 -0800 (PST)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] [PATCH v5] ALSA: hda/cm9825: Add GENE_TWL7 support for AAEON
Date: Tue, 16 Dec 2025 16:01:48 +0800
Message-ID: <20251216080148.37686-1-antivirus621@gmail.com>
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
 sound/hda/codecs/cm9825.c | 308 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 301 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index 5c474ce44348..569bbde2212d 100644
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
@@ -42,7 +48,12 @@ struct cmi_spec {
 	const struct hda_verb *chip_hp_present_verbs;
 	const struct hda_verb *chip_hp_remove_verbs;
 	struct hda_codec *codec;
+	struct delayed_work unsol_inputs_work;
+	struct delayed_work unsol_lineout_work;
 	struct delayed_work unsol_hp_work;
+	bool jd_cap_hp;
+	bool jd_cap_lineout;
+	bool jd_cap_inputs[AUTO_CFG_MAX_INS];
 	int quirk;
 };
 
@@ -111,6 +122,140 @@ static const struct hda_verb cm9825_hp_remove_verbs[] = {
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
+static bool cm9825_jd_cap(struct hda_codec *codec, hda_nid_t pin_id)
+{
+	int cap;
+
+	cap =
+	    snd_hdac_read_parm(&codec->core, pin_id,
+			       AC_PAR_PIN_CAP) & AC_PINCAP_PRES_DETECT;
+
+	codec_dbg(codec, "%s, cap 0x%X, line%d\n", __func__, cap, __LINE__);
+
+	return (bool)cap;
+}
+
+static void cm9825_unsol_inputs_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_inputs_work);
+	struct hda_jack_tbl *jack;
+	int i;
+	bool input_jack_plugin;
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (!spec->jd_cap_inputs[i])
+			continue;
+
+		input_jack_plugin =
+		    snd_hda_jack_detect(spec->codec,
+					spec->gen.autocfg.inputs[i].pin);
+		jack =
+		    snd_hda_jack_tbl_get(spec->codec,
+					 spec->gen.autocfg.inputs[i].pin);
+		if (jack) {
+			jack->block_report = 0;
+			snd_hda_jack_report_sync(spec->codec);
+		}
+
+		codec_dbg(spec->codec,
+			  "%s, input_jack_plugin %d, linein_pin 0x%X, line%d\n",
+			  __func__, (int)input_jack_plugin,
+			  spec->gen.autocfg.inputs[i].pin, __LINE__);
+	}
+}
+
+static void cm9825_unsol_lineout_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_lineout_work);
+	struct hda_jack_tbl *jack;
+	bool lineout_jack_plugin;
+
+	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
+
+	lineout_jack_plugin = snd_hda_jack_detect(spec->codec, lineout_pin);
+
+	jack = snd_hda_jack_tbl_get(spec->codec, lineout_pin);
+
+	if (jack) {
+		jack->block_report = 0;
+		snd_hda_jack_report_sync(spec->codec);
+	}
+
+	codec_dbg(spec->codec,
+		  "%s, lineout_jack_plugin %d, lineout_pin 0x%X, line%d\n",
+		  __func__, (int)lineout_jack_plugin, lineout_pin, __LINE__);
+}
+
 static void cm9825_unsol_hp_delayed(struct work_struct *work)
 {
 	struct cmi_spec *spec =
@@ -159,16 +304,92 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
 	if (tbl)
 		tbl->block_report = 1;
-	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
+
+	if (cb->nid == spec->gen.autocfg.hp_pins[0] && spec->jd_cap_hp)
+		schedule_delayed_work(&spec->unsol_hp_work,
+				      msecs_to_jiffies(200));
+	else if (cb->nid == spec->gen.autocfg.line_out_pins[0]
+		 && spec->jd_cap_lineout)
+		schedule_delayed_work(&spec->unsol_lineout_work,
+				      msecs_to_jiffies(200));
+
+	for (int i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (cb->nid == spec->gen.autocfg.inputs[i].pin
+		    && spec->jd_cap_inputs[i])
+			schedule_delayed_work(&spec->unsol_inputs_work,
+					      msecs_to_jiffies(200));
+	}
 }
 
 static void cm9825_setup_unsol(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
+	int i;
 
 	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
 
-	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
+	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
+
+	if (hp_pin != 0) {
+		spec->jd_cap_hp = cm9825_jd_cap(codec, hp_pin);
+		if (spec->jd_cap_hp)
+			snd_hda_jack_detect_enable_callback(codec, hp_pin,
+							    hp_callback);
+	} else
+		spec->jd_cap_hp = false;
+
+	if (lineout_pin != 0) {
+		spec->jd_cap_lineout = cm9825_jd_cap(codec, lineout_pin);
+		if (spec->jd_cap_lineout)
+			snd_hda_jack_detect_enable_callback(codec, lineout_pin,
+							    hp_callback);
+	} else
+		spec->jd_cap_lineout = false;
+
+	codec_dbg(codec,
+		  "%s, hp_pin 0x%X, jd_cap_hp %d lineout_pin 0x%X, jd_cap_lineout %d, line%d\n",
+		  __func__, (int)hp_pin, (int)spec->jd_cap_hp, (int)lineout_pin,
+		  (int)spec->jd_cap_lineout, __LINE__);
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (spec->gen.autocfg.inputs[i].pin != 0) {
+			spec->jd_cap_inputs[i] =
+			    (bool)cm9825_jd_cap(codec,
+						spec->gen.autocfg.inputs[i].pin
+						);
+			if (spec->jd_cap_inputs[i])
+				snd_hda_jack_detect_enable_callback(codec,
+								    spec->gen.autocfg.inputs[i].pin,
+								    hp_callback);
+		} else
+			spec->jd_cap_inputs[i] = false;
+
+		codec_dbg(codec,
+			  "%s, input pin[%d]: 0x%X, jd_cap_inputs %d, line%d\n",
+			  __func__, i, spec->gen.autocfg.inputs[i].pin,
+			  (int)spec->jd_cap_inputs[i], __LINE__);
+	}
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
@@ -182,23 +403,48 @@ static int cm9825_init(struct hda_codec *codec)
 static void cm9825_remove(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
+	int i;
+
+	if (spec->jd_cap_hp)
+		cancel_delayed_work_sync(&spec->unsol_hp_work);
+
+	if (spec->jd_cap_lineout)
+		cancel_delayed_work_sync(&spec->unsol_lineout_work);
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (spec->jd_cap_inputs[i]) {
+			cancel_delayed_work_sync(&spec->unsol_inputs_work);
+			break;
+		}
+	}
 
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
 	snd_hda_gen_remove(codec);
 }
 
 static int cm9825_suspend(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
+	int i;
 
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
+	if (spec->jd_cap_hp)
+		cancel_delayed_work_sync(&spec->unsol_hp_work);
+
+	if (spec->jd_cap_lineout)
+		cancel_delayed_work_sync(&spec->unsol_lineout_work);
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (spec->jd_cap_inputs[i]) {
+			cancel_delayed_work_sync(&spec->unsol_inputs_work);
+			break;
+		}
+	}
 
 	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
 
 	return 0;
 }
 
-static int cm9825_resume(struct hda_codec *codec)
+static int cm9825_cm_std_resume(struct hda_codec *codec)
 {
 	struct cmi_spec *spec = codec->spec;
 	hda_nid_t hp_pin = 0;
@@ -215,6 +461,8 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	snd_hda_codec_init(codec);
 
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
+
 	hp_pin = spec->gen.autocfg.hp_pins[0];
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
 
@@ -232,6 +480,20 @@ static int cm9825_resume(struct hda_codec *codec)
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
+	else if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
+		snd_hda_codec_init(codec);
+		snd_hda_sequence_write(codec, spec->chip_d0_verbs);
+	}
+
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 
@@ -242,13 +504,15 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
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
@@ -258,6 +522,36 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
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
+		break;
+	case QUIRK_GENE_TWL7_SSID:
+		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
+		INIT_DELAYED_WORK(&spec->unsol_inputs_work,
+				  cm9825_unsol_inputs_delayed);
+		INIT_DELAYED_WORK(&spec->unsol_lineout_work,
+				  cm9825_unsol_lineout_delayed);
+		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
+		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
+		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
+		/* Internal fixed device, Rear, Mic-in, 3.5mm */
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

