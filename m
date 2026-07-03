Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D6368D70
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058222; cv=none; b=iU1vjEsERLXCKbsEW7tk5D61v1P1T324WW+EaU2c/FQ9oMlEpe7BTU2hLm/eWz17Le5XeZ05upvUFDzicJRcjLi6xAI/p1wVs76CbxfApW87Fe8s+2OlaBrX8rY2bDb9e5bsUIoZMNJmopyqu/NxDVgsKTv0SN6i4K0Gq/hm1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058222; c=relaxed/simple;
	bh=em96/ZARght/3otyju63pfWEB2uPboKH1/9p2lcucSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrX8IeAuvdJAPzUbUrbcmxKI4RucIB2GBRX10Ggy9M0q+icfhkRBLxw7Lzh6XDRipoYBR6pmYZ2L5gva3ILj5iimAUG+HAVESjo3/Q2xg2Kp9uFeqPKuTxNjw0o308A5gpTHrcy6WiNr+yuT26lYbj6NAlfTFvgKw58fQ5QPw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J04hMT0A; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J04hMT0A"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84780c95e2eso122175b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058219; x=1783663019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=J04hMT0AgvGomY+o9LwSfsHQI56j2s/qVIiLULtJeqQyeKAkJ0ViMGb2mkz0aFcd8Z
         6qwCzAXRuKkE/UCakJaquhxTNdrLwUCO7RgjMTh+dKIaTdCdDVY0OdJPpIeXBbEPsHye
         NYOmFysikeKnjFpmxxVhrJTHCKKZc1P/hym9jJTAf5iT95ss8xI91QnnsJdvnAgntXsT
         APaDGx3yLo9hAPulvLPuuwR3USLEIE0XN0y3KB+/fCyOJl/eYNl9SYWK1M3jqB+XPngR
         twiHE/umUkujm0Cj8BeE3ky6cyPQdS+/Y87NTAQ8GtNQXntFFngOZJ/F8QT75ktWfiOW
         qkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058219; x=1783663019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=M3HCMdxcwVZ/rkfsKa3ggbOf39TRn/YkkVUFuj7ZrwjLR5DypSaku5QJp3B5TIP3kI
         36Bx62xPNon2PykU+bjFvtzpOeQc6fdjLlxmAix5Q23oIOUu7QU6eXc86S0TFY5AF4Pj
         O+oUP/7vnv1pGiiiTOuN1MgKmgEQDUHNeISPlpVD5dy6tv72vYAQZ9da5jjl+ZY5HzJz
         igar8U6Ks6o2bkVVJYTiFLFbL6eLulzydnRYfOlojuHDzZnYpTSdASk0YzKwo2/qJsjl
         USnnoWHHolhDYI0YN7eQSwkFWaY1zp/LvC9K7jTuL8om9oSxiGJoeepPYbfHhWW823uK
         FWJg==
X-Forwarded-Encrypted: i=1; AFNElJ8yu6xROQwBy/oOOC81uQgP1SW1bvgLFDd21R65MFkCcJ5QeRXHtyfGNUqwCkFOqyTMWlcGeQbZcOUmNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqoB2PHquYQoHUa3uOG6b+RIzYVBcp2lRZORDXu9Z0PTFwY30
	7/IJy1mccF2c2G6L1C8j1gBJ4WVyEsfMDYYmjgixCLNRMXCTCCkWk8+d
X-Gm-Gg: AfdE7clAJqB7PxZim+VLxYvljviM3Umd/ZwKlhyHK1ggwedhC84iBIjFj63k9Zz17Q3
	mQgGiqr8o199TKqa59qbM9LjCdG7MyuCatnUsc/d3UAXz2+J157WKFkvHGPUGu3aLbjUolBwruj
	P768+TkZaaHgYAR2oCb+PS3cHG5jfhVHgPj6cbXEbcfn8i5cZg2KwJqqpFQaTxSD6nk2cUgEgdy
	bqMaVFl1PlrN5NZ1YVtoAqxPVyddgDe11+3k1IQ5lHIUD9mZqc2O7U0j03iYLK1IWnPkR4cpaP0
	66kG7ZWXNped0jiREFkczA1+ystHK8KBFfivMwfA1EaR5Oq/aHHwoVyea+JQDE3NJuqmIC5CTi/
	dj/A+Z8W2Anj+2bpPHub2D4/kcOlFdEH6tOYSkIJv+rKkrq3gVvuO3J4IxEGmdYoPnRh/toSpP7
	62sXsLN4lqaq1mVJcOqXAyy3GXsxM/nBew2X6cLo6HL0hA/Tk=
X-Received: by 2002:a05:6a00:9286:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-847c5140069mr7767376b3a.37.1783058219463;
        Thu, 02 Jul 2026 22:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:48 +0700
Message-ID: <20260703055355.244898-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs43130.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..48d88dad4ceb 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -6,6 +6,7 @@
  *
  * Authors: Li Xu <li.xu@cirrus.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -818,26 +819,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +882,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +989,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
-- 
2.43.0

