Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FC91BD4F6
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727767153; cv=none; b=MrOMnsZF11eFZ8S4uBKHDyhX6FNb1kMR22KzZR71QnuT+VYqFfMCCbrYG6xnD4a3esXVe42p8+qcOJPfOG+tWIT49Ts4/BFxEa9Dbb1jCFlRe1RxiZT5IN/JsYqz8Sh6WiO+KGKi4IEOHdy4tl1HtJjHT+8NViN31iOofDEkwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727767153; c=relaxed/simple;
	bh=1Af+cMxBkXLSjAoAnEDCDYH4cQKcjE5YLO0S+GT0bhU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPruTnangODI7NLFtWVbVL/gUukhe+IpMblba38NnW+VViYc4nwBnt5KVW2QItnVpiV/JoUIon1liPCRNQWSUSwx5+xLSnWwbKd/RiqlySfAYnpl9plN0XvdAPLa2f9MgPOAXYLLU9OFSafqcyH+AyMtgE5S3X1sV429f+mKci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=gKXqFarp; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="gKXqFarp"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4917IeEeA673088, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1727767120; bh=1Af+cMxBkXLSjAoAnEDCDYH4cQKcjE5YLO0S+GT0bhU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=gKXqFarpQNSLTfz6yAwQejP3OuHWUelI/6HbYtLFP0hwxj4ku/wjqFXpyj5HiTZoQ
	 242SmvKUhqYiyHW5X17fonugTbcob1kW7Gnb/jZK+ZZyyTWxpJrRjPAiy9s4u8/3p/
	 mMCydfs+/NKRR+K0Ze/D0XcfYHLUMH2rjRA85hL5tV31eO/Bk9QlEuSj8lJE2Uj5Zj
	 cCQJ3kztWAf9hSYBPmKOOzq3m3QGBe2NuhDpqaXpbWLyVIDeVrhQFz6KmpVDdMVqHe
	 WBqs2tnaRg9vJ7dli/2cEwispOYJHv3jyuaWl27j+afuJeCvM/oZM/4prd7yOiCKYK
	 utcHAfDh32kEQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 4917IeEeA673088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 15:18:40 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 15:18:41 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 1 Oct 2024 15:18:40 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: rt1320: fix the range of patch code address
Date: Tue, 1 Oct 2024 15:18:36 +0800
Message-ID: <20241001071836.3719162-1-shumingf@realtek.com>
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

>> sound/soc/codecs/rt1320-sdw.c:564:14:
warning: result of comparison of constant 4295491583 with expression of type 'unsigned int' is always false
[-Wtautological-constant-out-of-range-compare]
     564 |                                 if (addr > 0x10007ffff || addr < 0x10007000) {
         |                                     ~~~~ ^ ~~~~~~~~~~~
   1 warning generated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410011159.InLKFd40-lkp@intel.com/
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 2404de8ae03d..ebd6f09bd990 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -561,7 +561,7 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 				val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
 					(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
 
-				if (addr > 0x10007ffff || addr < 0x10007000) {
+				if (addr > 0x10007fff || addr < 0x10007000) {
 					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
 					goto _exit_;
 				}
-- 
2.34.1

