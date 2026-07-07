Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BFE38228A
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401206; cv=none; b=pf6bpxhPiK5GTuOpewEPYvT2/m6+io9FhLYcFNUi9Vz3dNPQ0CbAp4IDFz4kCAxsiJffZDc5Ahi/tcADvw1al3E7ZVzD+VL9ESwSCmsA3srLMStHNEaTP4f06Bj1rKN4nnykO4nkBirCmGMzGYKCPw9pRDvaLPoUaowkprLDNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401206; c=relaxed/simple;
	bh=+3hlNotW4UMV0IZGCNdumn4+B3/jOqBkQsLXMj3bIIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRn/dk3UUKY03tPQKzEQtmRdOwp5FK7gLmL+rkOsmlKOUZnhqs7omGmPPPoyjPxzV81DM40nI1xr82TVUKoIeLhSlQsaNZ+Xkat5btNYdqE74ISbxorFgMr5KFE5MCCvUikdTqbjHg8olTqMZNMzzam+MHsoILn8sgN4/iendJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX49UnUu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX49UnUu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-847d1e9db22so4108653b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401204; x=1784006004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI5pXZcspax/jy+Cb7T9z6bqjcP+qI/Rnmy9ZVRY4f4=;
        b=cX49UnUuZ/fEIyxfe14MCUNjiRrjdCS01jWAO7usVJoP3ZokBk8t/dP1q+mJcDMGQ1
         hCDtexmep0tyrUXcfU+8+fPHssX9Pb+/uRiEJWxVHohcLb9c926P0DcNpqypqI6ckGsE
         bGHiPpOvfj1C71TsKQfXhmhNj3tJQSXVVtVGDAwbVEQuLqAchB0Kw7POAErcADqHW+uW
         j2IvfnHiH++O3iTiRzkM4+qiJQVQhdRQIUvKo/vPvIC19x4JdUt6Msqc6NiVkjTxob9P
         QA3jTtBIrmWFWm85kIu5yHdp1zP7fJN9cp/CZWZaPYvXRU2dRsszOgwkw34Qu7LIlJXV
         4TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401204; x=1784006004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jI5pXZcspax/jy+Cb7T9z6bqjcP+qI/Rnmy9ZVRY4f4=;
        b=q8ktwL2mxIoeqln5M270bkp+zgpim/0gvkoOnWXiYTCIGgdrsBaPSjChjf6mBz6MuB
         0SIYiut/EeFsfF7FIn9sACT2V/2ARZgmEgQgB2oJyNgSSQV19joj/j6BpshwzN3uv1fd
         Aemzp6ivtZxBOSZ+kRt/UTU9ADbfaHdZefotcJSCEEQAeV3teDuSsF7Dqjx4qLuf2YqJ
         FT8mcKU0pV9eoadQtwBXiRXlp3G7lyvp0tTCvUDCmXL60t2H6UbxHyrdLF5yWvXyxnP/
         J5Q3kut/t+NiIr0kQ5abqm5frlSxqkZwKx3Oi4CaLXJGbyFNwdzA0bFS//LfcaIZlOPa
         PcbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsqJM+FcbpNarNluUE3aoBFPMg5dgMZ+sUcQMYS7ByMS6ZH/9jKU6adRMBG8AAf1+P2Cx71dv+ArM/7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweR4+L4U9g6u5r8k7eteHsCBLqRomE3tqx5icqgeXkV5k71npv
	IDYMRHSoiPBxlHA02X8xJHOEEuyBJYsadkHpHHa28vKlClsbQoroEXUj
X-Gm-Gg: AfdE7cm1F/sm8tbtB6XopnpN7CN9TiY6+zRHPy43w6NX2c5UtNlGiiMuHk5GPl21SzO
	J6oXjFh+LXn0L+VgiMXlBdYZTHjq2CEOb5iE4NTAA6Ah/61nBRFO6Cz0hf5MGffuJfCo8j0JU1o
	4HFIO1Tq3qJqu7fGkoWasXjJ09ItBXHHQ7VJ4/+K34LEMaVKRZmlVGFZEMPgOnkG6jeQ44sWD6J
	ncPNWh3oC+l55r3uxXFjIY5tWxu4P24GfYomDptz5nyg0JR4XWgX8nKpHxI0gUBtTC4SWmN11qt
	wJ15HgwxFlffl79pJRM++IdswFb7RaAvIE35qtYHw/H80j55e8R77JOF2FTzXXjDgehwWXzQkBl
	sveK9p4AJgk6B+DtN/J03AksmDFo9a8N1iRuFh1czGHDKySzwAv3+a9c1ZsROwFLcrhl+uKCSaB
	g0T5c17Fs6t/dcVQ+71dfrKf6dn3uFMEM9JkgEzZBC3jb4I12eGX19qUQy8A==
X-Received: by 2002:a05:6a00:9a7:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-84826c33343mr3645283b3a.26.1783401204131;
        Mon, 06 Jul 2026 22:13:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:23 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:59 +0700
Message-ID: <20260707051006.20058-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

