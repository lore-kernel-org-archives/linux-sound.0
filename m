Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A404C8FED
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629765; cv=none; b=r1jmVyNwZcV2njvxNpyNxNlNtk9dYmlWIKqUHZBFpi50Dtvayjih4NNwt0iiNS6rd1baRj8dct/dOgDGLTxgETogHqmhmsLBEsmPaej0L/fNTDeUgQjXy6cx/WHjJMu52JllJGv6Fx6B0m+tII/NH60beC6kuNZFJMI4nJK8zYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629765; c=relaxed/simple;
	bh=aakMWPqtzSC8d4xUEjViRQdNYsjBJ/WN5Zv10mvjTN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXS2d6O+SVSwOR1uCDHeQ+O6NA5spSuYsLSIh+Yruos+jsKVm7v+xa/KHQG3F7n/ZnI4eAd5jocJtZCucGiyFUeEvs38bbkEIW59ZTPxJEm/8AWGsglzFODX1huVTZx8L9qfHFT4zxHM/BS0qqi3pzWMJ600E+xJPHbJaRvXpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW6Ip7tB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW6Ip7tB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso83773485ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629762; x=1785234562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=fW6Ip7tBCcZrq+8wko4zjafSa3T/eOaI62j1RBlPmqhOAvXRxLYAR7UaGQO8i2iMKQ
         oWHOFH1kshkZ5eQtDSDRG3AIFLPqZNguuvEIty290Cip0xUw89vNG28Z6F+WE/RliQ7y
         srbOhw7L/n2JJV1BQw1NOKb4TZOhOA+NjKKTiFyyRVgjJjdalguMzWr6bUdVsiWJttNH
         92pMMEy3dbaZpZOFIpJSwpgifww47bXO1GimNb2d5sBZXLIlPpAL65h/vOb+7S4etc8o
         JPNr8Dk/H6LvYQ7/YdRoaIZY0rSm6YGlsv44g+1bObwRFtZijn4G8N1yU18aYBu4M9Dd
         O8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629762; x=1785234562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=dA4/aTIepQ+aR3oG0IB3lXRyejSVH6Q822sFtUo6I+XzKwO7Kq6ZZ8z/Kf+JVed61p
         5OU/CEPbDTAm99hP1FocT6I1KLMYxYh1JoQ1vduV3XOQZbI9PleNHR7mX8/uR2IKRM8l
         33xn0M4l6oQiHo/YUvPYNTrGU6T+A1r8FBUgU3kg5FARUzpJuHrfYm2Wm349Ok50XG8B
         9Dn3yydicS+Gydvxhu8PNsPFoH2zCx4sod/CB3f147P8F1iYvMRSS36DPHevWi6EdfVE
         kYLVnwe5ceY+eXNbW4gArbsfnCjr0BaxCv0UpF0MxldWv0SfGIvRiRcKcebHClCMtMcY
         DnOg==
X-Forwarded-Encrypted: i=1; AHgh+RotJkzse/4MbxLFzMV4ayIEld5I7RqRVELkrJujV75A0AVjRPQ11ZItAg7ewozR/n3JW7SuzcUGAzEw6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlnD1ankUzryjL7IALkfv1zSkF0RZL9oIBy+2PgjphsX5d57U
	0SJvTqFo/QWQqStF2F8CSNyu6tO2KniivmQcbDKg+sEnWrvUP6Oydpfr
X-Gm-Gg: AR+sD11vwoMfJpl4exRrbSSMYr5u7pwm8hnEqPvs4CdGInw9nwFkOzYHjteqYELKgvi
	xzzVzabeOLAMU3ttI0eSQwdo++T6l7JtuscaQO9X4zuC4Q1bUiLcrhOiGBcj6SQrI4P9vMDGkVv
	zMfN13UPLFpWMuRHUNrk0gcFAV0TW05TAjZe5w/KpKbGqPhu8OuqXMlPRjQ28GHnGnktKKsb8Tg
	L3VSpwCITGkQkMh6s+yZ9NRvjDm/FRXMeiEOZ1iB/9TgzX3P/gbccglgEY6NWH5RzURr+YqzHLF
	G4vqcIg/t1hpqZa4h8fRiAuE8uuMlzN+FJd8KKT9jpMsenV1x88uopBluRfwVVeKc+WdpgfatRs
	lv+nHrKQ+fhriVdDRX9DmNn0tuF5hM4kJeQmMVm/walBMpw6QHoKsNsYMIl6/7mR60gDdnAIrAi
	rWiyu65pCjq6QvPDJP0I85rz7Hs5AKOm4i1PoY
X-Received: by 2002:a17:903:a90:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cf348917fcmr180302245ad.16.1784629762301;
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 23/29] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:54 +0700
Message-ID: <20260721102600.523199-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bb449f08e30c..3ba0cc37acd9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -415,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
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
@@ -499,11 +499,11 @@ static int rt700_dev_system_suspend(struct device *dev)
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

