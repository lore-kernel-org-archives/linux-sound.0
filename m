Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012335;
	b=B8F96xSSdBynh8JAUohBzhgluXWaRZ8D+qDv/l3dqsB5pGnFj4bxUSH9HR5GXSa5QAjC
	 winXXST7M0LpwV2sYO6e0sC5SNUL94QFUhsc7lhf/w5ytbQY/pWQrOt2HRXjra7rCdDba
	 IbEZMz41iVuzx2c8wari7FxetehcOmPYa6yd6iW1JMiEpUqn/cvaOmmqIysjUGbr4L2lT
	 O472u133wr+qbqn0y1maFsFl3EEDfBNC1K+S3HZGEoCKrukhAon8VNRgbNgNnUKA521G6
	 achExzfPJpuZfH25jpnYen2cBR8R+ttOo5drsmOQFscee0ULsF19WVz9KWsfMR4sGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
	b=YJlqNNc5G4x4PgoapnehpL3jqXriOSSXpy2qaJCbedJfU3lytWZVBE8NCNQele8V1w9i
	 PxVeqvIK49F07ktwHHZg1uZV/J5eIrsKEd+70f8RwtEjAednmMetbMR3DfrgqD7FM5yKh
	 IsO8rzKaXZBuODRSpV6TkGLoWQUlAb4CJTL0Woj7bt561fFTMqO4dBQ986qeBE3jNXhwY
	 JU+IDVxiPHKhYGPCLPmiPKfgi1mOgDkmKPB91+HwZBDdy5SLOfp78HvHdRRC6Gtjs98ce
	 D4hzxks+6LzukHXFb8gabQKXEAdGxpdA2hDiReeZzxIUjBTDP7QTU0XHnQ10Q7+5qzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fo1s26nv;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F41606A323
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F41606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fo1s26nv
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1496764a91.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012334; x=1793617134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
        b=fo1s26nvP/PmGVTkn/+XmokW4HyUmCiUUXRkdboa1TqMP9nXOZmAxK/FguNmh8HOZB
         mOXELec9yx7HirZ1kRZEiKELzbh/y1HAJHnEPXwc5xqHiyA9zgso4jS9JcLwokPar+Q0
         o+r139YHMXTI5GqcXBGVDUQF9vqj0XR22MspbhiZMfC/B/Ig78Rn2G380oYC+RE6wP/Z
         XA1+UWBezbYLxX14mkU4YjwwOYY8WzEwf+dNYrniOJfwwxt6i7Uhej9zi4+81IwqQGhk
         M3EvP9UHE0jlcIbnFHdcKb1hKwQHVBk30UYk2+dHsvIKwe3wGux/3K0uXVrVcoFbuPeI
         zPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012334; x=1793617134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
        b=apuT5htkubVrXES9V5pJ3rmWcY6nA3YFwleB1Oq27YJaT64L0ZhBdT/VJg/8gT87G0
         z7AaTHyibicEFpAO37AHyTzDH6YUv7iazbvbTO1NzrHqvReSLCs9wC9st7k4ApmO0WGz
         oSKzl6cpbJEyWRJGRcTrEpDk8JLv4J2iQQ/nAhDlUxEGfDWKJFxf7SkmPusdgN2I808J
         iSJEKQnd2OgnaSb/UZwD+qH0Iy80y6P35F7aRBxj0SCWcxJfTz062jGyTI/7kgUqmX0m
         Iqe1YRpxFpexmKi9h79KH5nFSOaiYYy27bYELlXR3nZ8GBue66LVu8dI1PUsR/r2Mcu7
         dtaQ==
X-Forwarded-Encrypted: i=1; AKwUvByAMBfobASFvYa75Be0Y6l0fFa+puO0NQoEgbRJXXXGfWM0/dMdj2PIF/5+LiFhukyptIPFzj+wg8iYGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPAyu0R1VeCE+S08YHZyTo4CBbGmfEiMSCpto7Apesas+rgY5D
	3fMZXL3TwjDstZrLKWDLGOwpyoPjN33PSgM3lN5bTlh6u6dbTE0LXQN3
X-Gm-Gg: AYBFou1hQsTi/0uJXXmEzi445KqWkGAvz83QZIj4J2IT23jB8OLqfyg7pqI01eIELd1
	kvkldwsi68Are43S1mBnutXkMVnaOczCtwStpuGM7Rt+Yqkn/na9vWAkhlf6JyN4PvvBhDp+2Qd
	AqiKQrOEY7kmtOwYHeb9ZoXI4I2dmlqY+y34LEqnRPQ3KT7atGQ5QetS0S8ChLvPnKQ1AiVWR4X
	0qRXmRhMq70RegeaZ4KJu3kmB6qr1U9900zqoIX2HI7tgpD3THyx9iICBG+3FKdSjJpFP6y7ISZ
	0cpot4dVUQ55wABKv9YOPIagwtJv14/fqv/4ob5Q62TCwYVHFQTnv+mrnYAqs/sazNMUfQ/VSF2
	cYYTLtu1+JUoV+qW0XLwtrWO0ziHsfv9c9UXTeb7b8C4f0/8XDCVtihc9URMsNqjUHlzbAkG4DJ
	TCdSPFdKkX9ZGZFjzFsz7hxgcFSXdL8LR2lV3/Anl49P00Y9ZNpiF4Yi+vMXum58flOSe9E10E6
	k0NIClvZb/ikjUwP76TkSZ8vKVUCGznJm4xWJIfq15+N/xw9M6/In+atHuyD7b9d54wd5xjDXvB
	nbnQkln+EJ++uINBxtiR6QrlpompMS+P6tMErPF0PtoC5xnvnpWBRA06ejJ8CpgKTf0LhV8=
X-Received: by 2002:a17:90b:5105:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3adeae71da8mr5438840a91.26.1793012334567;
        Mon, 26 Oct 2026 03:58:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: kirkwood: kirkwood-i2s: Fix error handling for resource mapping
Date: Mon, 26 Oct 2026 17:58:31 +0700
Message-ID: <20261026105835.19052-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return the actual error code from devm_platform_ioremap_resource_byname()
instead of always returning -ENOMEM when resource mapping fails.

This preserves the original error code, allowing callers to identify
the actual cause of the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 739a819d8494..cf4327101b96 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -59,11 +59,11 @@ static int armada_38x_i2s_init_quirk(struct platform_device *pdev,
 
 	priv->pll_config = devm_platform_ioremap_resource_byname(pdev, "pll_regs");
 	if (IS_ERR(priv->pll_config))
-		return -ENOMEM;
+		return PTR_ERR(priv->pll_config);
 
 	priv->soc_control = devm_platform_ioremap_resource_byname(pdev, "soc_ctrl");
 	if (IS_ERR(priv->soc_control))
-		return -ENOMEM;
+		return PTR_ERR(priv->soc_control);
 
 	/* Select one of exceptive modes: I2S or S/PDIF */
 	reg_val = readl(priv->soc_control);
-- 
2.43.0

