Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C13F1643
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781117; cv=none; b=XIvwEXt7M4ESR9fKjGkjNEvghi2KGPVAmyJ1tL/MwcAnep8s2qL0MpG6idM1U+gTyHO3DFrBBC28zL0CiGV2ATcxhmgP4oHVKkznYHn83oEMx77VOCQPzdxljfXP//yp7J1sBokvQ0NMraw5KVn2F3TJkpD660XbCLVV+LKfHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781117; c=relaxed/simple;
	bh=AWgAFvAQViYaJeMV1jCt940qM9vOdEKhz9JyUk2u9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPuXxx51O5GeSKXOxWKcumlQh0wwpYWI5lPmkWxKL6V3Pt9DmO+z6iiJpdleU6o7F/MiQ/+sAynyn0Q0iL7RXFBS4FHZ6PWM1/jdxJ+qViFHJqHNhSASVc9hUomvQUZoTZh7SIaYtqrA6CGmIQVV3RLnDjyWT5y5BmFIxmeQskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcJynABC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcJynABC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1cda2b17so4854775ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=VcJynABCq+v9JSZhdaCerbX4qRURPMt7x+r50O1YQ0Z6Czzy01iHSTHqROuTisp4QF
         77hoWRJm8DyEQuHyfi/nOdw/D0Z4xxJoaPsw1GX4zCls21UxLxegKyue3ykke7uE6luT
         NpTHBar64tpn315hJx5ritbtMC3zPOL8TmmBUu5u26GjDdYf+h/JzRw0PtcG9ruekkvv
         RZRNZPE7hZdCVuidC1gxTC9xTiQhho5lpFA1NbLFgeU/Ae900Bm0sDvRTuLlUOo2kr2v
         zfjIMhw2J9RWGzd0fxYBri6SL+f7WESfEYurBPYYfRYQ9+7235NZmRIzhUeR6NZ8qJVt
         cX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=aGlsrctR5LQ/G2PXf3kvnLQX32DQZwvDcNhgFe54I1FK+melPu5ehz8tPbKirlxRtS
         rBB0S8hclCSNA7RmrT8mYs16x8PxtjyXnsiWCQ1sCwuCDztJw0pa6a2mTySdVAQec6t1
         5VxIJT99GonAoOU4e3htThYfBakU0mqrZJGolzgJCTyEF0a9ubw6hyRjIwQEFmoqc9y3
         EQ1uz9onOpF/F0lvypEueuIYJHZCV6UQ0FdL47Uqi8eTDVhMC6RRioZY211LsSp9P8lg
         wahwjhpwBFiWdhY7bwHgmmk5e90hDWKIfBI2dG9X+m80KqKGR2gQVuy4B5qe9OgW/7fP
         Rm9A==
X-Forwarded-Encrypted: i=1; AFNElJ88d6jT8QhxjEV2yU3aj00XX96AMZjhUyZYRskRBx/6j9CryThrwp3It7wUL7ecrEwTQS2gkWVRE4KZQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywwuQs8j4uzHHvceI3bKYEZ7dfPv/qCKkJ42H72pmscpUihp11
	8azGX8+lmRlFgGpruBp7lfzeqXT3y/8om3FwzinU9eiXoIR6OnGVWa4N
X-Gm-Gg: AfdE7ck4P4qcJ3cNfonQ00H6/BPnyY/eZ5nhL7ZLJbsXCFHmbMM240Ryh7G+1UCgemh
	2/gnEFqYkPsTz6pBzGxDDH3m0WDRwd0PMdfDHf8XrUC4MUGBi4wgiL3acji02BDgJMC0Rw276hc
	4OahN8Q+zSxAODiOuw4eP74lKJpRRcGT4ATQCsH9qGnkmcJQY5jaDrQ+4CgwdevDcQU1nCCNdPT
	VCps4h9DHc+0y/izNApFbSMuJn8vzmauh9tN+VvS3wf3VRC1mTCLbv7KgVidYlGrLMV77kBz+xL
	RpMHHv0JdQu5sKO3J8jYwwzw3SW3ZfTozIfnroQqWBY53qQFukKEzwhoPxvFTT+c/M1kWYrEbij
	rINY19sBfr+uaodJM3Vby2oi2IYQ5XMlnQQqWOeAYmJoBNAZajeRvwgbv0cJHmpVGdqFsVfklmr
	jm0f9S+OZraj2RHF5u1FpO+FH+2cI8VkPA9DPZ2Iv0GncE0NM=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

