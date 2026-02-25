Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A432B98D
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010763; cv=none; b=uxUAB06Vys03GaBVe8UCAODfEobfuLzf5qEbyauXGVz/nmJ5ZFF7Kh/hYWOaKZ+vIQRn/7ygFMza6DhfdkVs2k0jK/ozlBW5BlqYtJjOuKE4BXvQg7h7G5F0u2qkk+Xzw8W2z6+73f4qX3XpjJOXZMQTkFT0yIh3V/mbHchom2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010763; c=relaxed/simple;
	bh=oVG+T8FXjSB7eS1t6z77wVSBebsloYriUw4GXAndj/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d0D9HNvaGstzFZLOMjJ9dtmJwaQqvoHScRWbQPulO8bJAbPiAcgnHxM69NV763xffg/a/MyJbzmcNvLX2o/u9bv59z0eYK/Hx6SnqtTFTY4vtJrLq3DbI8iVVgSZzJrxPHP9kDWvWRlH2QKeVsoud8YpsG4JXj1ZCrVK6aLdGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qPK2Z4oR; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qPK2Z4oR"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 61P9CDrL4767798, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772010733; bh=TqY3Bo4cEnf7uDvkMEdVS2duWVRvUo6wWFsn3eymP7s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=qPK2Z4oRQGTD7A8z8PXDVOdmUFOy5k2ejTXNL4kEEnNd/kCv8YuIV3EwdIay0jTFe
	 J8KUvyqROk8NxIDL9PmGnTR+Cnpo6tmmOhoXFAsDadduxlnRZ9NqQtLb/9YKvlUZKz
	 3EDFYLeDoems69UNVpCO53Pjl9yZTotVEVvlxVHYygfW3mKGkY0h/naLoZOIrcA96J
	 cUH5JQsUbHuDX9H+iKos62lD8EQsPpz/LRSt7RLno98hGVyCHpgm9LCIlX1Jt1U9OW
	 /Rj8DeUAxcH0IqXDYg9FqbWfwE+kTozYdZ5+T8w1576S4V8v6iB0CXjRehqHjVaiNx
	 w+kNyb/HAzkhA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 61P9CDrL4767798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 17:12:13 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Feb 2026 17:12:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Feb 2026 17:12:12 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 25 Feb 2026 17:12:12 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1321: fix DMIC ch2/3 mask issue
Date: Wed, 25 Feb 2026 17:12:10 +0800
Message-ID: <20260225091210.3648905-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch fixed the DMIC ch2/3 mask missing problem.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 50f65662e143..8bb7e8497c72 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2629,7 +2629,7 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_port_config port_config;
 	struct sdw_port_config dmic_port_config[2];
 	struct sdw_stream_runtime *sdw_stream;
-	int retval;
+	int retval, num_channels;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -2661,7 +2661,8 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 				dmic_port_config[1].num = 10;
 				break;
 			case RT1321_DEV_ID:
-				dmic_port_config[0].ch_mask = BIT(0) | BIT(1);
+				num_channels = params_channels(params);
+				dmic_port_config[0].ch_mask = GENMASK(num_channels - 1, 0);
 				dmic_port_config[0].num = 8;
 				break;
 			default:
-- 
2.52.0

