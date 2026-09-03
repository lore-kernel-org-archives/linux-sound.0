Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E8425880
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434007; cv=none; b=jSmSnh8/bQNnMFhHU90edEuXg//mZ1FpR8qDj1HzfgSjkTwCQ0tR0xiuuob9fOLOzHUtAOM2HpWBXFoQonXZse8S1pV/w7alXttvqYNbjyQUF/cSIzO9y1P/zdM6zN2IwXXTUIO0BF735BiKDM2GqFRczcC6KeBfdBDXWzwfJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434007; c=relaxed/simple;
	bh=SCwCoNWShtcTFVhYzMwf+3dZLUCIsEdC8BGae1rabpQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m98pAG+0GkXPdlFGEBPizLuJDRzqVPXfkx9r8rJ7j72FdA77mg+8XkvWi/0lblzW2FRiaApH/m6tLWFtfDt+1XqGYAJ5wR8+v+ZIdVwyYKR0RDkQpb6P8FbcqEFbD2uSemW3M4ZGXJpxelTgnwGcFQsQbI9cVlhSA/PSfBt9lwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=L0+geK/1; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="L0+geK/1"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 683BD2suC3503669, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788433982; bh=k4I1vuivgoLQoxMRujlK66n1Pa5o2B3SrtaDuvuRCk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=L0+geK/1Pd8v9qoxxINTHbTjiE+xNWGaPdz2gdZbej0r2xHtj/53gjfdNWrP7Y1Xb
	 8JbE3rzwR+PYgm5Y7j8A1/ZBEah0R0ZevVZ+bV0vH36AmSMqvPuBP+4Dh0HHQ+ND/2
	 rOUl6JYwY5PgFv4zG1X+ihHn4PTwCSIByKJkhxR3JtIYAqlbDeY/frSQWuWnNICdEi
	 RbZYoBv2+TO1oed9vhsC36N1PzLKJT7uokRV2KvPTHZZ15Lbd2hmJ56uKZ/IYOMXKS
	 olvubYJTd2NKSPzb9VxKpDaa2l4TqeVIB4gGPkrNhVEb9l5teQ/IrgdAx8o3Az/q8o
	 PE3HVDgHYO3Wg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 683BD2suC3503669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 19:13:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 3 Sep 2026 19:13:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 3 Sep 2026 19:13:02 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Thu, 3 Sep 2026 19:13:02 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/3] ASoC: rt712: fix uninitialized stream_config->type
Date: Thu, 3 Sep 2026 19:13:00 +0800
Message-ID: <20260903111300.3830237-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt712-sdca.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 13574513b181..588f2dc7f858 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdw.h>
 #include <sound/tlv.h>
 #include "rt712-sdca.h"
 
@@ -1449,11 +1450,11 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
 	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
-	int retval, port, num_channels;
+	int retval, port;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s id %d", __func__, dai->name, dai->id);
@@ -1488,13 +1489,8 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
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

