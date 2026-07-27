Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F522ACEB
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144794; cv=none; b=fsvoGspjCkPyyw3ZEObiG7SG8OJe0R51GwCfW8OVYVJoPUOrUTJVQhzRNgPI1ywSUyzIwHlajYIG5iGFAQbJrZOHKLDlK8bnBGDRrHXkGF9WCt/s64pZ6hYqAIhTs6S2gLGuJRoAzVjzwSE5CzuWJB3ra+j5Z61Bdlq2gk0P1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144794; c=relaxed/simple;
	bh=jAkwuocgr4DjE3Sy3ICIzClAeaQckhAtdHh23gWPdIE=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=Ad7OEfleo7Sv6hJU2dznmZprpnsAt60pJDDKoJ3+BzzCIIdoY/zpZ2x1RFS3gECqI+pOdJae7wmLHctM7f4ckFVgvDcaTOTbnvZqkCdpCk5xu36SRzabUL12QGzxlthjlF9X7pgWhEQxPn48ZbPGg95Vw0RLfAfqmviMBVt/qQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwocQxMp; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwocQxMp"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so2088874e87.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144791; x=1785749591; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rn8B6xMEXDd0AWvNF791g+0BnuPh2NtuVGcs2Lh4PVI=;
        b=AwocQxMpCr7fc2kKdkew7CKI79qP7LMO6mTAA+Ty++9f8K0CAKHSBbMW+DU8NdhwZZ
         eDBNOKSqF5oCqVZLqWnX8KDcXsMLo/DwYtyxEUWND5TD9hKRM0HZY2pSpxGL5Zx1cWsP
         ZDjEmmc/Yk2lXw/tqR5s5FW4/x//WhBxBQl93lGjb33o7X2fsoFpaLbiZHLPXtfMM+O3
         igoAuF+yQ68X13KHoDndV3OJTJ0W5IGoQErtaHZAperTIl7Bjd+RGlHbQM63SSOMkFUy
         hNVSgwVp69L3qIpjJJt8uxtLUgmjqivBKCFr2coFQOynOvavRPfuc4fJtg0Rtgo1s+LH
         0lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144791; x=1785749591;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rn8B6xMEXDd0AWvNF791g+0BnuPh2NtuVGcs2Lh4PVI=;
        b=p1ZYbNAC26WVBUKTVcR6IYK2f/xznCVL5YkqYDQf78YLzZUOUM+AKe8zbL69768N5s
         5vXS798qlV1404N/bpojcxZHvdeD+7ruW2ovJTYk7azLxZIG9RJJM0UqR84EMdeqd0YI
         jHRJGW2UjJoMvCKz9cczuTJQKJWoSlyj5vJh5nSJ+aTB5L7g5/2Kh4sUOVZ4LkS40iYp
         6MUJoSDvDp4TEmG5gnD5vmB4/wVC6yQNLQzgBOKTSO4g0x2HmJ+XxK2gFUFWSinhd9Z7
         igLm17wxtJYItL1J1GtUTvJiOVyV/btf6WD3voypsP/f4dRWmOnrVcGFtEOvAPN3JgxC
         8bow==
X-Forwarded-Encrypted: i=1; AHgh+RrJh7Ds93a4GtNif8xMWbqSOwLIu2W6DS/2J8LWmsD50NoS1I2xp2RQq+gB+XOOdk+pfvLbfgklWdYpkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/dqsrCyx7bWwLjPkpxRZKcoFyRvlZClllI9TDW5R6fx8stMZ
	O7a6gFalMoyENhP+Y2hknJt+xx3bKbbgQdyGtnoXjIvCwc1eT7OaJSnY
X-Gm-Gg: AR+sD12P5OGGccJSyeBcltqW7SDrpzWpy6G2BBt4mhMGnX/5d11Q99C9QGClTi5cM1P
	JbtLqGyrcOQhuyAnoWPMtkV4FD4XSIiqxN9Lbeue8XIKq8GRdNLhudCQoem/qrQ3tqJ9B27YDjR
	YI24ypjvRj4shsZUxXRRWBShU9MwQ8FV7cxVV5W/dBiJ1iHF0cNVDt/1PksTlMyPfdw8mikQpVa
	Sa+x/Z8JFT6zbJaceCAwJphwx3qY8MEya8vzp/T8206lBaxNeBqWJmE59tk7ayrqBlSHBClfUhR
	phMJ3ynEIBPP98xwZk8CiIK1k7+RWDS9X7pKC2lURTShTOJAeGPfs/w5IOBfua6GYPK2ojReQTT
	TnNrEHrFjZ3Uzy1DUFFhQ0znxO+erRSNB0Ba8Xyru+OLmjBMtWBRdV0wy/Mvr+0JQ995NdlMptu
	8=
X-Received: by 2002:a05:6512:1108:b0:5ae:bce4:b696 with SMTP id 2adb3069b0e04-5b2cc229d94mr6424e87.15.1785144790393;
        Mon, 27 Jul 2026 02:33:10 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be203ed5sm1334025e87.77.2026.07.27.02.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:33:10 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:33:09 +0300
Message-ID: <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: [PATCH v2] ASoC: tas2783-sdw: drop stale regcache on uninitialized
 re-attach
In-Reply-To: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
References: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
    Kevin Lu <kevin-lu@ti.com>,
    Baojun Xu <baojun.xu@ti.com>,
    Sen Wang <sen@ti.com>,
    Liam Girdwood <lgirdwood@gmail.com>,
    Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
    Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
    Antoine Monnet <antoine@montane.tech>,
    Pengpeng Hou <pengpeng@iscas.ac.cn>,
    linux-sound@vger.kernel.org,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

When the peripheral re-attaches after the SoundWire controller was
power-gated during system suspend (s2idle reaching S0i3 on AMD ACP), the
amplifier has lost all of its register and DSP state. tas_update_status()
handles that by re-running tas_io_init(), which writes the device's
TAS2783_SW_RESET register - a vendor register write that clears the
device's register file and DSP state, not a SoundWire reset, so no
re-enumeration is involved - and re-downloads the firmware. Before doing
any of that, it syncs back a register cache that still holds the
pre-suspend values.

That sync is useless, since the reset immediately wipes whatever it
wrote, and it leaves the cache claiming that the amplifier is already
powered up and unmuted. Subsequent read-modify-write updates - DAPM
amplifier power-up, SDCA PDE transitions at stream start - then see "no
change" and skip the hardware write. Playback runs without a single
error while the speakers stay silent. Unbinding and rebinding the driver
restores audio, since probe starts from a fresh cache.

Drop the cache instead of syncing it when an uninitialized device
attaches, so that later accesses see the real hardware state.

Reordering the sync after tas_io_init() and marking the cache dirty is
not a workable alternative here: tas_regmap has no .writeable_reg, so
the cache accepts every register up to .max_register, including ones for
which tas2783_sdca_mbq_size() returns 0. regmap_sdw_mbq_size() rejects
those with -EINVAL, so the replay fails on the first such register and
takes initialization down with it.

Cached user settings fall back to hardware defaults across such a power
loss, which seems clearly preferable to a silent amplifier - the device
is being reset and its firmware reloaded at this point anyway.

Tested on an ASUS ProArt PX13 HN7306EAC (AMD Strix Halo, ACP7.0, two
TAS2783 amplifiers plus RT721 on SoundWire link 1): the speakers work
after an s2idle resume with ~51 s of S0i3 residency, where previously
they stayed silent despite a complete firmware re-download.

Fixes: 4cc9bd8d7b32 ("ASoc: tas2783A: Add soundwire based codec driver")
Reported-by: Antoine Monnet <antoine@montane.tech>
Closes: https://lore.kernel.org/all/c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech/
Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
Changes since v1 (thanks Pierre-Louis for the review):
 - describe the reset precisely: tas_io_init() writes the vendor
   TAS2783_SW_RESET register, which is not a SoundWire reset and does
   not trigger re-enumeration. 'soft reset' is gone from both the
   commit message and the code comment.
 - drop the vague 'MBQ backend' wording. The reason a sync is not
   usable is concrete: tas_regmap has no .writeable_reg, so the cache
   takes registers for which tas2783_sdca_mbq_size() returns 0, and
   regmap_sdw_mbq_size() then returns -EINVAL for them.
 - no functional change; the diff is the same modulo the comment.

Based on broonie/sound for-next, on top of 0d6b2d6f93a6 ("ASoC: codecs:
tas2783-sdw: Propagate regcache_sync() errors").

 sound/soc/codecs/tas2783-sdw.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index db58c50e8a83..f96a53a08175 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1216,7 +1216,6 @@ static s32 tas_update_status(struct sdw_slave *slave,
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct device *dev = &slave->dev;
-	int ret;
 
 	dev_dbg(dev, "Peripheral status = %s",
 		status == SDW_SLAVE_UNATTACHED ? "unattached" :
@@ -1232,14 +1231,23 @@ static s32 tas_update_status(struct sdw_slave *slave,
 	if (tas_dev->hw_init || tas_dev->status != SDW_SLAVE_ATTACHED)
 		return 0;
 
-	/* updated the cache data to device */
 	regcache_cache_only(tas_dev->regmap, false);
-	ret = regcache_sync(tas_dev->regmap);
-	if (ret) {
-		regcache_cache_only(tas_dev->regmap, true);
-		regcache_mark_dirty(tas_dev->regmap);
-		return ret;
-	}
+
+	/*
+	 * The device is attaching uninitialized: either this is the first
+	 * attach, or it lost power (and with it all register and DSP state)
+	 * while the controller was power-gated during system suspend. The
+	 * cache still holds the pre-suspend values, and tas_io_init() below
+	 * resets the device via TAS2783_SW_RESET anyway, so syncing it back
+	 * is both useless and harmful: later read-modify-write updates would
+	 * compare against stale data and skip the hardware write.
+	 *
+	 * Drop the cache instead, so that subsequent accesses see the real
+	 * hardware state. Syncing after the reset is not an option either:
+	 * the cache accepts registers for which tas2783_sdca_mbq_size()
+	 * returns 0, and writing those back fails with -EINVAL.
+	 */
+	regcache_drop_region(tas_dev->regmap, 0, UINT_MAX);
 
 	/* perform I/O transfers required for Slave initialization */
 	return tas_io_init(&slave->dev, slave);
-- 
2.53.0

