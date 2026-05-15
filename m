Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADE480326
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844327; cv=none; b=hMPJdvkecDcAI73u/e6Kpo7XPSSvV7Tq7+jC7H0dpoUjEzDgN2uzOHGbG5ExSri4uilJYe0EgBy97KgxTzzadGGTwycrBTitdb9mLjFx9G7Sw5rDmGvkiE7cK52Fo/u0pJrBgrhhgIMqkYiyJap6ezbZLfCoVs0TxJuGuYesKPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844327; c=relaxed/simple;
	bh=F9E+H8TANW6Rg9klLKuFP+magMqZNcZpPhTQGTPjs9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxDdHafavWd5CTRHFto/naNigtwC76q4aZwxIq+XbuIbvimRHdEeRuxbL3uvgW++rkU0vLfbH/T0bByGP/LFu3NyXAwoI9t7iELo0aFkQh5/EM8Xv843+8re3MySEzOVJbkyyEFhXYfbtPpwDJ5vk5s8xpuiaiKFw3S77fkxJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRp9xlx7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRp9xlx7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba928852a5so60988515ad.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844325; x=1779449125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXOb3YdKRM4sg0OdEZWS62sCVC29WoJvCtzBLBwZdiI=;
        b=NRp9xlx7U15oD4d9AnPrT4LAFMRb1yanMMmCgMNaDAYJu4ZxvLGAhtNuAuQnjFFI8I
         3meQynPwYKJdkXCAtDuGCwmcSGtLD/dAFtn4/MnxRNee1WcdZrn2FbzBB3PAomn/hg65
         tTLdjLXd5mAoJroDFhZjM6saoHhvacV1yYmzOc+dl+wU6IuU9IsA+mVA8oJYL0ZTGqNS
         qR0+El14skclK2g6UMwS3bHpFcRDRPckGdJ03aRc1hqIeHFeInekTC6m2KjwLD11d1lO
         nE+vJjHU+NZhWTVnohs8UDymxrAPic/6IgahjOwklhPJIHisNJBzc5gNI9PdNLgDCSYe
         RvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844325; x=1779449125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXOb3YdKRM4sg0OdEZWS62sCVC29WoJvCtzBLBwZdiI=;
        b=l8HsEIHI/7mEYIyisJpXKvu1bI8d7dVkZ0gpzmeBypEEqLm3t12CaTo7uIsmXmVk5n
         IFvNLDrkYEWxscFq0/wPTlNmlIbSwmMImRLUhTE72Ec31VScODYTTLx+V+QZB26cNnth
         Y9i2RhNoFbbq1BNdGJX0Mlvg9uI6LRhZDgJZgTAWtFTUtTAB3JqoCIJJnOdyk1Iz9Gmn
         SYeifjqWhz61b6pqoq4J5+YKFGIp5hd5YsScrrQhTpry1yA1dLMjpoVkcXDNlPdaIVDD
         dvWCkFcLvcrSX93s5U2yl0lv8dzUF2xAeKfUPmLKfanyntOnBg+jZ7SeIX23TV6z5f7b
         lO0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/5vjAcTnn//QaiGsf87Ch9n5CB+GX0Rd21HzvvpB4FjsLjb+Sg3DLV1V1o0VXSJeXU79aEX7urEuGX5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyd4BMexAFaygS7Ecj8LZmYYOp/7A4VrTL70UVj0a8SYqVGEKP
	FfgRsHJjgw0ZMzUUsy9s3bNhPtpaK354lY3iPX3AgPDfqu9E+0Jpo9yZ
X-Gm-Gg: Acq92OEfydchvP2w8n/K03eZN0sVYYzq2lp/+JCHyBDR6/eTNiUtosvwp30iJefUJZK
	ByBWchb/TbbDdQTPABEWBlTJ0H5rUYV2tgEEChL2YzM5mD4BzAOpa7+GlXpScrl7NWZeVWXhKHe
	yqAjM5SXA1LgfR8MBaHHyBJC8bnaddvs9C9G04kKNh5xm2hDp4/yzbkcVXmqICsz6sD3SBGL/wl
	gBQOcFoioD0H4iN5Cp/ntON8ILqo8/OUaOSEWyR8P0cOTYL/25fwXFgfEeFj6U2RvAGU9/UkrlR
	tRVahkFm5cvx5JSZ3xK9tvlXPh9hJfAn0BLNxgnMa61l7GPa2zbZmAjQ1kVBGyJ1V5aocBiwPPY
	yfSFH2b98PorLz15oiued7uuIZrBuq7cNlJcK/bOmxB4574TN1/lzykeNM/6WElZ+og0EhH884L
	WWCpPSFO8CBLvcva411qqBHTSuoADCVmmjH+qzGk06dmkkEF+UAtcA4u/Ypw==
X-Received: by 2002:a17:903:b45:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd7e7d88e8mr45702405ad.10.1778844324907;
        Fri, 15 May 2026 04:25:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Date: Fri, 15 May 2026 18:24:56 +0700
Message-ID: <20260515112458.34378-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:

 Replace break statements inside scoped_guard() blocks with return 0
 in stm32_i2s trigger handling, since break only exits the implicit
 scoped_guard loop rather than the function switch block.


 sound/soc/stm/stm32_i2s.c | 67 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6ca21780f21d..ae9e25657f3f 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -615,10 +615,10 @@ static irqreturn_t stm32_i2s_isr(int irq, void *devid)
 	if (flags & I2S_SR_TIFRE)
 		dev_dbg(&pdev->dev, "Frame error\n");
 
-	spin_lock(&i2s->irq_lock);
-	if (err && i2s->substream)
-		snd_pcm_stop_xrun(i2s->substream);
-	spin_unlock(&i2s->irq_lock);
+	scoped_guard(spinlock, &i2s->irq_lock) {
+		if (err && i2s->substream)
+			snd_pcm_stop_xrun(i2s->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -905,12 +905,10 @@ static int stm32_i2s_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = substream;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = substream;
 
 	if ((i2s->fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_DSP_A)
 		snd_pcm_hw_constraint_single(substream->runtime,
@@ -982,19 +980,19 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_write_bits(i2s->regmap, STM32_I2S_IFCR_REG,
 				  I2S_IFCR_MASK, I2S_IFCR_MASK);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount++;
-		if (playback_flg) {
-			ier = I2S_IER_UDRIE;
-		} else {
-			ier = I2S_IER_OVRIE;
-
-			if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
-				/* dummy write to gate bus clocks */
-				regmap_write(i2s->regmap,
-					     STM32_I2S_TXDR_REG, 0);
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount++;
+			if (playback_flg) {
+				ier = I2S_IER_UDRIE;
+			} else {
+				ier = I2S_IER_OVRIE;
+
+				if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
+					/* dummy write to gate bus clocks */
+					regmap_write(i2s->regmap,
+						     STM32_I2S_TXDR_REG, 0);
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		if (STM32_I2S_IS_SLAVE(i2s))
 			ier |= I2S_IER_TIFREIE;
@@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 					   I2S_IER_OVRIE,
 					   (unsigned int)~I2S_IER_OVRIE);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount--;
-		if (i2s->refcount) {
-			spin_unlock(&i2s->lock_fd);
-			break;
-		}
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount--;
+			if (i2s->refcount)
+				return 0;
 
-		ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
-					 I2S_CR1_SPE, 0);
-		if (ret < 0) {
-			dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
-			spin_unlock(&i2s->lock_fd);
-			return ret;
+			ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
+						 I2S_CR1_SPE, 0);
+			if (ret < 0) {
+				dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
+				return ret;
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		cfg1_mask = I2S_CFG1_RXDMAEN | I2S_CFG1_TXDMAEN;
 		regmap_update_bits(i2s->regmap, STM32_I2S_CFG1_REG,
@@ -1047,7 +1042,6 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	clk_disable_unprepare(i2s->i2sclk);
 
@@ -1059,9 +1053,8 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 	if (!i2s->i2smclk && i2s->put_i2s_clk_rate)
 		i2s->put_i2s_clk_rate(i2s);
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = NULL;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = NULL;
 }
 
 static int stm32_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

