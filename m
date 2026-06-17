Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7943DA4E
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692825; cv=none; b=qbp9LUnXW69W+Vy1EPD7t4f+Bp3GBMti1tR0moKr/OKQvbB6q08eZrMDfsceQVS8NB7WeNZRN2NgYSxuUfOosRwHlOkG9cZqi+J5O3RKUDbzIyo9RseU0JqtJ5Ls6dnnu7/UYdBKloBnpBdCHdg/4kkJfk6glmO9pJBhszmKPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692825; c=relaxed/simple;
	bh=hnVgSVk2XjKkHVJ2nHstb4qGftdMio+vZ/e9nU127qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Job+zorKE1w2WYzX4mHYmEyNjale7xaZnI94COwK+MHtyBjzC4lAC9O/bMvPocDJ/mLEmKcfB9CV+ra/oLTAiBT1m2UF/LxUv94s06jRYCp42nhux8vzK8EmzkwgWREChVrMuDi7T8ZznuhufuZo7yLZqgM/1oEDeIGMMSpT7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5YCGavW; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5YCGavW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-307d0405e07so8462129eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=A5YCGavWfemFBCzA7KGzlFjUsv+F2mC0aMTQNKtJGaN8Oct/CF21+SLNxLsjIB18kB
         gesOXKYX2ZtprOqPlQgq6mv1rrIYszjcFh+8wyTVr8QnuKQ0EFAomXoThn51ym6SWR41
         SldpjJOkisJWfB+nxxug9NlQbxMxOcFYeiPTBDtl2Jf3IB8z4Pqb8nT8jENFAbK6iR3+
         xeJUXzGuomoqrpZGrorZF3LqbC06dbtwXQRZ7v9GqmYRiKmS114zjhBDminnDmWHymrB
         vqFdXDznDncF4mElhzl7wb/ZXeXK46bvlTrJ96owP1AMMv48252+PPdxMM5fBN52P1to
         7ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=p8UW+QhDtd3PG/ZTm0GHuZK1/ctk7zMKcBKmd1corDBcTOwQ1F9zmYYnsrDV+HRrOp
         bEAUEFcr74cuZKNKPstdFESjs6nKSm0PF6LUcPXTVqZasXhw68wYIfxDoHJgdkXECsb5
         oZQChgT/KNAvA+YslJpVjs8xIdK0et44R76jA2B4MetB15gEq6sPgJ8CMLMiufgLI5A5
         GzsdM9LhkT5TEXi2skTi2EeD0ocDo7X4FNhI9xnX4+OJcq/1hpNJxsLnpheoaVr9eQv1
         3BBiqQhoxvDqukmXEgIyiZSNqSD+A3SGTKgb5Dc+kIaJavI9A/aqno1T3PDdXZfbctFk
         MV/w==
X-Forwarded-Encrypted: i=1; AFNElJ+h90I2iXTKGQJlEUnQlRe8HOEVc6ZX0bemmW84v5CmUpehrIVJSSkwYRtyhdB3qy3WPPwyA5Pa0hdlVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbHcQVod9g8RWwrQPFQYtnR9WVCOtFjK/nmTMZw28bIFu2UQE
	3M5M8zNSghfVeTJ6YAlp7C5gHWWB3nbUUcDpJv1WiXADtnScb2jraOoX
X-Gm-Gg: AfdE7ckH0DiO+nQbbyLNFhyoQjVXDhuhSDdqjNw+dZEThKe9isEyDe9eEFp/ZZbQEFj
	zS9zGaHRoaMZ4YEMWydKKgI70VbjPhEJcci8OiOLQqzGNDmXsltyNpfUUUtLoBUBOZElGev9MFd
	0NxFkbIQg7RN7TL3RV0PB/yyJ0EH2c5rVhOkk8ce82M4+yeSZ1xo3XPprXAg/D0NcMfHsKWMi35
	lqp+kEqoydCPlbOK72CMvSH+mOYDGojFqp8KjtBVfbffcPlidyR/1TvQhTNFi1N80ew/zJemYSb
	x1YiEsoyJkNfBybojlZrhtkz3wRepXHIxyrYzgoi7PcLI0jg5TwKN/wG1f/FG1I6iEb3h1HpXo7
	mXKViP4koL409lGu0rgYMssqj57StjCGLYbMxen0yNBwiAimyef5FlfaQo/W7uEeaCzf12Gjpto
	4roW58ouZAwayCPxs86A9R+AZt5ZxG3Sj8JXhkJ7Y8vWHdBh99n+z3Zuxu1g==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0

