Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611C2BE655
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222735; cv=none; b=rkn5ISvfMpgrj7brC1OLs/5JLyIlzC4H2wQ7fKAV9pWpx0g6wzpnll7sXaGln+OwneYkm0SdAKNDgly046p9HAcUY0Z99SeAUmO/GL+Kgon9w37cj98IpBA2aJ3HIJMXESrY4ekeYGaxqA8a4hodD01QqYt3h/Fc5I6asgUZJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222735; c=relaxed/simple;
	bh=svz2FgPyjN32jteRJSJZimrDV+MMYVIwx01Yxmk+cmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgQIX8r7PwOxgtOKPDdxk/Cy28etI3/RnFPfcNhMNe4pW4K7VBAXb2pH4dPT/NSAPtgyk8RN6OZA4vZYLW7AAde2fghNll5bOphgR0QNYpAO9IKgQz9o3tRIwerFhMKay9/fKQI/5qhuUW7un16GNWavKFCrn34iuaLsCpkdXXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTjy483T; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTjy483T"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so1829222b3a.1
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222733; x=1783827533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c5wuyLR3HS7R6zL7H7EF7xHtYEbjQ3kyBPp9V64GBc=;
        b=dTjy483T75vEHO9srux7o5LTRzWuAM9eJE4AZdeo+wSea0MjjDu3B2Hwzte3aguzsX
         WLptqnYqzrH78NyaDz1/AdxxCJFRHeoNzak+RZ9miQLu/p0ztTNutlU08s6kBBLx4Kdy
         Os719Ucg9tWMSLWPp92xKb4iW9gGSOEE5qdQuVjzHNTewBpmZsIxBfAsa5fiQlSYv0r2
         OidfYBCyp/VKhbR51pcTKUUySwc6zXvU+pl96ZUgXYpUwEH2XLm/HzdDZE1ZjnGuUIYx
         /lHlKCufFDy8FuUfO3EmZYsTgbYCUSYH9nY7AoT6b78dD0D9neODV2jb5PiCniSGdxju
         +Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222733; x=1783827533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/c5wuyLR3HS7R6zL7H7EF7xHtYEbjQ3kyBPp9V64GBc=;
        b=dw0h2vOtPz/w/nSUCPeizxhm91nn8R/t6SI4IkrNjVcv5h/JSNmE3jt2poU7GpbAvQ
         I3hl6bKSooElD8EoU1+d1X0Nv+NlLJW+so7CXlwUYUeR/m7p6h1YZaoaG7pzo8K/XfHp
         +Q33P8J8tYaGiuKfN+8tH/XMv/II9kwwiJho5f1jRFXFik59P1+y2+JJC54dkJB2bL6O
         JlBsnWWvx8EOoPpj+S8JHNmFeckXQJ8RuKrk+h1P6+aSMWUfGMteP6ErjrtnMn1c80LI
         yNEHuRNgJiDL7hMlqVHj+srxc0KuQBvNT7dFc2na0CZiUmy1KEkXZvP75rXMiIzBo3Gz
         eQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mbpLuaRjSQ0kUWUXltw5i0Be5BOj0NLZi4qN65TREjqJTLwRoDxeIVUoY/2nj/SCNaiuzqZFxbelexA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLBb14PeHrbxV79uxDLbnjMWxcwfUWGRlki1PmH323n0k146t
	QOUvlO2JaN7Pnuf485SDmo1rhhGgsR5TQsuVqzB9YhZb1jYsC/hFzs1h
X-Gm-Gg: AfdE7ckZX1/0qCkoBXztuLNL8CjWVCTZozqrqeTJaU44bVZ2RnzPrh5r66a2wWsPNls
	kbVmcTMC9Ino1wf9tisHeTE2sa6de1JCB6WppipEVACmBC1klvDvo2d/nxqaA/7ekpuNMpmbEN8
	uLtChPKWDpayLXyvsGvCrAwQ6j5UbBldnbRQGRMuDGFnm/WoqKHYhgtgCxsmEtUjpBZfEjVtWpk
	nlJ2LmfLmrS1NN6RSDBjy4tu2LpnXEokJqr9ZdQwK0Hh8Rh07GotwcvUT2OZEL7+Tg6gi3fhKCF
	TvKcJldeknoUYLhLv4DyAr4kAH9X0c1VqYp9pxYksmKku/HBTd7Wi4NWZi9K/GCko1uSGMpUYet
	yya6RMdyCUdXJGvCPuYNwYGccRtWsAHr0TdWCCjkhCgh1GkpzEFdpmSfudk8YYjvDs7T6l0apJQ
	EF1oufbHwNxGFJ01gspHuzy6ZnLw8wNVa9gVsXNKbQdsBY9mwo9cAnn1k4yBORG0kTGOF9/oGSb
	tajOG0V6V2qnxkG3p6Dtw4I3nAHvLwLFZokGl3vZ4d8FjFi/HH7qX8WVA5qf4g7
X-Received: by 2002:a05:6a21:1b85:b0:3bf:b1f4:747b with SMTP id adf61e73a8af0-3c03e1a27a2mr5754401637.12.1783222733112;
        Sat, 04 Jul 2026 20:38:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:54 +1000
Subject: [PATCH v3 5/7] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-apple-audio-redux-v3-5-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3502;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sZ/i3SB9vpC4tUFYF7qGww/Qs4mlMyHC7q5JOvKZBTk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7eKdN3SXDL984S9L+W1hE6UFS/tum3paLqc+4/Tg
 oAN5ScWdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ693VGhjt2txkP52jHbON5/pOlrC7YUUyOzfXS1sOvNS+G7s2w12NkOD0t9SK
 bVoL+rY1Ho75f2SyXuCpPP9l/1xbW2aZhPTtF+QE=
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

