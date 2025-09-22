Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEDE2EB5BA
	for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555312; cv=none; b=k3XCX2ltPPrIRMOb8JdZSqEpuA+OuF+Yte7qjtOkdr/njEwI1PwCn8Gx2cv7x+CrY4CQN3K4o+4V3zm+4jqdV4uPor8RuY5rnGGvuO7AFvYe7+dnpqITQuI+1+JCsfx4KmExZQ0FwNAM7ndYpjA8kegqP7GoGSaKwm72pz7QAaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555312; c=relaxed/simple;
	bh=ReQ2IHxDCCNVodf5BraXx3b8aV6M2m2LvnKjckwRCHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=da4ObOYIF9NSfgg/plxmKMxW3eJvF5QXJOqJYlYxpXpjuk4ZWXU3RzQAVx8H3gsQIHpfauHXkijFlIRcnbR5/plSVTnBsTDuRNsAvOk4DDpjSxY4njz/z/sQYQtSVJkNMNbPn5+xZ4HJ3T26S3k1FGu7ZCIuNU2hQTRwWbRge7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czXoeN9Z; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czXoeN9Z"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso4153206b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758555311; x=1759160111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPqBcezv8xW5mApCdOc1gSfedv0YvcKSgG7urTdN4Vw=;
        b=czXoeN9ZUeRabyHS5FZFdl6XhtGWYsV9IZpQjMiNC0EDZt2qSH5CH+ZHcODLpKbwPp
         aDhY55r3paugXZVodlmqHZ6sg/SaLlOG6dXtFWSCS0ehBdlvuBrjq15ZUQNH3L6i22/j
         xtuUCsUH6i424MeIXl7Y7V045MrvyqzYL38+F1fU9TueNeW97ZIPFPkG+OsgdGxX9ozl
         Y8/0zoZi+vdxTUwepbyTYtw78lrzykZRRR2ZTMCZM/P6a6bRXsv0di4gn0x73HEfe48J
         aEUe7lv0ENgdz2SEmDk6MIIq1NUcEO6Gur/nAzcuqb0ePpgF+goYraaayWRonU2Anpr0
         M8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555311; x=1759160111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPqBcezv8xW5mApCdOc1gSfedv0YvcKSgG7urTdN4Vw=;
        b=gp7S3FhNzh1rKXIsKNR6b2lEnFs+HnMDTgEbIQNZlVMTmw1dOmYmAz/gF8dCvsyt72
         LDI0546I/MR1obJlHpM43j8NP1H0i1aqj3co6j20l0J2Bha50pP7aq4Mibu+yUgS2TKl
         TWRmJjk6MOyql++fh8xiUQn6M1mevRyoR6uyykKR2cJNKHSxRttqCYWZL2GjUg4T10sC
         U79wWGPp3gy/6E3ibUjfa9Y7AiWavytiupoeiLoLpwgwFFy5P72ayR6ew0F+xXSpp3k5
         97HCc31f50T+/dlmCIvFQ6UfBkwo3FAO5dVLoE2fnoUiR0D9wKkbRv4IE9bw77ur1T9U
         qqyw==
X-Forwarded-Encrypted: i=1; AJvYcCUL2TJnO/jcOrXUr1wGuPecXm2WY0klV7wUBpAfGHR4R9ahMTvuKSvMbWbBkM4L1Bk2dB1zuK3vqI2Syg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+rwV//EoAUmgucNEMnnQRkm53dVcK1zXeOr6EkbY+VhYpJBj
	/iV07JIn8ufcKICehfcdc35QdqxlvZh4aTw7kA1w8U3YW2H0TwN26b9L
X-Gm-Gg: ASbGnctv50exVZD2YISw7ohB2CAdMjI7U0Pu5jxE3WwjketQW8BfMUq1cpo9m9nVpId
	4kjjKv2UQ86oiZtNCfpeFIW3u1s9V/ZAeCMwq9yqPycKa/V4l9NeFq6qEoseL+z4BsF2wnYKhqb
	JVY0mVTjjnYzJbUDLNTRnCjwyunCvPIpCn4qXZVdxM6pBRaWOjqemey5A9gMJWRJnSWfvZffvN2
	WedkiHd2Jdv4q5UMZbNwjRReisHB3G2Vrj8GT3qXnZsE5Ib8ldwVkT78xpitjNzsaYilKXy9N6Q
	q0mMK3cOpmssSnxpumAoaFLdAG1+lf9tXVxRzoS/PGCJ2Re3LqP7VuG7sK159GzvlBbtQpnZ0Th
	ujEVKZLSiqRVKJfUf7xx7jCQL
X-Google-Smtp-Source: AGHT+IH18SVWKRivLhs8wCCIP9cmJ9yWScaF5ZUPDSrGGLbbr6gElS8sRBQwR6sHGpWLBmjI6JFxRg==
X-Received: by 2002:a05:6a00:929f:b0:772:4226:13b2 with SMTP id d2e1a72fcca58-77e4ecc36cemr14924105b3a.25.1758555310572;
        Mon, 22 Sep 2025 08:35:10 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3d9f:679e:4ddb:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dfbab0d7dsm11069712b3a.60.2025.09.22.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:35:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Mon, 22 Sep 2025 23:34:48 +0800
Message-ID: <20250922153448.1824447-1-lgs201920130244@gmail.com>
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
---
changelog:
v2:
- Return -ENOMEM directly on allocation failure without goto/label.
- Disable the main clock before returning to keep clock state balanced.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..55d832e05072 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1975,11 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
-				     sizeof(unsigned int), GFP_KERNEL);
-
+				    sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
 			    &afe->reg_back_up[i]);
-- 
2.43.0

