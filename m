Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88A3C1404
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159383; cv=none; b=sqVc1drgSggA3mbipLR7MAAxZDLCn8zI3cImLbWQvZ2mHe/0miuHyrw+fVLCAmbnmALtG1LMIwQ9dW3oCm+73+fmunm5skBpjxb0JfSmKONVNz94bC2y8bzCnVnDRjrT4QbDYzPjlNMPfuvSHlVbjxa1RkjVZiQ+9bvuth/OwHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159383; c=relaxed/simple;
	bh=7nknvJ/xUXSE60GpcenQl9s2AIQIuWk52w+RJgy+OjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c5WVny2sAtOLhKlmEjYhdQbGLSVce3Alt5oZaLvqH5fu1UedkojXd8gFCpUDo/4eqt4VxGMQfjvRtSD4ReFw61D3yhxlgSqEBJNLXx4net6iyC8rzrcYsY3xkQaslt3nnjsgZWXs/c6aiwKu5gcdTQcN9/gMQVCthGTNj+T1m3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhnf/1Hn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhnf/1Hn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso10927675e9.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787159378; x=1787764178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38UQ8rx9LeWPslgc2rqqK8U5OMGcZldfdaZuu//2MjE=;
        b=nhnf/1HngH3Q4loFd4FUsqqscRUfnQIqsz39iITjFbqOwAy7wS0uaE4eu+7oE9IUNv
         rCyYRkXlndYj3B6Fiuk9NJXEEtqKb80DoDJLAnoh3/opCo4P7zvOZodC2wawV8asgDHP
         m1P1UUA+PVS7fkWAtjMkS8J3NzhV0snucbEhKGSnoYaBXcQ9hcS5rz2p8WVMXk6msxgQ
         haWJeJ8cUUEZV+Clu3BgnWol2/yEEOpUuCy6kCkaacRKciSxepzRON+q/95XOQ/63H13
         tAlzSTJoP/YZ9CGyr42QgWBJ9wRAorsrcUoSoN1ADAJ/BKjTixIKf1SE0QNglcmv8EWU
         1dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159378; x=1787764178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38UQ8rx9LeWPslgc2rqqK8U5OMGcZldfdaZuu//2MjE=;
        b=NovTdd4dbJPuezLJ5OfwDxXSieqmRVBN37fPLzuVnFtO5lGjvkRdfAsogRBJdxGfK1
         nKt5P9LYgorYS5qt9kx6a9k/A0cvRbYSZBawEVHq5Psfpf6f8MY2AeC+qTOYyf6XJuPf
         WKQptWoxmRJinuq7wDhfYbizK5rkcoEdVYWuISuc5yVqLURvmii+6V8SnCbWti8fTiem
         zq5NqG6OpU+d5IEwfLtS75ghUujajNbsKgYaQrQOcu3T/4wV8ft+jcsqoo5aPks4YFy9
         n02rAK5acR3Ttuh/neCvOx/ZcGzanNxdoNdCXUxouM/UGrzivHMtCqMv27NwB9d9LF1u
         NlhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVrl3cIuV7lopzFqkFkp9s327AfzHL8i12EKAKqfojfuWbMLFvo75C1yHf1RacRzb7FIeZZXQXXBwwHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYndOjodRGAx3BPbX3qg+LupX+HMmYpXSPaUEJHFNu25A/ISTu
	jMYeH1lkfy7tr8GzsQYqauFfTiMhegm6QJx96qfbYS8iX1mk1IimjOY=
X-Gm-Gg: AR+sD10u5GFoFvoWBiCI4AtwOjG9H/aXnxDPWmp0w1G8rc9WxozaBXownL0xtd4D91o
	VXhEmO8bJG+y8Vvp6FT2+TeibmfpszRr/M8MRlyoY/Hzjf20Pdxoao6A/LIyriWLxh9ysdRq5Xy
	k9uXjZ5L9sJBlrqBUqSCrLQmn4MJexuqGU2n1avz+HA2ZoCaHLHx5+YEgUHe3gFSvEFCGhY/1zB
	qCnMLNcPv5p0+CxcHADeibo2hFxjP+UjEP6tzf3DofQlvmmj8lnwWBy3rjwj7UEf8kuZP41foab
	vdtlw8Ac0VTZdn+e0kTJXjlHYwpY9LvTVbU0HQpz6EOh7+Eid/TBQlEnLneRXCwu0PVEkncDPAy
	3WsuSX11X3ZpNWya1nMcY5oc7N5IlFEqcCKbk38w0XBLXPmmLjb/iV4vCLYnfwJRxOtRG/caA3H
	HiZI55yAZ89V9HVO4wCpfmEvOQ9WLxU1Zj02egKzzGuSQINDTBCSmE8rMoH3wssNeWD+5R9ENxQ
	LY5QAomfA==
X-Received: by 2002:a05:600c:37c6:b0:499:858f:2653 with SMTP id 5b1f17b1804b1-499aa14b457mr128814135e9.2.1787159378327;
        Wed, 19 Aug 2026 10:09:38 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1947c6sm68769985e9.15.2026.08.19.10.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:09:37 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt
Date: Wed, 19 Aug 2026 20:08:59 +0300
Message-ID: <20260819170919.3172-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch adds a quirk for the HP Laptop 15-fd0039nt (SSID 103c:8bb6)
to fix the micmute LED functionality.

The micmute LED is controlled via GPIO 0 with active-low polarity.

Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 48a2e7f2e..01b87267f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1364,6 +1364,16 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
 }
 
+static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->micmute_led_polarity = 1;
+	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
+}
+
 static void alc285_fixup_hp_gpio_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4086,6 +4096,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
+	ALC236_FIXUP_HP_MICMUTE_LED_ONLY,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
@@ -5828,6 +5839,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
 	},
+	[ALC236_FIXUP_HP_MICMUTE_LED_ONLY] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_micmute_led_only,
+	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -7330,6 +7345,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_MICMUTE_LED_ONLY),
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
-- 
2.47.3

