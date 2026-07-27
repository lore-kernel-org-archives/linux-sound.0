Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED04C92
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141342; cv=none; b=EnclecLn5dTw6gyriJkN1vdUMg+q5u+Sa2SQIAUQGWBJSRR8GGLEcRiAhCeuYbkxetvq5a6jzVl00TmoPDTUSeFASQlwU+heTmBJyfxgJhzaQQbnqSpxJxHSk51cyS3UX/u/E5MfpfL8XLxibH5rBBisx0/a0NgBTWwdsgc6b2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141342; c=relaxed/simple;
	bh=bA7oj9ccwe6Kzir9n2mqdfKZfY2btLBru5dHxfW1sgk=;
	h=Date:Message-ID:From:Subject:To:Cc; b=ghS0uexLVaLDifO9305x5HxB4Ccn641pTtVBt3vCiSvjsygM6JhPCyup5NRmKSTiy/JxiCUwkO7Wb7QvJHyuo+p6O9vvWMK3u4twch2VxHmHOMtuccaipsyZyKYLvLUK7qsgqEP2eRNqM0B/IJenJrEvYS7TQ2UBkkystD2okks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gugzACQU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gugzACQU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b01146b205so1426979e87.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785141337; x=1785746137; darn=vger.kernel.org;
        h=cc:to:subject:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/gkkUAnrF/aaJnhoiRj8xjicaVMcuIpBr9vNF3q7Mk=;
        b=gugzACQUQ28zrEOgz8bkk94nfxDyW+8rDqRtNKy+d9vL+EWxlH7A0a8C8q45xf1xQ4
         s/MfPiyQbPFJpKPiwnQfwpUQBaQlQHdsS/UTIoZtrVR9rgHfwH6LA4UarlYl9O67yz3R
         OiERYT/7ofluOWicTl/ejlxRiN/Bpg5Q2uL4thdQFiJRDGbI/4oWitj7UPifJnD8sCI2
         VCtOV5tuZY6soOmgb5apvjou0ZuEkREBkWOT25krD8fpHUyroF0xYPCLcqXzWM6G6kvR
         ra6i32gb1lDiSeNEI+h7RW5U0+zh3pMGxaiOMt739r+Cne3ShdZcj3Y7X0WYO/pw7z+K
         DSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141337; x=1785746137;
        h=cc:to:subject:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/gkkUAnrF/aaJnhoiRj8xjicaVMcuIpBr9vNF3q7Mk=;
        b=pdCgbtcoECpcTByVTdaD7RlTvxzI3hqfRtJ/uYkr8wcGQBLGmiCIBlC8JGtTCqnjy2
         SeoOdVQk9tPMoV4cNsAbfej+qZERy20LWqXlXvFe6NCu24nKHfBOWBA3y5bDLK9CYh/c
         FjZqSj1oE8qrJB97qk4D/wD7yFMdD5+9fQM7HB4pt5Ld4aL51uDWZXY3Sc6r/vHnCg3I
         l5PNYHJ2I4EATRroAtxJnCQx9Eoh9m7IhF/foDWp43oWQ/mj/sM47yE3zu7gtCLigl4F
         ItFJxlpFf9rzlyXIfdm1U9UrZBTGTm0ZdAyfo6TVdEuZfiJOT271bVQC/TCVV7sWsUOm
         y/lA==
X-Forwarded-Encrypted: i=1; AHgh+RojTzizGR5LbI69cZop2qLCA1CBG4UAFMtqa8682wOMm0B+ajL1y3WoJuc2mJvUBCmQLLfLA2KrVTFg2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vHTCr+bA6t295/SQ8wfO8cs4irD9NH90l8wa04wq6k06Nunq
	g81nUpDjvuVO8rmxoVH9Vux8N3EbIeC7NxC/vUfALTT1T6aWFvu0g7si
X-Gm-Gg: AR+sD13xkk1FYiDokRbdz+mO0hpMgSzRTFnnnPYMu3oLEWsUj4nfvFaUSgVTpIJTa51
	ZrkAADFLCVBgi/gyEBBxQiYNXG5vEPqovjPs+wsQdcrKHtxo4CBzUyUeFTFuDqs/g/hj9bHPlLk
	ite9AphqXqXSPhBte91HaAHrGsWRG6Tl5+9gXS3UKuSkvcsqgu9FK5YNZ6MMoEh5mREGTg6H1fY
	fYEmCGH3KYfz0Noe7TXC1BLkWr6fxEEmvZhFG+cILf7JmrClCJIwlahEn/RXsMA+TLHx30uXOeR
	SLJclJbvfECt+1H9DpR/ZSRphdqm0Gb2YYQ5rADGkcaPpBzHP4IuKWScGz9m6jQ11R0leKuZVDU
	GPCfybyGoP3oxIINXXZy/lLJvB/9eAfKxm0N0MiNnZxZWPI1hFFFnPwScxaQVUCU1EfHibK6W/O
	4=
X-Received: by 2002:a05:6512:ad4:b0:5b2:a397:734 with SMTP id 2adb3069b0e04-5b2c1b6af37mr1779897e87.53.1785141337125;
        Mon, 27 Jul 2026 01:35:37 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be089e8fsm1278968e87.32.2026.07.27.01.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:35:36 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:35:34 +0300
Message-ID: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: [PATCH] ASoC: tas2783-sdw: drop stale regcache on uninitialized
 re-attach
To: Shenghao Ding <shenghao-ding@ti.com>,
    Kevin Lu <kevin-lu@ti.com>,
    Baojun Xu <baojun.xu@ti.com>,
    Sen Wang <sen@ti.com>,
    Liam Girdwood <lgirdwood@gmail.com>,
    Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
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
handles that by re-running tas_io_init(), which soft-resets the device
and re-downloads the firmware, but before doing so it syncs back a
register cache that still holds the pre-suspend values.

That sync is useless, since the soft reset immediately wipes whatever it
wrote, and it leaves the cache claiming that the amplifier is already
powered up and unmuted. Subsequent read-modify-write updates - DAPM
amplifier power-up, SDCA PDE transitions at stream start - then see "no
change" and skip the hardware write. Playback runs without a single
error while the speakers stay silent. Unbinding and rebinding the driver
restores audio, since probe starts from a fresh cache.

Drop the cache instead of syncing it when an uninitialized device
attaches, so that later accesses see the real hardware state.
regcache_mark_dirty() + regcache_sync() is not an option here: the cache
can also hold registers outside the SDCA MBQ map, written during the
init sequence, which the MBQ backend refuses to write back. The sync
then fails with -EINVAL and takes initialization down with it.

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
Based on broonie/sound for-next (asoc-next), i.e. on top of
0d6b2d6f93a6 ("ASoC: codecs: tas2783-sdw: Propagate regcache_sync()
errors"), which touches the same call site.

Tested on 7.2-rc4 plus the ACP MSI-on-resume fix 5893013efabb, which is
a prerequisite for the peripherals to re-attach at all on this board:
https://lore.kernel.org/all/466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech/

 sound/soc/codecs/tas2783-sdw.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index db58c50e8a83..e62470671951 100644
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
+	 * soft-resets the device anyway, so syncing it back is both useless
+	 * and harmful: later read-modify-write updates would compare against
+	 * stale data and skip the hardware write.
+	 *
+	 * Drop the cache instead, so that subsequent accesses see the real
+	 * hardware state. regcache_mark_dirty() + regcache_sync() cannot be
+	 * used here: the cache may hold registers outside the SDCA MBQ map,
+	 * which the MBQ backend refuses to write back.
+	 */
+	regcache_drop_region(tas_dev->regmap, 0, UINT_MAX);
 
 	/* perform I/O transfers required for Slave initialization */
 	return tas_io_init(&slave->dev, slave);
-- 
2.53.0

