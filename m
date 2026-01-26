Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6039262A6
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769404711; cv=none; b=DaMD3SnCsYYSFvWYsUWqO9Hh+5o0zICJRcuXOpIqAiZPl0bjQ/I93D7ntVe1j/57Rjb+76L8S6SfxfMuPuZBwNZ4bl38uEklOsBw01ET+IAP2Z/HKJ3zQYCs9JpYG2a+ZhFJCfye6v5P6xCS4egdjzvlDuaxE1xvjWgL1qmvi4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769404711; c=relaxed/simple;
	bh=EwDyQEBWH7Lj2YSwoydZagVuZ2XkqaR2vbQOOfhnuAc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iHjHQTkjS4tWWy9ha+kUVcgeoRZBY8fV1iaiHHqqzHZLowMFMJoR2uCGa0MQjivrrk6ns58XHUOkNKFQwJP/5FKPGXeC+LRTx9pdsvcHRiBSFN7BpWLXjkVXX4NbrtsVk0R2POYcmbeDLtHnueHExZ7RP+hyN+4KHmNCbhZq27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ad+Dbfmv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ad+Dbfmv"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60Q5I0sfC237835, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769404680; bh=slWJu1nje1vfZUmKxXjfJUrxNTXKoPSKj6VR26488EI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ad+Dbfmv8XefPpp9QkTIBW3u9zK+3w7JiQ50D/lDQjRoy8pP6+qm5xdEQGkf8ihVZ
	 Edi3syNiielnnrMbJV6Os2dDc8hZxc2fPXpA7/XJELxZgQfLIzBual/J3OGrxulahL
	 z6UbB75oAS5U7fdSRkxs7XmEZvzoT2N70QAYRMj+iWL0duNhbG/3NJQcc9vBzgiEMh
	 dfm2ahSkwOzLAN1qdyR/v9w5IVi38SOjLRJ2Gl3aKalDg9ycApJpHamoz4t8M/Twhv
	 Rvac3vWGaV9WuTWsFWOLvlDBovPrDn0RsMYa8XRjUjINxFKMvkHqhLwM2ZXL4m91Yq
	 eNl1RemyoZ1zg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60Q5I0sfC237835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jan 2026 13:18:00 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 26 Jan 2026 13:18:00 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 26 Jan 2026 13:17:59 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 26 Jan 2026 13:17:59 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
        "kernel test
 robot" <lkp@intel.com>
Subject: [PATCH] ASoC: rt5575: Fix undefined references to SPI functions
Date: Mon, 26 Jan 2026 13:17:58 +0800
Message-ID: <20260126051758.3728312-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The kernel test robot reported the following build errors:

   sparc64-linux-ld: sound/soc/codecs/rt5575.o: in function
`rt5575_fw_load_by_spi':
>> rt5575.c:(.text+0x254): undefined reference to
`rt5575_spi_get_device'
>> sparc64-linux-ld: rt5575.c:(.text+0x2c0): undefined reference to
`rt5575_spi_fw_load'

This happens because SND_SOC_RT5575_SPI is defined as a tristate. It
allows a configuration where the main driver (SND_SOC_RT5575) is
built-in (=y), but the SPI support is compiled as a module (=m). Since
the main driver calls symbols defined in the SPI support code, the
linker fails to resolve them.

To fix this, change SND_SOC_RT5575_SPI to a bool. This ensures that the
SPI support code is always linked into the main driver object,
preventing the symbol visibility issue. Also remove the redundant
dependency on I2C.

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202601250010.EUnVkmCH-lkp@intel.com/
Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d09de0ff5f22..ccdb3d0c2415 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1807,8 +1807,8 @@ config SND_SOC_RT5575
 	depends on I2C
 
 config SND_SOC_RT5575_SPI
-	tristate "Realtek ALC5575 Codec - SPI"
-	depends on SPI_MASTER && I2C
+	bool "Realtek ALC5575 Codec - SPI"
+	depends on SPI_MASTER
 	depends on SND_SOC_RT5575
 
 config SND_SOC_RT5616
-- 
2.52.0

