Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BE219E8;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073933; cv=none; b=hm3UyLZcsK4c4ajnoSDDnzQS0oAqd/glmqh3Tci+sTyUBVkQG8s7NFZOL/fzmS2w3LlK7p0ZVyXYqdWkM64cp51n6u493TJVnZw5gtj15QFJ+4079SfU+iWR9EmWREQ9In66Nr3gBBg6Fi0oKgqwObWHm1el/7eCfZoURpfIk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073933; c=relaxed/simple;
	bh=kcEZMM9dwwv/+5LXAHMwexp/Dz8ByaXsOxuHEAExciw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzJqFhyS7Hj2QD7ovd4D/Cm8apnYQPAfuEPw9oeH89CwJSfBv3TqX/+uftcy4GppKv+SlmidEmc+Sl8o3Q6fdn3GL/ydfgOmHph0sHxgCFpjBgQ5LbU2X/RDwiPSvdX/MoCB2TAB4DMwupUTQSsgYar6d1Hvebp1SuXePPzSmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3/Skb14K; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3/Skb14K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QfGvfC9/hXJmNDdXlodJG/Zikxj+nGFIjS0nGqw5KLc=; b=3/Skb14KpqKl8XgD2qSmCo5Omf
	kUwlHnGIkgJyvOZEx7MA+s2OXp6Px+wU8qKdoE9DSGSIX0JVf+fdPt/MNtQp7BY2/ZFs9PjW5+E1A
	Du7qQYNmqY6dsQ7mmh0mDWlXqBMNqMyHFVxm2cKwQa3YQYiPUfVPhEGtNGPKVVSJFcQFlDO6e18fP
	qG2B/hGW4XyUUoxHdRLXXlYDmr0jQ+r4bdESGIIMmC+A6F+ZLbdKYo53wVtIC2GiS3JSWmmBeuIO+
	iw9YZ+bcFAwNx5CPgvH8TeJWK0LhPN4aQRmOQCbPrgymVUNHap7lRae/3m5V3LiaITJKY1iXspsJ3
	ZI0V7i2g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7x-0000000DTcu-3IAY;
	Wed, 15 Jul 2026 00:05:29 +0000
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
Subject: [PATCH 03/14 v2] ASoC: fsl_asrc: avoid kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:14 -0700
Message-ID: <20260715000525.739874-4-rdunlap@infradead.org>
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

Use the struct keyword to describe structs in kernel-doc format. This
prevents kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_asrc.h:452 cannot understand function prototype: 'struct fsl_asrc_soc_data'
Warning: ../sound/soc/fsl/fsl_asrc.h:463 cannot understand function prototype: 'struct fsl_asrc_pair_priv'
Warning: ../sound/soc/fsl/fsl_asrc.h:475 cannot understand function prototype: 'struct fsl_asrc_priv'

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
