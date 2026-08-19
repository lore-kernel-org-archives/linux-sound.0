Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5144CAC2
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134757; cv=none; b=m9+zbWrO4XVpSmlBvnZC3KhxNfvY64KyZGKuS/sxpjnxAYHMdfr4Edzzbmt44uI0GcFFkFXYGKDsZhyYdI++XEES5m0tJBfN3OVQUNUWrzSl8IuGSa+D9H/k7S0eWiH5PSa3jcBnc0Gzr9jf+QzrWgRPVU/m7cMaQk64oaYq890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134757; c=relaxed/simple;
	bh=zEAIp01i3h10m+RYZSGGuoMikAPiELBP+Eozmgpa9VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7HkmrD+fKanmbUpF1foXvLN/LIGVmkxLuf8LYyL+xM8eM7gkCyZOTBEqKbj/5oTzx/HDfI9+EVQxe/vbTKj0dysC3SBZE9wiC1pEjWwi1l94D4kzJohcigGdMF9G8WXRYsBKVq2sd298f4VrEdcHEKqAeahpIWojJih8nGP8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXdXTfL5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXdXTfL5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc61541f8cso22764615ad.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134755; x=1787739555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=BXdXTfL51tXYJ+Tb7hwo1WvJyZJWZwCwsHeAkTBu4xiBpScO32vNgZZzCdPr9JN9da
         77A3aKo5cKFzPvKu4FqUrAeysA6M72Y/hxedewoOqqQZ01DakXt03txQZ+CfkLiJH+Ol
         pcJzhJPRA3qPrjlYiTfqoxc2lP4cpP6GZvRsizENL4+rdw9gFbWOFWpP0x28rIjh3PAX
         +P0Lwa8+zhHuDPAOPZCndfFSa5Zo7fgEakER5lRxBiUN9WqasDvbHNfBHoeZaUFQ3chB
         myJClAib+BLg0TwO8oIpYRmgNKKuw1om6x1C00xePk3zIXw36MyGpgMnzi6PGGatQAIY
         kM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134755; x=1787739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=N5LiLXKTpK25/kHujxnPRuCSchwjzffFUOcDVpqwxBuKFmSh8nshDPzDDuChndlGtg
         9dXwljI4QmzrInCVbJL6vUwKN4gvS7I7m+RQIUUbdXJkpzJjYQ5nbbr9jUcVGw3X1DyM
         ngouX7xK/HUJu4Shwc8KsXajA0IBccAa3Go39jJQRxmqvNFBlPPAda0UcqxWdm4q4xcN
         ZmLHiM4k/QfrZdrlMjx/b00eZVXmjLlCu09Ya0r7gRV1ESPswTejRY/cAZxxkDdSiJEL
         WJr7OUak3QnAAJvUz/t30V+1lAMMsfExOKEEFNK3XH6p5ympuvirKUo5yadBNDpHn1H9
         0yaA==
X-Forwarded-Encrypted: i=1; AHgh+RpY2sFpsQK/xieAad9kIQowwCT3b2pCt3hHI6hMhxvpQx0S6Ro+VqzaWc97BHrr95Yez5tHiCxWhtIbNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nFdkEhfaFDAlrkLzdBVBNw2zBQfxl8/k2y9wUkrnDhBLuGQDCM
	8gFJEAJUFv3wNal4sA5FAiMs0DmifPpz1H1EDzX3IAgM5WAnrEGMFeoX
X-Gm-Gg: AR+sD11GAEnPzgLsYVwfJ4S6jL6ylNVufOMnloaiWT2lpuj4SyiShfkYnAcfyJZ1Njw
	bSxfoQHHCj/LiX01HpIlU7LJGTE5+f/UWLCM1oDTiadRaD1F/Z18YMRTnWwi0CCeCAPpMBdvbGw
	ogo/8tAqK2DdMUew4Fnvi7ZRrIyXSLkjSt1MgMVaTKBhW1JdT7EGpaLGH/g/Ro9H8Zjrt5SNMEP
	s/+rLEXZMhV7xQL5HzcZWD7/kUqERlXC/2Xg2mNVOV7TVuQUNbKhNaRSEY+CbgNEvDxxeG+PnDD
	EcDQhPTCOW0Gr/2qP51kKIe9AS5vGzND5b/dAhzzQHeHFJ6FkCIzbm1rdDNVicfZCJ+ajp5qNJH
	PhFTW1ug4koggEYndCxfXZIw3hVVxItTyIgq+3w0ymyJlLLOJOZmB0HyvOTVqsYHGYotXqAUyuz
	w8zHtfXm84zt+s3eiv/JqKfWsTqf7Tas8AHOxSaOhsSm45Hani+krdizrrnSJdMCCMA0Typ9GGf
	4pVE27TV+6j12PzWH2JpN7A70yMto5dd8zvCsgmBOXs3pKBiFotJMx3KDJHfuOXjvTXZTqwnctP
	pbDCSHjvK9Pvzc4=
X-Received: by 2002:a17:90b:1806:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3957fa95452mr3353886a91.9.1787134754818;
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:18:49 +0700
Message-ID: <20260819101849.68010-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

