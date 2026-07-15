Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E118C2C;
	Wed, 15 Jul 2026 00:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=V0dXFqu5egk2q005fDeRgad4IpA6qErfslbJsRwBaxvyyv3kwyDHW82B9wE4zTtXksz3wZKcs86X2uQqb+LVhZgIttSYzcRUN7MIreN0FHQeZo/i+iFF7rCdoRaJvJcNgMHRSAEUClTIg7FabBOXln34QH+VDpjjgTix1lBw7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=TgtbU24QyokXeQ6FxTU8It02hTt3RQqa4/G+K9mLD88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKowXWaM6DWZFqcnxsOzNLeHmy2g6ddvvTWWtamZBijTQVNkQtQVVliPP7l5pupNcYmMS10hjcB2MnsuBUyyBrHC304LKsRasy6XOAtpRpMab+9oqoJ7ClAfSpgleF3IsClZUmkNVasW76gKD85AGcoG7XG9BIIob7tIIqlSNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rRnwIDcW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rRnwIDcW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PsmGT/sQld/pt62ygshu3j5BEf/gAGTuk82oceWecys=; b=rRnwIDcW1l5KnfcrIubl7vi3x5
	Jk0kYSBdmLb9wKIbpERIQR40xYayoo5Bcwh1MXSy7nAuEBexkJd1xAU/iho7zM9WSXlEzIKSsKmw4
	y9u1RgsWg/4mYAIl4uvaNJu2p6RUDLy4aIWK2PVarJJbyuAdj5YMou7u4UgMdQyDfm3BY6wqx9oeW
	Z1w3rbhhCpr3dNujS0JSUEDwAVWhcoQLtkK3p2TbjjTdsA/OkZuLfA9CmYjWimsoXjO8kAf3NBm5U
	rYbut9aes/IwzAY0nNFvMg3Oh+IGabM7hySmQAsCezrWuTtTLq6VU9R/nE2WFdfMkgXpBmQ05xqAC
	0dDuKnCw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn80-0000000DTcu-0fow;
	Wed, 15 Jul 2026 00:05:32 +0000
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
Subject: [PATCH 07/14 v2] ASoC: fsl: mpc5200_psc_i2s: avoid kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:18 -0700
Message-ID: <20260715000525.739874-8-rdunlap@infradead.org>
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

Add missing kernel-doc for function parameters.
Use kernel-doc format for function return value descriptions.
Use the "var" keyword to describe a data definition.

These changes avoid all kernel-doc warnings in this file:

Warning: ../sound/soc/fsl/mpc5200_psc_i2s.c:123 cannot understand function prototype: 'const struct snd_soc_dai_ops psc_i2s_dai_ops ='
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:87 function parameter 'cpu_dai' not described in 'psc_i2s_set_sysclk'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:87 No description found for return value of 'psc_i2s_set_sysclk'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:106 function parameter 'cpu_dai' not described in 'psc_i2s_set_fmt'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:106 No description found for return value of 'psc_i2s_set_fmt'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:123 cannot understand function prototype: 'const struct snd_soc_dai_ops psc_i2s_dai_ops ='

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

 sound/soc/fsl/mpc5200_psc_i2s.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- linext-2026-0710.orig/sound/soc/fsl/mpc5200_psc_i2s.c
+++ linext-2026-0710/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -79,9 +79,12 @@ static int psc_i2s_hw_params(struct snd_
  * and we don't care about the frequency.  Return an error if the direction
  * is not SND_SOC_CLOCK_IN.
  *
+ * @cpu_dai: DAI runtime data pointer
  * @clk_id: reserved, should be zero
  * @freq: the frequency of the given clock ID, currently ignored
  * @dir: SND_SOC_CLOCK_IN (clock slave) or SND_SOC_CLOCK_OUT (clock master)
+ *
+ * Returns: %0 on success or %-EINVAL on failure.
  */
 static int psc_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 			      int clk_id, unsigned int freq, int dir)
@@ -101,7 +104,10 @@ static int psc_i2s_set_sysclk(struct snd
  * This driver only supports I2S mode.  Return an error if the format is
  * not SND_SOC_DAIFMT_I2S.
  *
+ * @cpu_dai: DAI runtime data pointer
  * @format: one of SND_SOC_DAIFMT_xxx
+ *
+ * Returns: %0 on success or %-EINVAL on failure.
  */
 static int psc_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int format)
 {
@@ -119,7 +125,7 @@ static int psc_i2s_set_fmt(struct snd_so
  */
 
 /**
- * psc_i2s_dai_template: template CPU Digital Audio Interface
+ * var psc_i2s_dai_ops - template CPU Digital Audio Interface
  */
 static const struct snd_soc_dai_ops psc_i2s_dai_ops = {
 	.hw_params	= psc_i2s_hw_params,
