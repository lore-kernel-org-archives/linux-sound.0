Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02D32939A
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734294; cv=none; b=uajZ/Ea57j4wj/31+B+ZwFDEv2G/1umpbcKzwjLC6VN1+sCs7a0m3mzISAY1+hDFFLaEx1acze1FC7uU7W9Zox6umdg1FaNQBJo1wU5BqNAEt5fOY0weaakjHbY1BszZPRboe7xP8k9ZCnwkiawDHmtHEZXiw5YF6IpKNK3SinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734294; c=relaxed/simple;
	bh=oLSi/r/QsoPbrfShTfx4Ji4Iiw+HqD1AABhGoJTxIC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aaoFveufZEHT4dJTKVyV4Dq8yez2fxQpzV5BLRx9Nj91h+9V4/nMwKq+qWiOeg8a0I0/OcNI7rNOaBuAD2YmEaX8LWJ1im4uYliI1sn8sWbRdxrq1hKN7CTrUY/9Q3aHTey8s3cq2S0Z2BWaeMN6cEwqPUjInnSm/TRYSWd5L30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=l75fvNXK; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="l75fvNXK"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb20bcff5aso56388385a.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770734292; x=1771339092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkYuyRwsnTcRNpSowH2WXxBKWT/+EdlbZCcoZtFynkQ=;
        b=l75fvNXKOKzBVL6wF3APn7ZRTtryn5NRUYZw3QV2373ffHmGZWdquy1qdQ7s0Oc3rP
         Tv9+7bYyIyu2HvEAiOhP9/niLFce0J0U07z6CeS0FwpPL45B2QTe8euPll7E/47gnzdb
         pvYhT+jRLR3fjaz9sBjQ2C2cHo6e9BEKSncGfCPfvfv+XfOp77pZ9GQva7H26J5i6cKT
         jA0OvbKxskN0IVw2UT5fSjzYTKOKi2My/w4hkXrLP7OYR9KrHAWot+S+qjD2EyrfGHrV
         /1Y4p6qS/EyCubNcKc2F2AMQBR8lhrkUVOTHCPxZ/UFbjMbsD7XCac8GtlO5Z5sdoM0s
         iDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734292; x=1771339092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkYuyRwsnTcRNpSowH2WXxBKWT/+EdlbZCcoZtFynkQ=;
        b=Uhi2stTMEk15dD1R7BZwrWMlUwqwdJMY1xdOqRDLDAaJKfv3PypypvdE6pfNph/BnY
         PZZPt3wP0mb1tn/s6ixEEzutPdpvjeHuAecUQtdz171BM5a6Cvgwj8GWsUSG3pErHR9i
         FurbZHTZ06ysK9BeYgRkntgpOpp/8jDmXrOODqWd5/FNoa9B81uTqPR5m6+wphyUtkDR
         tTbYDxTwKkw5NTdYs+JuHYx9YKrafAzETaVI/ETqpHpI1inwgsS6MY9VA9KpmEus7ypu
         xiRz1Bt5xmJhX3EiWd+ZKGK6p+895BB5iWTuH+Xa94F45cVgWwuNRJigQ5Qa9LVJeBMM
         BiJw==
X-Forwarded-Encrypted: i=1; AJvYcCX6JvLCnrcciB9kLAVfIiZ4020o/IapcgT0aGxmrODaautvWlPQxxLJtP4VKFGBj0Bg+83OaeVAyuunjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwKoaUpJubUqPwkCEgRntwH+udJ/bwucuVrwYZEl/mRR35e6H
	BbkDhoTbttB0SOLBESR0w4nfIb9c+c3s3/N4r/kybmKT0WVsfnLOCksNJWyltMHvDJw=
X-Gm-Gg: AZuq6aKkDclt8oT7GF/8rBVFlk8A4PvbFOSBNYNY1rFzv/YEryBuNRB0flcoBmX+tgV
	GOm0kybfuqVTByjIR5zKfLnRHA4Qgkaea+GGhjhUroto/Q+j/fQqnLqECzNdx/m4Ph89dJtIEjz
	GUcetsuhIKj3ORA5khODqD6VUwhz7D9xi9jRnjgUa8N3Vbqy6Kd51mqPEH3qpPWnF6ozjE9W9Gf
	w6Nd5Fth/tL5bDAYkt7rgTKxyZoeQAWG4r8r0W9tHjo/AP+qLxBrmVPX2GRx6byAxpONKeDKE2w
	DlJeJPqYiCoGLZOT15CwW6lNjVc8P5ks8zFotPyYygImhH2Zxm0/NoH+pFsqQa94nOLQaMxNNX0
	HnR95wmEMeaUTRsIiB7085WOUiqELPBT3haAVBiK3PeTz+mubNex+gahxT+DrDrsNxqkVNd0imX
	uxZr2l1pq/QV36QsIZquwcNiyxSmsUfybGueTag0C7GLW8jfI3qioox6UE6e/xZ00670W3bNY5P
	Vt8mtGzWU9+DjonzLqtrpfXI5xliiqlJSZh2WI4Gh8=
X-Received: by 2002:a05:620a:7087:b0:8cb:1d86:aa4f with SMTP id af79cd13be357-8cb1f72ee0dmr272527185a.78.1770734292144;
        Tue, 10 Feb 2026 06:38:12 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a1575asm1132760985a.32.2026.02.10.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:38:11 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Mark Brown <broonie@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] Revert "ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()"
Date: Tue, 10 Feb 2026 14:38:09 +0000
Message-Id: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f514248727606b9087bc38a284ff686e0093abf1.

The original patch attempted to acquire the card->controls_rwsem lock in
fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
core function snd_ctl_elem_write(), which already holds the write lock on
controls_rwsem for the whole put operation. So there is no need to simply
hold the lock for fsl_xcvr_activate_ctl() again.

Acquiring the read lock while holding the write lock in the same thread
results in a deadlock and a hung task, as reported by Alexander Stein.

Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/linux-sound/5056506.GXAFRqVoOG@steina-w/
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/fsl_xcvr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 0b9dd64b9a82..a268fb81a2f8 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,13 +223,10 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
-	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
-	up_read(&card->snd_card->controls_rwsem);
-	
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.34.1

