Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6541A762
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342837; cv=none; b=VQ2PCmb5V+UAIDAkl+xwgrDSFTk+ZF2rkgBmAQQP10lKPg+jO9BVFgDSlw/t44mIEn0eA0o9xNSzp8fn+UVCr569FdIOEUcMnAIgzFWuL3mO/0dsM9WYNVk34lQuudP7Y4eXLJuhIFjjGcqpU19qkLz1brQwCJulp51ZYxdUVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342837; c=relaxed/simple;
	bh=SgafSM+EQPguZfkQHsc6kCGrGqgI5C0MV8ji00rsMUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G8ACHIqP4M8pT5ajR97S6KhENLCF6nI+g7DkU1owacCVqm1qk6h87gKTN29C71A3baqPS7j53U8KXR86SqAsA7Kpsee+J9iltxAV2pjPKj1CKMfH7QekLxDJQILMA7xIezzwZMFB87BeE7rzSLh++GNl3xMfRMVwvEP4+ZuVirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoxJj8YE; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoxJj8YE"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso2150301a12.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783342835; x=1783947635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBqyNV7dq1ohKzmYnk+loevfX7z9FulC1QcACgXGXhE=;
        b=NoxJj8YEqqfkQ3/rWskl4qsDwvQSpGJ81NOcV/hp8JgLmIbnCot3qfdCkrlaaVj1JN
         GYP8Ld1q5TGQeTgan6/tj21SiK4wek5/XR1l8m3PNjshKgvxJoR2N2TC4l65x+UABkss
         p4JmIQbegCxp1+GlR06NCCYGOX57uvvTtFoZ3PtIgSGrn1NUV9G6WHV0FZZJtDOEHCAJ
         9xnKntPypYJAm3yazv5KpMi5cSOyMM1apm5zJAULR7FdQoabpJdFH4Smlp3kR0LTIyNo
         453cJMH248MXjTrZMq2y2OCPp+D7fSclfmDvYQaGspzR5q7LOmeVUTAGsVHpvdVg+lul
         iqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342835; x=1783947635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBqyNV7dq1ohKzmYnk+loevfX7z9FulC1QcACgXGXhE=;
        b=k1Ahuyl24YCUmAMrxPH8psK2UacYFdb6E5XPbiB8EUqW4/idKWtbQPOC6Oq0SIx3Ae
         OaGhfNAa9s3F5EUvuYcVvRlRmiU00U7TiyJGF+RA9uELGUGjtUTUZHyru2DfuXkvpAbk
         LmHyzWW6Vgu9J30SxK9m3ZUyKN1toGV4EZruByfZHoq1Gs3HBI+GeDYIBMI1gxvjwKHM
         iTix/6o/ot8yT73gx1AjIPx4htj6Q5zqusd82fmtA2BvTXZ0c1xTa/EIUqm/7AZswU9r
         UPU1y9rsRxVAoyvGtT16TVef8vofm46NIC/VjtB5y1auQgzdfkzPIJCuzYWXOKjyw3Xv
         uRyw==
X-Forwarded-Encrypted: i=1; AHgh+RoUcJJnNLBc/Ey+uPDrphcE+yg/zc/Vpyqss/P/8nHGNlPkNFwBuO6j+9WBiEnxtYonoT8HdWLh7zVMiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNd9DalcIV2w+KUawyyS0mWyEkd1K6DxBtXSvhAgYs8qJkXIS
	fLc1G1ehaeLwDGx7fX0BSC+e4q8Z8rZiDzdzSj1AA9LKxpnbSzVRKFDq
X-Gm-Gg: AfdE7cnNH9MGyLCHazM08YWxr2Dm4vMHm3U7JLRNvAuOSm3a/GtLiNZG7rLBz7gRrEW
	1NMuxvOTwj+bfx41W+9LRPhUBjLNyL584cjKg2mp5zel8c3arftiKlR1Me9JE9BMAR3a1WUPs1m
	A+Qm5TiVfsv6p/ScsPbyIuIOoqLdYQj8ohfmN4RW33U42OWN3Sk2X3lqz14Qs5B5xsQ8dA+Gds7
	HMJn9YP5yFK6m0gVMIKySahY4UE6Mdj6lSOdvt66wJjNDOUJ80nIGspENRRyknzNU9j6FBbkxyt
	mrdj67/OFixyhsVTxr3BpJlXjrf5hw1qHBv2uSTrvzbeZUGeVifYIo/qxdyEZVyXdPj5PBj6h/M
	ICaql5qbaOde4Hz2XCBhjHPqTL0spyXf2GqlcmBnjeQkdzqTGVoIE9eMLoDK3WWiIpirfJ8cdcI
	R0SCU4nM4Z5n7wvzItWIUOweI639WDXMlOlvyg7/vcvR+hJEw9cg==
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr603245637.54.1783342834712;
        Mon, 06 Jul 2026 06:00:34 -0700 (PDT)
Received: from steellegend ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm52766903eec.12.2026.07.06.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:00:33 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH] ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup
Date: Mon,  6 Jul 2026 18:30:13 +0530
Message-ID: <20260706130013.71862-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tas2562_parse_dt(), the fallback lookup for the deprecated
"shut-down" GPIO property is broken due to a missing pair of braces.

The code intends to reset sdz_gpio to NULL only when the lookup
returns an error that is not -EPROBE_DEFER (so the driver gracefully
continues without a GPIO). However, without braces the statement:

    tas2562->sdz_gpio = NULL;

falls outside the IS_ERR() check and is executed unconditionally
for every path through the if block, including a successful GPIO
lookup.

This means any device using the deprecated 'shut-down' DT property
will always have sdz_gpio == NULL after probe, making the GPIO
completely non-functional.

Fix this by adding the missing braces to scope the NULL assignment
inside the IS_ERR() branch, matching the pattern already used for
the primary 'shutdown' GPIO lookup above.

Fixes: 7cbf5fefabc8 ("ASoC: tas2562: add support for tas2563")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 sound/soc/codecs/tas2562.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 2f7cfc2be..e1d62f304 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -675,11 +675,12 @@ static int tas2562_parse_dt(struct tas2562_data *tas2562)
 	if (tas2562->sdz_gpio == NULL) {
 		tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down",
 							      GPIOD_OUT_HIGH);
-		if (IS_ERR(tas2562->sdz_gpio))
+		if (IS_ERR(tas2562->sdz_gpio)) {
 			if (PTR_ERR(tas2562->sdz_gpio) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
 
-		tas2562->sdz_gpio = NULL;
+			tas2562->sdz_gpio = NULL;
+		}
 	}
 
 	if (tas2562->model_id == TAS2110)
-- 
2.55.0

