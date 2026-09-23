Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A83DC4CC
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153051; cv=none; b=nnOpghyKrPPACkkQkjouHbwU0p41XtLWpGgz/p0MU8EnedGJ9Fg0aoa6hQ0CqUm8RAsickrtTaxma2L//QACt4MFr7nisdI+DPuk+dUkChId4j4f5QC0fG7azxNbzBVF+mdbrl3OUljG1eD2FeEY+qiI8WkSomRkKaGU6pWAcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153051; c=relaxed/simple;
	bh=8odcg3H6dhCFDRMQCvgsCqvdtp2JXMTsaTwkxPBWRLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+f4CjpIwCm3n0ArIN60dNhE1KS3zUFFqD9I0LT3lG+iJptiMCznDkseAPDK0biMxuOSw20nHX1pwrGU/2hmce2+PMq7dlaCiN3tSOgsJhEaeVxbGr76bBNxaOMcJxhetjPb9qD7V49AMg77Y9igAypht1Bn+FUfWjyMUb/A2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuO+VMcR; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuO+VMcR"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso602850a12.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153049; x=1790757849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=FuO+VMcRUoOqKkLT+zeCzJJa0TnEHdBhupvLmu49DbMMZh3ZYBr5VSR7MxN5oHxAg2
         m5S7TsUQVCWkX/+hjT0+UsmMPbfm1+NV/Ctq1qrkeyZkeyZs8YWWU9gNFLdglfIPKumS
         zt1DCt2obKpk7mGQ4XyDgOaz+kEfVYYiVD3PGyKJNkEUVNgp9kZO692o5aVok6ba9ifK
         bKZ/DKkGmbsBkSkhPFY+FIpuo29r3Hr0bb+g8IYewUVvavDQW1l9x445NjB5oJrUxSpU
         TJ7QHnb1+BS3SysFrjiPmWzvpa59sVFWpcw9lVJ5gSVmVQWxh5YZK4YlvlOFartdV7Un
         mjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153049; x=1790757849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=fKIg7bAWhHyu7s7u5ldE4z+QAxXueQnDjEFPYiKGcbE17s1BT61isqbP7cpMwQLWwr
         Z6LtSNgvONr1oTIB3tJpUEsbK5w+UAKcKHGN1Sm7rHDTJZDgoyzRqVYO4NNpcmOS+PYu
         aC8O+iY/nIZD6PYU5IdRQdWVP04+Zt2kR+bJS4UN40B1bKESfS038oTf9MSU7vrzGQR4
         CLcda6LicLd8yL1OVvH5Vc9yWk3dO9eYTDB9KvEUcvQ9msVEeI+CaT2UfMMS7VgldsvV
         aLRSqwMUQXpFKVowOQDa+HXQ5VV3HNU0LXFmKnEX+C93IIuoCA1qkfR1wycRS2iwyy3y
         +QpQ==
X-Gm-Message-State: AFuF++nTnNIrGmO9rYAeteSvbr2GAoD0YhkKR7fze+SlULGXHOdEjXGt
	oKUK16JbmvrLKl2464l7uOjjXasLHhGErFYLbPav7/hybrFarMlpsdyHelFWZW5J
X-Gm-Gg: AYBFou27FOmfwAtPu1Z0yJ8hoIJVZwupBdcp365eXuaAPapt2M6aRbJv/BeTAEceGrF
	DlhWh1rkaIEgquEqBC4BrcrwWzktN+P+MbFjzcJ03eF8wQivtQznMDcQf68J9w9ljBO3jVFXRfr
	G6xUeYzikN7vrwn3zUklYH6FAQ7rMMKHDnKdhQBJqD/v17A1b6YejyWGAdRaOyueShNyJdBGQvm
	lDOR6yQwjcJd7AX9kVIJFytgDdb3oLMeqvFt4Mq6A3lWkDkqJaV9VKBQPXBxBUpPDMSrvxRftop
	QlA02VXN8hzMJ4C3nw8kMZyxUdxqnSljZTRHzC3lu33BCRUaPgw3zMHFPTAHgU2l8rzzAr1qC2A
	OWY8v2vCPR+SEVgL36BTSuO9SJyPOAAPqpzC3BR1ys9y3xGJ0b4IJHz/syeFBxzV4j+GctW0jgl
	oDDJ2s4JdWLQhFcvK6CL3S4MEQqudnmN/Mzy+BL5h+iVp+JLxjLzRVgALTFHYuSY3NEE2zBT5pG
	unMq8cSCim3Ax6dv5ghYHTXsVXnktgHwDHS8aaC+hWEUN63lSWGzNUaqCWTrCvx9qbwM5Q8xu8e
	QA==
X-Received: by 2002:a17:90b:5825:b0:39e:6c68:c77d with SMTP id 98e67ed59e1d1-3a07e6b5b65mr1774611a91.51.1790153049477;
        Wed, 23 Sep 2026 01:44:09 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a088cf5b02sm1534349a91.14.2026.09.23.01.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:44:08 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: claudiu.beznea@tuxon.dev,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mchp-spdiftx: Fix a deadlock with the interrupt handler
Date: Wed, 23 Sep 2026 16:44:01 +0800
Message-ID: <20260923084401.65336-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mchp_spdiftx_interrupt() is a hardirq handler and takes ctrl->lock to
serialize the user data and channel status updates, while
mchp_spdiftx_trigger() takes the same lock with spin_lock() from process
context.

Interrupts stay enabled while the lock is held in mchp_spdiftx_trigger(), so
if an SPDIFTX interrupt is delivered on the CPU that is inside that critical
section, the hardirq handler spins on a lock that the interrupted code is
holding and can never release.

Take ctrl->lock with spin_lock_irqsave() in mchp_spdiftx_trigger(), like the
other process context users of this lock in the driver already do.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -306,10 +306,11 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 {
 	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	unsigned long flags;
 	int ret;
 
 	/* do not start/stop while channel status or user data is updated */
-	spin_lock(&ctrl->lock);
+	spin_lock_irqsave(&ctrl->lock, flags);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
@@ -335,7 +336,7 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 	default:
 		ret = -EINVAL;
 	}
-	spin_unlock(&ctrl->lock);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
 	if (ret)
 		dev_err(dev->dev, "unable to start/stop TX: %d\n", ret);
 
-- 
2.43.0

