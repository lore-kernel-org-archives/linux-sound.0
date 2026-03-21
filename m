Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AEB40DFAA;
	Sat, 21 Mar 2026 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093298; cv=none; b=pZoW367+9sGYPtayvI9yuh+VZPX8b9nuU5IMTS2Vd8X03x65PI7XwDyzzPQonlXpNYKD68W1cULfcGUqxZlta8rH4te1bXGcGCvjCt/B3aT9lwaZJSuw1IIG2GRQdn3yVtJbWUf0jMye9ZsbzpqsB5PHxg3tUhrKunb3zuyVSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093298; c=relaxed/simple;
	bh=kOHfg/yke5Dnw0LGsHgG0uDscpxmEJM4NxlqE5s127c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHLFkALeqB4CtWQp7mdXliiUyKnhKM1TL+e4jwXxKrDD+2xUNcneZ80AMDSKfW7pxYUcKL9JrvSbSmaOWtdt3CeqY08Vzi1qu9IrqIvQwOAop7Ae4+4I7T5M+sQNKbMr4/VMSuZY/sDIrNUTOJbELXaq30klQWIF7Nu8qaGnBaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=0pfvCRtX; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="0pfvCRtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774093279;
	bh=MpRbcYRDdY2DD4XTZv5ptcgOH3A3CX6WIWM+E+X7HKo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=0pfvCRtXcWvrfeGQd0FLdIgaz/dPvr87LKKhy1NKa47TzNeJ97JJ8m1BGuqG4sllq
	 GSrSCFy5cizS9oosW4IoqeYbhqAL/t89ezbRdNuDdQMnJMBBMF7jcI1GfXwfdW8VrW
	 xHHfer90XU3no51mwQ1YyEeN1izdT4Jp+CiYmNzE=
X-QQ-mid: esmtpsz16t1774093276t12b87290
X-QQ-Originating-IP: ymC8t1IzwDI1Nkc8CKB2K+5dPkYBlabU7RGxjqi6S04=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 19:41:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10421773967410276307
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
Subject: [PATCH v2] ASoC: update outdated comments for removed snd_soc_new_pcms()
Date: Sat, 21 Mar 2026 19:41:13 +0800
Message-Id: <20260321114113.9244-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MBREESna/OUi5nETwaYIThVynI+hddl2aIRXBl42pqAljaJzd9vdnb1n
	qyfGgDC6OIZ84hy+o5VaNQONvDc87ML5txsWLn5Pq9Dr68N0Ur5EfG5JRX0rCnMcmkq1bee
	JVvo8rJMsTfhXf+X34ahonZiW/wc+lwBJzb8CIx/DYX/+OLD6o19iuJty7kCzGU3kt1p3mS
	uuPtBG2EyFggZzI5gSVMkQNLnInU9Rdax3hkC0l1fhqsuDM3G8k5+yvrUZMXVUZvLeyCv9Q
	OXZXGK0o2gaGefz9fUABJ8a7xLTRnh/BnK0zwkkGnsRLZgfNSLGO/mcubTwNcjZ5/ivTZqY
	fyGywRJCm5J7lXd9AXwY2JCTjkamsV5nWsxURuTm4lItv/nPnA0TbF8uSULk4TDcb7Cf21R
	EmSZ9O4HuJf7aR0/q7y71+cbyLNJmAZ+t2/kAr9TzKDQkrLfGvpYaKJOFklwg4n5ts2ewxd
	uK34f+G+aMx1yOVvZlJ1yz5u7lYIF+fhJENlhkyOqOqg2oa+KkFUHnLXqTNQgJc8WNCoFUf
	orzxvWMXT1/2HcXGdmT3jAuyEHz0kpKNH9zO98jG+BxZ7aeaDbOBoRJn4nboCHleEnD/dfa
	dcvejAp05FbV6mZkWRwyBMet+wYsYfmeCZngliVl8v+Mh5hIyEXFIAbwHbi9dLN+/H1oXTv
	M3d2tkyE7lau9rB8SzARCfYqML5poFL8NvJ8Y5KsaOF7zVuN4y847L1tpFY6OXXt72cw5Mx
	6Hr3ty0xiqWOjJ7DdeADS4Ts+olaPfmMa8ToVTeKRioc611+FDGneZTDgeDsLQ/yOl68azr
	iy9bA/nlZqi6oyM/o2bb9kFKgzrgmrSdRNNmFw3OG2stUnQb0Sa5dujNY0Ma7YD7LaXFYeh
	B+SiKTIwHDWZqvQEE0tSsbYqODjgytZfDQnKhJ2oeVnsGZ3mmC6BqSI42Y1GuKW98fFQhFj
	QOMw9icLwf85sbTDxUFL8g0ptEuW6OErYl6V4vNbdxNX5hNqmk8zw2bCHyiE9Hv6owdVAHz
	lD41N6KsstbhbYErqOxcYgNY8i/wfhKAjghPOGceP6x72G7W4GCMVodwyVnRo0wNP05DP2x
	+U4Cf6UIk3ISUtHT1Uxr/c=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
 sound/soc/fsl/fsl_dma.c     | 9 ++-------
 sound/soc/renesas/siu_pcm.c | 1 -
 2 files changed, 2 insertions(+), 8 deletions(-)

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
diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
index f15ff36e7934..189d7e6f9750 100644
--- a/sound/soc/renesas/siu_pcm.c
+++ b/sound/soc/renesas/siu_pcm.c
@@ -483,7 +483,6 @@ siu_pcm_pointer_dma(struct snd_soc_component *component,
 static int siu_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
-	/* card->dev == socdev->dev, see snd_soc_new_pcms() */
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
 	struct siu_info *info = siu_i2s_data;
-- 
2.25.1

