Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604270;
	b=hCh5Zzn4fc9IfmK9Ctk1k4vepA2I8B3a0MiUXaudc6ZudKrdFrUvEq2BoAmeQihWrXty
	 n5CMr0lXdRpSxEIZNlQjBetCc7w8Ud95a8NOtVlrzRGlNq8SD5pbfex6+nFHOXsll6LeL
	 CJn+Py+WMGMDNsxiXenf8gjjfgReiPOk4sF5ccMkwxxyHmT1QsUhF75GRexXvW5lQO42z
	 hrSdmYFYVeRJC8KUR/rACm4YoU6/Lf/gSANpAPIgbBnLoZzPYx9dyKezgiffUch7b3SFp
	 fbdZTmLsSn1uW4jcv6d3eDjsbYlpUM1scSd44qA2gBB5NVldGAU7u4bw2ECWpcJT+uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 X-Google-Original-Message-ID:Date:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
	b=hA+GFrLlxyTKCzOenNfiCUVfKRYuKXsyeUNQaqpwyyZDczAx8kdPyv48dEcDHwAvcjBW
	 aIODVe/sK2i+NTAte1/PQdpwqMP2eZ/dZP5Kw1UU2HqZJxbPeAl4L873ntHVsMCF31gr3
	 CDU4SOk+7nNmqaRu1cpxtOQhdLwus82EJcfTFMuJwWG4ADQrKsFhprGhqsqXFZjE0B1NT
	 KBM2/EkdlkcljZWiC48J41xehVvTQSMlwVCdOGiN5FMRZXR8KXG34A45ljyFo29Roa0z7
	 tSm7ngsX/+ssFbqiRGjTW8vp6uLLUYRgBxLRUfegM9ytQbGlyVRv+2eFE28Te8Al/wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPI+pwhg;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEE606A89D
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DEE606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPI+pwhg
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so581880a34.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604268; x=1795209068; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
        b=hPI+pwhgZkI+aHsBRmfp7v/HxQGf0QciGR7PeTntDZ6fFyMCqodfb/S5DYonAWufFL
         743v28a9Np9nARzZQSS4/ZKKweEFtGk3L7hdd4uMIVrLCam11CRkXlJ2tX4ij60V048b
         LZZ2sLGxE+S/4np57UgzBxAoMFyQaw4FFVbzCkXkZYTR9S1Kate65uFRZ4evllUfSJWO
         rWT3KNZDB/qZwGiRIPMxvjcpFlGs3kAcDvg/aP2/IV3AwuwZLPH8ayuh9JIV5HadsP5L
         Kzycskp5o4zecX36lNmySymS9Y6mXqeDltFwFAhYwISb6yA2wX1CJNl0v27F45erFdDI
         +udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604268; x=1795209068;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
        b=bKRxvtKy1iANovKZNX9IuLLPBeUlT43F7YrGyf7th3jCveQ5lqAEJfCmpPHeXe9nHS
         su7WzC5Tvgbvv7Gv/5sW1KFaVLBd0L3p1zXZVproMjkstyCVy8d904pS0vr2jNkXPHZS
         fwTHt9sBJrJ8tw1vmTyM7LEAFStvvNnENNEpCKqxngwYMtiay9V2IB1SnC2M+sqd5ge2
         ESaXpVbPNXbGj18ZgAPghCrs09gXPEYYDqJQlMY6GFt6UQx6eTpglPflxUygq56XWQSi
         0cFoZ+4cTK7T67IAIJ0F2pDMHV1lh2j/+DDzD9iy1VqZ+bKXqExhl1bC6bDJxv8BQUp2
         hosQ==
X-Gm-Message-State: APuU4Z/X5Sa5331VExKHUUTem+1vY/nPPNpI/OF/YVGnYJuDOvQVSIjD
	ty3zlmnN0aq+kQ6HqXITxB8UpLBOJciaLqrSdAHk3w6EFd9NI1SUTh/FVqwrFUmWc5k1dBKD
X-Gm-Gg: AYBFou3cIsCmf5IYSIIawxr1wXlEm1hRFCHnCWwtfS0Qb3HQHJ6lqa1VduTkTJiFOWV
	TNGYFUhGDNqeFYlFieYKx6Gogv5RpTJUdGfIAwJ+vlbIFf66/lziOw7XU3AglKx7+fiOwa1GlEn
	sq5904Y6r5Hn7GHNx9jNUCbfXMeauK3WsOUaZMRRQ5Z+nRTlvKClwRrHsnIjVZ/agpZAUrQAx/X
	ttyMe5eag9BjhJHZvXsWG5/g/ZMeWNTyVrOuBUUQLiwKKPTJWzCeTikzIwRvkGM2YJ6+M13NuD/
	xV76xQPITWco2hYozeTV+uUmZ6Ak8VdsNEJVVaf39TaGGYiEY7VnfKV2I1wpEHVS64LUOiVSNQs
	Rn+hrv21Ns10CvMFiJqdU6XcXpbbZ0TOb1urTzCMZH2JXk+DEQGsQsK8ev0JQ/+oLQpOc2Xl3dv
	AbA3En0q5uov4rMkXFwsGIiAbqChfCRmMLSjDofku57zg0aRXEiJ59nwrM5WWKDWiyS/F/nH9DV
	EpkJJESMjhwQlwn9V/6Fa0Rwo/M+WJp5ct5oGKQtC24kZ77a90NCtDX6NJ8zuJ/q9vHclIKGlAT
	NXy7m+z+jzxZTrZVLgcuNyk=
X-Received: by 2002:a05:6830:a143:20b0:862:9ff6:53b6 with SMTP id 46e09a7af769-8629ff6580cmr496542a34.23.1794604268657;
        Fri, 13 Nov 2026 13:11:08 -0800 (PST)
Received: from kk-arrow ([2601:245:4581:6413::1ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a52basm3756471a34.4.2026.11.13.13.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:11:08 -0800 (PST)
Message-ID: <6af77cec.d7a53d1d.2ea921.e37a@mx.google.com>
X-Google-Original-Message-ID: <20261113150000-avd3DU1eQOhL4sRB.GA>
Date: Fri, 13 Nov 2026 15:11:03 -0600
From: Josh Klecka <joshklecka.dev@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Zhang Heng <zhangheng@kylinos.cn>, Damien Dagorn <damien.dagorn29@gmail.com>, 
	Kailang Yang <kailang@realtek.com>, Eric Naim <dnaim@cachyos.org>, 
	Matej Sochan <matej.sochan@gmail.com>, Denis Yakovlev <mfthesun@vivaldi.net>, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mute LED support for HP Pavillion
 Aero 13-be1xxx
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The HP Pavillion Aero 13-be1xxx audio controller (103c:89fa) uses
the ALC287 chipset. This model is similar to the 13-be0xxx model
(which is already in the fixup table).

Adding this model to the fixup table using the ALC287_FIXUP_HP_GPIO_LED
quirk makes the mute led on the keyboard work.

It has been tested on the target model (HP Pavillion Aero 13 be1xxx),
and confirmed to operate correctly.

Signed-off-by: Josh Klecka <joshklecka.dev@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..ae7a46234355 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7864,6 +7864,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89f6, "HP Pavilion 15-eg2xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89fa, "HP Pavilion Aero Laptop 13-be1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a05, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0e, "HP Pavilion Laptop 15-eh2xxx", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.55.0

