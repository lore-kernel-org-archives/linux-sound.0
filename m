Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7773D890B
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508749; cv=none; b=ZepPamp61FijZ4iDqR8d9/1Ivjwpsg0LLMZolKFAUFmzc0QcJoURN3/RuDErLOk+wPp/vsfKNvmSQZtTw2qDU47VvlsZGr7NSYB9lFbyuG0FAstkdSSlrzaE+2vCRutgHrC7StptVZKq+TSdO8IwGPu8irFcHccBKnRMLwH3rJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508749; c=relaxed/simple;
	bh=3WPptEUD1dxSq11Rhdtu7dIYs0o9Y41Hxy/kYduYF8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aSDwjdYor7YBqAF+/B7Io+W/2EGKkuvRPyNPyYrrQ/N6beQkDsuLexuPaD95OMprCQhjJAGZ477JfFFsoeDnHKKEe2mNwOAMse4Vx3ZqIPPHu23ueTMg1dWhxxzg5k1Nj32Rrjzd78pnwBwL7UdR7OqBcs4HR4r02uYVgAK1Dek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=QCb84pe7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="QCb84pe7"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847wjr57093002, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508725; bh=9BCUKIuuKr3DgL6A4tBUPxT+c66ensTAgI3F5pRdrPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=QCb84pe7UiccQE9V8CKOxwmpazdQsC68v3Ixlx8XTGNXAVym+6KvUKE0x3ENJFj4x
	 FOQnba2vWYU+6xbWD377QaTaq3MxyuwreweXfyhFFuFEDFEPlXWumHb4rEsAKiBmWd
	 84/b5A4MEMmyqNCWJanmrRLXVQ+Ga/qpy/V43ljg9FDl+9Y+yBZAPjSqXLNJM7Py1i
	 4zpgRScgZ5mmbSnh+Lq3W/00/N8yiCI9imLC4JkjJ6fF2WOxLXzC0PDMNrkR6jjqAF
	 tueY30zP1dYAMTEl9sT1Npt/ba0NTIGOcRblil+8eqISLLVrDfODJYbuPtYXgDwWBd
	 jma6QFE+MsEsw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847wjr57093002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:58:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:44 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:58:43 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 6/6] ASoC: rt722: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:58:34 +0800
Message-ID: <20260904075835.130778-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt722-sdca.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 4cbe9e909585..149cb6617126 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -24,6 +24,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdw.h>
 #include <sound/tlv.h>
 
 #include "rt722-sdca.h"
@@ -1442,11 +1443,10 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
-	int retval, port, num_channels;
+	int retval, port;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -1465,7 +1465,6 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	 * RT722_AIF3 with port = 6 for digital-mic capture
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT722_AIF1)
 			port = 1;
 		else if (dai->id == RT722_AIF2)
@@ -1473,7 +1472,6 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT722_AIF1)
 			port = 2;
 		else if (dai->id == RT722_AIF3)
@@ -1481,13 +1479,9 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
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
 
 	retval = sdw_stream_add_slave(rt722->slave, &stream_config,
-- 
2.54.0

