Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D7347FEC
	for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658485; cv=none; b=Ft8dG5c7vpTn3bygPCDCjvn4ytwgljiNdnfEBYSU6fr/mEHs+cVLrZhZaXP7fNSkQZ3AxkIQ4D6rr1pmKni+GLnXg4DrWXLzWDlynhMMbYPmgy+SNGdAnTfjIHp+6rT1SQ8P83p0H4MxzPCjse+SxOje/SXLId1Z+S+yzRIdaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658485; c=relaxed/simple;
	bh=QQRHWjyPNyIITPP2PwUj7WZ8wO1dc8TgLBYknU/SRzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0paXqGnS5Sd7nGuI1gZM1fcKuYf1xhwWnTcmrFTQDHbL3jA6rdK03170zM193AjlQF4ICPuzN5Xw2MdIiQwJ0ooU9VQciYzdUnN6DeLY0afIAr/vOLt4BGAVwqNEYkqDIdIjcwYmAWCmifQ4m0J0gIUHXO5oOCDg+KG7GRJEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFc2+aAR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFc2+aAR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c33700b6435so5429066b.1
        for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791658482; x=1792263282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC8r7BpcEUOH057Mj6oLoV8CHutZoLN2FJq+teYBUzg=;
        b=dFc2+aARihozkt6/mJWv23xFZmPabTo/I8G/HhgLB7SOAtEcKQavgQckMISx9tavYo
         EqTYWEF9Gj3zk3a8UowNO7pYtsN6xrdnE3tPPPfjwKJ32yVZngd/CFSwUZSLd+cRXLgG
         vaQ3vd5Sxf+cFOyZwysdmDrmg141Ql4IgK/hAhQDSvrdriJ86dfhc1Vw77UUZ2Tfk2Mr
         A3oEmZJYL7QVf1ng0cyz3j5FQSCxui5bjnodC7RIEOxRdkg8VYZ5g2kLCIgSXFluZ24T
         ye+p8NaEw3CEZJR+tGgqjfS0m0PGiVi4CqaGSqQey83KgbDI07SruHypd1b82/moSpBq
         XfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658482; x=1792263282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC8r7BpcEUOH057Mj6oLoV8CHutZoLN2FJq+teYBUzg=;
        b=P1oNlDi7XZ78cG1LRZs5QJJolYpzxeM0JFUl4XIDHPIaqngIV1I9NxzCTgslVpPAbh
         F2FFiOAx93b8BtDsqq0ME28XKsBJqHRnGgXTVO9NZb8idE+M6qtFAOL5pvpYTLAATqod
         2oHtNEu0QUMoOGXhbZTP/x3X9c4fntLoR64HHXi8frluit3zY5Bz/1ZL3x4Cqr/yVRBn
         LNIVr4/xrC9xsy5dyx7qYGIc4M8JmFF/sv/Cn347eeE7Z1+1HcEMtGNH6Vvalx2gtOGZ
         esCTpzoN16roUD4i7TK4kWynncnmg74cWd3iZpvGE1IUcAbFuL53x599c7RxO4IuNN0H
         JirQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMaWHla5q3WZI957tOCImRVSs/dRxKOs7dhiY0uH/rWV/3TsehW7PgW4dx14ILEFvJh1jrQSrinm7EOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuvfldl9zGbzAHeDai4gaKA3TZg1RGR42j0tsWqeADtId5Hkiq
	C0STNmofe4pGFPzX/bZGu09qvqvAT0pn+NXRPXko0qUM1bl52ohrDzkQ
X-Gm-Gg: AYBFou1WeNZPlySsFnXnf9f36jIDkLjl01Ey1pe2f3DiJuBob9sdr7zJdDnzKt/1byL
	W1KikS1v5SSVW5YTdtKZeI+CBhwdVtyRdAONfApfxnbemZbWz0b0+JO+MuIMI83yTPEotqmyeTJ
	TIUWKH6wnsrc1ebdWcb1rZlKLwX3MVEgTGTkILGNZRKIkAxDAR586V4UrHqyHg0ONGo/8Z9Nd2n
	OUPIXWu3hQ+CsYy5U3jjHen5/oPg9NMIoSecjJilQ7wAhbWvYOeEL2LAMxVwY6fgXESz5SW7n5q
	6eqwjiwNTw1AYuvMyZDv5q9yHYWRP+NNOhuLhQeIjCkJB26kvhTD/VyCDCF9xljzckoRVgTfWrx
	UwiAVS1PJMqi4s9W1oPp9XJcPO+u/i13KM4IVSJUt4KmciM3R+o9s64QuyZROV/t/uxJXVbwRMp
	TyQEVl1zEYYizc0+bqEte7XD7SOAP5LJtVhnGDutRgfpud6On9Nc98Je4QrqekzEJQiVdiG46Yg
	LYca4IgmxZZGhqdDedPArs06Zh/VNLfxVEcKHfyIWULI9dazTT1aYgxcL4whxGDd4EVGGZ2tOQ=
X-Received: by 2002:a17:906:c142:b0:c29:5700:37ec with SMTP id a640c23a62f3a-c31aa023070mr583160666b.3.1791658482158;
        Sat, 10 Oct 2026 11:54:42 -0700 (PDT)
Received: from Fire-hp-envy-laptop-17-cr1xxx.home (83.9.167.187.ipv4.supernova.orange.pl. [83.9.167.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm269012166b.8.2026.10.10.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:54:41 -0700 (PDT)
From: Maksim Krasutski <krasutskimaksim@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maksim Krasutski <krasutskimaksim@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute LEDs on HP ENVY 17-cr1xxx
Date: Sat, 10 Oct 2026 20:53:35 +0200
Message-ID: <20261010185335.30949-1-krasutskimaksim@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY Laptop 17-cr1xxx with subsystem ID 103c:8be8 uses an
ALC245 codec and two CS35L41 I2C speaker amplifiers. Its existing
quirk configures the amplifiers but does not enable the speaker
and microphone mute LED handlers.

Select ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS to retain the
amplifier setup and enable both mute indicators.

The equivalent change was tested on an HP ENVY 17-cr1xxx running
Kubuntu 26.04.1 with kernel 7.0.0-38-generic. Both keyboard mute
indicators were confirmed working.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Assisted-by: LLM
Signed-off-by: Maksim Krasutski <krasutskimaksim@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 217df4301..0bfd1d093 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7817,7 +7817,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),

base-commit: 947037990e050a3cb116631ff29a9cb621068162
-- 
2.53.0

