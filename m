Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A6B315D5D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933025; cv=none; b=oksYeHwX3dNp3ZvU4vgfAzmXecbKnDTWgmfIRFT7rR/OTxGg+LqVYs8zm8wnjmxww8T3jKTqMes2T3xy7W0g+QrUXikgsZKjsAqzIsoEtTdKQfsR4HjFL88mWs5YRSGiVgbMBm6PmownxZDGNBn6s+WuYme/vAGK0gZEgrxDQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933025; c=relaxed/simple;
	bh=lYQJvTGGi8XzptxEIxXZLM0pzTZwaqVFkTC5CTvCPh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=eopdzhhH+z1ZH0v7Jucr6ZjfYv1+f+TqttQNYrhtoi5r4wHH4YECxXz9or7HIlHNrQ03cWtKzXIoM/Pc9F8CBIbIKvrhnaVajSUkdm48SlGe2agAoSgqsOLZHpQlt1v11GkAnKQAKQpqqoSEZ7MVXq+Bfs656VDmkAyOJ/hdT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bYLPeWw/; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bYLPeWw/"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261002092341euoutp01b2bc122b89e6cc6afbdc2af22adf4fe8~arBgn4AFA1259112591euoutp01z
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 09:23:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261002092341euoutp01b2bc122b89e6cc6afbdc2af22adf4fe8~arBgn4AFA1259112591euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790933021;
	bh=i5HY/00iOSsGHc97Ye9obj/X3Y+yfcbh4o5jprYc3/U=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bYLPeWw/HhZG5jZu5RxU0jH+o1byoR+PthQ4zheR43KvLCyFSsXGcQj55yjWcAW2d
	 XrWF9pTg4Ysl9W5PWOTzPA18pqpCTIn+8zkbqso15DnhWpqEgNUEbbwCz+J6pchGDP
	 /OsN3Jkj2kWZxNpab4D8pKzpIVWL052Wb0j4rZ7w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376~arBgcQyxN0704307043eucas1p1B;
	Fri,  2 Oct 2026 09:23:41 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261002092341eusmtip22dd026d84cbc0167bd0d628d22fc7f4f~arBgIRJkM3088030880eusmtip2i;
	Fri,  2 Oct 2026 09:23:41 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: soc-generic-dmaengine: don't request default channels
 from dma_dev
Date: Fri,  2 Oct 2026 11:23:35 +0200
Message-ID: <20261002092336.585546-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376
X-EPHeader: CA
X-CMS-RootMailID: 20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376
References: <CGME20261002092341eucas1p106b159afbbb9f78eb1a7f9bfaf2ff376@eucas1p1.samsung.com>

When config->dma_dev is set, the DMA channels are requested from that
device instead of the DAI device. If no custom name is given for a stream,
the default "tx" or "rx" name is used, which refers to the channel of the
dma_dev itself, not to the channel of the DAI device. Such channel is
usually already taken by the dma_dev's own PCM, so the request fails.

Since commit 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel
request failures correctly") such failures are reported. This happens on
Samsung boards, where the playback-only secondary I2S DAI sources its
"tx-sec" channel from the primary I2S device, while the request for the
default "rx" channel fails:

 samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
 samsung-i2s 3830000.i2s: dma-names has 'rx' but request failed (-19)

Request only the channels with names given explicitly in config->chan_names
when config->dma_dev is set. The only other user of dma_dev, the Tegra PCM
driver, always provides names for both streams, so it is not affected.

Fixes: 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly")
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/sound/dmaengine_pcm.h         | 2 +-
 sound/soc/soc-generic-dmaengine-pcm.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 81422219ed39..909ce442a194 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -127,7 +127,7 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
  *  channel for platforms which do not use devicetree. The filter parameter
  *  will be the DAI's DMA data.
  * @dma_dev: If set, request DMA channel on this device rather than the DAI
- *  device.
+ *  device. Only the channels listed in @chan_names are requested then.
  * @chan_names: If set, these custom DMA channel names will be requested at
  *  registration time.
  * @pcm_hardware: snd_pcm_hardware struct to be used for the PCM.
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f6206ecaf26f..64baba39b94e 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -389,6 +389,9 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			name = dmaengine_pcm_dma_channel_names[i];
 		if (config->chan_names[i])
 			name = config->chan_names[i];
+		else if (config->dma_dev)
+			/* Default names refer to the dma_dev's own channels */
+			continue;
 		chan = dma_request_chan(dev, name);
 		if (IS_ERR(chan)) {
 			/*
-- 
2.43.0

