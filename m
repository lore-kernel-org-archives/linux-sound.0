Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FA540A944
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198385; cv=none; b=X0wnzLklYWRnm57/a/1uScHESv/CrNbT7cMP4tCo1fG3LenB3aTWcCe/HrGNUCTShVrFf0329vvovzdcDtksdh9SjjVIFcGnx2d5bXUC4lfSA3sb4hJKC77VXdWbIroCJB/VIAz4i3u3dAxg4sZMMOXxXXbhBH4tlGkw3JmS6tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198385; c=relaxed/simple;
	bh=57NVq0S2AlHmeh0L3SJpPKysGLjaiNdhbzGWZRlh98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfN/sjKxk/Ux1rboENtV/4r2TEU97qQzbK9ZnYAJgx0w2EyQSo1NoaqoAmk+NAidZMS3xkGaPQS+aNfiRMscMSGLGIbT00BaFRI9NmsgG+RFL5rwvIa2rDLH2UL8xgK/su2iAd5zcxogMGmKe2panezVr0WZAd9diXocln+Py6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbuXCJV8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbuXCJV8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487b7b4066so6651047b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198383; x=1784803183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=FbuXCJV8eJHyRZvMODS6/lWX/uNEKrTPr4Oz8G3DhGte/hjKH09rkEafJAM2XkZKLS
         JihlEhLhFhGsyeEv+TId7gw319opturN07orKSBLJPu48pXtIzzNeBlEPta4s5QMYimR
         njy12N7Dera4u++Qhew80vorkbGXPT1Hd0lyX49evvZk5smU82XcfWMUBeHZmA+jOwrU
         76ybt0ix7FDwy26fen/1BPjfhYqgNO/1jRMcQMYJGqfXgl1FOEB4quwvNF9l94KyZh7j
         d56guoQoVrnqVRgibgH91QncjZX+xzUd+kxvqFMd9F4R848F5Ku2GG3T0Q2A1WuYrTR1
         ZPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198383; x=1784803183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=Pko7UF1h8Eq2W25eZc3m89ZMD3Vwz5ErgZCw/VpmlrmUgAv4VSWvIapY8EIwbiEB+6
         nUCPN8txRKkVyeyMywRf+IuxYbOhXQ6F/gzoNkPZfuNQICsy3Cswk5nKU6Aw4Q/KMnU2
         m2FtSibqrpUtzskeXBXQDsQu9U+YxsTQqTO9qYL/SxAQcAvMdLdvojkX8PZkA6Onu3qD
         WgLzfdmjJBCmaf1ZefLUMz7lmWvzvLi7xeB8W0AfvWKJGQylIL8NMvlTekQVLk3jbuvV
         tIQDbdCkCqB8kUu+OXcLe0DXUFmqAwniZt0f1dZpgzRIaj7sbPFtRFG30C+6Iyebhqfl
         D1LA==
X-Forwarded-Encrypted: i=1; AHgh+RrB61Ur1eFEsr1xY9kbQgPfihUmYWHG1J7OicjT7B3Td+eBYSEpl+ikM18Wtap8Gv+yMosbe6+BonI0IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRymx/qqOPOneXtKHJfKHdssMR8JZWoRHhyPFNtiw3LenkPe6
	243kHpteMATDQAzp/s9ly9Fe+WJGV/FPEvCCAa8B4HCqIEjYjUjgexim
X-Gm-Gg: AfdE7ckCJ5MEWPVv5xh3APGbnZlWoYK2c3uTF9crsNu0vzg91a72DBiHARfvBBGqJan
	qSu3V7Qkxl831J3pLKBe7Z3vtj2MetJhMQlZExI9Er0WBiURvAR4wg9XjDmjlGyfLfOQSoJu0P4
	02g+R6B6lm781lpThBDR7RRbAR2Ni9DlPUROWfou/jQk1Nlcai6vYxQJGSEUHGOQj+X/buGLoVe
	vGA8E9C+8kqc2iQzP20f2hnHfLlgxwrOML74eVsmmDGQHQ7Xivs/2ihtEoeJUPsPbTrs6RyZO4C
	I5he7qfy7JlZvDb+1C9f/UM9n0JteanF/27HL9B/ps8d+pY5TjGiTM4eZ3oqtT35fAgvgJUftso
	O4/HNnvha3c4LxcUAHwgr8tio+XSztAA5HeXujilGUplBMFWCHhNz+r347G+NTNhU60YrMPB4Pr
	XcJbvknqDcr5YZ/e4b+jMJf85o9XSeiQkeSd6L/ucGg2UMJM0=
X-Received: by 2002:a05:6a00:12e4:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84a672b5a22mr6051225b3a.40.1784198383132;
        Thu, 16 Jul 2026 03:39:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:42 -0700 (PDT)
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
Subject: [PATCH v3 04/10] ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
Date: Thu, 16 Jul 2026 17:39:05 +0700
Message-ID: <20260716103911.77652-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original errors from the OF parsing helpers and remove the
redundant error messages, as the helpers already report failures.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 56aa4b22083b..dfa931071d81 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -234,16 +234,13 @@ static int omap_abe_probe(struct platform_device *pdev)
 	card->dapm_routes = audio_map;
 	card->num_dapm_routes = ARRAY_SIZE(audio_map);
 
-	if (snd_soc_of_parse_card_name(card, "ti,model")) {
-		dev_err(&pdev->dev, "Card name is not provided\n");
-		return -ENODEV;
-	}
+	ret = snd_soc_of_parse_card_name(card, "ti,model");
+	if (ret)
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "ti,audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "Error while parsing DAPM routing\n");
+	if (ret)
 		return ret;
-	}
 
 	dai_node = of_parse_phandle(node, "ti,mcpdm", 0);
 	if (!dai_node) {
-- 
2.43.0

