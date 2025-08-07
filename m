Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5382AD00
	for <linux-sound@vger.kernel.org>; Thu,  7 Aug 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754558715; cv=none; b=PAoaRCWZIrLR1vE/D9f+TldaXqcWCeAl5QEzcWykaabKOq/IAzmrl4+CVM+qciY02NLFTRrmrmZgdZrEg01/xCe/Ub81QqKe4+8Qr+QyJ7fM0RUQaPtdVKYHRFzf1cSElZ8Gp991yPGfIWIRviKHmBsLJkjInbiSxHIYdlbrs1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754558715; c=relaxed/simple;
	bh=c5h7l2bLjwtNCY8IhHPVwcAwDvaZ4bAJwDAmSylKDsg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qCeuvn39fMc5m2DVes3y3orSAh0WuoStzccL/sYAjX6c96mY/isWaWJMUlaK/97ffOu7csyhyD/yLia9GFlOQUMIwqspJFfZ6jbUmM3vi+FAUNApzxqEm/UMcr+qmsTsIXQ9zUQeCozZ2w7am84ZU5mMwvi6+zjVFu1DYzXItlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=HvNHwCmW; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="HvNHwCmW"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5779ObC621211660, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1754558677; bh=updZFJywwyR3rAOXZ1Vo6jXhkTCIiLqFUh3W3Yhiglg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=HvNHwCmW43VOGjiq2B9UOtXh25ZXFHc9+g91aHW2r/mWIQRckOib9fuqavAls5UwF
	 tAR13c+t4Rmv/By0qwbU17WkOm0I+Dzf3OPQLncwTGXgwGRhG/oI+CBKkyNMejOo39
	 dC1zxv2XTE27JAhjTGDELnTGBj5BsrYK7lO0A5OrUUhpBAHeNO8+Nb+A8YWUCNT+2Z
	 fD+VEyhr2mgyLHgt4Q1IQimD6CoBzIhrLucoi5qJG/PFUJ+J4ljgJOVXAhrzMib1tn
	 nziUs8ZLDVxbMiGgVkhvTcOXy1nvmZ+PCzDF3NgY2MSw/kFh1biPebh7dsPjGA5Hd3
	 xE01/eb3nNmbw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5779ObC621211660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 17:24:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Aug 2025 17:24:38 +0800
Received: from sw-server.localdomain (172.24.54.4) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 7 Aug
 2025 17:24:37 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320: fix random cycle mute issue
Date: Thu, 7 Aug 2025 17:24:32 +0800
Message-ID: <20250807092432.997989-1-shumingf@realtek.com>
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

This patch fixed the random cycle mute issue that occurs during long-time playback.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index b13d7a99bf63..dcddc28e8856 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -109,6 +109,7 @@ static const struct reg_sequence rt1320_blind_write[] = {
 	{ 0x0000d540, 0x01 },
 	{ 0xd172, 0x2a },
 	{ 0xc5d6, 0x01 },
+	{ 0xd478, 0xff },
 };
 
 static const struct reg_sequence rt1320_vc_blind_write[] = {
@@ -159,7 +160,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0xd471, 0x3a },
 	{ 0xd474, 0x11 },
 	{ 0xd475, 0x32 },
-	{ 0xd478, 0x64 },
+	{ 0xd478, 0xff },
 	{ 0xd479, 0x20 },
 	{ 0xd47a, 0x10 },
 	{ 0xd47c, 0xff },
-- 
2.34.1

