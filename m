Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811536923B;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993491; cv=none; b=eZ3WxOMzxvMwq7yVxcqUTRKAYlheUoQaMeaEqRkSdrVuRp8IMsLwD0I3bDnKjSwbd58ORZe9ojrDElYMeKap6xK9dGTmMMtdSzxizeac02G3qQSohvlh0ObsyFz39kElKnNy9ZtwRXIWigFD/hE6oy5fuX3VX4rfV0OU2bTgJKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993491; c=relaxed/simple;
	bh=HyHyh870J7l0d88yirlTZ0Pi8sqNDlrKmXHuWudQtQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMlc9sBcd0yndmxpqMKgCel5Q7DyH6IBb60y1oUWqZ9mq7yzLSpHecU9HjHmr8WEuFuLiCLQanRPFkxKr1kHIiDPoIrroJC9O13NtwRjkgm0Rm1KthvPdZiqpTgSO4/n9flJ2Z22+IK8ZMN12yJNik/QI71pT4HxDg5es7KyLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RA7NNrOY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RA7NNrOY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=n6ptzdNiKxIt/9IdKIh/JryAO0MOA128SHJPdsO4CPs=; b=RA7NNrOY8nEVwexeyZnwKVsUoj
	LVdscNYA5L+RFhpCNzXDdHWyHiFAThgYvPIFHnKt+Btcykpnneq/J3Tj50Ffqh5aYyej4ootfksj9
	2mGaWvs+172r+QotM4dVUQWtM2dPPDNr+JSiqIv1k+gxEnULmePZ+xt6PVtfXwi6PB4d/DydcmSMS
	DbGMVNbHVkf9j2J4Q+wTqlfBBxfLSVhZ2LF9zRRKOg9MPyIcF5DIVsLU71I1iPQMnkUJzcsAR531V
	J6NK9j2Xq6zp87x+AjkG4tK1C+DR8yw+iSHt2vnDdf8ng93d/ahnj65EshbCBP/n2yibtSd6YgBcj
	ZA2sWFxg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCW-0000000AgsR-1j8c;
	Tue, 14 Jul 2026 01:44:48 +0000
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
Subject: [PATCH 02/14] ASoC: fsl_asrc_common: fix all kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:33 -0700
Message-ID: <20260714014445.569992-3-rdunlap@infradead.org>
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

Add missing struct fields for struct fsl_asrc_m2m_cap.
Add the missing "struct" keyword on struct kernel-doc headings.

Warning: ../sound/soc/fsl/fsl_asrc_common.h:65 cannot understand function prototype: 'struct fsl_asrc_pair'
Warning: ../sound/soc/fsl/fsl_asrc_common.h:129 cannot understand function prototype: 'struct fsl_asrc'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_asrc_common.h |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_asrc_common.h
+++ linext-2026-0710/sound/soc/fsl/fsl_asrc_common.h
@@ -28,7 +28,9 @@ enum asrc_pair_index {
  * @chan_min: minimum channel number
  * @chan_max: maximum channel number
  * @rate_in: minimum rate
- * @rate_out: maximum rete
+ * @rate_in_count: number of array elements in @rate_in
+ * @rate_out: maximum rate
+ * @rate_out_count: number of array elements in @rate_out
  */
 struct fsl_asrc_m2m_cap {
 	u64 fmt_in;
@@ -42,7 +44,7 @@ struct fsl_asrc_m2m_cap {
 };
 
 /**
- * fsl_asrc_pair: ASRC Pair common data
+ * struct fsl_asrc_pair - ASRC Pair common data
  *
  * @asrc: pointer to its parent module
  * @error: error record
@@ -90,7 +92,7 @@ struct fsl_asrc_pair {
 };
 
 /**
- * fsl_asrc: ASRC common data
+ * struct fsl_asrc - ASRC common data
  *
  * @dma_params_rx: DMA parameters for receive channel
  * @dma_params_tx: DMA parameters for transmit channel
