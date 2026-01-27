Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BBE355049;
	Tue, 27 Jan 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530133; cv=none; b=q3UKBnnanEqXZ8IR/RHXynJX6dElY+fJ9Xqa32AKpd0Te0rVdQeslU8fMj6H5i677Ug6ff1e27NxeGOy6q5pkh+l1nT7FpMmSIh52vdzscpT4wDFdK9pNNm4hZVIKkxB7G6JxxxhvYOO/woLq7dwWDnky9nuwobTYN9UQrdjhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530133; c=relaxed/simple;
	bh=0x70eJ6LqWibam6/8d2HJYajJ9736pFY/SKkVLmceOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZf/X4kvxe05ARw3WGIpSavQ8LpLscImpZ+JTdLrMhJZubwCSzsQBR7+BzpllbTuEbmhBQ2ceo/q4WBF/aGdq0icgd+V3lDvQT9FuMIVVWnwUpx8XJFtk0dKpNByFA/mvNLb9BxFquvrxB2tR/Sw49JPI4a2WmhuElJ6SNhy1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kU0Yycua; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kU0Yycua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=0x70eJ6LqWibam6/8d2HJYajJ9736pFY/SKkVLmceOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kU0YycuarDUL9LR/LyCP0fcxNKJshbllia2LgRX9fMXY1vFgTj1u/sTn2wxlyLi8o
	 6ue4JuOnBk0hcVtRe/ybsPX0o2At9II+86aT46FDOOFsnBOJ+K/2tqw9FTZ2Mkn3QX
	 P6N4wbr4q1k2UQru2twaYykAeLQau6nRk3U5qMhf+TlOcnEywLmeARH34Dp/qqigJS
	 vPlNZfBjq8bCtezI9Ap+jMGJmwdvx+7av0PJZI48v5T6JAFAJ3QKP7Pf3GvpZot8k3
	 8taIYb6j26zD/9Bq2GxXm+UEt1g05hXsFy9L4booybu29VU/+tKlbxAxxkbe10CUWx
	 DoEAIzHQoLDVw==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDCC317E1513;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 38B4E480062; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:25 +0100
Subject: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=++BAbGfCLnkoMQgDrhj78qjcxu4mge2TSu9sa0rSBY4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xA4AU5OXfJcnO+2idQXFt9WnWkoUNOW1
 g2vZ7Fq7VsjFYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaNdcP/A1J+kjKpHlQwmp306nFDFNDrban4AhVnqoISWIwsPRF6YPtXHmczfa+tAGEtJ5PcZg
 Svz/vP13gQy/L2D5QtrQ85mCCcK3NjlPsofxPvvvG16b23c17r/7n63DrFUDIn4CigALnuuCUam
 J+rOygdve/iCme2a1sbHPvIOkIQxGGVRiU9ygg+E8imQVSxYQaZQCvtnuqvpvy8UqSvQ89/84NL
 EKOh3HeJ3Wsp1tLdSQlF3zsRR8ZQgolL4i3Wi3NtnHnYl07p0ZmXJvQtDEeEF4XiznXl7SB4UO0
 XIAIAGw4sC2qRMhFra2l5eKy4auGUc9TIV4d1hqHEr98/JagjBC+hwKIF5XRmskn1E97AwFgrgx
 q/in7pHxmDInh2WSdvuZw9R7uIWFXkA4eNP4lz8aBPWvOnCyF8kZAxQHpbSVsZ6M4wTBu+kA8dB
 NmM5yJmMHyT/D24DKBFrXAVqtolR3AkayzkqwT6JVozLyFTbjWIXn2CNsfLWVwQRYV1SUIPHvhO
 /NPv5UTXXFdMl6CSoZl+lXb0lqXEk7nzVz9tRI9jCqo6lGJsEroSkTfy+9c5qlbt8EvO2l6OVwX
 p2H3BMypkE7ddXbcWa3xmTgwuJJhpqx63jn0drUvLX1qbXQ7+LYSELO/8EikwcTFv9nwLdHAh0B
 orWg/BdWKeT2Wb+G48TEzeA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sugar Zhang <sugar.zhang@rock-chips.com>

The hardware supports all typical sample rates from 8000 - 19200.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 20ed64c1fa42..80fd8f53bb2b 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -188,11 +188,7 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = (SNDRV_PCM_RATE_32000 |
-			  SNDRV_PCM_RATE_44100 |
-			  SNDRV_PCM_RATE_48000 |
-			  SNDRV_PCM_RATE_96000 |
-			  SNDRV_PCM_RATE_192000),
+		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
 			    SNDRV_PCM_FMTBIT_S20_3LE |
 			    SNDRV_PCM_FMTBIT_S24_LE),

-- 
2.51.0

