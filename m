Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1180126C3B8
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645652; cv=none; b=tRV8oQRUHYxvwWf+WrK++v/OBe3NkWTK0VQMjihoMgSpL+BFxqIRlv318U6v2erprB/8Xiw2hT2NX92kjdJHF1G15krZwjdT7lbw4U2I3+jN6/cTThgmul/y5Y9JjzAvcGWPI2+mog2XS/dubIq8msBwKH7s9hmMNUD4PvipzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645652; c=relaxed/simple;
	bh=hNxyeMYF9n8cruWb3nZXnXHuoOa0GlmOltYywI3TqgE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=svP5QjDMlaITdVtyJJ3RnNVqtmD7WTEOj5pZ4Thne9X9UpCC6gBQT5hSRhzm6awK7bHkbDlwm8zSa5QYTjNjDJl4Pl09QmaAdtSTSWMcng7QqnuXXtrRpOg/7YazV8HNGruJnI9rytJTAUaB7lX0ZKIGmQJEnMOJQBdDCkGqJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=hBaOR9xa; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="hBaOR9xa"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 54J96oueE782510, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1747645610; bh=hNxyeMYF9n8cruWb3nZXnXHuoOa0GlmOltYywI3TqgE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=hBaOR9xaNPlAhp25kGPFS1zwsOCInWuP8CDjDO2ikRcg6qnrtW/rfzK71TOy6oXoT
	 HMPrdIHlYsQVww201Mdv4IN1879K8pEWDI9Ez+kGpPcyNDD30BgH35S7zvTpbsfTI7
	 PlUmTXOubJzpfu4T20iiqn+ymIT6OjJ1liiCz9coHiN55ltUngMfCs+IzHDT0TsBK5
	 JBtpEUX/APHMtg2HCjG7LsPiYprQ/EWPqOMA47xUvumdaZXCM4RC2SW+cLWXUjXlO8
	 DQ7OqpylBHgft0V5W8CjIfX6CY7HEE3UbxthR1XMKacTTnm7Uq90iAvMJsvub2cN6H
	 2LqNrO7Tgvo+w==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 54J96oueE782510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 17:06:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 May 2025 17:06:51 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 May 2025 17:06:50 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: make regmap cache-only in probe
Date: Mon, 19 May 2025 17:06:45 +0800
Message-ID: <20250519090645.2620292-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch makes sure the access to the codecs is cached until the device is enumerated.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.h | 1 +
 sound/soc/codecs/rt722-sdca.c     | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.h b/sound/soc/codecs/rt722-sdca-sdw.h
index 80b014456940..c5dd472a2c00 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.h
+++ b/sound/soc/codecs/rt722-sdca-sdw.h
@@ -34,6 +34,7 @@ static const struct reg_default rt722_sdca_reg_defaults[] = {
 	{ 0x200003c, 0xc214 },
 	{ 0x2000046, 0x8004 },
 	{ 0x5810000, 0x702d },
+	{ 0x6100000, 0x0201 },
 	{ 0x6100006, 0x0005 },
 	{ 0x6100010, 0x2630 },
 	{ 0x6100011, 0x152f },
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index f0d3fd9b3d95..ac9588284a95 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1309,6 +1309,8 @@ int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
 	rt722->slave = slave;
 	rt722->regmap = regmap;
 
+	regcache_cache_only(rt722->regmap, true);
+
 	mutex_init(&rt722->calibrate_mutex);
 	mutex_init(&rt722->disable_irq_lock);
 
@@ -1521,8 +1523,8 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt722->hw_init)
 		return 0;
 
+	regcache_cache_only(rt722->regmap, false);
 	if (rt722->first_hw_init) {
-		regcache_cache_only(rt722->regmap, false);
 		regcache_cache_bypass(rt722->regmap, true);
 	} else {
 		/*
-- 
2.34.1

