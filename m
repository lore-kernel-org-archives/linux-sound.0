Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680B2C9D;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=PZpJFZBdTKAiavNFLNB/iOW3nfHt6IvW9bodcBbDYoXwsRg9SN9lnuUltL+cAqVkVseFFarBf0zCZZXOZzY1hp+S7yOSczSuZCy0Qfqft4DLGULeWwbszeJQ4EUoJsjBe0ziTxW8djQNux5Mfsg+QouFOqtn2LjyF7A6v3+qBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=ZCPjjupNgyBOauiUKAApeUhRSp3LzaDE6QhxBtoXbzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQLG8SCeem/z8lqNe3XnbOgcJdjs45Oa9ElsLcYd1wp1clndf9+Au95pg9XC28Hm1x98a9DSLYKevAbzcdSm7FIPBatlXRHuiWwaijAdvZkFpqqe7gx1d/b23zlsRJgPeLrj6V/OZDfkxQwA9brE47oFiif8MZQWWjscrXIBwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=borUDlxS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="borUDlxS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=13+kOO9irn/A7mQQp6b2R+oh3w+6rv8EFxuB7M47cVI=; b=borUDlxSSHeiJQzdvEyjL09ewq
	JjVhpWQhGcmpl4kw0HwhRSUyJw1CoRaeAeSxQYbvkliytuSCGFIpUYuU4UJVAtCdROoK7QYZFzjBu
	BKOp4vBO5wLHIxwaUZy8XRNPtl1mBMyQLN1VWzIgDZmXyGP0cKMPD+t7F70p3fGYvYSVE6bLOUjl0
	i7+8TSLk0SGYNov9c5qgpEPwktMPMbmLIaj9pjUFhkwuIVi3lcu9Tf4j2nrfeZLz7RTSxQ58cLZJW
	+ymlYcMjyC5659o9tjfrmrnS4hF4F6YChsUlv8ZKdq83L1bzVEpICTDe4pG3keTy/PLqxysFH82V1
	jHFoPnQw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7z-0000000DTcu-2NMf;
	Wed, 15 Jul 2026 00:05:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 06/14 v2] ASoC: fsl: mpc5200_dma: use the struct keyword for kernel-doc comments
Date: Tue, 14 Jul 2026 17:05:17 -0700
Message-ID: <20260715000525.739874-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715000525.739874-1-rdunlap@infradead.org>
References: <20260715000525.739874-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the documented format for kernel-doc of structs and the correct
struct name to prevent kernel-doc warnings:

Warning: ../sound/soc/fsl/mpc5200_dma.h:21 cannot understand function prototype: 'struct psc_dma_stream'
Warning: ../sound/soc/fsl/mpc5200_dma.h:50 cannot understand function prototype: 'struct psc_dma'
Warning: sound/soc/fsl/mpc5200_dma.h:35 expecting prototype for struct psc_ac97_stream. Prototype was for struct psc_dma_stream instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/mpc5200_dma.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/mpc5200_dma.h
+++ linext-2026-0710/sound/soc/fsl/mpc5200_dma.h
@@ -9,7 +9,7 @@
 #define PSC_STREAM_NAME_LEN 32
 
 /**
- * psc_ac97_stream - Data specific to a single stream (playback or capture)
+ * struct psc_dma_stream - Data specific to a single stream (playback or capture)
  * @active:		flag indicating if the stream is active
  * @psc_dma:		pointer back to parent psc_dma data structure
  * @bcom_task:		bestcomm task structure
@@ -36,7 +36,7 @@ struct psc_dma_stream {
 };
 
 /**
- * psc_dma - Private driver data
+ * struct psc_dma - Private driver data
  * @name: short name for this device ("PSC0", "PSC1", etc)
  * @psc_regs: pointer to the PSC's registers
  * @fifo_regs: pointer to the PSC's FIFO registers
