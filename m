Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E2C3803FF
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054078; cv=none; b=BiGKc3FTMZzA0SxYay/wqObfzPoJPnT4va1z8hdLFwaKv0gq+DKhSL1lgkvPdiPN5snWL2RE2tGf81uzJd6I4zfCDEUXyyAaVJXsunAPCgZMAuvlMd+N2JopLVPyiSwsaB1lt6rbozK1R6+mbyqHEq5UOpq/lL9Mmu/mIqK/wyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054078; c=relaxed/simple;
	bh=bZsxtFUKVkrouGucn5eV4t3DMurRpfWUeca7gWfPleg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ILF0MXsfVT0EUKWByrJbR6DszXxFinJa80mGnL1mcUu9FXqkRARVyneO0cYrtbfvuKk/c7EtRQjpqR6cpGlpdYISUPzNvRcSPHnc1LQD55y46kADWOcRPZSsBkBiZy7mgnN5F05MpyFgiIH1+SnVKnqjf2SJevNFoEtEpUOYBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=tYUSACgo; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="tYUSACgo"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d18f80b5c2so4058286a34.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770054075; x=1770658875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8hbofn9BxxsYVhBolr0rYFiwuYMaB/sew2pKb65Ces=;
        b=tYUSACgoddeO9rXieo7uG9ShLytoH2WyLABk/l/tPJWdwU1xRRepj/JbZyemgwR4ei
         Jptp4d7TowLsorrTzFNZaYYEf7/xOfFDbXooJCWOF8U+AZ7adoKPxYMrDmOPORunnD+/
         Jd1v4KgGPdJ7/7gqIJtEJXVfufrAFdSvp2k9V0angdnsIWAELhzUAG93bQfHGKdq1L3H
         pmFSePmg8n1W3TbMixRjJGXEWeyuxGwLyaBePpeLsM3TEXlOKfGVfq85IAvc6f3wjaBD
         RxAfNMPOyCqdHPKBCrsreMYyMTmVzskuANE1F1XY9O+dxr71asOY3uRMbjw15OnwKC8v
         G0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054075; x=1770658875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8hbofn9BxxsYVhBolr0rYFiwuYMaB/sew2pKb65Ces=;
        b=nA/vt/Ux9letG5PZTqQjVy7MJJJvLGA7ZuTfdFcYyoRbidok8Nhq+G+auuf4Dv+nUI
         tkrY5vHE7am3JsCDWIyd1EmpNsT0y8aq04v1C9TeOpJ98Gw31bakeiBLVMc6cdspsPyQ
         Tu9dckMRJ9NKFfJgiKiDGsIryx7Q7AUq/S/TRivo7jTYR25gSj+O6n7ryT9epmDCt8lC
         zZMMzM0piExrJcq5mATqkr/ZXb5PyzKfGgxwTb4+NdXiE/93Lc2g4WRH8PP+pbEP9MrG
         iLdMdGbUKTrjyKH6PQQPdICQyXfmjUtrIaX9cP+nudQYlyvKQKJUQC5DkLWUktuJYMRM
         YvvA==
X-Forwarded-Encrypted: i=1; AJvYcCU0NggIooHIMqE2QPWEFGpqujupb1zIOt+8Y7OklLz/J8AlXN1PB7SxrSys0rw3ptxARRWWtC4+DtTWfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOi6uRfIXfXvqe4B7lzvUQJI1suOFGwLB9qS3Rx79Iys+n6f8m
	S3bi9os//MqwcClDE8HRAmbMM7m6kZEJZ5f10JrAud/e72KbYCqHooZwI3ne1GEFsNY=
X-Gm-Gg: AZuq6aKnZ9ez0sSK43STAwOAQJwh3H8nbJhwDatcmAmUUDtq87yAKh/18H7CclATlGB
	w4fZNsfwudd7qMTTpe7EmgbE1KuujxmzuQ8QYT4ijuuvMMmlLLJe2jRBPjSLYez25zUV0t7VEIm
	3TcM7o/srtzQpmU6m4ysD1WCHsKcyuZs1WxWZ4iXgxBsLU2T9ltBSh8k05OrAfS97LGIJ3UwVxz
	vfz1bvWM06ZKKK2X5CJDTpavXBAyhjUFK8Uo5mbT7ABqYiK7X4FEevPtEQ3YpbWkcLgc8qyopI0
	rphNgVU42PEDEMyFI5UCcwmzPbk1itI1w///CA7sL1mf0WuStnM2rQQc30Ds6HL3TEtp2vojwQP
	SpOJ4udD7lMYsoVFlMPwQP/lYMkHzECgMWw+DyjZAqRjLnGqGgzdQJx6Bx4udDNgbly4Xu4cXwg
	FPEHY+J+eWZPEbw49IBdS7xWJ8EokolXPjlBd/U9mUCHe6ChKMDT2qBwfdmT0A/6gnjQLm7leR5
	V/w7oWMpxyxXpOdjKziG9geaOTcGI0=
X-Received: by 2002:a9d:7549:0:b0:7d2:eb51:ca21 with SMTP id 46e09a7af769-7d2eb51d9ddmr3079904a34.23.1770054074769;
        Mon, 02 Feb 2026 09:41:14 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c7ffcc7sm10936421a34.23.2026.02.02.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:41:14 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Date: Mon,  2 Feb 2026 17:41:12 +0000
Message-Id: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_xcvr_activate_ctl() has 
lockdep_assert_held(&card->snd_card->controls_rwsem),
but fsl_xcvr_mode_put() calls it without acquiring this lock.

Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().

Add the missing down_read()/up_read() calls around fsl_xcvr_activate_ctl()
in fsl_xcvr_mode_put() to fix the lockdep assertion and prevent potential
race conditions when multiple userspace threads access the control.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..0b9dd64b9a82 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,10 +223,13 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
+	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
+	up_read(&card->snd_card->controls_rwsem);
+
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.34.1

