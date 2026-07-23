Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDEB46AEDD
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805059; cv=none; b=S6Y5CgCCIH8FXruzEiTjJLrB/H+FlfK5dNXlbZnpn3sD83r1VWwlKTK94zMlSYDS1ZgDSbZjgW8kSvJQQnGpU4bdqls4SdO/pYdZcERUMVVGPm8bf8cpnpavoNeXSpLR3DrCXVSesISlqPEoGO9IWYVPLpzSOgXt8S2IA9QTkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805059; c=relaxed/simple;
	bh=zWsDJ9w00PvmiL5K7NvXHakKWbnnVtjba/fbAiRXx4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G57dCqwVd8XqsDUPwzmueGH7rrmbi+F6/J9hWeA+6ocA5rtTxB/TGUYLyib8pHJmgwAEZnYuZbAviywwt1dvEzYiZrGwzn2mhfOlH2SxNeIdW+/1E0CtgdXwYbp9dljJdS15sdezPrJagk3FG8AA1gE41WPRbdBs3UoXSxzMBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VshNpWJo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VshNpWJo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cae1a3a744so3641045ad.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784805053; x=1785409853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYqAoIaQg5nXDhd6691kkf7D6EBBcVp7XG5jEmvNbhA=;
        b=VshNpWJo1YJP4Ti8m6FvJNqA21m/0ind3uXRLwM4Gw6mE1G2XkzNDqNmrABe7yj9a/
         CGE6Ppa0djprnMiQrOdazuk1LoOXzMPTAYUrg4VGYEDO3+l0z1l7UC6pbGG/dIcBkXc1
         6FYwp2sH2LxFXGZ0VLFyGOA3qi3IWGGA2bticpOXd/sUdSvzp7dpnEqf8osu8gZcejTh
         nWlVMbbGoOgIcNLHjoB83FqJY8vkKzfVindNKNd0Zlso0w7/7imKefx5zime5GiMb8Tc
         ASEGAUXJTm05Kkeix8iFSfbrBTzGm/Oou1MEFcjh7+yCexWUlG57DUsm+l9uwrgOaNdt
         3hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805053; x=1785409853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYqAoIaQg5nXDhd6691kkf7D6EBBcVp7XG5jEmvNbhA=;
        b=GagUqLBNnz7jWd4TnZWIGHGanMb9C9bm6Zs6z2vIyaK2Mrf0Cc4IDbKbl3Qvz50io5
         RDjtHLeUhSrVJAxMwG6J218Z2o+BhkcjWfWdL95Z5/6xJCh8VKkhFQQp2gI1p6DRhlD0
         5Qhqt+j2AQdS7KufWs3LAHlLBvzXvxr2fyKHvtivJfxFhbfpNu4M3+CJHseSlO8PNJlx
         QpP1z2CR+Whn8RbP3HdmZxWb9yLWBEm7dgcTeg4QSVMnm0/UtB0bLeGS+XuDCtcIohfx
         EW1AEcTLPU2f7Ub9pi7P8gh8p5OCPs87RDjJO/sNKew3dwKCubEMGVmzKiAX6nowaEnH
         neng==
X-Forwarded-Encrypted: i=1; AHgh+RrbZsAQ27AEYylmLPYPri9rZEzkp1SwPZb5h8PydgyuC8K0Q3TNpE/RknJpOwq7EJmPhlC71dYeEGnW3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YytpcnxXv9tzGQJAIXwj2+hJGc+UevvxQdNgtV0z+N7d516uutb
	bpPKkdnH5UNFEQku96WLCFoJqOYH3o7SbOK/vLBoJ8MpDu+LVxxdVSU2
X-Gm-Gg: AR+sD10rjjzTAeoy8Jxhf19RhmXmmhVlsaSArJ1whIVstisNJr2EaCkxmMMK+TuSGFw
	Gq8lcZANfy1AhUdcSPh3UNP9RdYasZW6HNlVMDr/1//xARrJYrSJQYdrcqyZXJop9jtJJ5LtqSK
	ig067IOqxEWtIeLz+4bHhwaWICUFmeDo1RFQb52+IE3cSAYiCSXrF/RHydPivgyKiiCSHZPUkp1
	75gfpogQ0ieyc+n2P/E5iNrIMSJoAJeGVOlfbnRKdh18vvbTfpWIRM/cvmWKmZ6dowWv0LFxpPA
	mHIg+HPsD5XLHocszzS1V12KD3H+pma8Y3VSjMq0Udl6TODhb/eIjIhIg1FCM+9g1GGqbP5eqLZ
	/KMhVttjN3JAPIQ2WV4gzzkTFdw+xtvwBjF/Kwxsw2WR4TILEj9hUVQRV6QiAXJpnrozxtDtbpD
	i/sXMw5FbHJX9MzfU5NHsJ6EaDqj25dmQH/mj98jPZe4i0K0k=
X-Received: by 2002:a17:903:1250:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cfa74e3b0dmr30593435ad.24.1784805052930;
        Thu, 23 Jul 2026 04:10:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a893sm31500805ad.77.2026.07.23.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:10:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: starfive: jh7110_tdm: Remove unnecessary goto
Date: Thu, 23 Jul 2026 18:10:13 +0700
Message-ID: <20260723111014.54071-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723111014.54071-1-phucduc.bui@gmail.com>
References: <20260723111014.54071-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error path after jh7110_tdm_runtime_resume() failure only performs a
single cleanup operation before returning. Remove the unnecessary goto
and return directly after calling pm_runtime_disable(), simplifying the
control flow without changing the behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/starfive/jh7110_tdm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index afdcde7df91a..5365ebe44471 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -615,16 +615,13 @@ static int jh7110_tdm_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = jh7110_tdm_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
+		if (ret) {
+			pm_runtime_disable(&pdev->dev);
+			return ret;
+		}
 	}
 
 	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
 }
 
 static void jh7110_tdm_dev_remove(struct platform_device *pdev)
-- 
2.43.0

