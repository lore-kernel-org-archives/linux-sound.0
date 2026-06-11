Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2B3CF956
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179167; cv=none; b=NmfJmdp4ii3LhDwCXEFruQJ5kypjz1yl8AQRWkqbGoX6ErEPPnRkcz+8ro7KSbjRmtA+nqh2kFdGQLBvCw8HH3cm9s4y++Bp9+biga3FgLV3yYzxNfBGus8OsZgYIa+W4H53f3yYunxFT5RD326fmZyIwBYXSZ2Rm6Fty2Fcqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179167; c=relaxed/simple;
	bh=vi25XEu1sF+jOIaXc/grDw2feH5w6qYQI13j7om2jRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6rrNAx5liYPbioHH6QMypFExLbgoy8OpVN5HwlumNd9Te4TDkhaPRPAPRuiTvivw6qXmSzpNKzz9VhzhUIZ1d5sPuBUTid7jAAZLgVYM0F35oH9QDI/zWAvqK5+/B0THUS9QwCDxC03F99P741sDm9eTw6tx39Fe7HQXdbpoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A01d+jhf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A01d+jhf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-372b4330deeso3314786a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179166; x=1781783966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMAyNgYYKgrvIjUGXFWHe6VUP6LQKNFMxvm2nM30n3I=;
        b=A01d+jhf6M5IYqffY2lB3d9PgdAJngkZvAD9RCTCLOdG8qBwe9hoMx4lX7vBX4ENIq
         HrBu3AsWCHneaGxXka9o0ENsFTsh/h1y6TKrEb4eg1sa6Qsz3Dl4Vzw0sHmJlJb3/xz1
         3Qe5lg/VlO/1/gJEKdWh7yJQvB1g/NXlc9WdB3eAXJvMXUeD5Rq0R4NJtnAGWGnT2uio
         6T5gz17XoKIJtmC+YkWnbp6NWEEG1UqU6wJWaZMeuO04l2V/ySXe3L6mM6g7AqIA9BKF
         dq2KkkPDwARVWKI1dv+lgdiV1o4XQt5dnTROLCkiAQHCFR4ZpyzaXcNBjhuNlaVJDm8c
         0lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179166; x=1781783966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMAyNgYYKgrvIjUGXFWHe6VUP6LQKNFMxvm2nM30n3I=;
        b=j237eMszTrvQu1e1RWiV4gE0LGHSLj3/P7LTszXCANYY8AtGmkfUpd8abODRFfEoRs
         QPj/INVpjR8ZfZL+x2e5+TydmVCHiBiRfQG8Q1zfnWx1qTJoyDBrIyyHrS3VD3dj7YG8
         k4QmDep3Yj714QAjfIARQT38/hevqVZMxvJ5v7GPfPc82fKj8DXS4juomIdeyBVwy+e+
         4zTVKGpOI4vNzG7aiWyj+r6mftn64DXRwThHNIUherOG8jaZfqKiO55f59nH4CdRl3m3
         1gdIM3s0QZyPYqePEHiIOz0tKDHs5w0Cw4IwszgLFq1Lqf1msyCjIfMx9J/2m5M0LFDy
         Bk3w==
X-Forwarded-Encrypted: i=1; AFNElJ/kVHEMHtKXVUrOZ2lh1yvYOaAOslAW3UW3W3Inc4R/kTvU+hYZj5nfb3Yxt7lKXUVvGsmogGmxG+dXwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ0nV8bAMBlZM7hfTPc93d/GEYOy0pii0lpUdi8eG6aJOOLypM
	snl6kyrd61XL9c4D4io94ja7dmFMpONimM8vBEP4bw+Y+b2m7E3f3aWd
X-Gm-Gg: Acq92OERcFU1MYFRpe3iVCvx2dcaZBz5aS+JTP40rlyyiREbIeFje497p2RLvc63fLJ
	7DbV5+T6Jcny5CvdCIFnJo3kpCpAz39QP43ByN8/qtWezPqMreBt702OwkVz80+rtirLvswT2mK
	V6A6kiv0FVzBwRXUn77OtdQ79budKdmtwZifJ/7k+vjqgNNwf4g8m00AI5xIxOSLYgLS3am/DOr
	lBcXtUsi5e+jtQNQ4Kad9dAvNRaCfYyISd1ryfg7Oum3ehPs6b8eRWwQU4948DkxcrQ/AN7OPIi
	3ilTXi9ZdPkOfs1fl16Ai1BmgH3866f/huBfClI0TPc58gc9THtIsHLGUeyE8Phf3HClM6cv8Hu
	W9ety1nO+Xj4EFJo9IaeMfSKL78Zq8tMxX8tapdf21ZzyJXiS4nqDrSrrXURK8Q2XBPFXt+d4Eq
	jVbYN986rQ0J7L0+fOc8GKgezbVpIH6FKZTsDvQ8FOwEcUipVWKin0wAGMYsFqizJAvDUkr0VKr
	W1OpR0=
X-Received: by 2002:a17:90b:51d0:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-377a78ad1c0mr2814921a91.19.1781179165652;
        Thu, 11 Jun 2026 04:59:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/20] ASoC: Intel: catpt: dsp: Use guard() for mutex locks
Date: Thu, 11 Jun 2026 18:58:43 +0700
Message-ID: <20260611115901.80438-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
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
 sound/soc/intel/catpt/dsp.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 677f348909c8..1eb1591213c4 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -256,17 +256,15 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 	u32 mask, reg, val;
 	int ret;
 
-	mutex_lock(&cdev->clk_mutex);
+	guard(mutex)(&cdev->clk_mutex);
 
 	val = lp ? CATPT_CS_LPCS : 0;
 	reg = catpt_readl_shim(cdev, CS1) & CATPT_CS_LPCS;
 	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
 		CATPT_CS_LPCS, reg, val);
 
-	if (reg == val) {
-		mutex_unlock(&cdev->clk_mutex);
+	if (reg == val)
 		return 0;
-	}
 
 	if (waiti) {
 		/* wait for DSP to signal WAIT state */
@@ -276,10 +274,8 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 		if (ret) {
 			dev_warn(cdev->dev, "await WAITI timeout\n");
 			/* no signal - only high clock selection allowed */
-			if (lp) {
-				mutex_unlock(&cdev->clk_mutex);
+			if (lp)
 				return 0;
-			}
 		}
 	}
 
@@ -303,7 +299,6 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 	/* update PLL accordingly */
 	cdev->spec->pll_shutdown(cdev, lp);
 
-	mutex_unlock(&cdev->clk_mutex);
 	return 0;
 }
 
-- 
2.43.0

