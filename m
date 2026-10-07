Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09792484894
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371391; cv=none; b=L8R4WbUq0wwkqezcLaor4A9yjwoOdZihY01leXU7Kxp7SkRD9HXfCMgootUOEd/ai1J/re9t0aVYujjsO5LgY6Fw0LXy98Bn/8Hq5HuxnjfGiTEpwXVSqFFp1J4/p0BNVKuEZpBiFN8kZeTA9whJb0YhLQFZzC765k06nNB1HpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371391; c=relaxed/simple;
	bh=DDkxtMw6JmqKFj9+PZ/xfRX82i+leYlJ/h0hjEWNucw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZiMA3Qup8b5KqvUzJudgp3OPEd3MAxZpvT7p6dfiotP8uc6KmLd4ntANPTxcMkf5XYHEkMzQfg1dTVBR2P2E338x26H7SaYyUwDSFydt0uKEbkICx6UQ0bYyO++QwD0EB2/3XPdZuOxu9GhGsgJjPotM3e2A3mN+YKdKPY9cUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9S9h0g/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9S9h0g/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so1994082a91.1
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371373; x=1791976173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=R9S9h0g/q05eOsWn3UGfc8J/NJZgpBe7SmzEejbTjIdbg1/5Bx8TPmnIxRnEa5mDpv
         lqe/1/D0u4mum++JtQCe7YB6K7Kcn11nveOfmPNpOw75jELc+n/UCti0S4EHg6I+NRuF
         9LowRRHSMLNglrCSPo9XJuu6yQQEWIzEvqVqLfDQOsQDgyHaHARpyOJ+dEND3qLbjGBx
         V++9nUytxr0TFpSslTn8FR1J019pB47K/G5xc8A0VG5Zio4FvEhGOZ3bw9+DA+6AuhEL
         HnHizaEEk63k0oMnwenaXG+lXOIOmLcOs0aGUTLodejpzyZzbW1kBoKPzXkDpgNZSjsH
         pG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371373; x=1791976173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=DJGbgdqpfwCqe3M8PZRWmeDJaMWJRoypPRk+buOCG5I35OigHziU4B3Z959K6F8YNt
         2+E45D2bM1Q5G/TR5Vh7UwrD6Tk8PZIFur/a5PFAeCfRIIzYWDlIGfVjq6xP630PuG6E
         2nc1PMdjwRveF03IgbkqBGD/SsViqnZJn4/ttSXedkoli/P0J3SacDv2Bw10NGfPk4Ow
         SOcU5XMNNG1CfJkQ37CsDALwo92ChXK8/3JY0egQJaHuKpeKv1pjrQm5Gspx5Rn6GThJ
         azxgLrWhpm5hQIQoeYGbSY5vr6Vigt9C+PnXvJ5p+9sgIkHRUBFNADIF1/BVIpK9O2wv
         qg7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdy5VmSUtIuJQF5Xp7eo4e9BMUvmQFDn04rwFEyRbxVHQv/0sZMOPLhXY8NGBYA3XdyqDOA7X3FOr/fA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEpqBy/bQSFpnVXFi4oA5I9aRC1QYRaU2Dd5AxlqL0qM+wnd4F
	iILmUvaL1F3YDVYeQRzSPZhaZJ3YhRBQIFSRU3WKC8KLv3SANJkbVzBw
X-Gm-Gg: AYBFou09KWM9m/KSYzFaMV5/oq2qO+rIP1VTfGbIbSTddH1Z7Ga8dD5JgQlw4YQXxX3
	1WcWD0l8fICuQ/rvGVp6E0nAvCmXJHJkiCN9af+BV12SkcDTwzoeC9qxYsN+DIfqp1iZrQ2Q0Ai
	0tChMY9ILuzR504nm+HPrQQ0qRhvCEIwcXoDZjwgWr9b64qWZZryzcou5Z7UdvldJCZmEMeCGbb
	vppF+12BigMVM0tcDOexSkLdxDQi3JIa3SFm11XAZNnfl14YJLkB792PbNGEpKrPwhGoisvOTF1
	9dyUWEoJRAzbmz6veQ6yiVT6rLuK/JoiTICsOVWmWQNg/Pzkep4OdWab7jo09oqPmX0bDLtmSsL
	3D8EhQ0YWhJyHKu+Hdxza33ZqJA1zjr9b2qkx+f+jsKx909HD8xokNL/OVkRwSjqZE6VNAi6FBr
	Mcpir18fe2pRXEjMlKJil7etk3rRtFPFTo+yFVXX5r01Hcyz+1smKMcjwWlQBN+Vp/DZEC/SF7M
	7ilUDUzd+fXjrJ9Z5yE7qI+w2LwCXeR3gJAXrxDRqNiqZ6aYODEhy4GWMYRXTKuDLYBLobUDV5N
	UUK1A4ysjhPudg==
X-Received: by 2002:a17:90b:2246:b0:3a7:aeb4:e6eb with SMTP id 98e67ed59e1d1-3a8a1ceeb73mr1617868a91.67.1791371373155;
        Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:32 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:54 +0700
Message-ID: <20261007110858.509341-1-phucduc.bui@gmail.com>
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Changes in v2:
 - Rename the patch subject.
 - Simplify the code change as suggested by Cezary. 

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: Handle constraint return value in FE startup
  ASoC: mediatek: mt8188: Handle constraint return value in FE startup
  ASoC: mediatek: mt8189: Handle constraint return value in FE startup
  ASoC: mediatek: mt8365: Handle constraint return value in FE startup

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.43.0

