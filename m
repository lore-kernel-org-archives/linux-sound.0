Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D29422540
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439182; cv=none; b=dI+/7RR/F/RpU2WOu9oIzMr2JZMN7HUIzEQXQJzd8/BmytDykh+YveHJlyLX2/1lOGrkCD0ZXpnJjT5K3XfgJMsIPbycJ2BZplPWpYiLd1LEAF61A2YT+vcb4/cYLmWRBUD0CnSD8cl5RwtPQbAJH+KLCppOcWolujDegbLTbSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439182; c=relaxed/simple;
	bh=YhVJo70jkulbyd4wNCcrK+71b5/22m+Z4P3D4l5sVnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edvldFBIyl8sHqykRZKyVTU9ZByUMCKWA50MrL6hZOG4NAOP43UjhJ1OkFbuUkI7jnl7NdfeD7BkROyzcJhvZvJy8AG6FmB7alpUtWGu3paMSbfpUghrFCrQCV6EO9I6S+TGBYmHcDB+u5yJqcqMikjMAT/HPEE3lQGS0wQD5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlW4RWo/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlW4RWo/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2796450a91.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439181; x=1787043981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZA/PnHaNXH4Xhxd+45+XSGsTu7F85iYW+CAMfYWS7U=;
        b=HlW4RWo/0PrhQmvbQHBAGZYGc6gAUiFfrryiMve8E0GvZX877MYVgRvQoLiTEIX+1A
         UoQBr9ywY/eVjsAfGvBVgCj0rG6od6uDk2qrz5aq+6iyfb5DMej/UddVNH4+f/SrQzim
         tXLe00UpMMcwWXh3enZUw1Co9k2rJxed7zz3cyD0hpIo0dFV5ZJVt+zJww5XXRKCd2iQ
         wbMAMGeuQnWq4maA3sEzl54YSuNqxW4jrnI+jLkoIK5B84C7q0PzJtdbzjFRWZkFtYuz
         kzFFGsWQ75iQ725kKAGh9qQozEfBidB42iIoNnAbosNc7DwOGCznLoyrNS50Fla7pbzo
         dHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439181; x=1787043981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZA/PnHaNXH4Xhxd+45+XSGsTu7F85iYW+CAMfYWS7U=;
        b=pkgfyc07SmvIyIRDlruxgk7hPWJsCWhA63ltTQeqLSf0PiC5ULIU2/ZiA12Bnd5fIk
         8r1CnpJGEzfzT955RPyGtsPHms//d0SEZxjefXJh49paNE23qKSC5qsFlgpJ4rP5Xy4z
         9BadIrguj4r1vSg9SsxSZZcuGLWXiZ5qnkNEcHv/5s810BcQ+QPhqPccPmXER0ZJW5XE
         EvWg5dsBNOXhusyOWdUjUQtdZj7vJo7BRDivmCd/HQGN6LxZ7qTYX+7PD4sERPOUh08/
         g9xeKqS50cKEZi29C4KXkeAUbTzTOJkP+K0oXYpV24o0XEMEv9oFo0w0CKR0bErbVW9N
         RKZg==
X-Gm-Message-State: AOJu0YxrG083/jBRoXXzCVm0VH6UDa1jAE2CQRBzdwVgGrqfwEeBcVsT
	9Ez2bP6fj4jhDWpBdcGHFPy0LYe0CHRBKI/YnBI5uujBnDpaaqocm92r
X-Gm-Gg: AR+sD12ArrZJPGGcqjGJ91aZRdH1aYsVPTj1e6dlxT9bb0xlVoLRsHGqMqGcJP9Gjlh
	iyfv10Aq2T0AwdHaCwUdYENokuwMVZaB/TMiGLoUqeJqRggySQZ0M3/oTNMy0GlVs3zhNJC45q3
	Emk3q+jdCI+fytd9s3bqwPK4pVRkMwQ0iKwsvoILjFCWDl3SyDD4xOBEOro85/wLNxGaZTCDIxe
	7Ztx9nYlDqoUx78sLKcyXzWNk5u358A99NP+lj+UBcZOKEZF3+qRm04HuBDs2ORs0qVmVYtgkiA
	uVFaQE+bkOYlErbgtuSj8kuOTHwqy9kIyq3FaXhNiM2r0wQbU8LN2QNySJhygyS3FeIhIF3IbK0
	f2Y0hxQsrydWJqXzpyPv6AhM5LIGHooGnzL6WUE7/B50Iwq/h5ktiqosnJLe7Of2Yr7LrMx0RRd
	m2RnOc3UWd9CnDqZxLQfR9nRG1FUthkzvNy9rEQmy1O6VCFChISkDrfelxVQfnM4byKmOuzzZlq
	v0+8K7tEuwzpmyY6S/6SyzoQkA56zljs8Fi/jBauAhSKvYkh5VRFd/Mbp4/YxJ0+PqApvRnPT3s
	yWsh
X-Received: by 2002:a17:90b:3fc5:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-392ec3a8b23mr1791896a91.2.1786439180873;
        Tue, 11 Aug 2026 02:06:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/6] ASoC: samsung: pcm: Use dev_err_probe() for error handling
Date: Tue, 11 Aug 2026 16:05:47 +0700
Message-ID: <20260811090550.38930-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811090550.38930-1-phucduc.bui@gmail.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/pcm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 309f024bf2a4..7e7284125c3e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -499,10 +499,9 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(pcm->regs);
 
 	pcm->cclk = devm_clk_get(&pdev->dev, "audio-bus");
-	if (IS_ERR(pcm->cclk)) {
-		dev_err(&pdev->dev, "failed to get audio-bus clock\n");
-		return PTR_ERR(pcm->cclk);
-	}
+	if (IS_ERR(pcm->cclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pcm->cclk),
+				     "failed to get audio-bus clock\n");
 	ret = clk_prepare_enable(pcm->cclk);
 	if (ret)
 		return ret;
@@ -512,8 +511,8 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 
 	pcm->pclk = devm_clk_get(&pdev->dev, "pcm");
 	if (IS_ERR(pcm->pclk)) {
-		dev_err(&pdev->dev, "failed to get pcm clock\n");
-		ret = PTR_ERR(pcm->pclk);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(pcm->pclk),
+				    "failed to get pcm clock\n");
 		goto err_dis_cclk;
 	}
 	ret = clk_prepare_enable(pcm->pclk);
-- 
2.43.0

