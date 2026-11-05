Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875435;
	b=FvFtIjrSoRsX7NTMiwMHe7QD1cS4X2CN3FgclWt0v8iH5WYCRcDTOAi3BLQBtYnmdYlz
	 Kz8Ookkr3V9aESS/xbvmvoj5BzecpgsnkwwGMEMW57vtXspfdhv80VK+mobDHSgff04Lc
	 nwLwv9KyKkYJ94vxmeKdcEEdczuHNY4QfTAlc34fayOIZRFc2UCpw0Z2ot/0ihiXeiqnc
	 cmDPyRjhDp369sQN9PECER1VDppUladfzV0C3TMhvzvp51YYWZB3Cg8b34T5q2oIHAZnd
	 31AzT/uZDb4Kg+Xm3FCdwk63V+Z+FTA65fK9p9K+1o9HOjqOD3Qr8hODdzAu32mfAnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
	b=sQ8l8HaAghAwAJJdEE8ZF5Oiva2PbD3lLLt7p5a+ErfQ2cqcf/+T/ZZ0CqFujkwDsT1W
	 AlQd96MhtAeV0UR2N5gtqzNFzJp28dO+tXRGnBg45vCAC4nfK/oqTwbIY8CTbDm3LXnC7
	 afAEtk0/HQt5r/1PG9cDkx7SZ8VjA/spZNbjM4Bboza99zgvXsYYOUhHE7Qc4HzG72G4g
	 J+t8nwhwpvXWxFxwUj83J1BjnaLuRV8m6q6XTWEzfbn7IFLktjqagGpWwbhb+GnsuSkV3
	 B8hqrEV3syGaxjP1qcTbt8zMQmQty5fpKpPJzMtMuSAmBKyt1hNghhnwRQ7I2p78yYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJf1DmpG;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD26606A338
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD26606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJf1DmpG
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so2497818c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875434; x=1794480234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
        b=AJf1DmpGYIlbnB8CmMI1UCKzRgnBQ/OJgKhmCn/AnmpuUR9ce8AFeLheZjQaqkeFXP
         Eknu+XDUEDJhaHEnl9mKuHA4PXmR6ftkTbJT4v40kqOZfAFQ82LQZ69pvd9kdIJUjtWN
         9OAwFMZa73jBi6AzHpFo+MaJJaEkdfs4JGvRmAlPvFYLOoIlo9Yk6sWooZHAnL/48FRj
         ORcK13xXSFLhWYkOFz5r/KpxfPtnfsk/0A7SsnLXw1enfvfYomk6rD/dNtZzmHE/kYGt
         twqhOYf1tVAM5ChRSGSUzziij6ggLfl9JOA19Sy5RHL2nIoVMr0niDWZK4zoGPqVxIS+
         D+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875434; x=1794480234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
        b=SpDR1ds0U7X968CNLGISFf2cbJwis0qjUyAwYdoVdFLOFwOFb1B8mNfJUG9XGOZJDw
         4NCA6P8v6MukQTrmLq7rhtIRIumX32/VmFmleDD+Qi5bQnW4o5mlT/zBtvypgRYHLBSI
         8ibiQYIKbfdfqzXe5xdM5JQLa3gjHWYhY5YJwuDD8XOnGPUL53nlTbrE2vcPvjqiuPdT
         iCzznhRBXuCQlZ6SWMYsXaHeq6MPWUWYpXHM1+eYQtlPr0v7QczU1kDX20UElN28pObr
         a7g8Xr9OckT+vQOhWLYr+qisSGzSC4O23tE45sQHR7uU6aU2JmbweweNlnwH4SCEyw71
         bnbg==
X-Forwarded-Encrypted: i=1; AKwUvBygt5+p9pKbQX1sJjtBjcLOsoBn1FUqqcEtfD9i7M36ZcAy7q2XHPlW90BuR/J7e6vivWDcIlPNmFS8KQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4RIA0XnSBI91q7/EzlyOC4xE5eHWiDQaji5tswd1khUG9kz2l
	MbuciIr8Z5F1tOOB86r504XEq7SidlqGgV+4kJMKK9hy6t2npTQnri5D
X-Gm-Gg: AYBFou35RH3sASAaMpGOPEK2OfzuXJYinA2kAIO1tYRSbOajP/8Py30Zcv0QESwc1uE
	YYpvNEu7ogmDfxv+f3lXKfEBf3GY+uIHqnHNWmEdfa59Ims8vBQqyWo8+FNaop142UtPg6Z2v7l
	LAGCc5GCjE0o2jubWjR/UoEwohUxhe/f0JpliJEXxkwuT0fqJU6pYeno6229potSP2zDaTgFjak
	1JStLhzERjRcQe+EM6yXaykB3/huu4oEVqA5MbV4BRgh8WpptuKgjWxy3J4rdtdFfWEbkkohqR3
	4K2tMQv99sqWAn5NNebv8jAI5Y1Dx4vpziCIq9blhRL0yPMCNoinUs+1egiLWcD0FWUK814VFDO
	GHPIy8Aus30RqcG9JfzNYcMVJQKQROAK+k7fAEHgz8kSMzLjeVC9rnTqZIYh7QDFhF13elc6/b6
	vdUge6PlG1Y2KbU15cErI6Uu8F5aVIekk8vLB9bynq/9nOL6bxGw/eZSC7LprbgbraWdd7hkJ2K
	b0QoEd1KfO3H08jRozD070YKpXMRZzSMpb7Jm9O+hV6jh/y2NX9ZulZcNS2A7QzvWM5nBCmoRpI
	8RkN1Yt0vne3bu3BeCjBzmHppthawCMCViUopDXtXQszH68mn3IsE1X0Md996vu59ir6aY7Ltn2
	OwaIw9Zqh3vmoPatHTZOex51yBLsUxS+XB3tdnSLHZf2N4kv/15dk+nzvcaygNKRuqQ==
X-Received: by 2002:a05:7022:b0c4:b0:144:fb87:5b91 with SMTP id a92af1059eb24-1ac5e32099dmr27470535c88.44.1793875433623;
        Thu, 05 Nov 2026 02:43:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:53 -0800 (PST)
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
Subject: [PATCH v2 08/10] ASoC: fsl_sai: Check regmap_read() return value in ISR
Date: Thu,  5 Nov 2026 17:42:35 +0700
Message-ID: <20261105104237.38542-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

The IRQ is shared, so fsl_sai_isr() may run while the SAI is runtime
suspended. The regmap is then in cache-only mode, so regmap_read()
fails and xcsr is used uninitialized.

Check the return value of regmap_read() for both TCSR and RCSR, and
skip the handling of the corresponding direction on failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 25243b6859d6..5c50ed7c2258 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -148,7 +148,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	mask = (FSL_SAI_FLAGS >> FSL_SAI_CSR_xIE_SHIFT) << FSL_SAI_CSR_xF_SHIFT;
 
 	/* Tx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr);
+	if (regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr))
+		return IRQ_NONE;
 	flags = xcsr & mask;
 
 	if (flags)
@@ -179,7 +180,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 
 irq_rx:
 	/* Rx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr);
+	if (regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr))
+		goto out;
 	flags = xcsr & mask;
 
 	if (flags)
-- 
2.43.0

