Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC63D646E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599849; cv=none; b=SeFwyKKfR59BswS58mHDYDwbvEnvfyx3y9Su8GT6f3pvTETqRKwSomOQYWPM8kz4bxfh/VumsOCkWDaPT/18c/hMRz6gaNr0Ehi9QHkFaEp4row+Gcy6S4TVlMu9W5xkfbvn0nWsgLCkNnUKgolPPi9LEClBXuYoUoo6KPd5CRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599849; c=relaxed/simple;
	bh=M75B9F1l6Uu1XU52pHHevevCW8x/LGh3JMBsSO3t6iU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uyMsjUa1Cb8XBIBVmjDcpOzHGy/X7Ew4Dz+uo8FygnOgqYwUJiAIHs8OShx5m4dQYfuxWbH4kcoZBN1tOXrwBl4xv0vjuC0N1g05fgDY9ecVdsK5pvsnc6jHwlgVIZUfsZIKkf2h8jadeH1ptV7NLzaFlY0FQBaXIsy0OSx12tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Luaa+1Cp; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Luaa+1Cp"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62R8NduH63374171, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774599819; bh=4spXSRBCV665GbxiJYjsJPiJx8uC9HBfCwQv0/11/ZU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Luaa+1CpxwH9IGt3jVlhsfBhvx7eb3GsF1Oj+BeLhoq812HFUiXW2PqcUfLWMgzzW
	 LpP7vHnz53qBA1el19sbmJ8CTZHZyDNGYAcpv/LNU1nZ74epAobcsKe0DvIKjGRuZ+
	 Z6Pi3wHgsvlCTRrV/q34a+O2pMjVX4mjKBWdUE7MHPEDaALgpHq2fZFvuLxyg9l5Q/
	 wICkzikDNzXo/Q7dawZNd5x2Knxh2cpFEDAoCBbfbYV6P07z9n8kIxyrkE3MiMcbpJ
	 ndaCQuRH6VzUP7HHB5hT6OFl3Z2MS+FglsCPY2gMIDv8QSqaIn2XB5tjFpEWiDiqF5
	 UAR8V0UFe6EgQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62R8NduH63374171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2026 16:23:39 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Mar 2026 16:23:37 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Mar 2026 16:23:34 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 27 Mar 2026 16:23:34 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: SDCA: fix the register to ctl value conversion for Q7.8 format
Date: Fri, 27 Mar 2026 16:23:31 +0800
Message-ID: <20260327082331.2277498-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The division calculation should be implemented using signed integer format.
This patch changes mc->shift from an unsigned type to a signed integer during the calculation.

Fixes: 501efdcb3b3a ("ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_asoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 733c9808891a..7709a4ce26e0 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -850,7 +850,7 @@ static int q78_read(struct snd_soc_component *component,
 
 	reg_val = snd_soc_component_read(component, reg);
 
-	val = (sign_extend32(reg_val, mc->sign_bit) / mc->shift) - mc->min;
+	val = (sign_extend32(reg_val, mc->sign_bit) / (int)mc->shift) - mc->min;
 
 	return val & GENMASK(mc->sign_bit, 0);
 }
-- 
2.53.0

