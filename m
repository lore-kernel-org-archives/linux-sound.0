Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0244422540
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439186; cv=none; b=l758nzthcYNoOez7y2QVSbgPAFCRH5iRCUmJKzbmq2mwoEs/5eSq29MuhAz67eiJ87kW3xPSttG0+VQwCP7wtmh1OJgUU1Z8ophr5JmwtGLXIWxZ/mQ8JG8vQk+pq+/2U5I4ON3WcSrR100Sz34T6ueaAechhWvLIBKyCF5D25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439186; c=relaxed/simple;
	bh=DpUKsaHZ5eP27ej6xpp9j7hdepW2/QcJqeiu5sg8GU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6+scNifPoOc1iRHKBR7KN7GF9mQtDfua/sD+/pylsLF4CA0T6CZx+qm6DSX5OubT4b6Z8AyYEzgu/6UPrIyUSy8B2MRWZyWOwEEEnUKNPCzpTcx2SRLOmO6I6riCxIBgn3ClUNtXA7Rovd5VgWP5w63cFhD4P4iKIKI3D76jak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhJnMKBi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhJnMKBi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so35885185ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439184; x=1787043984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4yof5CDWnwWSYe6G3R74LbfCCdpQ9nNQH0CPOtEBsI=;
        b=lhJnMKBiTNr4HAytrZVaGgVmSuxrFR/wD8k1mBfP6bEVCdy+1k2Yv6MLFuDXpBPL5+
         SUis25AK5wwAR0vVGhqZ8x2wUD834gtmATE968eAJ4tizhQHzM+xZpIrA+rwXJRMr21A
         BwDLBRxk6oYGc3MKqnMsuVZ9cFrxLLPw9twlw2+UZ2KCoKbxKAC9hbAhsgRFaXzWEQWU
         vcmEIPxG3iOF9WIZpnIyZ2zMi8LZL5uHV4XDf7A7Yc+R68vNefoaghlKRaYiCa1oHtgZ
         CfMDhHhUGttPib9P9HbBpglGwJ0MeMwYsZb0ap5RAMtVcuLXtAYb0dkgDwZ+0SFlXvFx
         ifpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439184; x=1787043984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4yof5CDWnwWSYe6G3R74LbfCCdpQ9nNQH0CPOtEBsI=;
        b=IbpqoMuBHYai0UbkeGyUxhut5xg7mmECe5apaNe+zLe5a287aNXHJsPOVwvmfjXade
         kcs4VkgLILeQPUmQo1fKpKEkenQkyR2tzrRcxX6X0Mf8vSq3vvwCOJ8UJNNOz0KLkW5j
         GrOOWcY9f1C7dDz5XMbEeSSLBmDNTOPkK0QHNpmA5e7UOiwHMfQJHt/FC/iStVaLcTR3
         MBdyOKI83f2buSUmG5dw2fj9lcQ60VCiR0oQC4Iulx7y6ZoHau6icwKYupqF5DeUFcVj
         0X746IgyoTKmdUq8PmYgRdO9tWZkFa7/O7m9xnDoSwEZkFOF990L45vSEaixxHGkJGl0
         THaQ==
X-Gm-Message-State: AOJu0YyBtlESTjVdPkzDSEJj2t5sqEcGWme8dJRbhltmCaATJ0mibF1/
	tA7cCvEepZuZoMpyMQyS/o6/L9f5ruBjwvMCcBgvVA2UPFRwJSdscwQt
X-Gm-Gg: AR+sD12ES5OCdcqsK8QWF7kIW0qbG915IXGjlgjEb+sXKU44yFBmhclbhxVPsTMWCQm
	uR/s6J/palKgFZv+CQ0wDEx2Qk58eMxbj/71w9R956pyOL52tLVQ3Vpmt+kE/GnK+hGmivrnAUd
	tC6uT3k8GpTlptwbmrkJC1XddwnBtbfUBux95q627jKBKzakzqmSC4coPnp41iNew2HRKV4KoCG
	375FO75y7k/juOeurbwpla4Ae0SgQkGW5+oulLRvpHwwjxC2a42NR65IVPsfTEnw/y0LA3HQ4Qd
	mV3uIGSMQpNgndlEljVqe7JG3x+TauQXRUYiztQ1JWCsQjmg2LvaFkalLxzyMyxciDW+Je6z1eG
	CJdMLWb7GiYFc9qJJCEXvleZbnMcJDEKQjAK4lPBFIiCgWqtrLy5tuRtj50nHNzxJT2idAPAdvE
	4kepTH6beVOKuvIOAdaXRCDAIatfY2F9+LVsO1hBgsFfpMbDpsauIOnu3nZRhGW8Tyu+TJeE6AC
	ieQOm9LM4L5JORKA13M2V3Kb8iiRNoVMIHxjc4vmT1wruoKbYadC3/mHpDL6dw+OPQq0UtlreEL
	RJPw
X-Received: by 2002:a17:90a:d004:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-392ec2fc2ebmr1983371a91.1.1786439184090;
        Tue, 11 Aug 2026 02:06:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/6] ASoC: samsung: pcm: Drop redundant probe error messages
Date: Tue, 11 Aug 2026 16:05:48 +0700
Message-ID: <20260811090550.38930-5-phucduc.bui@gmail.com>
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 7e7284125c3e..8430686760d7 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -534,19 +534,15 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
 						 NULL, NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
+	if (ret)
 		goto err_dis_pclk;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_pcm_component,
 					 &s3c_pcm_dai[pdev->id], 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "failed to get register DAI: %d\n", ret);
+	if (ret != 0)
 		goto err_dis_pm;
-	}
 
 	return 0;
 
-- 
2.43.0

