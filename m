Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208F44CF44
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515162; cv=none; b=pzrVzxYuXpvU62GKWQSFgLi75EnEFxvvobhH//q+61cfo/fD42GiNgi8wNQR8H/74sWHS49BjP3X+hSJ/lgb0sKTASPmoI840GTuw7frBpBjwakgKO6xAdJWz05LLYeZ4cfaC7OTsRNaqdJIy15GAeRCgK1s92GRd8ORQCaVmoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515162; c=relaxed/simple;
	bh=fj6i3hoRw2lUGwj4QnJCTFx+3YmWMVmLdvQ2+3smyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1yw3X1F6J/iepQHhWfW7pEwQcsdXVfNpmo0w1kQAl8zDvgq6RgBhHH7qALfjdt771vpOw02sZjAaDeqZLKPrajbs8YWfeAxOYGtxPSohHEGpuKJ5I1WFLuctqjBM71liFNn2dOzLkerpGvBX9hwmgIJd9CItN9h8qUvx/0jq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkpDycZA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkpDycZA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so519821a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515160; x=1784119960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=jkpDycZArL8LHgFaq/D0Eca1cIGPVoniSQREdTnYjMJ/QuxOT90T3ZQ8aXL0paz4Uz
         bfzIkZRrYrI3HsY/3S8EbWAYNGKYf3C7zdQl2D0iUF+kdc8yYOH0keUPeq53ENAzszkl
         VhAkVOOXI4t1xMeg/xli/cxRpWf1Mmq/EfayRFtRBPylaeBipdVVV1Hz6jz6Dhs6O+VQ
         ZapJN5AK3ZGcADCm5xiaIC3ujB1IUBaM5qTZ5/qjmx0FSx/BZ8/1t5jzq6HKHAjUGm1+
         5aU1B0xptjlEoBOAzIAx1T2br+EYMRntQ7n/+NbWelOBNU+7on83WpUpHgaXD3QPbvAu
         qc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515160; x=1784119960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=mAzTYAU5IiuiKY4E98+i/+eLHxQug32gvN1yV+COezdlWIiwFJUN/n5uLdudXYqGYj
         u5a0P0n3W6LlbRo1iEwDakp3rn3RFxfOci64VlI0qJ0f/LcwFH/xeegERKTm2V8yk/57
         tFLZbpxqwlcOOLQPUXdo787vOe4MeTatxGLEIYCZbZ7Gj1Ond3F09/dpmLL/txdW0gjV
         woD8d0hxviPUzm1ppIy64dbSg6CICXbRMfnXOfbmchEE6nfvRGVlu82Tv3Ob1JoRF13m
         EL+hHjJh1/7vLDcfHOprOanN1psHHG45CsD78wL/sx9wskYQrHBwilrV/3azWAAVU01C
         j0Sg==
X-Forwarded-Encrypted: i=1; AHgh+RoTv0AYyntqGr+TmP1xGiEjApBPxXLrljnjoNs0a96flYLi10ZXdpZhVrww/NuOSpwnX8DdOFmnwqP/0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyheuMMRmPeRLBqnJL/gCR4AOL/ibtlZt/YbkRW0QKOlavdl8wi
	bglij5sk2cpnU2iY8rfzE5Ul6FPFbfLfwrXU9fBA4O2BDCQippsYB5PY
X-Gm-Gg: AfdE7cnuUmb6GtUBu76Z7soTD88fsKlasKnE2tM2HTt9RFYK+WND7eIawgT2QBxL5VJ
	KIwdnB8IFEYdoRwyDkEFmh3MBq9E4Sj4ZzOq5eRRPGF5pIOHWphuCepKbs5HT19Od5FjEntMXkb
	qeeaC200wXQm5hDYZCiouLc8o82mwEguPVF9zbv8bVeNTHpUYg4zC9Csf8FeJ+tyCNv6yuNC/Dc
	K25ObPOQmVJCjypoMVkc9lRZClpgfnARAruzRRq0joxaMJolr0HTuVLFfhSHBgjZyn+c9FEr4jR
	ZoqXZBCLYE+ymzUMvgExPneXXoNT8aCopV1AuZ25MINaAYBK7lbUDtOE99NTwH9GOeRdceltLqo
	YHFmUGA8b82YqZIj+/xkq0GE0kWalasSS+oXUnCwGt1wg/m+BBgAHxEu/zCGVvKOWSeuC7wv24+
	UqlLyJi69Wf9rPrzalexSaOuAMM+QgqtYMtZenIpSJN0wpgPPcM0YgsyPanQ==
X-Received: by 2002:a17:90b:3d87:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3893f977bf6mr2394645a91.2.1783515160314;
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
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
Subject: [PATCH v4 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:54 +0700
Message-ID: <20260708125002.202515-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Added Reviewed-by tags from Charles.

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

