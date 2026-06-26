Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECFA3D4137
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454556; cv=none; b=GqPh/9+Yb7gmcAByqU76eciiUIQKA+rfl2bexHweYIFJXtYGT6f7qFt8uCdYdp/VoWtS2FMQF3iV7ghNFjLXCrRqpiQtxvWtJFhAycwIQw4mjZWd6HGnehXM9NADfJzw23HL+PghAcwa4YlgwU5MpvLKh6JB10jjp7xja9TsQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454556; c=relaxed/simple;
	bh=em96/ZARght/3otyju63pfWEB2uPboKH1/9p2lcucSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1Lh6aRcbLLron2VWVC/lA4hwY9iRJRObNlfPLyo0wSXFWAbbGO3ivn7FoV+/Cqcy0Plb+l7s71tJANEiUOhOEssRIXk+LZ3PQEmW2Vme9wlCXD03X7b33BoKJjun5VWPJ5oZi1g5yOitCk26AQjBZAPzwZtNvG8+Iu+xKrRVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odqqO+CO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odqqO+CO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso333626a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454555; x=1783059355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=odqqO+CO32bcAWv5KWQErChy/JpjrJiZHGzmVYj178J2QHHPNOVUvYKUOSiorcJZ7q
         r/7ouhxzS6+Is9oueTI7it8NhkrPnJ1upKBsFUXP3E0fSbYvnr2bxfgM70Bt2PRGGJsm
         kKD8IGBC/WwzcR8Fyw7PSnfxy7aiDVOBvixOnNMDb1rr3GHYOYx8CqV85MzC5vDwvVPs
         30MBbqtdew9sZHyy8QNM6eH/1tQNORVNeH/66kPDbAvO9EPKfCR7sNnm2CKTI/GR5E1/
         DA+AzTR9FfgF0m5U3ld7eZ/3Dptu/NzzezQRTxawoURmalKTZtFgLBvVpXVmap/RrkN1
         Os8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454555; x=1783059355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=ZFh2+/7n7UWH/J9Ui7lks0uovAuC5lJ39OUKtX6+nTMnMdW81uGOQxTzQJR3KOpYoL
         Ao70ye7lir1hOxW9Ixi4Rc05ofDGpDWYbS35i/4QLyvEWfvewXF2nXQeZR0utNbQEir0
         x6TNLIBS7t6d6OL39yRsUnJreRUpglh3kBchSbYZrnUEaXgeHQ7zCD/i709RosulhurQ
         1mBCkoLYc0MfwnnBJMi83hSsup3UTu1sDVA7si1AczoRrvfjrS+Lsfd/ZmGX445Y4K3o
         3YJEFPrmrpIskJ7VpCDjenV9nXu4KhQw6Od33WylQYR4mpUMXS7mrpflW37J3Vz3kJU4
         9+ww==
X-Forwarded-Encrypted: i=1; AHgh+RoJ85gnXg83brWlAebUp1Zzl7c6/MkEdLGDYb5hXOYHWxhwPrgOx/0IM00fZa1oN9Z47LS4C3RdLl1e7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQmddYjrIguSosLWv8T9TAOhGQuigHGGfSa5I7D2KXv+TWDT3
	EhJ4oaq9dDCXrlvpHEKgX65HJKjY4HWhrEiOrdEvVA4f0osK+UpHB7Y1
X-Gm-Gg: AfdE7ckWl2/gPPrExn4+UDIDIWhvCJ9m/Nq71qZGaYeroBkodMvOlRBKIaA2gyq6Ot1
	5ioysrHUAyvtqj+/qs+pDKecetGp7WkMuJB5njIE6mfXEpSUV+/ytMDOJegHRZsGvDPcebc04pT
	+I+PdNUiNZq1l/azC9WtSPUgFcWukA/czAqehURFH+29G0Xpe2Q4QRO5Kdn7/A6yR6AEd5xvYHu
	DAMsC9SBngttHcUHhPhn2Svnf8UCLRlqDMPlk7nue+AbJBC3DTKDEDCWK6gmvdqXvmtZQ20q8u8
	wk3T6w4kzgAt3KyEAwbjczL6+JE3bj9f9VH/YFhDpTVpZGxXXVSMB09mWPnmb0FBKIsuthmzvcU
	i912KqiLcbySYu81K/ogdcfseZaG5Q8G43CXcygSdB+rq8yrlGZHnUjVE3vwjDuCmtXm79aVbnF
	FP8t5sCLxUpvspAgS5YC3113jfXoP2dYqWD8iamEEm5FtK5N8=
X-Received: by 2002:a17:90b:180b:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37dfa1b664cmr5210147a91.6.1782454554875;
        Thu, 25 Jun 2026 23:15:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:54 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:22 +0700
Message-ID: <20260626061329.23264-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

