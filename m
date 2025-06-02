Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232119CC0E
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854775; cv=none; b=FMubsT1UtruniNcp3b5wy1n7of1lb78UPSbe9l422jKK5UGnkQs1QI6wx+Ki2t6kCpy/c2+Hgb3u8y9yR6c5yHwL8mrbUUylRUZF3jrbiE3g6VREOO0qefCtLN62dLAUmxLsjl5AjPN7KpG9Dere1HTCyvxz1Pf8MJNrrlz0RAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854775; c=relaxed/simple;
	bh=/CfL7zRAm5M7s8JDGqaNfvadiCWkijryuRC0sOvo3DQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f0zhbZ1dYao7mOsuEB7VzXjKUWcg6559Gghpy0ApgTE9hyc8kAGIqQivTIL2I4wm1AepSly23zA5I0P+vrQQeXL8gcq42Hy4LHCVCBdmxmIqq+QhPBlthJ9j9UAthsKJQhQOcJ7DAPH3JQ2Fuk2duKTRkwfdchUa+8lHucQU18s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qrE+AbdX; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qrE+AbdX"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5528wtyU73827943, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1748854735; bh=tJDSuMafo1TVGCV5ad4RV960v3zIuEONc2dWwtMKdlA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=qrE+AbdXBn8fZgAfW3/cLJ81RxVvY2d9mH2mcV02F5svfnISj/qYXPacZ6ddLF+04
	 iiK69Sdl6sRypfFotgI4YBe5SCIqDwynP8MrhU53rJVS1DmtdiOQQTrlbF+MBAn8NN
	 YTFZBRwunWeq/tRjl8ElPTSIcATDljKUalkLE3zBMt+j1owTVcKZ69E7miRCVLMmFr
	 donpCSeT9C9DWw68ie7NhciFAe3IEC7cEggX4t6vyg14ndtX0GvdZZGTzaYzBE6XFo
	 pjXRHOYGvuIPxssBOiBEqvKGk5eHoBmQJFEA9XllugrZt2yNaiSWlXiUVM5eCS7G96
	 pl2ibsNgaMMKQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5528wtyU73827943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 16:58:55 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Jun 2025 16:58:56 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 2 Jun 2025 16:58:55 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320: fix speaker noise when volume bar is 100%
Date: Mon, 2 Jun 2025 16:58:51 +0800
Message-ID: <20250602085851.4081886-1-shumingf@realtek.com>
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

This patch updates the settings to fix the speaker noise.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index f51ba345a16e..015cc710e6dc 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -204,7 +204,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0x3fc2bfc0, 0x03 },
 	{ 0x0000d486, 0x43 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00 },
-	{ 0x1000db00, 0x04 },
+	{ 0x1000db00, 0x07 },
 	{ 0x1000db01, 0x00 },
 	{ 0x1000db02, 0x11 },
 	{ 0x1000db03, 0x00 },
@@ -225,6 +225,21 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0x1000db12, 0x00 },
 	{ 0x1000db13, 0x00 },
 	{ 0x1000db14, 0x45 },
+	{ 0x1000db15, 0x0d },
+	{ 0x1000db16, 0x01 },
+	{ 0x1000db17, 0x00 },
+	{ 0x1000db18, 0x00 },
+	{ 0x1000db19, 0xbf },
+	{ 0x1000db1a, 0x13 },
+	{ 0x1000db1b, 0x09 },
+	{ 0x1000db1c, 0x00 },
+	{ 0x1000db1d, 0x00 },
+	{ 0x1000db1e, 0x00 },
+	{ 0x1000db1f, 0x12 },
+	{ 0x1000db20, 0x09 },
+	{ 0x1000db21, 0x00 },
+	{ 0x1000db22, 0x00 },
+	{ 0x1000db23, 0x00 },
 	{ 0x0000d540, 0x01 },
 	{ 0x0000c081, 0xfc },
 	{ 0x0000f01e, 0x80 },
-- 
2.34.1

