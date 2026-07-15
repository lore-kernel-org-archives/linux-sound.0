Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4374942BC50;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=ZWL83k+92uErOPqKctROzK+jKj5VWrOEkNt5FskJ/unBQeRy12U4YEAo/vSX0uAszJxfS33e9fq6OZBGWfta/CFH1YHit21+77qGayfZv5VUBEG9D4nYQ+1n+8ESu+NAy+wnF2eFwanaNWqjpF0GtuOYszWjnruXEkn4qqfai9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=mF3MCHi3YHEPYtjop3i9gaPyrknZouMvJIo5Ib6adhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVC7FAt7Dv/wE/0MqlrX7W63WugUhVkk4rlEyUZ/9/pfrX8YhGoElYLsXnUV55nvfGLwXKU1mJAPVT2Ji6Fq+FptipTrNWNDzZVcvEdthIVg3iX+HNsqDPmIlW/h+DG9hXxcLrWoeoy3xR59AdhH6mcZWMCB1dkFHz4fpteKNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BFVhVWgm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BFVhVWgm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XertOOfFvpAplO/JrXsYikR9iJI/5mQbiOBJ8r5yVLw=; b=BFVhVWgmF8Tu0/VlCpz6e4+xxR
	/z/aTnIe4M94RU3PDWGzerm3sAiS6RhmL9NR5RIB8j1ynsh4vGCQ51Gj1WwHMy5opjF6LDEfEPlU+
	EHYJeSbgntpoTAaeeUX1V8YgmwmRT4o+AykGeEF58OzX6Dmd/MKM8l/jERzY5GwpIenwKLxlt/21X
	isOStveFnQ844M08IsSVYa6CBec0u7e17AOmPMrPDf3WAh/RR4CBencwEJX9srqgpToMfBrzU0WA+
	EvjMUboiLOZ3oWkS9Zt6M+EB3z/eiN2jUJkh5gjLpJIejWS8SxMVwFhx+bC3bRwkDI7gMYs+T3V9u
	3GosD8mw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7x-0000000DTcu-0oxX;
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
Subject: [PATCH 02/14 v2] ASoC: fsl_asrc_common: fix all kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:13 -0700
Message-ID: <20260715000525.739874-3-rdunlap@infradead.org>
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

Add missing struct fields for struct fsl_asrc_m2m_cap.
Add the missing "struct" keyword on struct kernel-doc headings.

Warning: ../sound/soc/fsl/fsl_asrc_common.h:65 cannot understand function prototype: 'struct fsl_asrc_pair'
Warning: ../sound/soc/fsl/fsl_asrc_common.h:129 cannot understand function prototype: 'struct fsl_asrc'

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
