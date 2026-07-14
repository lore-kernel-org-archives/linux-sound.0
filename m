Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F3F3672AF;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993491; cv=none; b=l1hEhDny5n/odCvk26VUBuDGCC/m50nlobpG93fWR+eJZnG356BKAjUzN3j2Hn0W3JTtAdU5H/sF6tXV6OzcxNkichPc+1bVB7dI0slgmknbazDzJVQaNQ6DghKWIq+sbgAPpTCp/WmXhEA60n0djPqM7Ch0SXH/UzTe71iArl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993491; c=relaxed/simple;
	bh=iKyQ6tpXSN/QAo8Wyv56MuhuLZ/e1uwQabzAP7yy/XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNRxW6deIJUh8QPwK85nYTmjthgC1R33dqAAcWcPMXSClGpvxgIdEo7JaYB1/TZAeHLJehq4oSbbsqxqkEAiT45pYFZuQjVvjGbbhDLRCTN/QdvFHuLRv9zsSeDgAEcBKmhgLZ0lEZEupwlUjTcuYpDMm7nDmDPDBB8ncTQMRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UTNrwKVR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UTNrwKVR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+PwZcettfGvI8Lm1XoNHMC02UlU18VC13AXj5oPS12E=; b=UTNrwKVRFbWWxYCulCRzRwkfIw
	0peg4L4N1QTxWpk3AeIEnyBytYiYN88/soUvG/oLw1i1SXzB0LtFpjU+Akt0QXPly9ZX0mN976kpT
	vi+QQ9HgioKWOnOvoDgCEYJzZnqX8KFtCjo7cNDRGnIuPQ589DRe8JunhuXC1diOQt+s37I9DM9Ld
	Bat4Ygnhtj/Z+8ALUJxnP7DCvEvt8nebzzbmKvIjE2HPdWyHDx1Hhht/M7PdhhGhvA0Nh5JpHs5AJ
	B9vRf3TZtf/2NvEYa3Ujvbv5DRI3RjIarsabsk6sx/wKW7BPkTjM+QjXCgyeIYbpNFVRXsSx+gLPU
	u+Y10Xmg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCW-0000000AgsR-46ef;
	Tue, 14 Jul 2026 01:44:49 +0000
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
Subject: [PATCH 03/14] ASoC: fsl_asrc: avoid kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:34 -0700
Message-ID: <20260714014445.569992-4-rdunlap@infradead.org>
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

Use the struct keyword to describe structs in kernel-doc format. This
prevents kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_asrc.h:452 cannot understand function prototype: 'struct fsl_asrc_soc_data'
Warning: ../sound/soc/fsl/fsl_asrc.h:463 cannot understand function prototype: 'struct fsl_asrc_pair_priv'
Warning: ../sound/soc/fsl/fsl_asrc.h:475 cannot understand function prototype: 'struct fsl_asrc_priv'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_asrc.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_asrc.h
+++ linext-2026-0710/sound/soc/fsl/fsl_asrc.h
@@ -444,7 +444,7 @@ struct dma_block {
 };
 
 /**
- * fsl_asrc_soc_data: soc specific data
+ * struct fsl_asrc_soc_data - soc specific data
  *
  * @use_edma: using edma as dma device or not
  * @channel_bits: width of ASRCNCR register for each pair
@@ -457,7 +457,7 @@ struct fsl_asrc_soc_data {
 };
 
 /**
- * fsl_asrc_pair_priv: ASRC Pair private data
+ * struct fsl_asrc_pair_priv - ASRC Pair private data
  *
  * @config: configuration profile
  */
@@ -466,7 +466,7 @@ struct fsl_asrc_pair_priv {
 };
 
 /**
- * fsl_asrc_priv: ASRC private data
+ * struct fsl_asrc_priv - ASRC private data
  *
  * @asrck_clk: clock sources to driver ASRC internal logic
  * @soc: soc specific data
