Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE92F3622
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875897; cv=none; b=F0mbEj5Ht48KjBFOlWjbTtaELaNCAhzy1LFef6q+8invW9wUcI5AAheMEP8Kt9vwD2L63ap+lBaTdx/bA8l5a0qmkUnkF2Cd7zlTzOn5icoy9dKn2W8+2exwf8CX0vc4Zfn/ypFBDk04piCTycIqFL6wJRFZM8Gx4W08HBzTtf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875897; c=relaxed/simple;
	bh=LLD+YZ+SNkJCj/qsOPZBfuyDB1b8Uu4CsDMnCVvOZrs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NZPx6R66N8T4sw051OzlqeL0wCV0/gWCFgXP6Ht+JxhrR0mBoC2ZP8+/1UkuAShMifPZ1q+I51t1H8pNMTlBiaQAy3+iEZvtdkkvu+KugU1d5h4xfTjJLXrr/6A4d9y2NkTqSW74tTIgnaTnVyGjhiPs4l9Pgw6puYTLgcmaHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=t+uHIfq7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="t+uHIfq7"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BG94Va043635980, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765875871; bh=rRznuiect7Zlz08NCh4raxJAVQU6gR6WythnuN262EU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=t+uHIfq7u4I4J4VkQZCxdqQyvv0Y2hSeD5AxFRqjpJbFeAoewc7/rANyXIzbebGU2
	 K6dg4hT6YkcTqAHN2ID33CAgAJwZNPr7LKn9mfel6niV+EiL5hy/eyOzTofP/5yV9n
	 S8zw4Q8fouwpW0rVrFvu/OceNvFxPhqWpmSTeYh8H5na+lWUaCgTV/kBzWeTeFK3Zm
	 RW4oe5IcxbmtCW68PxPOESeDk+vClNyu9GB22XewoDEoUEZOVZAKIzeOkNrQvNSq+R
	 jGZsdzUy6CJ3VTuOsnlHSyh2aTym9OLfbiU74h77CwVVBz1ll43niV/9eYqGLc/EWW
	 eO5x73003cVMQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BG94Va043635980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 17:04:31 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 17:04:31 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 16 Dec 2025 17:04:31 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/3] ASoC: rt1320: update VC blind write settings
Date: Tue, 16 Dec 2025 17:06:01 +0800
Message-ID: <20251216090601.3955252-1-shumingf@realtek.com>
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

This patch updates blind write settings for VC version.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index e3f9b03df3aa..feecef258b65 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -115,7 +115,8 @@ static const struct reg_sequence rt1320_blind_write[] = {
 static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0xc003, 0xe0 },
 	{ 0xe80a, 0x01 },
-	{ 0xc5c3, 0xf3 },
+	{ 0xc5c3, 0xf2 },
+	{ 0xc5c8, 0x03 },
 	{ 0xc057, 0x51 },
 	{ 0xc054, 0x35 },
 	{ 0xca05, 0xd6 },
@@ -126,8 +127,6 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0xc609, 0x40 },
 	{ 0xc046, 0xff },
 	{ 0xc045, 0xff },
-	{ 0xda81, 0x14 },
-	{ 0xda8d, 0x14 },
 	{ 0xc044, 0xff },
 	{ 0xc043, 0xff },
 	{ 0xc042, 0xff },
@@ -136,8 +135,8 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0xcc10, 0x01 },
 	{ 0xc700, 0xf0 },
 	{ 0xc701, 0x13 },
-	{ 0xc901, 0x09 },
-	{ 0xc900, 0xd0 },
+	{ 0xc901, 0x04 },
+	{ 0xc900, 0x73 },
 	{ 0xde03, 0x05 },
 	{ 0xdd0b, 0x0d },
 	{ 0xdd0a, 0xff },
@@ -153,6 +152,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0xf082, 0xff },
 	{ 0xf081, 0xff },
 	{ 0xf080, 0xff },
+	{ 0xe801, 0x01 },
 	{ 0xe802, 0xf8 },
 	{ 0xe803, 0xbe },
 	{ 0xc003, 0xc0 },
@@ -202,7 +202,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0x3fc2bfc3, 0x00 },
 	{ 0x3fc2bfc2, 0x00 },
 	{ 0x3fc2bfc1, 0x00 },
-	{ 0x3fc2bfc0, 0x03 },
+	{ 0x3fc2bfc0, 0x07 },
 	{ 0x0000d486, 0x43 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00 },
 	{ 0x1000db00, 0x07 },
@@ -241,9 +241,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0x1000db21, 0x00 },
 	{ 0x1000db22, 0x00 },
 	{ 0x1000db23, 0x00 },
-	{ 0x0000d540, 0x01 },
-	{ 0x0000c081, 0xfc },
-	{ 0x0000f01e, 0x80 },
+	{ 0x0000d540, 0x21 },
 	{ 0xc01b, 0xfc },
 	{ 0xc5d1, 0x89 },
 	{ 0xc5d8, 0x0a },
-- 
2.52.0

