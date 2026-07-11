Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08122E3E9
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732316; cv=none; b=CtMgEQyRlS6ilpXgf/vILiKsB+bKrgJm5fs39SEw6Ce6qOkE7a4slo50tXJv1RbOmVqJVjH9VzqgTJf4sTZGzv8AcIN4gaslo1nLbUNodFZ5wWx7KGrQM762u/ZdfdZvd8E4XEvDyRr7F+ZV7bSduN3rov3JxgkYqR6EE+xbLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732316; c=relaxed/simple;
	bh=fzB4hBsyB/ZNFCUZEx9jbpCf/t78o9fj5k3ty/VCCds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssIX3hYYe7o0DpoMNTJ/TGhTt1sdJIFIsPcx+to8lM7wjBJu/gIwq5jHpFllo8+8PKDoh4XUsrnQeuE0aU2DUN6dEfUkcVEFDZp6bGyr8j+Nzl2NqbQ9JCTQB84ab4Kq94qCY4Q/keoh49ARmghv/uhsQy1v+jgzMcBvP18H0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pfkl5Prn; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pfkl5Prn"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486672f03cso1359521b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732314; x=1784337114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OmZuNm0i6GJNLZMl4qH6fj6FYGbdFW+PYBbGIIysyE=;
        b=Pfkl5PrnO+3shUqyYUm3nBvqRK7DSlJk84Z6+sJ4MnGaojRf83fkFZIWINfhJM3XJx
         UOrc1B+Hjk8+XoZd8gf6TGXsXv1R/8faNZbjOt1+Imo1IdodTpySHwN79vU3m8uJTQV+
         NVK082/8SG9p9N42P/ZxrCH0+AMetl40tEAj6MwMDw21JTI6ArPhH33YJwzaRBbe7Zba
         xZuHH2rSMSJF9L5zGd088mqiPZfuXAyzgQlL07GrBova4V/OFUk+bVDjrNqhY4LcAeX4
         hFab3Jmb0BPJXhfnFe20DFVMrc3ZFem2CkVxwjYYrLXG+c8XATDkJ0kOmI1XmibumbrK
         XlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732314; x=1784337114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OmZuNm0i6GJNLZMl4qH6fj6FYGbdFW+PYBbGIIysyE=;
        b=atOTpS+vwR28Da5djTOWTdswgzDZUqRwXPikE5z1qkjJ+NTQrxmVoADtnrDQq/4d9k
         nOV3XurzXcyZSpyqXDq0c6Fseo6E04G3uREbOrwjYn4RYLeJz/awWT7hbeENFzAoMwyk
         qi3LIrcUEF51D1dA6c/DGX8ol9JIp5nodQYXIFTafIA0hGsKCuc4IrdhF7UfumGJcH5J
         4nmhAIv24+KqGq4d13d514mq6O84CnEP5LnTlvFW0JK4659x6IXAoD/2UslkF+0Pcs7U
         /YWzrKxA9dgfNVj0UDNCD3rwnumMuBZO/XqQAmJpZUSOt8KjtioZiyORy/qIhw9IFhmB
         rwAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6gr80t5wLryy45cChSRh/p6hzMvto5j+vAZmUy+r6LchnBrAGnWE6ZVQc1Hpj+6aNB294AQ+vd5IlOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaN0UcyYMFIoC3/1oINO3/WT885lPCgqXidNM4GBSQG51AOad2
	fM+mHUP4hx4s40/tMGyaKXBKJMV9Ooaborb+WNkrOpsFYNWm58/IhPavaSNQrw==
X-Gm-Gg: AfdE7cl0SzE8Rgv7uaPTTFrfiQGZSVqv3/ldTV5Hx2PDNn1f6+37ijmEKiwEYN/fqev
	vkSbULds8jIWpb3jXgOFGmj4xIDn0/uLyRhuKl+qkg5o70ppZhpFYZrV14Nb/0/a7fURnJ95UJI
	dDeNQV2j9rEO8EKCpI978loFSrRrWX40qso7ve6JUyMyZhP5Icrf9yDzM9ouSY1qri7bnawQ1gA
	pTvDq/qaua0Gk+MZQb75NFs+D6oNtnnsQloh0EqLtXxm1bNa5jadeVf3FBGx66DG2TLBh2t5W/C
	83tWdXY7dADIKpxpIXsMsEaa6j1N5lryGd4JRlAR34AtoYm6sr/uWItEIusp7ulILpgPc1tGY+A
	8S1REF/wiJ5RKNKc/0FmplqjNqeVKlAZ3yF+HwY2ampAxjEXqqJSjNPWDdahe6t308znJMDulel
	5jK/GAoySRN33rI7qA7GXTEfMs+ELhWhPt/5sAprJHXSa5UKSFDm1pWT0ApHHdI6VotDQWvgH6/
	4VhBSjfJLgYU7SBSigiVFgpLj/cvXffXg/lcC6ZV3ZQxnZkIvgx7/3GWtrVUtIQmA==
X-Received: by 2002:a05:6a00:e18:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-8488961a7b7mr1123594b3a.27.1783732313978;
        Fri, 10 Jul 2026 18:11:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:20 +1000
Subject: [PATCH v4 2/7] ASoC: apple: mca: Separate data & clock port setup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-2-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=bWPKqHbY/xPPHWUKnzHa8zHFmKVCCvsO/sA6ZKPo+UY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7x2JM2RdL71/at2cra3QQJribum0+LwaQ5L1tya0
 2bhfryxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNWzVjH8Uz6sXeoSetB7ncb3N++n/rwrndfmfrniQeS6j/3V/+dJtjIyLNn+Yuv
 yao+zux5ZdU6R/dF/b+HdnH0Hn9XYqml+9UnUYwEA
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
 sound/soc/apple/mca.c | 67 ++++++++++++++++---------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index ebe116f32661..55cdb4e0f0b4 100644
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
@@ -360,7 +360,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	struct mca_data *mca = cl->host;
 	struct mca_cluster *fe_cl;
 
-	if (cl->port_driver < 0)
+	if (cl->port_clk_driver < 0)
 		return -EINVAL;
 
 	/*
@@ -368,7 +368,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	 * belong to the same PCM, accesses should have been
 	 * synchronized at ASoC level.
 	 */
-	fe_cl = &mca->clusters[cl->port_driver];
+	fe_cl = &mca->clusters[cl->port_clk_driver];
 	if (!mca_fe_clocks_in_use(fe_cl))
 		return 0; /* Nothing to do */
 
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

