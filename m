Received: from RTEXH36506.realtek.com.tw (unknown [122.146.120.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D727FB34
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=122.146.120.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074566; cv=none; b=Kb8RYvwc6TEXKlWEHY/hB8mxh8svQc6C+soLeHS3242h9T7PrRohz7oDl0ntbAKJjH9ZjeEW0iWwEDDPpEVsym/Kjiy4q07dpFJqbIl60n7US501yI4cFHNAc3LgsQhF60ajxvhPF3pnEp8AhvDDJ7m22VWsszttSwrw4s/rstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074566; c=relaxed/simple;
	bh=XliCIADOzm8CqKR9rx4CzMtBhb/GokGmlNgEES+geC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L8HRaMQp9yu8IIczwpnxOBvZ/XLqPjpxwnHuCm+MEJcDVntTvFAN10VPmwVTguREP6Von0tW3mTZSpMEGCfkAk9dDupWA73Y/dIcchYq2X+pGjpnCxWCrNKXzMvg06wh/tLDjM6LJEFubter32qv2iHlndhp4auGkyAHJkQjoQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=122.146.120.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 19:49:24 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 16 Jun 2025 19:49:18 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <jikos@kernel.org>,
	<bentiss@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<ckeepax@opensource.cirrus.com>, <bard.liao@intel.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH v2 2/3] HID: core: Add bus define for SoundWire bus
Date: Mon, 16 Jun 2025 19:49:07 +0800
Message-ID: <20250616114907.855452-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Charles Keepax <ckeepax@opensource.cirrus.com>

SDCA (SoundWire Device Class for Audio) uses HID to convey
input events from peripheral devices. Add a bus define for the
SoundWire bus to prepare support for this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/hid/hid-core.c     | 3 +++
 include/uapi/linux/input.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314..b419e31005b8 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2294,6 +2294,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SDW:
+		bus = "SOUNDWIRE";
+		break;
 	case BUS_VIRTUAL:
 		bus = "VIRTUAL";
 		break;
diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 2557eb7b0561..127119c287cf 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -275,6 +275,7 @@ struct input_mask {
 #define BUS_CEC			0x1E
 #define BUS_INTEL_ISHTP		0x1F
 #define BUS_AMD_SFH		0x20
+#define BUS_SDW			0x21
 
 /*
  * MT_TOOL types
-- 
2.34.1

