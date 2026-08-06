Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EEB30DD22
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993738; cv=none; b=XAsFS7JX4q0UZd9m9Qf7C0XYX7FFrRDplhEy4V6dHCZQR5OkPbOx4SVlL14kz5Pum8w26LUHDz7sICPboOlTASlJaalLYHXYdpQMg8M8VPx79CtUochDJLTfA0hcTtE5k26OjIetrMamevPiELEW3/KLRreDfJlI25USJ98x4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993738; c=relaxed/simple;
	bh=O1Br8zer3tpUhuZjx3avPjjguADNJ0WpAdjii9APXzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6YkfCkFJb3AkXJceIrsVmjnLp0KKJot8hchOXTaSmXEXtaVkVgvdsv6zo2VxEMIwp/Sm+CYNY09NHotaFJ6UdhP4GQWDlAI91Gz3g1yCAszrl2AGMWB9PgyEzg1puBuP6i1MybPTPEoW8WM9XeQX8Q7fdiX2EcXvTzMtZUxS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hacg03a7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hacg03a7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8484f229529so1551569b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993736; x=1786598536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDuDwKR82JLi7EFxiha+vT2mlqKphTJuE7gvFBWzRzw=;
        b=Hacg03a7Fc0/Jz2OGbHBxWewly29Etuvy5+OyADmxlzhejMSqEcQmICy1Tpn7skvr/
         Iusb1sLvcbjIS8wP6PJ7y7nOa3byO9MW1tIVDrx7XLa8hqTUhhFsebYGcbHiVZmiKpCg
         EIE5/mXFPoZaLMExwVBCX9SDFI4QWGtbfOPBSuZSCz1J1uEr202J0bw2/LFsvEaxy+gr
         +0od018RAhPZQlJDknCvcP59XvWw9P9PlbKcBPIHqQVpKY7E86j+S/GS0US6xf5MADdo
         cOG1ERVmK+smkvFMFjUpuwdzv6G7mtcnlsparSYA3eCojEJC/j5Jbvb94pi2RE1mKb+1
         6oYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993736; x=1786598536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDuDwKR82JLi7EFxiha+vT2mlqKphTJuE7gvFBWzRzw=;
        b=qBZkAFqzt5d1Fj5VH3xa/COzcsqd4vVyAtQAsdK8R1wjgYgTF/1qUFikqc15lfGkl5
         kpmZrxKbi7+d5iX2z0xFZrChCFYMhFEFdSHDKyBbvC9m6YN/iGFlhI+DH021I0yUYef3
         NBhkeWGTRBYch8gwiCjMiWgaExteCg65O/bornmncuX0SqkFq25MgsWUeZFMJ664uaK3
         2S4/5DzBnhruVhcr8tVqn/61zhar7CFoW1hnqJYvhYppgygQLCoRXOw7icegKiPjL8EZ
         wWN8jgAmA9LRVc2htC4NPDrlvZd72t5phvo9TR6/Xj2eLzI4NWAusdGGUC9v+k4WCZyf
         P71w==
X-Forwarded-Encrypted: i=1; AHgh+RqPv3J7WQqGOvkaTnEDw/FucVGMZGlCNo3tt0eod52qm+Ndumu4+6dkAK+qSMJvuHHizNJqX1Gtuqnf9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96duecTRCJX6pa/VeUVcOZObVGuPO/DdpsIKbQepLKpETxME4
	Sc8Jc2qWNJSrTp+TZlAZx8V9Jk5a9ymPKGxftRCLhYTKD+zaB7Nq6uN3YrRO/w==
X-Gm-Gg: AR+sD10cCBCp4mpMLYMEV4bad7zCSTc0Rqs4+tAp7Put7BaILK7/CmrkMTlqaubYKLD
	jJJQE59VRu4WRdSmF7SNVimLDXiwRnzZ+i/VOSam5Nw5TSBSpV+pbmzlZYmS4tySd+vqrPBkMy8
	PzV4/s2rUuuSbdMHJFfSLTMJT7St3uYsMoUdQ72CFCbPrGWSW3x3WriGUo3NF9/MJj/HLef0Svy
	KrGsmnqz1gQ0jhPdjoafFnXSVGgweFapmImJDrHgjPJ0vsAdR3RI2T9cMcm5iK2XbxeJR72HQNI
	4cA8Q884XG77ncp10mMu+4IvpcXjgcmjoy9qTssXDnQe6DrM+SMQ1MAL4osQwNsvFGvB+qVMKp4
	54PuKcHqj72V0RO5e4jSxl0TVu+be+i32wAA9rX2qkH4KxjPVb1+g4TrmjyaQqcKtGJ7CbIlaef
	Kc9qgnUR50nG7XDWE2V03CXRJoTbYFkkQBhdLcwz1oO7yzj9R24E+1ERBCJ8aNxZiHxeKNmg8Qk
	kC+tfpin8lAb3naDA1lhUFiMV0aEQ87oKCW9TV/c3zOTPl4XdCvMSd+K+chDIyJpuWF11ShQWap
	fFQbbuBUWUXBJB07
X-Received: by 2002:a05:6a00:218d:b0:845:d6a5:716b with SMTP id d2e1a72fcca58-84f2e07129fmr13301068b3a.23.1785993736232;
        Wed, 05 Aug 2026 22:22:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/14] ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:26 +0700
Message-ID: <20260806052136.21034-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 3e8d07b3fc1e..354430f916f9 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -829,16 +829,12 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 					      &rockchip_i2s_component,
 					      dai, 1);
 
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0

