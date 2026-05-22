Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D812D12ED
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779415155; cv=none; b=oP/um//bxbKuymKpd0q9gAofZJe2NmFpFKkpGx9ec9jqIhlHsO1vOIQIqtEzkXBGHU6YCsJDgMUIm5I6bKJE9WXWT9hkHofBJwbtwq8Qp8lNBRDzk9E7cG/jrhJ7DMe2DybVq8WmOJJ5Lndn3OuDSenIQizAmbaPfyUt96SNwl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779415155; c=relaxed/simple;
	bh=huyYowgvyax3xM4nR3JNAVCXHtYOlOr5UQVQ27KgG48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpPNM40rkiKYuY0TfSHh8ny6se31Euslhh9NmsqBUgcix7aFVRCtjXV5gdw6dz8Z+S74F4WXv/vykVisINhjqoUPQqT5vPICKMNHQzQ5FOtCmrPb8mdFvOhKhgkO+eWVYNvq8FccdlotOjIHQBZVaSHiQJq1PDWQZjiTDLUfk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgO9ixdW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgO9ixdW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bccb978bd9so46443025ad.0
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779415154; x=1780019954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1F/N153wlHEFYgairICUXmOEte2iOLSjR7LBFRFOk0=;
        b=YgO9ixdWMK/Uhew17Hg8c4WZSDnXKzrgJ+AhLIPnLeUNx6uq5P8e6ocxpiTeKiApUT
         lOnr1b/UUe/alsdrdcBygqaomcT+mFbdzwqb3JWXOYA9Vpg7UjTi0oE/1Z8n5ksxt7Xv
         4ZbzKcR82wYT6mFbbKAhGs8gXBQ+DMHtMiBckDcKxb4GITv9F32aNOw1oJlKYJtoa6dc
         xxfFKmM8GiWnaYjlsDZTlj3Y/JXfEqh/SXZd3o7WFZyZewHWHRHIqc9Q3Yo31NIfT/hS
         4TSE8jERHUUWap8R7VHukH/F1PNYcnfEExEm4Hoesql1iqN5BMA3XOLsP20YfUSrLymq
         zCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779415154; x=1780019954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1F/N153wlHEFYgairICUXmOEte2iOLSjR7LBFRFOk0=;
        b=lrkcIuZe6gOsBvo1g7lfkBfBWs+rYwWdDukotWOSLxmI7CPvD1nYxXRWEb9aRmbstq
         asvJC66NlixMOFqZI3STrp2HUXKY1RG6KGb/+B0tmf2+8rNczgW9PLt68FvM4+EW7xkl
         nBob3CG92DzJq8+kSw573OkFbWPad5cTgEfmDibiMaSX2aMCd81HF6YsXmys0vBPnjJ1
         Rm+2g89afOWreo4uzAVGEET3/+Q6SSCpGYa21D5UVqKhkR7wcl66Iyz7tjoGM57oVVY1
         gJXM6b4JKnvcBD8zFKfMEkX42fn9iU4eLRPNbgl0KOs/009kLlAxMW7sVxPrp2Wc8ZOq
         pu1Q==
X-Gm-Message-State: AOJu0Yxs6uisoCvuT0MnCkzD3azo+7XmO/2qpSX73Alg+/R1gX3oU7CL
	p9igHXoWz8ZK83wtTZ5V0xQZg8hxybn3o2rbSQThjVTTtZh7kGacv5a9yd8hTLCq
X-Gm-Gg: Acq92OEBB3eQnFTwusIjfl5/yEPAQGbAEhApLpDUJU6koOLxQDKCa9+Te16fRVr3DB9
	H0GFC/EFbZ3pf861nkrViMYx3TXVxa9Q4EUnT2PQ8zh8PVl08V/ufuzfMLd7o6tfwc0VAsXciQQ
	z4LI7jG6XUCnYsCIeSMGbLs1AEjphIswNcMoW2QT5OHnEex7/LN4HrXjMonXu5Qxz5EYG98cd5K
	yF+pBkskB5cbfbu4aZpKr0Qxjj85ZnxYxMrEhlxzS3IYSIJcybJ65Be3w2pOZUMMTN1qnhTqLUO
	7Pp5Urj4+hJlWMFdbfA2MWUbM4feDFlW5QuQf40bTFdkfhtKx/phhwtg9hXGjoI6xJ8sL2ei/JZ
	BkNsmssuwSy83YLdaVgoBwOLPegvJWrmhBpNCDt7I0N1XFKWYz3X9mDTqobEIFVML+eaph0u3iK
	hrIHgpeYJWFkON51LIJ8sCYX4kt7v821E6MLl75jo9yqaPRShFLuHUyZaQ174kHggJHShO93KhC
	LfPvhoYGqni2id+zMcrXHaILjRIaFxtb+QFfnRRku4Lag==
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr53857845ad.22.1779415153758;
        Thu, 21 May 2026 18:59:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0aafab8sm5806695ad.0.2026.05.21.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:59:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
Date: Thu, 21 May 2026 18:58:56 -0700
Message-ID: <20260522015856.741656-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove open coding of the function to simplify the code.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 12371f895234..a2c28369fbc8 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
 	int err, i;
 
+	soc_data = of_device_get_match_data(dev);
+
 	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
 	if (!adx)
 		return -ENOMEM;
 
-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
 	adx->soc_data = soc_data;
 
 	dev_set_drvdata(dev, adx);
-- 
2.54.0

