Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301011531D0
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725059426; cv=none; b=Zw1jHMjIQHKnQ4KHts0etDuiD3aU5bX9ojWw6J9+evz8tUMvBzMMPRjRVOv1tl/5HDwuFqHeuFhT9dnBkuK7MCRZGD3S/gzmFTJMYU/tAkb8QDH2LWylSVo74ATRkfnE6BqtAQNwHcofJP5/uk0vcgkuZkFRZCK1WpTCNe79Z0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725059426; c=relaxed/simple;
	bh=kB9kkVn6XvOI1T0wQPnD6mq4NeHVwMtdHVNQkoxMjAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLQlk8gXDrrvy/Jc1PvXDsxvBHKn77KRu5tYqnfb2UQekzdaUDOOVyBO6XuBi3AIwSjcOw2Gmr7j+oG/oCcl2HaveOIv6RpbwR9aYYMLNkzKM8ObS9DjqeZXpUZwJYKK0fETQV7bW2cYJXBZvkc0uQHgAz+InPgtXEBBgwM+xvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=tItuCeQI; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="tItuCeQI"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8B4EC88CFB;
	Sat, 31 Aug 2024 01:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725059422;
	bh=YuZt2cUdSKSrJC5cPCqXIoY8XTYU7QDMoGj7HTnwsfE=;
	h=From:To:Cc:Subject:Date:From;
	b=tItuCeQIdRGJYFL8SeQqX4SnLLoxVXheDueGzssfNChujsBDKlxTh1NRIeRaUa3b3
	 wnktnXLQRbdoOq4L3ht44+DU+k//GPEah0fKPBjVMqnxzYPDgY3vHGgySQRmVVoprT
	 zJ0AfPuHlK0uwkINy/JFUFn5CN/OjLnl+q2cnpnP7HsEoJpflkpNngAgu1DFf9K1oT
	 i8cHPJs6+AuVW2UlrLsxINcoGSrIGEf/qmdjjx5gQg7VwftpFgkMNOYDsye5NX2+uJ
	 1UAy3UgLRdX1rN7Szvt6I7czSNznpuvFQzQFxb877pWlaQNAajonauo37h9ivLirlz
	 rHa1OapN8/z8A==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Cc: Marek Vasut <marex@denx.de>,
	Baojun Xu <baojun.xu@ti.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu <kevin-lu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	kernel@dh-electronics.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: tlv320aic32x4: Add multi endpoint support
Date: Sat, 31 Aug 2024 01:09:43 +0200
Message-ID: <20240830231007.205707-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Support multiple endpoints on TLV320AIC32x4 codec port when
used in of_graph context.

This patch allows to share the codec port between two CPU DAIs.

Example:

Custom STM32MP157C board uses TLV320AIC32x4 audio codec. This codec
is connected to two serial audio interfaces, which are configured
either as rx or tx.

From AsoC point of view the topolgy is the following:
// 2 CPU DAIs (SAI2A/B), 1 Codec (TLV320AIC32x4)
Playback: CPU-A-DAI(slave) -> (master)CODEC-DAI/port0
Record:   CPU-B-DAI(slave) <- (master)CODEC-DAI/port0

In the DT two endpoints have to be associated to the codec port:
tlv320aic32x4_port: port {
    tlv320aic32x4_tx_endpoint: endpoint@0 {
            remote-endpoint = <&sai2a_endpoint>;
    };
    tlv320aic32x4_rx_endpoint: endpoint@1 {
            remote-endpoint = <&sai2b_endpoint>;
    };
};

However, when the audio graph card parses the codec nodes, it expects
to find DAI interface indexes matching the endpoints indexes.

The current patch forces the use of DAI id 0 for both endpoints,
which allows to share the codec DAI between the two CPU DAIs
for playback and capture streams respectively.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: kernel@dh-electronics.com
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/tlv320aic32x4.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 5c0c81da06dba..54ea4bc58c276 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1073,6 +1073,13 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static int aic32x4_of_xlate_dai_id(struct snd_soc_component *component,
+				   struct device_node *endpoint)
+{
+	/* return dai id 0, whatever the endpoint index */
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.probe			= aic32x4_component_probe,
 	.set_bias_level		= aic32x4_set_bias_level,
@@ -1082,6 +1089,7 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_dapm_widgets),
 	.dapm_routes		= aic32x4_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(aic32x4_dapm_routes),
+	.of_xlate_dai_id	= aic32x4_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
@@ -1203,6 +1211,7 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 =
 	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_tas2505_dapm_widgets),
 	.dapm_routes		= aic32x4_tas2505_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(aic32x4_tas2505_dapm_routes),
+	.of_xlate_dai_id	= aic32x4_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.45.2

