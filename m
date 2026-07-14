Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D73655FA;
	Tue, 14 Jul 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993492; cv=none; b=uAagb5PYi6ViMwWjwClC20ykrMdjZK4YRmFRxp2hUHZx76wEIuqzbxpXIVVqoP3W5XU8yqNM0vNsgFp3A6gWz/0AbyVGY6cVHRVem+lMJkFQUJ9AirMMOrkEFOomvES4mdHcVslW2Dhe5/Go6WAQdZsuG+GrAVER+s6wgGMw1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993492; c=relaxed/simple;
	bh=pcmPLW1ckscXJ7tLYFtZXhXWJb2pfwi22WLgzon0EOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMvmISfD0Aj49u/iwhOt4aTevJo/uL5sg7MEYCRCevMjUKFjw5w9LuR/aHYcbGOsghwntGI9SKagXTfYIM2Uk1KRj08mSxLLKsje1BqiIXVj8Likihb2HvHRQv7g27n31UkIpGfdh/3wOyOgPD1/5NTeTA7IqSc9P3cR/NbPuvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZNfgIo8G; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZNfgIo8G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xIMbHNXRgWN96mgMSOPjT3h6eA/9+RO5/tFljxfnX7c=; b=ZNfgIo8GsJf8VocUUwG9WSnhLx
	fSZc5Ld9BVIXG0BI0oBNhITGbE7hr0TqQGjT0fQD0JBQp2lvp6v6ZbMOZUWvz7XjLtnJ62WacfUKF
	VS6mxPWqKO3mHRJhS4VFc76hw2vT8dMpwOdaKjrbQkHMw77zoJYlB9CWVFhAl/7KV4uLcNC/EjNSM
	MgH5+E6eT78HTzfZpZNFeK9/T8k0RKG7yDew90U7icwA7lXzOywFejvGcOCXaa5lD8dVlnqChEH0i
	xcBi2yE/0z4zkEVKxEYMPTfcKKBjjf99s20Q0YzcAoMw6cLVpVKTktn3bhFCOFqMarBUCvC/tk7uU
	SZhUT0aQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCY-0000000AgsR-2w2E;
	Tue, 14 Jul 2026 01:44:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
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
	linux-arm-msm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/14] ASoC: fsl: mpc5200_dma: use the struct keyword for kernel-doc comments
Date: Mon, 13 Jul 2026 18:44:37 -0700
Message-ID: <20260714014445.569992-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714014445.569992-1-rdunlap@infradead.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
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
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
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
