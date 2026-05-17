Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7C27A462
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035397; cv=none; b=M1gbdEbEBf7X3Z09CGSIwTT8lNIqwlp9+2vev1NVHZmH9vXw4uoQdT9DXTs7oeQPRsJaj9UjaifA+sHfn/EdprYew9a1J+uNdPut6AXi82KYYKoUjRWghHt8DQq0LsXj0UC14RIK85h6FkGRuu4izUdeRIxtmUjvNaEUsHws+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035397; c=relaxed/simple;
	bh=EmM6HSaL7MtlsZzHGdKLKG9OE/EYn2728i8JBIR5OtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TeHmbGGd47s6EgmFSpjpJaQUELx0sn3TqSeBDiHv9ZdRsXrNkVO8P8TIFMyq526pbkKvj2WJMrZytmFa4ikGrTGm/TPHoYBJu3pWWjkp4Hyel3PW80lW2604GcFPmbI+YZIBwaifucjRsVmechtR3WrSdMp7AFQtwrMq0COFgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXx9YHfO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXx9YHfO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso18250775e9.1
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779035394; x=1779640194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHonvBVve/NNvr6Ulmu+t2ONftc5b9ycNLCCNIoOHK0=;
        b=YXx9YHfOuzElOk0b81SN0yLfk2UnYUtbs3JSD+pAu0oUOah7d6evdzDbZ7wZ9Z7Z6x
         hFdOqlfZBieVY2fM6pdIT08MFwa31B9UQSFoWowQB3rtHHYIIoYiII8fTAKLApf3c/gw
         DnFJYuBEGgUffVeSpQeZz4nb8Fps8FbKrjboUT80fbn+o5rCtyKLEUA3v+Rtsgw5wbO3
         /xaJiDMuFzUes3iBdOaLHo6zKUnyQ0B0sZARSg+6Ft0WOL60JZy1YUyRpipFbM2Al5Ad
         xjpG0UHfPBKZ04N4sArCy8PUtSYpkWGM66rEfyBtIgPbz9siTtHu+C3MlNC76fvL8z4B
         HHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779035394; x=1779640194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHonvBVve/NNvr6Ulmu+t2ONftc5b9ycNLCCNIoOHK0=;
        b=sL9iNS8zUy+ES3J2he9tERbtKMTTD+418hKZEOmw6J0dBSMaI4WG/r8ssCeeR63oKx
         R0eJuPE9XEZoF5XH1TMu9qvwnN4/fW0xlyklxDkbWqSce6ewS2ecgHbtMMA1E/TJuMYx
         8v6R10b2F6VRVyIksOg/3cuP1rpjhzrynT1Mqy6VULGKnzIo6JyZ4m0nKZX0lbbGPc2y
         9yVCxV7O80R3PziW4TvrD+G1HnZgXVJs5eb4owOOzNn1W852wLVZGTw6FRQsRK2E6BM3
         p18YGAHLdb5es8jOx3uZZDDE+wQNcIyWm/dHqVxKrRG6dwUbmYzxe2+BeLeuMkz2OJkY
         e+cw==
X-Forwarded-Encrypted: i=1; AFNElJ+dqNE2yuTNtDgaNjduGR7m87dfWacTQl5DdCtg0VejhW/PDMeORuAAl0TlrN34wcM2ocLOK8q8wR59FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgFL7Z8va6vvvlgrs7lWMSLGksjdTTFAs2c/8gE6sDtrJo/Bn
	CIKagPb/Jz1eAEb5+lPCvg/SzWndvAO6EDYaQ0GRrXbLCIEuGVJ7+sf9
X-Gm-Gg: Acq92OEvpSa7rL9ODW974K8XbahI5OXAFFXnQdJz+7HqA6pKtgrk2KPr8DKo0oTA9or
	aeuvr11ws6X/fXnfR1vN4RoXyT28oAJSDCYnX0tMWfT2YrxFqJtBJ8ozBU2WYVsTKlCgQCIED9Z
	c912SMOANwPP9WkEVf6T74hitAOrnjD76CV4W/SWIvu+/KJ4XX8E/+ppmDs+a0A4P/UtwkIz0KW
	KEIDV2g8yiowXcUAVR7bqQTJcfX0XPABxC6PHhVXLRfFvlH+DpcdrsIIlT0RSDHNVwbj5Bkq8dE
	w9lvTA9R+pPL/Lk4aKZJmqbWxDRnGFB/Wx4swEzIi1jq2+QFM0lcKakU62y2GR5axNKxZNJZJoA
	0LoKG1anGcMpKOgA5NSKHNIGKJPCQ7JbmS0IGtavqU4V6NAjhXffDYVUt9x+g+/Y5sktGjTQMDD
	BUcZ9lUQCn9CDlNsAIlpMIhtZD14ZT1WvuIA==
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48fe4dad784mr156141785e9.5.1779035393286;
        Sun, 17 May 2026 09:29:53 -0700 (PDT)
Received: from [192.168.0.5] ([151.67.112.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2c96csm64633195e9.2.2026.05.17.09.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 09:29:52 -0700 (PDT)
Message-ID: <2f45fd6e-0a5b-4f47-9f2b-75d8b323ced8@gmail.com>
Date: Sun, 17 May 2026 18:29:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte,
 GA-Z170X-Gaming G1
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela ` <perex@perex.cz>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <a1dd5dfd-8678-4dd9-b6af-68a1e078168a@gmail.com>
 <87tss7xyj5.wl-tiwai@suse.de>
Content-Language: en-US
From: "eziogale@gmail.com" <eziogale@gmail.com>
In-Reply-To: <87tss7xyj5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Some CA0132 implementations (e.g. Gigabyte GA-Z170X-Gaming G1) produce 
white noise when using the DSP firmware path.

Add a QUIRK_GENERIC path that uses the standard HDA generic parser 
instead, with custom pin configs.

This patch applies against v6.18.24.
---
  sound/hda/codecs/Kconfig  |   1 +
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
+    select SND_HDA_GENERIC
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
+    struct hda_gen_spec gen;
+
      const struct snd_kcontrol_new *mixers[5];
      unsigned int num_mixers;
      const struct hda_verb *base_init_verbs;
@@ -1174,6 +1177,7 @@ enum {
      QUIRK_R3D,
      QUIRK_AE5,
      QUIRK_AE7,
+    QUIRK_GENERIC,
      QUIRK_NONE = HDA_FIXUP_ID_NOT_SET,
  };

@@ -1292,6 +1296,20 @@ static const struct hda_pintbl ae7_pincfgs[] = {
      {}
  };

+static const struct hda_pintbl ca0132_generic_pincfgs[] = {
+    { 0x0b, 0x41014111 },
+    { 0x0c, 0x414520f0 }, /* SPDIF out */
+    { 0x0d, 0x01014010 }, /* lineout */
+    { 0x0e, 0x41c501f0 },
+    { 0x0f, 0x411111f0 }, /* disabled */
+    { 0x10, 0x411111f0 }, /* disabled */
+    { 0x11, 0x41012014 },
+    { 0x12, 0x37a790f0 }, /* mic */
+    { 0x13, 0x77a701f0 },
+    { 0x18, 0x500000f0 },
+    {}
+};
+
  static const struct hda_quirk ca0132_quirks[] = {
      SND_PCI_QUIRK(0x1028, 0x057b, "Alienware M17x R4", 
QUIRK_ALIENWARE_M17XR4),
      SND_PCI_QUIRK(0x1028, 0x0685, "Alienware 15 2015", QUIRK_ALIENWARE),
@@ -1304,6 +1322,7 @@ static const struct hda_quirk ca0132_quirks[] = {
      SND_PCI_QUIRK(0x1458, 0xA016, "Recon3Di", QUIRK_R3DI),
      SND_PCI_QUIRK(0x1458, 0xA026, "Gigabyte G1.Sniper Z97", QUIRK_R3DI),
      SND_PCI_QUIRK(0x1458, 0xA036, "Gigabyte GA-Z170X-Gaming 7", 
QUIRK_R3DI),
+    SND_PCI_QUIRK(0x1458, 0xA046, "Gigabyte GA-Z170X-Gaming G1", 
QUIRK_GENERIC),
      SND_PCI_QUIRK(0x3842, 0x1038, "EVGA X99 Classified", QUIRK_R3DI),
      SND_PCI_QUIRK(0x3842, 0x104b, "EVGA X299 Dark", QUIRK_R3DI),
      SND_PCI_QUIRK(0x3842, 0x1055, "EVGA Z390 DARK", QUIRK_R3DI),
@@ -1325,6 +1344,7 @@ static const struct hda_model_fixup 
ca0132_quirk_models[] = {
      { .id = QUIRK_R3D, .name = "r3d" },
      { .id = QUIRK_AE5, .name = "ae5" },
      { .id = QUIRK_AE7, .name = "ae7" },
+    { .id = QUIRK_GENERIC, .name = "generic" },
      {}
  };

@@ -9882,14 +9902,57 @@ static void sbz_detect_quirk(struct hda_codec 
*codec)
      }
  }

+static void ca0132_generic_init_hook(struct hda_codec *codec)
+{
+    struct ca0132_spec *spec = codec->spec;
+
+    snd_hda_sequence_write(codec, spec->spec_init_verbs);
+}
+
+static int ca0132_generic_probe(struct hda_codec *codec)
+{
+    struct ca0132_spec *spec = codec->spec;
+    struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+    int err;
+
+    snd_hda_gen_spec_init(&spec->gen);
+
+    snd_hda_apply_pincfgs(codec, ca0132_generic_pincfgs);
+
+    ca0132_init_chip(codec);
+
+    err = ca0132_prepare_verbs(codec);
+    if (err < 0)
+        return err;
+
+    err = snd_hda_parse_pin_def_config(codec, cfg, NULL);
+    if (err < 0)
+        return err;
+    err = snd_hda_gen_parse_auto_config(codec, cfg);
+    if (err < 0)
+        return err;
+
+    spec->gen.init_hook = ca0132_generic_init_hook;
+    spec->gen.automute_speaker = 0;
+    spec->gen.automute_lo = 0;
+
+    snd_hda_sequence_write(codec, spec->spec_init_verbs);
+    return 0;
+}
+
  static void ca0132_codec_remove(struct hda_codec *codec)
  {
      struct ca0132_spec *spec = codec->spec;

-    if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+    switch (ca0132_quirk(spec)) {
+    case QUIRK_GENERIC:
+        snd_hda_gen_remove(codec);
+        return;
+    case QUIRK_ZXR_DBPRO:
          return dbpro_free(codec);
-    else
+    default:
          return ca0132_free(codec);
+    }
  }

  static int ca0132_codec_probe(struct hda_codec *codec,
@@ -9906,14 +9969,21 @@ static int ca0132_codec_probe(struct hda_codec 
*codec,
      codec->spec = spec;
      spec->codec = codec;

-    /* Detect codec quirk */
-    snd_hda_pick_fixup(codec, ca0132_quirk_models, ca0132_quirks, NULL);
-    if (ca0132_quirk(spec) == QUIRK_SBZ)
-        sbz_detect_quirk(codec);
-
+    /* These must be set before any path is taken */
      codec->pcm_format_first = 1;
      codec->no_sticky_stream = 1;

+    /* Detect codec quirk */
+    snd_hda_pick_fixup(codec, ca0132_quirk_models, ca0132_quirks, NULL);
+    switch (ca0132_quirk(spec)) {
+    case QUIRK_SBZ:
+        sbz_detect_quirk(codec);
+        break;
+    case QUIRK_GENERIC:
+        return ca0132_generic_probe(codec);
+    default:
+        break;
+    }

      spec->dsp_state = DSP_DOWNLOAD_INIT;
      spec->num_mixers = 1;
@@ -10014,36 +10084,51 @@ static int ca0132_codec_build_controls(struct 
hda_codec *codec)
  {
      struct ca0132_spec *spec = codec->spec;

-    if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+    switch (ca0132_quirk(spec)) {
+    case QUIRK_GENERIC:
+        return snd_hda_gen_build_controls(codec);
+    case QUIRK_ZXR_DBPRO:
          return dbpro_build_controls(codec);
-    else
+    default:
          return ca0132_build_controls(codec);
+    }
  }

  static int ca0132_codec_build_pcms(struct hda_codec *codec)
  {
      struct ca0132_spec *spec = codec->spec;

-    if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+    switch (ca0132_quirk(spec)) {
+    case QUIRK_GENERIC:
+        return snd_hda_gen_build_pcms(codec);
+    case QUIRK_ZXR_DBPRO:
          return dbpro_build_pcms(codec);
-    else
+    default:
          return ca0132_build_pcms(codec);
+    }
  }

  static int ca0132_codec_init(struct hda_codec *codec)
  {
      struct ca0132_spec *spec = codec->spec;

-    if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+    switch (ca0132_quirk(spec)) {
+    case QUIRK_GENERIC:
+        return snd_hda_gen_init(codec);
+    case QUIRK_ZXR_DBPRO:
          return dbpro_init(codec);
-    else
+    default:
          return ca0132_init(codec);
+    }
  }

  static int ca0132_codec_suspend(struct hda_codec *codec)
  {
      struct ca0132_spec *spec = codec->spec;

+    if (ca0132_quirk(spec) == QUIRK_GENERIC)
+        return 0;
+
      cancel_delayed_work_sync(&spec->unsol_hp_work);
      return 0;
  }
-- 
2.54.0

Signed-off-by: Ezio Galeazzi <eziogale@gmail.com>

