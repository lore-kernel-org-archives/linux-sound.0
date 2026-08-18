Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD2456E02
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049863; cv=none; b=rgQ8IRSPsn0Qf/5i3JNQ2bVd3d/t2CFq90XxxcWlv2oR2AVLHc7JSYehqjEmUm07jyRTUUervybp6OSQ8h9f5a57YQ0do0/mPTJz/bRjNBNswDsgXagudFHcUgA2vSLQkUqGvYZqwtORpuqKepjxG7o85D784PcJ9nKVCMP9Y8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049863; c=relaxed/simple;
	bh=ApBJ22eBDq1GobaSV1X94LLtpVacRs1IZ/MetVLcdpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZoo7NZ88Xz/zSBS17tHSvGGfbxSxFZsdRZBMQ0jMy68tZfFQcwbjatOc0nBVrTcYZ9jxmiIqj5Zyz8fig7KemklNy90RjeBKi1+PrmA0YJg9bi2DiB9mBAJTLqYscITp9GIXf/D0ejTkGz/qAVgX6UVXWsEw1INmXO0MGGM0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUu4CYzW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUu4CYzW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so57999265ad.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049861; x=1787654661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=AUu4CYzW/mPJl9mV2QVHES0gZ8SOzD815Nyd9012MkfX5mk6uAL6G50vPQh15YhALZ
         28d4lK5ngzmFYaUcdM3dvzOmKtbU96SZ3nthybjwWVZtQ+nI7Ykp+MiEmcAqCoJqQRF/
         Y5IOol33GwELBuaV8tQcawcg92k9qsjrpwUgaI480LZ6L0ctE3xoUrVy7i2cBeQvrnHX
         aIDCQS43plQA4JfxLdO25PIc9ywUvjIFrs/2C/BdyZDCCe/AoUABzxRR/kbiAr65YNK4
         wa1Z5IRcndEiZU3Bnb4iNOj5W1AqPF/twqmfK5JDF0M7iYMf0PyFRyQG0dsMNjIEIqSe
         SZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049861; x=1787654661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=UcPam0qM47Q7CbYCvxRv9B0r1s9kt0eVENVG4ljzW7j/MZZjda4KoAnFvf8K6QYzfs
         AJHe0IPUOUo7Oj2PUgHeGNOr5YhlKBpz/IO/1V/M9GgbfRulkL2HqV7hDd7Lq5yPalvG
         qdBH8JTEvcryoLMz9JzgBw5rOivARnAiyJp0TB0NmZcVTzd623qzqtdMVMaads2KO/ua
         mqxp59VrHANBcwwU7vVy/0+dEo5rqT7nt72SN+tLrul7pTIQyMgyH6JyYvFlL/xsTxst
         IdXTo9KJS0rSVub3r+QZ5q5rDCEGNSQFh4zYnnHydRQMt+8IYwC6YdPWv8UUMxof2P53
         uoAA==
X-Forwarded-Encrypted: i=1; AHgh+RqWD4BgXo352twVmmWq5Fvxcc6uRNj2FWXuaZn8BCBVfs6cTwRW8ORMMzx859Zirhlqm5YhIxBknYKp6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFwJdf16L6Jb6smpDXTVVOW/DhvTlBF3Y7o9k2Oxih+XEGjc/k
	O2ctevzkPwue4owRtgdlhjnb9B00Z/G8nC+Y2gUra2bSknh1KEtUOVHB
X-Gm-Gg: AR+sD137hmMfi/R2BwPC4hnuK203eWvojj+2zngX3zYIhcWCl0Ok2vyP8W6pFTXNobv
	gB9RHM5EDaXAfm1trOCqyNCFIhLFcKbNVOP103uZeh0aZetJekMeu8m2vDvrVzVEyG6LjeSYZIl
	jFiVgLPlk4UWEZ7z7zEE/tW30tjuVJ+fQ8Rhzl12DWxdBb/USo7dUkbb+YOaMllp4JLbjaPPk3l
	JsNi2c/OKGv6RaV/obbbjORzkBWXaZU2dKLJVTjvFHi+1NKlX5aMMcCP1Ff7wcQ+uggpww2xA8S
	1fSNXVQCX4idbH0I/mD1hBcghusvw7HYpK2tWQIXrXnROiHfy7RW3+w5SUJiNkLuNMo+J4NmJSi
	6Z2DenyRHfuTmY7xcJLch4BjISdEnNXgwMlHbA9qzwHLAKJyv16c3ZIt0G2RUbXy5uJVED6NG8Q
	fBOAuel2J6Giq63ikSHfWelABnwBXBMssMmFp+fof1aahIbDcpVrGCL7o5WzDxRmOYz4noMdeix
	MbyjnP7kTrPQXO3KaqIRLpsal/M7hzbjDEmqkj3UoPboBhViucshz101UZJvi8n0Rs6UDQHvSHE
	DQqZ
X-Received: by 2002:a17:903:1b4d:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d3b0de7f65mr391680325ad.9.1787049861128;
        Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8173: Drop redundant probe error messages
Date: Tue, 18 Aug 2026 17:43:44 +0700
Message-ID: <20260818104344.37824-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b7c4b24a9cad..c2421f17375b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1091,10 +1091,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8173_afe_init_audio_clk(afe);
-	if (ret) {
-		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
+	if (ret)
 		return ret;
-	}
 
 	/* memif % irq initialize*/
 	afe->memif_size = MT8173_AFE_MEMIF_NUM;
@@ -1154,10 +1152,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq\n");
+	if (ret)
 		goto err_cleanup_components;
-	}
 
 	dev_info(dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-- 
2.43.0

