Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179462;
	b=kvSt5Dk90kC5nGcACIBDCFJQ5wTX4SXjLCJna22PXFNDj9WcFEfOK6JKjM80e5oxPmxo
	 PDT1cS5nkTpNjBy5um6CqEwofeI8NncU7aiy1J9Kryf7h9TFi92EkYy4iu+jFMwgw78Ak
	 pnm2w9BgYhqoZrPk7cUJnlAqEyWIRXYooZb3gBj2haxdpHOYFpproRuDwikW4DiHi0rEo
	 PLvMeroJjnEQX++KMuLWqpE2gVvyDR18ycTnSFKRmEILT1AiEaK34FjGvZWYAVyjag5eg
	 2mPMNelHlIwZxuP5jYSJceHVotwayB45IdACMqatFs7wCsn2Ob+UubPExXOnehqkxXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
	b=3JLj6nuuXSD8q4X1eVvYupjX4Ugvz5lBmUzXcIVgBfUhM8JTnAlsb3IgX3Z86o7/vkDL
	 9nUSfxRQ1X+cSfJD8W1QpHUFOMhsp5YvS4LqbH0Dc8xPVvYloRUFE0rUAc4EX+bX4VTCj
	 zrb7zcdl4hxmZNokj8swVilqyyFhlWCRZ13ebAN6FsxCbsH3Q7S7dJjsXTGQ5tnGz9GEp
	 zNiM5/T0HYp3aLF7zgRY4yDCh2i4zHn0S027w6oeGn0v6KvAbY9QQQ6Sstxa2tTU6CHYd
	 aTlcGsQAhBwPWr14rtaDly9b+GBkSXJC7QXS7yA2uu6qfv+pEZqboJ0x9EhIRxUQaFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xc+/RY6m";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210D606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8210D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc+/RY6m
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so2173448eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179461; x=1795784261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
        b=xc+/RY6mE5bOW4O6W5gmg4gOu1k2/kFtnQHpgVLHJtgbPGIRhrKRwoGhJrhblCxn+h
         CzjDJ2yuxJGPeB1SYPdsf3M8s2oRmbU9IFlDdFxssBz3l+8R1vq0JIajfQ+6AIHWny+s
         qijpk6JuGsHJEAjwF0k4VzfTIflN5H3cWa2UvDgOdYW/OteghkBjgq3dkzjjgPIRmyrR
         b7TEvcxwf7cXtTOe5Je90WOZqLekoGgMN5EV7tbjpSVmJn8BcMfdPQd97aIwEQef2A6N
         qPsWgVZNPxkdkZ+bk6HMHggZzp3xEyzgXyHsGhjMBo7MSDddugjn9q4LW3umHiUENL+o
         o7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179461; x=1795784261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
        b=GIIwX3trIBI9ZLjNzHi27wpRC7qbjjqVJDWUgN7xFy9iG6jBz27PDd3N/GA3BiZwx3
         7Qfl5Ph3z4+bIfRVbfHUnZiTc3cKK+TPL6avUfNqbIMAu1jv9e/BWIQU5xMBGE5G4N8S
         iM2KflcTZbSUDgTo//xhbqBmRSZw1GNEAUe3ecGT21wJ13M7rw+bK3JuNwVEVi075MTi
         WX4yveVD5p8X6iS2jt2ytQfBg4rCs+LxCR7SkBEZGkueJOQ4pLA58eLK4BHlJY8wxWpu
         iO1MaRyA3JiRnbpDoJ9ZOPwRDeSaTKInsv9OFzuIlbMEmJQKU9KdzFrCfcIV+aYq5Zbt
         +LeQ==
X-Forwarded-Encrypted: i=1; AL+hErG6b4UGb7Z6ZhoQ0F2dM9isE1kpJOOt7r+D8uXws5F8lyhxD0Ux+UtBLhsMgzG5VDDVR5+/CntfocRuWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wbw/cNfGVxWgd13MZMeQrLmuTPmZSOhPKQCSLwFQ8UNQJ6wch
	N3/59N1Gf+y4WAArq4lfUysu3pPkfYfheKo+YbVgF5XNUBZe7XlUrD75
X-Gm-Gg: AZFdTZewzWgJ2wjbyA1ONoZaTwiJoZtHEuSog3OsuaR5bX7yyqRDMtdKZfcuNHxWpAf
	B1+DXpfUMnmgGaESfIcxIvSve7D5oX2XqTqE7aZe9pXtgQVuRgxAF1Jd+Hh/KVwaUxitml5lJ0j
	MPu6JmGEk36AG524gC21pJ2YFkjjhkkT89QsOkvn7oN0YZnZeYBQJ+0eR1bFidiHrZZbfrZ+n/A
	apne2+3Twf1e0KhPfhYgXukeTw1jo0XhmSL7OyowF1lR33N7LuStDiiWbE48FVCiHiLEA+gUN8J
	6hDfsIAp2YewZtVewQiUF2JlXcxrTiW8/JrlU+HuqE50Qz0d0OicJkZiS81FHFDM0ZZKyFD7Eu+
	LvCyW5qW/JPYF5QZhde5NZwQtsvDEri6CwdpWl9TXFUisR/GIab83y1vOivVLURrTN+Tv/BP9ch
	yvj0tNBvslKJsajXaAcWgULXllatAV7qQ0NDM71QjWAMnnhlFDxEIJuMEohv7EXGfTNwFuYdehl
	RwW+SHnRCVhwRdXWIzNVMdIQzphaBfg/HFMf+4ujNyf4h9cxwMbgn/dqVF1mvBY4+siVb+OGtsm
	ej3Z8/hmf6tRTLduCSayASgc2MeoTNNrQBzutMxOch5VVJVGyJn/Et5PPEzrGCecr7+p4DRW
X-Received: by 2002:a05:7301:182f:b0:385:cf42:9b9b with SMTP id 5a478bee46e88-385cf429e7amr1916243eec.8.1795179460450;
        Fri, 20 Nov 2026 04:57:40 -0800 (PST)
Received: from akhil ([61.0.85.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm10672548eec.4.2026.11.20.04.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:57:39 -0800 (PST)
From: Akhil Arul <akhilarul324@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: shenghao-ding@ti.com,
	baojun.xu@ti.com,
	Carmel@aperio.ai,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akhil Arul <akhilarul324@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781-spi: Set tas_hda->dev in probe
Date: Fri, 20 Nov 2026 18:27:29 +0530
Message-ID: <20261120125729.135171-1-akhilarul324@gmail.com>
X-Mailer: git-send-email 2.56.1
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

tas2781_hda_remove() is shared by the I2C and SPI drivers and uses
tas_hda->dev for component_del() and for the runtime PM calls.  The I2C
probe sets that field, the SPI probe does not, so for SPI it stays NULL
from the devm_kzalloc().  Unbinding the device through sysfs then warns
in component_del() and crashes on the NULL device in pm_runtime_get_sync():

  WARNING: drivers/base/component.c:839 at component_del+0x149/0x170
  Call Trace:
   tas2781_hda_remove+0x16/0x60 [snd_hda_scodec_tas2781]
   device_release_driver_internal+0x19e/0x200
   unbind_store+0xa4/0xb0
  Oops: general protection fault, kernel NULL pointer dereference 0x1d1
  RIP: 0010:__pm_runtime_resume+0x1a/0x90
   tas2781_hda_remove+0x23/0x60 [snd_hda_scodec_tas2781]

The same path runs from the driver remove callback and from the
component_add() failure path in tas2781_hda_spi_probe().

Before the common library was introduced, the SPI driver had its own
remove function that used tas_priv->dev.  Set tas_hda->dev in
tas2781_hda_spi_probe(), as the I2C driver does.

Tested the probe/unbind path with KASAN and lockdep enabled: without this
change, unbinding the device gives the warning and oops above; with it,
unbind, bind and unbind again complete without any splat.

Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
Reported-by: Carmel Okun <Carmel@aperio.ai>
Closes: https://lore.kernel.org/linux-sound/AS2PR02MB10038DB2CE8CAE659D35B9F1AC8792@AS2PR02MB10038.eurprd02.prod.outlook.com/
Cc: stable@vger.kernel.org
Signed-off-by: Akhil Arul <akhilarul324@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index da71b57a26e..4bcee8362b6 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -781,6 +781,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 	if (!hda_priv)
 		return -ENOMEM;
 
+	tas_hda->dev = &spi->dev;
 	tas_hda->hda_priv = hda_priv;
 	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
 
-- 
2.56.1

