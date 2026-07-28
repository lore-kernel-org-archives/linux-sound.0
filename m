Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9D3F58CE
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229309; cv=none; b=D07L84Lkuf+SG4WEEpykDL75PjymeuefydlOe/mME0+VdrnZ07JLTgxXoxUKc/7lALFDHqhQaSahcoBdO97ltxcRhPFxIV4w0Y7nKwZV1UXNgRftjXbPA0xtlfZ+n+sB2/asHgdSZN99JgkiDEmGBOBZ0jsXc4SyG8ceJtdKTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229309; c=relaxed/simple;
	bh=6f6nKYc/6lltd3M3Akhq6kcdA8VmsUuvlM/DlESB+wE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RhI1Ol9yojgUD3P7MCxjiifTYb6XzylYbeCCN2maXokH+mh/W/7JiGB7XjVZQhqPG7Ad2BiyfAtKxa5aHcKcViR04C6kcE0h09z6ivyIjnOQN0OMBYM75oMc8Y9kww79d6Nb5CMs0OIEekBx3VD5s9Q9WfzeS23nFc3uwhjTsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=PYl0zTos; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="PYl0zTos"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66S91HrlC3752586, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785229277; bh=J0gNHsKdjY+yheDPPX1pBsZ6n6qXyo4PJmuE1+faY38=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=PYl0zTosJuM9heTUYP1+3d3MC9XjTgrBDW1IbBNCiFT32JNXDH3QTmponnzkeANZl
	 u+Y6COXsyA530zwI1I8aKS36vmTo+9jquwOFDNACryWPpPmQ6KfRIAaQxVvGZlN9pq
	 /gFNPi8ML40RlUStUmXKkkLB1bO4Iqbg0Oim1EaAOX5F3CcW88shZhiCY5Igi3rfFZ
	 yfQi9/6UBQNwiZu1s6cWdtkgJnK2IM+5mV+4UM5EbrSh8r5lNm4g4o9wV8fENfm8dS
	 5J3tpDK+m9uXxzJwqGMiRRMeyyeiuOlMmHtpmOho1buSkBljpMUqWxaVXbST8CcxYR
	 fA7cN25UrYKNQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66S91HrlC3752586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jul 2026 17:01:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 17:01:17 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Tue, 28 Jul 2026 17:01:16 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: reset codec to fix abnormal sound
Date: Tue, 28 Jul 2026 17:01:11 +0800
Message-ID: <20260728090111.3676617-1-shumingf@realtek.com>
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

The audio output may become abnormal after a warm reboot from Windows.
Reset the codec once during hardware initialization to restore it to a known
state and prevent the issue.
BugLink: https://github.com/thesofproject/linux/issues/5845

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c |  4 ++++
 sound/soc/codecs/rt722-sdca.c     | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 05e8e23f1f43..5bc9aed58d14 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -114,6 +114,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 	case 0x2000090 ... 0x2000094:
 	case 0x20000b1:
 	case 0x20000b4:
+	case 0x3010000:
 	case 0x3110000:
 	case 0x5300000 ... 0x5300300:
 	case 0x5400002:
@@ -197,15 +198,18 @@ static bool rt722_sdca_volatile_register(struct device *dev, unsigned int reg)
 	case 0x2000007:
 	case 0x200000d:
 	case 0x2000019:
+	case 0x200001a:
 	case 0x2000020:
 	case 0x2000030:
 	case 0x2000046:
 	case 0x2000067:
 	case 0x2000084:
 	case 0x2000086:
+	case 0x3010000:
 	case 0x3110000:
 	case 0x5800003:
 	case 0x5810000:
+	case 0x6100008:
 	case 0x44011000 ... 0x440115ff:
 	case 0x44012000:
 	case 0x44012021:
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index decf9407ab6d..a26253864d48 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1851,6 +1851,17 @@ static void rt722_sdca_jack_preset(struct rt722_sdca_priv *rt722)
 	}
 }
 
+static void rt722_sdca_reset(struct rt722_sdca_priv *rt722)
+{
+	rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
+		RT722_LDO1_CTL, RT722_HIDDEN_REG_SW_RESET,
+		RT722_HIDDEN_REG_SW_RESET);
+	rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
+		RT722_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
+	if (rt722->hw_vid == RT722_VA)
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_LDO1_CTL, 0xb091);
+}
+
 int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
@@ -1888,6 +1899,9 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt722->hw_vid = (val & 0x0f00) >> 8;
 	dev_dbg(&slave->dev, "%s hw_vid=0x%x\n", __func__, rt722->hw_vid);
 
+	if (!rt722->first_hw_init)
+		rt722_sdca_reset(rt722);
+
 	rt722_sdca_dmic_preset(rt722);
 	rt722_sdca_amp_preset(rt722);
 	rt722_sdca_jack_preset(rt722);
-- 
2.54.0

