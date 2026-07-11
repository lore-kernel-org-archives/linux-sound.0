Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FD23B61B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732328; cv=none; b=obKtJPXjPJiYvISvQFEP30WClHE3ywqWqjjtTSsCAxu75hMRJC/4hJPbID6yWyYL1ab0GVwZr/RyUp+6mePen4IxNB27xuX23oxO94O8i9KA7Qe7uQsQqex0dnlMv+D8OgZ0jVqufZO2/ap5ehwtZZkLrIBd0UHUKOkRDzMbufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732328; c=relaxed/simple;
	bh=svz2FgPyjN32jteRJSJZimrDV+MMYVIwx01Yxmk+cmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0oWzskWClfmB1qDIQuvSAdqvXCuDVd9GaQWV0LJ1ucajgaO7hl9H0erY2jejsX4DTgXgR/wgWJiaU6QYxgGSCU1tekVvytYgHjTfxz30YBT53KP19u7lIWoDqRFKFFgkYqjgFGZZyKWGkHdTHOAsuhHPbNubY9iNl3FGL5p01U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rswzA7Gs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rswzA7Gs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485fad302bso1522564b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732327; x=1784337127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c5wuyLR3HS7R6zL7H7EF7xHtYEbjQ3kyBPp9V64GBc=;
        b=rswzA7GslFlLb5BpVz99nE0eOPvFIhXeXeKGhEQ6ZUC6QmVZGHPZ3Bld0eOed/DbxU
         rT+42231JVcFwZMbPkcd4J+unNgJLfo4VCECWiV9jwdCUn3llGOawdKK/kYrLPioDyDZ
         EbIwF3LtPbJOjWae4E1i3fJOK96TGmyxVOLrIcxsRsB02C5lSHUQhncwddCfG/lHLp9l
         1oDYaUg7rT6qin9jSSZpSejoM9nmWDh9WwxM1fm3wxOv4nP1lyWqfgI+3neVKzvwIVt5
         oANoHw2VblCo6iFTZp8Hhl+ej/qtm3dRVzwGbylMxC6snJbdJpyJ4hyETjxi0+g0l6U2
         lN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732327; x=1784337127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c5wuyLR3HS7R6zL7H7EF7xHtYEbjQ3kyBPp9V64GBc=;
        b=dpQVZGHhNPNOZlKjcEbslKiv5RFZ16tL1V2y2bwMZcuJ83z+mUxTmvaPW2RyPLcXp2
         dahjSrizOB2BqPPUHRlB1ik78amGsQh4DMvcyxQ0YlCCbPRzwOc2vcKr2hqXhVFJRDPe
         UKGRS1lZ6Rty3biAVA+n9AQ3+8R6oow9DnPJjztVPv1mvCkTBEY8zWD7JtLqM1f1h0RL
         b9RKueKRSK0KWZjfnUzVz5o2hAYWG2j/VhzvgmyijbUUxg+IcpMJ2vtV9yelOBBTFvG3
         FtuNtLZOvCMoztoZSlbAI514ZNzJud03vZfEYlppoSvl1vrYLJmIUQcJ75Uvqukc44jr
         a4pw==
X-Forwarded-Encrypted: i=1; AHgh+Ro26FZlOlAkWYvB71eaV8Mkls1WcThlxlPkY2cuFmC41XxB1evJ5RQH89sDW+nehcv/jjGXuLhEN/2YKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWuOOjrXOylxft7Hv8laOEnc1WcJlNH4zcA0fYjdcKlSMzx5aB
	eoDdPD98hC7wtZe89lQC5RoJKlq59V2PRosRRxIgiQGXOG5bUsEBB/+BATouAQ==
X-Gm-Gg: AfdE7ck8IbNmnUx5hdm2zS41O/ZpDol7YvHVHWaOqY/wQd3kmhkc+GRn/9vga5cZFRV
	W9jmlJPooAFrLY+yKXlUFNabp9AaHhyiKtqd5EnOFpYP/x8jlkEKHKP7PIUdkWJWzKfEtIVBmRJ
	taS8v0I8QrMTz3gPlDltX+iZHnMPxb3xGanX81x/Eulln2ZsgNVrukTwPbH8Yp9Yei8m99iRRrd
	es3BO6bgiLONni1Goq2fj7M8Er6I1yBrq8VLFbimAoZ5PHjSJam39KJPsEEmTJvNlx5gP20k6Am
	ppqAhjJ+UjHy+80EORJLuLnMdAZ2PZXzsyKgh7sQlNWrUwhlZaWT4ZqWzsGI/0eo4puYNYcJ8+R
	LuSRjAL2v/p2lnImos3AZ3G0aJvQL/B6Oza53tfsvotCv1sZwEOhD3x0b2I+7IK40qVfN2JVH6/
	xmW0+99wOaQMvenNASfcQkv2oIVJvxWNLagnPDXdOXCE7eIwixqVy6/T8PQpUI7peO6db+IRiNx
	jsjbzUTpTQlv0+R9oa+S1rnkIJlWHLqtJCaHpiAFtgj+3RvxL8bzfEbOLBo5k2/IwEYTj5TsUyL
X-Received: by 2002:a05:6a00:2d9e:b0:848:2f77:e2e2 with SMTP id d2e1a72fcca58-848897ac31amr1087930b3a.75.1783732326973;
        Fri, 10 Jul 2026 18:12:06 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:23 +1000
Subject: [PATCH v4 5/7] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-5-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3502;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sZ/i3SB9vpC4tUFYF7qGww/Qs4mlMyHC7q5JOvKZBTk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7ylTj08qvFEIWRB/pfKVTzy8pos6gbnF+U1TUx9x
 fnajrm4YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX1DxkZZm1dpLXW72lKtdPTaLO5B1Zof6vatr9f1XFzd5Kbip64OMNv1qMRzgV
 21ouWnr6vN+Pzxbrlx3km8DizsOeqW0cr+ZcwAQA=
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
index 92c9f8df50d6..d8973e5611dd 100644
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
+		int port = ffs(mca_fe_get_portmask(substream));
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -466,7 +463,7 @@ static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 
 static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 				unsigned int mask, int slots, int nchans,
-				int slot_width, bool is_tx, int port)
+				int slot_width, bool is_tx, int portmask)
 {
 	__iomem void *serdes_base = cl->base + serdes_unit;
 	u32 serdes_conf, serdes_conf_mask;
@@ -525,7 +522,7 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 			       serdes_base + REG_RX_SERDES_SLOTMASK);
 		writel_relaxed(~((u32)mca_crop_mask(mask, nchans)),
 			       serdes_base + REG_RX_SERDES_SLOTMASK + 0x4);
-		writel_relaxed(1 << port,
+		writel_relaxed(portmask,
 			       serdes_base + REG_RX_SERDES_PORT);
 	}
 
@@ -662,7 +659,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
 	u32 regval, pad;
-	int ret, port, nchans_ceiled;
+	int ret, portmask, nchans_ceiled;
 
 	if (!cl->tdm_slot_width) {
 		/*
@@ -711,13 +708,13 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
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
2.55.0

