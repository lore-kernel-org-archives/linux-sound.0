Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884038;
	b=iDTomkkgl+et2fH3IhQxe2WT9SxhI4aq6U/O0xk3DVpmVNljVhRZ28yXUMz2PuegXBnp
	 ajFJitLU/ternoA9LNm5aGeBV21LBPGzilvMgAlYEd3Jq2Dy1SJFHvAAzEYkQ6nQA+TuD
	 a3oamOY2avcZE1JL4p9Qx2Hs5DaZFecIPOVmKmp+LNtK9SyDrIYOjkOB3uO1qPetGsXwW
	 RnBlc8FTO+8+Bk9max5OgQV2RgmsbG958MYjLOy2ncC3mkuXc0SFuutuy/fe3tTsZ8XjS
	 2U1M+yGG3OrE/QXaiL38Q4wXwj8V2CGpOrA/l3X4KGlJuCotT37O06AEINk4leQOO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
	b=dgGuBWHdsbS1OFpnucga6s/pzh7LPFKFTzcYaIOlK8WOfJmpayJfm57FlbF1IZhbIIJ6
	 KPcH12+jGWn8gXDcuiwTsulrnnVLdbw2oeafyEpd0oYewFXJSspBJWAozcnRruUr7zbkx
	 /AyqOL/cgkPz0RXYW/sKlpr3i+jXkwVeATcT3YRVltn7Q6jpzf9/JPmRzZFaGN9wnCnaj
	 WftEhqF7qxxHsLB17HT6NPPafuUmPPhz5qyIGmto1VbWRnCvXWYWoE/mi3oueQfVUD0wp
	 f6lRAIdqRA4b3u9SUbwMrx5ikpekzxxzZRBU4DunNrY6DHZbA7qnVcpbnTeZt/b8JPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXhnx6PK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041A606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 02:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8041A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXhnx6PK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6893672eec.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 18:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884038; x=1795488838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
        b=FXhnx6PKZido9GbsyRF5sc508uIYTPPtevEuYVxNTnCjvGl0/ORmRGiknL9j55fiFv
         yc7Pmdj81ViA2Bijt8Onc19iZeDPScQEqxBSp8x0IV+CQdYwnH+BQTz5k9woOih6KCru
         I0iz530Z7rVsEGUx8JZ89Aukq/232rAK9nmWauqOWjKZYWkXoFyTtHte4wYWhsgawkI0
         9v5qOKvZQT9qF49c36a6MBz2zxiFlICux7zkjUEASIYlsrM10M++RdnTqtW/9kpYMG62
         1ie9uxg90HS307BAD6EQb/8XwI62MTxeuYPVCbQ+yE4+Bg3USVKLTaISIjkfTQ4ztZi+
         L3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884038; x=1795488838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
        b=a9QtCARDS0TCM/Ql6SUcBg9DgGNSzuWr/PPu99MCHNbtPxc27sEAxbcLIpx2cFlYUu
         JA+eGUicMZe3rbDEbbq/BmYHxRLd2yOqJgX6FwPttZ1/HcS2w11va4MrQOCrqEffxJXT
         cO7bZLIKd3cBVYQxpd9XwUgCFGZwQ+OhHN9DjWswiOTsEwiwf9fiMilRjEhHaNLOPrFn
         HKFRJ4khBMzuabLoBg2x+xblMBn3uQ6SbZazAIvnTgu/ffwFrtDTYRmduBqEirF7rnyk
         vVHvvVPudWG4DQkkWg8zNqgo4BHal3emnAECpHFMziGxh1wsby9cbf4FTNDLyjHy0KPO
         b7rg==
X-Forwarded-Encrypted: i=1; AL+hErEU27PFu6O4CONPhIlGlRJKyhJjYUF2u0e2kBsHjuoH/LSxCdSzKTCxakb+RWPDBJ4O2GSp5ZTTqyTrng==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e1v8xcxobYR7159jp6QWzQABIVTFQKbX+VRL0Vvc1DyTaPzvv
	UF8W7wHkX7aa9799XF3qGG4gBudFZZATaUiUEXB9vIZzTnsD8Vw6pyACbjRY6w==
X-Gm-Gg: AZFdTZcyLh2ZpOnbD+t70XoS4Rink/DKQv8GZNwTI8WwboNQzIyLZOO2VsojEaC/6ON
	nsFnuNcb0ag18LpOP4R9dGEShH6P/XK8tWDXwq4QfCVnvpsaA0pESMaGwcNO6dp+UL8wK5wIR+P
	zlp2487Qk3O26LBjGsg3hNCdIsaZ6xxGkjj4BqoqSxuVRklSCGQbptVKoitKTAacd6YHvGtWtBr
	kjoTWy4YqdcmcjB1849wzQY5ko6U4p1R+59ImWO6D0FMUQ1yeWvIYAFc6x29CgwpRdkryqgHbVD
	+jbRm8KwTOwE/PY5AdSgFguVuE+qU4F109Stc2Q3ADQIKcbo4WK3lLaqTdz0wQjPWIFwRsdMvHw
	NJ+z8XYiRNfwUjH04O7DMcCMge9vaRr74v6NJaBOVUqQ/VU6jWjqas/6UimPbVZllAZT9bxwLv0
	Z8GNKLXNI40ra+Uq/MhOluXax37QHLyhYLfbyfA0ukYNaan1lxkGngXzTRiuNWyVjbiJ2fHpNby
	IBzBiW7trqgKqnxPD2lHHfporBFHr+LmHf9BZ92gT9ifU1hT2gV3lA1fdUnZ88X2Nb6JKUufoy5
	Rc/3akQ7QGLC6nG+f+1/WAaB8hS3okGpp7hJTaKp56/Abf+MwsT82R+WDkvsmi/p5jy+Ac0PTI8
	NSOaFDLBh1OBkklfQfJNGwQx30pMNt0xcfBsGptBxA/hbeNak5N27kJT0tOI6/zD1bg==
X-Received: by 2002:a05:7301:1e42:b0:380:f8fd:d19b with SMTP id 5a478bee46e88-380f8fddfacmr1913628eec.38.1794884037636;
        Mon, 16 Nov 2026 18:53:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:57 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: adi: axi-spdif: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:35 +0700
Message-ID: <20261117025335.7455-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117025335.7455-1-phucduc.bui@gmail.com>
References: <20261117025335.7455-1-phucduc.bui@gmail.com>
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

The AXI clock is enabled once in probe() and only disabled in
remove(). Use devm_clk_get_enabled() to let devres handle this
automatically, and drop the now unnecessary remove() callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/adi/axi-spdif.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index faa1fc7cb973..07363ddebb77 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -199,7 +199,7 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->regmap))
 		return PTR_ERR(spdif->regmap);
 
-	spdif->clk = devm_clk_get(&pdev->dev, "axi");
+	spdif->clk = devm_clk_get_enabled(&pdev->dev, "axi");
 	if (IS_ERR(spdif->clk))
 		return PTR_ERR(spdif->clk);
 
@@ -207,10 +207,6 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->clk_ref))
 		return PTR_ERR(spdif->clk_ref);
 
-	ret = clk_prepare_enable(spdif->clk);
-	if (ret)
-		return ret;
-
 	spdif->dma_data.addr = res->start + AXI_SPDIF_REG_TX_FIFO;
 	spdif->dma_data.addr_width = 4;
 	spdif->dma_data.maxburst = 1;
@@ -226,24 +222,13 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &axi_spdif_component,
 					 &axi_spdif_dai, 1);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(spdif->clk);
-	return ret;
-}
-
-static void axi_spdif_dev_remove(struct platform_device *pdev)
-{
-	struct axi_spdif *spdif = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(spdif->clk);
 }
 
 static const struct of_device_id axi_spdif_of_match[] = {
@@ -258,7 +243,6 @@ static struct platform_driver axi_spdif_driver = {
 		.of_match_table = axi_spdif_of_match,
 	},
 	.probe = axi_spdif_probe,
-	.remove = axi_spdif_dev_remove,
 };
 module_platform_driver(axi_spdif_driver);
 
-- 
2.43.0

