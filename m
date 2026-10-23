Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721359;
	b=hzKR6AObJPpniOCrBIthK0DJa7B03GJ3cpI5D8DVWae5nLGC2Yto9LDXzitsPPLqQrDl
	 lggjvFzFlRQ64wEH6t6d8v5KzswpM8tKoQt5VmrLLulFGuP9aJPckVJRpxvQSfoD7cWyZ
	 YvNdS9++Jj8HhI2eE5xtjC4K0xB7G1yLpX3S6rKxp0C+goFoNCShQTnvdhFCoymckrMH+
	 4+td78s38oV4YU0mG4RVlEEruyXaP/jJrLLM1K9GQ63fZ3dImFrQdJr690oypAB3IwUG0
	 jPdknvbOBWmn1dnuM8chDOCuEjZV9BZxm8cNWHWQTC9/Md5whw3WvP0nxqGFVi/ZagA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721359;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=BtA4goPTzbX7XjxYZIVYcxMhotyMFgSveWfw/7iCJkE=;
	b=28C1rmY7/wryNaLJYSmYIenDgi62UMtmG/jUAdfScsHBJe+cf3rw+Vpwbz6af6uoDyks
	 8kAeteynjStpajoBPSAV7lreeLRco0KgKVg3AR+d1siIrZmuie72WP+tLL7kkuRVoTV7c
	 G9hoz6HqaJY6uCVhiFRa827RJtEKEYwKL9TQs8/1b2FAyMuyfCQvKDTtUWe2fYcBDPgzb
	 z8FI8AQ64a7VmNdyqzJ3Mlh7AO3yq1NL+dnq7coAXJY3My7TIHGuwBtbMZ8yyfDMxPgBR
	 Q90oemwA2dUFjTe18jKVQRzdUnUK510VKxtRKGz25+Glfzo2jMBSGNLx/QjQurQIWnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.47
Received: from r3-47.sinamail.sina.com.cn (r3-47.sinamail.sina.com.cn [202.108.3.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBC5606A31E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6ADAC1C4000078B5; Fri, 23 Oct 2026 10:09:08 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 7B99DF22B4A54DD5B7AE6FD74170476F
X-SMAIL-UIID: 7B99DF22B4A54DD5B7AE6FD74170476F-20261023-100908
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/2] ASoC: codecs: es*: controls that write each other's bits
Date: Fri, 23 Oct 2026 10:09:04 +0800
Message-Id: <20261023020906.28958-1-zhangyi@everest-semi.com>
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

Zhang Yi (2):
  ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
  ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN

 sound/soc/codecs/es8326.c | 2 +-
 sound/soc/codecs/es8375.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

