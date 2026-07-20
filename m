Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED63C871B
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533282; cv=none; b=Z+yU4iR4SqRNTQxhp79RdFFeW+sPv5b8WSFGotZGS+uxO1qe/GXgyevhcLdLgevm9l28Q2gtB1O3GxR8bXPF92dnL2xIBYmcotUBPu5bKTGElqJdnv75YgcEoZpNVJLLhHI+DKLwr8ULHJccz4TyxYHBZ60QJExWlbXTNpCXJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533282; c=relaxed/simple;
	bh=uU/o0TswUq/66Qz0zFVbdmHPyge1I5a2IDbU3kIpFK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td4yqam0G6q8IWc+nHBcmbVCLkrgfY7XnRaiG5VtCSvZ6BRnzvQD3/iu9c55Llo/v01DtMLcjT0XHQykPQXQzFCmJBzs7DwKFGbUHq9McdiLzEBQ8oyUi9xORDoANFZszSwPKK3rxtGWz2Mpzbk/xILriO8cCM6K8cHhUgvSV0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9JPF3rW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9JPF3rW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so8433480a91.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533280; x=1785138080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAdxUjfA4mlAH5vwcdO3zwF53s9GTPaw5wLgiyMnbFI=;
        b=P9JPF3rWh5EzEdDwRumFPPc4WxCCYscoHctnnNHHcnESXeOoiO6nZckQsjUH6hz1wx
         2MXXKPzDHuYMyPPrfJKZhdmMc94Zs2yokjdyK1LaAY3d95ggEE2GkFj+IE+V2ugF+ajG
         ZbaewrnpfUWdW6fwg4vXw4JnIx2PGbC2WyDSDKCTQj99Z3+j813m/5UdmD+6TZvmJc3t
         LB3MDa4IpdETp+wgVHihWHq4M7USLuajE2allu8MWez200t3CjDYlMSbZ1ziVOX/9IjT
         WCgFw+X92dYVSURk6dbvObA51gLlRBcpiHJbfJVtYmmrRoySUYItToC0NFEptky+Ip4/
         GbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533280; x=1785138080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAdxUjfA4mlAH5vwcdO3zwF53s9GTPaw5wLgiyMnbFI=;
        b=QWaAu/NzSrB85wu5Gpb9KKZAIRo0U0QsRUgUtwxaKiI4kU3BL3pGcownZUYt8cYg/d
         3FBHB/rYdNcWYqRR4qPYRPc4+Ej57mMvcqEF8EK1yWGsa3j9IdxpY5xj9N1wRRxkwlsh
         HO4LM3yZ3D8TH1SWB2B5RIXNj3Oni+H2/tCwI/z0c86MZfDJ+iqI011Yb43HWJ2ZwWAp
         Jn+V9WoTVDvJjvSdGLM0waABKKJfMY16VZMjvkNFjK6HLCklodx+9Qtq3lRICv1mVJu1
         0bWTfXBfJQA5meferUGPorc1E/hpSjwObNPHueY87wWea9TAHHCEMIoUmyMVRT3q4bdr
         UMrw==
X-Forwarded-Encrypted: i=1; AHgh+RpJJ7BIjGv1zz4H3CvzTpGIo5cpSUbXMRF7DlnMXd3LPEeo4oT0XdAgSv+cAfeIr06sSYMpciIcygpy2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMv6EzGz5ocf4MgUvPjDWDm7QZ+Y04GlghmRznLKTClqwGqofW
	B9oCUb2vAX5S28gT+2az75Ng5igxOf0mT/ZmB5fHGmT3v0DKbDPnxM1s
X-Gm-Gg: AfdE7cncB7PvyhcdbydTvQBC6J5uP4u9C9dnrNVVXWgB1ry9nGpyovUxMsA5foedJVI
	lt0KLO2fWYPLSLV/BTpSzto+a+vkpxY8ndBj47sPdbCTsFIh+x/OqBEFjAM8hEmuyjVUtZUf+yl
	r/bnITZgOmpRWe31dzk2vg2BupBAIScgsZeGPOxT6ZlqjuSvIlDEmQn+KJIh3liw3rkWqrt60hF
	PIaUnrX2I+JGz0pgQE2TWK+NKYkFxXJtZ2VJSaYP8mweMaZ+XMFS0GJMo58dBWLsPENYNPUNi4H
	mgrzDpudTsRBFb2ICz/m0Nies6W3cwmqWnt8y6U2s83u+Ez6rRLaZdaXC+mT3PPa/UctSOjtQbn
	45R3c8V+x5qerc/GEf0B2avHveij6oWKtHoO5zeFw+8YRmnx31cPDcxTF7jAQv9hNgZdegyj+DV
	Lvvti7Dl7S8Z7bd6awDAts8hw94zd0c8puKFIR+LlKDCCsyyI=
X-Received: by 2002:a17:90b:4d01:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38e4b56d65cmr13606083a91.21.1784533280225;
        Mon, 20 Jul 2026 00:41:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: stm: stm32_sai_sub: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:42 +0700
Message-ID: <20260720074044.87528-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ea9e8bddd63f..9a201bdb306f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1696,19 +1696,15 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, sai->pdata->irq, stm32_sai_isr,
 			       IRQF_SHARED, dev_name(&pdev->dev), sai);
-	if (ret) {
-		dev_err(&pdev->dev, "IRQ request returned %d\n", ret);
+	if (ret)
 		goto err_unprepare_pclk;
-	}
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
 		conf = &stm32_sai_pcm_config_spdif;
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
-	if (ret) {
-		ret = dev_err_probe(&pdev->dev, ret, "Could not register pcm dma\n");
+	if (ret)
 		goto err_unprepare_pclk;
-	}
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-- 
2.43.0

