Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77C37D11A
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845376; cv=none; b=sEcsgTZRg1XvHQMDLeG7wRTaJEyH+o+vG2D9GK+nFmueMFleKDbS8pdBLSePhJxrEngQMlTwniHd+L2ME6fNdOEAl4yT4ZDM3+FA103w5WFEc1+a66Rbx28P2/ny4W/85Nw40v4rpEwRzyPi3V/otu/3vt/Q1eIxXTtdkuIo1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845376; c=relaxed/simple;
	bh=a1soBchLwd9OgXzbSghOwPq5MWRR1Bg/Kgl1Iq559Dw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AypXUEOjRa+nu1OzodKxSgoGJMTX1zAqOzuPWcw+v3GIPMjfVns46l994RsGXV+JcLyR0eEL/syK4REbNokdNw0xsUEH8wnW1H9SoRhc+raDyGWmhg49qTQdTUGMgsQXcHc7zq7oXSIjlvYz+r2ZKm6x+mxqX6JT5ucf5EsZDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=jRR9c5uK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="jRR9c5uK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69192SogC2833344, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790845348; bh=p/fmE2uQcRPOdXZ3vnX8V9POQYvN27sX+Q05sklACko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jRR9c5uKDXxhz8NMuwx47QPiOSUIuZAYXznfDoGkWPkrjY6fDoRAEAuV8b9r1kZis
	 qYHzxEj7kOGZfrE0TRBTEkMmr92SkovHegk9DfHkWFq7BAYZ5JllVirv/I1cMe0lAB
	 ZecZu95E6dILEuXpLbAYcxMkdLVaNEF/6clCvt0JAaY+QNMJ0/tCduLGF95YICGXYv
	 jz8sIJRR/G+VEmv5gb+AgRfMUffY5as0XKBZRycYUb3ISvVJQ3n8rG+lBV4h2Tk5g0
	 zT3hmGHMP1q1n0/HQa7dFtZXnESTXYVIQmH98eS1Sa6ar8iXV/2O7A99ugo7w2+iSV
	 dSTfcMC3z5VqA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69192SogC2833344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Oct 2026 17:02:28 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 17:02:28 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 17:02:28 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712: avoid duplicate reset in io_init
Date: Thu, 1 Oct 2026 17:02:19 +0800
Message-ID: <20261001090219.797880-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The codec should be reset only once during io_init, regardless of
whether the system performs a warm or cold reboot.

Fixes: 4c9854ad3cdc ("ASoC: rt712-sdca: reset codec at io_init to fix silent headphone")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index a98537e23c21..20961e5760c6 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -2088,7 +2088,8 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
-	rt712_sdca_reset(rt712);
+	if (!rt712->first_hw_init)
+		rt712_sdca_reset(rt712);
 
 	rt712_sdca_index_read(rt712, RT712_VENDOR_REG, RT712_JD_PRODUCT_NUM, &val);
 	rt712->hw_id = (val & 0xf000) >> 12;
@@ -2117,7 +2118,7 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	 * if set_jack callback occurred early than io_init,
 	 * we set up the jack detection function now
 	 */
-	if (rt712->hs_jack)
+	if (rt712->hs_jack && (!rt712->first_hw_init))
 		rt712_sdca_jack_init(rt712);
 
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_SW_CONFIG1, 0x0001);
-- 
2.55.0

