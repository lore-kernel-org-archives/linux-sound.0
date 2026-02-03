Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203363090E4
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108539; cv=none; b=jFOfh1x4CSbUnfWd6CiLOoq1LAEGGHkzPCcIAUZlDK3KYqEUUOqskQK0TB8RaWI4st4G5+MDADwdpPEIUbO7QVVyP39nVHCMm+QcYmL1pPvElNcqFnLDu+dQTVyRe05HLhiwc9w5uG7lqUBmmKVDk9oDT4DOzGgo9oB1IB2oXI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108539; c=relaxed/simple;
	bh=uBpQKbL5CNIop/KzngyGraomcOSzlrbp55qzTyqmH50=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dVQksCULYZSUusIMJpErYvYoK5rAkrUtTuyOmUTW10F/VutUVypXo/lmN/yCNhxQ0/2kz+YKFtp71kTl8bN2YtCDaFUdVIJgGZzaf3jKZ4QRISp5hIiZ/fJlzK+VMW78fvez/gux0qQhKXi5639P1m2axz7jAfrNgv92uB/MFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qvrHrJ61; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qvrHrJ61"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6138mY881577509, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1770108514; bh=do5muf+EdClom6AmMAsAs9ZeChsFnLQ8tHHvDihv6Vw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=qvrHrJ61Us5yE4F5HllgnV4+0AarP47rbE8KWCA1sDt0SA6vnPA1qC1vB9zW2ffJ+
	 M9zj/gRw8GzRLFEvQeN44cHSNthbh/Cc5grdHmz9u4TTBx2fTeqFxXvkD94ujgG5K5
	 bGbTrWH0rpyRYV/jXBYTOSPTeTn96nk9pQFKB7NyUbIH3F/vNgpkyw4UyNqGu8hdfS
	 6JLe7HJXfDeJwCoB1TANgaYBkxunXpL921KDBzdlKGTGnqxCWsM68ptl/uaTrwCXxd
	 d2IfQe5PaNKjjXOISryVuSClLvLiuF0JrqddS7d30twYJKxLqTH3cWPMZjzatGBian
	 JjuEuPmIgPLZQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6138mY881577509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Feb 2026 16:48:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 3 Feb 2026 16:48:35 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 3 Feb 2026 16:48:29 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 3 Feb 2026 16:48:29 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320: fix intermittent no-sound issue
Date: Tue, 3 Feb 2026 16:48:26 +0800
Message-ID: <20260203084827.768238-1-shumingf@realtek.com>
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

This patch adds a setting to resolve the intermittent no-sound issue.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 3ad51db23dea..977881994e60 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -203,6 +203,7 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ 0x3fc2bfc2, 0x00 },
 	{ 0x3fc2bfc1, 0x00 },
 	{ 0x3fc2bfc0, 0x07 },
+	{ 0x1000cc46, 0x00 },
 	{ 0x0000d486, 0x43 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00 },
 	{ 0x1000db00, 0x07 },
@@ -354,6 +355,7 @@ static const struct reg_sequence rt1321_blind_write[] = {
 	{ 0x0000d73d, 0xd7 },
 	{ 0x0000d73e, 0x00 },
 	{ 0x0000d73f, 0x10 },
+	{ 0x1000cd56, 0x00 },
 	{ 0x3fc2dfc3, 0x00 },
 	{ 0x3fc2dfc2, 0x00 },
 	{ 0x3fc2dfc1, 0x00 },
-- 
2.52.0

