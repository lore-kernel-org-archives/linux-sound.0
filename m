Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580413587B1;
	Fri,  9 Jan 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949469; cv=none; b=n9rNdDU93ysHMpyXnT50iI5RR81T2YY/ULUxZ0RrYoDPi84VwFwyCEtdilz1GFeV16n8zUIc99GEhi71iEJrNAD/gohekJZZlc4xQAbrpgcULU4zH469OssJTK+KTGeQ5nEIRmvwFUxvh6yBbjo6qj/BUFw9hCkIwIp0IKYWl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949469; c=relaxed/simple;
	bh=9Wk7FrbTcv+dFo1caqWBl1Bt+jFb3v9kyRkmsHEUZuQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZV+MbWPiY1f30h4/tFvbOZy5DFcT/oU5tXs1VJB32ooYp+ID+cf9TKcthHtf1cvoM7A5JDSTERKPiQdWPeIv+ZqBZZz98fpvzJ4oYKjxnjwMoMKcSfmrVMilpNfFOdvaFd5BkD1vFiE1+SO+oLQ9ArcXyvmAz31AdXfMaEinG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=YuXXDADA; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="YuXXDADA"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767949458;
	bh=QPKxOxkLsCyaMcJwN0XhMC5MGMh+uxaYm+lWvEdp1uw=; l=1355;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YuXXDADAB5WSzMpEFXQU+DCe+Vbx5+4geLNZZH8Fr9H+zH9YLWQN112R5vDr8NLPa
	 X8x56K53kkCh08BsT94jBflDH9gwXyufDF7dX0VRh/BRv5p1OPHpuj+cFaAfdPKojs
	 AV5x4xEhbaFmLnrPHZ4y1Ye01EG6ATohVR6dCIHXdmsn4VfXyajo9XTAJxIPra0mU2
	 MhKKc3Im/L1tCkuDYaw6bEda5Zm4/q9YtO3PpK1xQBa6oZLQEcwaTNjC8M4wiR8FT1
	 pFdgK/I564Yk5A+IIqN4nG+e+f0hJkLs+9k1EBqBw60Mic2EKKg+Gy5NEu/SkbJ6OZ
	 qXlr8GK3KzAHg==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572453:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 09 Jan 2026 17:03:59 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 9 Jan
 2026 17:03:59 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 9 Jan 2026 17:03:59 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>, <musk_wang@richtek.com>,
	<roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: codecs: rtq9128: Modify the chip initial setting
Date: Fri, 9 Jan 2026 17:03:52 +0800
Message-ID: <340c88ae78edeb76cde812453c9a72d28b73e9f4.1767948925.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1767948925.git.cy_huang@richtek.com>
References: <cover.1767948925.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Modify the chip initial setting to default enable DC load detection
function. This function is the chip specific feature that can detect
the output open/short.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 391cc03d687f..289bb3c04a90 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -352,7 +352,7 @@ static const struct snd_soc_dapm_route rtq9128_dapm_routes[] = {
 static const struct rtq9128_init_reg rtq9128_tka470b_tables[] = {
 	{ 0xA0, 0xEF },
 	{ 0x0D, 0x00 },
-	{ 0x03, 0x05 },
+	{ 0x03, 0x45 },
 	{ 0x05, 0x31 },
 	{ 0x06, 0x23 },
 	{ 0x70, 0x11 },
@@ -367,7 +367,7 @@ static const struct rtq9128_init_reg rtq9128_tka470b_tables[] = {
 
 static const struct rtq9128_init_reg rtq9128_dh_tables[] = {
 	{ 0x0F, 0x00 },
-	{ 0x03, 0x0D },
+	{ 0x03, 0x4D },
 	{ 0xB2, 0xFF },
 	{ 0xB3, 0xFF },
 	{ 0x30, 0x180 },
@@ -378,7 +378,7 @@ static const struct rtq9128_init_reg rtq9128_dh_tables[] = {
 
 static const struct rtq9128_init_reg rtq9128_dl_tables[] = {
 	{ 0x0F, 0x00 },
-	{ 0x03, 0x0D },
+	{ 0x03, 0x4D },
 	{ 0x30, 0x180 },
 	{ 0x8A, 0x55 },
 	{ 0x72, 0x00 },
-- 
2.34.1

