Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916738645E
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508736; cv=none; b=MMy33Eovn8vx2OShatdmsIGCpzkd9qR3Lqff5yZGwM2B91ukEjIVHJsx1GX/FJXH9o/Sz+r0oi3+5yzCE19NSoc+oQeSfZnnkWuFCD4jkn7SV+OhYSbtOA/Gj7UXD9Yg1fgacAp3KupoW4hSAQCGkcFpldzNiYUaay+Nv4lYq50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508736; c=relaxed/simple;
	bh=JntfidyDZFodpIiFKZE34stDnXbCwQNbriCIs401eXw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dJuWPQVIA3td+8yZuDJ+rNbbGvCEwC+3DDcPI3MiDY1rNQ1EfTcwoQHNCRbJdR02yzmav6RktJ8jjotpQYO5a6TP5i3Zaqlx5euCP/SYRZYplGF1pcFG4MDszri/GqwOK90gcB83W/I6wJlXV5f0F359fnBb64aJvQju/GA8TH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=j1mRmtuk; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="j1mRmtuk"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847wWpqD092952, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508712; bh=XBi6LkG9ZYmp+EnFNHXFJ/qE2SUSQ11py8EaJxNwsjw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=j1mRmtukZr0g3vMFBmk9P9B5rLoJaqFiPrPCyuglXUcltM22WRdRkkfAOhhIwX5yV
	 UtA7awFJK0zNQaR0savRkgjeK845RyZaZJBdvcbTkcO2yM6kEPV6tVYVjQzikJa89m
	 2CEZSjq5U69M2hKY+kzjKJES40v2hUd3Jwcx38OUYrs/DiZm4pVTXaru0dNxSar/Wu
	 V/OanOLPfmcEU4tvY0Z2quv3LGVKwQDj18mwKSXg9LS95zT5R1vhx2eU3yA0PNGSV2
	 mnn0Xj91lyiBUrcYSo/BmFXTqtk2jSvjxDzVd7hnG1qVppmekUEaKnJ+nRTRDN0Vsd
	 bbL4NZDrXo4HA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847wWpqD092952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:58:32 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:31 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:29 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:58:28 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 5/6] ASoC: rt721: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:58:26 +0800
Message-ID: <20260904075826.130751-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The stream_config variable was not initialized before being passed to
sdw_stream_add_slave().
This may cause unexpected behavior when configuring the SoundWire stream.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt721-sdca.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index b1c3dc060c24..a9479d0e4941 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -21,6 +21,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdw.h>
 #include <sound/tlv.h>
 
 #include "rt721-sdca.h"
@@ -1269,11 +1270,10 @@ static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt721_sdca_priv *rt721 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
-	int retval, port, num_channels;
+	int retval, port;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -1292,7 +1292,6 @@ static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	 * RT721_AIF3 with port = 6 for digital-mic capture
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT721_AIF1)
 			port = 1;
 		else if (dai->id == RT721_AIF2)
@@ -1300,7 +1299,6 @@ static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT721_AIF1)
 			port = 2;
 		else if (dai->id == RT721_AIF3)
@@ -1308,13 +1306,9 @@ static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	}
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
 
-	num_channels = params_channels(params);
-	port_config.ch_mask = GENMASK(num_channels - 1, 0);
+	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt721->slave, &stream_config,
-- 
2.54.0

