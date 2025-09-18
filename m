Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B498311C3C
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204528; cv=none; b=oWaOSOzkDxLCnFj5ouSSgVZSa1CUcy9ypY/6X0khXwrWLTXvZYLMIz/O0WNU0yLLSc2d5YnHtDUEqHs+zTPW4V1li9h6aBpoN/4RaB5TyItit9OKJpljBawJKl3zbPGxgK0pQlbujS9GZEuu+lB31Sf6aYMUV8c9X1+EwGtCwPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204528; c=relaxed/simple;
	bh=zxgm65Ph9VIZRAyGnN6KsdPjRkrjVybw7A9LFz16nCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZulRU6yxwTXICkN4/PsIOyx4wxv1A7Bn7Bcqq3Fx8PTl4K67IU11QUZk+NJQKrGdUoEUMu11Sqx73/4w3p6CRNrss/S6CKmVyQBiHOAqjelfRawkB5w5NBq8G1RMVREzciAckuHokBFMvAMQ2HKprC1c9eeCrPbf7CHbAWIv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPCuqER9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPCuqER9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-261682fdfceso23112375ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758204527; x=1758809327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3jtPOVR/Qh9IZ/OmR2ja7xClQUBdSd//rUxpdfZTIk=;
        b=BPCuqER91GuOG3Y79ZUsap3PZgfO8FC2RLO22uDXseED285PZAF7DBYLaByiB3W6ZC
         rlNB3UaYlwWYA/KtnGGftBJR+yODJo6LJpf5Hntsn1YOIzFkX4VSoSWVDrcpTluYVK98
         Bp6FgxAQmdse/GhAjs2wey7EobRi2ciYTjCoGJ1IBOZG4/2j+6fobYIuUtbsKshFYFGs
         6pOq+JfSDRSlfg8aqnnYVAwkthYluREPaFYpy2Pc2BRdgvd4vgG1Ussz1g8dGLGgG+hv
         Du9ZSu/WkoLWAjGHmKyGfFNal7y+v0piSN1S4gS3l7eftpjopFvuvqIYgP/4Yo45VVP3
         x+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204527; x=1758809327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3jtPOVR/Qh9IZ/OmR2ja7xClQUBdSd//rUxpdfZTIk=;
        b=Q0UWm06iiQrJcDYNHYHwx/gAVRDkoT0RDLGAm1Lcnj0ziBqqGelICYbk8hrPyobg4P
         GhjIpuSQvgnyuivTLES6fHOylk07lt77Hgyw5mH7mqt6UZiOqtXBEtC0GCLUQoUp9rF3
         Dpv0krXv4DQyRSZFk2EE9ev+O3TSdK8MNE3kF8xuPAjM1De6BinqFss+7i552NzjGl+T
         TWn3TBwrbsBdVgmwUKWF1xHMrJ0mNe/wKphvu+W45v1o9nuanSRobcedjU0tmrSi5xiy
         nfQz9whQAbsRqlGtrNwLHFRp36GNyry3bM/7r2w2olfMJneqJe4uQCG87Z1jjCM4/uTw
         eA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXP9WPt8sePClEG5dh8LqxCk05wb5OfPOW5V+araOc/XLk4wpv8fs1sd/Bxk6Tt8HTWDvVytRPEkbybhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+uz7C/Gt3L6Ja1+Aw31O865dGbBotSoxYxPFbYpxnNY+mxVu
	VlynXzAaUIPLlxieSqKTTmDqCQrJ6Uehqki2PVuMQxmg6jdJ+q/F5nWw
X-Gm-Gg: ASbGnct4XLNQ7zfHTpohs19jUdnqepHOq6oGUjPxDLyVJQE49U6AqxqBoB87jzF9VMN
	E+3e2hJtjvQF1ZETxR7YfudBbGD1xz0lHeul7ieBhMvRzoCBPTbqxaKDvdqfwJtM96DAtHucPpz
	47Gsi7RlAg7j9Atvg3U23RYlb9J59FWGaqS5lbYlbDmlm7PsC7sgvpR3cfwwtH8A1Uo3B/qUBQw
	iQamcI3rxLgJFnv7hmi1BwWWBEkTVTD30+kDGgeUYOLuZYQq7YKufC04UbFbwTXSf+D/YUbwJBs
	LdKPT4fpIf+R5JMmauMjM5y+EPW7b7xMOflCsY9LWb2o4cy9fFmPvZ7jaUS3wSbr3TkRUSaByiy
	cXsEyptQ7NTpbyrLWw8NDi0wKUQQzJrHqJAqhAw9UNQ==
X-Google-Smtp-Source: AGHT+IHL4igJxg5AwA7L1D1p01uU/62u44PEnlUK/eOY3G/4bPrg+RD9PUmGGbiLH93nITnKJ0zvSg==
X-Received: by 2002:a17:903:1212:b0:267:d7f8:405b with SMTP id d9443c01a7336-2697c6afddamr56831825ad.0.1758204525753;
        Thu, 18 Sep 2025 07:08:45 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:70da:6ea2:4e14:821e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802e00b3sm27037455ad.90.2025.09.18.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:08:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Thu, 18 Sep 2025 22:07:58 +0800
Message-ID: <20250918140758.3583830-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..9f398d1249ce 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1971,22 +1971,26 @@ static int mt8365_afe_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct regmap *regmap = afe->regmap;
-	int i;
+	int i, ret = 0;
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
-		afe->reg_back_up =
-			devm_kcalloc(dev, afe->reg_back_up_list_num,
-				     sizeof(unsigned int), GFP_KERNEL);
+	if (!afe->reg_back_up) {
+		afe->reg_back_up = devm_kcalloc(dev, afe->reg_back_up_list_num,
+						sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			ret = -ENOMEM;
+			goto out_disable_clk;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
 			    &afe->reg_back_up[i]);
-
+out_disable_clk:
 	mt8365_afe_disable_main_clk(afe);
 
-	return 0;
+	return ret;
 }
 
 static int mt8365_afe_resume(struct device *dev)
-- 
2.43.0

