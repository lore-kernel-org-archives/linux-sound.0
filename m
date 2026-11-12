Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480710;
	b=rZYTFDncjzDtXUXjKfZwGPdp4O00+YKPMHlZEXkCEy63Llp39wBtdjjwCbn/VNGRxtaO
	 t3K7ndpGrtfjEdw2nrTrDsDB+UJWSYuRvHhD4w6esVi7lSFbwX2hkR+witip2+gA9Ylkg
	 3ndz1qRn0QHMbJVv4E4u7FBgaWd7I9HQI5teqgkvNM0vbqKXGgVD/e0dykIhkao36ls5T
	 fVhBnraW7DKRTuonE6cVNV+8lQOvJqFHe61bwAsPxJg+qPsoLn19UXwKc2vgCC9M00M+q
	 L6W8GOi6tXtTz+dI0Hj/9WFQrSWphwPeM4iCY1Y+wK7q9gKnwq9g/ExMwbL7cVEHqgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
	b=mFLKcS4ZU/UgvqODmaT56XinnsPlIeioIhrmlAmXVp4eLFzaUNckB0MtadqJjpOHa3mu
	 LXfcOSbKlfli/yFQH1rZ/jcvSCSoL7xMLz7aVAqHc2FQUrQLsxmVL0eh4hx3C+jYfyAjN
	 hnUwfvEX2W3zoFCoDYLZY775nrnxKv1xfmDGBhkbG97QV2FhSRHwVS8K8AbNJiktJHquQ
	 44wD/c249HRQiEf+wWKDvlndkBA2MP5HVNWGuHWwe7/vtpyT0ltLu7DTCuxHH+0rMmjw3
	 IWrwOm3wbnkweITaKIzQxjMqQAET0qH4QLzWCft+VMDy6bwSpky5gOalutHhN53IDGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6txWJLq;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421C60A2605
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2421C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6txWJLq
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so4959171eec.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480709; x=1795085509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=K6txWJLq5QeZD/TA+ezEEMcWqFahlSzKugqMxWT6pBvBhW5Rx2iasjq8E9lFb/QCp3
         jbtCkMcFxjCO3cov25ABwYtrlymvJx+jdLHSM1RNrPjj4ummtDNjNcWbBa4i5Rum5nPL
         pHPUU7KfSxRu4FoOPFM2irEBdBAP3RatVRpVX5/bj7Xt2PswCeZn9dZx+uh7WyOFggLI
         wqUVXlHEsgYoX+hXblZc5OMh4BumYuE8kKCXVuKJ7Qf6svSXt9ucYgODsydy3e30DECQ
         AQ+x/6z0RDLoiWPS/HzaAPfe/ivk47X7PRw65sa4Vp6vwOBSFxTlCrQGZv+JuqIFruDC
         TMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480709; x=1795085509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=H7YMped4A6SuRIm5afDq/+NTf5Ch6mM3680W8mkz9fkRgrJm4VT5S5qb08yNWfUdyF
         TsJaV8WjUae5ENZqU6fn7uEkRT2aIDvohDb42LJaVk/1HK/ACJqzNAH0UoGDTMAeZ4dm
         4FbXUcpMj9zfVV50pl18r111A2P8RMq8iy4OqwlMTE77bM/A6FgbxGIrM7d1HDBUE86C
         jCf4RXCHmaqn74Z+pWMars/bQ5Xrd57b0HbpBPkEko1/0TzKy9dDCp4+PVhRtI9Y7S8Z
         8Qagz/BjOJAC/WlyFwqk53AHH6GXE/9BhLKuSwRY7sPOpf2iMqHL73OZocsFhO8/3PdO
         2LhA==
X-Forwarded-Encrypted: i=1; AL+hErGh6CjXkXETYOwixMGuoPzs2rQPMR9MW3f44wym0/or8xLELul/BxPuqDEvrB4MhaSlPgpeGHfutr3TEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8H8Ie/d+M8OSt55Q9myZqXZy7Q1ND9xrXYP8h8sekncH2VhCMM
	GLdszyH8+MccxWpctOgOdfyTFOvlIE0HVNiioYVQHVjlpvGu6cX/2681
X-Gm-Gg: AYBFou1PvXdyxEJxLvTsCee7rFLM0qkmJi/UbevNNMm+9ozC6FrRclpFW2K9DiWMx6q
	6f3CnEsVq60Q/mFVHr1nYQzyJq2cuDSwDa2tWuZ4qho0c1YL4YFxbV4UMGlJZnNH1OqPp2G3ZxX
	6oNJ5/gKYU25ubiBiqo4wLokApK1D5aK9ArB7y3g3/DO9LKUfpC1Ys4UH+0la9egOyvadshnSWc
	ZKuY29kzYripAE3eVUFF35tB759lrbc6ZgouRSsr3fD2z4ay5PBxS+5F4BSr3pVmSqbCpmABHIo
	ASY51d8QzH5U5nVlzrZLBZGi28qF3GWVySBwRyKdX2u0No2RqbgIB6KzJ2fZ5WTNIwr/tPygH9L
	DcUE6/oDC10aB6sGfQpHlorCNbho06vocytpqYFFbLiCwvWBvSAEwwBIjj+O/E8ApTs8fwi1BPs
	8jkmAUgDi9t/amrHq5P8B5p1E4gZYgA2ruJdQsjnT9nzAZ8FFh8xxt13KhFgITrr4wm8NBCOKqZ
	Xfd42oAiU5yPp1NK3k5gmpAz73JQVkTpyE3nlhH1HLHvG5kRjli3biWZmf9TAwxh7dJTLqkNmyD
	pGy+Rov1Ukzkjqq/vytkCAfAaeb+s6if9hhQ6+xKnLQe31JhBIda3PKw/ZpU8xUG/QWBW22UCN1
	8eFgw5+B7XDWGYQRK9V72dobndGxPzKisOI6SPuYyqEcx
X-Received: by 2002:a05:7301:2121:b0:358:eccb:af7c with SMTP id 5a478bee46e88-37686467c11mr5852796eec.33.1794480709185;
        Thu, 12 Nov 2026 02:51:49 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:48 -0800 (PST)
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
Subject: [PATCH 4/5] ASoC: fsl_asrc: Request the IRQ after the device is initialized
Date: Thu, 12 Nov 2026 17:51:15 +0700
Message-ID: <20261112105116.32274-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

Request the IRQ after fsl_asrc_init(), while the device is still
runtime active, so that the interrupt handler cannot run before
the device is initialized.

If requesting the IRQ fails, balance the runtime PM usage count
before proceeding with cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index f7ac60724c6c..c97f814d7358 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1299,11 +1299,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
-			       dev_name(&pdev->dev), asrc);
-	if (ret)
-		return ret;
-
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
 	if (IS_ERR(asrc->mem_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
@@ -1436,6 +1431,14 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	/* Request the IRQ only once the device is initialized */
+	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
+			       dev_name(&pdev->dev), asrc);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
-- 
2.43.0

