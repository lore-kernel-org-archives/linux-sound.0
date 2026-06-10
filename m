Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4D3F0A96
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086863; cv=none; b=F/WeW+q+SPnn5+2MF4r3Goc6nNWfrK1PraOPHpcbIvv9R7ANKaEJF/49Gsdtvqf3H7ZtsnuIAUkuq+zudCTK8u4qMEWignwMyOCaUG93pAqXywf9wXHmuVvRacYSW1HXXegjmCDr9IqhJu6Tdnk07fqjbYx+q2e9v3+TQ95Uevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086863; c=relaxed/simple;
	bh=oqCFls7mvbDi78AmlfEIReCmwgy1BeuT4n4FaEn6K+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtHF8CrIZ1Pro5S1KARCyj62rvqjS+rRKXg5XgplXUTNmbt0LlhbHcLuz7T9qBFDSfmtAgsqjPEyzjjpz1eWedbirOlqGUFwGiE6kwtZiTnKbcpiRjAEobvLl6a65u8/dJtAJkmttcCNTWbe0d3vJZPOJLJcDZXp6YrRpqU3Gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3Ty1Ml+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3Ty1Ml+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c3315c5dso68727425ad.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086861; x=1781691661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=h3Ty1Ml+Gfq0CZgQ2mXDqHywLwgtfJ5zrIbRZw0SEwwBPJcAT8wsgqOsv2DLom/CT/
         oHHrA7O8SJ2rHiKYi1iiTGmWE9HY6M4C+tw2HIWQT0AC/3YgVKVpUyCYmWaLQ/A09AhJ
         9z84yDMCJK74kUha3LSZMeBjHmqaS/C5lMRnyNzRfTNREJSek74mudNmkp/1tpP0RWOK
         gJNlebEdUKq8Usx0aPc3LyKGy6UjuuYskKl5VFXr5UDDpkm9WbAB8yu4JK8KOWRf1egq
         FCp/Pc400xswVtzP4LTGVT7yMOHMBY+YSSt7Hg8UXTZV14ddyDnZDZJUosK+Tfk6xpNB
         q+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086861; x=1781691661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=eadDc8c+ez5t6NNZa+6iCGGdguZ5ZxsVBr2u+iW95cf6SvQ9vppWCDV/v+n8ng0Gwo
         jyamSDmMauSmIWEvhFWDf9aIcDLjLnyriAiAP6t/JxUKu1fU6v4kbGZHBzQMCLtGOSCt
         d1YmIOnH8fmfq3cRBkKmg6iIv+PS2sJ9WgOcIJLA+JFetaiXlinYSEChOZMAuAi2DbfQ
         158kOuGGPLtuu9tn0jdhFWpIIBFwWSe4LY2tMMAW76J4DccLMVS2xlZCtELLl5iKftd1
         mHkTu9BKysEgqVWPTo2NoT2IHvrk8+BytY03fsL5DpoKO7kGYiPLmx6hZbAL1rPjHczP
         R6GA==
X-Forwarded-Encrypted: i=1; AFNElJ8jkJ4uHamFYay433VaY4Z1kQGTIv+E+2dCBcLS+dZ6d5F+R6yHCj3ULU0V6tDBL7bTFt4M8dadsEQpdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFW7l0sOt49hf8AFvCGqMIS6RMSn0b6z285k/mDXXwMIsvO+Ff
	gpNzLiLkacsUHTJfytcPE/T5vecvbE53ig7Zf6TLrg6qDOELN7Yt8L1l
X-Gm-Gg: Acq92OGiaCrPNXr4lHgdqGUxPYoC6Ygkccro6wmKMiSrihj+GhAmwofvP2vg20X6oHx
	0xbZhtBYcvrX3L9BLQ7NvyZPC7JI7Vq9i9yeq6yvZBe/1NQYYR6sNjBbO98CdIkh+bZhEp35l41
	eQpcG4DK52xDuyS/NIDUwnE+kv/BX45QUM/Op7gZYIoeXXaIxz8NBR5LBRoS/KHiEsrf4IPkyyv
	0tQPay8TPydCKLuGkRbzI+cpF1wf7QSNBvXm9xs5NR1PI/ebBmzTNTtx9/2J0eOdTLHYv/seHwa
	tJ4UOSnqy3lHZQZv7z1Mt+bY7Mrj6lkbYTFDuIzFZMpPitQFNP9aI39oG9chubz3pnMtRtDGFw5
	KAH3hDl3pfYawHx8MWjl8qQ4BOz1g8L7g3rsepjdchd8M6O0L4LaJsd8u0Ldo7YAPkiGBPocEBZ
	Nr7gLZvjU2F0U96FoRZgRTC1QS/HYiNZpl0PqtJecnIEoYs9qt9V97Xfn/eDnWO+QFj/knYP2t5
	8uIjjU=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr310019635ad.1.1781086861478;
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:16 +0700
Message-ID: <20260610102021.83273-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the explicit mutex_lock()/mutex_unlock() pair to guard(mutex)
to simplify the locking logic and automatically release the mutex on
all exit paths.

This changes the mutex release point from immediately before dev_warn()
to automatic cleanup at scope exit. However, the affected path only emits
a warning and immediately returns -EINVAL, without any further processing.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index de5e1deaa167..b993ca2dbd7c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,7 +208,7 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
@@ -296,11 +296,9 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 		}
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
 		return -EINVAL;
 	}
-	mutex_unlock(&gpio_request_mutex);
 
 	return 0;
 }
-- 
2.43.0

