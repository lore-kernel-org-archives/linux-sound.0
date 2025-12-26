Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AA135A53
	for <linux-sound@vger.kernel.org>; Fri, 26 Dec 2025 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766731327; cv=none; b=Z21JPUHUDcBeObF11wyFGJgtZzU1gxusDI8BuaCsjREhA8hBRgSd3Jyo0EvBe2DSQwVtAQqmBK6xHyH7m+WzT1v4aIqu6NWziD1PCxHTLpQnNcTOljj/tL3arP6hpVoAVSoK0fglgXGO0wLLHLbhW3OqoLekBHyZ7ONYrWJEjJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766731327; c=relaxed/simple;
	bh=BP4SPaz8Z7c0cMkQONYmf1CUF4HVVPO81M0x/cMwKkc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tdj8NCwGjrZFdAz+MqBGzJIDvy+lQ6GaOGXYKXP5OZOB/FAhtgcdX9SJo/mFw2BNR2Plbz5yg+tNBgp6BDwVo+X8TY05snVwhKP9QcYNRVEJeuQMXQ4K9rSXe+mr1PSOY4nippUYCeEefjPAk3mY9VSqk8omGZfz0IjqNhlXBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=m5o7vjHQ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="m5o7vjHQ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BQ6fU9x93153701, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766731290; bh=Zf4AJj0x+hGPzWvezfW5xlSSWFIUVLlpgyutPJ/t7DY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=m5o7vjHQSWbKZTWBH5lrHBtkPgLhfwdB3LuQ5u0CSSK//DGWbcL46DRWklmCw3Nof
	 M3/FA1Z8ijxmltptXIAvhH7ntG41a7MFQAxUaeDCNpTDrU5pWuIg0nbxiKsEyTGH5O
	 jfAsjxagu/+YVuftBEr0h3jh/MtHCXk0y07S/FXJAfVevZJJWajEogIteBVlu2bkOW
	 wJXUsJANJbracQ7SnAfG8ozMxSOUCY33LWHlxbNXwC+3kY6GXZgmqF6dzL4xZwKx+/
	 Og5X9tnJ2XfgxxRuZ324vKhmCKmOXxV+g54AzAwqH1Go/579QhRX5Ops4NrfHEK2Zs
	 xTBHSPQmqgHJw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BQ6fU9x93153701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Dec 2025 14:41:30 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 26 Dec 2025 14:41:31 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 26 Dec 2025 14:41:30 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 26 Dec 2025 14:41:30 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <arnd@arndb.de>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320: fix the remainder calculation of r0 value
Date: Fri, 26 Dec 2025 14:42:55 +0800
Message-ID: <20251226064255.993735-1-shumingf@realtek.com>
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

This patch fixes the remainder calculation of r0 value.

Fixes: 836ecc740ca8 ("ASoC: rt1320: fix 32-bit link failure")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index c5ea8c98e1fd..0d54ed754bd2 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1091,8 +1091,8 @@ static void rt1320_calc_r0(struct rt1320_sdw_priv *rt1320)
 
 	l_calir0 = rt1320->r0_l_reg >> 27;
 	r_calir0 = rt1320->r0_r_reg >> 27;
-	l_calir0_lo = (rt1320->r0_l_reg & ((1ull << 27) - 1) * 1000) >> 27;
-	r_calir0_lo = (rt1320->r0_r_reg & ((1ull << 27) - 1) * 1000) >> 27;
+	l_calir0_lo = ((rt1320->r0_l_reg & ((1ull << 27) - 1)) * 1000) >> 27;
+	r_calir0_lo = ((rt1320->r0_r_reg & ((1ull << 27) - 1)) * 1000) >> 27;
 
 	dev_dbg(dev, "%s, l_calir0=%lld.%03lld ohm, r_calir0=%lld.%03lld ohm\n", __func__,
 		l_calir0, l_calir0_lo, r_calir0, r_calir0_lo);
-- 
2.52.0

