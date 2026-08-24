Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45328374A11
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568019; cv=none; b=EcS3BrKSWL4V0jAUCyTENj0D8N+m48cyHuqbCrEFPyzq1qBC4eLrZMXWkdr0glKCLSD0ONyjABZW6oJ3LN4oV5LNkUk4QGkZ9jhZWOuwJcjVbRyYbzRorE7JZUxrzC6A/P24lKTOwRJd7hAVDwj/MaSVnglzxNjjtOKAcDvlwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568019; c=relaxed/simple;
	bh=X5NZWhHKgGN+6Z2/slDIavLxsPmcHocR+Nxj0JB8iN4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mF/WmaAtWttDknA4rOxgoKyljueHcz/VSGNziHqCDMsWqoh8k7uxPyg2srer5KvxzKQTaXB/Q/1uj2wcR9oh9PPQL74QIp6ra8treywho2t/xdG2mqdZxyVTrXB+kwIPtfE0Pij2lTpQbRho8A3GtSa7IM2l5IQRr2gWFdhcIzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XLjUyBgT; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XLjUyBgT"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67OAdpmiF2777351, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1787567991; bh=uKzT+8UJ4PpwBrF2rqyHvOqEfTzUT2sKIUARqxqKVDk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=XLjUyBgTI+0Hmzk3iEm3qoOSRWrmhGNbdMhT6rg2ioTSs2m2IGDHUjUzguLlE/F52
	 u1E7faao2mtLQAN1cx3tBG8j8Zn0cWdw9fbEywQAMqv+l0kZJMXLSHsmgk57nLPRmO
	 X8TvZAJQMEXwfqxV5d7K6p5sdWQT3v2j4rpnJxUB6hV9bCBJg9rNLStSWLdV/Oe/UY
	 Bz8NfZlhG2HmISeKBmGfPxlKS2olsOOwQ+6RW6uxkO2aBdSLiGcWOAdrSngnxWzdp3
	 mikk61fIDtG3HKkxNA+suiWF0stPvCM3a5TGHvSXBuZU8QqsXnpDOIz180sO8kHjMG
	 R3898T77cvlbQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67OAdpmiF2777351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Aug 2026 18:39:51 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 24 Aug 2026 18:39:50 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 24 Aug 2026 18:39:50 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt766: add RT766/RT767 VA1 device IDs
Date: Mon, 24 Aug 2026 18:39:36 +0800
Message-ID: <20260824103936.3524080-1-shumingf@realtek.com>
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

This patch adds the RT766/RT767 VA1 device IDs, which support SoundWire v1.3.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt766-sdca-sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt766-sdca-sdw.c b/sound/soc/codecs/rt766-sdca-sdw.c
index 5d60c3bcc6cd..8e76bf725ccc 100644
--- a/sound/soc/codecs/rt766-sdca-sdw.c
+++ b/sound/soc/codecs/rt766-sdca-sdw.c
@@ -233,6 +233,8 @@ static void rt766_sdca_sdw_remove(struct sdw_slave *slave)
 static const struct sdw_device_id rt766_sdca_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x766, 0x3, 0x1, 0),
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x767, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x766, 0x4, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x767, 0x4, 0x1, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt766_sdca_id);
-- 
2.54.0

