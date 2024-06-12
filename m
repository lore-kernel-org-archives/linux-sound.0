Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232816C6BF
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179112; cv=none; b=VMYPcC7YsqgYrpbqudqowWDbSfTRrveqGgX4GF6MTYZSj3/sFgwrdMSa7P8jbma1VeZmIJkZq/s7uKO7bXz5AGEyX2JgWt1K258WaeEeq/UJaCYAjuixBQFyTMUORdcCyEvdWpStKS/afBJ4Fxs+i9/kuSyU59oXWyJ86AdSnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179112; c=relaxed/simple;
	bh=pLpMXZTOpsLZEB7ZuXiEpXMT22SPiKJMzs1MeHRrq+Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JjvO/MmmkWWI1oRVVKJAoyMjsyWH1yns1LG6EyOi+c9O/hMVaTrMegXeTGr7wSDKmhoDoez8EO2i7eI0LT6gOoZSAruS65dvp0oCsmn1rx7XAc9V5Vnp3ZR2FcQte2BRaVdqHnikQ96ta08NN2knzjFcNVyvHyOGiLtPiUx0avA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 45C7vnvK71073629, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 45C7vnvK71073629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 15:57:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 15:57:49 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 12 Jun 2024 15:57:48 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <pierre-louis.bossart@intel.com>,
        <bard.liao@intel.com>, <Deep.Harsora@Dell.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell SKU 0C64
Date: Wed, 12 Jun 2024 15:57:40 +0800
Message-ID: <20240612075740.1678082-1-shumingf@realtek.com>
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

Dell SKU 0C64 has a single rt1318 amplifier.
The prefix name of control still needs to be set rt1318-1 corresponding to UCM config.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 48252fa9e39e..8e0ae3635a35 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -293,7 +293,7 @@ static const struct snd_soc_acpi_adr_device rt1318_1_single_adr[] = {
 		.adr = 0x000130025D131801,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
-		.name_prefix = "rt1318"
+		.name_prefix = "rt1318-1"
 	}
 };
 
-- 
2.34.1

