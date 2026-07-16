Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359303F8ED6
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198381; cv=none; b=hQ6zndLckPRBUiant/jmjFnKdxm9j75Mr28YfqijWtc2YsNgoDMkkcvvU65T/7pgij3NBkSpJZV8VSNQ0HymUEljMPsT/aGwKBGIjiJhEKporc+vLc/saiGaVJ/aFM/KP5ZhSXsUMW5CF5XtcIH9hbasfTs4XiKixACjRJ/gtIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198381; c=relaxed/simple;
	bh=JnU7UlQSbchu2TYcv0iygOEto1dGJRIqdXNTolT4xaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7lzZxPXsDtayLFAwtKk7/GPnF6IqR11BqT/aK7/IoKrOW6ydH/T4STFshyBrfQtwppnIis+XU6IZj59mgJl1ewD+pyU6hdNGC9nTe1PzFKNN1Sx8bIvb60AbQuePdGcPGOmGNkcbnlc8QuE819r6Iqu2TcI/kGuUlh5np58i64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qR5tA46R; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qR5tA46R"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848593533cbso3306492b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198379; x=1784803179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=qR5tA46RKrz872Qxk7vWUdQAcVwTzXO/Kz1zk9XsLfdD+SUfRCEZTWyFgAkKgAHXwg
         OhxxOexh5bOgc+TGseEbTU9O/d5iP1wZn6KPPPCxhWAHt6mIXjCD5/x+IqqckC1EEp44
         5lgDfkhY/Wd3WQaRUBxi4Ekbd9bOfiy/DceaiKA5seKpvH5WbBWLYe7whrNwpanPOQzS
         vT1Lh5Aojq4P6zldNseRB4u7uhXE8tlmjbenodn+cjzuucx2bSQZ/p1O5cnLPRdbdU8d
         bR2FXGpXHvPjbehj47yQpS8lH5Fh/iPb60KNfG93jbLuXdnPamSmkHaBVb6mMYWUQWOt
         av1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198379; x=1784803179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcj/2QWjWsxOQT4KfGLw5iUUwUVIUq7Ov2ZMhZrhSSo=;
        b=mOHy6sUQlPA0X8e/UtnPQ2kyYXZP9czdry24qDN5x3hsphP/LIXR5hJMsVtZtWxLy3
         FK2Eh4aSGX8yO5igj8JkOwv5NnFLI8h/JhMN1DP26RDCyQEiCkhGqg5A4ZW8Kgk7m/WD
         WqAZOgCIl6qiVfHf1Zeah+FgZ8yjSginx9W8oGKxdwRi0EpvjuNdfG6nOPem9VlTVkbj
         b7YR0E+za4RU2Jw8ByYIwG3rLDP4uPgjKGpcWFIove+5TiY2Wh1b6YdHXbChRvkXjBbi
         9XAQ8QpYI0WnM5cXchxYeQG3QJXuUTSNKDkEZs4hIdBPy1qE+//J+lz/43dtfSMvjbBc
         59cw==
X-Forwarded-Encrypted: i=1; AHgh+Roc3n5wdS0wydjfYuLksC9wWF+GS1lNxBJ5gNpSjDth/SbiKksEnN+SOBTJ90miGjb7+XB6IGMxNMOkSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPmVoAsBMPRe1WcRs2jhTOhZ7eaSNXLrGa+qfBOvIuJotN5Lw
	pOU+WXWddk+BiE9qUmehQcZl9NDhCoDyTwuVqos9usdnwmJJ0D/EhlrNroBHYw==
X-Gm-Gg: AfdE7ckPOIKoCAgEMp7Tn3B9twSBU5XcM6lwpBnNQefRt9JlvgB4cjSs8gBWyWufUh1
	zBoLFQdTWJgeqFNMDDp6P75K3VPYgdRiFLTlrfT4Etzi39rLR3UMqLuXSNEVI3COJRgh2YwMDzN
	Q0NhEtbi6bdnIlNPf9f9P1IzG2/aS5+SgBkYj3TULm+CkO7z1h+J9kTkv9icE3bzvx5sLHZHRsK
	0Hbuj2UpdThvR9RUIHHOcWbF/3YQUSblgkyIPP7wXXPYyPcbjUU8nL/ZYS9bP36+G+0WsH1twK2
	tgaM2vENODWkfMMKPDPj/MByVc/EjgHUXTIyqGK/ahZ82bEPHjmghRwQzOPw8dYXsOELpWK83PX
	ws+M1li/C4Ma08vB70Gj2/z+Tfw5L1SLnYeWTmh4EZgin6iBTipiFW/HvXOF8IeI9wQiufAdWg1
	heLI2w3mMjlOhh+0kk969mz/Dxx/e8kgW74/SM
X-Received: by 2002:a05:6a00:a114:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84a6726fb07mr6037340b3a.20.1784198379613;
        Thu, 16 Jul 2026 03:39:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:39 -0700 (PDT)
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
Subject: [PATCH v3 03/10] ASoC: ti: j721e-evm: Return the original error from card name parsing
Date: Thu, 16 Jul 2026 17:39:04 +0700
Message-ID: <20260716103911.77652-4-phucduc.bui@gmail.com>
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

