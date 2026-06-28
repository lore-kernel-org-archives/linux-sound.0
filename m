Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A13A2E36
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646986; cv=none; b=eVKU731MQ4Uq+POhT/ccZmaz9XRPRE5Pkd+5+oINEFrqrol9JDqhcyd+ZeQI9on/5jlXVAkYOY2L/znXR996DKaYdVDoahNp2XXXuD8NjEmUl93V0i3D2BrkguDTYtAuDtDg9i+Ke1ivi/9eIQH4wq7wr3giqJl5iAcVrgI9DdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646986; c=relaxed/simple;
	bh=vCwTWhx34mxI5VtL9yfZYBRYlRieG7N9OPwOIARXohg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l50md6I/9wyer/QfTWC4s37PbCxRZiih1IlLOANrQb9RcF2fmg7zfCBS55PBPq+L5pb4r9A7AoetH+2K237QO5dvXWBrpu6t9mMfKQ3JayoowbCeZgwQ7/8Q0g1WuIzfKeVREIkPh7gxDs0yn3dUkz6II63oZaVDYgf+oXxF+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql5qUjlZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql5qUjlZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30e7eb50b83so855268eec.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646985; x=1783251785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2b3SDdqWpmyJY1eiorrtcZL1eV0O0v8ZeY+y7/BcKo=;
        b=ql5qUjlZW47mKwUt+kn9gTtuC8mcF2iMCg3hKEI/y4Yf3iGcwxyZgqbCogxL5ua/rh
         nO5+OazI/g8BfbBrn3NCzmDcJqDjjY+eFLi+cKFQtcUtIgkLdaie9N7SnSJ1eHoIQMje
         c7HxkTnjrxxdv10utEpeoaRFj1dpk5u2rxJbrKCERSkMc710+OvvMDo4MacRiUrxVOZo
         KchcLo0mhh9EVw5BF0YqAYiS7CYiGcd58zsjnJFqUJFvwf1V2MkROUk59qbqx0thm/6w
         xS+GOl+UEs+5pzRVhwsXyYoSKNO6swSK7SK6n2AAYdrbjHVWDqJTzZ+ePGELt5rAbXSY
         f0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646985; x=1783251785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f2b3SDdqWpmyJY1eiorrtcZL1eV0O0v8ZeY+y7/BcKo=;
        b=FkDX9f7nDiHL2EhD9kzV3IiPhTg8oBrZRe02FPrBxoUyIA7+i1fpVJ1nBWjDYq5ivv
         v3CWV8DsdPboA9DWH18JFsrRvRMfNujdzrSnEtkjI65l7qkwnKT6sTmxaDPfUY2CPjx9
         yCFKDFkO8YaQQ9D2tuifZ9+1V2PeDe5g/PbCumkWnYREXT920Rxcw/XcykBd2sOnEVsI
         SBYOe6NGEgtu/LdNd9wnwb2FlJVfd4Vs3SZQuopAM/xlOEfCFR8onwVcQup3v3h+sX/5
         3/Qn3RH0HFSvCYpcJa9SvtroADXx4mNrZVpZEuHOwUsNCtPGgp0BiaBuv13hkj9aoxIf
         dfZw==
X-Forwarded-Encrypted: i=1; AHgh+Rosm1kSWx0h7O7LNVbEw/dFR/LsnwSxGS7gF5QToO/1VMHp9xeDuLrOqScDYP2Z9QgIgKsQSdXLmEmvIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9SoNjOoAdIWfxXPFdxVu+2pyE7QKtZD0tcVv4HZelfXCGEo2
	eKTef/VDoCCEp9JGCq9YZiSfODXHgHjGvhbfyq26L/Zb/gpi+jKNsT6R
X-Gm-Gg: AfdE7clfubH6MUTxCn37zdZ5ikQ2F9udWKo7AbPPwO9kycWwKkOZFkG9386DXYX3VEh
	65eslgF/jUddqc7PjZP+udnwpWkkHe39dHyIaJWthLMJn8VMGWiJEtjfZDrso1eKctcf4Q+r+Eg
	DMICbnf62Vvs8yrnDPvdoSffLNxrVmZmgjTy43TAxSbbZ1sCtvbnQsRCbT/emPTXFILnZ+uivHM
	9iBNvWLhUIXhymKQzSyxy/FBeH2MkWEodOjghNUtO7kMNSa/olL1MV4ezrXfZGYlsAjM6lQiGp9
	xG3/2O4Ye1uoyFHePgMBKy7nnTl2Q/IqWT1tF9cWgZWA20T/aw7hnpq1t3wEyqUGGoBKauRvW8h
	x1ky9JgYWuLVmAhK2gHOEOQd7IyhJUuI0dKMw6/Twx5J5ZaC3EJ+3g+P3kthoJeaioxCkSpSOTT
	2QVHbZdGfFcftEoz+15tgoTMVxheLTyAXJM3QcbO8Z96EevigbNXlaWqbaxN42/Ut2NMsYx+CMR
	Ke5ZWlCNxPCokfThpXB0qAfqyZzbj7rua5sc5DFNl3cXGjKtbj4hdgZjhOQuM0LDA==
X-Received: by 2002:a05:7300:aca8:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-30c84b8a06bmr11982279eec.14.1782646984691;
        Sun, 28 Jun 2026 04:43:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:00 +1000
Subject: [PATCH v2 2/7] ASoC: apple: mca: Separate data & clock port setup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-2-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5618;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=GgliJOoSvzcQza50Y86eOaSmstcrXgaFkvgkZNNfLKM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLvlf+7vcfZauepng+/9lnPCRacsz3DmZ97gkrKUd
 TssHPa9YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVPKxh+s1QEvTpdJPJN8kvDhfCZO+ecVDv279+7t0f9HU/pXVL8xcfwV/63jk0
 au1bdTl+tIPFIt+M7+zfMW7tH/8BVRu63B/fxsQIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Up until now FEs were always the clock providers -- feeding the clocks
on any ports (BEs) they are attached to. This will soon change and FEs
will be allowed to be clock consumers. Once that happens, the routing
of clocks and data will to some degree decouple.

In advance of the change, make preparations:

 * Narrow down semantics of what was formerly the 'port_driver' field
   to refer to clocks only.

 * On 'startup' of BEs, separate the clock and data aspects of the port
   setup.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 63 ++++++++++++++++---------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index ebe116f32661..feaf60a4912f 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -133,8 +133,8 @@ struct mca_cluster {
 	struct clk *clk_parent;
 	struct dma_chan *dma_chans[SNDRV_PCM_STREAM_LAST + 1];
 
-	bool port_started[SNDRV_PCM_STREAM_LAST + 1];
-	int port_driver; /* The cluster driving this cluster's port */
+	bool port_clk_started[SNDRV_PCM_STREAM_LAST + 1];
+	int port_clk_driver; /* The cluster driving this cluster's port */
 
 	bool clocks_in_use[SNDRV_PCM_STREAM_LAST + 1];
 	struct device_link *pd_link;
@@ -157,7 +157,7 @@ struct mca_data {
 	struct reset_control *rstc;
 	struct device_link *pd_link;
 
-	/* Mutex for accessing port_driver of foreign clusters */
+	/* Mutex for accessing port_clk_driver of foreign clusters */
 	struct mutex port_mutex;
 
 	int nclusters;
@@ -311,7 +311,7 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
-		if (be_cl->port_driver != cl->no)
+		if (be_cl->port_clk_driver != cl->no)
 			continue;
 
 		for_each_pcm_streams(stream) {
@@ -331,10 +331,10 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	struct mca_cluster *fe_cl;
 	int ret;
 
-	if (cl->port_driver < 0)
+	if (cl->port_clk_driver < 0)
 		return -EINVAL;
 
-	fe_cl = &mca->clusters[cl->port_driver];
+	fe_cl = &mca->clusters[cl->port_clk_driver];
 
 	/*
 	 * Typically the CODECs we are paired with will require clocks
@@ -708,12 +708,15 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.trigger = mca_fe_trigger,
 };
 
-static bool mca_be_started(struct mca_cluster *cl)
+/*
+ * Is there a FE attached which will be feeding this port's clocks?
+ */
+static bool mca_be_clk_started(struct mca_cluster *cl)
 {
 	int stream;
 
 	for_each_pcm_streams(stream)
-		if (cl->port_started[stream])
+		if (cl->port_clk_started[stream])
 			return true;
 	return false;
 }
@@ -744,28 +747,38 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
-	if (mca_be_started(cl)) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
+			       cl->base + REG_PORT_DATA_SEL);
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA,
+			   PORT_ENABLES_TX_DATA);
+	}
+
+	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
 		 * Make sure there isn't a conflict with another cluster
-		 * driving the port.
+		 * driving the port clocks.
 		 */
-		if (cl->port_driver != fe_cl->no)
+		if (cl->port_clk_driver != fe_cl->no)
 			return -EINVAL;
 
-		cl->port_started[substream->stream] = true;
+		cl->port_clk_started[substream->stream] = true;
 		return 0;
 	}
 
-	writel_relaxed(PORT_ENABLES_CLOCKS | PORT_ENABLES_TX_DATA,
-		       cl->base + REG_PORT_ENABLES);
 	writel_relaxed(FIELD_PREP(PORT_CLOCK_SEL, fe_cl->no + 1),
 		       cl->base + REG_PORT_CLOCK_SEL);
+
 	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
 		       cl->base + REG_PORT_DATA_SEL);
+
+	mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_CLOCKS,
+		   PORT_ENABLES_CLOCKS);
+
 	scoped_guard(mutex, &mca->port_mutex)
-		cl->port_driver = fe_cl->no;
-	cl->port_started[substream->stream] = true;
+		cl->port_clk_driver = fe_cl->no;
+	cl->port_clk_started[substream->stream] = true;
 
 	return 0;
 }
@@ -776,17 +789,21 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	struct mca_data *mca = cl->host;
 
-	cl->port_started[substream->stream] = false;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA, 0);
+		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+	}
 
-	if (!mca_be_started(cl)) {
+	cl->port_clk_started[substream->stream] = false;
+	if (!mca_be_clk_started(cl)) {
 		/*
 		 * Were we the last direction to shutdown?
-		 * Turn off the lights.
+		 * Turn off the lights (clocks).
 		 */
-		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
-		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_CLOCKS, 0);
+		writel_relaxed(0, cl->base + REG_PORT_CLOCK_SEL);
 		scoped_guard(mutex, &mca->port_mutex)
-			cl->port_driver = -1;
+			cl->port_clk_driver = -1;
 	}
 }
 
@@ -1092,7 +1109,7 @@ static int apple_mca_probe(struct platform_device *pdev)
 		cl->host = mca;
 		cl->no = i;
 		cl->base = base + CLUSTER_STRIDE * i;
-		cl->port_driver = -1;
+		cl->port_clk_driver = -1;
 		cl->clk_parent = of_clk_get(pdev->dev.of_node, i);
 		if (IS_ERR(cl->clk_parent)) {
 			dev_err(&pdev->dev, "unable to obtain clock %d: %ld\n",

-- 
2.54.0

