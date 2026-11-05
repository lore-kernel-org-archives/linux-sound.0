Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875396;
	b=5OSrdY+6LezSN6VuR5I7tvj9lz+MtCYAQdchYqLceFc0Uxyyu/p4QwzGQzCqAaXZlM2l
	 7FnG3mRQHg72n0Ejgf1S4l9LxxBB+FlpW1Q/BoRHIwePeXhsU1jTOa/l+ADmZ5ceJHz7x
	 0NhVJX8gpm0qyufBIkXO6t7unlxnHs1X46BNMEjbdDyPvLxpvcuN+TlkQLKhwknrouAW+
	 VHSDthrESzoN3jb+G6QuLY3mvXHgE4lb3dSYMrq4svsOQTJI1KDKBL5Tqxi4JywaQ7P5r
	 JBDzY88A/JGQmPAm3+EsLVuuR84ZGZjZMKLuXH+EaPPLoGzbGcQDZIZouWjkhPUS/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
	b=Tan5OBG+5TutXJ+eTyc+pfIPjTmUD/CbDUojrF46oizGLl7MC41e87oB8maWiUQO2WV6
	 V2ZYEz82sra09+YuskfORBx9qP6ZqqIdXsqqF7qv/QLfHoMlcMDuQSntYoNFKgtgXD9Mw
	 DVke/NHDOOf+u29ZVy+0JcfsB4RqIpk3OBiYJly9gzJLX3Q+PzL559JjBo3Jt5jrNo/J2
	 0zgTyjaiJP0J7uXBNM+2lfWM2AmHQR/YAvqVosrJG9hx+5gpGtqGx6bacFZCfNa1/4XDZ
	 3fWmUJeG20U79D8enZyzwQs4H5uIEhcvStd2G4x+FdiYpDuM0kYULcf0KwsYvQSykTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCihkUr7;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30990606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30990606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCihkUr7
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so2402903c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875395; x=1794480195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=jCihkUr7ExR7ixQkjEC9I0PzTY9rJYB6o1SRh3dtGPuzbIGMYLRqpA8hj2egFk+y51
         vfF+WD2VocguhfW18P7f7/k6p56+KCdyw+SOaOSpTFkpaJ27bNsrexryl+7ou664Ng1O
         9fFz6NQPq758nmfc3Cxri8NMJNLRninmxOfwvMdvAZExWol1ayFt70ZK4s5FMl/BuweB
         EScAzoxLHEbR4W9nbACfC2kULsDbATaw7IVtajkdiaiJB7L1iszYPK4SZtDPfujl0bWi
         oSAveEOIZXxJibqnhy8lSMOKdVnT7c3JseP80Va7UkbDWYArUl6mIHAFoHyEJwGaaMMq
         shPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875395; x=1794480195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=nOhM/t3SShiGQrefuxHJFWmQBIreSmoTWmpwjv5aCrxSY3CIJcD6zxXy6uRzslq+D2
         zK1Tvv2M/NKrT5xF1CACtSmQnKncUVUtBKzHyWvvCuZK+arq6ZZk+f4JeePSmYIt3Xvm
         I3D4T+dScAo5JS8lkvAciY3wJEHed30rijsGvVC+VrrB/zLEF8rnCrG1c7vZQHLWL9fn
         l2ucv7NNoHdkYj+5zYOgYvQdq8sQ5LhdQgAZqcGwvWSl0wZx0jUI4ilrqE6Iy6jz1MMW
         msAAOlbPqSrRZp8Pkg38/UDk0rL0jhK9J6L7BrjH5uwnrczBOAQuFlMuQ3yzvUL+LUwj
         qTjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyMoJugidA4ulCWARt6g3R8c/NWDFz3pe89WUdxm7NlfQhdt/KemgyDQ1Wco5lTFFOlJSu38xMD9svag==@vger.kernel.org
X-Gm-Message-State: APuU4Z80is/WyGN1wUFx0ElAUpxc8Bzv0SES1ojZ3+5rfymD/S9gjG2f
	IkkNr3tuXv/uIMKT1WNyWPsCts1hKpHT1voR6K96SaLeD+D9H1yCAQlq
X-Gm-Gg: AYBFou1Hdk3tlkeAW+kIrxT/rVlgkRk1bagEjHLrT7keFUk8Uv0gIOdzGHp79kLgK0x
	8U+aaeCaSHYgy5KIfpfuUAOVuA5gTYLf4jlMEbSI0FdG3oB4ejE/rYbORc7+91DKnwa/tsobZ6D
	yeftFa9r1fDRfKAq/2OFvYBcerS/Ofta8DZQEbWFikSedWxWY17r91Y/gwX9LXALFKSsCf+8WCc
	sE+lBbG9Y4apFkqoMQVyUq8xqwvifErUuPF7VJDiGMmGnELxJmaehozczLf5ZwoIop28ETIaGKa
	ck2SEaNfdK1oT+I+tnCjcTlErVfBvG/z8ieTaqtkcJtVxodcR2G0AGbCqrlRJ1h1c037f7zcZCt
	Tc4JXdJ4Xc3EYhJLCzbwrwkHzcP9nLxb7qqgj+2YF09Q7Oga+Ti30m5DjtVr+DmMdf5rwn93Qm7
	Wq2lfh1PJNOXuiv6UAihm0As2AJp5o2il+B+Jv0gqFgpYzjh4TyaCuLFdADvQiaiNeOuD0ijm5r
	Q1X+0WgJg6fWWy3Rx6kUgD6lWIeXQShHZXZj+tGtLoCgIVuQKtuOmRznt6qU9IAqBrNA3PYXX4S
	xCkQUP5E84I8uUdVc/ZZPnbt/6iZm088qnih1bu84G9+7wuE/vgm+OYB1U77jZqkO6txgRT27nZ
	TGDkdLu9QYZGPa/WBramUVaAKN0c08nbDHyr18k1LZm5Dx0pcCEq7sSyrF2rhtjOYIQ==
X-Received: by 2002:a05:701b:2806:b0:19a:ace1:793b with SMTP id a92af1059eb24-1ac5d888f2cmr30014440c88.18.1793875395166;
        Thu, 05 Nov 2026 02:43:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:14 -0800 (PST)
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
Subject: [PATCH v2 01/10] ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
Date: Thu,  5 Nov 2026 17:42:28 +0700
Message-ID: <20261105104237.38542-2-phucduc.bui@gmail.com>
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

If regcache_sync() fails during runtime resume, the CPU latency
QoS request remains active even though the resume operation
failed.

Switch the regmap back to cache-only mode and remove the PM QoS
request before disabling the clocks, ensuring that the resources
enabled earlier in the resume path are properly cleaned up.

Fixes: 907e0cdebc1f ("ASoC: fsl_sai: Add pm qos cpu latency support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f53061..042885ba415e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1981,7 +1981,7 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto remove_qos;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
@@ -1989,7 +1989,12 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	return 0;
 
-disable_rx_clk:
+remove_qos:
+	regcache_cache_only(sai->regmap, true);
+
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_remove_request(&sai->pm_qos_req);
+
 	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
 disable_tx_clk:
-- 
2.43.0

