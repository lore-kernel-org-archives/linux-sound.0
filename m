Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E6AD24;
	Mon,  5 Jan 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.203.221.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582139; cv=none; b=YZWIYeKqBX2nE6FId6eQn77LZ/zjm0KF1SQWsbzwbWVijYcQZ4UyFT6haaoQ0Jfh9MMPsWg0MHpEE97GgHSalEoMe7isWIVPthkZURYDJqYp5lgRTrbhbQojyRDH7S4nDIEfVESiB2cjGsknxq5oCMQo57HWpSKXGE7GQWibrBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582139; c=relaxed/simple;
	bh=MPPG80PySyuGNcKziBA/WqMsI63UkAvo4Yv3+TQYRJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQrnxpfQRXWTYa2CqPQdZQMbLAuW473z559FaxelV8JI40+HSTuOOrA22GiaZp1s7REBPnypsXW4VrCSrCbhqXDw4x0SYvwMnjYUxrCRfLrcxbdD+Q79qR2zThAhK3O3zEzPq+sfdzY8zdieX0fXjNDN93t+1L38gZ4dmrgfrx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=N5jrinrn; arc=none smtp.client-ip=159.203.221.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="N5jrinrn"
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 19D45E27C0;
	Sun,  4 Jan 2026 18:52:41 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUTIX4qHxUGE; Sun,  4 Jan 2026 18:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1767581560; bh=MPPG80PySyuGNcKziBA/WqMsI63UkAvo4Yv3+TQYRJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N5jrinrn0VeXtXWh1Ze+oPk4ym+HlvyHOGMgoLOIfbypmSo6TFfz+ueIvRCmQYSk+
	 as4nnycS9Fzx18KYdRAxAEXLu0SCfSOjrkIrl6eL7Ln5nkqCrtuU/nfm82CCsRqu+3
	 e4kl1u9HOQWxfV0xH6Z26WkkpuBUVk2g+qzS0nUj+ikH+aTaBQPoQZ51VAMIavih3x
	 HoMlrlQdZAAEi3SoKVG7+x1M7M2CmA35Vf5K+LxVSJ1BwbMvNsMxsYeISvaqC21dvA
	 1OwweQ1x43uQLO0n043iiUFguyFhfk1aYXeHYvYywFj8zbMSuKZhSNogv1mla6FWre
	 PIEVKriBKHAag==
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 05 Jan 2026 03:51:54 +0100
Subject: [PATCH 1/4] ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D
 Coefficients" mask
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-1-8e047171da2d@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Developer-Signature: v=1; a=openpgp-sha256; l=835;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=MPPG80PySyuGNcKziBA/WqMsI63UkAvo4Yv3+TQYRJQ=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWyd0dVz4UubzNLtyHuU3v0o6Mu0srgtbwxmlc
 nwcwRdPIKqJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVsndAAKCRDo8jXPO9vD
 /2xiD/9adcrVdUy1BYEL8wSdC7feNpYGfTCa9PfNmDl8tCNzk7awoOWBil5MzqyXYKEtcDc8bxa
 gO7jLIArTDgpp6YGGT6WXes0GhlAKjTgsCu8Go3edmKG+RoZ801XHXl36dRIG+1qwPk85pDQ0P9
 yfyOXa7z+rKtpPDU+piXlF5b7YSZbSS+MBwCkoGqY4zSTuvcEW8NaV+JfdtMqJh4H71qVOghw+k
 rqllDrLACQuYwecX7H6XpZZ0UK/uE/VqaOQqDQDh/j55I2OefkOahgPbe2VhtSMaaiUHXd9yjDK
 kmNOX8t2TcC0AOjE+zsk78JS8qGGcptYG2fB4w9FfnOWvmIvzaEstBecRn8Wj6yYHAGCxqrYStR
 tr2K+zPFSP0o8Cq2eXv1Nk0ntAKulJo2Tfu01xvochxKO8tcAsj7n9QHDHBZCK4npk6xaY2rDuw
 pDB2SiwRcQcIkOs6SYWLHQ9osWUGAu+5sfg/X8FSJjduCHdZjpmEH+L/WHxksKJsZczY8IK/2+Y
 tDq/ZZAgCJMT44p49V1hatFO8v9qIrlR6IYM1WXnXsDZoyBrJYZfPfPjIyA7HgCWzY+bItMt3ZL
 PZUTYtf+ivjc+TV1OqddKNMv23NGxnKZmByKos/EygUOYdXdpYo2g2YKNYuWspNFb7FtP0nxwgy
 R+JWmx3gH2eE9aA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

This bit is handled by a separate control.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index e9e317ce6898..1040740fc80f 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1760,7 +1760,7 @@ SND_SOC_BYTES("EQR Coefficients", WM8962_EQ24, 18),
 
 
 SOC_SINGLE("3D Switch", WM8962_THREED1, 0, 1, 0),
-SND_SOC_BYTES_MASK("3D Coefficients", WM8962_THREED1, 4, WM8962_THREED_ENA),
+SND_SOC_BYTES_MASK("3D Coefficients", WM8962_THREED1, 4, WM8962_THREED_ENA | WM8962_ADC_MONOMIX),
 
 SOC_SINGLE("DF1 Switch", WM8962_DF1, 0, 1, 0),
 SND_SOC_BYTES_MASK("DF1 Coefficients", WM8962_DF1, 7, WM8962_DF1_ENA),

-- 
2.52.0

