Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B22285C91
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222726; cv=none; b=kjWhCYbgGadVWbBaCiJxSQgWNB0Cj+/j+w70nEs93pzYd2yYOCp20FA3s94V7zwTMIzBIJLapeERh/Dg9nybcsn2yJ+h2v1EJFXHGBL5hXSUh3PVsGOUhrYYtiYDGUxfAUkFYjUFjyBmaGlugWcpNoavCOCgloX82EHSmZGAIy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222726; c=relaxed/simple;
	bh=gpP+0OPb65JufIYBtBuQ5iW58m7xh3zj/lE27gs4jcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWyBEds9RuJQIoFS81xS5LvssDRPqXz1n0kGoULZoJF/8X36SykixIxWRBeHjGeyMYG76Hs3vWmPXxkLn9StKeS7IEEbEYfM04YyDPSvxmpJVhTX+A1PB5wXCb/I1wH8b5uflIzXG6tU9TaHyUq8ebsSWSKuE7Od4Tg1T34BZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6/GdeJu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6/GdeJu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad4170e8eso21230555ad.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222722; x=1783827522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aach3+WVLTqKJMNp90n9nPIIb7yYxYlE5c55bwYrGsA=;
        b=l6/GdeJuqIoW+M8bo9CY9zOCPjk+qiAxEzzGtiuSJKBbb5A4OqfLYJC6y6O7Z1BBxH
         VnTq85S9GSGw/XlIRmb2hKavD0DFaeGwjlDCYgbMNztWU/swylZpCv7BN6GWrHn5k+5F
         8doj8eHjikjLR69j0PmUxg7VLXc68BufC77Ehvq/OdfMWisXVn/FxvpPg2snKXs+APV2
         rYCB5Sbr0hLFeD/ecCg9Byrt90udTDFCRXvKWy+5xCsmNpRk9ciYNd914nl6r86M3ZPI
         S1+bu2GFsB7LS1c/MGlOCWjsSo+yx+6GK0Pn5CxvaTuINpPZeHG6A/K8a0eMWuo5CnbW
         RppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222722; x=1783827522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aach3+WVLTqKJMNp90n9nPIIb7yYxYlE5c55bwYrGsA=;
        b=ijCnCSvX28YlsfxG6Wa8E0jVH36n+Fy7evy/uK+1Pkc+FfxZJSGD/sv9q3t9oVt1cc
         E8nLeoYZOAKKYiLV+QXXdige185bI5O+h4/7wrvH+SPivI9QwmCMzTXbutcv3etnT32D
         Z0Ax/yKxpPqHjqlmvJaBY7o21QkHy6fIa/IYk7Ogt9rByixilwGn/z33OkaJirlkqeRU
         NVLa0W0cryXxusVxzO2hCIHyJYo/9GMbJBhgrzwqaLEYROvgw4jufZIrxc/t0ZYz3+F7
         M8flszuiFPT0LoRmCe3FvMIlAst0tC3J9tWKsCaM14LGVDXcGH6Vo2Ad6qA5d/thfHs4
         iQig==
X-Forwarded-Encrypted: i=1; AHgh+RrAsiBKJkYTpm4L7acGpE6t7LtSiel7R4wswZf9f5xfkxVA4/+95z0PvemVB5wTBI/bCnm6lJWiEX3u+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgTKR2eTz1R2wjOoS3+gqL3z4g5vCWJJC7DERMLeGlrBoy28I
	su5fYmR4nGnr+vXrOcpzmsOK8Log46zI3jHlQAmQD9oz9H7NxXHaJQog
X-Gm-Gg: AfdE7clwFzQdne2Vpzfa/HvqgDn17YDcGAISP4HKdnM+wnhwLyLclgYZLNUpPLOdoLQ
	wdRCii6IUVKbQIBj4N7LIUm4AfpxqtFKlr+BmfaZumeTImnJzVevanUkgk8NsPZ2Ganp3+QCSoj
	v0ZGKJsuzxkv2QDURY41lkV6Ku0NJG4q6RSC+hlxbkaNTVvxG11w1YggbvwaNCt30y4e8NEUmNs
	eS4BuDkZYDCTNHAM/NTXX2yjdY/UYL4govaoy8AV7qkNlP6rycDS3SG22xGuszk3LZ2u9PnkrWJ
	voUKbjdydPxnty6wSzPrgNNQ2g/mGQEa6lOBGaFItCvXEbY/7S8I90hWkeGqydtSMV3XyraySNy
	dFTV3YJ8Cur/A5v4KGxgsfIQQKy5kMroOczz17I+obyRB2TsAwHyYkQsZXo44yMbbjqZP1ycU/+
	MziRHURK79GpH0nieeY0MS9pEiJBBB62juqQ16gTDqgRUQaUJh8GWbM/IMegcsaIEyKmVVt5qXy
	xVGV678a31rvgELRDnON9/i201cO1gBqwcjipiQNyDj2ragReGA+lkqnbGW8owz
X-Received: by 2002:a17:902:cf03:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cc85a74f00mr10023415ad.32.1783222721624;
        Sat, 04 Jul 2026 20:38:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:51 +1000
Subject: [PATCH v3 2/7] ASoC: apple: mca: Separate data & clock port setup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-apple-audio-redux-v3-2-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5618;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=FIXHrT0P9Yru6Rq6uRiDH66R8LjOM4VlY3Dltq8mEXE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7e0f5oubyd0wlL/s3Dhwl6pvtANFU94irYl9rY5N
 seJ7NbsmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATHWlAcN/F5ZTr9b+aHQ84+pnGanFodTA5f1+Bt9x/gnamuJmacWSjAwXhPnTxOX
 kjp4r/i7ie/fD1iVzVB9KvHZzq3zOtDFj53ZWAA==
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
2.55.0

