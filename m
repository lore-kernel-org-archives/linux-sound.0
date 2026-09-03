Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ACB380FEB
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434013; cv=none; b=RENzKic4kK27PzlLQ3oc585d3XHQCv0054beYfJJxP8KJhYZMo4nOlVe93m0LUQ+3aGNmZyIhRGFST3x5WsuwV+vRMpPoh050Dg/XhvZoCHbSaEpAPDsIgdBaFIRBJy1QtzmoJVEWXEj5S5UqkNs46d3OlFq0AazDAO5jpZpzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434013; c=relaxed/simple;
	bh=GaHICxaAU4nGBCPL94ZwQ9ohUssSv1fN2l915O3gHcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W/RZj2VTjxH5K5dUhI2tR3MkiCJFJ1qYtfhPD7X+da7C7KL7w8qI/2zzTO5Ujh5fBTDsw6xno9Ew9DaBMHv40aqSUwFFmlj11HmMNLzj3ZjYbB1tyinsutbB1+L6Ekq3bHYyAkWMIwxIyizN+Qi98uVshB+ZJ3hq3rJQLnJoTzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=LxwPlYnr; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="LxwPlYnr"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 683BD9ybC3503712, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788433989; bh=iMBGtpZ94KUXdEaObCNQeM35jFMk44DbRMvqAOwJHqQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=LxwPlYnr7IQR7pIUcY+PMNluWkAtvKOD1NpGaGtvzJNFHD2b42qSxxXKAKtY4b+HJ
	 DX0+mm/IACsJPlikKH7kK+cN6bvhQPKpeLsSZw3AYg6ym7iGXr0GUyy0/LLh4mamqk
	 uQfAhEjeU2OiD3eI4pP7GVe/PIbIYB2DhQ6YDjpT6ZRqG1HtXanVbjRfTcXgHUOs51
	 gzobP7vbWy9+f6s/z7hnVqN36dpu9qsB0E74cMG+4noBj3M8O2xsnx6dTSaf6ofhem
	 u6y2fNgucezNY+fdzjvTnXSiBha9CsTSV5Gh6u7mGaAors3pJzxbycg7PKHrnqJ394
	 tLyKKixZxlhbQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 683BD9ybC3503712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 19:13:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 3 Sep 2026 19:13:09 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 3 Sep 2026 19:13:08 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Thu, 3 Sep 2026 19:13:08 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 3/3] ASoC: rt1320: fix uninitialized stream_config->type
Date: Thu, 3 Sep 2026 19:13:06 +0800
Message-ID: <20260903111307.3830253-1-shumingf@realtek.com>
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
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 90333779971d..72af413306fa 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3246,7 +3246,7 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1320_sdw_priv *rt1320 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
 	struct sdw_port_config dmic_port_config[2];
 	struct sdw_stream_runtime *sdw_stream;
-- 
2.54.0

