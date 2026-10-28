Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793157140;
	b=Yj866wlQC92EuzBDwCeMbOxtNVxNATbz8LLwYQTlRMJr4FFaj2sHUkSnjTShVEg1A0RU
	 j0rcCbJfWsKhmRtinUTELgS01b1COHXPB3mPuHoW29uMkmq8+2UZHCb+k5yUeG7D2w98M
	 rcAz77G/f6H+E+IbUxjROEZO7aJAsESraBSJhOVlztRTmRMYt+NV8cm71nTsreyc8eWGE
	 KLbfv5EP6naWF7mUioeNNf4Q5mGIZY2DFccb8sd1hzSnN06DmS5PLRaiRpyQ0ywEzbCgr
	 W05VmBnKr8I57zfPK1z4uG4ccj54jyx4BkC03JpALwpWWw6qFhS5m5ruYe9Tdwvg3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157140;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=zEIUs94Am2AunDBw01zpxlrZQ0zvIvQ7XGPomdFWhPg=;
	b=lgnPlZAEqbYHc544Po2imWkasllp+nqay1DOFxXnwRJmj6OAN2kqqWvISxxIy2j5Z8Wf
	 uJ59UFgW/EmHt101/ZX7cnmy58jS99pcsd8fKIw4LJpK9kc39DoaVJQz7TBVN9OIYdTDr
	 1QPNublDqLI82TMYqGbjg8eVlHeUKfxjbHOW2HvXBluAul0BOHE6as10/ouS3q1myvQnO
	 7N6JORhekZM5f6cgAXduoKa/iWjm6cUeV/ePfjDoTrDZn4jHs4QBbcnklBfnw/1qxcCTF
	 Je7WtCfFrqmrdbHFw0ASTcQr027t5lXRLXpQPy7IDTCRtZr+IiTyZLU/haXlQSA18Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.71
Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1E606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6AE1680600004AE3; Wed, 28 Oct 2026 11:12:06 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1825D4CB20064497B7B1E75CA2C16A33
X-SMAIL-UIID: 1825D4CB20064497B7B1E75CA2C16A33-20261028-111206
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH RESEND] ASoC: codecs: ES8326: Fix the issue about pop
Date: Wed, 28 Oct 2026 11:12:03 +0800
Message-Id: <20261028031203.24245-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

50 ms is not enough for CSM_STA to reach the correct state,
resulting in a pop noise during calibration.
Testing revealed that the value needs to be changed to 200 ms.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d522d254a..74f276abb 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1146,7 +1146,7 @@ static int es8326_calibrate(struct snd_soc_component *component)
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, ES8326_HP_OFF);
 		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
 		if ((reg & 0xf0) != 0x40)
-			msleep(50);
+			msleep(200);
 
 		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
 		msleep(200);
-- 
2.17.1

