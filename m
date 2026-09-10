Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0110748CD48
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045110; cv=none; b=Z3Rbl1kEHgZJVKrYOYId0IpoTF4a30EYOIkpDfhir/tmadlV+nvPFGzdumySIk8tulZDI3yXXpxI5jGx3q0p4FZZszi7ytdaMY3HIRclCghip7vSUCkJUQD17cDRony9We9lEKxe0QVLXjWBAESd90lfvPDhVwsiODwJQLD/Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045110; c=relaxed/simple;
	bh=7mTmQqvMAJspHqMWjJADF5TkGnCYRTyK2h8zGqfXvsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQHXbu9WW/ZAAvAwtXusNftEy/MoxrIKVY8ynyRPkC26kKxQ9ldwNfrIQM6N6wyU50Bb/QPhmr+SbDy1Ly30a4tWBev4cnCV+MgBjFfki/AV+tpOb4tVNyecAPgd5KOVX/bQd1J1rOpgTO7ATRnjMQXDOJa7lOe6E99nt69r7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBEwYEHl; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBEwYEHl"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso857110a12.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045108; x=1789649908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=lBEwYEHlRt6twxxo35hJCWSo8eh/hQrmPGa1Ibm2BtCCJONxqJI3TwijaWTwi3tTRc
         KdZEsJ0MmcgnF4+OfykSqr+xtJ8dLUmAFSVJf9UlBYKXyS6ty48SNwYeDcHfy63iM9ER
         nXR/oQW/PCfd2oA0A3hcqjNryeQyb7lWnKpq9zAFE/pu8qKNXp0njv67CB0X8QrKnzHE
         OmdDR/EBC0CPCNE+UH1ZPFkIHjCseIDr4K6LXTihV6eTeAPzUc0P3R/hbt9eK8XDMTxp
         eb2j382vx4yJVQmjzLg1ZdkHrQMt16ACDAwbKIOdTu6UcRJS6o10o8FsBKyOjg+RlUky
         eEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045108; x=1789649908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=lqb4aweKdYBVF8M1qyZLy4HAvO4BANdbuUsfs4pBaIQsSnnI+WdW0Pg3Qg6c6arUX1
         xbhY9DrhrC1RCsgqcrgiCvOLmPITwTwZOkf2nF0mkk9xVXjOntrUWxROMHw2Wt04rr5j
         4V54bDg/D63KclUqdd89KwHFI9pFTasUpywJG9QIokPq6es4RFxhRB1RbNBDwIJYBbyJ
         dDE7LY9W+XKOuxJBJ/rOZhxc+zOrag9u2SDgFBPoYFV1qDEcvWAozDfeyR4o9XcvD6rh
         Okn4+VJ42Ry28N6sJYLYkZkfuUfuYLsT0g8nCfxJPd3Qbh6EzqU5XPVE9kG0T7bfzaWv
         BbKA==
X-Forwarded-Encrypted: i=1; AKwUvBxRhTOdSpavfDqhhjhaL+9bXf60bX8/t5oNw68lLpsRNWTgDc2Su4JR7lj15DYPCcFucanZGsdujQS9fw==@vger.kernel.org
X-Gm-Message-State: AFuF++kqCVJV8Qi048L+P4i0JXJqo3Mz8AR5wGo69FrR7NILmu6b0lew
	uENndS8ZqPzje8ROCGk+biFsDJ2zUBQ0vJTekh2kalbHQyTBcGopN/cs
X-Gm-Gg: AYBFou0+vcTLVoPdSL6xbAg2SESBZK50nzxYTBD95PHi2boOFOeu5AvJIPzAo+EdQy8
	CLcCX5vL+fAmr0tPRoTyYWhUzG8Wjm0g2zMyvzOXYaWq5JTzyry+qrZUhjIr7jVnD7uIiO7tqft
	R63CV/pHGYqXM6NzJ00pa1gBkiXrcoqfhl28ztE4h/D4dc0UKzMX6SRjACMPhsG7B6MXlC+j6MM
	qCSZNkYXRkhcqEJc2/K8lD/3l7dsvUalcF4lzkFpf1qwqQaP0Oh/EGSEMrbfyhaXt0sEpdvaHoh
	LkPGxmgk4WKi2SkU9SwAJp9sjks9bAmsynjim3qhDAEDYw4KZXSkUd5d3Zb+wWusEAhInZZcEyy
	2CU+vmrW+xZMi0gTDnK4KwYke4De3cKjzwrgBeuT7ragD8Te8ua7WBxxr9bIZ+7lw5xmSYcJ1Jx
	Cc9KezpUpwQ/gO1QwP78CHJPX91+4Juj5sUGKNDz6pMYImi39O04MbeKIlUS7K+dYEWITGcTeJB
	UcMuK5/aQfNt6s2npvHRiJMSICQTkt9y+a5r1ihKArYVuWZA1YNyCWX8FUrg0trpbkFL4JiVmzR
	FPrdA0KykyGD4vA=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr10327996a91.24.1789045108156;
        Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Thu, 10 Sep 2026 19:57:35 +0700
Message-ID: <20260910125742.150902-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 435914aafb44..4997031cbcab 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0

