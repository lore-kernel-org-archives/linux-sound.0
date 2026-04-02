Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5583344DAD
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 02:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098262; cv=none; b=RvvlUoEnl3xPwA/9/mk6HkNsweF95FhjrvrbPbGXsf7N8JkfYhNqNv0moDHg9bP2zaKK7XfawCGnX0NWgy09TH9lPohC8u7DwIElxGUb/jeZX3bPO7RPD1+kazjFP5ZADXQX8CRTybsuVvuFdnX944aiNtqY8+rkIhq78fjtmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098262; c=relaxed/simple;
	bh=2N83CetO5Tiii7f2FWYy85TMyn6jX8DrKqA9tOGcwFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOlpgR0x75M4cD6uDFDCF4gjxWi9y+PdNh6v01sCqujZq9G2BjcFa3yIOV1pw96n764I3KSPpyeMpfqXHd4ZGUH1iAGF4xkJHaB8kMQOBqJHxRPRLsUDBQEnJtguwGhhlvGypwoOI1bUHEdxcsmTBYbQa6JJ2R9pKbbtkqJkxkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfwDsYY3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfwDsYY3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso1610655ad.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 19:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775098259; x=1775703059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uq/1pF2olh4LCO68WpeevKtLhHLi8UfKPAbBabYqbS4=;
        b=HfwDsYY3/ySdIlX4B1+r9ieyxB8PzOfEIrYy3OGW569BMMg5r4bRdN/YlF7FZIDlJ+
         npqH472UpV9Bt4mQkfkiCrlbMofP6ATCrvra9mKszKdIRsQtC5sz4LB87Lp4Cb8R0kQ3
         8fngTRXjxgBWZy+BEx3d2zuGy/WunEC1TQ5bf9+BY3pV7YxqKI+fpvEfYp1HMKmjaMBk
         t/EcU0dPNFMG+FGvz6xus7m4xnvVMW6+VpPcLnK9Dv4HSC/Yjq5QCOn1KqRgoEp0WMI4
         tujFibT87UAQc0SWuFoEDuGcLBLiCNwfqAUtMZsalHY46ZB2DaTluKDCCZC9ZY69f1Ey
         Vtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098259; x=1775703059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq/1pF2olh4LCO68WpeevKtLhHLi8UfKPAbBabYqbS4=;
        b=WhEU1vg3IS/cjKakJtsySfGLk6tuVY89qxfRLkNOLyJa6zgTw6y/z59PreGn+C7x5H
         1ujKh6/UF6Q7f07m0E8dYm5rificR38gTtKhQjIA3UMPAY1i5pNd3DPQYXWl4+1xHiWg
         BNTspOHK06e926JElxKFhwZgExJaZBSdWymvKNsDowrzPywtnW6oo6Ywq7fowqtRCcPP
         1thzGYstYEzMgH3MPCE1tL7TZqsrWBYtdhsyBzjQ5GimfWAbg0rnNHv3l4DrMcbR4/G1
         5xXbJHkEZuj/UGTOtmETRzpV1KTPq+jWbtvZk93cQWI5PExXzma7Dz0+/GcediOyxC2Y
         fvbQ==
X-Gm-Message-State: AOJu0Yy+Hcwl5JBE3p2QzfziJLG+sHzd8gu/exTEU6Aglb9y8p181AGo
	ljjodx4ZhGgiRP0NDIbvi5wrlld4f+gm+VjxFyhX+Li5X5h4MU7RegHD/1rUdRjJ
X-Gm-Gg: ATEYQzwwcC/nH2nvoBjNfyCoybhDkDAuyYIqBKakOJrggYWjPU9ysSRyr5p/WuiaVLB
	BdxszMDqsvWXz6MPUruiUfKV+PwoGSPG5X+kAzV036VxwUCCzG5QcvtQe1ZqB3XDfjcNHshE3Pt
	3EPNM9NBf34ENjv8kyFlEgKfLJB3RpawL44XusLVGLLBuITSL+sqK2FgINP10enEs62lTSwY3WC
	fNU0SZN03FzFyfjpv63KkzMnzX4iEiWho8b1OSg6tLpRYCPUTyychF0l/hmGdal0yEnOUVM5UP7
	JFNmVde/PS1V18hAtbuYFZQYjQjsbWp8WafoToJaleNuB8HJGPRJ3GOuwolJgJ2RWwB7JrUZQye
	+0PviV2Et8DxJucM/WZ7WA9qMj9P4+TGy6Y4Jk9oG8tmfKskfUN0ET7JMuIxv0G/bB6M2BrxgHV
	0I4vRA4Npr90Qmr0k4+o2hrckudCPcEQwI6vgkfdeZ3O46UDAh1+oPh2s=
X-Received: by 2002:a17:902:cecf:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b269a82b8dmr62724285ad.2.1775098258835;
        Wed, 01 Apr 2026 19:50:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747af6e7sm11184595ad.37.2026.04.01.19.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:50:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: codecs: tlv320dac33: remove kmemdup_array
Date: Wed,  1 Apr 2026 19:50:40 -0700
Message-ID: <20260402025040.93569-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member and struct_size to use one allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/codecs/tlv320dac33.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 605da1259fc6..223c49dfc450 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -91,7 +91,6 @@ struct tlv320dac33_priv {
 	int mode1_latency;		/* latency caused by the i2c writes in
 					 * us */
 	u8 burst_bclkdiv;		/* BCLK divider value in burst mode */
-	u8 *reg_cache;
 	unsigned int burst_rate;	/* Interface speed in Burst modes */
 
 	int keep_bclk;			/* Keep the BCLK continuously running
@@ -108,6 +107,8 @@ struct tlv320dac33_priv {
 
 	enum dac33_state state;
 	struct i2c_client *i2c;
+
+	u8 reg_cache[];
 };
 
 static const u8 dac33_reg[DAC33_CACHEREGNUM] = {
@@ -1477,15 +1478,12 @@ static int dac33_i2c_probe(struct i2c_client *client)
 	struct tlv320dac33_priv *dac33;
 	int ret, i;
 
-	dac33 = devm_kzalloc(&client->dev, sizeof(struct tlv320dac33_priv),
+	dac33 = devm_kzalloc(&client->dev, struct_size(dac33, reg_cache, ARRAY_SIZE(dac33_reg)),
 			     GFP_KERNEL);
 	if (dac33 == NULL)
 		return -ENOMEM;
 
-	dac33->reg_cache = devm_kmemdup_array(&client->dev, dac33_reg, ARRAY_SIZE(dac33_reg),
-					      sizeof(dac33_reg[0]), GFP_KERNEL);
-	if (!dac33->reg_cache)
-		return -ENOMEM;
+	memcpy(dac33->reg_cache, dac33_reg, ARRAY_SIZE(dac33_reg));
 
 	dac33->i2c = client;
 	mutex_init(&dac33->mutex);
-- 
2.53.0

