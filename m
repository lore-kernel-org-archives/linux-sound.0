Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D038B15B
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993785; cv=none; b=sl0ZlsAl65Na40ja2ajphG0wvsm2JlcT3eQZVrEp4srnt4BlTkEyS06XhMybUNyt2ZNp258ZMz9miewD9fkLy9RqI9PfTZUZfHWoRoWo1vqRTO6E2YrysNURQ6i2NP9Tnbtv2+hg8PfXwod1uGodyNqmUZOEjwoR5Hyh7+z6T0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993785; c=relaxed/simple;
	bh=AdAcsu+F2nHo0B9JO6GhlAQMeLvpoicLvleufnIkTJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNBW8OeuYGnurssV1dtxmtVQTCgD72Mig0spQfo+vKix7Va1uSOvNtJ/rIuXu2Q0fFbGrEWrvrblWQn/8/QyiCG/01dUFxFReQ/p87qbLWA27ITPu/CiLt2SpTo6Nn5emHpjVgMRpKGYi4IsyYYEHHoxFyIUC+Q8wjHX+Fv6aj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqjvNoS3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqjvNoS3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486672f03cso2196790b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993783; x=1786598583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBK+k3DpjSm3fu5kk5NiqqkKTtgyJPYe4ia8RdreH3g=;
        b=AqjvNoS3w090ki1APhxW6BBC+09w3LIs7CQCwyOWMo3Euy0AVsh0y7LK+/zoRwC5ZA
         PQrLTRS4TwQh+1u7iukp3Xdqo8wZMbTNyZJ/YDATxUMSlLJSOWiY4/to+BUPb5gh5V4R
         zcVLyzMs2ZoKSeL5H3H4FlDE27304tXWy/j9AY/cGDmvaNzVwhrLJfMcam/OsCsz9PB3
         9X4OlNbGieF/rNaEtlJbK67IOSwVsP4duBTRWt2HubB7wfVDNE7QJq3HkEbU2rJmUlVn
         9LGvmPF0Puiu7XE1kJrlhCV+2XXsfF0FoBZTxnvGbA7Ui7syLNTHO4qEPx99TV6EmmlX
         Hd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993783; x=1786598583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBK+k3DpjSm3fu5kk5NiqqkKTtgyJPYe4ia8RdreH3g=;
        b=lZJEHK4drb4tadI78KRVl/LkdakLRooMYOQxnWAe7P2znFA+pOAvflZZHnwZ1vDzlm
         yWY9eHqgWPBdeO0xuyxn9t/nR/+YmfdVv+bHUjDxtEvmFI26a4b8Ywk/ALtikccF1Eti
         LIUU7lRE/F5uTrjT8j0aXNZpWqTntbYr1EMojaszrj3VLD95WatQANtz9KCn56UOeafc
         GbpLGvHRQcos+lJ3uJlaSOAwp9DI1103Yn6ok4KYLJX/la8ZAwSHCCGkVd6K1p1bKeS6
         3REGYLVjy4iH+/gc338b8DeOz8c9Z/jdiz6+J3X9u/WDLIR367jsmXiSELNxi9rkncuZ
         dFiA==
X-Forwarded-Encrypted: i=1; AHgh+RoKaJz5PqS98XGf4NRRGRy+3vcblXNd8lNazOdmGpIttPnyTNxU5/OIBx51Fz0H8PLiT+6gGFcDOe/k2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkoHXIw9quSDSohinrqrYH8kgyfpSIzfa8t8+OtiKRBIqJ1eiR
	1xXppcqWQCq//ZAUwiMATa/CQE4XYIzHTAPnD2knC9epsWo0eIZ/DEm4vj3MbA==
X-Gm-Gg: AR+sD102+46HwxwB6XiN7NhlqUNNdHX31NQj7QEgn20pN3kemk/dVvD+Wqhmmu7sRbY
	w5rwvv+lkUs/LV307BEv5C3hwp9OFp2pBYAcZXIinP7yvfYYKQP5Mg4HgcmbX4DBJKA/o4CCMMO
	KlpIvnlsHFPBnIGvLSKC3bqc9zCQX5cLYJiPJqV6me4v4jp+DvoKRgqd2cByAOChFXn3LRc6d+8
	rx9c8V4dhTSAvlxso6UjwpRqEUFjwqniC8aAq8G+yFJ+wEFQtkLTY6cHL153YI++X9b1R+zbu5Y
	+nUAIMCeQJ+IYyJJU8lunSzYht+MOKUxkNH1DFNTbCOyKLzY1LqNG1QLU3Q5+IkpnJg4M6+I+ps
	5vaqzBKB8kFK7R8u0m1ZmfDflqBXDbQYCFJeMj9bK90n8CudXUEMdFp7Bc5Kp6py3Tgk8zNzqT0
	4ZD/2kdNX2qOtfBykpKndBRUpQaoU3f0Tey/bpLxladX1A+OG/a8+PYkhOqAEKlmBr2ZIULlxhn
	hmttp1B0vEbUg9/ZuBqsSqWtFLn/G4GierNZ01Uhylwbt2GDtsOxlsAbA/QHOfci0/1yr8duRS5
	+gWz7k/KdfuqLAnp
X-Received: by 2002:a05:6a00:c81:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84f2dfc4763mr13549981b3a.11.1785993783204;
        Wed, 05 Aug 2026 22:23:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:02 -0700 (PDT)
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
Subject: [PATCH 12/14] ASoC: rockchip: rockchip_sai: Return the original error code
Date: Thu,  6 Aug 2026 12:21:34 +0700
Message-ID: <20260806052136.21034-13-phucduc.bui@gmail.com>
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

Return the original error code directly and drop the redundant error
message since the called function already reports the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 522b4f4f6a7a..1fdec12a0d4e 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1434,8 +1434,7 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
 				       IRQF_SHARED, node->name, sai);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Failed to request irq %d\n", irq);
+			return ret;
 	} else {
 		dev_dbg(&pdev->dev, "Asked for an IRQ but got %d\n", irq);
 	}
@@ -1458,7 +1457,7 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 
 	ret = rockchip_sai_parse_paths(sai, node);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		return ret;
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
-- 
2.43.0

