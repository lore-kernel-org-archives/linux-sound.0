Received: from mail-m1973181.qiye.163.com (mail-m1973181.qiye.163.com [220.197.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB270288510;
	Thu,  5 Mar 2026 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689714; cv=none; b=TpP+laob0X4i1SdoRAyNPcYMe2+URNMyKJbWnfaifWqowqbzd8jRK4o6/o3t7ST9G6/Kn90HohoV10iYUiIDOb3u/aDWItICxCIIMehIv7mTOqr9YZvBGeBvDiwSPvEji57tP9YXZD1oiYdMSx8Y9Wc7Y2On8E9vmigteBGnMMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689714; c=relaxed/simple;
	bh=wfONw/CTwdUsjZg9ZSkmzNxaR+sh70J827DN0jzVghQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxl87V2dqkUi3CO7vFd4MLtQDQ2qmBoPNg0Ixv5AHWELwC+cDwTaBeyMwORvr0V+alja+ZGVLWz37FFaAmqjSSwaNj5Bmr9e2CSn5azf2i4rve2H/0fqi3TnB1BG8gajuOhzbmVJPCVJfFV3xSCLaDU9aDEc5kZAmG2pbWOevME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=RQ3zfXYy; arc=none smtp.client-ip=220.197.31.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="RQ3zfXYy"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35d4e47c6;
	Thu, 5 Mar 2026 13:48:20 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 05 Mar 2026 13:47:43 +0800
Subject: [PATCH 2/6] ASoC: es8316: Get sysclk rate from MCLK clock when not
 explicitly set
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rubikpi-next-20260304-v1-2-327595a4528a@thundersoft.com>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
In-Reply-To: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772689696; l=1363;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=wfONw/CTwdUsjZg9ZSkmzNxaR+sh70J827DN0jzVghQ=;
 b=hUNSzA29SoERFYvA29i7cbK20AtBaFPqlMkK5Gg2LWbIWQ5E95nE4QvmoWxkgGixgzf8tGaFh
 DMCQ+BaHK/eB+S0nS8rqibpzHOZbzcoLX+jACYXxwCW3DY61pTnq4Ui
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cbc8a35cd09d5kunma04077fcc85651
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUxJVh4ZSUsaGUxOGRkdT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=RQ3zfXYyrBQtwPleoH4U1o6QCTBy7zxtGDh/q1A81NqBrNoyeKg4jl5qKo4FUG8+nTwBERMU6jM+CQAmR7geQbUVL2qBgX6zPJGU5SuW8bgDCQH8XWSz9e9mXeeXUMU4ghWOJmGeRwE1RsB3Ojs0rl7HvnwjUOZMaOZBCtOjogw=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=7A2Od7CNn9SjkF/jTVlPq1l1k8zboV6uLy9Cr8xEL10=;
	h=date:mime-version:subject:message-id:from;

When the sysclk has not been set via set_sysclk(), try to get the clock
rate from the MCLK clock provider. This is useful when the codec's MCLK
is managed by an external clock controller and the machine driver does
not explicitly call set_sysclk().

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/codecs/es8316.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 9245c33700de..fdde7e4f7365 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -477,9 +477,20 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	u8 bclk_divider;
 	u16 lrck_divider;
 	int i;
-	unsigned int clk = es8316->sysclk / 2;
+	unsigned int clk;
 	bool clk_valid = false;
 
+	if (es8316->sysclk == 0 && es8316->mclk) {
+		/* If the sysclk has not been set, try to get it from the MCLK */
+		es8316->sysclk = clk_get_rate(es8316->mclk);
+		if (es8316->sysclk == 0) {
+			dev_err(component->dev, "unable to get mclk rate\n");
+			return -EINVAL;
+		}
+	}
+
+	clk = es8316->sysclk / 2;
+
 	/* We will start with halved sysclk and see if we can use it
 	 * for proper clocking. This is to minimise the risk of running
 	 * the CODEC with a too high frequency. We have an SKU where

-- 
2.43.0

