Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7B38887C
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030511; cv=none; b=YczrZm0LAmd6LFbdZaxxvl1wmv5sQRZW6yLiOluYzrw5KjGeGf4+iinbheohIJN7EsP/XoSPkdRi6lBq2Z6B/JsdwGgorknjYj66feZSjfKa2UErRThL/+qFfGSS4+2rQkycOz035QD+nD5ARozirZg/Lbl7xRscZp5xWwuLpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030511; c=relaxed/simple;
	bh=JnU7UlQSbchu2TYcv0iygOEto1dGJRIqdXNTolT4xaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdmQudKJoVy/Fk3BaF6wkQKC2cVUS2mB/4J7wz0KSBGQ68wpY4IbLaM97Qwb8TMhEIuv6fjal0tx/k5lA1Z7hqtqKgLcz5+o7sTdU1/UIZLXP4SSnJCiiOq9qaDvi2spDkssCtAAg3BRmiHZNELM3PRfgBZBnJKexoDgKMPJXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6cpv+Gz; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6cpv+Gz"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381216921aaso4516457a91.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030509; x=1784635309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=P6cpv+GzSq05K0Kh4cWHK4IcbJaVj6ZA2k2aIOSotTpSxuvvdUjllGVM+ZPj75+pVr
         dpCHXTGQ5BbwrrlgFp6ViNGJBRtH/9eqdip8X9RVoy3TrC8/VA7PiduSeKUFwWqMh0Am
         UFKZ7IrjNhGBorOp131pvIW/JcKPW/3x06GGmf0PLo07QTxnvPXugGrsGZenbuH6vlx9
         Q6Iq8k5iIgOAI5h3w+LsjsGG1UWS4NNfPSG0/rc0cqLHwaKjEQAxDpFY9kdXa0C9/09L
         ekV6UgeE++qFZzigFVByGg6pJ4K/wN5vbxl3gLRqb+BM5r2a33FqsWehx2OzlPEwL1vx
         M1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030509; x=1784635309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=poHaozS3IUDfOJ/VNtDRUVw/bXGZpdP/CwTaszcVaHPNd8yMnAt55x8bu7CbCuoZrD
         fa/ks1TR1ib3W12wPLVmq73GRUIcxC1B7yWn4aFqGZfOhJpSQOLrBXxe1Y/lzXjbVxea
         kgFnZqYlxMuGdFdIPBHJzrNiO1vVlKjXxwlixueCQ/bsHQ7D5i2rGcpixxITQjakfwX1
         /air1FSuzwu/PWuhiUq1a9lpTPXVDG+gFaH7lc+/1xK9zoio/b+KANf1WVZkRwZj7kof
         1S+WN2P4QYZ/kGlaNrqJwCIbb6DlaDdqyp+Ow6thkEWuAIEOznjhlG8dnY3EKHXLsGaq
         d7ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq9PU0riOtdu71oPTAUvoksfjzgvKhJ0VnYOBlhgp0KpJvj7LcBRHlqh5zT+jnrPi9RwHMMWRm2si8FVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxycEVB79ZtlkDCYcz4I1Ps4y4yc/meq35hD7TwoGYGAuKzAt5C
	qRhmC4XJLakxaHPZ3QRrezp7JNxQi2v29emD9TD38b+Woq3M31CsKSV5
X-Gm-Gg: AfdE7cnxkzdIE9r33qcWgY8DrGfDMDHDjnJF/42I1MiX2XYkMYPN2Je5rHiGHM2q2bt
	SNLkqQoEUiJYNb4+zbTqfo5oPktDAGRjxqyueCofCiJL7RpqFQrfItdYP6xDbh2fdMSnemERIQy
	xVtDwS/K/l6R5at6Fm8DayFyKLdtTF17Ot0RltWV/bXxIz8pj7Yz3++bVGg/GVa3tqbo+OaDuJf
	UmMhSR5160vdMm3oawxHOkyzZdDdLtF3HH5WuFQdtU3um/z+OeJMd6RpJu0QHfBeP3ZIy+VPvoy
	dYUAz1w5Nssg/sp8dDEae5vhLt9hxK3Zo4rp8fFu+XhxzfT9UI90CHzGJxYUqMtX6fWDpn632qi
	jwRLckZrItHrSPaKDd3CRhATcAfJ1x0GMGWRG9SIetxlAQqV1D/SvPOIVPj3zqZyrnd+4UaGpfx
	lPu8WSSlkySRIVLUtqWhkvu5Qt6WslbmkOPZ8p3JdK2Hy0HjY=
X-Received: by 2002:a17:90b:4f84:b0:38d:eaec:4383 with SMTP id 98e67ed59e1d1-38e1afbf3d3mr2279874a91.22.1784030504713;
        Tue, 14 Jul 2026 05:01:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/10] ASoC: ti: j721e-evm: Return the original error from card name parsing
Date: Tue, 14 Jul 2026 19:00:35 +0700
Message-ID: <20260714120042.491712-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error from snd_soc_of_parse_card_name() directly instead of
converting it to -ENODEV. The helper already logs the error, so drop the
redundant dev_err().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 312298e0b004..600897a3e1c5 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -870,10 +870,9 @@ static int j721e_soc_probe(struct platform_device *pdev)
 	card->num_dapm_routes = ARRAY_SIZE(j721e_cpb_dapm_routes);
 	card->fully_routed = 1;
 
-	if (snd_soc_of_parse_card_name(card, "model")) {
-		dev_err(&pdev->dev, "Card name is not provided\n");
-		return -ENODEV;
-	}
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret)
+		return ret;
 
 	link_cnt = 0;
 	conf_cnt = 0;
-- 
2.43.0

