Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86137376A01
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793828; cv=none; b=obOgqeggV0OBDolVJq3i2dR04vYEFAxK7tO+hznCNacNSqrOouOS/D3qX+Vk3S+1TmwzlvSzsD3COEXZq1VTUTokAOxaJtAX4aYiUR8EcnDZmHp0sDw8wIpPPzZeiIs94FT/9NaN8oykcotZcc/AWYDkVDpe1jDzpzmuxfe6yj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793828; c=relaxed/simple;
	bh=tQJ0i1MfjTGpgskD8LkZJQe8cZ1L34361W7BOazpZNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ergi+N5OLinXINGnMJe4QMuZa0s0xJnydqZoOP03CoJcU7CPBkcHCIQkB78vgcfrya1f+FTOosxzRyz6kA37/6DTzLII4h18bqH84yxM0d5Mva93QxzkaFXm36hK2j9AFr7/h75JZuZzO7WrzqQlw85zKxX86qW43VLEYjAFUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZNGZHV4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZNGZHV4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b159850b16so1768669e87.3
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793824; x=1787398624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8DJOAERut18sMiiQSBR+SS27P0WTvLv9LFTZmBTo+E=;
        b=TZNGZHV40LXxHRBx0w3bzrQMcT8Y0YeKXHRlmJkMdx7ZmxH2IbNiTyt+tJg1VPMQjo
         JGzCfXcF4FTTi64Y+s0qo6XPa89T6f3inPJ7U/E+TU0wTaQkOCRFnM2b10WDMSVAZ2LH
         96AkUokn8GbWvf9wlSWiCHmRMnwQal8qoIfwUod+GzWdv/cBX717aQX9FNtWikxomMPF
         5TZcO4COCCY7yeeOl6sCVyJTXeKD3KZszM7tFkrVqpQtgs/+1sXnMcfBA3GxLz4g467h
         3mXB9ixi4LxvBRt7JZi5eU1UcOI8b/+zeMxIEKlq4F2w4lK8qoFW/fj/2QcgpyfW08EL
         V9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793824; x=1787398624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DJOAERut18sMiiQSBR+SS27P0WTvLv9LFTZmBTo+E=;
        b=W/krO6s/I9JZQ6td/48KEanYGH8VnXIagZgUFRSLjjaH3Z6lmon2KjSMJZu1VAm5Xo
         qG3p/wQZzqKhyqO2r/4pobSoZRJ5OhPBRJciPNKcNowZM6eR5stJAJcQOPVs5E5MPEyS
         FhTk/yH/LE7kuE+TJCl2ZjcBkYJHRqY34JVFZbVazjsJ7DOzcdN2ylM/FcM/SNcazKfF
         VzwJUJt8wmjIdYBR79EmA4T82nCP7rvX5l6uJ2W0taI+bRDtEj6pycQuuwCEnOLXfqua
         IbRkbENXtDFwUHC3FrFftqRc0N6nyuHl5xnFRuk5xESyNRLhmmxOTDpDhOT1taLe80JB
         yX5w==
X-Forwarded-Encrypted: i=1; AHgh+RpuOO6vDf8GCHL64Lzbl8NSoqRayN8WbWU6aPSZA/z77U1CVCtgy1tep2QhBwFaX+Chsj5eDnm4ccZtHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWiXMwyRiJb68cN1zV4UD43Uw/84W347JBIvWkzT0dAaD+NqJU
	LS46ifupKwunU13buaP9AlAAJnoFKEgSpkHtm1+aAlfOEqsH1C5jZIcp
X-Gm-Gg: AR+sD11mdsx3jptu0WOUljIG5ZbVGoCb28YV02BwBWpWtzveOW+CR6tAvr14kJA84K/
	hCXBBYAla3lXDmA/Tf8ySZY7fMYsL5sP1atraAwavxZRR9yBgpIBM02cSKfqLDTiY40u0beUIVd
	+BzzZngvVjv1XyoXUdDxtP+na/o3f+cVWMGMQztexEe8RQlXT5kD1M2rj9fhov9uMF46CCHHRGJ
	HeOQVdBg3+Y/BJdIRlP/VzMN6ebvuv+HNoSOP6DMsQr1sHfUsmFHHbeE2FuRwwuvGJEVYTvAQeP
	amkL9Ew19YF/JEE04rmACjMuoMDt3JOkeIRJ+27LM+NXgxHuukiR99wyICJZCieDa/T/2Fp2od5
	lYkFSERrYNnSn3O0E4yZDX0Yc0KfXrW58b71B1tWsdNUnJSGPPwGahy6J6bAiSALse2aoHEWUmB
	24Ya3iJSUSC8VhmPNj9kvN/17X1FI2T1uohbZo3ivCCksiGmFqHAaPBAJSW/I7PBmn541TRdZS2
	L450++VyIKKIiIQQVBAtK4T760IiMjoZw==
X-Received: by 2002:a05:6512:39c9:b0:5b1:4e5e:559c with SMTP id 2adb3069b0e04-5b45913b876mr2072844e87.30.1786793824145;
        Sat, 15 Aug 2026 04:37:04 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0ab08sm1070598e87.73.2026.08.15.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:37:03 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: tas2783-sdw: make multi-byte MBQ registers
 reachable
Date: Sat, 15 Aug 2026 14:40:00 +0300
Message-ID: <20260815112000.4180-2-andrey.golovko@gmail.com>
In-Reply-To: <20260815112000.4180-1-andrey.golovko@gmail.com>
References: <20260815112000.4180-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tas2783_sdca_mbq_size() declares registers of one, two and four bytes,
but the regmap is created with val_bits = 8.  The SoundWire MBQ bus
rejects any register whose declared size exceeds the configured value
width:

	ctx->val_size = config->val_bits / BITS_PER_BYTE;
	...
	size = ctx->cfg.mbq_size(ctx->dev, reg);
	if (!size || size > ctx->val_size)
		return -EINVAL;

Both regmap_sdw_mbq_read() and regmap_sdw_mbq_write() bail out on that,
so every register the driver itself declares as two or four bytes wide
is unreachable through the regmap, in both directions, and the failure
happens before anything reaches the bus.

That is measurable.  On an ASUS ProArt PX13 HN7306EAC with two TAS2783
aggregated on one link, a regmap read of XU22 Control 0x07, declared two
bytes, and of XU22 Control 0x12, declared four bytes, returns -EINVAL on
both amplifiers.  With val_bits widened the same reads reach the
peripheral, which answers -ENODATA for both, powered or not - this part
appears not to implement them.  So the change makes the registers
addressable; whether a given peripheral answers is up to the peripheral.

Widen val_bits to cover the largest size the callback returns.  The
callback keeps deciding the size of each individual transfer, so
single-byte registers are unaffected.

The calibration path needs adjusting along with it.
regmap_bulk_write(..., buf, sizeof(u32)) relied on val_bits = 8 to
spread one calibration value over four consecutive single-byte
registers; with a four-byte value width the same call would ask for four
four-byte values and read past the end of the four-byte buffer.  Write
the four registers explicitly instead, keeping the most-significant-byte
-first layout.  Read back over the bus, bypassing the cache, the five
calibration values of both amplifiers are byte for byte what they were
before this patch.

What this does not do is repair regcache_sync().  On this machine a sync
aborts earlier, at a single-byte Control - the FU23 Mute of channel 0,
which tas2783_reg_default[] gives 0x1 while the driver's init sequence
writes 0x00, so the sync tries to restore it and the peripheral answers
-ENODATA - and no multi-byte register is reached at all.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
v3: new in this revision.  Written on 28 July, held back until the
    read-only Control patches settled; it is the answer to Mark's
    question on v2 2/2, which cannot stand without it.
 sound/soc/codecs/tas2783-sdw.c | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index caf8fe1bf4db..b657ad031306 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -564,7 +564,13 @@ static bool tas2783_volatile_register(struct device *dev, u32 reg)
 
 static const struct regmap_config tas_regmap = {
 	.reg_bits = 32,
-	.val_bits = 8,
+	/*
+	 * tas2783_sdca_mbq_size() declares registers of one, two and four
+	 * bytes. val_bits has to cover the widest of those: the SoundWire MBQ
+	 * bus rejects any register whose declared size exceeds val_bits, which
+	 * would make every multi-byte register unreachable in both directions.
+	 */
+	.val_bits = 32,
 	.readable_reg = tas2783_readable_register,
 	.writeable_reg = tas2783_writeable_register,
 	.volatile_reg = tas2783_volatile_register,
@@ -667,9 +673,9 @@ static s32 tas2783_validate_calibdata(struct tas2783_prv *tas_dev,
 
 static void tas2783_set_calib_params_to_device(struct tas2783_prv *tas_dev, u32 *cali_data)
 {
-	u32 dev_count, offset, i, device_num;
+	u32 dev_count, offset, i, j, device_num;
 	u32 reg_value;
-	u8 buf[4];
+	s32 ret;
 
 	dev_count = cali_data[1];
 	offset = 3;
@@ -683,12 +689,25 @@ static void tas2783_set_calib_params_to_device(struct tas2783_prv *tas_dev, u32
 
 		for (i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
 			reg_value = cali_data[offset + i];
-			buf[0] = reg_value >> 24;
-			buf[1] = reg_value >> 16;
-			buf[2] = reg_value >> 8;
-			buf[3] = reg_value & 0xff;
-			regmap_bulk_write(tas_dev->regmap, tas2783_cali_reg[i],
-					  buf, sizeof(u32));
+
+			/*
+			 * A calibration value occupies four consecutive
+			 * single-byte registers, most significant byte first.
+			 * Write them one by one: these registers are declared
+			 * as one byte wide by tas2783_sdca_mbq_size(), so a
+			 * multi-byte regmap access would not match the layout.
+			 */
+			for (j = 0; j < sizeof(u32); j++) {
+				ret = regmap_write(tas_dev->regmap,
+						   tas2783_cali_reg[i] + j,
+						   (reg_value >> (24 - 8 * j)) & 0xff);
+				if (ret) {
+					dev_err(tas_dev->dev,
+						"calib write to 0x%x failed, err=%d\n",
+						tas2783_cali_reg[i] + j, ret);
+					break;
+				}
+			}
 		}
 		break;
 	}
-- 
2.53.0

