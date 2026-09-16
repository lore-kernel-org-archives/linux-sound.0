Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC5A442FA4
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553946; cv=none; b=H9U4kNkDeMwM6QW6Ns+tZaMttPZ5OPls3aGZaPNa9DughUCzDcPJSwNTTmAHk7cdU4s7LTIZ61FrMslI4mexzq+8Fo/wZO++HdkwhGAaLdyEJQx4KphTmBpr3FbR98SEl3jx4GbzXRYXkJlHwrK1DOxIUMyWV6QnNV3qZhMhOMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553946; c=relaxed/simple;
	bh=JRZhO6Hr+sNv5uDMfmwxK3raM+cH3pGYI0BEJHdtYfg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CUoQ5N0vztTnfB+wvjtnTm9ORy20GLqFsKDQ57xjdcMx0fCzulrlDx/181Kmu4K/Vh0qzj6hgS/wG23mHbQCsYUBWGG1XiYhzyDNLgEcDr8sW5tntI3iLdU96K2gnS/F6rdAydu+iYujHZvL2Qwo2kqjdNzYilPdMb47zHXAQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=cG9x7+ym; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="cG9x7+ym"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68GAIIMC02290672, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789553899; bh=4L/FWPMwd/nyXs4AWRu2iAWc0eVwFTABk1HmN0cOkUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=cG9x7+ymdkz/Nti5qZ9JcSvUKraY0VBHRG4pc2pegilUNcuZ1S3P5sMdvUGlD3aSp
	 Pn1eJ9KHbqZD6KDVeuVkcf19cwNerFjGzPBf4A2r9kmtWn7TaExDVBe3LgOl9dyAsD
	 Btp+h3qUdUcRx6iaknwbKjz4mi4mJotIGuI7pnVblgQp3wyZAfltF4ynxRCOK+lvlO
	 NgNCyWX0TtxZFMqJhSK6aOJRGPeKJoJbdai4DbilufQkiGxBDexEEfKh8RnyEecnog
	 wD8ookv/Ejf3M5HgdqzgrfC2Z/hie/KiQS8xs5567XqW3XXbcJ4KvpJBuYDLfhtEnA
	 EqpGIHNmJkX7w==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68GAIIMC02290672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Sep 2026 18:18:19 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 16 Sep 2026 18:18:04 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 16 Sep 2026 18:18:04 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<shumingf@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>, Oder
 Chiou <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: rt721: Reset codec to fix abnormal sound
Date: Wed, 16 Sep 2026 18:18:03 +0800
Message-ID: <20260916101803.2301508-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The audio output may become abnormal after a warm reboot from Windows.
Reset the codec once during hardware initialization to restore it to a
known state and prevent the issue.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c |  3 +++
 sound/soc/codecs/rt721-sdca.c     | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index d0f3fc1978c3..0ebb5688f848 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -82,6 +82,7 @@ static bool rt721_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x0310100:
 	case 0x2000000 ... 0x2000003:
 	case 0x2000013:
+	case 0x2000026:
 	case 0x200002c:
 	case 0x200003c:
 	case 0x2000046:
@@ -154,6 +155,7 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x200000d:
 	case 0x2000019:
 	case 0x2000020:
+	case 0x2000026:
 	case 0x200002c:
 	case 0x2000030:
 	case 0x2000046:
@@ -167,6 +169,7 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x5810039:
 	case 0x5b10018:
 	case 0x5b10019:
+	case 0x6100006:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 0a936938385c..dbf61fa382a2 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -1538,6 +1538,15 @@ int rt721_sdca_init(struct device *dev, struct regmap *regmap,
 			&soc_sdca_dev_rt721, rt721_sdca_dai, ARRAY_SIZE(rt721_sdca_dai));
 }
 
+static void rt721_sdca_reset(struct rt721_sdca_priv *rt721)
+{
+	rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_VENDOR_REG,
+		RT721_VD_HIDDEN_CTRL, RT721_HIDDEN_REG_SW_RESET,
+		RT721_HIDDEN_REG_SW_RESET);
+	rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+		RT721_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
+}
+
 int rt721_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
@@ -1571,9 +1580,17 @@ int rt721_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 
 	pm_runtime_get_noresume(&slave->dev);
+
+	if (!rt721->first_hw_init)
+		rt721_sdca_reset(rt721);
+
 	rt721_sdca_dmic_preset(rt721);
 	rt721_sdca_amp_preset(rt721);
 	rt721_sdca_jack_preset(rt721);
+
+	if (rt721->hs_jack && (!rt721->first_hw_init))
+		rt721_sdca_jack_init(rt721);
+
 	if (rt721->first_hw_init) {
 		regcache_cache_bypass(rt721->regmap, false);
 		regcache_mark_dirty(rt721->regmap);
-- 
2.54.0

