Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297563;
	b=Xtzs9FMtiZFRKNVVO3SdxvcJ+ZqAWUCzs5RqAMWGwTjU+Dc5UAoMNWyuPV+H2GfNk+Y4
	 143hoUcT5CkICLg1MxelYumzFRXfxDNJldJFefjc7WtVLvGgDCn4Jy46Lx3rVM8eoJHMF
	 Q+hKCB1EbkyVeh01McGS4oH1imkJKluiU7ZPD2aL9K2WOHZm4yfG31vEgmnCh9WBeLG3V
	 0FOftizFqEvTQAK+82yDUmCi/QULdYyyDT2BqloHOM/q37aaMMSJTSzeyrWsfXL7ngItc
	 G5tkg3/zTVRdm3uY2bNaR1mvjfuL+ONTEIn2/ccz9/ApWoVcA9RfS9Aw6H0av9VLQ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
	b=fU8q/RA6xjXuDB778DOJ0j5V/+U5lOOBZs7lnhAxjj+zk/D/JxfowXQe642kT4m8oqrv
	 vNRYJ6FssRw01S0IUaXE3YvwNZALVA5MiZjTIjkCjU9MizQ4nVbP+/FRCV/QmWLjHYVH5
	 r0jFx62e7O50z7jrsiQjwk5uMRFs+XEdhrzBtjTO4LHlAkRQdf+ECAJ2TmOoaCEY6RHbM
	 QuAq6cKTIkm8LJrBKUnc+0aDHVY77WEwNfYYAuPzsKj2sUVmIKFUrL9S6zGrtNWR9u+hd
	 vF7fI0KpaoOOsYHjL5b0g1DeRgyO1NsqJRxwUxkZfiwiQz7vLPZVPKfsyHbiJ6dsrWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAwMKi9X;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22288606A32E
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22288606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAwMKi9X
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e795af1d4so1476348eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 23:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297562; x=1794902362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
        b=YAwMKi9XFLZ5irkrMw6df8yap5eYK1ArDn2oh52v1eKdubyn5mPHMB9Nhj5WA1rHOi
         hJ5AuqXPSz8JsjNTcGh5z5f/75xHMx1PLbVrGUfDwzrLsN+mhS84jVUanS6Q79E14uaQ
         v9fxOVXXw7rfrOCSN1q0wmaGyrCpdx/OYtANVEpuiaOZh5itLfurij5UZKNkWCa3P10W
         NcHjrUMd/XcX4I6Mec7xAAfw9r47MRwzwjKRh483QMc1eAO7QfkuRrr6zOr6FV+flR4A
         IcbeNtGwgzOTm2Om22fmxxVqUm0ihqwEl7QIbZk4l/TdABRYJ2lDZFBkdCKH6IBokbur
         s53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297562; x=1794902362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
        b=njgImaqT7C5X6awEugHzRDlH1Pfz652WYoY/XXVj/gJNlGlTj13RxwiLf9M3gD2ePs
         qcxkcjaooZphR0d3+x5fK3M+ViE6mUzuapLCZS6mH8nO/Zn0lpSFFq7dnNWXDSyEzoyL
         5401UinRmFKI0LPvVVEl4gtbfMvgHna7rZweFqjQNqHOjQpXi066yKuG7ypG3vUm39TN
         qiZwHtk+a6mIM0EDSNZRWVabTL1uY2Yc5ZtL65jRRT6v3BFNMo0ggO19+0jE5TFZgJSk
         Vhzm5KRcveQJ9+wU/FBJFm8LlTYkCDh4V+FoakTfl+zxZwzB8sawUuV12m+m48T6r+S1
         e/Rg==
X-Forwarded-Encrypted: i=1; AL+hErGrPvsf3pGqvYuakK0vy3dH1wnY7ww4JTnaX6xUTnPUInUYRcGv4xsIg7QxGRT6vI7fBZCuQX4/zS1azg==@vger.kernel.org
X-Gm-Message-State: APuU4Z85NPyZeKKwZZDXKAHqA13KqGraSAA2D1A3JYWiZ7OxCi94WvTg
	LFZ2XFX72mCN2DTr/bf788Z4W0TEJd3Upcg9HDDVydGLog4p7xPjPNR/
X-Gm-Gg: AYBFou0eJC52K6JUg7bXJfYMXdPP591YA6/jCPGUKwyMqTGVXu/JRDp8Cu2XscJOkdV
	dx7z+C2Ch6xlN3kirplErpgbjo/ukGgVajzuIBMcYuN+fkxLG/4AvO8KXjjJ9fvUG57UDyS37t1
	Aadam+mtX2GvxXh9GPfkW7MRPNci8N3Sc+8sHTjxH08Fa8Lg2EbWwxPQapmghfpiP6fac9gcylp
	EFVtcP2durMojcNzawx5ZYiIXPDnlRftLZNvPztgFzL5I0tbQQooceu9W9SmlUrX4j2BD+IdOQf
	7jgUgQJP8N5QZfJcFsP6yo/+tVNhYpMcTay5UhBgxrUKtBgYfbAD2VuO4953E5jJX3o7PR1LSNr
	nSPvDrgt5ZXpJhkSaqIEG2BoP4Q9cx4BcvpNLtsPvsH/XVFrXs974E80JJNb4t79ylO+/zfF/K0
	sECMFZ9x0PIBajcpCOJqCRF20p/q3sZK1eYXFkRB/E55Jgal66W0I7BSdb2JGGIsYqaQOhaOFb9
	+NIzDtf4fv1awd1PBSjrDRSOw6wcwGDIVQduLTYk2PBXIgybSWbZJ+sWQJANgPBQjyOj47izfyG
	C0ZTK9veU1aA8nxZfCpVaxki9ElqKdKbyebokBthWXU5G1eKGi1c+XXBgolz+pDkWTrYWro921B
	S8B+qQi4vGT5zZfupgR/kOdejmqGOZbbGKckwnaxLI6VD
X-Received: by 2002:a05:7300:e9d9:20b0:36a:2f6c:490e with SMTP id 5a478bee46e88-37508f421a2mr2946764eec.6.1794297562223;
        Mon, 09 Nov 2026 23:59:22 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: fsl_sai: Report dataline configuration read errors
Date: Tue, 10 Nov 2026 14:58:41 +0700
Message-ID: <20261110075841.12104-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110075841.12104-1-phucduc.bui@gmail.com>
References: <20261110075841.12104-1-phucduc.bui@gmail.com>
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

fsl_sai_read_dlcfg() returns errors from of_property_read_u32_index()
without reporting them.

Add a dev_err() call in fsl_sai_probe() to report failures returned
by fsl_sai_read_dlcfg().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 59c9b8c28133..16197f9ac2d8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1621,8 +1621,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "failed to read dlcfg %d\n", ret);
 		return ret;
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.43.0

