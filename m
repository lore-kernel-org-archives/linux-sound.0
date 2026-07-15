Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43776FC0A;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=EYmkbEkiZiUusKAEdynu8ZIoWZSa6DNWi6q2YFDKMz+omgcp4arzQOFK6YcdGwxNvGDdeNwo0zpIZPBwEb7sgkRXGvIL83LTT5L49zZ/3mU3DiGslvmDP1+G86WOCI25Rdozo8eEbgtaLmqFSSJ6kO24GvCbj5hU0fwce3eeKNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=BZewiftLFYOj0FqoCELdWkal16OQR61j7OKb5kXzPvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au4NPN7v6Q/YIvQWAX/YF5zB3Y8IfFZvx8I8Sp4E2R+yjbkHtfuAMz5QphnWM+Xio77fTrWMe+AyoXeZ7bOLbRmOyKftvFHB4coWS4uOUB/tUnrvZi/RaXjN8nnBMK78fG6IePfZ3OHvIQKsTuzAcnwZZKzOArsDwMaV6Spl9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T0CUoKFP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T0CUoKFP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=G+ICPr4j5N29bqgssjH6/kLVysBy2Z2WmiFI+/aQQHg=; b=T0CUoKFPmf9OVYNj4ZoWHojS2u
	z4Gwx70W/kY+Hr1XC3YRzifUDHCih/fhoTwNy6/TpckrZWQW2RMcSu4g9QYujWZY3czHi5SXLs2yv
	dkL9nB2kEPr2UoFbLyL3tvpLIpCQbtuGJZuR85aCsKXNndfBGx0JMWBiMwHOLQs+kBrK8Hrr7i14c
	EYKoT9Lg0uvo8pwqqL7c0IuyK2cIK6iHNWJdofGjhaDwo8h7QMTaLTy5qWxLe7lazjVkr4BqQV4lf
	mApc2S+FMlWkVUmLma9nuRubnFTSz7/tOrHT7FYl1RjBM8yxAlxjITdrqwIl0vsAidsGp3HKL7v+W
	IuU66hOA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7y-0000000DTcu-1XYG;
	Wed, 15 Jul 2026 00:05:30 +0000
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
Subject: [PATCH 04/14 v2] ASoC: fsl-dma: fix all kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:15 -0700
Message-ID: <20260715000525.739874-5-rdunlap@infradead.org>
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

Don't use "/**" for non-kernel-doc comments to avoid kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_dma.h:95 This comment starts with '/**', but isn't a kernel-doc comment.
 *  List Descriptor for extended chaining mode DMA operations.
Warning: ../sound/soc/fsl/fsl_dma.h:110 This comment starts with '/**', but isn't a kernel-doc comment.
 *  Link Descriptor for basic and extended chaining mode DMA operations.

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

 sound/soc/fsl/fsl_dma.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_dma.h
+++ linext-2026-0710/sound/soc/fsl/fsl_dma.h
@@ -92,7 +92,7 @@ static inline u32 CCSR_DMA_ECLNDAR_ADDR(
 #define CCSR_DMA_ATR_SNOOP      	0x00050000
 #define CCSR_DMA_ATR_ESAD_MASK  	0x0000000F
 
-/**
+/*
  *  List Descriptor for extended chaining mode DMA operations.
  *
  *  The CLSDAR register points to the first (in a linked-list) List
@@ -107,7 +107,7 @@ struct fsl_dma_list_descriptor {
 	u8 res[8];      	/* Reserved */
 } __attribute__ ((aligned(32), packed));
 
-/**
+/*
  *  Link Descriptor for basic and extended chaining mode DMA operations.
  *
  *  A Link Descriptor points to a single DMA buffer.  Each link descriptor
