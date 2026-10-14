Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F3039D3D0
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977318; cv=none; b=NxOvKQ/njz0q/7apWmc2wUJIjRKOfXHI3VefQBR/5O1g3XryAX58CtrAxyr77+v5YBXEJM3W3t4WA+kHY5tDjmx9zgV1/j9y5E7IMTrab7JXog3rm2XMXXJId56Az0NdMTh23iRigmZBbw8eVXgMbO9ZgvGUdoNtYaHy8KhhDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977318; c=relaxed/simple;
	bh=CBFoQ/JED49aNVpvQnDRN1AI4eEnOAL7do8R8i0kTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXPL3+ZO/F6BZWdqegp3i1SlxGXWWFQxAlNtsHM7micDQfBeXW4YQpGB9//kopC5YvGgNj5JS6mfZkDgU02gyrT7yd1ZU6LwD/9ZmC+lSy2UHnXK5Uhp7Ur4b8Wv6iw1TRrWuZaesmQlE62P0NbDw76PHMvQDLm3C7J+D5fF8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvvgCycO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvvgCycO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2114876a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977316; x=1792582116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=NvvgCycOKTyxVw9ZnZyshjo5VxYtTDq7VV8VwuHiMuK61ZSu440Zm3LapNhzi5di5e
         g6vgsBNLzdjIEYSRIuygKTPe1qkih9D2+yETDZ8s+IOywjCJ12XK6c7+cv101hS5UaJl
         qR3j7n2P3ycnqwyh/OBAsE2+vD34RMEFKhwqAz4b6xvJIKwK4I0px7ueUBvfaKFFxMeA
         ny6u5EytbUCFyK9oTeiZ1p9czcyB/sKFD6tHcGrV0KG7EPYKnBqAkKoqtdn2i9Ukjqlo
         U99Skg7PC+HqDqLqtP/U2ZQ6IhFxLbJ3gK2DmUW6ZJX9bQNJAfxx+CXkMJbjRo1CvqEz
         jgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977316; x=1792582116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=ferBYZj+JkNsDk1ltLwigyfSJTrBl/MNoRfDOJuoC7TRE3jd4QOsEq9o3ChukbhBKE
         pw/VkLaKL1bdMPDWs/VTYhn4uzBwzDaOQEahf3uZDKAfhKYRXiYKX5T4qiqIAFVgLz+6
         XJYy8mUfi9rjfZ+TRo1IpdlZrdzhqWkANCHQtcVMplgOekCMBGYw7feui51JKgMSw110
         H5keUhFjNTSTad2m06fQOuroifaA9OdmMA+EAT218SKvVnjqwDhFb8hdewjO5IDOCVN3
         uiDD2V5gpzdNSIBHnORuS3feBbIliHTXDryZvDlf1AqhmXCdgSruweL+VAdXymKWmHKa
         nlxw==
X-Forwarded-Encrypted: i=1; AKwUvBzCcCwlH4Uk4kXWgvX33D3SLmVwGOnBRqo0+W+m23fwZh9wQJC7nYZD/PVVXcU7SpuNoqn7FN2MCFbVTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJfV32kNtuwPZnHnoeS6WfCRX9F7tIQIfNN9BGTWOD6RPps05pm
	vmVDqGHNK9WxUYy9eAfDLUjASlWhp4anCDrauXOw14dPtn2nEgdIO782
X-Gm-Gg: AYBFou1rA9GJTjBNfc/AxzhYJbNNqIs4tHNm8baHokJDVPAp/BgqG0yQNqxvVEcUYXY
	8wTI0gntPiwUKHJA6YrI73489pI3inlSXc3IyyjfF1gEO+PPJqmGO56Q7GmpKLjQh4qpnQx589z
	yQpY3Ur3s/h/ae5DR89yXzfodyZlv4VEZ2IwrQg19Ev6osSCpWSGuclgU7srDlVJTaCl5WqdYwD
	ydleSp8yTllq/QyK0JDulwEOH8pcCJfoSLVj8bbZMJkftj9NDU88Fi2KmaT5IpX7jLlIPWDHZDW
	2sc4siVavlkKErM1lBZ01t1+a/faPJNIIcxRSzgJQifcTP20w9/4bzmJvR7j/cORPc5Kp7H6jAA
	V6jZTdLDkpsTtw8VU8KT5bSu+6WhBDknXzg1OiPCFiLiOj4GyMqVCYnbdKxKJdqZKbzIRVV1MKr
	Pd5TzyA00b1A0ZEvM4tLl8ugaSheM6wIvJoKc1STvgEICMqhFTVJ6nN58WhSGFUS8tYuF9JN7W9
	Kd4yRiV+JkIjX0IB1GF8D4RJ8gJi/lZ+uV42U2oTGihaz87VysFqxIL2R+DAZrEoHx0fMdfhxoO
	zl5c57yTNZzjAQ==
X-Received: by 2002:a17:90b:510a:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3ab3a93eae8mr12248948a91.24.1791977316276;
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
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
Subject: [PATCH v3 04/16] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Wed, 14 Oct 2026 18:27:39 +0700
Message-ID: <20261014112752.683032-5-phucduc.bui@gmail.com>
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

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..03d2c4fd1f85 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
-- 
2.43.0

