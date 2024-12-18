Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FF194A7C
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513235; cv=none; b=UYUwR3cq/nJx3vcvXzmC7AIhiU102fEI+1fWLZBuIycYRChudFw1JuGfm5/nSd3IApBWn71CjtzsPPsN31qtfPihIFvt4LM2zjKbDYFqnAO+MC/GQhVm46c5uWBP5Rs7V1xZJ09QqdLrbzzQNff4HnoYxKuH/ch+bbAsIv0BiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513235; c=relaxed/simple;
	bh=V6YrXYzUcF24p/xD0nWnung/1KX4UYWqDtoG0fP/VOc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EDBWcEVCRRp2m3iSCAzyzoCdWRBQDr/M3DrjOw/rlpRdmbwcdoSB7vgjNtT1ZkERRvclUkyIdVmlqeDt6yYrcT2IRsUuP4rboB945DIi6ZpCaj3psqtA4BaCfth4h0hwsCkjDwC7LamJowRYTkEYw3cVuX4LjFsPsSzZBqBDVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=M9dEDr2w; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="M9dEDr2w"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BI9DDsA42041881, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1734513193; bh=V6YrXYzUcF24p/xD0nWnung/1KX4UYWqDtoG0fP/VOc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=M9dEDr2woUVY0A+0D16/195yL6FsMloQOVh5J/oA2oOAqWJ4CSxQGKrv2MIKKXHVd
	 QpJ0y78X/szzZh8rzHorYkWht3T60vDkLcrRqs97bSkd/6GajqWO9PVNlPRTYGCnwe
	 FWhqf7Zg+msptr8LTHV2bP50xwhk+ByC6x3diHiikPnKpR9604K/JLUTychoZz+qAd
	 8GQRvzGKFx7yuguzVgChD7Sf8ZXNjun8cmu7kdXegjCtW+7zWDLZN34iRTV0HhmthU
	 BRbwWLSFveGbZXPJk+iGWHWMP7vRxNfNE/TlRWVcmkdrRYr9vCd/uRk/itK7YiPJgj
	 /+YchuZLEpSwQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BI9DDsA42041881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 17:13:13 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Dec 2024 17:13:13 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 18 Dec 2024 17:13:13 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: add delay time to wait for the calibration procedure
Date: Wed, 18 Dec 2024 17:13:07 +0800
Message-ID: <20241218091307.96656-1-shumingf@realtek.com>
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

From: Shuming Fan <shumingf@realtek.com>

The calibration procedure needs some time to finish.
This patch adds the delay time to ensure the calibration procedure is completed correctly.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 908846e994df..e17a142d03b9 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1468,13 +1468,18 @@ static void rt722_sdca_jack_preset(struct rt722_sdca_priv *rt722)
 		0x008d);
 	/* check HP calibration FSM status */
 	for (loop_check = 0; loop_check < chk_cnt; loop_check++) {
+		usleep_range(10000, 11000);
 		ret = rt722_sdca_index_read(rt722, RT722_VENDOR_CALI,
 			RT722_DAC_DC_CALI_CTL3, &calib_status);
-		if (ret < 0 || loop_check == chk_cnt)
+		if (ret < 0)
 			dev_dbg(&rt722->slave->dev, "calibration failed!, ret=%d\n", ret);
 		if ((calib_status & 0x0040) == 0x0)
 			break;
 	}
+
+	if (loop_check == chk_cnt)
+		dev_dbg(&rt722->slave->dev, "%s, calibration time-out!\n", __func__);
+
 	/* Set ADC09 power entity floating control */
 	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ADC0A_08_PDE_FLOAT_CTL,
 		0x2a12);
-- 
2.34.1

