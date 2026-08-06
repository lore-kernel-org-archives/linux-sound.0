Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8B3914E0
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993777; cv=none; b=gR0tdpLhiJUICEbjUbiR1U9vfUtaV+WvISBJ1O6Kj5KgNxobGWJxpVzVLiPHBoVoE5Sv8PLdyhWwfuYVis0MProUvluJPiIPHVI791yPjm75cE/+t/wsyH6DTHVwA42s7nfus8IcOfXxfJ2iurRx47CRJZ1KBMgXcvCdTsVrr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993777; c=relaxed/simple;
	bh=kYnY41XhHrs9l3jYEaLnOloNXLVqx0TGcKVXK25SR7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox6vKSmC5UC4YKrb04xnFIR3k99AR3YYMRGiJckiwwzLECqu3AGgxcXIqLFlaSX/oWzF+BQv7KOtDv8wSq4OTwAlERC2INOROLZ8qTmiU9wI7sCIgyWBKiWojuwHPTc6WQehoYbH1U1h729Wb58JtFNBxm4XMniI4W2iIjPerwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMnrHsA8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMnrHsA8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486ac3f347so631957b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993774; x=1786598574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VI1znOBQLbz/1vQkVjAXYLg+Z0oCTtt7na+x+SnaEEA=;
        b=cMnrHsA8qb8ODp8Yxk0v5cGa+JOCVAM+4PtbtQc1CLhmt3hnjX8lJEBGFjdStvSE48
         Hp+n9MHS2EbmR6dLMX7sp8NoHE9yxrMzK1sxWUvWGT2FtfZoud3/RYJXkEchasVUe0M4
         F9bLnUuH8uGgXvp2iJlPT0kigLShAGbu7Ipxz/B0xL7hMxxW+nlMgAlEDWUfmcDA02Eb
         /ETKxngHfH0+jUVipujZY2iwIBRzZUzAiyCu6q2RwpjB8H36s5L0EXJHCHM7NNYdQOl5
         gsIwUXQQTRaUN4EkSCAbIX+p48ZyJFAs4RQf5uZFGD2t9MfZ4FX84/rH7+Dy/+4j483U
         35tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993774; x=1786598574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VI1znOBQLbz/1vQkVjAXYLg+Z0oCTtt7na+x+SnaEEA=;
        b=dGs+6mnEWLM98dVQUQ0ZHXQb8r+bETg3quwvMZWStdnNKc0UOtHUjboDEY5/o+N13D
         L4Jy1lpL3j0uYFNMi+PijCmXSC2Q7M4zqTH8JktvIAcucYel4+NrUZMGvLZXEA7Eo9BN
         NzCG6ZNKIqfIxBhjJCWDM8tU7AD4E2UHrFtZFrTs4bPoHuPqFCS8qWDUboGP8F8sCufM
         5+5QJaFbBg1Ok9kqY9F2xciNzKocNoQ8WCLYWbuh6mYDX9H81CWT8gYVL8IF7dZ5qmQX
         NVZD5Ozrd5CaZ/vNqCO3xtZpIXNoOJvLQRcuiXYklu95aAmrywG23y128+dAKXbHdpAJ
         I7ig==
X-Forwarded-Encrypted: i=1; AHgh+RqrLhXFRWuUMvsrtASMskJAbB81BRpH7usFyz13Enw5EPwRqYu8KsBaOslT/1BrnU/VozrBYKg6RFpYYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWqdBm3OS05rSfoAPuKAwRod3qz8UbAsyMAQO8l5XLLy8lBUP
	LAZB4KnEznM7cvRw21zBniVS33YOVjpGDTtmfBQvmNskpRP5fzANXgCl
X-Gm-Gg: AR+sD126owV+XACUPq+MhUcCRbup3/T+i8ECDFL23mt4iEH06dyQiaZM4KE7YJIF9N9
	phkR+M1OM/hF8S4yMy9XSD7Ee7t89O3o2K4vVlRe+gsWeUvI+O7sRenZLrqnT8Ldqtv1g3++o6K
	j3ygnPLorNrJYYSS0RcvAtHWhWyuBf+r3pGuFxWxYDTVxDXniJWTF6fXw3kJkvJ7q56eRJkjXBP
	kasV4fqjD2kxrb2CEzBj9Litfg/MSul1KiXynXEOKfigXM0G2s5DoxNjzEy22xMmm8yPXH/3ZY+
	8lbqPLt/4Tnm0R3pIP2H8d+ktBlZ28lOsOZRfbV+uRsU0Y/sTbt5+pGHP4s2WAcefJQwgdZR9W/
	D/8kJ62V4Lb53rXkxXOrZL+tVBFbZCx8ytN73i1kFztQAwqd8Pw97cFEEz//1YTh5Lj2WEX1o0r
	uDIJpaOxoclxTdGKfLqNk5roPX9uHSLy83OjyIioc6aM6QxjYcJNoLu69wLNTNDC9u7uixM1tlR
	O48IR0l+acy+FlBSS+7M/6xEcbkwe0htp4TDTZFzE92D1IMeGyRZB7PqJOUjUMAv+acygVWMJjk
	axhD
X-Received: by 2002:a05:6a00:b56:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84f47dbc610mr1869903b3a.12.1785993774069;
        Wed, 05 Aug 2026 22:22:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:53 -0700 (PDT)
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
Subject: [PATCH 10/14] ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:32 +0700
Message-ID: <20260806052136.21034-11-phucduc.bui@gmail.com>
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
 sound/soc/rockchip/rockchip_rt5645.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 590b64b362f6..0432eeabc64e 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -191,11 +191,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Soc parse card name failed %d\n", ret);
+	if (ret)
 		goto put_cpu_of_node;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.43.0

