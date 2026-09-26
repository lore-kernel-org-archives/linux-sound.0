Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9937F724
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439944; cv=none; b=p/S+OxYKasFjVYOZplTTun1CbnWJpspFGoIkasYf/xakp8nLgdd+vjufI1qLWLD8vpzfyIqvxZUZaRLIVIeG8i+m9h50VbJw85+ZpJWSwd+pR9yXZNtnmrPwH6F8cc83x7JpFO3hAIYNaeTN/iE0TfJ4P4zbvIQhTPrtMbXyPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439944; c=relaxed/simple;
	bh=uAK+c3uS770aBBl08QziNKBe/WozSrIjOMo5yfY0S0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNIKw921p+64jHRcpuAO50DZmRlLuDuwit0k5sj+zikD2PBAKYBUgGafAgcgdTug2jYUqr4gBJV1GCzbnIymp9Mbc84iRP7tHF3PiJo39XKkIAGQ74ezxtiwTWFlJtA+i8FstZS2RJTNFZGXMQCL4q01QtAxGXiiVNL5l+4ORok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chB9Xm57; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chB9Xm57"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so17349831cf.2
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439937; x=1791044737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb4G303oMO0K/1dMnbkNBZNTh/B98CHRE5BZkAKVABk=;
        b=chB9Xm578oXHP4IVldcU7UtR+Sje5DHgNHu8QeXjFonaIbVEZ6MHTDkh5Hmuu/ZtDp
         bDAEAi3uL6wGZo5GkOioMSlh4tIecEOcTMsUr+mzN1SJvk61VS1MIqE9r8BFoirUrWnW
         E5LRBVDbRPmTMfHkzGuaKEvGbaI/yjiNfbKIGY0WMPm5aKiQXTVt2Zz91WFBzHpHXm/7
         nXPN2i2uq1i3BLrylY9+X+4ieKnjIOKTQKogLNZvNtBXQZ03n+Ib5QldNQJzxgG4Q1a3
         RKEDhucDp4iNpff2kamkFE8QFVWeck04B5Voot08y5lHvieDFloz1k/bJn8F2lSMdCY5
         9a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439937; x=1791044737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4G303oMO0K/1dMnbkNBZNTh/B98CHRE5BZkAKVABk=;
        b=ljOY6QlZDkzp4fAGyU3dIwlrcN3/qdyrPtwgFvCLWw1j+4QvYOWGQ3kH5btdqGoP9V
         mxsqe66gBhUjtiLkYOsvjMB/7mgKH8gi+1fk+yRNVms31Z0tgRqRPZZ8PBKBrr7Zk7pF
         ubti0LLkuKtKZupEwXai8ywOu20oFnEkBQpGcghLmAhl3uceCzjWayASmk/RCauuiDqU
         cWXGxz9nyCH5Kf2i4yXFGplId8/DrvKkwwrTLeH9WUiKwZVNxR2OfmmC9foy3CuoYMfp
         PcJGgkR3sdNSWyps+yaPkCLyvTElDTRgoj50FTHStqXeNLDq5pe/TD1bEN8YEk4p7rLv
         3q1A==
X-Gm-Message-State: AFuF++leQs7IUgeQP3Rbt3FP8m5AjRgrllvA52QL+oBaFq/dhXfKpT77
	YthUwoGEqBX81sKFLzWYVcqlQNJShSasCLUn1GI/mWfB3VR+7VuAT591Jdr6P5ne
X-Gm-Gg: AYBFou0IIxM653v5H8pTaWjuANUy2h/bfAfZaMS8TVnXjG0Sb1UYuw1QgKQTJ8KSFLH
	sAqv8L9r4gArjEAGpVypRKmepav2IKeL6OgZagGQxCGHV8gDK0jL7I/bSy3gX8wPMTaNPjxP31v
	yPmpyqU1JOSPnWtUrdJO0a/pvfJ1EWyOGTrH+QwobpqPKzUKgaYBCUmjfVls0GtaMnqogqIr/U9
	hop1CP8gt+P7pcHkemC/wavCDfOgy19IjfLYA3C19EO+WBHUQIWgYO5UBW7qu0Z4sj6W7kIPJ7Q
	fls35ensqf/8oUj70DriwRDbQOvyj6kANSrjrEqFvop/ssa5nsD7+f5JMnNgr3s3uvatN+v9y5y
	ejcaIF6QPggVRYSQyIvalnesuOhgZV+Ak60UB7/NnE4fWuZW1wTSohwY5xgaAKO+wWWEsk08/hS
	JVk2r6myYlAkUayOI50vprCisWEvwg2GEIueUcXgB75G03vE+N4mlK4RA6bXfW7j0qG/MIIoMlY
	9vxotOop0/B2jMd5hEHkGqJNOW9csKo/Nr0jO9tNYEhdSmauVCZCM5krc5r
X-Received: by 2002:ac8:5f4a:0:b0:530:3052:5257 with SMTP id d75a77b69052e-5330b5dba09mr118633901cf.27.1790439937300;
        Sat, 26 Sep 2026 09:25:37 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533220200cdsm21445101cf.2.2026.09.26.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:36 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: nau8825: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:33 -0400
Message-ID: <20260926162533.25395-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 sound/soc/codecs/nau8825.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 2eb0efc983a0..63d927f31409 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -348,7 +348,7 @@ static u32 nau8825_intlog10_dec3(u32 value)
  * @sig_org: original signal level
  * @sig_cros: cross talk signal level
  *
- * The original and cross talk signal vlues need to be characterized.
+ * The original and cross talk signal values need to be characterized.
  * Once these values have been characterized, this sidetone value
  * can be converted to decibel with the equation below.
  * sidetone = 20 * log (original signal level / crosstalk signal level)
@@ -725,7 +725,7 @@ static void nau8825_xtalk_measure(struct nau8825 *nau8825)
 		break;
 	case NAU8825_XTALK_IMM:
 		/* In impedance measure state, the original and cross talk
-		 * signal level vlues are ready. The side tone gain is deter-
+		 * signal level values are ready. The side tone gain is deter-
 		 * mined with these signal level. After all, restore codec
 		 * configuration.
 		 */
@@ -771,7 +771,7 @@ static void nau8825_xtalk_work(struct work_struct *work)
 
 static void nau8825_xtalk_cancel(struct nau8825 *nau8825)
 {
-	/* If the crosstalk is eanbled and the process is on going,
+	/* If the crosstalk is enabled and the process is on going,
 	 * the driver forces to cancel the crosstalk task and
 	 * restores the configuration to original status.
 	 */
@@ -1303,7 +1303,7 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 			NAU8825_CLK_ADC_SRC_MASK,
 			osr->clk_src << NAU8825_CLK_ADC_SRC_SFT);
 
-	/* make BCLK and LRC divde configuration if the codec as master. */
+	/* make BCLK and LRC divide configuration if the codec as master. */
 	regmap_read(nau8825->regmap, NAU8825_REG_I2S_PCM_CTRL2, &ctrl_val);
 	if (ctrl_val & NAU8825_I2S_MS_MASTER) {
 		/* get the bclk and fs ratio */
@@ -2897,7 +2897,7 @@ static int nau8825_i2c_probe(struct i2c_client *i2c)
 	nau8825->dev = dev;
 	nau8825->irq = i2c->irq;
 	/* Initiate parameters, semaphore and work queue which are needed in
-	 * cross talk suppression measurment function.
+	 * cross talk suppression measurement function.
 	 */
 	nau8825->xtalk_state = NAU8825_XTALK_DONE;
 	nau8825->xtalk_protect = false;
-- 
2.53.0

