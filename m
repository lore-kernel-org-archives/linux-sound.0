Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E034963CE
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638753; cv=none; b=DQkupT5vgK5ujxz+nCY/EPqVMhSOUxfE418sF4kkjcORnJEQmXW/xXiYhBuC1vKyGOhO8FtIW9rM+UHep/M60Lo3L/66pbgykUv2DYo2FqMKh235wXPNK+q8hVC+I6N8uqq2f7Wx3WTuYuAigFk0UCQcv/AtdtxL1UsG/RIGUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638753; c=relaxed/simple;
	bh=/YhplFr3wX+cQu+n5OeAbAsCzhnZxT1J8kXTe5t6tkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8qmE9RsBYoqMSzzhYLchmgciePLWFhJNm3ZRfLTG48Y85nn1gGZ/siB5L17bsNH+hBlj1gWujWclJXD9ZaSyxp3R7uqskaU8EGF5VM5GUPJirW0FP+MroQ9e+BKrOOfcKoGb6HsVWFdNedFgJ/DAW03bYmcfkir3Ye+fj1yWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbCLYW5T; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbCLYW5T"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2682612e87.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638748; x=1787243548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twv+XV+1+yrG3KOORHIQ174JWU1gzEjtWwKvqruL4XM=;
        b=fbCLYW5TBOvMPl6u6bZjJDoV+KLNdanRaTYzcg/oHsE9cv/s89MpeQaYhQEeuOGT3P
         k6JG/+p3SjwAc8cFj3UFdHqOGdoyaR4fRMgbGvyJqe0ZZ1dwQuEQiNlsQghuMMrLKkaW
         CFiyW5ayhO5kmcXj5lgktAZ8YtBVtsumpS877SFIgTV+pCJiZhzbzMYwYXlhYti8KioP
         XITYMjbbdK7BgpQImcnlQ4yc3qiGU50nsO76FLgoutIT0rynExSw060wWVaafMQnC3ek
         Fajw7MiVMddYvbZLlDXhIBYL6Awuh5fW672o4v/whhWBceC1d9bBuChT92g+mueCk3cM
         6wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638748; x=1787243548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twv+XV+1+yrG3KOORHIQ174JWU1gzEjtWwKvqruL4XM=;
        b=bTov4HP+OpXtFjHFIi1a7x6ieaJEMiF1pN8zdQTOJeE8tX8gjSURMytbgzR40wYNbD
         dTYd4L+8Vx6Hfhu7EYrlGetkV/Rnc27HBE0/GWPIlkP/ycrOiDWvBtGxdz1L15VT5M05
         GWHw7FSTYX/P5Oz/Sjn49e+QQXuhk1IdK+SxtayThfzqukqlvnFBQz9EovelzPCofL/4
         eCBmLF/MUyn94tzZyyWxdPligqc732REv2DihU+2pTzEpfmdbYejYYaIyIg7x+oK88dF
         g0/e63nDMwB2HKEJuGSy1xG3Sa5z0Sl0QHXF2bTfq3zgs1cqYxe/V9Fu271pY1X3CywB
         O4QA==
X-Forwarded-Encrypted: i=1; AHgh+RqvDDPUpLO49S0UOdA/drkMrF1Xf8HFD+dhuzCXVa9Jgw2bhmKv+/itcs7+0Tzvkq5D0h8k3TZWbPZcUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Oi+OL++fVkw0633iqwmyNAWnZT3TF7CyFkWSH4XO82/nxvqf
	Utx18R/OoiWgoPT4fQ9p3CSfM3dFu3JHH+uNAh0+amKmdGYMZ2oySJ3b
X-Gm-Gg: AR+sD130VIdhtzlMrEVLFynSv7KWJCNMr2gIXnwxuLvK0/lRTZkHjRCcim7Rcta94ms
	khojkGFGrRwdQgkUS7bYNG+2Vz26eaFqqdcd57LSqcqVzT2ChTWsBczROuxtLEQ0NriwTrAkZeg
	mFVQC1KXRUdNcFF0nbvMmo22oUITB9854owgmxd8o6ZX5Uk7BarNtp4j4LkYMdASrxDQQyLJre2
	1Qe/r0J5dd4Zbo8UBbuDXpULyDjITh7eTbJVmkRW/xgHMiT/my/BQJGBdjOEYLBGRxkCaPjOfug
	648/buQIeYStSyxnfU/wCGeyod9v4YyLyahjzxV45j7mmclW6Wo620bWsn8ws11Lzc+bi+jE62F
	KW4d+OCc4vWdEBsUpQZgErSfk2Q+K42zVMg/VuKxWTq1O2xm32hNJf+EexCmXHQ1zvK7wrKEsZJ
	DUtYQtpB6hPs96OYzSB+ZTohnJmXeRIl+6F2MJEeGtdS5m4o2bozeHUaip3x3lxPuN0tMb2QfDj
	IBskJesAb5SbcqrmFLaA3w=
X-Received: by 2002:a05:6512:4205:b0:5ae:bd66:553b with SMTP id 2adb3069b0e04-5b453f830bdmr1118109e87.38.1786638748404;
        Thu, 13 Aug 2026 09:32:28 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a8a5sm1778e87.7.2026.08.13.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:32:27 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: tas2783-sdw: power the Function up before
 preparing the port
Date: Thu, 13 Aug 2026 19:40:00 +0300
Message-ID: <20260813194000.10412-3-andrey.golovko@gmail.com>
In-Reply-To: <20260813194000.10412-1-andrey.golovko@gmail.com>
References: <20260813194000.10412-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A Data Port cannot complete channel preparation while the SDCA Function
is powered down: the peripheral raises the channel's bit in
DPn_PrepareStatus and never clears it.

tas_sdw_hw_params() takes care of that for a stream that is being set
up, and the retry loop there says so - "ensure power on so that port
prepare succeeds".  Port preparation, however, also happens on a stream
that is merely re-prepared, without hw_params() running again.  That is
what userspace does after a suspend in which the peripheral lost power:
snd_pcm_prepare() reaches .prepare and sdw_prepare_stream(), the port is
prepared afresh, but PDE23 is still at the PS3 reset default because
nothing wrote it since the device came back.

The result is silence with no error anywhere.  The codec sets
simple_ch_prep_sm, so sdw_prep_deprep_slave_port() skips the
NOT_PREPARED poll, and a port that never prepares is indistinguishable
from a healthy one.

Power the Function up in the PRE_PREP callback, immediately before the
PrepareCtrl write it already performs, so that preparation has what it
needs on every path that prepares a port.

Measured on an ASUS ProArt PX13 (AMD ACP7.0, two TAS2783): after s2idle
with ~100 s of S0i3 residency, DPn_PrepareStatus stays at the channel
mask and there is no audio; writing PDE23 PS0 and re-issuing the prepare
clears it within 1 ms and audio returns.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
v2: no functional change.  The comment no longer implies that a userspace
snd_pcm_prepare() is the only way into port preparation, since patch 1
now also reaches it from the resume trigger.
 sound/soc/codecs/tas2783-sdw.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index c217da5fccdf..d32d8f441651 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1259,6 +1259,7 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
 			 enum sdw_port_prep_ops pre_ops)
 {
 	struct device *dev = &slave->dev;
+	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	struct sdw_dpn_prop *dpn_prop;
 	u32 addr;
 	int ret;
@@ -1270,6 +1271,25 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
 	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
 	switch (pre_ops) {
 	case SDW_OPS_PORT_PRE_PREP:
+		/*
+		 * The Function has to be powered before the port can complete
+		 * channel preparation.  hw_params() does that when a stream is
+		 * set up, but a stream that is only re-prepared - as it is
+		 * after the peripheral lost power in S0i3 - does not go
+		 * through hw_params() again, and the peripheral is back at its
+		 * PS3 reset default.  Power it up here, where it is needed.
+		 */
+		scoped_guard(mutex, &tas_dev->pde_lock)
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+					   TAS2783_SDCA_POW_STATE_ON);
+		if (ret) {
+			dev_err(dev, "power up failed for port %d, err=%d\n",
+				prep_ch->num, ret);
+			return ret;
+		}
+
 		ret = sdw_write_no_pm(slave, addr, prep_ch->ch_mask);
 		if (ret)
 			dev_err(dev, "prep failed for port %d, err=%d\n",
-- 
2.53.0

