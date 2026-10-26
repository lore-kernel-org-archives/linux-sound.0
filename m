Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993733;
	b=eHDQd7jgC5jcQN++0HZpmw3DhgDJIuWJ5/ShPPPH5MnJng2z70bH2yscs5FKtVn21rPQ
	 IhG+l4VQhq0R7qFcs7++keNeq2Sxxu6RQIB3p+O4SuBp4Bmr0m1IptQ2sBnTmPVeC9hcB
	 wzvW/Gj8S3WEIZp1Lobac31ZKOXz/JuiKsRviPB3XWMuUq+c6oOzVygKbXbv3CwTniwVI
	 uWpaBRjXSer1bYmsz8PUbpdKY9/uzpH+4otKYe0B9xmHrFpSrC8RwtKF7+a1X2hOVr79k
	 oohPjjVyR4+Vj2aFedXE4eQO4hbE0aj3yHji+GWrBMzV9gkKkO2rp265ksWHXEo/rbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993733;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=Y0HNWG+aoSTaKLshl0u8qZGhi32N+7s0hc3HT4M2CwY=;
	b=hxFMM79rsqHORgycYECXdonLIDhIOdK/ZsPT4xlvM81ro8SX3szSFFGqxKP9k/m1H084
	 Abm2TmSrGNyUskKVdSgteLsUW37bn/NTDR/2FsGRCfKgeRRr929/2Z+MyoXiXMouLcuTI
	 zxe/xI62lQyXAo/BohJ5ZYxG3DckJ3pKKr7nOmUoKgvDL8JGyhr0eFRg6z0JvoykSv6OF
	 1DCwfNfmFbQrC0TJM4K58vGm+rYVjPEojPCRfaoyCqBsfiSF9MxK6+oTCmfnK4SY7F19q
	 haS28mGTM8ZfzQe08Q1uFSaexfroimCbMbUDvBKdDK++yv98Td93VzQFYW0DqK7ptBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.89
Received: from r3-89.sinamail.sina.com.cn (r3-89.sinamail.sina.com.cn [202.108.3.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5A606A326
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 05:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6ADEE9B80000797E; Mon, 26 Oct 2026 13:48:41 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 14D261349BB54799B24F9102B0149DC7
X-SMAIL-UIID: 14D261349BB54799B24F9102B0149DC7-20261026-134841
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	sammiee5311@gmail.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 0/2] ASoC: codecs: es*: controls that write each other's bits
Date: Mon, 26 Oct 2026 13:48:35 +0800
Message-Id: <20261026054837.13618-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Both the Kcontrols for the ES8326 and ES8375 have an issue where they write to other bits.
This patch will fix that issue.

v2 -> v1:
	-Add Fixes and Reviewed-by tags. No code changes.

Zhang Yi (2):
  ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
  ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN

 sound/soc/codecs/es8326.c | 2 +-
 sound/soc/codecs/es8375.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

