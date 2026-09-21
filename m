Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EA4D17A0
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027456; cv=none; b=XZu0fzcLSU6ePxK6Oh4/yO/KVpNcwygjvvhpMLvu7muql/W/kbrw4gbpPnHaNf3IP5g62GwTMYQ1BSbpVb+gJfcdkqQYg+hH7zxYocoCSn2Hab1H112Swml3EDO6SeVYV/NrnZ1LoUUJE7rXU8G6sb1gJhnKUB1CGEfvytAtD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027456; c=relaxed/simple;
	bh=rHNSfTPilC9311+agNt/GjGeUwj79IaWGpCjNuvFzhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEHwrwJGZ8I26Kle+pY0piiPi4U1DYxUh0K6Mc6eAVKPrdvRbifDYDEc6N73NRblXfTiSbTdEPLgdA2UC0ONcrch8l25pEAo/UfbTLyPEEckHDIG9oNdNTSL/eUxZpNdI/li4vUPyI21hssY8iR5s3jADPUv6sH/irYhnhggIPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTTGN8oG; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTTGN8oG"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso204326585a.2
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027454; x=1790632254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AM8FigzrMf8WQkSGpJk1mEOOG/6Et7KWBu6IHwvDyE=;
        b=QTTGN8oGLsTmwMDefuMIstO6H4u0Sgv1gHu3T8RLgAFsdY8dNXphQ+1pGKDPgJJdUg
         3OsoVdwM5M3H/zWyVMj/m3IZtiL6LOUMag9DN8YejpD/cb30rl3btpQCB06Y+aCLodQE
         fjmEZAg5GLcv8q2v7sQGlJQ39WYwOVSbnoh2rC1dnWX2XRnz1464wPy7hObcss+xUu19
         eKbkvXiSobAvRJRykIlYlSMhkliILkbvc9BJyrwHHOghSkO+JsNmG4kgMC/A3HGXhRid
         +jVp/wntNNVXD9h+7VaJoZLmEC/F/ItwK6p2RgTVkTWY6f+JJhc4vf6b1RfMlxopL79D
         JrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027454; x=1790632254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AM8FigzrMf8WQkSGpJk1mEOOG/6Et7KWBu6IHwvDyE=;
        b=sUdWYbVVIO/zcZUwkVcj/ODnn8zztIHJVJCwdgBU1IKpDU57ZzmjQyvcDfcy26+lTI
         42pHnl9LpCAaYlpdbEGj5voFFsr7rYcVfybc/uxM5IlIkOihUTzTWTB40TltyWNBzK5W
         IgXefT4aWkj29EH3e338quXdRAEdXk+D3PSklyeDvLT9UP8rL0YtvU7z7pZoHYAXZQCj
         Vzo2uovl8ISWxSsnp4cF8xzlva3586CD+l7CRuZk1ASc+Gpl8oe21bY1LxOfUsCWrHFL
         aUPKncRgpXgSxlTv/AkQlKBEG1i4OYks0bHjZempVlAL4x7RzrK3gnoi218/CghiPSnh
         lSyg==
X-Forwarded-Encrypted: i=1; AKwUvByGX34aMSVjYBd7Yxf2yWcta1mzwKXOyUMh24DT842K+tBq9y8N7RguF4aVn8BlztXD3Ca6/jNuQpIpVg==@vger.kernel.org
X-Gm-Message-State: AFuF++kW0gijY5AGJm/9UdqIz3+0UBFQM6tWjMPTQN91sFN845NK1SU0
	tvbF6+O1zDQeOx8JpXRDIaJFag+zjdsFdo80x5/B1D0f4Exq967ygXi3
X-Gm-Gg: AYBFou0mzjSFVVpl+1CpQcbkCjdPVadFh/Hfh1BQ0m1Cz84qcvgjHqcxfeUiKi8MEeO
	ryp7jQ4mjncciZem+0hqXyWyoU+04PgnZ/Ri97zu/pZvjfpRU/6NDuPn2CawAejYByxX0Mmuq3Q
	d80uO0PS3MxVo63NlCLfe3WawPYWCpSlBXgcadt3eGF2xiuZYSo2QLPi2GgvOlEdhfduSkkcaKt
	QAnbEfZQR+zdxGHK9139efh42twCuWjOHzKNe20fcyT/ofsENQFcm9prNwnwxlvHjJ9l0Bi8d2c
	hk7KNvzAFdMwAler4UsBBrFOyfIt33tebu9nFn2h2SsRYPhot1rR4vdo2XcJqWO+66VnNVIDnjc
	PcwPf1pvdnkRBkauMNqXd8kVr4GSV+xSI/z4xnY3Pp+4TIenkp3INhiQXqTdpdoXXmrMslLIUMq
	Z6gaG+ZO943LnSYwbe1zdxhIqnnI+04eUlJwX6GWqVQZXri6BuQSSfZifJ4lRU8KGiDR4EaEhfE
	SMr1WVFabvhyte5flTsLZVsa6tOVC2N
X-Received: by 2002:a05:620a:404c:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93c15daf734mr290669485a.33.1790027454347;
        Mon, 21 Sep 2026 14:50:54 -0700 (PDT)
Received: from matthewjaybarr-png.lan ([172.59.28.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bc6f4bsm23949385a.44.2026.09.21.14.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:50:54 -0700 (PDT)
From: Matt Barr <matthewjaybarr@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Barr <matthewjaybarr@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Drop Yoga Pro 9 16IAH10 PCI SSID quirk
Date: Mon, 21 Sep 2026 17:48:12 -0400
Message-ID: <20260921214812.22139-1-matthewjaybarr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
References: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI SSID quirk added for the Lenovo Yoga Pro 9 16IAH10 (PCI SSID
17aa:3846, codec SSID 17aa:3920) also matches every other machine that
shares PCI SSID 17aa:3846. snd_hda_pick_fixup() tries all PCI SSID entries
before it falls back to the codec SSID, so those machines now get
ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1 and never reach their own
codec-SSID quirk.

The Lenovo Legion Pro 7 16IRX8H (product 82WQ) is one such machine: PCI
SSID 17aa:3846, codec SSID 17aa:3884. Before this quirk it picked
ALC287_FIXUP_TAS2781_I2C via the 17aa:3884 codec SSID fallback and bound
its TAS2781 amplifier. With it, the codec never binds the amplifier and
the internal speakers are silent:

  snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for PCI SSID 17aa:3846

versus, on a kernel without the quirk:

  snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for codec SSID 17aa:3884
  snd_hda_codec_alc269 hdaudioC0D0: bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops ...)

Drop the PCI SSID entry. The Yoga Pro 9 16IAH10 has the same amplifier as
the Yoga S990-16 (codec SSID 17aa:3920), so it still gets a fixup through
the codec SSID fallback, using the existing 17aa:3920 entry. Switch that
entry from ALC287_FIXUP_TXNW2781_I2C to ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
which applies the DAC routing fix and then chains to
ALC287_FIXUP_TXNW2781_I2C, so the amplifier setup is unchanged.

Fixes: 41d60cbfde10 ("ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220540
Suggested-by: Zhang Heng <zhangheng@kylinos.cn>
Signed-off-by: Matt Barr <matthewjaybarr@gmail.com>
---
Hi Zhang,

Thank you for the quick review. Your suggestion is cleaner than my
version, so this v2 uses it. I checked that the 17aa:3920 entry keeps its
amplifier setup, since the new fixup chains into ALC287_FIXUP_TXNW2781_I2C.

v2: Reuse the existing 17aa:3920 entry instead of adding a codec SSID
    entry, as suggested by Zhang Heng. Built against 7.2.5 and tested on
    a Legion Pro 7 16IRX8H without the model= workaround: the codec picks
    the 17aa:3884 quirk again, binds i2c-TIAS2781:00, and the speakers
    work. Not tested on a Yoga Pro 9 16IAH10 (no hardware).

--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8164,7 +8164,6 @@
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
-	SND_PCI_QUIRK(0x17aa, 0x3846, "Lenovo Yoga Pro 9 16IAH10", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
 	 */
@@ -8258,7 +8257,7 @@
 	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	HDA_CODEC_QUIRK(0x17aa, 0x3936, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
