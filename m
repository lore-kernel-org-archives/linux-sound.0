Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306FA3D47BC
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371407; cv=none; b=hoGcwLxci5GZsL0GSakCHCS0pXOK1McByOJgeH4YYi0b+GUl7Ch2h++vk0Xk6ROwQ5mKPtZprtRc6+MDa0nGtoE4ZtjFIyudsKCTh1R90kQt9EZKkEDBQnNVy7cxENFaZ/GFD/Z4kimRbY32kQ97SWd5YkBWTzgN9y+v2Y5fA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371407; c=relaxed/simple;
	bh=ek9iMbN6/T58Y5ZkX9mvVhOW3cmmdMjNX75uRDed6+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F81aZQHuB3ItnXJORWboGprmPPevaBvIq2zLao1Er4xJQqmsGHASaHBnmHCSeCh06VqYkvkoUGN/Iojust47EvrJg1/qdWbO1C4XnTeMlHHPQe7qnctMha+yg2Jwho8a0fXlddN9GTErpeYATJxtcPzwiU7PR8hh7f3Q3U7jk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiMHMC73; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiMHMC73"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e576377715so19645645ad.1
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371388; x=1791976188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=TiMHMC73nYTHIhz9PeoPex2fH47X34hj+HeOTG85iyD91nxr/iDBL0tyBvIKaJyNkU
         S1c1/vUYee1uKw+4XFXqjKTr13WerGiM9fjlgGM0mbVivRy+OXHILPWRt22xYJjjZuvG
         6C8dLTfV6tfPacmiwtpI5AePc6JJjaLArFltHRPrEdag2H6XP4UnjvBCwP2ZSnErPDNY
         ouDAhzvUXk4ynDl/boTsPsgu/5TnY8VblZUXiMwtmd1U2M0fdd1YNI4KS2L3gEJWzXEk
         e2LRK9T9HRC8Pgcq9BWRA4CcXzNXsNX7LuGlufBU4p90t/eBck+ovG35HbcjZv4sfU47
         HP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371388; x=1791976188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=e5tNFDwCQ3QCJtgMR6S9C3is9CYh7rF4cGSTLsZq/lhmXNiVmfW2qqSJtDpyfX/tDr
         Gpkolfmu07/0DoJhzcQmKPgP+FkSRkVzgIOdizJcTUl0l2N1QQyqSDzC/vepiZjiezri
         rK3uRBpGOctMQW2X4aFSP/1WH6PO5TEwkMIAasSvufJH9HBQlWFRX8d/+KuKyKSjgW4+
         sDN3h7joH3srrogEv/XcypIHlYeQ+HfrWZe42EzsM7wLNVSwMDGGOp7pJV6eZZMgeZqa
         ZHnsW7nNj+MG4l9YwGzEH6uUprYlo4IO3A8ND2BJrzVRPKObSYNkei7mA8SAgujOs/f8
         +HhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5iUay7HwJtfDA4+FgUOc9hIJSBSv4vTnX4v/oxK1APgLDppv8vFTUcHVLurfQafABCEXSWCY60eQlHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVbld6SYamrZrFrQRoIjcaXxojrsS+Vcfg3pF8Aedn2r+KFCZD
	FVcKiciXJnhbBOhrrCTDv+b4kGAOxreAWMyQmhN+0bhyPbaKinoWSz0w
X-Gm-Gg: AYBFou2HsGWDTTcJxgHqCI2uShHWmFvh+ol8YyZHgzU5wCt0U5CzdiSq8r3tX2Ha//L
	dPfSz4ts+JEYauR5wdRaKLu6I/vZqXJFIA0nlBTPIRIne9iPZP7Jz0H/rz9UrjBxA8IcVsXmC1g
	CEXKzo+ZfB5Euqz0crOFZL8d4u9BEqczxarFrq8UR07Lc09wGenx8yaHrTYuA1nBZD25UG1gD1Z
	I5J7MF7dXvtC0WEwMZxOlHC/NG0/0lgMxE7m8UtQRJ7iFo/+xCS6mMgNIOf494mwgV8o6JmvzQo
	5gXIF1HUxBt34g5c5iSp+lP1urYCB6v1mcVpMEYB7Zeim+ES0chLFnWESDh3UjGw2bqcHixc3pg
	VOybgPSitL67iS+dCvg3jiXMssftpXzabP1ehUX5MTQM3xCllmyCQPwpWXNNp/YMolUktBjHS75
	A7G8U+f9yh15N2mDiWL1AnoLDoFZfe43Oo62SBv6wbWmWyvRNK0Exqgp7EyhDGdFSb1WHOoOwEt
	FrsR1dObJLauQGmKzra7kkfKbYpX9CC1FRlTzkGrDgQYAbZ5cfDn+H7cmDjK3ApcArvKfQF+PbJ
	GmIWDPi8i2tYgw==
X-Received: by 2002:a17:90b:288c:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a8a1969c32mr1650916a91.18.1791371388256;
        Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:56 +0700
Message-ID: <20261007110858.509341-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mt8188_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Simplify the code change as suggested by Cezary. 

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..b2d935ae8668 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -320,6 +320,9 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+	else
+		ret = 0;
+
 out:
 	return ret;
 }
-- 
2.43.0

