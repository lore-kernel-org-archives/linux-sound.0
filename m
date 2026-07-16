Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC543F888C
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192958; cv=none; b=Dx0gMIStTtbbFI/rh5DSdLHqtGf9q0VMBBJKEgSsR2Y1dpIVjoPk9Rhf4OF9daJLfYOIRksb0O6/0oYmprwhT0wOu9Wi2HuXPKqXoyl4jCTnr78pQ/iZYcBzgTdp3NKH+LcsZ15H9lOc0/KmtZwdWbOxp6KQ7onTNF/DRj+/7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192958; c=relaxed/simple;
	bh=NWzTd6xiPdBaZy/6UXtXar/YN26w4vS061xIq15Rj1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJbtV7kYd5H2TtjLH2Z63snycAwfETvDQVkq+U2yjaZeRhl/SvlVjd93zA8gv6wc1W/C8OK2BcXn2paC7d5ejcIzlu9ZkXyNh5hOS1PgipHTNLVY3tCYKYfKTm31KDB/UE7eggP7T0+//Ql9S/andt9RFEkofwt6C1rD7NquzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkBJ/PsS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkBJ/PsS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8485b358552so7092713b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192956; x=1784797756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=CkBJ/PsSvYlTocYbpxWPb1kLxj+ySE0n860uasqfAX9lxj5OirIbG7fDRepzh3f6g8
         Wcdeic3b5x2WjISBvJ59hR5JyfrDnonCHKs5n9olT6x+PNgaFr1hj3JxSlhrVvln3is9
         U5rbihT9SzGbEgicQ55hIXXeexPFED2Yj7Dc2El6byqerD7ykIYWZECXVXisDgIZFmyV
         9yPsT+3HA+gEl6c9Yc82g2BGzTA/luL4K37NNitMq2c9CaVZbHAcf7mrSZs7QbcA4mVo
         Ys3sLEHmj7LhNhoIeV+y5cCYgQgiS0t/F38pNuvnxtYgg4sa9fT6TtljiUW1FYd+NxXg
         ONTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192956; x=1784797756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=f7SgmIH8JGc5fedsMXFLsZoOj+YX7caqTIFqBByoUW0yenmBHIti2wleoIx7slTWxV
         6edtxP8uxHgFuqM/RsZq7lJ880zbYI1e5TQKuEHcSEflgpy2h6KpZL7xvq0KKsVSFbMc
         lw61XDynVRK/YmriY49rZuKw1njSzQexozdG4MZ5D5gDPYP7y/qryUJ9tzNXpNL7z6fj
         s12ZzCjBXSi6CmrDD4dEir1D7OfUlPUZ+DfbTeTe1mWHFpcZ3mtnQRLJOeQZXvawYt3r
         VPdxad01cTFm9yYhiIUVLQIIT2LyZklafIDbJCYYbnKvziwfb9xUKoy84vYpTnyBMGso
         PXCg==
X-Forwarded-Encrypted: i=1; AHgh+Roeqmuld59kyOkLXCh7dklri7dllhVCSylLpKOCU5iaE+O9DnYzis90nu1ZYzs64bQyQGVCM63SaqG9mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzu3ClhmNYaeqRicWJJz2fTdS6mjL1UiQ/5H9aLasjcJbt2ntE
	2I5gCOWObxPkSBlqL/55mObfXtMMH/olmy+3JP6SoNAuL8zcfSPcdiBU
X-Gm-Gg: AfdE7clMUI8alwwqJ7ZXDIqKV1CJEWBti5ArE5BEdDgK1x+Nh8gkYiw519ZHtRhKv/w
	wsETxq6QtZ5OOSCf0Mrq7X4q0/G/GlFb/9yDGxs1txM8rasukhObWsb7nxZoAImP1RLjHXVzbmn
	+hitHoU5nvTRoIaAROT1ZMdq9sbTN1HsRFV4K9ElD6PtbDZ7O58POdtwnQvN6rsIT0BCz6mfk+q
	GcpoTL+AIz8ZRJemrKmXZJ8wELWB5XlwFOFmYDWjShwW97lJwNUDYZaXQXJxS61T1xoRYibn1Ui
	F72XjFgRj9JUBrJNUkGn11zvHMr//CebYkLDHCqQMDTDduPcSuwUWeoJSOSP8tIJAFu8qxOpNQG
	EH5B8/JFmiCz65n6dW1hxjiSjMav02trqQ4ni+bflxBuceYcT5DQcVPdj5oXHpV4xtMzGDfmj88
	Dhkgx5qIMO/kneQsCve2N4L8CpHcvMausQp9I4
X-Received: by 2002:a05:6a00:189b:b0:848:5d22:b513 with SMTP id d2e1a72fcca58-84a559b0cb9mr9683324b3a.53.1784192955782;
        Thu, 16 Jul 2026 02:09:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/10] ASoC: ti: omap-twl4030: Return the original error code
Date: Thu, 16 Jul 2026 16:08:27 +0700
Message-ID: <20260716090829.72082-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error from snd_soc_of_parse_card_name() directly and drop
the redundant error message since the helper already logs the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 4d80f8a7a947..2a80e44035d7 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -253,10 +253,9 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 		struct device_node *dai_node;
 		struct property *prop;
 
-		if (snd_soc_of_parse_card_name(card, "ti,model")) {
-			dev_err(&pdev->dev, "Card name is not provided\n");
-			return -ENODEV;
-		}
+		ret = snd_soc_of_parse_card_name(card, "ti,model");
+		if (ret)
+			return ret;
 
 		dai_node = of_parse_phandle(node, "ti,mcbsp", 0);
 		if (!dai_node) {
-- 
2.43.0

