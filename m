Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000431A055
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522091; cv=none; b=KhqKSuwJVlljbwKEVjEZSeeBOZpd+LCexwJoiHwpph3DupcWEfmgbs8R+sWG8Dfc3rahRxDbo5j63GfoXeM+miJoMmLVazOU8WE6nRlOPw59gY51bfmxP3L/Mcw8d6mxk7n0DrcsoJ/nQ75zbPTINNn7x4NXJge1Q312lw5Mnu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522091; c=relaxed/simple;
	bh=6rQ6pnAUwzRAUX1Dhsh33y23lqaMyZglDlokiaRV8+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dph51EhUjukpwTem9psMfJO1t7rsCyDpEr+gWeSJKk2Q/xiUyVnrSLwfYOeCWPmgf1PyqiR7xbRJtw7pTnZdfLjxIh9GZHCkS6e90/LKm57W4xzKFLxTxaaBEyqgjt9k+qFU/Z3JRLB2qdTvjIXHZo0ZMgQsJHoe3gmtFh9hpVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1unzUD-0003t7-OR; Mon, 18 Aug 2025 15:01:17 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1unzUD-000uE2-0I;
	Mon, 18 Aug 2025 15:01:17 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1unzUD-005swT-04;
	Mon, 18 Aug 2025 15:01:17 +0200
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: [PATCH 0/2] ASoC: codecs: pcm1754: add pcm1754 dac driver
Date: Mon, 18 Aug 2025 15:01:06 +0200
Message-Id: <20250818-v6-12-topic-pcm1754-v1-0-e1dd189ea99a@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABMko2gC/x3MQQqAIBBA0avErBtQybKuEi1inGoWlWhIEN09a
 fkW/z+QOAonGKoHImdJch4Fuq6AtvlYGcUXg1HGKqcd5ha1wesMQhho151t0NllNtR7S15BKUP
 kRe7/Ok7v+wE+sECvZQAAAA==
X-Change-ID: 20250818-v6-12-topic-pcm1754-85fa2c9d5cd0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
Alvin Šipraga (1):
      ASoC: codecs: pcm1754: add pcm1754 dac driver

Stefan Kerkmann (1):
      ASoC: dt-bindings: ti,pcm1754: add binding documentation

 .../devicetree/bindings/sound/ti,pcm1754.yaml      |  54 ++++++
 sound/soc/codecs/Kconfig                           |   5 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/pcm1754.c                         | 185 +++++++++++++++++++++
 4 files changed, 246 insertions(+)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20250818-v6-12-topic-pcm1754-85fa2c9d5cd0

Best regards,
-- 
Stefan Kerkmann <s.kerkmann@pengutronix.de>

