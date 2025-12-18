Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F5F2116E0
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037117; cv=none; b=srTXocK3S633XR7lmvhj0oVaCzBTyZ3rTMhfWQu9BrrViCwgzGn2sUSnFdpYy+Ug+Lek7sC8TiJblgpCZulCf7TcOBJ7Err/6O5zKzIgrMYa8VSIdbu6CvgDABMrX+FMVtz6KMb6LfmUsg03IBl+rxECd4YMk/Zz7usRAkFx0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037117; c=relaxed/simple;
	bh=snIY99tkQ3fG9zGX8mwDkz85WrLh5r/wN0Ttv/8EJ3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kW05pSVUs1kWFPeO9lnEWxIyZfABiBZ/ulpVd7SJ5UGAdoX+1dy1+4QO9lu7CSRIlUUJOhaQryUdb72LagTXualvm7yt4Jr0wHbFu6VRf3qXcx+Rd4OaobopPeGxTm4QXuBL5NJ8A4E3CIRYarRJM4WNlcjedcGKmhm9Zae5FEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/Up+mP7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/Up+mP7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ade456b6abso243891b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 21:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766037114; x=1766641914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0xBul5F4ST2TV3tlVKqWg88t5jCEHBI8sLs67jrU2w=;
        b=M/Up+mP7h4I2am3X8HiERlnhj41f47r2oI1nLDjOZR/DYH9O5fSpVD5JPMmCVLjKmb
         ywIOOP6I+FJ2fnhyQFSmS7x5gYcR8sgNszkjkrdvlE1m2eAeAo6CAhILiU7euGKFQSf8
         VfPjf8i76XfgvFulDJfFuJiH8OABgvl7eLeIVWITfUD0eqtbk2mxn07CRsMRVPWoiuIO
         faOYnmiarteiZdh5qi934xTbsQG1T5TE8rmjO+sZ7adXgwT+2RgVUp1ykDevB5gqaJSc
         zbdjFyt7HrJ8nkhI17qXyF5MnXjb9Y+mbONMxUWhJ6jcarfecupEC9VFqxwcZ932BhZi
         W/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766037114; x=1766641914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0xBul5F4ST2TV3tlVKqWg88t5jCEHBI8sLs67jrU2w=;
        b=kYwHsLJFIccTqjVP/csQHTED14x7Hu8xMxM/tv2mWCfwoI2aIpycJ3elbAIeSDpxrt
         BT46+A/j/TRBkpRXjUFuWdIMjhtlXP4ASz1rtHq5e5B4dFJ+VQsU2xJHfkg38EvOyiMr
         qfC2g1Ry9RYiChbtpdaOWwvC+kFsDRsoCXr4m/DjbMPDAHMvA7LUea0zMc61kTdsYNRN
         8qbz0t/h7x2lfLuolsef2VlLGvC8CnYup6UwlLF5G6lekNq8KVVTaROz9MKDGozZYngG
         n+Ikxvq0fhlNq6T4bbH/o1nu9zoUMvKv838oDShwlaehJJaZys2cmRUFlPRmLJ5NrOkr
         a44Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9COzhZ2UTYKYpaJClyTwzmCn7EE652QvonDTvCrw+ulIwApvkAFvHvrRYxneiab8+JtjuCotCLRV1Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5Isr+Wb9X/acOy7LfstyGUEr3Grh/f8wFGc3nqw/LZtZYxtg
	P0CVIub9XX7teuWQ67ZdJ2T68rwyvgIFmY1qRFOkfVoOokrzg9qiJRFp
X-Gm-Gg: AY/fxX5B3TgwBDkWuBWTn4Dk8fQkZFoIMzCxDw5Jjtv5+oYV8wWECJicdITpHWEluVJ
	znHRM3Z56B4GMPh9dSzRp6dNXHMpeNIdjuomk6hWnRfydmJJcVsXoe5t14+XzVlbcTmodBatKxa
	pLZvIOOoR6XnF7g2eX6NHSoapiHEISpio/imTpc3PAUKCnX4Q9YapqWpgOGJfUHtFyz5S+RigFX
	G7kf1C6BUIUXo/DlADEZLsIohupiRBis39w/+MoyYj0vooWnCwva8wfzFLdN0LOIfJi36nc96IU
	qYKOLOK9OH1a/RVQHxYM4uLXUj1s9I88Cs3qRQqcWmCs6UMb4lW4JkBfxsu5fX8KNsQZI/JiOx/
	tovbNPuRy7sGlekMpefXeRcowOxL7xZSUyf8rtW56TKWDHH4Au54QBRCv0S8cV4yb0ugdb+78qA
	P2vYwxiI9+eX/BIkHBvci8l866w5vGwD/yXsP35C91pFVsS7D4WJzJAKeqjA==
X-Google-Smtp-Source: AGHT+IGhbTu7PiE5joD6UG/hv2iO2QZig828RvZYmhT/snv8hpkkoMcPViX0BiSGRb4cgt4sBakUVA==
X-Received: by 2002:a05:6a00:4108:b0:7e8:4471:8e2 with SMTP id d2e1a72fcca58-7f66a470f41mr18651966b3a.67.1766037114344;
        Wed, 17 Dec 2025 21:51:54 -0800 (PST)
Received: from smtp.gmail.com (220-128-132-142.hinet-ip.hinet.net. [220.128.132.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1456c760sm1271402b3a.56.2025.12.17.21.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 21:51:53 -0800 (PST)
From: Leo Tsai <antivirus621@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Tsai <antivirus621@gmail.com>
Subject: [PATCH] [PATCH v6] ALSA: hda/cm9825: Add GENE_TWL7 support for AAEON
Date: Thu, 18 Dec 2025 13:51:36 +0800
Message-ID: <20251218055136.3875-1-antivirus621@gmail.com>
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
 sound/hda/codecs/cm9825.c | 290 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
index 5c474ce44348..52ee431f2e2c 100644
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
+	hda_nid_t jd_cap_hp;
+	hda_nid_t jd_cap_lineout;
+	hda_nid_t jd_cap_inputs[AUTO_CFG_MAX_INS];
 	int quirk;
 };
 
@@ -111,6 +122,121 @@ static const struct hda_verb cm9825_hp_remove_verbs[] = {
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
+ * These settings are required to properly enable the PLL, clock, ADC and
+ * DAC paths, and to select the correct analog input routing. Without
+ * these explicit configurations, the ADC does not start correctly and
+ * recording does not work reliably on this hardware.
+ *
+ * D0 configuration: enable PLL/CLK/ADC/DAC and optimize performance
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
+static void cm9825_update_jk_plug_status(struct hda_codec *codec, hda_nid_t nid)
+{
+	struct cmi_spec *spec = codec->spec;
+	bool jack_plugin;
+	struct hda_jack_tbl *jack;
+
+	jack_plugin = snd_hda_jack_detect(spec->codec, nid);
+	jack = snd_hda_jack_tbl_get(spec->codec, nid);
+	if (jack) {
+		jack->block_report = 0;
+		snd_hda_jack_report_sync(spec->codec);
+	}
+
+	codec_dbg(spec->codec,
+		  "%s, jack_plugin %d, nid 0x%X, line%d\n",
+		  __func__, (int)jack_plugin, nid, __LINE__);
+}
+
+static void cm9825_unsol_inputs_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_inputs_work);
+	int i;
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (!spec->jd_cap_inputs[i])
+			continue;
+
+		cm9825_update_jk_plug_status(spec->codec,
+					     spec->gen.autocfg.inputs[i].pin);
+	}
+}
+
+static void cm9825_unsol_lineout_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec,
+			 unsol_lineout_work);
+
+	cm9825_update_jk_plug_status(spec->codec,
+				     spec->gen.autocfg.line_out_pins[0]);
+}
+
 static void cm9825_unsol_hp_delayed(struct work_struct *work)
 {
 	struct cmi_spec *spec =
@@ -159,16 +285,93 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
 	if (tbl)
 		tbl->block_report = 1;
-	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
+
+	if (cb->nid == spec->jd_cap_hp)
+		schedule_delayed_work(&spec->unsol_hp_work,
+				      msecs_to_jiffies(200));
+	else if (cb->nid == spec->jd_cap_lineout)
+		schedule_delayed_work(&spec->unsol_lineout_work,
+				      msecs_to_jiffies(200));
+
+	for (int i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (cb->nid == spec->jd_cap_inputs[i])
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
+		if (is_jack_detectable(codec, hp_pin)) {
+			spec->jd_cap_hp = hp_pin;
+			snd_hda_jack_detect_enable_callback(codec, hp_pin,
+							    hp_callback);
+		} else
+			spec->jd_cap_hp = 0;
+	} else
+		spec->jd_cap_hp = 0;
+
+	if (lineout_pin != 0) {
+		if (is_jack_detectable(codec, lineout_pin)) {
+			spec->jd_cap_lineout = lineout_pin;
+			snd_hda_jack_detect_enable_callback(codec, lineout_pin,
+							    hp_callback);
+		} else
+			spec->jd_cap_lineout = 0;
+	} else
+		spec->jd_cap_lineout = 0;
+
+	codec_dbg(codec,
+		  "%s, jd_cap_hp 0x%02X, jd_cap_lineout 0x%02X, line%d\n",
+		  __func__, spec->jd_cap_hp, spec->jd_cap_lineout, __LINE__);
+
+	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
+		if (spec->gen.autocfg.inputs[i].pin != 0) {
+			if (is_jack_detectable
+			    (codec, spec->gen.autocfg.inputs[i].pin)) {
+				spec->jd_cap_inputs[i] =
+				    spec->gen.autocfg.inputs[i].pin;
+				snd_hda_jack_detect_enable_callback(codec,
+								    spec->gen.autocfg.inputs[i].pin,
+								    hp_callback);
+			} else
+				spec->jd_cap_inputs[i] = 0;
+		} else
+			spec->jd_cap_inputs[i] = 0;
+
+		codec_dbg(codec,
+			  "%s, input jd_cap_inputs[%d] 0x%02X, line%d\n",
+			  __func__, i, spec->jd_cap_inputs[i], __LINE__);
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
@@ -182,23 +385,48 @@ static int cm9825_init(struct hda_codec *codec)
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
+
+	if (spec->jd_cap_hp)
+		cancel_delayed_work_sync(&spec->unsol_hp_work);
 
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
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
@@ -215,6 +443,8 @@ static int cm9825_resume(struct hda_codec *codec)
 
 	snd_hda_codec_init(codec);
 
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
+
 	hp_pin = spec->gen.autocfg.hp_pins[0];
 	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
 
@@ -232,6 +462,20 @@ static int cm9825_resume(struct hda_codec *codec)
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
 
@@ -242,13 +486,15 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
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
@@ -258,6 +504,36 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
 	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
 
+	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
+	INIT_DELAYED_WORK(&spec->unsol_inputs_work,
+			  cm9825_unsol_inputs_delayed);
+	INIT_DELAYED_WORK(&spec->unsol_lineout_work,
+			  cm9825_unsol_lineout_delayed);
+
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

