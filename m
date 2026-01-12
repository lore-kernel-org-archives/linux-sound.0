Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66DD37F8A0
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768243395; cv=none; b=KYC2TWDgwxvLySrnRVmnvtpeGqQupsCLirx6yw6zbEFS7GJjHdKFm4d1cde72q01eve4aKVwhk9zusw8aLwgg5kmgzGB/QG1TJgA4srBkxHEEltBpNn1PwoBuQ4OFUtfJvnPntqngYLh3LVAv6bca4QOaBGdnqaE2/CCaenfksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768243395; c=relaxed/simple;
	bh=+QvVCvw1klnqrxySSHukiWlHQVpgRhCtuVlARgsjKfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUdnWGzld1zm5lF2q1et/T6Hukjszx2evXit/GZqnq6ZPOSEt2WelwR/N/V6jVz/4IJIqk/d0hqTwGhEmEQ3HTTx3J2brLpHOGpvQFhKRy5AUMkgtme/Ooz01qmaEIAUQu2aXYQoeqf3nmW4fBpTseFfHMi4fNmJWDGVX+EPUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcHYJazZ; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcHYJazZ"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so631493b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768243394; x=1768848194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DjvgLIZmQWeoST3zBhDMMnYD5mpRfaGlHpQS/N7rf0=;
        b=lcHYJazZfi3RDyOFRDl5SiY9zxzsq8REtaoceQSbC3e5djH1+n1o18doW25iCdAluU
         oKDyfDg24oyaEOYlJzmuTzTiMyRwe6N5P1TkZZ+Jwdkjc1NSVjFe88kWOIAa5bl5v377
         v5k1yBwKqW4BRxuGkUDXkxzCzNye6bbkc6bBhqBTlZ8uYOpUC5LiBsVu75BiNvDJW6zS
         IiVhcv4lHPqyzUpJ1RAWP4HdNMY//Lo4VvRlcqfQK4WRqud+eToaDrk2t/4QoC3tDois
         VvP3Y1O0bv+94U8DBykvmfLDAb+E7A1f87Qoc8Yp8d3ZAKA2k4cvOtf6Qpu0MkT9WkB/
         eEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768243394; x=1768848194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DjvgLIZmQWeoST3zBhDMMnYD5mpRfaGlHpQS/N7rf0=;
        b=brQV0/HYpBbcmPWyX+61j7J2J7a/Wuf7lMrSrYxeqmNGHbsqpJHAD8I+BksUfByTZm
         AITc0E69YsJp1ZmTJrT0KKkBdg6r7vvHJklC9vusGESeDJD1tTT1LkDnYuiWI/T+hZaF
         MGAgTexSqt07Bl8u09bIOfzwgCAUzqIrByCaOZZ5bJw/LS62DOfqA63wkV6+uugF9KeE
         eTBL+63/+UZEI3nA4GRuyfdLaLCQFdzV+Uwa4vTlyvGuy7PdOC1EleNBAOCsxHUEGuH2
         ASXhG3w6x61s35hQfoauQYozNzse2tv5ZydQ9DspBet+FVAxm4zoYWGs6H8KSwShyFpp
         Mg1A==
X-Forwarded-Encrypted: i=1; AJvYcCVmF2LP8+qOEeuYdAtd8GMsUyA0a3Nu7RYK3QNP1eZFhVcklDqPdlEtvAvWkWy5Wl3Kbfen87VsSI8kug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcc5wiBc4yfw6ZPCKqeL5f5Jw6iYxm44e/H8v9Lmkd4U0yowwY
	uZnJyt9UgqSj9bCVWRrj/Rl6LEizaLizv1x8yjA/mnnTV3nB1vr7lKp1
X-Gm-Gg: AY/fxX7uaFA+/RujRIdiUSlQTBzkvA0C4+44lO2pGlBWbStYgEUptDhrtM2EO2Vck+J
	1ks2gMDIwzMzKzz+SWgvPYQmMP6rddpaXDWBWvGuYFIfvhGmSA2UY3EJ/r9LZaAl24JJEDzFYMb
	/zR8JQ4uwBwv7xhKqKGBWF23gElrwI96OxJ7X7s72wYbBTMQFmvT4IumEN1V4M3GFpL0CZ/soF6
	6GWKqDu0tgNOf+QXRw1JCxMUMbPnGLdspxZORyzk3ylrnQHZEzh2v65rWwUFPanpkGAE80Cs5mv
	H+Y01zSuvMXmFk8a5B6C5P15JpMd9pwkj8BDxAmM9qpQTGg7J+bGitp2PYg7kCuwJupM9D4rfz3
	tfysNoGNCTAjKNDkBqLOxYOB8LBRLtc8jVbX8fQM5U04m6/BIgyspyqKzbN+4b2+OL/W+Bnc4Ln
	LdChkBPOkdOOGSmBAvIFCHMFo8
X-Google-Smtp-Source: AGHT+IFt5JfoW7rIZrMjXfB9WsGqOVcA/pN++mkYUVu9j4ZBlDdtrB3qggAIEeQ0Ck8Sbud3FpzTvw==
X-Received: by 2002:a05:6a00:4097:b0:81e:fb11:96d1 with SMTP id d2e1a72fcca58-81efb119a24mr7866908b3a.52.1768243394102;
        Mon, 12 Jan 2026 10:43:14 -0800 (PST)
Received: from fedora ([103.211.52.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c96d762f8sm12998423b3a.64.2026.01.12.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:43:13 -0800 (PST)
From: Bharat Dev Burman <bharat.singh7924@gmail.com>
To: 
Cc: Bharat Dev Burman <bharat.singh7924@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: add HP Victus 16-e0xxx mute LED quirk
Date: Tue, 13 Jan 2026 00:12:40 +0530
Message-ID: <20260112184253.33376-1-bharat.singh7924@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 16-e0xxx with ALC245 codec does not handle the toggling of the mute LED.
This patch adds a quirk entry for subsystem ID 0x88eb using a new
ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT fixup, enabling correct mute LED behavior.

Signed-off-by: Bharat Dev Burman <bharat.singh7924@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 61c7372e6307..06e6c1cf0d14 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1551,6 +1551,22 @@ static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
 	}
 }
 
+static void alc245_fixup_hp_mute_led_v2_coefbit(struct hda_codec *codec,
+					  const struct hda_fixup *fix,
+					  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_polarity = 0;
+		spec->mute_led_coef.idx = 0x0b;
+		spec->mute_led_coef.mask = 1 << 3;
+		spec->mute_led_coef.on = 1 << 3;
+		spec->mute_led_coef.off = 0;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook by coef bit */
 static int coef_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -3769,6 +3785,7 @@ enum {
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
+	ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
@@ -6084,6 +6101,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_v1_coefbit,
 	},
+	[ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_mute_led_v2_coefbit,
+	},
 	[ALC245_FIXUP_HP_X360_MUTE_LEDS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
@@ -6568,6 +6589,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x88dd, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x88eb, "HP Victus 16-e0xxx", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x890e, "HP 255 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8919, "HP Pavilion Aero Laptop 13-be0xxx", ALC287_FIXUP_HP_GPIO_LED),

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.52.0

