Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752B1E8332
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318027; cv=none; b=aRciAc6W7p/0EbEq1i/nhpHdtbaFYfinXLJIzQ5LsR23Pwcep2ZkmSblH0XoBnzCRVV6BQwrgy+Ub6m02vmGcIuxRsN7L//cZmsSstHtfEgpLNsthyE35MuAsrJKq+j44RPFA53wTTI9ggPKRvk2lfC3/piIVWqIy6Bxpe2VL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318027; c=relaxed/simple;
	bh=3JLzlQ586Vg6cifLg08U+cM+0idNNNSIDjy4vK4FxI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8IOS9E2HSzfzs+kL3vtBsUDRRVbszhUObWFS9Y0ImK+Xual3Dl4Otc9bbzAwmlI4jRve4w8VX+8FfyXxTKwuGIx1KutUDFZK9wAKehknOckiGt47mPpmnTehtudRHohjCWas72R1YjvlEzOp3yKXXpgXisVWRy3H32OGI8tsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=yt5/Obqz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="yt5/Obqz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so7996135e9.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773318024; x=1773922824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oamjlMUIKMveU4DupsayueFAAMiTRGERrVlmtvDfAw=;
        b=yt5/ObqzCbeZ1LREpyJuRMN8twnLWFFv+Hgc5p7c5vVhmWOyaLZWnI9/KgmzvVEMAo
         dGtYEXGkjy+8a/Q3ilhhAiZb0rde2/jv8EDJlPKuBlm/1T6LkONNbS5SuxrMo9SUAvQY
         eqwry/DWb/ZS4+Z8Q2dzZOe718AtM4K+FayMRkk/03XIU0IIbqSgi0vi1A6k+r+wwN0P
         t6vaFCq7AJP2jnej2zt8nkYBRUpXlve1JUCBxlGZd9oF5DjD0yRdFotin9zP9ONnISoE
         svYD7aTGOEQOkB/P21BWc645jOnN71X0uIlmgFWV8J8EcmHmUvQD8sJY/Ho51Deua7Ns
         2XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318024; x=1773922824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oamjlMUIKMveU4DupsayueFAAMiTRGERrVlmtvDfAw=;
        b=FTxKIiQW+2qvD+vYTAn1NNbyVFwQ9W7zs+hogUkJ4TFFWHtJiIrQ3aTNonDwQk8E9E
         4OnKtBzw0jw8OEJanoKGhE7i+gf5GKdUqdTsilxrrKrv0yk3HHaIBayeZLIktRJoMIqG
         W23nbQY+j38WJ8jhdeSW6s4/wcu0KQnsRaWYj4h9YoST2IR1kZuRhDLBifczUgvVG2G2
         a6kwuVSOg77fv5bdpnx+52Yt5R+FzQlPLOoa7a+sI3FTG7GYEg0GuJG+MoOsiWSJS5E1
         b7VcsiNNCF9BgmG+gKjCPVsG3sgfaiauTEE4D9cqm85EYX1LQkvRYO7j8TT0qdtb+7T8
         Dcfw==
X-Forwarded-Encrypted: i=1; AJvYcCV9CaOmOxPkKDXbSqqZPmPFUnuhAmH5B2avxP8z9kktihraS5UQUrMGeV7+PPgvdjueaCuvPcs1Z/H6hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBMm/inZewcfBVoO01nO4vDymDDfa8VOjHoX4V+RjWGwVmMT0
	t+/7d21duA8U2pZRbyatnrwzSDQV0cxP3cEWxzdukw0JG3No0IuqMpf9SBA+lhuxVQ==
X-Gm-Gg: ATEYQzwX3b8U1A/sr/9NuDkXe4eVCMaf/ZmSljTA0LSQ+Pzf2mUfZW/+ZtYj8mLMgS6
	0IwopOgJZbsU4N8V+Fbc5zNyCe0NCvq4KJHIDXJkB6yivGfI9Hd7lQyAmyGu2c0Hn71mpIhjLrf
	18pbS2wf3mHhJCQLwEKlBdhccn9F+jzsHDtH04jSq5xHgc/+RYDywrrFB+/0Xy0k0cv/+NP0/QI
	CxmFU6cdziTiq+xTEUYUxW30UXYKC8ByphYg1cDzTv/QWkUhAbeI+D/L2sod6ym5rp1nDfg7SN1
	zuDDcarhYiqtAAfMEqSxudRJ6pUYGCow76HcR2dqA5ZV8BEVyxpXO8o2bBzUVh6xT7Yg9oLxZlM
	j6oB3T0REhsRObEN4Syl3CkgEdasZV34t8UFbXboBXrjxrNpQGwup29BT0y+UAuLqZRqe1PJQru
	pU2Qjf8vFj82FW1+9R7q7CyBY0K8dbzu0zX6eKBkDp1FwyxJyDyoPzg71mcQTG49BIrO8c4w==
X-Received: by 2002:a05:600c:4745:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-4854b0ae77bmr96709235e9.2.1773318024113;
        Thu, 12 Mar 2026 05:20:24 -0700 (PDT)
Received: from starbook.localdomain ([212.105.129.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm8780832f8f.39.2026.03.12.05.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:20:23 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
Date: Thu, 12 Mar 2026 12:20:21 +0000
Message-ID: <2a8b86f9636c8ed7ca042a57945b40bd84475074.1773318012.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <1801fec108ea0047af7b034928f0a5537e6901a8.1773318012.git.sean@starlabs.systems>
References: <1801fec108ea0047af7b034928f0a5537e6901a8.1773318012.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Realtek advised that all ALC233 codecs should gate sound output with
GPIO2, pulling it low when idle, and high when active.

They provided zero documentation to support this, so this patch
applies this flow specifically to the Star Labs StarFighter:

- assert LINE2 EAPD and drive GPIO2 high on PREPARE
- deassert LINE2 EAPD and drive GPIO2 low on CLEANUP

This solution requires no delay, and also solves the pops in gdm3, and
entering G3 that the previous approach did not solve.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: Edip Hazuri <edip@medip.dev>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f5719e630d28..901314a7af51 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1436,6 +1436,32 @@ static void alc274_hp_envy_pcm_hook(struct hda_pcm_stream *hinfo,
 	}
 }
 
+#define ALC233_STARFIGHTER_SPK_PIN	0x1b
+#define ALC233_STARFIGHTER_GPIO2	0x04
+
+static void alc233_starfighter_update_amp(struct hda_codec *codec, bool on)
+{
+	snd_hda_codec_write(codec, ALC233_STARFIGHTER_SPK_PIN, 0,
+			    AC_VERB_SET_EAPD_BTLENABLE,
+			    on ? AC_EAPDBTL_EAPD : 0);
+	alc_update_gpio_data(codec, ALC233_STARFIGHTER_GPIO2, on);
+}
+
+static void alc233_starfighter_pcm_hook(struct hda_pcm_stream *hinfo,
+					struct hda_codec *codec,
+					struct snd_pcm_substream *substream,
+					int action)
+{
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		alc233_starfighter_update_amp(codec, true);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		alc233_starfighter_update_amp(codec, false);
+		break;
+	}
+}
+
 static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
 				      const struct hda_fixup *fix,
 				      int action)
@@ -1449,6 +1475,24 @@ static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
 	}
 }
 
+static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gpio_mask |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_dir |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_data &= ~ALC233_STARFIGHTER_GPIO2;
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		spec->gen.pcm_playback_hook = alc233_starfighter_pcm_hook;
+		break;
+	}
+}
+
 static void alc_update_coef_led(struct hda_codec *codec,
 				struct alc_coef_led *led,
 				bool polarity, bool on)
@@ -4055,6 +4099,7 @@ enum {
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
+	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 };
@@ -6500,6 +6545,10 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
+	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_starlabs_starfighter,
+	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
@@ -7662,6 +7711,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7758,6 +7808,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC233_FIXUP_STARLABS_STARFIGHTER, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
