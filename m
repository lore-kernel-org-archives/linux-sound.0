Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE668358363
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646999; cv=none; b=st2qg85nHicmg1ouidS295oBQ0hkKLXcowiChOrF4Fvy3UywpIzOpLZODhLXArVeN3DsJlG6CS61mYglWyH9XYYct/GG551+IKV5M0mB1xnlBnOA9+WNh0xets/XpvPUtRUIT1d3YfXRTJLvPUTQPZAw0oi7ge2FM3X1B1re3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646999; c=relaxed/simple;
	bh=6yPSM/VgNRAH4/WwLBy9Yvbp5fRe3sCf6xfugsqpADw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DR56y40N/bvJ6F4kLrj9hPjYwQeRNuYE/YIUTXtuFkrV6dYseXNB6EoTdnODoNeR1Tvp/qRvX8WGsDSQbYN8Sw+M+iJKsDHjcx/BMj/yKFOI3I56JCTX0sm8LHO/EUDCFkfVnnsvBYJpyvD0iUfncfU8Dp3ehCyPOJSb5EcepV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLTwCTVb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLTwCTVb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so4690024eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646997; x=1783251797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WntUa2KSx3EiVOvdFHO7cj3UxkGlKr5CoGbYmRg9LgQ=;
        b=qLTwCTVbQeM9XolxRdcFY4hXD4BKP0+nwAdI6RDpByqFzymUDVz/ej4RcCnvzRRHZ7
         93RKbTwzpEYsow73K3VxEgTO2qGHeiMbYNYKUipe+ld6NYV3VuFMfF/MCCYCc2vZY4kx
         O0Q1rwDev3KBHiP7r3+wYLPqzFYajszpiLkV6MQ/HAnoq4jnH9UF1lTPc7nY6Rq8KYch
         QF0g8rW5JtGVNxiRbl8jBRXIuMc5rJPaYtENiNtxAKkUtJGFuz449GalFJowAPJ+Dd4l
         LoUqaPYl1zQK4SRGPweSuTpOHX+PmdpWX8lg8PmHPFIi6ChivPKgeKHhFkST4XPHbHgP
         sUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646997; x=1783251797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WntUa2KSx3EiVOvdFHO7cj3UxkGlKr5CoGbYmRg9LgQ=;
        b=e0/R1qSniednw3fWOS9WnFeky936T4uXyo7Zo21y7N9pos4FDjRneibF8fkqY9DDYk
         0nZP/vqWBR7e9Taca2wCEaxBrRsY95BbWQGBY/GbHUz6xquxICcy/vfz5ZTBEh4tyBit
         5/bOFKFVss0v1mw83S8G2LI6BhWR//s+KgW1lNWoKgG+A/lTHMAGt7cI26apftMsnZaQ
         N0XQVl5Ba4sP1fYiIHRwwDnHOyMPIr8rTXmVKYyHgUd8m2KIt9kQuIwkMVNn8ZNHp0Y4
         v3DQqy/w6W6Nbs3hMkjkCU+2Ac+p7iueQcc9Mb5VDwLUJpawcKPCSYKp+Si4Gael5U6q
         5/cg==
X-Forwarded-Encrypted: i=1; AHgh+RrRusrgEZdO8+xB5dkhQlRlwkmh3Sc+NeIokGAG3JBVw9k0gINAhW811UHqLZ5YgMWoewytWJoRIkhMAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFSlNMy0vxDjpbqrM0//tqmEUntxaeELMkZz5dHjOduYgNXdo
	lo0KpCCVPSj0id8S1lMRQqwI6bGRUA6/vBxQyGdg2IlxppGvhAbC3ena
X-Gm-Gg: AfdE7cnEQFOkksbLYjUxtI7ewiP2cRRw85T0CBAomapx4wSJ2JNhPnK2Xf6SohzjVuN
	hdedGzRQiLoKLL0x0CrXy6K7OaJ6DmmgnbLwgbDGg6Qpo6FuLKXDz/tkb5e3I8/wlLxd8vwbILo
	wbtT96gV22gHEOKxi/Y5uYDz1EgWcUeCr6ZJe89j7wsR5RlL/VRgZEF8edGRzuA2EtdG3EdH7Jd
	thIcCDbqcCI0WhUicbsBG+AgAnB/L7Ie6o5xh9ur0DM/0k3F11zryhvfy66WW6LqmeQ6s2845+R
	OcqyGBgbnLwJB229K+GL8EEeiC5hM/2PTXrewfXf4Kvf6UFNX0mNNDxAjObXkzoN51s5plkbKKl
	3xibIp94j46QvX1t9kSwc7Fafxn1fEQfBsL1h1o8MHyiZX8hVua+KellsPp+NfWp91vafBskf0b
	gJEXBmb4jnh0Io57b3TkBJ4kf1r6ihogEJ5iuDywaFZA7yJEOg2mW1H0Mwo4vFvN7Xqgk4dT/jY
	CQ5Uw1rXUp4a/dm3wb/OTH8UJAvdcBruGx80IOKF6GcUnVQe3qOVci2NgUxv72zGUQbFSEbeUxX
X-Received: by 2002:a05:7300:7647:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-30c84d70176mr13024530eec.31.1782646996848;
        Sun, 28 Jun 2026 04:43:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:03 +1000
Subject: [PATCH v2 5/7] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-5-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=00/4fnEAaP523XAEVZpGbMLaRMSW4pkzw3Oz/tUixjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLt/nFXT8U5tTxdw9RT7evdyh+DrNl/fjH+vK1lye
 4XcRA06JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUx11mJFh/f4XcT15MpI3ZqdXWWVXdb9Jd+L8GGn93fS3+SlWdrsqhn8WoXaP1jE
 +1GjZJVbssyPpUeJ2jVDF2y998+bt0t/+Po0NAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When multiple BEs are linked to a FE, the former behavior was to source
the data line from the DIN pin of the first BE only. Change this to
ORing the DIN inputs of all linked BEs.

As long as the unused slots on each BE's line are zeroed out and the
slots on the BEs don't overlap, this will work out well.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 0c1fc8242907..5b5f2f27b152 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -261,22 +261,19 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
+static int mca_fe_get_portmask(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
+	int mask = 0;
 
-	be = NULL;
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
+		int no = mca_dai_to_cluster(snd_soc_rtd_to_cpu(dpcm->be, 0))->no;
 
-	if (!be)
-		return -EINVAL;
+		mask |= 1 << no;
+	}
 
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+	return mask;
 }
 
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
@@ -417,7 +414,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 
 	/* Turn on the cluster power domain if not already in use */
 	if (!cl->syncgen_in_use) {
-		int port = mca_fe_get_port(substream);
+		int port = ffs(mca_fe_get_portmask(substream)) - 1;
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -467,7 +464,7 @@ static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 
 static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 				unsigned int mask, int slots, int nchans,
-				int slot_width, bool is_tx, int port)
+				int slot_width, bool is_tx, int portmask)
 {
 	__iomem void *serdes_base = cl->base + serdes_unit;
 	u32 serdes_conf, serdes_conf_mask;
@@ -526,7 +523,7 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 			       serdes_base + REG_RX_SERDES_SLOTMASK);
 		writel_relaxed(~((u32)mca_crop_mask(mask, nchans)),
 			       serdes_base + REG_RX_SERDES_SLOTMASK + 0x4);
-		writel_relaxed(1 << port,
+		writel_relaxed(portmask,
 			       serdes_base + REG_RX_SERDES_PORT);
 	}
 
@@ -663,7 +660,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
 	u32 regval, pad;
-	int ret, port, nchans_ceiled;
+	int ret, portmask, nchans_ceiled;
 
 	if (!cl->tdm_slot_width) {
 		/*
@@ -712,13 +709,13 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 		tdm_mask = (1 << tdm_slots) - 1;
 	}
 
-	port = mca_fe_get_port(substream);
-	if (port < 0)
-		return port;
+	portmask = mca_fe_get_portmask(substream);
+	if (!portmask)
+		return -EINVAL;
 
 	ret = mca_configure_serdes(cl, is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF,
 				   tdm_mask, tdm_slots, params_channels(params),
-				   tdm_slot_width, is_tx, port);
+				   tdm_slot_width, is_tx, portmask);
 	if (ret)
 		return ret;
 

-- 
2.54.0

