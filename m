Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6162FFDE3
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717133; cv=none; b=dZArRFzR9Dj5SfYNTub1B54sMCIYh/sDvvKHXEEJFQT5IQkS6p9t6gyhWD/BFMXlB5URMLT8jGj1KD/iy42mNH1FR1XyKo+hDhejhBxDZnGoz4PVWh3VxYXsMZ87lpKRSZqBryXuqr2XCKwh43ZRYVYFb+ZPws+oF4OP+lZwZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717133; c=relaxed/simple;
	bh=xsx4VyU9xOxGUJknmUmlfucM5tZVsPD5k/KG6ZMqmcU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ls8GyF2HQyTZp0xKBkAIt+f7xkT2RJrP7U8DXtEE7qyF8nvGboWywb6fpmG/uy/knVsmnbqg6cPj7vYEpH+tlp+n5zh5ikXs+gK+cstk0WIwyxm/HfPfGLKM4mr7aWAA3ipScDL1SwCu6O8XnvV2DQoZoYjacFAh0Sw1dmoXYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=sOZRstDm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="sOZRstDm"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5818wDFO1633970, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1756717093; bh=9x8sST39J1o3D/0ldtJhDbwANiC2FjsTYwbjjiWNAJA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=sOZRstDmt8XXBz1/04HpvmFizPVyvYLVEEV0o/vkeo78qbaA4QtLk2QRFcSJHOuQp
	 ZxpC1LTWbjNKZJnjCMY9YHc7tj79ZmWt57gmx1NNEE35nrUH0Mj33GrzdjgnDFMEsN
	 4klJsLbQLgiWcpzGuF8MOA2YqgUC/xZADfKQKxHNl2yd7qtRBhAKRzhdssJzGJXRsL
	 EwwKeQfZ0HPF5pr67TEfEUM6DxpS8lThGzKJhrp//7l3tJlqWpMC0NvkGqsGFTk4Gx
	 b7gUVW1h2UP+q7ab3AZcfGBpLaeNQWO00X+NWRA48RGGGYNNeXXoIobPl3qBJ4jUVq
	 UWbeb3Bpl47UA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5818wDFO1633970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Sep 2025 16:58:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 1 Sep 2025 16:58:13 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 1 Sep 2025 16:58:12 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712: avoid skipping the blind write
Date: Mon, 1 Sep 2025 16:57:57 +0800
Message-ID: <20250901085757.1287945-1-shumingf@realtek.com>
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
 RTKEXHMBS06.realtek.com.tw (10.21.1.56)

From: Shuming Fan <shumingf@realtek.com>

Some devices might not use the DMIC function of the RT712VB.
Therefore, this patch avoids skipping the blind write with RT712VB.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 5b298db5f0f6..0ebaae426e73 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1890,11 +1890,9 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 		rt712_sdca_va_io_init(rt712);
 	} else {
-		if (!rt712->dmic_function_found) {
-			dev_err(&slave->dev, "%s RT712 VB detected but no SMART_MIC function exposed in ACPI\n",
+		if (!rt712->dmic_function_found)
+			dev_warn(&slave->dev, "%s RT712 VB detected but no SMART_MIC function exposed in ACPI\n",
 				__func__);
-			goto suspend;
-		}
 
 		/* multilanes and DMIC are supported by rt712vb */
 		prop->lane_control_support = true;
-- 
2.34.1

