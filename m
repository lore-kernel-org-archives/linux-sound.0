Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAE3ED3CA
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179195; cv=none; b=H7yab/n8R5hAjWOhWbWsANaLiwoeyk+CzF/GkSvCU8gRlijm2gDOikgubE7UDf0iWM5odCcI1SYGR3OK2Gz/nLwa2f+i45OJbpB1jb/GNFz+xLLaaQEr73EYWpVrUjn4S+4ZGTkjXSDE4NzathmJ1ASWbQm69rMJYCO+LNLr+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179195; c=relaxed/simple;
	bh=f93t3KPA+wyLo9wjgzE1RphXD2VIPXSpohzjt6hMGS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zhp2l5J1j4U0078c7RF3tjaHN26/RoAQrqte8QTCDhtD+mTCjYnc+0bydbzk47tTxLiyZa8pcFT7smSUYKKwCIkgmYXk0yUVhPhnthWMC5gDxCD8W0uFfiKdaQsDrux55xZXARkcMDSA4hYU2de86XyNfjCX4cIOkm561pUPFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cydqoThf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cydqoThf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so4039211a91.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179194; x=1781783994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcmaDQ8+KfB4e6m7++JXwBYQ7R8p81AkALQ3xv9FnR0=;
        b=cydqoThfv0ixktaorKzCVQTz61IBhHNpRtLdauY5EJ+pmWwbJZpza53nwp770f2CEe
         fXEIYUVh+dLhqH0ShGwBGu1KFBKkfZepCWv4UwYVuSGtg89FyKVmGkSeEDbCsr+f+dk+
         gFVmS72Gjhp3fjQBovhc9RsFK0BpsqZwPHWVjPMoDwVHDlD2QuhgEVX1g/6sY8WjHq+m
         sAfdL10FoFK9qRsEyGUU1uwZmG4Iysb/zXqdEha00v6rq7g3T7fMk/sz+E6mb7KiJVrY
         fOZrPk5GrZABCUwCzx9+DKJjs8GU5qiUl2Bj8iXugZtHwkRtexMqX/fbyxK4lfExZKuo
         cYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179194; x=1781783994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AcmaDQ8+KfB4e6m7++JXwBYQ7R8p81AkALQ3xv9FnR0=;
        b=m8w0Wflt7QHE1I1WPthMnFzgGkNSkawfeq1gC9UpRYqzgLfxv+S2p1QwnO5IdNqML1
         p7cwTNEgwbedihvjwa4dxGeKA++4lqL5bch+hut3E+FIuAr6YhMrMPy0owj/KYsebQzt
         gh8uk8qpra67tATMPbkkg5F9MGgkNp/yXTMtP5Qn7AlgNCd+13bMOqS6Gr0SOncpzalm
         14IIHgIeF3vTjUWSbm+ZBAPCxHsRQIdiPNyt3oBHUxcv2wO5Pfn8jXwyJyFddd73vg8s
         FmHCCG/Et8eXPYsj2XVZrSFAoOQyGuuLE2yqca/gaSkp/kqBPclkMZHlKS9iHKlw1NXZ
         46ew==
X-Forwarded-Encrypted: i=1; AFNElJ9BGcZPPa4J5Pk/aGADA6TdP/E42rtGCVao+v4j7aeSgRc4iOiAuf0fyuzPeyOqftCuCYOGLzoiMfm5tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXgj4GZ/lw3r9F6lOriaz/XeUZzXEkgjpRSLT6mowC4uMPbUn
	TSn43VsSrmHXe3bIC3YJj8MXxbsJLSSIkGFxVWzZ9k57Ewyl81CujaDr
X-Gm-Gg: Acq92OEs72oeGKn5MBY1RI2lnqVEcsPUIoZTkhdSnhdLm8xBK19KuUq2tt6M6eEE8BC
	s8ise2yZ2i0N4KJQ63CKw8GNQJxTHTh6+zMzMSVjkt9LyOiaJorV1hdepu0862Mz6OKh6rJNLdJ
	hlHf6tdmDV7SwDmNV61P1oBWM84ULYVLakVKq8dQmjoHrl0ij4u8yjygu/FnwsLSOf21LsS8pmx
	5YQcBulKxBhMY3SMobM7b1IHKnG/txEQuYtKFZsE1oNUusjOpLovydantMbUgOxXRqUzwI7LeU7
	kSgN44dBojsgfkrllyppBILuEz9tCZEhrQupHu7ErPwQ3wNjFV8tazbOwuZ++tVZk8hVVoI7tBd
	S51XHthdCWmQAtJ3ASIt6y8OH0THdJJyz6BR22iTUpFFmMeuy2NI9qvFF9MRyF5kgiZhodHT3L4
	vBjVjQsusyb+iAkahIN2JSLZgVAWm49fZ5UV9G2as29hWOhdX+piJQ2T9HC8D4KyAVm9ao
X-Received: by 2002:a17:90b:2d92:b0:36d:649a:39f7 with SMTP id 98e67ed59e1d1-377a8dbbcc4mr3125965a91.22.1781179193958;
        Thu, 11 Jun 2026 04:59:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/20] ASoC: Intel: avs: icl: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:50 +0700
Message-ID: <20260611115901.80438-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/icl.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index d655e727bebd..4d425846b56e 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -166,15 +166,13 @@ int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw)
 
 	snd_hdac_chip_updateb(bus, VS_LTRP, AZX_REG_VS_LTRP_GB_MASK, ICL_VS_LTRP_GB_ICCMAX);
 
-	spin_lock(&bus->reg_lock);
-	snd_hdac_stream_start(hdac_stream(host_stream));
-	spin_unlock(&bus->reg_lock);
+	scoped_guard(spinlock, &bus->reg_lock)
+		snd_hdac_stream_start(hdac_stream(host_stream));
 
 	ret = avs_hda_load_basefw(adev, fw);
 
-	spin_lock(&bus->reg_lock);
-	snd_hdac_stream_stop(hdac_stream(host_stream));
-	spin_unlock(&bus->reg_lock);
+	scoped_guard(spinlock, &bus->reg_lock)
+		snd_hdac_stream_stop(hdac_stream(host_stream));
 
 	snd_hdac_dsp_cleanup(hdac_stream(host_stream), &dmab);
 
-- 
2.43.0

