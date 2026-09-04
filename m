Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8492385D9E
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508707; cv=none; b=PUm1c2Fz9SOO0tDI++OsCCuRVQH38e225waiV0BnxSgzyNG+6j4yxTZKplSHCHpJYl6HIv7d0eyr2WzU7omxrjknACU+KuVdZSJgHsF621ZfnpmNUMWgR6HOyMeaWqPqsAT4H7FPxpbtJSckhrVcEfuWII5WY/YwLllnoeZ/NdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508707; c=relaxed/simple;
	bh=QKoxIsMPjj4axZOjqS1fYNTMFV/F6eKM1ELn/b6aHao=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uyr6nsYesSdul7L66JYUFAIRvydG+rTJz0ozocBdyFSyZk6Uf95Vwohj1aJe9hDrxI/69MCR0FPqbBOKBd9s28/pTiUBJFHndlWQuhKjqOusUgiWVJIzcBbzsHHHxj0Rnc0H/gl65uyyBJzNYeYijx2ajQ+23ltvu3/tXIa1YDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Q9BOZThQ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Q9BOZThQ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847w3GN1092859, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508684; bh=zhao4UeF8VV1zO1sU42/msfaLwo0N1NUWa2brj1d4dM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Q9BOZThQk3f1wPKGzPaQb9VitX8fHqPdZykrQfV3iRQ8c7XsUvcM/6kZxaN7pEPYl
	 3BOBipR33FyW9HMOGdDNrRvY8XBQgdJR7HHdQBGPuCvB3hpSXAIVysHyZlrNYrQj/u
	 3ox2+dLcYjnzpmHGL3gPQ99g0jsLbeazdra3AcETvG137TdTSuboVk8OvnME6v1P8d
	 r0xj9j5/zQ/QIo6L08AcqjQ/8glHoSyzmKamWSPMOzfJm2bQ10kFh+rbTVz1qBKWSS
	 grjXmcfaxcKa6CXU69eeyzcu2EQTM+ysHja9K9vwCxOXr4vR84ALKYCsnz/id8kwUn
	 IPclMGfhdfVHg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847w3GN1092859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:58:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:01 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:58:01 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 2/6] ASoC: rt712: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:57:57 +0800
Message-ID: <20260904075757.108427-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt712-sdca.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 13574513b181..eda87eb9ab66 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdw.h>
 #include <sound/tlv.h>
 #include "rt712-sdca.h"
 
@@ -1449,11 +1450,10 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
-	int retval, port, num_channels;
+	int retval, port;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s id %d", __func__, dai->name, dai->id);
@@ -1471,7 +1471,6 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT712_AIF1)
 			port = 1;
 		else if (dai->id == RT712_AIF2)
@@ -1479,7 +1478,6 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT712_AIF1)
 			port = 4;
 		else if (dai->id == RT712_AIF3)
@@ -1488,13 +1486,8 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 	}
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = GENMASK(num_channels - 1, 0);
+	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
-- 
2.54.0

