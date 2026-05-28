Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1C39FCB1
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959189; cv=none; b=U/5bkL1jAAPpGBXMr4165ZHSY0yEyTQts49rgkAG93EAHa/x3jBeuQnT9IX/Vp+tZkPlxjZ/0vbuszrtl3vDwC12pbM5i+ex4blm45MTL/UhHyNOvk9JWgfJmy9kRRgHNV4A6muo94OwcBhX70P4OSNy1E6UCiGgbih1IEIfEWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959189; c=relaxed/simple;
	bh=6wTjQbjVDCvk58uNEXlUXHLxQZstr5pzAGIyPTiD5O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtcBAAxHPn6pYpj7Kc0nO9mLqPjZA0n4ljfzO7wABsqPungpUVrE7k+ySBd4qvyZRRtCjxnKaUAGrxCR4+RJ/Od8gfrptROwzgycn5mTsJAKhU8kVgI6nO/ZSD3MmARBPh+hQ9UTHjlh4ADPiPnnQABEU/iIg4doo7Mkc4d1tbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qxdqc8m6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qxdqc8m6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso107321665e9.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959186; x=1780563986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3vrOPg4WDeQl7PPR6I/LyzL/tbE48PpNPb7FICK4DM=;
        b=Qxdqc8m6f7rNYouawPb2uAj18SwdaB/F6C6+Zhap/UYNtKEIw2mzhXPy5mfhox7ASc
         ovoIzoySBOxeLnjimClebZiU42ZdDgwqgYrY12jSP0JBYlT+iGDYyoUP+XiTfJ+0riRG
         xEZ2+mFWxgcmcnz+T9tn23MIEISNUk/eOs8X4oamRgYxKpk6UBknfTT1HsV+DDA9Bktm
         xS0KtT8Qnb79s4Uh0KCVhdUCn9Wlm8Nmub2nTqpg7U/h44ouU/r5hnhIWsY0HHcob/5Q
         Tbxomb4cWVG8iOdoK5kpzngr+bhWaFDr19xEoSqitreHA7AL19I+ICLrCvaYFl6s32T/
         wI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959186; x=1780563986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3vrOPg4WDeQl7PPR6I/LyzL/tbE48PpNPb7FICK4DM=;
        b=DLKhyRgQsoyurXdX2wXkKOzfTBYgFJxX4sSlHOEcjjl2F/aVeW9sF8QGddx5tl5G9U
         rrgLP8ccH1jsHQ9tXtaM0kuQvWvT48NTTmaKN13HRcR/drmlFVHYbRIc5UasVoxDY4JS
         PX4b8UfnNZpLYz8l/mCyAzyfGoAIBPm8AGr/BknEVPT+V7uwmP4c3oxC25pAOK7IOTge
         Wfn0kzHsWiG7TYjsBTsLy+h02etIvbFcn/W8+Y/Sdv/d8I0ND3P0g7IQ6biaN3XtLmsy
         rfbCiV/Th+4t2V6d+jJJ0cexC5oSq64DLCy/8VrpYMd1ZRxUCHDU3F6STZxly4mZrM3r
         /lWA==
X-Forwarded-Encrypted: i=1; AFNElJ+zxNXmSixVVZYLQKIGOwSgbBCQKucKuE4CmYnSayZlVi765AvlFe7hw8Xf1hZ2EcHrQ4LvtVMfY33KVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pATmUhU44uXIx2HCwgykgA3LLk7cSz/M/6WeGEqz51Q34VZP
	FYIMXs9VxvlLODrPmvrb2DcyLDcmXdVfOlVOAG7NUzk08EnXZxnteC3/e4+WbQfeXGg=
X-Gm-Gg: Acq92OGCVBJEM1Myk0XU2lXr6I6wez2MaWTdyn2UoRDsTfA6y0+dTPKMHzpngoOIKPU
	8tTGVF5UgI7Aa5rkOUrrqzYymIk5WcKB4pwzZP+Bwsg7XmJ3R0Sv7uZBZk762GCUoSau/ARvIMl
	pZ8RJOvMaE4DsYIagX2hRPB79G1SU/4pGo6EOeP9QNnmxcIysJgIbf/yl4TNHTgzzqVzo3mSXOP
	nsj1jGWh0hwXjI5NHgNYjpwt01he1rbJ9rHOB8VZvyUS9NPWsxsml76Z2KjRz1X7A2PV6UxfTlt
	jwRlKl4GdkvDO25TXSekDEIU705j8QxvxgmNnKmHEZyJzrZkDX+LvL/d4O2BO+24IWe5CnDOeiL
	8mueulZySfwvCSyALFpf/5fyZWH0WtYBg9LrVkQoo1914Ze1vLETkY0Nnu00tobZULfEI/xoq6Q
	00rewzWkISblwPFSUahnHTNGX/rlIXBiy1JANymJSYKKI4DHbNoYMEqf5iY2KCgYDrwYnM8wYgR
	GCllkB4xBuoUYfmTz2NVP7Gmw==
X-Received: by 2002:a05:600c:6085:b0:490:6869:ef13 with SMTP id 5b1f17b1804b1-4906869f118mr282267505e9.14.1779959185638;
        Thu, 28 May 2026 02:06:25 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909295a467sm25394305e9.13.2026.05.28.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
Date: Thu, 28 May 2026 11:06:01 +0200
Message-ID:  <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6wTjQbjVDCvk58uNEXlUXHLxQZstr5pzAGIyPTiD5O8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV8PP1Wn5vyCV4KjL3PAW+7Af8i5oFUNZ4xd vlHnGsVlzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFfAAKCRCPgPtYfRL+ Tiz1CACala4BvekGKcG5vDjNOMx8hmRdxJJq3FHD1PRbSreKuvyiSgaa50A5EhGbumLtPk1hEAa l4LBR5T8N02EA07DTot15V45ioH3/Hjg7k+lZ7N6LdiW6uohLhZWH5IAQeSlWljBHn1OAKBiJqy KR5W0jLy9KBe4qRQeZRDBJ3A+nkDEUJy5w4L3EFkx12lU6FaPbpCQE0yaxdDznxKZR8QgmSAMMX nj9eauswmT3ll/KROi7hvrqbuTMbRNxuo87Xn4hDhzcO7P373hgleaC8uAJKpV/kvrpbYTdH3wW /Yjf9TnxtHCZ5Wbr1D4vxxx9Nh808VvWs31CXGS1mOuT1Noc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Instead of hiding the fsi_core struct for the only supported (non-of)
device behind an abstraction for multi-device support, hardcode the used
pointer which gets rid of (open-coded) platform_get_device_id() and two
casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/renesas/fsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..efd1447eacb9 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1905,8 +1905,8 @@ static const struct of_device_id fsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_of_match);
 
 static const struct platform_device_id fsi_id_table[] = {
-	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
-	{},
+	{ .name = "sh_fsi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, fsi_id_table);
 
@@ -1929,9 +1929,7 @@ static int fsi_probe(struct platform_device *pdev)
 		fsi_of_parse("fsia", np, &info.port_a, &pdev->dev);
 		fsi_of_parse("fsib", np, &info.port_b, &pdev->dev);
 	} else {
-		const struct platform_device_id	*id_entry = pdev->id_entry;
-		if (id_entry)
-			core = (struct fsi_core *)id_entry->driver_data;
+		core = &fsi1_core;
 
 		if (pdev->dev.platform_data)
 			memcpy(&info, pdev->dev.platform_data, sizeof(info));
-- 
2.47.3

