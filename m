Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858912;
	b=dKJaHRPCQp4QbrtTqo2qc5UOwUvC4+TjETrp9qY3WA1Hw41pcdzY+z2eZATZnx+CHLpD
	 sHlrS1Igmc/wW63WD59mFzJpZSaJ+hB+qAL7ooTyRbOUrQVAs/12WcAbsIg4yv5AK+hVH
	 JwvkMqHfSAw3VpTNEXBSZwR3BzDl5wcO8kT9eLdXbTnAOYv2j6tcawZ4Eh4ofYQaWZIJV
	 gZJ/GRH9MKzgRwlIgKtae+ZkdHSn2QxNGDUWC5hj1dEGvGGGc9PYKj3wG0M1r6l/rBx1t
	 wCUga9xf5NNMHM8jAQ0pLktUxkjeU6WD7u5gqx+oqqt3Zm7sM5kRkiHM5PBet7ylONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
	b=j2DhlQK+LXJuviIoXi5clWUWdmblJk/GkJ5ZykuJkUWozVTHi7q/biLB3BabRtK0bhms
	 356Xb+EBGmW49RnQNCHas74PK/XpbroweLdJyEGAMLm11iSO6/FQrKY0OnHxRY51y/u/c
	 3Wi2faUDVNZI1LaoLp4+oGAPnrvVPD3DJFZ37qwbAz5CgLy1MkoZzmNKhwOLfmF57YAZF
	 Qlc3VhoZk4tGS1iHYkfLODNeLGg6sfs1dCISanYKajAO2bQ1g+Mtrs6/7yJRcVgEGNZdv
	 9YeLdFLqgC91ri7iO43nhbBHOK0QPg9Bw1ZenkWyBcZDecgVxkBlSF/pM6UCHfnJFLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYsc3YsM;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B7606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 19:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYsc3YsM
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso5724435eec.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858911; x=1795463711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
        b=xYsc3YsMIDlm9cNvL5JDf/5HFR22/6vUuA6KHp6dOJmjvB6AcMHMuBgxGLB3WnsZi2
         etFbLJfICER1FI99I2dEJe5et0BvyqeZVee5aKa7EdgbJcyos+4ICTJsDJOpjPbxhXOm
         V4kM71UEjwyXoD20sSC3IBSf0O9pmdW6M57+NeRmFKKvgnpZB9kS5pRCUmARUhy8tMEQ
         CWEFyREZZYUaIlNWKrkrT67hOPPb4kE52HsUqYlfxe0ul905BLMNg5/aXZl1zF5diqX4
         a3kVF238TBaR5lc/uhKSuC9g2AF7pbeNuAIGsuidkvctyPSWqZv9J/LTa53JXcJjWR0A
         oorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858911; x=1795463711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
        b=glIQ3kA7lXEj9YVlkrDh+DrXS/8HXG1Y5XVOH0SmtdgYdbXeRZSRGSbwxof+crILHZ
         gTZIzMe+bPSGJBRAQCE9vLEe0ALFy36pt5ocata8XA7Odwl3Y3tAhn3aq76GqAw8xhwX
         4/6UW5VMSr0QYOnJ7b9pX8o/Yyv4mfPq1TTXRVBL5+6ZMnCWUR5oGrcm/n/BmVwGH8l0
         xZRGYwc8XQN+NjKkJ/VnA1B8+uQIpQZZ3PfJCdODrz+WNoHk7oNS0Asvi7Q7KwV2bM6r
         d/LQUn5iH/hW+/J2XScTwlMgZt3QUMOHgiC6p8jEbWpXjH5RNO0DUX6QVSBftTNN2xUf
         oEoA==
X-Forwarded-Encrypted: i=1; AL+hErGA4IP7qnJgvCTVewAYDyT8P7/b3DFaqB8zbxiWax/YN0UH/K8fONUwJlrZNR0TNjBLe4fInp7jX3HTqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cnPszHAnY38ahBm7T/oyHuVaJ9gGjrNKrpfuHns7Ii3AwP/A4
	Toa0jLi2FUpONnWPjJxWj+eSqEkr7MqFnOsYLwcfjXlKvFYiVekI3BPd
X-Gm-Gg: AZFdTZeyXSTzdP5Yz2uhz8FFZ2EtIeY2rUJa8FPEBnxN1xW2vIwMqy3baLp5LqGlXan
	7F3zfYIAxb2w5Lo3egpA1sAS5gYZ/rWhF+4IIz3l4tfk7frAnYOsHONCxLhE9xyValUkqJQO4z5
	NRdnsOwFTZREPiRo7qTKwf1OylNVuWWR3OIGxamEZLNhChQ/9/Rvs903eM0Q8+TaYnPjkxQOt5b
	gJGJsbrg3TPQInfpfnRaI31NsL7B4yWJErBdr2Qv0mK9wUC7+F0zffhhb6ViLyAmgaZoAVIpNi5
	ydLg/yUdaxKVyI81ivzZ7kQ9vOeNHSgxij3lnjMfk0P+/O9gK7bjCeJ/HhZZvI5AwMVEu3Hr9Qu
	6JN479pH0ObZbzjQPQSFdtKh9jN5wEnEb9Ng/GWAnFKUysxg58UeCZxtD9jq++KpUuXAZ9zJXuP
	bPWIntbTLSJ70jQ7q02nwV1uQwvIYd4Lt9z5brY9bv0cHNtgUipAgKbYmWx6pEsatNZhncLpKQx
	6l/Yf+cCbcAY7Iqp/qYsSVsD5V+0T8EZSwfpdU8z2fBk29NOEwm55/XXSfDtSQx5fSdZzf/Gq/2
	sOgzqEabRv2dqW4c+xPsRZUvhzNCzMNJaa58MwgM0tD1IOjMI7haurH73Y4MB36QcbSvCO7LZ2T
	J9TB5Xp2Zszm93XBNsamIZAHqxMuFz0+6piNxxBaA1sQ/noS4jkdtS72rP7EGEEj81pnOQWJVnR
	TUlWI3scO1C4jMO3v4PJzKEESAzCmUNJ1gONxEkb85891pIO5EJKsiWnvvovNuzTw=
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr11290341eec.24.1794858911326;
        Mon, 16 Nov 2026 11:55:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm36318888eec.10.2026.11.16.11.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:55:10 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Dorian Cruveiller <doriancruveiller@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Don't apply the Legion Slim 7 quirk to Lenovo V14 G2 ITL
Date: Tue, 17 Nov 2026 01:25:00 +0530
Message-ID: <20261116195503.11530-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo V14 G2 ITL (82KA) has PCI SSID 17aa:380e and an ALC257 with
codec SSID 17aa:38b7. No entry matches the PCI SSID, so the codec SSID
fallback picks the Legion Slim 7 16APH8 entry for PCI SSID 17aa:38b7:

  ALC257: picked fixup  for codec SSID 17aa:38b7

That applies ALC287_FIXUP_CS35L41_I2C_2 and sets up component binding
for two CS35L41 amplifiers, which this machine doesn't have; its single
speaker pair is driven by the ALC257 itself (pin 0x14).

Add a codec SSID entry after the Legion one, so the Legion keeps
matching on its PCI SSID first and the V14 G2 ITL gets
ALC269_FIXUP_LENOVO_XPAD_ACPI, the fixup the Lenovo vendor fallback
gives it when nothing else matches.

Fixes: 99af5b11c57d ("ALSA: hda/realtek: enable SND_PCI_QUIRK for Lenovo Legion Slim 7 Gen 8 (2023) serie")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW, 7.0 kernel) by booting
with snd_sof_intel_hda_generic.hda_model=lenovo-xpad-led, which selects the
same fixup this entry does: dmesg then shows "picked fixup lenovo-xpad-led
(model specified)", and speakers, headphones, headset mic and internal mic
all work as before. Build-tested (W=1) on next-20261113.

 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..73a89e3cbce4 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8605,6 +8605,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
+	/* Lenovo V14 G2 ITL has PCI SSID 17aa:380e and codec SSID 17aa:38b7, which
+	 * falls back to the Legion Slim 7 16APH8 entry above; this must come after it
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x38b7, "Lenovo V14 G2 ITL", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x38b8, "Yoga S780-14.5 proX AMD YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38b9, "Yoga S780-14.5 proX AMD LX Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC", ALC287_FIXUP_TAS2781_I2C),

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.53.0

