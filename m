Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996986;
	b=lH4ypV2IUtPhtqd+HfM2vOz0avxygdvl+EJqzeqTf0lGz7mEHxSnKtGb0ptwnm/Q31/7
	 2wshcxPiZ29PhdJ2EvMIvuqXpJEffEPsFDs1AOtNUAx0idUdP9iWtdewdxQ0AO4aUK2cq
	 t27p4EkCLp3K/p4v8ZIyvfmQDdzXUA8udKiAChtoinDyMpFlIaO38SS4jnG5lU4z7IShW
	 yGNRdZl53Jh9MUXfao+peVeRhkB7/YhhhDg0965P4h7iiRIOOVK8N8RdYvV1cNvfsLMge
	 WUZLqlfFtp1uIt+LjgkHJUptG9w6XHC6Q46WMTSPcTGWDGKrl+UH0WYJw9L455uoMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996986;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=RDaeEn9tugdOJHz0dppJMZJ5jQsyZ+f8SPwsUdG6Qyw=;
	b=bDj656DGFUIwGSG90dBCkQsbZJ1AKw9UGWoE3Dpn1dMQRC6+CvNlqAl2XaXyRars/WDe
	 M9Idroh9KekaV81sdC35a+uFUnBvAuJPQ3FJWCJflEjqDbTOGWmCIFt86Z4wE7M9YuK+L
	 bicUYRLOTAF2SkoGsEDS36fRd4+6fA7MaaXNX0CfxVcHONm9ICJkZ++EI8BDa7J+mOo0G
	 T1ol08Jdej900xak/fA1H14DUzqIi2s/cKAwHUTaHAZUUq+Y1hu6j4/Zw0FSUT37C9e/Y
	 0oUDmMfx4/fbrAcOLH77v1f1dXifVRi1qLAuM0hbjLT0pW1RqNwNCbPHMkPSQC9WiYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.74
Received: from r3-74.sinamail.sina.com.cn (r3-74.sinamail.sina.com.cn [202.108.3.74])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F21606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6ADEF66D00002520; Mon, 26 Oct 2026 14:42:54 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 656CFFE49913479CB5837A72954B0C3A
X-SMAIL-UIID: 656CFFE49913479CB5837A72954B0C3A-20261026-144254
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 0/3] Modify the initialization and headphone-related settings
Date: Mon, 26 Oct 2026 14:42:48 +0800
Message-Id: <20261026064251.15017-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

To support different versions of the ES9356, the code reads the chip version
and performs different initialization configurations based on the version number.
To improve button performance, we've adjusted the timing and settings related to the headphones.

v2 -> v1:
	-The changes have been made as suggested.
	The incorrect path now first restores `regcache_cache_only(es9356->regmap, true)` before returning,
	preventing `regmap` from remaining in the direct-bus state while `hw_init` and `first_hw_init` are still false.
	At the same time, the return value has been changed from -EINVAL to ret,
	while retaining the original error code for es9356_register_init().

Zhang Yi (3):
  ASoC: es9356-sdca: Modify the timing and configuration of headphone
    events
  ASoC: es9356-sdca: Add writeable_reg
  ASoC: es9356-sdca: Modify the Initialization Configuration

 sound/soc/codecs/es9356.c | 106 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/es9356.h |   5 ++
 2 files changed, 89 insertions(+), 22 deletions(-)

-- 
2.17.1

