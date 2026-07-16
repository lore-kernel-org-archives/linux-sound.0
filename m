Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9C40A944
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198399; cv=none; b=MTyf7iz4xDwext/EXv41dA65AFRaMKnaoCSg6aO/KciSe99g+95LB9UodSpWUjHhxpwuHBwQiIaVVYGmOj+yF8nLaZd7Od2+oAe5lTRXLcp7r3fA9gQLp+tJLUUnoVn0EDbGvXLg/2Wu/uBU5jix7C1Pe+inXM7SI8E1USzaa6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198399; c=relaxed/simple;
	bh=NWzTd6xiPdBaZy/6UXtXar/YN26w4vS061xIq15Rj1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlbLHV0B+c7I3x3jOfkTTb4cUx0UncE0N8d9Z0W2kocA8jVXrZXQKY1KK6XqcnPFzMz0b9qdy/GKQO59NHQduFR7vcqrqnCG1yqeWDTP+EWC/cvLWD8UXmFJBKVy95TyKGqIzTfD4FvdRqFVI9rljwpQA281SxNnoaZ7OJF/lTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raQ7mgYX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raQ7mgYX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso3779991a12.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198397; x=1784803197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=raQ7mgYXNCUszLug0CCTWJGXVXk7xGdxf7GvGCWzutUD+DbOpRkL9gZb8eDIVEtwqU
         ZwV9OAK+2w9vJ5Tvoe7UQBmbQob0cl9xOuTzB8q4x/be3C2Vorz5KVh4JCw+0s7yaD2s
         CYjlabHw4i+aeOxUMtnurFcfajCXZlKA1H4wled+jipOatBYzT2Jb/4lI1L6Td9Q1sNi
         EdbI7vBIKf4Kb01+VwZd/7P9ZYbxWwkSiN2fWgZnSR70wQDfnTiDjJUV2SU7k4lKINfn
         ZNYJ2G0bVBF8OB8rXA2jVUCJ2+UcDVpVPSm8CWrVWedpinwGgicwLLc1ThLm4OItftkK
         uGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198397; x=1784803197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=tYghDZYLZaS6e/D8XZH/ug3XhEgIFJ/DiRHhuhxyn0LQdy+17x67FcH5WzCVmUXXEa
         232rXVXGDXaWrZ8uL0Rfgc7gxsyOS3QG+9/gPKJIHSMYUZGzyPVZ4RCQ1QB2zRTptxng
         nhkQ4DebUoExc6B1inMhyIOYr2twLEtMNh0Bci+K6U7OnsCa8Dbqyhxq9bu++8jSNPCt
         sVEltJN4pNhSH7SWMHnw71fvxluu01FPYq6zGUmT4AFPgQKWmRX3pQm1Xn9kvoAbZT3h
         EeSdNgSEfKrONsV/zcqOlvkjT7KhxFsYKl73y3i0uYcAC29d4RZhLzHzdlB3Uqwj0KfN
         9jBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIplvyYRT7HiitgESw010V3TmfSESoWVHbsK+Mad7eHkg0zLsO6B6FgKC4SO69RbsmImmg6IFoULqYAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPu3+fg0Cl0ftqmNXZiCCpWiB2REm8zY/KndHF8FtglRDpm3t5
	79DvrTQiAtHUf8N1ELBjpTS0oySzKoG7gb8h1fnpRYoWxEABCNb7hKQHoj+iSQ==
X-Gm-Gg: AfdE7cnoQ+pSKdzo9+qpYAtgeQblcEI0IC1vK4tXOhD2NpSmBOq2n666SKandWUHUM1
	B/6IBZ2r514+jWE1HBJr7GKI1ZLemNLF6COMF2gLIPqrRInssgXeCfzug3v3c//nFcoNkCraoeE
	3Tbi+xFQStIn8ZiMzIztDfDqvF0FStt+hoA63rplKDo1eLBi4Pu3VWL3f2dlhgnT1A6ARiu9+m2
	fjQBcnitrWclEWeL5vsguStHstwd54SvaU8NpVjVklz+vKEZHGeve+m16du3dQYBhBlh2Tdyu5/
	MBYyngOD9OcqUMbS/C6g3fhJE2N4Sm395o9QhUABn3qZ+U0MD/nCEIC9iPcSZkN4x5Tom51hA1y
	kUyXpSkFMfYN5wU9wc5w/Y5Sh80j/yJGV+gQB5tVtE7jTaUBjTR7JQtUpsyodZhdXX9seloGuK/
	0p2Uq75C9alvQVEbxN5nocR3Ai9ig13h/+OUm1
X-Received: by 2002:a05:6a00:94f6:b0:847:980d:71f8 with SMTP id d2e1a72fcca58-84a6723fba1mr5824597b3a.15.1784198397507;
        Thu, 16 Jul 2026 03:39:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:57 -0700 (PDT)
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
Subject: [PATCH v3 08/10] ASoC: ti: omap-twl4030: Return the original error code
Date: Thu, 16 Jul 2026 17:39:09 +0700
Message-ID: <20260716103911.77652-9-phucduc.bui@gmail.com>
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

