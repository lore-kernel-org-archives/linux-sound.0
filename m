Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4D07263B
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528662; cv=none; b=GYFBfhGbzbUk5GIhbljmsF1XOJXqLn95VoEo+44GABmJEhl9gu0iQhVxC2gBsQKsZKaF13YVCEOXgCtac+bPPRGlGtzdnyNsPraYTS8AFxwsT2LdNIlec7DSTtPDwSaSSxTlG1mSKg6I+zZfKQT0/CVfpIpUnKgEjV3qcCHyIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528662; c=relaxed/simple;
	bh=vAKMmJnHPuZMbQlF7pMCnwvdxfkdQbAQi3GO0Glrn7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/S/h/2CsHq8W/uIPMEX4tGddMu2OpNa0oD+DMeqndtUgF8srmW9INbMW88RNcE/j6lzj1THt+1VsrMNnN5pmJ4jOq8YEsvZtZWWLv+5d6dGg5a3fgi+6Jk9yswxOEdQAVR+kfqxCUCGCzQfsK/sIZgkfSapUBIQkKyWj0AAY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oP2v08d2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oP2v08d2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956242332dso1236125e9.2
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528650; x=1785133450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjslSMaLxzrkUem1WFJqu5PdOsbgvYRCxR6KR5IC8og=;
        b=oP2v08d2MJJfQSjZM74oTFkzIs6IWdZ7b6J9tGyHPeNEbX4D6Ph5vmiZ7co7TxQaSj
         gValrJce5+ldn//iR+vX7AK952DVXDHIl88JDISW1ZF07B6uEAV7GDirVuUrnGmKizP+
         Gkdyry1T9DteNodKe0D0eX2gizsq9FrweR8ty1EuTFc8knaVG57hrJRf8r8lOjLZOxIM
         SF84mglsxazJMxZfXgJqINjoQsQfyb6ddV1TK/ySDGfJsr2pe7rJVmMT3Uc5OQjw7hBX
         8x6e4hPz9BkZdzJ2cwlcwNNj/LuUSrX+s6Zx/fFQx5hkVkf512K7y/Khhq2rAXpTipun
         Lcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528650; x=1785133450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjslSMaLxzrkUem1WFJqu5PdOsbgvYRCxR6KR5IC8og=;
        b=fNvTLko0lb0PP8FiaXkYf6p8d1yVjtdIzwm/hLW3iUTiR5GeR2qwrNsMcQ+K9mFOSs
         CeWpuVE7Cu7tJfZi4ZSVJR8oHmTY0PDu5DvYegduyyES9xpxNk5H/G82ScXtKnsbgVuF
         mHMYR9drqq1ZsyPwAaxxTKso12Byg3grfhc5bmPosnnCb0aWOpuviej7Opob7c3PA51h
         5bFuiqvJgJvhU17pphkIBFLzRGck/UnDmGdFJw7cYxV/WW+dVgdX19wnhVxPRfcnyFqU
         6Rj44uZE2lm0HTUERuvbbb9YU25QsRC6pjM1U2G4jh67zCReVEZXBVGOHnX3QmJ+Bum5
         hIPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjKGiAPSXO18kcwuXWRQtBLcU9p/62992xb7e3lrKdnhblZ6WXWrt/p4Mr6c99kMy9hNPR5FvEdBKyHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qJQOuufcW7yyHLhiyrbleAVWBkyvCxhUyCxS/xPnSl8Aq2tX
	dLtqaggSUx2ELMFcQ4/tQi99and3uoYGzCs/StbnDE18AfO8aggcnvjKSJG760yx58o=
X-Gm-Gg: AfdE7clLm12HhCBmsgEqzanaTOKv1CfWlARxFqf6EX3ikcMuWMqCq1gUOCImRviv86D
	UVL99lWDbFSQQeUPu20uqrDWeLzJTTd8fwdU9n+KlwZ0s7fwyFhXLq6laEWvHt0Dw446Nfx71k5
	oZCj4Yn+KiCkWba6DYghDrejQ65VREcv61nu/Udp6CwbvR14kNNy0qSMshNDegCdeu2rY2stfiM
	Ohluz95Sj8NYG/KCQrbMTLn7VNxmMPAN41gJr52QtBasvSuz0Wx2GaYxb1XQLJ4jauxULGXsx9w
	ojvHLmFM8gOr5QnquykDJW0HaUvDtLPDSAdXaUpF09vgGzSQPfoYBY1HvFU60lbfob66h14YsL4
	9htdvE0Hco7EsbxEY2SLb+y3zZGN4539dnMn7R/QfDLpjuv5ExBrGvIqQkSBdCJJkSmkMi89GVH
	lLGX6PGBM=
X-Received: by 2002:a05:600c:3b9e:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-4954a41150fmr139665125e9.20.1784528650076;
        Sun, 19 Jul 2026 23:24:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ed1911sm28677377f8f.22.2026.07.19.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/6] ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
Date: Mon, 20 Jul 2026 08:23:45 +0200
Message-ID:  <724af6f60ed9420d5513724d126d70f22e319c91.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vAKMmJnHPuZMbQlF7pMCnwvdxfkdQbAQi3GO0Glrn7k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7zvzrc7TRHECpePNkMrYEielNWjuww1fVDr ZBkweZo62OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+8wAKCRCPgPtYfRL+ TiVRB/9pxg+lmyYWuCSLbYSK9sf7vzngD6LucEFTmTPJICBCB4vNZ3/XUHrJlM1DESz4TIzE2Fh 1fwPQsqTHoPspzc+0uTxTmt68ghGm5Xr1drI9zNF9bbji6fWZhpXSlmMSbvfctD7OBsqTDg/wF0 6PyxjnmLlOlSo42BTI1Qq1qTrxRpLWs7GU+C+KW098GhMah3AUzkFe6oKPDwgkYVhIUCCHvq4bl lI2gUj9DrJCts6IznbFJQi34G3AgS59Jkd+AsDET5IuL8q23tuscpT1HNsDs8SJgBrkQxLfIczg Dn9ZzmUSYacJgaE0Dz12vY3llnccIhHPDDHlun34OYeksTb8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

While touching this array unify spacing, use a named initializer for
.name and drop a trailing comma after the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/mt6357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
index 674cf7df9df4..3b07087e1cab 100644
--- a/sound/soc/codecs/mt6357.c
+++ b/sound/soc/codecs/mt6357.c
@@ -1834,8 +1834,8 @@ static int mt6357_platform_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{"mt6357-sound", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6357-sound" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
-- 
2.55.0.11.g153666a7d9bb

