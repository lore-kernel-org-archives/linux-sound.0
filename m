Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5F3CB8FF
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508726; cv=none; b=fm9rFqBWlvzfFoWd3HGRLwU4X2z858HsuottE3GgY29F/B9J4IwFilNi+6afFOXyra6pFQWC/N8zRJHKlWiSmdTYp9DXPMxhNRwRe6woldEaUP0ZUeyAypFESZsDWHYTiXhNws71V5dxX6vGgXZiKDCkho4+I58TMGZzI9eCcCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508726; c=relaxed/simple;
	bh=z2BayU4pOWIB8JXibIWGGJayo9jILHlgLxoDlljYhbU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CXhNmH2pCkWMET58zWhNE4DVa9VKifnmZj2zi2lMzeV+sZ8KOAGG8PzfuNzeXKivUlGT6lUO6GhaJLo/Z4NL3s3v35ixmP5yhrixfaCyP0m1poORYd5HcHwZdLQFexwJCWoFWB4jfpYUdOGLlx1t9mMdIUpbAdg0Ts6T1aOn2PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=BGz3Gf7I; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="BGz3Gf7I"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847wNCD1092920, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508704; bh=QSzaV6diQdbcxIN+w7fTftbgHF4rwnzu96pvAw2xUvI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=BGz3Gf7InV0j95cps9Xjvs9Y3J8uKmqLYqHyjP6vTLo6sM+04YywCBMfwS2jKhbuU
	 UmEF7V2ED3UpmaAmS4RoNwfofjzdYrYuarR4GN37zxXe3TtKQLzBsXy6WUMYLbxety
	 JuoTpcZAx8N4JwBri3cYkPpelZrqczNGWYyoBhSEcJvrLa6+tBwdb/Z0dkobKstMq+
	 qCosqUmNRvWiZ5dx3zVV88Ee69gMI00dmpbQMElslVmYpr3hkW6KsHoThKhJmS9Ilk
	 pcjeUsvF7y7RBjYySJdiffIKrkEWnXCHTfT34ee9UcKsnZ8uuAMUhVp2BIfymdzT1M
	 vN3tqn0VScP2w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847wNCD1092920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:58:23 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:22 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:58:21 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 4/6] ASoC: rt1318: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:58:18 +0800
Message-ID: <20260904075818.130215-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt1318-sdw.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index efadb6b1b82d..f9ba16269817 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -16,6 +16,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdw.h>
 #include <sound/initval.h>
 #include "rt1318-sdw.h"
 
@@ -564,11 +565,10 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1318_sdw_priv *rt1318 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
-	int retval, port, num_channels, ch_mask;
+	int retval, port;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -582,23 +582,13 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		port = 1;
-	} else {
-		direction = SDW_DATA_DIR_TX;
+	else
 		port = 2;
-	}
-
-	num_channels = params_channels(params);
-	ch_mask = (1 << num_channels) - 1;
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = num_channels;
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	port_config.ch_mask = ch_mask;
+	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt1318->sdw_slave, &stream_config,
-- 
2.54.0

