Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104962EA468
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898099; cv=none; b=Vhks1RtGs1YPJhguTjf3O7SucvFvf+3n2PMuIa5aCBb8gpcQ0xJ+INWOiYj9cyy+PYmTJy/nZKZzwgffYTt0cn5uLGm98pZfe5vXEi5MK/kTmJp0umbWIQij8OC59X1EtrT8PFpsIPN8yAUYTsKMQpPPA3aXqG/jqKf9rICYj9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898099; c=relaxed/simple;
	bh=CKwM/9o6XC1frP3TdHZrFXb08H0reDc9OwuOpAhOYG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXD3xJsKW78KujJZ3plPGITHmu2l70s1qlsbfwEAyu8pJ56zd2hYJ1GvAgG4f0TGlcyu+su8wFUP6nFdboQIHwVqFap/Ev+pAMUSTL/9cuwz4ZM6tUP925jiDAKoNd9eBJzgMKWRshF8awmG7BjsLukWPcmvgykEBoVMKqwXUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dugPHRUr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dugPHRUr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso461068a91.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784898097; x=1785502897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWSzgoADyXumYAGz6QoG8y0ywKHUqveo6iLUqIscNv0=;
        b=dugPHRUrqcDuhbd8VLtOsusr6GloCZiAUbpzohatcuOU7eTGwVW6CWByzWhQFeNTFD
         b8qMWzosd8CE8wlWbShbuVT4ydehqBrBXosoySk33KZYKOJ5oZIyTvaTIM5H5GcWB2+K
         jnQ9ODtH45GMgDBA0OhbiDcYhveGWneIVEfTBVHoxKiwqFeAmD1BWndltSXQoChPsKbU
         8I6BIWyu5G1XSgN75fu2nxPLBF+dqSZYrpGZWExXZpjm4op0uFFW9MnlbjvsCTymifJ3
         0GwOmKgDWGm96vG9CAeCCiY4J4BXGyFPfzXhRyLscyWhufGSAz6Hu7clciBB+FT1pgl5
         5pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898097; x=1785502897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWSzgoADyXumYAGz6QoG8y0ywKHUqveo6iLUqIscNv0=;
        b=oJkkW9i8OWG+nrON5cGhtZON9yavfqlxRPukMLpNebYBNkypzYiq2TR58ZDLLAt4HM
         Hg9VZWNLCahM4LrF1+l2gIS2qIYzyYR/mb3bq/N8a0d0MtsYrMpMts/+ag7GmRhVuO4R
         peEw1wBXCEkFx0HbCvAXdpxSZmgcS9cr62XWyGJrJpafAycchlBIl3Jc0CaIoHQ1DbW1
         jveE0BQG1st2Pc7Zd90wmLBHclJIM/A1Yeew92jSkbLgdIvv5s1GWLfJrNtI1EWz7Vtm
         nXjjNHGnT4sDqDExD1COgTBwoFLmUziZqoTzyTmFuR6PSWkh0eiFW1JuhBVOdx+3mNPc
         1JhA==
X-Forwarded-Encrypted: i=1; AHgh+RokDm07eXE05djkhWUJUSV3DRlsGSCWEfJuhks8EAgpH1IyO8LyLDRoUQjZGwLORrH66ha6MtFzBF21/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1sOTv3Kih31mubj4WO2FBUDUu3n0UUG9zZ+nucNkR0VHqaeG
	BkG/PC+f9aOLd3pACGcfHjV9UaRqCkaxTExB78bzBvRdFdxz+NI6Q7U=
X-Gm-Gg: AR+sD13C5R/K0r9cCpOP0UV9CjHDVBxMhRysDtM4Lq2szGs1TSks8R2993UEdjeWngf
	UoHHg0uXVOyZCtNYGKYRiaFid7Ix3WMaQoGkWMP9UY+IuHdKI9kDA6tl8om1W9iukZAVdh4CM4R
	Yd5r4MwLhTK30xLsuHK306n9DJ2jEz4i+VyELuFkPVGwyFOcoW/X57ySRSt8/+MjyrE0486dgIZ
	fXQktjn/NXIeJ8nQBMQQHnwdoRQpmW9tkRcyzt+8zMel/KPj3f8FqZHqZhtmhv05XW1tHrk67Ze
	Ab5RaKWk626gbcdISqblVKYh80MkJpepyaW9J+wKNJCusJxvZr2XpSJM1eD8sz4aSJBtZNeCqfp
	/RPYA+NM45LxYTesFscaOcO7hkqu25RYptZpPG8tzjtqwfiFgdIsE2kHWkWT7FxtMUbOXkfuEQD
	sFGlu1I6ezCJV5SkmfN2Z47Y7UYJY=
X-Received: by 2002:a17:90b:3e85:b0:38e:7f52:c8bd with SMTP id 98e67ed59e1d1-38ec6537fa9mr7492148a91.3.1784898097077;
        Fri, 24 Jul 2026 06:01:37 -0700 (PDT)
Received: from t-rex ([2401:4900:1a5e:93db:310f:3bc6:10c2:6175])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm6521889c88.3.2026.07.24.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:01:36 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: chancel.liu@nxp.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] ASoC: cs42xx8: fix regmap SPI flag masks to target high byte
Date: Fri, 24 Jul 2026 18:31:28 +0530
Message-ID: <20260724130128.76334-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

cs42xx8_spi_probe() configures reg_bits=16 so regmap sends a 2-byte
address field over SPI big-endian. The SPI frame format requires the
chip address byte (0x9E for write, 0x9F for read) to be in the high
byte of the 16-bit address field and the register address in the low
byte:
  write: [0x9E, MAP_addr, data]
  read:  [0x9F, MAP_addr] -> [data]

However, write_flag_mask was set to 0x9E and read_flag_mask to 0x9F.
Because 0x9E is a 16-bit value of 0x009E, regmap OR'd 0x9E into the
low byte (bits 7..0) of the address instead of the high byte (bits
15..8), corrupting the register address on the wire.

Fix this by setting write_flag_mask to 0x9E00 and read_flag_mask to
0x9F00.

Fixes: 3158f585f4f2 ("ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 sound/soc/codecs/cs42xx8-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-spi.c b/sound/soc/codecs/cs42xx8-spi.c
index 2e4b8e6c4081..cf5e39a44f94 100644
--- a/sound/soc/codecs/cs42xx8-spi.c
+++ b/sound/soc/codecs/cs42xx8-spi.c
@@ -52,8 +52,8 @@ static int cs42xx8_spi_probe(struct spi_device *spi)
 	 * write_flag_mask/read_flag_mask are OR'd into that address field:
 	 */
 	config.reg_bits           = 16;
-	config.write_flag_mask    = 0x9E;
-	config.read_flag_mask     = 0x9F;
+	config.write_flag_mask    = 0x9E00;
+	config.read_flag_mask     = 0x9F00;
 
 	ret = cs42xx8_probe(&spi->dev,
 			    devm_regmap_init_spi(spi, &config), drvdata);
-- 
2.55.0

