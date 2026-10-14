Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7654E5320
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977293; cv=none; b=gRnqW3Vuw9VYoOYEyDsNBKozfP1Wka9ZdwYUfkA9YxU7iyFnHu+kHRINGY8kdptFZDTiJnxl3cc0C7h0Y2ITEV/NICkIafqgaYaaBozmwY5MbzI3TIzmT8u1ned82tjwAOzJMC69i89KnWGJUSMyRs2ybDnTbcJOmD+MDPObAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977293; c=relaxed/simple;
	bh=v9cyAphNljUbfY5OvAiTOa76tQ3KOENArTBClWrN5VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiWLib5i8MQAuvtWS6aP43+x2/FZBXLRy7Df9p8lMPH/ZU2IxjucKqJcQvdHrIDs768IV7U97AHdxBo0gNPexue8pVhALeKHkOLp0m473LOfw8ypLNLipAkBbO5ursnqgzNkAct/9YUvslQTbLLY9qs86+fTHr84rIocKxuF1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK5zHSWX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK5zHSWX"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3459596a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977292; x=1792582092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=aK5zHSWXBIDfy2Dn1ZC03X9uob0GSeMcF9XIGZwCjYWn3w54FsS6Im+s6duLxqSdyI
         2klHIKXIuKUMtcDxj14TrfZTaDW7nz4BvYsSYaWXb1M+5EuDxiDwjEL4XjZGxub4uTIx
         0oul+PSSoTIvL3LMYJ3MccnF7OhegfZodt0rXMccQMRJVCOdwVHLktmrLOgD5TwtzTZy
         LidlTZJtQvNCyIU7Xsj23O5upKuSCF/4n2KJYd6XywSJZBWoDV5noZXgmPuf0PQphhXK
         MF8fyMXR3xDtDYO2PUSbSZLVfB97lZCukArHbJ0WCW6AXE/MIUv5b9AugScslMp+Dtpd
         pncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977292; x=1792582092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=JMDTUILbji5y6o7ngMwv11ZrZP/DOJGG27cx2wX/pZ1NhTXtgpL1v2TUoB5MOPLEvk
         +MQpTWQlHb/Tv3RB+KunH3OWcMhVf1X0CpxADhX+O1/4ZHcyavKF5jiVimeOvycmNSCk
         yEkIBl0ZOCEBhmKYcsw649vvbWpwbYVH82B1yvcEO9rFtuXOi5+sgo4ncJ25pm4EjLfy
         2tVK7ic5X+Vw7ec0X3I/hZAVXJE22LoGJl3M9dHJJhlGY2aRm8J/aip0ZGQuafrUNDfZ
         aNkUCIoPODetrRfs5t27hwE+UUS+yl/68U2/YZzCdAzjFG4OeDr1+Nzy1AheNpnA9Hum
         fWcw==
X-Forwarded-Encrypted: i=1; AKwUvBz7PPhe4sBQV+9Oja6btOfZ4ngot3CiImQwyiZBqJ8Ph+pMYmWyXWPeQY9mCn8MHjSab32ladw2dz9aIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwWdStfceT+wtiYUDlzGF1dTZrsD1U0kP91ooQSTyGZg59WCeX
	VzIBVW/ckmlv37WjhbWiFkdKwiyg1vuRNpNV1shsn9m6fqQTCucqBby2
X-Gm-Gg: AYBFou0Zy2guGC3+eB8AGOq58sUQNUYg19bu0xD2TIn2TrXtVOfFMZ2gTiR0ScWOrHB
	1Hz0s7vVG98nU2FdhmFHOXQfkgyKZfUQAwuPFpuSJ7x7EpW0MKL2/1nY7NLadYU5PnHst/6h5YK
	xa5wTmO2g95mQfjxWucC5x6VgtYgFBb4Re/sZmQQ9REYVA3cCc0RDgg4snde/0F9iWc+M1u0Edl
	weihIFeImoXJWyTQiO6+kt/XFgYve6r3l8yrfrCEVdGlraDKeuYEsChoO3D18/yT8MlDShqUqBS
	zEwc10mGVoyM++uWrta7D7Gl4TPCw/6rjwAADPZywslR90xjffcoPnFi7e18Xm5YUCqgdOo1BOg
	092OxNgn9vKeNLKNKHyiq5ib3GZ9Q+IOWgWl5OeMbtt4yK/25fgzzGz+NgdyjcaLschaY/TRc5U
	drF6LwD7An7gcYV849JQo/zjwNJW/uVHLyVzlmT7+N19fwijvqxNLdTo65VFVUz7eL9/pg+5HWB
	f5KnfZDB3H5Bv6qZPZz713CZ/AFhwaU8fXfhg+iLUy4urZJIDIXthQcjX/De+cXyLamRZboxylq
	WmjhtnY4cAVnnQ==
X-Received: by 2002:a17:90b:2644:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ac860e1b6emr237850a91.41.1791977291371;
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/16] ASoC: mediatek: mt8195: Fix clock error handling
Date: Wed, 14 Oct 2026 18:27:35 +0700
Message-ID: <20261014112752.683032-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Link v1:
https://lore.kernel.org/all/20260925044908.450775-1-phucduc.bui@gmail.com/
Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Link v2:
https://lore.kernel.org/all/20261005110257.50145-1-phucduc.bui@gmail.com/
Changes in v3:
 -  Add Ajay Kumar Nandam's Reviewed-by tag.
 -  Add error handling in mt8195_afe_enable_main_clock().
 -  Add error handling in mt8195_afe_fe_trigger().
 -  Update the commit message for the DAPM error handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (16):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix main clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  86 +++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 111 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++-----
 4 files changed, 221 insertions(+), 78 deletions(-)

-- 
2.43.0

