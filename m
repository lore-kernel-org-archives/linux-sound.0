Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955028;
	b=NEutWfLuiDydRrNVS9JFMW/4s+5MTEJD9BNMDNawQCSz8GaD7Q+vArksmVQ1hpgUA4AC
	 eg90bdEHH+1rB+RBq++7vRFdQlMKx5GJBNWOyhFoqFxmtoD4MLKqh3goRvzKrJuobiFna
	 DwAuYsOORDB1+VXSXfRK8TnwmK1Tdx2dazRYbaUHEnyJSYqXilVGnjwNLpPyGQ1ugjKcj
	 x2UNgOmuCrRfaEqjJpGxlBq+UF1SmaPrZAc+Qa1E6hq6eWSQxUXL/VjOr7BW8COR9DRT1
	 IFP8rjli4ge6tHjqopjBt1Tb2lekTb0tcNcXJeXtEj56pfbPhnqsFGNXX5oyzv5++bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
	b=MsDK5bql/kpHgWk9TOO/A6UsAIlft1JUqELiIFpZaxJC4mWlW/D9bsmZph5XGThzcflO
	 MMdItIrBZAmtmPeO24Qe2jOOJk1R8Vj4Tp7aa0R3crZ0jEhPqn+a9KYoavN9O+Ty/H9tU
	 J4Bn4gS4Cp61IiuMc+s5wHbm7ZBvKATMe7UqZZwnQJb3NRINu6fyPOxPNlqrrXMSmKazb
	 gUIHmmQUYQAtdzscD7FIZaF3HBb04MopDS5b2OQ5ftUua7wIWPXqib0bMl1v5nrbBygNk
	 81j9yrJYAwSNOXFd8RhMv3KuENPe1mIC1bGCy98SKBnvAMCPzdIDNwFd8UQMrgGXpMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B80B606A31D
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 19:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B80B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJgPkCja
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3347902a12.2
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955026; x=1793559826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=WJgPkCjaveAzr0VVPWHkhIvN7ysCwpJVuRE6e0O1PUkWj2RZQRy9RbHz4DSd6ofLfd
         dR8XaKKd04Z7EwzgWXEboXeb3KWNIT9nu70gwD/k5OOqHIrSPbjeu3IxtvTlNakw9P1a
         gaXTmTn9osslPJ5wEp8/b152E8Efd+zeKEquTmYS9Bt//LOcxMK/AJm1VPg6jzET4TiM
         4baEZ2MW2hoTTtl5wNf5BDFNzhGLKKr0MegT8bUPLuD1BxouI8nSA8k1fThqSb5txHbZ
         LrGoHKKhrgcABWd3tNgE2I/hyTcOGHBynq+9Q7QQnKK3LKjaZHI9CLITI3rxzLCBmDRR
         slLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955026; x=1793559826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9qaCbPxl/UFmTQFVY4bs9QcJuc49zcAUsVA+5r/co0=;
        b=tYm1n5b6PauwuoAQaG8CiB/DU8xv+KFNgB+cdnK2s9Kv7vPlpSXyUjHq06e4Z3knnh
         m+aEHtHOeW4Li/GpqZERNSuvviPARqN9NjApU5XlLOqHL1RdSlMOU6aVsoptjzwuP93n
         0EtzyV6+uz6TML6+jdjyAdgW0ehtvaWD1wUOTtJEMNq8FWkxZztSSFSzOEvp97p+xlcj
         Yxr1gNKFKQbiBmOhAUf2HxSRfS6uPnsEOMi01PEF1VRdsaUfiqDMCkCGQxyfPckjsBNF
         9rqtS2vQCtegW16xA2QDL60CN1f09UiONsIEY7a/8Padpd9S1SCJVduDKlNboi9Hdw4M
         h5aw==
X-Forwarded-Encrypted: i=1; AKwUvBwgHpw3hLp6zoY/uVKi37gcX6hYsTbQ+HP+tD62mFz1fBKoWom9IZoivJK1C721/rl0k68M+TRv2PrZ1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYI68BFVtvcCvYB5dN6eba7ABj8l5mXmOlnEdCAUHBW+J4tHIsqS
	lgwNFq9nIXgYRTAx/S2gQwKS3ZKG4BdOUTbsPMGNoAAWch4Ie+9hFFtF
X-Gm-Gg: AYBFou3UNRoXilCDatL4gT/5r9Sa2NyhMUEM7a6p0lWGND10RuQmujH740RRFrEMpSI
	SSQ8Ws+rNFakMIo4f++dC7g5StXOxdpbT2v8xrQetV8xdWWqkGH0L3frurQtwLPFZmhpJhEjdBg
	UievaKZd4l4FEO/DqXnRo/HYw1Fy4mFQ+woiMfFBE7rLDbyKbHbc9KZGF6UlQHLlDThN5fMQBnO
	94EdkOTvea8z/YPT2CzM4W0MGiImpAC2JiBLOowpAjZhB4cr++1HQ3oAoauq8bERe0HLYy9kgJk
	1/24SMLKVl2AJKhoUuXZQV9Bl7Uvjvn7Uaav6zt/bmaLvPMH2JEBBD7S9NjhbWH5OaS4F0dNNO8
	8J5Ej7QlWEGKsru4PzTj94pnGGXE7/emufUY0QqrA/Kis9ZIXW3VGGm4+gpEZRvVWqwrIddQ83z
	w6mUIMW7LgJlXdyCCuQBcYcARKPx1/0Fa9w9AAvDTshJ7yCSGlJsUFaKydfmdKt3+eMkH898cHC
	nQenSPMz04z3sFp0s09fVppFUz6qogwX89xS7L4+0SqjDT2dxgJwZgu2bNuHed7KQ62mdhkXfmD
	sZs5gqvkXBGhIOX+PErj4NCojrfZjc6QfXeXa6jCSWCHneFprjRLWMLgG+c5Iw0XuvqmsOugX9V
	agC4XGi8e/1P2PA1/M2Ul/AHX9j8UUHP+0b063w3p1tje
X-Received: by 2002:a05:6402:5024:b0:6b3:e575:f4da with SMTP id 4fb4d7f45d1cf-6b442a81523mr6769954a12.4.1792955025764;
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45e167f4esm1231230a12.2.2026.10.25.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:45 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing "iommus" phandle
Date: Sun, 25 Oct 2026 21:03:40 +0200
Message-ID: <20261025190340.449613-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
of_parse_phandle_with_fixed_args() to parse the "iommus" property and
extract the stream ID from args.args[0], but never release the reference
acquired on args.np.

Call of_node_put(args.np) after reading args.args[0] in all three probe
functions.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 6 ++++--
 sound/soc/qcom/qdsp6/q6usb.c     | 4 +++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a0..49bd0582d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1030,10 +1030,12 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4f09fdd40..f09856ee4 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1309,10 +1309,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (rc < 0)
+	if (rc < 0) {
 		pdata->sid = -1;
-	else
+	} else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c..5888bc41a 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -382,8 +382,10 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
 	}
 
 	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (!ret)
+	if (!ret) {
 		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
+		of_node_put(args.np);
+	}
 
 	ret = devm_mutex_init(dev, &data->mutex);
 	if (ret < 0)
-- 
2.56.0

