Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0844F7980
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977365; cv=none; b=kHWRGsDIerdfDVXE/7m74Cu4yAUj4DUgAVvvzyt8c+XRCVfv6RDebZusIeq7zpBH8n6CoftL08LNQOlS/5qzyIo+VUm4Bngxbuo6F4Je4UaghWlbWJx4XPHoxK+rLslYuISM7e/hrcWsSzv3OqUS7jk9DqyrVg+jmQ/xOEyDST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977365; c=relaxed/simple;
	bh=R4UFkq5kOPTIOMmo6a8SnQ0q/K5kV69GaDbNWQblX9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgMC5GSCsw60dPX8npAi7gzgGxxhDi+ZfAjaBMpnexIPHvoOEpqsPnkczpviF95Tz0mr5yCXGdfzUe3vHPCyQc8hj9b63LBpvKU+wipoNBrZDWlfSCI2xtUtwjpQ763D1ici2GHlewEoi/vxOqNI1Qh+ZHnh0wmSu1TzzWHGnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6Io2J0v; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6Io2J0v"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so448875a91.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977364; x=1792582164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=H6Io2J0vnNLUzmx8Rlgl5qvPW1wQ4ZDpO1mDGFV5g+WA7WGw+kJ/U1Ar0sgw9fCy3w
         tmSifvqjpOoBnKGYQO1CATKnsqvK9ENCSz2m3AZvNVm47No08CubbHJoV1HJw/vs/67P
         k/XpIxdX+3jm1n4RMQygRos8bWXVsrGEv13twQeznrnLGldbclTHDEHNZYYeu/9nB6gB
         r0Rfv+ldFCbEMIvp8lP3/Vq299BomB1zw5TruAaFQ3DezYUMBq4p/2cUFAJzn5cU6HeV
         LKCC4cD/I7g0FJ3bzfJUDBIYmmj5J3et7JO5EhYS0AmGEBRohRCECiac7EcRUE9AEgn6
         Jjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977364; x=1792582164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=DJBjy7B3By40ff4WH1fA8/ndAxNP2qB4zdKWN68V42N4P6eKBBC2R7pn4NbMSrw9PD
         bNO1m/UYJNA9b/zum9oMUHhdg0gTc5uXpBSshUZdtES4v6xyRMC+fBLnrdEiAu1ZWtqt
         VX/K9LgrCNvdt7Y8b5IMubUa2o7ai0L2EnJoIz4viX+VqRL2BnKuS9Y5PcpdzNIZBzYL
         zAZBm6EZK0rZNssVu0M+53oGPNVALT8gkQCAQtlzGBehkz1zgtaVvEtiEm+hGZK7uvQ5
         2ZmJzpx6vfwJMzYbQCf6XEVPlWqeNNid27g64zfpJkPLndFgamvjNlTuZBgqkV2HZTE+
         Sl1g==
X-Forwarded-Encrypted: i=1; AKwUvBytfJgwQQ9IN1AFpuwvyxu74euajm1aevPQ/FUmrJXBkRR7Cz9r8vhwZwJ2NnfrRIjTONEROC7Mf/zZpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1IdEp/JpOCJb4Y+tyHngef9UqoqjycYHSTzYZBtsEyb2chtQb
	MlY2KeO6flrOGNKgYIU5zMsDFRh9cql3fQHLo/Ui78b8qkgPD5nH5ii7
X-Gm-Gg: AYBFou37Ve3oKIof2CXYkDyUwoMgYRWOjKhf3rfmoy1iEblj8POsIHAnp8QF373mgok
	e3kHgxvh9JBH/p/AZZoj0EHQF8xgGF9YaqhD7ZLwVZjZ7uIrShuNMacHjNt5SSzHqO6yIUZf0P1
	EBoC9XdZYDq/n6UiiOnvJsAQf8tdXeO//3GukJSSn8aGBBHNjLblrdYua9yJtXx+VrkpniFwQWo
	LdD8TgWXSnZt0ZSym3BvHYG7ENZ+fwtRSGN6qMKYDt3KkUNedIN1/MRhBKzZocUCcgfUHkCeBS5
	ryOJoq6Pv27ujCKe7hDezhryZAk3vmosEhOFG6533XcTWbCOVJPNnosoquVZgX0Z+Bk+Dt4ZXog
	oylIRSg+/ERW+zoI+pGI/Gu5qBKyY7MiCWabSypODs13C+7pTJaZFpkJo0TnORKu+z0dZHGdR95
	Lxsi4o3Gu/zY4Ea6nf6jKyVRkj/9U3CRwksSv3RiCkBKxZoMKJdRG7ZNI3c/C1kPg3ugr7tmMmw
	Q6rYP8HnTYMsbzO+NtsvlOV70P2/FGDdAphgC1ZydmYiRqUcSP0RLUrdg+y+BRmi0ER6er6MhZq
	TQ9qB+kR/Bw3iw==
X-Received: by 2002:a17:90b:524f:b0:3a8:c0cd:57f8 with SMTP id 98e67ed59e1d1-3ab3a239c2fmr12156626a91.4.1791977363541;
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
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
Subject: [PATCH v3 12/16] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Wed, 14 Oct 2026 18:27:47 +0700
Message-ID: <20261014112752.683032-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0

