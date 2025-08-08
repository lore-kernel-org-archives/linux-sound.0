Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61841361
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754632667; cv=none; b=a9are3k5vDl90HhudcGIZH5cOPHbjame4c6sriAwT5ziL00FnluF4R2v7sJGmG3CqeONQplHWvTX+8j+Y53HrmRym+WL6OJkkl/iqQLe1OIckC3M5FFu2zc5/NnRIw7qms4MBDya9DPUMGVfVp46Z7uCPB2G5zcrS5MbUcEfq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754632667; c=relaxed/simple;
	bh=9QfsTMWWC0hFGq5OKp/4Qzk09X3J2oKc29t2odNFe9E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VuWwdYb0XJDsJ8XfKuUfTbI1GF6vIOWDOW0K8Tl9WBKJ27R69gaVg4v8Kb6g12rnVpwnLiBlwpyu0QDRMthcl09g/ZKrK5PlXOP4C0EkBFuiYwOaFsZLoI9fTxkTuEj49pQA3SGa45INroAemOCG/F5jhVXrkW7DAHSPQf8UEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ruVdcB4r; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ruVdcB4r"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5785vN6N12762480, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1754632643; bh=3MQBZsWchZ0dwpiibuo1NVeEkf5rvGWoYjD9FBcKXlk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ruVdcB4rFpZS31sLP/4TpyDnXL7ns1mDmYugF+rF1CEWIGIQ2eg5FxvLxN3N+wtlU
	 KVkG1zwirejvkc7yt9khtSdNuxrkcaquatWZpcXSXkOGW3UtpWvmSpQ4VSoW5OMDap
	 MBBiZQxE+wm3ywv9yMsWStB+7XU3U6l/4V85ACzxwDG8OZcXq0GRCERgGvEpgIfYqN
	 7REl+VZ0zjoPpQgEURbfFx2V23qWNBH5ps6YnqFwpLe6ja4hKJEgvUwUt1Hu6jUdBr
	 dYTsDAbxsc4kAeLOjTIDFHTvb31OwjAdjGUljsP7J7ysQzs+oFkEa0jXgsk+m5ekOD
	 GzJp4jqZeZzZg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5785vN6N12762480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Aug 2025 13:57:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Aug 2025 13:57:23 +0800
Received: from sw-server.localdomain (172.24.54.4) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 8 Aug
 2025 13:57:22 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/2] ASoC: rt721: add some vendor registers
Date: Fri, 8 Aug 2025 13:57:19 +0800
Message-ID: <20250808055719.1110808-1-shumingf@realtek.com>
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

This patch added some vendor registers to read for debugging.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 582b47d69278..4d8a12b13015 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -63,15 +63,14 @@ static bool rt721_sdca_volatile_register(struct device *dev, unsigned int reg)
 static bool rt721_sdca_mbq_readable_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
-	case 0x0900007:
+	case 0x0900004 ... 0x0900009:
 	case 0x0a00005:
 	case 0x0c00005:
 	case 0x0d00014:
 	case 0x0310100:
-	case 0x2000001:
-	case 0x2000002:
-	case 0x2000003:
+	case 0x2000000 ... 0x2000003:
 	case 0x2000013:
+	case 0x200002c:
 	case 0x200003c:
 	case 0x2000046:
 	case 0x5810000:
@@ -134,6 +133,8 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 {
 	switch (reg) {
 	case 0x0310100:
+	case 0x0900005:
+	case 0x0900009:
 	case 0x0a00005:
 	case 0x0c00005:
 	case 0x0d00014:
@@ -141,6 +142,7 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x200000d:
 	case 0x2000019:
 	case 0x2000020:
+	case 0x200002c:
 	case 0x2000030:
 	case 0x2000046:
 	case 0x2000067:
-- 
2.34.1

