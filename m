Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53223B61B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732325; cv=none; b=U0jrokt198CBKHa04lUcnBRsTMJHtWULqca+IZmf323MTA+K9IBAVnQCcqQbu1HbtB2h41gHcXo2A4IRauYJyXOdGb2C4nLQYK27K+c5JxZ+X7XUuGkAWgioykeh0SJ2JSL0fQw9OBmF9KxanHB6nr7woqrH3TOBZUDqVS1pAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732325; c=relaxed/simple;
	bh=hsiZfdFeQ2D+g5v0NXSz07lWdCQawXUkZPcmZz11vVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoEMbBOYD9GrcwkWORZzMrUe/GLZSWScyRw6S1uM184mraxoSBU7I2qHJRQaLkerqyHxOCbZvQgDlJIqvnckkByvNZWciNDL0mquFDSvP3N6gH7R8ahoigokOQojI1olP90+KRei6vmfYDzgreaTgjyA+00RKJMhAzzb7/s+iWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZcX0hnl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZcX0hnl"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1571171b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732322; x=1784337122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWXvW/d32rE+ZsswBcpmlmtcJ/j0K/HsxgukixLnv5k=;
        b=ZZcX0hnlYfYnwEF5JjBkkfwLEyBecbvKvVdHZI+gJgGAbC3SwoDJu6/PcisWUG3NXU
         Fd1QKWuEMXOb59Mprw39/Ijn2MfBHiIH5aSC0NvgT8kKL27cFiDVKs8vKU5TAtWyZsPj
         opc8GAOkaGKKACLYPEfHFzVKS3yeWdMpXVkt9uAIBW3xLPXhuVyAs/mUeh/QbrKjliaN
         ++3uHjyQx3YEmPql0cyuAI69qZW4XYxWvZWufeQ/XkjuiPOIyhJnNsYnvATV7LOjoMva
         5udJ/fxANtdXlkjdjE6msdLDXmZJZXsQ6wCkFwO3/wFF/C1BjA6e1kxG5/Hq3JkzVKnS
         47Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732322; x=1784337122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWXvW/d32rE+ZsswBcpmlmtcJ/j0K/HsxgukixLnv5k=;
        b=rcwDQRg8ykeI9Q6+QEQ2cu1qfoF9VVJmaFkU1wggYB4WInUz4Kqj2YrFrO+IxlX4zs
         Sfmt9DsNQxyhDIjASsNvgnZuDKVS7V1b1XEjEa7b467UEQ/e0/OnN16wvnYaTrQZPghD
         lzko+/bETXg3VlnuTek1YJ+3vr1wZN/x5GW533uGcoNlq+tbsfV4kwrDPYDYPjTiqBFz
         kpJOHPvmGGswj9L0O2dtu773PBkW0kEOU7QXrlxvmtwmkeAT1iM9vrlmKvvQwXZnsvyS
         DjfNqmJI4IQTvt9RoY0lkTo55e1Fcl/e5sYiJwxXKu6qX4IPRqTmO+nfTd6xvC0db9rw
         D/yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb50VNya1l1lnMrcRSbrHb7ae46o2F2h8aJQyYMaVjhJaY928Tzgqs2BU0Fe61p2qyydOAtHM0Cxs1vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjWpoc1zFWM97WHVD4QYPtRalfyDRcQMFtXstn/PN8uNejNGs
	sN+8b0EB8z3dy4jqtQKmOHBTrnOiQyjPOOghAmkcedizLLn2JmBO26GI
X-Gm-Gg: AfdE7cm11oaeMVCEc5K2bpOd5no2L7AaIxfcZQZUJ6zDXSxgtEWSYoxWYkIf+3Birdj
	TcLIg90BlmZkCjWNXK7ES+lpWGkW+KfASum3xU97zRWHSUZMfhCAKx9FGI8unIwz4p9i+S3FgwV
	uuLV916VJaS5C/g9cwFZ0cBBChdxeXgsn4CHQEuDRxW82E//jalI94UiOayhUxXdApxP8S2lLjD
	tv7k88htaAIjzDPIx1epUINouB3Ejj8Z0sJvUZAVFpgkjn2/FiK4JVVwXCiFxIOlWa0pkhCLV3y
	7qc2iOPlJRpDrjbYTBR7yHxy4zrxoLTM/q79E7Md4V00ZcACfpHkdBtxxiwVvcDvi3hQg/NqszL
	3XD6uwsZHnZBTc+XTYs9BnBQ6gqkcelSxwxl2XRpIi+C75d64ccX1edN5zqr+ZIg0gqWGbNeTJ+
	k4XuMH8LraQnBMdjtuEIRFQd6fTgOc//of4F7DNz/QG9e8K6NDLytR8AuU5pyjmImXLhxwrtJFW
	nJYo/1Tih3gW94VSnTr/8wq3fwJHQN8eyhUVFHb8v1xx/cPaBTFjxAcZUqmnxhEfg==
X-Received: by 2002:a05:6a00:9515:b0:848:79aa:5d37 with SMTP id d2e1a72fcca58-8488976f68dmr1100276b3a.55.1783732322210;
        Fri, 10 Jul 2026 18:12:02 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:01 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:22 +1000
Subject: [PATCH v4 4/7] ASoC: apple: mca: Support FEs being clock consumers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-4-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6641;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HGFc7Bs6efxQPRt87AL1RvM9nIpRzzqEdF6rtxgMhd0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7ynHHDRPixw0uOYp4HGJd//MyfP5xGeaHHa8eqPu
 rd7m6andExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6y25Ghun+n6Kv6+qc9G0rsD+y6Ifpl5c34iJesUyMWXFGc8XzlVcZ/sfPj1/
 1+73mCk/+JotdT8zrmDY8UPvPLCM4fWWopu++VWwA
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
 sound/soc/apple/mca.c | 124 ++++++++++++++++++++-----
 1 file changed, 103 insertions(+), 21 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 1e9a5c9cfc54..92c9f8df50d6 100644
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

