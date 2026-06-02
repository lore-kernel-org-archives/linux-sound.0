Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545B3D669A
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395408; cv=none; b=pcBq1CdARP9Zv53dpNqv7YO8YMGb7CNyGIGU+WZ3sI0anwmC3YbNqVQI+JTdWAURHAzGZcQg7uSg4YYxt1vHnJCK/vdrwqG0rdmdlt48nvu565EMLmAtKaZenJX4qEMzj522GQ+Xzh0gx//FxBzpJKHcsFBcImfjum02oxxU8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395408; c=relaxed/simple;
	bh=jLLJS63DmaW6/N5p/t3mdPzRbOoNEcIP/BNYCgIzYbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5bXRWIkAQO6QJYg3Wr4SS6JHBoxiOuAw0m+4r77LOfXMv/KGDYa4avlyUOMyLy6JBvAXSEspHdEoP47pZS6nApulqXLOXG6dZFA9Wk3wksSwl1eSWnWr0uJqXJy/xuWpkITzWASu63W8KN4JBeU4782T0vYRbURkCwKm+nDNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCO5KFgs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCO5KFgs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf02708e8fso38061825ad.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395406; x=1781000206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlqWTxvd2nybMb9oOkq3B+WZ2+KSO9DV36s9D60SrZ0=;
        b=OCO5KFgsWDtTd/4CHl4JEMzWtt5h8mWhi9Bz2OnEzsi12PddUsNjjLjTunolulKAdS
         pqGxgoglTPnQeTap04YEXV+0Rvzg6pWiCk9NdMCUnjLDOEiagk2wGf1h8EWiv4X56fF2
         fzId7wy5xMBmr3AV6Tg5DUF1CZiiIc8qXzXoB6qPbsiqy4h3o90s3eLx8EzGFXV0XlOE
         GI+DO+UUGAUT9AM5fXlmnN3PFAFAAO9RjZLgNLZ6raysWQeirKAz9mcCou2/Gk0O7y+T
         Lh2EZ/E+s9WXrLSjYBH4GBjHB14c6oyhodWgqaUvVjnTEg+XG6zyONL9GkBZwcYc8cIn
         SrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395406; x=1781000206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlqWTxvd2nybMb9oOkq3B+WZ2+KSO9DV36s9D60SrZ0=;
        b=iJ2TFWZTRKynyTK69/p+zdCOdDeyBYLi6vXseSJoFDecTz46x0N5CHWSuSUDWod0GO
         6bsj9+FOAsaVjzRQHMcIcAPcIqtuPqfe/pPHKYckl+NtuuIvHJXt4FD37iCfUD/BflH+
         c/+3AA9bJYdQo1T8k9kIAksBTgcVYsiRiH1nOaRvydetPaClufE7BIWkWueXrmwyj4l4
         OWC0k3Wo5ZdbA7Po3zQVRGeVMq6LwcyxVAWqK5Pqc/84MfzWirVuH7GojGDk4F0k+tdq
         L0bkJ3oCisS90ICKkwefthv3z6tYA/qxsrTcF3Z+kVcqTCcp+lvbFZFWqjc78XyUWzFW
         i9PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kj3nJeR4pdWsgNRzrekoH66+Of8T5huB8bJ1E1q77/i70+TOxeZrP6/0BtC0C+agQlH3CBdYScsEDkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAMSocu3Z2B/Ejmm3ryVvLh/RVjpe13eiwkROyz2PvGGQRjeb
	EzA/eFndfIm/+GzdHup74S+jDeziJqWc8hqsKIlTjC3EnCVkKKhlrJJh
X-Gm-Gg: Acq92OGp3/ONeQptbl9OI3bR1bZP4V5PwaFIlYRgTGxYgDBXK6kdeZGdkXeuXgE011E
	fZnhygp53qu2PQEfSo7ATFElKdjSMTa4qdbASYkXtFpZegmlzdDi2CBcs5oMAOl/18qTlBacFfT
	TQe34UzjvnKiXQ3nrcVerOS2RKrghDsTHoCcxGZ9BRWboZvhZwTh6CnTrdVwoRhVeSJOZSRQDlN
	sRHkIxsYQu+k8BxbFO7fla/Vfd9lBbL5gLtSQkXxDrQ8Mr6ZxhijyqvfkVtbg8X8SwXb2I5mApb
	3MPjwx8gp/IZ9MsLUU1GrJ+CPXl12PSYBn3smJzIywyghxQBSF8G5xjPQN/T4rdEH01l3E3fpwc
	WfLpNO1d47Tw/Ramy/NKyCvY9N86pAHkmvOSZB1W5UymJHdXm2lvs3/wY2iGb9ZaU1UVCFP24Tq
	mkjbwkdBwfBcNKKNyVqAJp8LS7RuwlU0orCL4Ze96+Rx7bOFVy/4uTQh0qNTef0cSg8ypH
X-Received: by 2002:a17:903:1983:b0:2bf:23cf:3e4 with SMTP id d9443c01a7336-2bf367d9da0mr164110925ad.17.1780395406357;
        Tue, 02 Jun 2026 03:16:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/5] ASoC: rockchip: spdif: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:05 +0700
Message-ID: <20260602101608.45137-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'mclk' controller clock during
runtime resume.
The bus clock provides the register access interface, so enable it before
the controller clock. This also makes the resume sequence the reverse of
the suspend sequence, which keeps the clock ordering consistent.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/rockchip/rockchip_spdif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 581624f2682e..8de5b76cfe79 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -76,16 +76,16 @@ static int rk_spdif_runtime_resume(struct device *dev)
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(spdif->mclk);
+	ret = clk_prepare_enable(spdif->hclk);
 	if (ret) {
-		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
+		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(spdif->hclk);
+	ret = clk_prepare_enable(spdif->mclk);
 	if (ret) {
-		clk_disable_unprepare(spdif->mclk);
-		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
+		clk_disable_unprepare(spdif->hclk);
+		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0

