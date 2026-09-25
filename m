Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79B3C553F
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311804; cv=none; b=TxLOruDjGE/NF6ymzZdlrEEtroqjP/JnMnAdYfhRvcJiFHXl/FjU3UgnRzxQnqCmuT8yST7daT0V5Ip5kOvA9hvtzLJbcXQ5iRTcbFzuySP0nDgFM7RxvgbpS0mhYDRmgPCVDVqYtox7JlKdWDAdlCJOlI5c36SoR6aHCNLoiNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311804; c=relaxed/simple;
	bh=3XxECfTsUmdCi+zRvqz0zN2fUbeWSo65SVUzmGYUP40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7jur57jVYer2hLQb0cy+CAHA3JUPB2vriIt5WM8VXN05aAGCYAsiVXxuKjyvQeJwsT5nnuTRIWkiGLXneal+tBgRZR8SGX+lEFXBRQdmf2YTsJraf+FINRVZ9tk1wlS5HJe603tC3WWa24cxqAq2/rI67229lw1dn57kusAXXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFn8VgHV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFn8VgHV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so344597a91.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311803; x=1790916603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=FFn8VgHVPWfEKSnOBopejLC8B8mTe/KvFbIKiEJ+HnJt1NX2X6Y8sa2Nr/aQeoYHbG
         XVonJahogV2jD/SzLhwzwCMaQKPtDuQ96bBx3QzVtgsd6aelC/hUjNoOpdR1kHjM8PDv
         iTgrHr7gbn2vw6O4q626ZM3i+zzyVJ6MJ1f7atIwO4Wecaq+HCuxq63eHsW4ETr+0GKb
         cu4D0z8c87T4kyHbFz2Eab1DB7ZiZwfAyFr8rnMbdpkpgHGlHbe349j97RnY4ZiOooPf
         4Sn/vg5VX4fUSH2rODLyz8McGbDOEFbmQG+lg/Hm3/hadWgd9DEJlsphgD3YvU8aBV5D
         819Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311803; x=1790916603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=2gVS6rBAod6jCMmtaWBd+tMi9HavuuDhPhWfPdNsfsb/+1Tgd7CNeDv+RxZTFArG+F
         fdBV5mk/UX5f9WkujsULf1ILVRb5qSd8/Ov2rYim1mQ0pfkKw4isFmj0fyCZVbU/iBe/
         J2gvzRUg6OF53qNxAtUerAAa5RbPIKJwjx7hdhKqryWfB/4Lv0XAisZoRLVAdeMVQ0hg
         LpSmgy4aNVpKVJKYZ1JtKI+E2B7GVW/e6Xu5PYpKeP2QrJlIMmVeXTt8sacxWC46JBB8
         4QMG5Ue/JxQGlVslq65L2SQ7MQFCFJx2ICBbA+7DPq3AZCUT/a96eTlsCWJraEz1gXk3
         UMQw==
X-Forwarded-Encrypted: i=1; AKwUvBw5kUZPNGkxblp5pQBKh3xNvsf3GnSS5xzVxrlXEEQaP7/F+oA/QxOprwkWsg8EEG2kKu2cmnxUty+zRA==@vger.kernel.org
X-Gm-Message-State: AFuF++nLG23vJsqTsEYuIVjeedeyfeIP6Un/puBOVnolJp+NCr/jRb4H
	n3TkPSTufgD42JrV3YHtqTWuzedQ+Pe45FpWHfKmVREo0qekVHBLe61V
X-Gm-Gg: AYBFou3L3s1jQzdwvmb9FDRVGOFEDR3cEqdUm+TNgprypY1UhpWZjdNErc9XMDhcha5
	8JAq5DCDh3xQJ4+VJQ11utMMb3dj3ZCEV//aqScytgAmrR9MOgrtbafrc2qXLCeSRyQsTl45o3Z
	w/I1li9uTgho3S9wHiViMQWWAP+MN45pEJ3J2gbHrKUnOPJn7SCfIGhpZeRxf0roaCs+3dB1KDJ
	AIgWdQJIHQf9d57POhl69WWe9kEFnkYXV4PVHnFXD51992b46DJvnpwuWAUw72V9N1WxaY3EF+V
	O9WHftlu2zbGf9QW+VDJfMgzmXpFuRgPk9oHAOyCv6E5JADH9nfacSTNU/3HRmvgXpRumQPbW+7
	nxNmb2a6WCfj0iTslsovNE51F0bHDKMi+5nRPjsXiiMix7/+ostmc91krbsSS2phbjWDoUUfeLN
	xfqE4e9/eVE4oyG5tBic3Hg4UwGPtRas9sxLJkblrg7LW0hMQ5JXHs7Tfd1Ldrrd6/OeFTSjSRk
	GAd7/x2cw6oh5cpQLT+UFsD8mvptrB3bsWdpVHDR0zwveZlo08FDSPcuTjdTS2YA+VJEeMAh96Z
	8x1MHBSZFu3HJ5DXuaYmiGol
X-Received: by 2002:a17:90b:3c51:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-3a098e41273mr4074558a91.67.1790311802879;
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Fri, 25 Sep 2026 11:48:56 +0700
Message-ID: <20260925044908.450775-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0

