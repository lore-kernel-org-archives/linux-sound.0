Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96939258CE5;
	Wed, 29 Apr 2026 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426759; cv=none; b=VoWLGjLhY2FI2fErs9P0qw08XkMilKEr0kDyLVq8ZC+rewHIOn91j/+XOawzaTg2KVwGhYlhyWXKck5HPIyaUoI3qDSsG2RdnBD5UBCr7ShoaZA9rExFAlhSWBDJcRVL2m6PyirMr6hUrjjLmdPU0NRblG4GkFwRL71NqRaLi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426759; c=relaxed/simple;
	bh=RWny2LNzrPrEagJ3GrRqR5NlLn0/KK5X3ayFUZDi8u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5FwLqqVWJkElcQsxfmJACD9vYw/SA6RnmcJ/SciHmuN237r7pGAYFpQFAl69AfEY9dbJ8qTdsUpYg1GsIFGsjjREW5spMdeZug5xeJoD4JGZsJKioOMEz2tN0G7g5ivqisHTjNRAe+3AXk48w46yw6VU0xvSM5Ys80aYERpT+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=bMB1qep2; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="bMB1qep2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426746;
	bh=jSE/lZ8lv/JgPhAki8HHzPUjZ2Vg7C6vpdz7KPeviJM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=bMB1qep2c6V8sTJOykiR7JRe4yIJEjlrASDivQ0oczFItp9arwiJ3y85ncACRPbUs
	 4VXjGAryla1+JnB9Y30wVlzSR7KtoYhvcDETcFBAriKHbomZ1fL4EMtiK2pHLNm9gL
	 yopyfRzOo1UMiXUN1OL4kxzCSAinDS9cdo3y8eXg=
X-QQ-mid: zesmtpgz1t1777426743t04c28cc3
X-QQ-Originating-IP: X3b/ae0GrihuowuBpKcF5vlJDI0UwVsxLLurFmJWMKg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5249929831929191583
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:47 +0800
Subject: [PATCH 2/7] ASoC: spacemit: move hw constraints from hw_params to
 startup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-2-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=3191;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=RWny2LNzrPrEagJ3GrRqR5NlLn0/KK5X3ayFUZDi8u4=;
 b=wwoi9MYNJCqKjdN/C6ghsVSY+1vMmYnAh65X69vBVqtWQ9L/9Ra/BZlqbfPps05yOXGcuEesX
 jQcUsC+UxWRCgIl4ZvcTXH85nDmWSZHLn+zvCoBDaJ1Rwz02ogrjIwH
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NI/m03HJomrRu74cG2oYePhVtV5YEuilgncDg/eYOyMaexSu4UQNCiGi
	NdNTfOdUDz23t+hVVJyHeJO6tZsJ0qo9HD0BqjRpxR0AHbCj1FUsgXNG1PkAkPPtfibJj3X
	HLm8843qoLIR23wBolFMARPCUDiW0+O7ICzIGq0NRATgcZ/8E5RMlw1tiYgVRBnuATLwFx8
	N8f+v1XKTqFJWj6EnikI+Yt7156czVSTCQ8pnpO3n5YaCIZJEGxyVCWfVGX94wQ0cBrhQV9
	MlMxDl2wFrRw/Ap6k+ALtphP2AEfvRUxeoeRVzNlKL7WUd+Xv2O83hwEsn94L8Ii52DYAI5
	EsmxQgMVKkJFzq7yTSpXXH1gXs/8imQ51J0pzTEpBklHJo9Yhfo5FkZsSMumm+16/QAUb6z
	7LOSu8L17LThJlmXJSDrygh/gffq/9jPGF79NNnU2z+5tdJz2UcUPUuB1x21a94jsVsKtg4
	o5eheQFeI9V0GuBGLTx3e5JUsu1WD1bjLocfc14tUaomrTZx+CJvLONvRMr2b/O0bvgbyfe
	VDaGPC2B8XTp7oDcs9m6y/DYe3EmjuxJWz7ipX+HHOS8Mxc+nGl9eZu749Y9cfRt8Yl2LRg
	c8jLtScwCtJZSY6wN6kPlmviWe7CZKycw/Q0gF+15f0IlMZqYrhNJbI1bS5pIORFxyKQz47
	6d8iR2UIdGKd9TyFH1NP5xXyyOnc2w/rM7P7D64iJhQ7sFH6T6ci5R3G0/XNNyYeyvIqVwl
	7W0qRplw6gWKDoCiE+dfAgoj5zMui1CwYF6C6QH6DY4UZY1JRfFpFfn27bN9Y1S4F+uxSKY
	OM0AcZHrUsEk4sqTFzrNHIMIytytpREzIRdXeHVBPHXm8oo0o2FKhPaj8V/tUhBbwyzcuz9
	Xth/skY3tN/0mMQForR7lma0BLOkxmVrPujgkrC7Nm5IUJC/6ErWvj34uXGGivhsud5xRyV
	H5jQ04677ft0n+hVUV5e11oLKte0efnkmSXn+fHRrlB32I1nv9blxyTxb/JZ60XscnC4uuC
	QshEPDsPe+e6q+AjtFDRfY+OFyIK6gFAhwA9RSvrhtRT3E9yLSWneCHvtVBA7Ehoy5bIw+U
	SvPWmF2NpZZSLEvKsRvPW5BdfDKZFNkSLSXWIV6GGJVkh8UU9bsEFOlPz5nh+qOr4ggF013
	XXNV
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hardware constraints should be applied in the startup callback rather
than hw_params, as hw_params may be called too late for the constraints
to take effect properly.

Move the channel count and format constraints for I2S and DSP_A/DSP_B
modes into a new startup callback. This also tightens the I2S mode
channel constraint from 1-2 to exactly 2, matching the actual hardware
behavior.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 5c878f02cc93..e59624b2e23a 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -106,6 +106,37 @@ static void spacemit_i2s_init(struct spacemit_i2s_dev *i2s)
 	writel(0, i2s->base + SSINTEN);
 }
 
+static int spacemit_i2s_startup(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct spacemit_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
+
+	switch (i2s->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		snd_pcm_hw_constraint_minmax(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_CHANNELS,
+					     2, 2);
+		snd_pcm_hw_constraint_mask64(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_FORMAT,
+					     SNDRV_PCM_FMTBIT_S16_LE);
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		snd_pcm_hw_constraint_minmax(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_CHANNELS,
+					     1, 1);
+		snd_pcm_hw_constraint_mask64(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_FORMAT,
+					     SNDRV_PCM_FMTBIT_S32_LE);
+		break;
+	default:
+		dev_dbg(i2s->dev, "unexpected format type");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
@@ -153,22 +184,9 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 			dma_data->maxburst = 32;
 			dma_data->addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		}
-
-		snd_pcm_hw_constraint_minmax(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_CHANNELS,
-					     1, 2);
-		snd_pcm_hw_constraint_mask64(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_FORMAT,
-					     SNDRV_PCM_FMTBIT_S16_LE);
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
 	case SND_SOC_DAIFMT_DSP_B:
-		snd_pcm_hw_constraint_minmax(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_CHANNELS,
-					     1, 1);
-		snd_pcm_hw_constraint_mask64(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_FORMAT,
-					     SNDRV_PCM_FMTBIT_S32_LE);
 		break;
 	default:
 		dev_dbg(i2s->dev, "unexpected format type");
@@ -303,6 +321,7 @@ static int spacemit_i2s_dai_remove(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.probe = spacemit_i2s_dai_probe,
 	.remove = spacemit_i2s_dai_remove,
+	.startup = spacemit_i2s_startup,
 	.hw_params = spacemit_i2s_hw_params,
 	.set_sysclk = spacemit_i2s_set_sysclk,
 	.set_fmt = spacemit_i2s_set_fmt,

-- 
2.54.0

