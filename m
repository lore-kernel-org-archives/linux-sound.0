Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364C2CCB9;
	Sat, 18 Jul 2026 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396092; cv=none; b=Ct1/BGOldUR5z9atxfKfmam/qKp1GqvkpDaoZRYPrCVHT/qyXfM3TMoDBS/e8eWGEHwwbzGpbAdPT3PhAVuzgfa5lxqkQvP1j/G+lM27TdPJaFKH3lzgI3Hc7s9UyhFCGg73cEbKV43SWIRSjvIIFa4BlpV4Lm+toMOs5RMvuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396092; c=relaxed/simple;
	bh=aUWtveo32D7gO4Wja7ptVi2AOynmxM93eKXsXheGF28=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1leyFlz9tW4Lw1VSZHZ9L+18bU7tLeuOLKCBPzxzKj683YL6m8Y0Ae4o8U6/0fuae52RfY/KF/WqmYYnjkYOBUQWjOzhQR1ddyXurarN5hmAC/dOVS3MC952vwWPTfV5GrutGbQmhXCBHLwa5SRwmUpGb6SJeXjO8Qtb8VE2iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wl8w2-0000000083K-0eK0;
	Sat, 18 Jul 2026 17:34:46 +0000
Date: Sat, 18 Jul 2026 18:34:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: topology: Guard against out-of-range mixer control
 shift
Message-ID: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

soc_tplg_control_dmixer_create() copies the per-channel "shift" field from
the topology file verbatim into struct soc_mixer_control. That value is
later used as a shift amount in soc_get_volsw() / soc_put_volsw() (e.g.
"reg_val >> shift" and "mask << shift"). Topology data is loaded from an
untrusted firmware file, and a shift >= 32 (the width of the register
value) is undefined behaviour when applied.

This is not hypothetical: mediatek/sof-tplg/sof-mt8186.tplg from
linux-firmware contains a control whose channel shift is 0x01000000, so
every read of that control (e.g. from alsamixer) emits:

  UBSAN: shift-out-of-bounds in sound/soc/soc-ops.c:117:21
  shift exponent 16777216 is too large for 32-bit type 'unsigned int'

tplg_chan_get_shift() can also return -EINVAL when no matching channel is
found, which becomes a large value once stored in the unsigned shift
field; the same guard covers that case.

Clamp an out-of-range shift to 0 and warn, so the rest of the card stays
usable instead of failing the whole topology load.

Fixes: 8a9782346dcc ("ASoC: topology: Add topology core")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 sound/soc/soc-topology.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 35cbe29d2275..dd94eb9460d3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -672,6 +672,16 @@ static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcon
 	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
 	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
 
+	if (sm->shift >= 32 || sm->rshift >= 32) {
+		dev_warn(tplg->dev,
+			 "ASoC: out-of-range shift for control %s, clamping to 0\n",
+			 mc->hdr.name);
+		if (sm->shift >= 32)
+			sm->shift = 0;
+		if (sm->rshift >= 32)
+			sm->rshift = 0;
+	}
+
 	sm->max = le32_to_cpu(mc->max);
 	sm->min = le32_to_cpu(mc->min);
 	sm->invert = le32_to_cpu(mc->invert);

base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0
