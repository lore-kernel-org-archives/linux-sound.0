Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB61A255C;
	Fri, 17 Jan 2025 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131518; cv=none; b=G+Nhjhb5SEAbJAUmMSYbfwo2du7tWanLpE3dlthnrQc5Q2QArrLYy/D6NN58kJHnNdUGuOpTV+Z9fQjxWQfE5UZWDJlNA8lN5Jszpmw6jlC+qHTHSIAOqhobu7qmxgklvgN3aTE8JrEu+Un9o9ON5jmDZ3uItV+UlfCCyFYN1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131518; c=relaxed/simple;
	bh=58nCRlhim/hqdZdfV3fPYGWz0W4AInp/Qn1bfkzmZN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GzDqvBtsmxqlkZkcQWqGYEdJkTQFwwqr0bK+Ydt7BhL+pkCnqdLdlMpFCo2WPTuqmOBOjz7MFkStvFsQlG8DVJVtDvSsbbIYKQ7zwqhWAsE28FXq/XN3igNlpJl5/XR4e6C84Wb2aASfgdyivCD31hMoMbvspfIigol0YR80Zr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D5vuj4lM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D5vuj4lM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737131508;
	bh=58nCRlhim/hqdZdfV3fPYGWz0W4AInp/Qn1bfkzmZN0=;
	h=From:To:Cc:Subject:Date:From;
	b=D5vuj4lMaUyfXNIazmrsjk4WN5bgvldbkIVlIC0FA2NFtgWZRnjU1YQ8UjgIAtrcL
	 lPHpIIjwEZFNzgAyMroZSb2iydlo1J6TL0bPP5wQCz+Pl/0cvEDjip11VG/tmbgHws
	 mDiKt1SCAnkGN1GT+k0JFnM6rhtgNEgaGyn2zgEL0gDDVYDAcEBvmkv0l2GBzIlXJ2
	 tovGqeO9WUsYa2ok0y0Q9ewcYCPHw+zuxlAvXnVD+tl+x6ExH0oq/cEnLxu52W0PhU
	 RdLW/FAYiQ16qon/ZZXyvZ3L0lMDDi9GB+S1ADLr8KBQLZj7VtXHrIuaZ9d9ntcer5
	 RUKaR0N/RsklA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E11AD17E09E9;
	Fri, 17 Jan 2025 17:31:46 +0100 (CET)
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback
Date: Fri, 17 Jan 2025 11:31:02 -0500
Message-ID: <20250117163102.65807-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit
9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
the set_sysclk callback was removed as considered unused as the mclk rate
can be set in the hw_params callback.
The difference between hw_params and set_sysclk is that the former is
called with the audio sampling rate set in the params (e.g.: 48000 Hz)
while the latter is called with a clock rate already computed with
  sampling_rate * mclk-fs (e.g.: 48000 * 256)

For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
be set to 128 instead of the default 256, and that value is set in the
device tree at the machine driver level (like a simple-audio-card
compatible node).
Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
be configured and simply computes the mclk rate in the hw_params callback
with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
audio.

Re-add the set_sysclk callback so that the mclk rate is computed by the
machine driver which has the correct mclk-fs value set in its device tree
node.

Fixes: 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 31 +++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index d1f28699652f..acd75e48851f 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -22,7 +22,6 @@
 
 #define DRV_NAME "rockchip-i2s-tdm"
 
-#define DEFAULT_MCLK_FS				256
 #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
 #define MULTIPLEX_CH_MAX			10
 
@@ -70,6 +69,8 @@ struct rk_i2s_tdm_dev {
 	bool has_playback;
 	bool has_capture;
 	struct snd_soc_dai_driver *dai;
+	unsigned int mclk_rx_freq;
+	unsigned int mclk_tx_freq;
 };
 
 static int to_ch_num(unsigned int val)
@@ -645,6 +646,27 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
+				       unsigned int freq, int dir)
+{
+	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
+
+	if (i2s_tdm->clk_trcm) {
+		i2s_tdm->mclk_tx_freq = freq;
+		i2s_tdm->mclk_rx_freq = freq;
+	} else {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+			i2s_tdm->mclk_tx_freq = freq;
+		else
+			i2s_tdm->mclk_rx_freq = freq;
+	}
+
+	dev_dbg(i2s_tdm->dev, "The target mclk_%s freq is: %d\n",
+		stream ? "rx" : "tx", freq);
+
+	return 0;
+}
+
 static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
 				      struct snd_soc_dai *dai)
@@ -659,15 +681,19 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 
 		if (i2s_tdm->clk_trcm == TRCM_TX) {
 			mclk = i2s_tdm->mclk_tx;
+			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else if (i2s_tdm->clk_trcm == TRCM_RX) {
 			mclk = i2s_tdm->mclk_rx;
+			mclk_rate = i2s_tdm->mclk_rx_freq;
 		} else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			mclk = i2s_tdm->mclk_tx;
+			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else {
 			mclk = i2s_tdm->mclk_rx;
+			mclk_rate = i2s_tdm->mclk_rx_freq;
 		}
 
-		err = clk_set_rate(mclk, DEFAULT_MCLK_FS * params_rate(params));
+		err = clk_set_rate(mclk, mclk_rate);
 		if (err)
 			return err;
 
@@ -827,6 +853,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_fmt = rockchip_i2s_tdm_set_fmt,
+	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };
-- 
2.48.1

