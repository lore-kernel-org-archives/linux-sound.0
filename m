Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E52344D8B;
	Sat, 21 Mar 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090649; cv=none; b=Q6dMn1BYLkmOpNO2/YFP1p2pwFG8cC62fIvek7uoYcYpNzLFMVItffF6lKzvzLqQXRsbARyZ4QK2POwQakf5f5HsCd1B6aBd9LjBFyH/Dkn644264zC+pJqDdKRIkDVwoNX/6z4i0K86QdPGNLs/YqKSQ+o43045J19P9ppbZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090649; c=relaxed/simple;
	bh=kkgtABF+rr/5RAG5KzG+XlPcnYLbcejn4ScRjp7APc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NP9k0TAM2mo/+iHZpNhisAdDid5dJmD8zfy+tX/+oSwk1GF6E8lTz2iujpgKrftaNETfYobK7q7BNKCil2RNBxkY0Aad0gGEGKpBHgm4bGx5PVLmq0/11aWPAfsguQAaY+1/KYsozJ6PgUWkfIWn3jU6KmoBkosG+o87FrA2CFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=vgTo/c1C; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="vgTo/c1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090618;
	bh=HIHEzaF/nPqHffBHVVWRyOkZRwX0b63WHjLr9Uc+nEM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=vgTo/c1CfG/n5NabPfFbvcUd1VynakjTU2C70sMLAjf6NJsTzJ/awRK6byh6xbbf4
	 OQ5FKyhIFMb1+m7x0V/y06sDAxymTc3N/DpPM92fFCfKvYfUpzZ6vRJbsCLyww8wbu
	 NR46UP+24/I8UsoAri/r8sOINkhrlejEG3TXWEpI=
X-QQ-mid: esmtpgz10t1774090615t736d5583
X-QQ-Originating-IP: lnfkjvlq7iaGG7WgKVTtD6UhUhtO2uG/Q9+eCbsmz9Y=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:56:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17690428264591340367
EX-QQ-RecipientCnt: 16
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] ASoC: update outdated comments for removed snd_soc_new_pcms()
Date: Sat, 21 Mar 2026 18:56:52 +0800
Message-Id: <20260321105652.5904-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: ORU3Pd/i+gCn890JOBMvtlCwlwEtiXkWhKUqL4O2UFtDiMRccfLgB2Jh
	ME1V4GycHLFu/y9/lM+dG4EYmYqi+NJjetJybl06ZO9QIhY4664Z5sm8E2WcoJW6YAH4d8M
	4AQ6G6ZLziqAQKa0MtGTMPMJjJIkvVJJJxLnYQFkuXHlH4MQporzLf6myS1O9KC9M85fhPJ
	B0klTBtimy450Gg6il6Kmrj/8s8MexX3rYO2tMzkWFNwUqDG+flFY1qaH6qfGEYf5vB+Yd3
	Jf+urzJy4uGXnHM+EksHhru5SuWD3tD0bVH5BvIFoUQkJhhsB4fcB5/or9sLrdQUS28rJp9
	911f2uOwpqHESTX/D+02SVmXqSnFV0+kAFRHrBkgD+cCwPK92zLl3C5w4gAITqHoKOhEKEL
	wwlxeJjnjsBRqRsYG2VKYbIJRXw58jCQusHSq6m0MYIf7Rwbig2IOmc0XtFQBdvoUpuzFFi
	vRWJBP6j73tnP+qPXaH8fT4ZOZhN2I+MoEge17N38wCEMqfOXy/ax2x3bT2X7ZZcemasa+X
	bBqpTilcrNCdNolhhD5ATvn1qTyUce6D46JKLmggEFAqOfjOZhIyi+tirN2zxL3o363LePo
	MTSzdtgDdiuLgv8JL+QiB0riLw5Ca2U2U/Apx11cQqqMfJ2XXbGtjSPH2zmAsIueR9O3/V9
	xcVqw144LCn0rC6IpwOm0xoJXD3zUy2FFt0bfqhiCBGWqfOXD3t5pSNBnqo4K2HqSHoX/Zg
	fhEiz7PBke4EY2rlaRu7/COUZktbdkWQm2yGlpGnMgXf/h8zBzPPak1vslNBcIQ8x2MOK16
	gwISQPECtERvgxciZ+h0Cddq5r/otg/2fyWf3WCles+sMus5LbVRAK6NIPdhri3rhdM2rS3
	Mtjfm/u809yqOll0EEfjA5NxXQ8XItbOYo+BUr04ZBchQtpKpPQzqQEUcthLOzV2w8Xrq4G
	FsTEUTw1gOx7m+dgloJNa90bjcwXShLSEj9nH1dRIPiW+sP40/zt0s89ldRSlpIdrpAP2Oz
	T0TabrPnTGt9otCdw3LO3Jihpa88lkDtALNGtpqoX5WmIa2/EX
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The function snd_soc_new_pcms() was removed during the
multi-component refactoring in commit f0fba2ad1b6b ("ASoC:
multi-component - ASoC Multi-Component Support").  Its PCM creation
role is now handled by soc_new_pcm(), which was later moved to
sound/soc/soc-pcm.c by commit ddee627cf6bb ("ASoC: core - Separate
out PCM operations into new file.").

In fsl_dma.c, update the comment to reference soc_new_pcm() and the
pcm_construct callback.  Also remove the stale paragraph about
snd_dma_alloc_pages() always allocating in lowmem, since commit
e159704f7920 ("ASoC: fsl_dma: Use managed buffer allocation")
replaced that call with snd_pcm_set_fixed_buffer_all().

In siu_pcm.c, remove the stale comment referencing
snd_soc_new_pcms() and the no-longer-existing socdev structure.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 sound/soc/fsl/fsl_dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 26ddbe867b58..ec378e32ea71 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -267,15 +267,10 @@ static irqreturn_t fsl_dma_isr(int irq, void *dev_id)
 /**
  * fsl_dma_new: initialize this PCM driver.
  *
- * This function is called when the codec driver calls snd_soc_new_pcms(),
- * once for each .dai_link in the machine driver's snd_soc_card
+ * This function is called by soc_new_pcm() via the pcm_construct
+ * callback, once for each DAI link in the machine driver's snd_soc_card
  * structure.
  *
- * snd_dma_alloc_pages() is just a front-end to dma_alloc_coherent(), which
- * (currently) always allocates the DMA buffer in lowmem, even if GFP_HIGHMEM
- * is specified. Therefore, any DMA buffers we allocate will always be in low
- * memory, but we support for 36-bit physical addresses anyway.
- *
  * Regardless of where the memory is actually allocated, since the device can
  * technically DMA to any 36-bit address, we do need to set the DMA mask to 36.
  */
-- 
2.25.1

