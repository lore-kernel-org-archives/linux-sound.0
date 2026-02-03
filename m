Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360F3D3CF7;
	Tue,  3 Feb 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137201; cv=none; b=S9eWZbpoyd6verB4p+ax2xY1Oi4ZXMsp09urAEuUZasS6y2YKCtr2erhLhv67YVp7gKz5MMSR13snDo4ui1TxIfOqIohU5NZKGL9zpMOK1j4LJMLd5YjpzNDBLSSFn25P6MRcQ+rvWwMTpyNeUdtFO2zwEjIushhvSN2MIKbyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137201; c=relaxed/simple;
	bh=82Au6WbWX/XbCYAat9JgxZ9XoB6C4noOyfxXXw3R4ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaP3N8o5vpvYJF57XV4jc96sQvtKWEWGuTD+v0Jex0V/66aJ6BkPNrKlqDjyhV1hfmMHpaa0Yt6ZfuDGgsB9oBzMlhIeF3rdp3QoksVn+zLfxXMlblLFkzajYEGZoqzYjXKfuDOPUHKra2orKNtd/D4EcV3/NWGmbpEpPq4DcLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MulHVc3y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MulHVc3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=82Au6WbWX/XbCYAat9JgxZ9XoB6C4noOyfxXXw3R4ZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MulHVc3yiKVg7EWuJeNcLS2fBW7s8YZaucy6nKJslCoK0599F5Co2+amb5k6/oCy4
	 q4RHc7+05HH/Y1X0ZENSK/+bcm/X7gFm5LZcLJPYUxngf6LMgcmW2l5gQ+VIidY78Y
	 cbzZkQCyk5tNDOfc4sDjLKQ9Hz1fXNRw5L84CujUsbQgkyIpaS5DbsEmQhNeXGlVvf
	 VVLOe1WwgYBFMcwHh2L+tMu5+s4cts/3gsYfDMqwuVf9qRzmwVCneunRrBcI6WjR+a
	 vcDxMGzYSWnuDcssXDINeKShZ05nqUnMN0t6fqdwwIGJYM0gnjmW82RFrQYZgEqyAN
	 5ft2eUywD9T4w==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0067517E35DC;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 16BE348002A; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:27 +0100
Subject: [PATCH v2 05/10] ASoC: rockchip: spdif: Improve sample rate
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-5-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=abFzezjxkX7Ga9S847nmHHXXVGcpC1hL5V81nWEem+0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmnlJblPCn7rXthXDQ7QZwe+rXMNzyAun
 gvqdZUa7vwCCIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qarJ0P/2rFxf2AuNxjA3t7xD8breTSS/u56B3jPD15IadbdT1CxmzPE83hpo6vBrPFJZ0yxDO
 4ZtGaquoFQAFjRlqeO2PAh7Z3fuN4PZs8224e0NBPJZ+IYVihU+l37wGstacdJ6/JcX1vAEtlht
 ZlkDbHAkZQbWVAXC9LyTrcoUj1vYJ+dC2cEqQ346W51cbBGnBq9lca1V50v7peQCvaYPXfVpTFm
 Fv6V9Uk5CUxvjyU7E7P7nQnsfxY/0OdLTY4mhMfjRzXqLFTYLcPZcBX+vO7o9Jofu/fDWDzoa9D
 4wZbRWm3GQC+aGBPRSqh+KrUyH1r2jyKqq3643IoVvyJ/NCA6D5uw6O2gA+8dF1Wyq5DkSWDPUp
 kA3jYiWXUpxtvgSJyDGXfTErPFhqRpArwgEYMpUtiemIthu3bEVqJnRGrXNcWoKMGDK8UgS9GrT
 aw7mG2SjagbIcGEkdQwfBjcTF47EwSpoN4QlzAKyDmmH/ZV75yzMC9HUwKrWaNbhDv9YX0kkHle
 ycuLZwsX+rrp4EcRN3uqVhGrPLRo6saUHCbwzIrY7W7UkFiyr2Zc8LfXakX9M5cxqhqFNd7t4Ih
 kI0Zcwl6PzxJi3qtFj9KKjoBnD0zAKI38tBsQiGxe4Z2s1K6OwZe/VeBg1KJV+VzmB35rt3Mon8
 8TKNSldmYQQA5+5rYYjwqaQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sugar Zhang <sugar.zhang@rock-chips.com>

The hardware supports all sample rates up to 19.2kHz.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 1c62fcb0d8d4..55d64fd4c93b 100644
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

