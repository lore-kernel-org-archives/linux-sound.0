Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAC2E1746
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865707; cv=none; b=hXXtsL+GmmL1/4sFsJrSbmqQGSyvS0PWbulGvREYYhDoao4Im4di3UeUkgea8KyMqlRfh6vcu2EBLEZeNtM7PzCtLQodpDnH2Fet+ZshaUoP27+jKvUQV0ozLxJ8INhHEzkOXsbllOV3pClmj+Yqr59nonoFwDKxu7vcHkZRa44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865707; c=relaxed/simple;
	bh=NFr/fa8U1uqBJF+PzpNsCMiESIUeat55+L9ACWpjgP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ts5GZxwF+rYYdLfLVMGvbP3Q2OfJM2gsAJCX3izdehPlQ2ZZdEZLWVFlE9Xi0duACCRoCVKwd6bgnhbW8ORQIT/OBgIsCYqdc5y9TmiKs1H4/nHh5N6vtBZ2hJVBJA1Kj8htFHTufWgcZVX2VNUg3X01ltiXZLpufqHztdnMNo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkU1TCKF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkU1TCKF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4444824f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865704; x=1761470504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8gJQKVCEPuqYVxvZI40+weEE/qE+86c9cokfRijRL8=;
        b=fkU1TCKFovPnJ0YrbDKu8Z4bXb59zgyqiT3TGS+zFxNGifSiE80A+Kp1aCrQxy9HW0
         0nCkp9ChkOjPs0bwN8pHJYigz0l6Kmf+iCsPGoTVX2xrEdgWHwj7WNseJZxrMrNG4EJp
         ZAh5bh8erWh2LQE+eX58HalnuAToXE6WOvGyEZalHMNDDd5muJXz4hvlj8hXhNKgGd+Q
         ylg4vvv5iXup3N31pe///z63MDCCBQ9qLYfMmduc2dhlz2hI8z2ofo81rzuTQgbKXrv+
         FdAgVY70c1v2F0VvYa2abOwU2GMPksM9RLPb3XYi/fqEs9cq0OoRhl/QUU4DZN7r+RJs
         XmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865704; x=1761470504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8gJQKVCEPuqYVxvZI40+weEE/qE+86c9cokfRijRL8=;
        b=u4BgHwTUNJtNrciitPWx0+BEOe+s9Wv2QryQBwGQj8YORRfqYTP+iaQ+2xmGcRsZoL
         cUO8a5YVCRSzX2seEzKT15m8bXFj+WlAFswJTob3psblQQ7UAvx37qTpQVrHZjPbA6Dy
         aST6elIl7OR8pi9ytWsTjgW6sRTU5FeI0e5UhkZ1TlkK0ynBHaBvi6vcokmXA98UQh43
         QIrKwRPVA3JZRX5TrPa71sMlbuwLjlGtKNHVcwogqzcmVyr69Su6bzFP8Qg8ndYaRpgx
         skFhYuOaKAo46kg7DM5yqcv8CMTnJOG8mJzegG257y6ns1pOBdE2Qs67cMPvYnjvdtVg
         0cgA==
X-Gm-Message-State: AOJu0Yz2+hVX/km/KvWeOtywniN2Fz/y7bE3Y2ovcUnYIHhb6tz8ieoy
	7NVxrORZTbrTfQWmefomgHHhaiSu2TqZvzlWLqUwI8UfeJlS3RmywlsDFxGGJikA
X-Gm-Gg: ASbGncsQdfod/5UfKW+M0H90BP8dYW9Kpsg5AgrC8oiPJkqf3o+sPSZtr2FsVRQiY1r
	Gc6363x3IyUfcSXMDxX+rmOUK/9ptj86W1LkAx4/D/ci0+wZNFv8aPDBN2xIzLy/hIi3wDlVFuK
	3VaTv+E3LWdU9C9jop+jIk1OaZP5miDm472HnWsqcAnmuv2vI1di9c7zimy8d9V1x4mOWZlMYNo
	fH1Mhy/EIv61i8uuYGvyCuOn02jRL5cKMqNb2v9/Makez1wvYhCG7Zyov0b27DxVF72tOJfS1wc
	2nI8CzRAEMTNk0llQ3bWN45fgDZj6ul1tLhQ0zI6yB8JevAOfeY1cP1bqF0Geb/A222sfzf+2OH
	hDpCi1delVq0kE279VXohYjD+Ii749YOWG2ARPJIU14JWIA+19FkmfaG49XdTVk8/e12Lv95Nlf
	vkmKkwIY95AkNwoPnm+LpGoLuhrHtaXrjvdj8l
X-Google-Smtp-Source: AGHT+IGu/BUo5XwjsRrGQVukEUogva6gxPnCURx4Zn5d37uc5s86Js22tq4nlqkRcPkeVd323LNrAg==
X-Received: by 2002:a05:6000:2485:b0:426:f40a:7179 with SMTP id ffacd0b85a97d-42704d8f12emr7079143f8f.26.1760865703760;
        Sun, 19 Oct 2025 02:21:43 -0700 (PDT)
Received: from nixos.kykwifi.com ([95.7.250.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9853sm9299976f8f.33.2025.10.19.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:21:43 -0700 (PDT)
From: ern775 <eren.demir2479090@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	ern775 <eren.demir2479090@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
Date: Sun, 19 Oct 2025 12:21:10 +0300
Message-ID: <20251019092134.3422-1-eren.demir2479090@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt due to a different board id. This patch enables the existing quirk for the board id 8BC8.

Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works as intended.

Signed-off-by: ern775 <eren.demir2479090@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b9e5c091bf3..522d4792ec59 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6577,6 +6577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.51.0

