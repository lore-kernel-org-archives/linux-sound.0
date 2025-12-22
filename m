Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C05D31AA81
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398351; cv=none; b=QbbvBPTwp9nU1ydbkn4uY4jSyzdL+Vs+vA4/cmOy07sOGhIqaL3AnhrQ0JLNSLxK1oUO1enalaYXEGVMz6F9QQjVwXdFDr72oje9GUDUJmRQ1fknK4tmIThBoITMhc/NePbQAHpk9AL3TnzWNlkMoRpYiZzrNNAc6C3ZfKqw/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398351; c=relaxed/simple;
	bh=ufxcb52H/NK7GuDdLTWoy8Es0WULZEbmj87CKtKzJvs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mHvmNsd35i1zDw+GtiSKJxxmMC4VPJGG7sefDb0TUHf8GmB0iP8UsHivvhF8sX7f6gtn7DHojchftw7Rb0QtluNBA9Sb4/LASVWMf+JcuEIOgZEoB9+jHG2zk9czplK/V89MTI36L0VlrHgKvQEHw3F+YQbna8T4V6BnBb+h8UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=iKvxjw6z; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="iKvxjw6z"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BMAC1SC03210221, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766398321; bh=WpOj35UvJg9kcbPrnbG1ItcPcjHfTshw8jDyuc3sKyA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=iKvxjw6z3LIIQW+rodTyb6pEYD5wNfDNjVPwe+A0A914vJ5BAyozFTbicy00fwEsX
	 +vNC914B2Hr7gxG6vDO5MT1d5KYRl8TwOXAR7WEVOQ622TQ3gFF3cUDiitg5kLKkEN
	 zHHeJLy0tu+SVRzCXGSH95rD3FCoUunhjBIjOqLLWVk42jSQySXmKnCJhpSZPlNL7J
	 NsrN13qbqdwORZ57DDW6bfQd2naOSEG9DP3Em+ecNjU/WWsm3O1HxGqWIIRLTv8D+N
	 /eeDm52L/7MrRqt182OqfthJ1B9XklB181mWFGMTKQg07dUsI0kCdF/x2NhxyUaJGX
	 BWa/K1qC8fyzA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BMAC1SC03210221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 18:12:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 18:12:02 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 18:12:01 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 22 Dec 2025 18:12:01 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: rt1320: fix the warning the string may be truncated
Date: Mon, 22 Dec 2025 18:13:29 +0800
Message-ID: <20251222101329.558973-1-shumingf@realtek.com>
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

1488 |                          "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
     |                                                 ^~             ~~~~~~
sound/soc/codecs/rt1320-sdw.c:1487:17: note: 'snprintf' output between 29 and 410 bytes into a destination of size 128
1487 |                 snprintf(filename, sizeof(filename),
     |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1488 |                          "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
     |

Fixes: da1682d5e8b5 ("ASoC: rt1320: support calibration and temperature/r0 loading")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512191521.RK0edKdX-lkp@intel.com/
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 9447e742c672..4c3756940ae2 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1435,7 +1435,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
 	char vendor[128], product[128], sku[128];
 	char *ptr_vendor, *ptr_product, *ptr_sku;
-	char rae_filename[128];
+	char rae_filename[512];
 	char tag[5];
 	int ret = 0;
 	int retry = 200;
@@ -1602,7 +1602,7 @@ struct rt1320_dspfwheader {
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
 	char vendor[128], product[128], sku[128];
 	char *ptr_vendor, *ptr_product, *ptr_sku;
-	char filename[128];
+	char filename[512];
 
 	switch (rt1320->dev_id) {
 	case RT1320_DEV_ID:
-- 
2.52.0

