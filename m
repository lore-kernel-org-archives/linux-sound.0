Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2B39A4A4
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945519; cv=none; b=D9we+lLcTSx2jigH4Z4kM8UWgOEs6diDUYwqjxW1YD60lPu0zT9lHzUe29cRCAywRytTjXiN75E7J1ShADuxJh6AccOsbVS5Tu1r3ixcUUlpsZ1A/pW1iDQQnzf8Be7utHT706VNPrssad2Th0NhOvQ+svBr6mS6L/hkSazRh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945519; c=relaxed/simple;
	bh=8ok39uNEitqPsI9/X+Ixgm/ZljDk/0oH/c8FA1450q4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lLUgj7ssaJA+uEokv2Ye51oKnZND5Jzu+Vm7ZY8I5xLrUAmP4IVN7x2do5wnwi6VKv4S1JQvfMaOoahqNvB+zKejIPaNa3FnNCTAJbSsQdZFjyXr/e8OyKJ7zYfr6SsNjUQ/2x59/apROl8FP7VR1pYbs/wgNPGZps0zi6nJ4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ErNNXicj; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ErNNXicj"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6899IBdM4425865, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788945492; bh=JKcdy7OtYID8yu/zjYfEP0X9437N+PUCgLIIrDAuu98=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ErNNXicjgve7SqismY1+tzsEhcw+f0XKUiKMWGpu+tQ2jc74AgyLCDQBjb1tkYiq4
	 9NmLu1tf0aIw55tWVmdMldFahp90AH2RnRm1/AYi4b4EghauHcAV89oQ1BXxdzazkr
	 7Tt9MjHveSjCDRFXwlmRPAqdKkOxUFnTZQNGscEvbCo3g3ZCbrLYdklZN/SnXZh4Nh
	 dgA3be1FsXMYxen5HMttipi4MXXkHpFr2ty6fkXqxNfJEf83+pmFl3Gu65W2/hgFj0
	 /0hQ7Lon84d1tshXAA01hTQF/L2d1I0xsO+73kBe6WFdOQbYL4MYBMwxCgfhkSrkwl
	 ymT24t8EqDWiA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6899IBdM4425865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Sep 2026 17:18:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 9 Sep 2026 17:18:10 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Wed, 9 Sep 2026 17:18:10 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320: avoid re-initialize in advanced mode
Date: Wed, 9 Sep 2026 17:18:06 +0800
Message-ID: <20260909091806.872977-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

On some machines, speaker protection is enabled.
We call this advanced mode, which loads the DSP firmware and changes settings
based on the basic mode, including blind writes.
The amplifier can retain the advanced mode settings until a POR or power loss occurs.
Therefore, the driver does not need to switch from basic mode to advanced mode
when the system performs a warm reboot.
We only need to check the function_status to determine
whether the system has undergone a cold or warm reboot.

Fixes: 9b30521074f0 ("ASoC: rt1320: run the initialisation preset on the first hardware init")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 72af413306fa..444a91755be9 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2470,7 +2470,7 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 	dev_dbg(dev, "%s amp func_status=0x%x\n", __func__, amp_func_status);
 
 	/* initialization write */
-	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || !rt1320->first_hw_init) {
+	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
 		switch (rt1320->dev_id) {
 		case RT1320_DEV_ID:
 			if (rt1320->version_id < RT1320_VC)
-- 
2.54.0

