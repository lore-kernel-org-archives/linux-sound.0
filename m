Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B62DF6F6;
	Wed, 18 Feb 2026 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445950; cv=none; b=e50WNftVbxLG74sLzNEXcU+XW5mLWJ0X7zvx6igtzZtxC0ZgAS5xhM7iM/WV9SiAiM7M8FwPbBsm3SFYDa7IGbzZsG774vyycFtliQFQKjwqUHwEtmw7maVNN8m3xvK9wE8yBnx/3LVr0A8O0PduaXgbHpUS/dHpx1Y3V4/v2B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445950; c=relaxed/simple;
	bh=zo8tEBh7OtlzfrABsEVBwAQNqGYbVlNeoFlcaDNUlmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2+EGFM9znES7uAp6JbkmJ88Gdcr6+16VR70VPX7+XWPz+x5NDsl+3FeGcHuo91SmKNUmXZ6J+RX8fDykRHcaf3iDxxN9/hIvZdCWSrlZcTkE85QedQFEKT4WHxIdptVT9XXk2wGkeu5JlrizvwGvWlOi1FrcN1az5D0lxHRHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SE7JODQl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SE7JODQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771445948;
	bh=zo8tEBh7OtlzfrABsEVBwAQNqGYbVlNeoFlcaDNUlmI=;
	h=From:To:Cc:Subject:Date:From;
	b=SE7JODQlSJ/CpmNHMCle+8gp0kCVoL5KK8M7ppvM7tgbqZlyskEPxrZBMrhjEZ1gT
	 LAenXfkEKYf3NXZIeZ/VbcUoY+9kWG6KoCj5c6GvJO248hp7042yX3sVw7Emmg2zHX
	 d88TTjqskLqPGZ4vr3hWtMNIJ+OO0zObpRTPF2Dx2XQudgPudlMFE0kXjr6BO8Ol+7
	 FeYxA0otQU2QK6JFGigyKLLj2/RWsJwqTdU1uBln8RR29GBlJ6OBsP7SWb5DPQT5/P
	 tMj77wo25Ah3UoxE2QkXsHGmsLEVRciI7GwIfWwYTsnTqnjg4wUoSJ0DSjlRQDMOvJ
	 1Bt8ufM8WMcVA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14C6117E131B;
	Wed, 18 Feb 2026 21:19:05 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
Date: Wed, 18 Feb 2026 15:18:34 -0500
Message-ID: <20260218201834.924358-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers will not always call set_sysclk() for all clocks, especially when
default mclk-fs can be used.
When that is the case, use the clock rate set in the params multiplied by the
default mclk-fs.

Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 770b9bfbb384..fc52149ed6ae 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -22,6 +22,7 @@
 
 #define DRV_NAME "rockchip-i2s-tdm"
 
+#define DEFAULT_MCLK_FS				256
 #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
 #define MULTIPLEX_CH_MAX			10
 
@@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 			mclk_rate = i2s_tdm->mclk_rx_freq;
 		}
 
+		/*
+		 * When the dai/component driver doesn't need to set mclk-fs for a specific
+		 * clock, it can skip the call to set_sysclk() for that clock.
+		 * In that case, simply use the clock rate from the params and multiply it by
+		 * the default mclk-fs value.
+		 */
+		if (!mclk_rate)
+			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
+
 		err = clk_set_rate(mclk, mclk_rate);
 		if (err)
 			return err;
-- 
2.53.0

