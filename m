Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240A3B1B3
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508700; cv=none; b=nUcZRMojhY3UHOQTu9r/r3xKAX7bdKX8WJYIlHEVFSamaOryqY8QoMZreFct1bpFgDJzZk66wW2WwBcHXRci6skAmS8/993fRzeO/Aqq68qPitmC6AMJLLPyzCX5A7+KyrBCw/2QDavVkKg3TIUNePMqRDfzppoE9OyPeVobhyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508700; c=relaxed/simple;
	bh=QleeC+wZw7COGJX/pg/g2Bo1xiTYLcERNCBumHK72JU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eTpQV41Rmg4yIy+T8cV4EFFpMcMmmh9YtYvsPJvt49vcSyVmpWAt0fxF69QWnlMlwzuOUXEl9gthMl6I8Vwiz01sUc3z8HqGUu+nZoN2NpfVaeBHHW7gszoIvd8jFOgTd5Jq80fl4p09xf0fAuM+QG1IbC64OFCWrsAA11xdV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=e6NEZtm2; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="e6NEZtm2"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847vr4H3092520, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508674; bh=XVJJhf9c5okBHzCu8NHNHZlxLB+76/hGFjc3KhKR+2c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=e6NEZtm2UbzfNFM553ymo4VbBK8vAiDscAVnK37WcSp3zTUNVFTD014dOhZ4VoDwi
	 +bzsccuahTwJ0Q0Lzd3alZpG95h/TF0Ncxx3tZl36DJBoL9UQB1smUbQKxa4Mimknc
	 VtS4KxIs9y3KqCtJjhQZbqb3OHjF3Z52HfwrFy6CNqKZIMmb5KXDmvgXejspL/X5K+
	 MTSm3BEaryaXf5BivXSl8axoCQJb8r4DFIOPGHHuBJ9FKkCHLeJ8GrBFurAuwxAf8z
	 I6Irw5APe3jqibgvbOEFic0XP3ughqTCQg7XIsMpymapIsdIlA3g3fRinmHrUt0qYj
	 w5lj7pvps2YhA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847vr4H3092520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:57:54 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:57:52 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:57:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 1/6] ASoC: rt766: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:57:37 +0800
Message-ID: <20260904075737.86525-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt766-sdca.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 64d763b96a06..5a1c1e10e6d7 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -936,9 +936,8 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
 	unsigned int sampling_rate;
 	int retval, port;
@@ -957,7 +956,6 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT766_AIF1)
 			port = 3;
 		else if (dai->id == RT766_AIF2)
@@ -965,7 +963,6 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT766_AIF1)
 			port = 12;
 		else if (dai->id == RT766_AIF3)
-- 
2.54.0

