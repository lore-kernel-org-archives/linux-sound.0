Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE429BDBB
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222732; cv=none; b=lqktsOKmman5qvb1GwhDrK4cf3ypHKiSVjtl0TyNlmcXB6xcCtKAHaUt59S9N8yJR+6++wod1NMG18nSKwUAueEK+xut7nqJoq3FKVPBO/hYWarxDQhh6EsCl1wLZD/HDX46gx/LbKdzRJhKdbPqoyP6TF42ur5KPoU+COz9/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222732; c=relaxed/simple;
	bh=b+d+x0HXl1+rRl15Ol8itvj2tr3UYmp4tjUIN4VYb9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knhQyuBTNKHd/UkG5AK2SDrp7YG5+mAB3rsXoXWBkX5iW3tl+wH1YuWJ/m21eaaxHF/faeGHAQWXa77o0O9TUtBAaCI9qiqQV60Sf3Vm0aGoP7nG6ERWGdgkqHmBdfUh8r9BCb3yvX2lOONYRD9iLDenm/cbjDK/Cf402lhhIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8qgiDgx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8qgiDgx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8894387780so918779a12.2
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222729; x=1783827529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG/ecMkbw5iY3mVFZZwciwX/dls3AImshn7KWiR1EE0=;
        b=L8qgiDgxRiConCiWMSoo/DRwNjr0PymFWveNqKyKyQHWkx4sBHNNJbeRFyuY+WSHsw
         kcHH5fg9PH9KW03wK/qbywjZ32IBzDp8M6vTQDdFOdYQhwfAmpcbmLaF36UM5ioclqGL
         /6LMPIX5A9cY+Z1a+onlbqCirk2BlXcp3Uwgw7UIvfF/N64EhkVh5vn9deP+6m5c6O6v
         UQp8GJFel3HsAZFvtKZtO2cxZ5E4d4yw7Q9wN96GKCXXrNszuf7Iqf+fFAOkf9ID13Z+
         bTLGrRZD5K5U4fFycV/4P2KGgMU3okm1Sa/eljqs5fb+x8fp0YMzqqRxqD4mc107MSF4
         PZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222729; x=1783827529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG/ecMkbw5iY3mVFZZwciwX/dls3AImshn7KWiR1EE0=;
        b=dkcI24aLzCFkS/tJeW1QbfJ99G+nZTKPgQYdX8qaEKTzP303HjpsVUj/oEuIfpCSmv
         cBvT2dI+NjGq3WPP4You5iF2sLY5sf59mNM7P2JisAXjHSUHR7Tn6RbPPxL43hXXUBuu
         SV3bFa8C6iuWCJ7XomcOWSdg3UZ3G066EFm9ctBvushX2HjdEHui5664aYB4b7ag3fY0
         zrShNkSghxRM3uvdu3n0JmSvFIR1kidQbYFo8S9PlKqheOvx+L2m7D3Dm2KU+6FobXAg
         wrZbd145L5WPoFZzJxlxANs6Nh/cizp+KqPeCRNe0K5twdiO0TaDEEJZV47lhxAAtFwt
         fuAA==
X-Forwarded-Encrypted: i=1; AFNElJ8KFmCiNZ3kZojdCTdfALOocxYPAkmdLU0LdT8WqcH/qr2K6poWd9/fJ04r9suiJEbv3iJulKPgQ7pqbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRfFiududINKVllm+HipuEAlIfZRtIw51Zzb5mg+97ceX77OR
	LFPJfS/kPnVMjrl6X6LFXdT980eKzw111rqBUmcQkf7DKXa3g5qL+J8U
X-Gm-Gg: AfdE7ck0KnbyJU1uBM2S5p2XDiTJSpfzivbMLBW/AUtG/OuRnPB9wi+oxcWL3CKVOoq
	3g+fFi75x+RdEo/bxD/y1fI57pmY8z0yToN+vzyBbVJ3p4hAVXmlOwZVLhMaJNaOLLGxCF3Tttn
	iyYKfsHyLygz+HSweIIvnrX8DBy8cWTG9zSOoV9/Z+FMAHtBD0KA5GSZIFTqReQQxgleHZhFkoq
	8XypmnjaQ+TNuv9vrHgnfbgUCGPw5GDiysyFP6O+0vKJtWEXrITYX0xMXzpXy1U72a2rlO5TLyc
	uJhex4r/fb4w6zyxtdduLu0b/cK7wXP+JhhCW+2QCJ0fqj159McSODw43nRiD/mp/tMIHuhRSuK
	FUVGdffNMfFb1GZTbYyaOdY81DTCPw2RMyfpBHgfrjeIje8eb9kgxYQ0v/TD3xmW1yNY7EjJhC/
	drkAGTVx7Kvre97dDjaQ/kduBhdbX3RavBXC1XJhGxKzAuOiMChi02XmApWA8CnHRQuKAWfDQX7
	K2Yh1InHc2BUzntjDR0CpTzmsrFaSW2GXgQMtydqG0Dm4Q7ItbXHBNzGXCCQpNjTyQWhJUdw/8=
X-Received: by 2002:a05:6a20:a125:b0:3bf:7994:ddc6 with SMTP id adf61e73a8af0-3c03e331612mr5918629637.25.1783222729235;
        Sat, 04 Jul 2026 20:38:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:53 +1000
Subject: [PATCH v3 4/7] ASoC: apple: mca: Support FEs being clock consumers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-apple-audio-redux-v3-4-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7230;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MnqC444lwq5AINRu2JGbpZLrcZTo1L7eKz7qBeunuFM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7dEZWumdbrKPPppd/j69c6K43w/+Ku+PLZ31L2to
 ZJT4CvXMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGomJYb/Tm7SHubqFxJOvBBLz5isphW1XXrH9p57Sor7g7Z3rQ3VYfgr864jKP1
 BsJLJTfuah2cuLq19Icr3WJbvwAGbrSs9ez5xAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Support FEs being I2S clock consumers. This does not mean we support
accepting clocks from outside the SoC (although it paves the way for
that support in the future), but it means multiple FEs can attach to one
BE, one being clock producer and the rest clock consumers.

This is useful for grabbing I/V sense data on some machines, since in
such a scenario the format of the sense data on the I2S bus differs
from that of the audio data (the two formats differing in slot width).
With two FEs attached to the bus, we can split the responsibilities and
command different slot widths to the two.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 128 ++++++++++++++++++++-----
 1 file changed, 105 insertions(+), 23 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 730ffe0805e1..92c9f8df50d6 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -133,12 +133,17 @@ struct mca_cluster {
 	struct clk *clk_parent;
 	struct dma_chan *dma_chans[SNDRV_PCM_STREAM_LAST + 1];
 
+	bool clk_provider;
+
 	bool port_clk_started[SNDRV_PCM_STREAM_LAST + 1];
 	int port_clk_driver; /* The cluster driving this cluster's port */
 
 	bool clocks_in_use[SNDRV_PCM_STREAM_LAST + 1];
 	struct device_link *pd_link;
 
+	/* In case of clock consumer FE */
+	int syncgen_in_use;
+
 	unsigned int bclk_ratio;
 
 	/* Masks etc. picked up via the set_tdm_slot method */
@@ -256,11 +261,32 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int mca_fe_get_port(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dpcm *dpcm;
+
+	be = NULL;
+	for_each_dpcm_be(fe, substream->stream, dpcm) {
+		be = dpcm->be;
+		break;
+	}
+
+	if (!be)
+		return -EINVAL;
+
+	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+}
+
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
 {
 	struct mca_data *mca = cl->host;
 	int ret;
 
+	if (!cl->clk_provider)
+		return -EINVAL;
+
 	ret = clk_prepare_enable(cl->clk_parent);
 	if (ret) {
 		dev_err(mca->dev,
@@ -332,7 +358,7 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	int ret;
 
 	if (cl->port_clk_driver < 0)
-		return -EINVAL;
+		return 0;
 
 	fe_cl = &mca->clusters[cl->port_clk_driver];
 
@@ -360,7 +386,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	struct mca_data *mca = cl->host;
 	struct mca_cluster *fe_cl;
 
-	if (cl->port_driver < 0)
+	if (cl->port_clk_driver < 0)
 		return -EINVAL;
 
 	/*
@@ -368,7 +394,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	 * belong to the same PCM, accesses should have been
 	 * synchronized at ASoC level.
 	 */
-	fe_cl = &mca->clusters[cl->port_driver];
+	fe_cl = &mca->clusters[cl->port_clk_driver];
 	if (!mca_fe_clocks_in_use(fe_cl))
 		return 0; /* Nothing to do */
 
@@ -380,6 +406,56 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mca_fe_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+
+	if (cl->clk_provider)
+		return 0;
+
+	/* Turn on the cluster power domain if not already in use */
+	if (!cl->syncgen_in_use) {
+		int port = mca_fe_get_port(substream);
+
+		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
+					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!cl->pd_link) {
+			dev_err(mca->dev,
+				"cluster %d: unable to prop-up power domain\n", cl->no);
+			return -EINVAL;
+		}
+
+		mca_modify(cl, REG_SYNCGEN_MCLK_SEL, SYNCGEN_MCLK_SEL, BIT(port));
+		mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN,
+			   SYNCGEN_STATUS_EN);
+	}
+	cl->syncgen_in_use |= 1 << substream->stream;
+
+	return 0;
+}
+
+static int mca_fe_hw_free(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+
+	if (cl->clk_provider)
+		return 0;
+
+	cl->syncgen_in_use &= ~(1 << substream->stream);
+	if (cl->syncgen_in_use)
+		return 0;
+
+	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
+	if (cl->pd_link)
+		device_link_del(cl->pd_link);
+
+	return 0;
+}
+
 static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 {
 	while (hweight32(mask) > nchans)
@@ -505,9 +581,18 @@ static int mca_fe_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u32 serdes_conf = 0;
 	u32 bitstart;
 
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=
-	    SND_SOC_DAIFMT_BP_FP)
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
+		cl->clk_provider = true;
+		break;
+
+	case SND_SOC_DAIFMT_BC_FC:
+		cl->clk_provider = false;
+		break;
+
+	default:
 		goto err;
+	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -564,24 +649,6 @@ static int mca_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
-	struct snd_soc_dpcm *dpcm;
-
-	be = NULL;
-	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
-
-	if (!be)
-		return -EINVAL;
-
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
-}
-
 static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
@@ -706,6 +773,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.prepare = mca_fe_prepare,
+	.hw_free = mca_fe_hw_free,
 };
 
 /*
@@ -759,6 +828,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 			   PORT_ENABLES_TX_DATA);
 	}
 
+	if (!fe_cl->clk_provider)
+		return 0;
+
 	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
@@ -791,14 +863,24 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
 	struct mca_data *mca = cl->host;
 
+	if (!fe)
+		return;
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA, 0);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
 	}
 
+	if (!fe_cl->clk_provider)
+		return;
+
 	cl->port_clk_started[substream->stream] = false;
 	if (!mca_be_clk_started(cl)) {
 		/*

-- 
2.55.0

