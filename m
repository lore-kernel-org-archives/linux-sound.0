Received: from r3-144.sinamail.sina.com.cn (r3-144.sinamail.sina.com.cn [202.108.3.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753C395AC4
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771376; cv=none; b=kPcKa5xvbnb6jQiUOuQzhNIeAtjp9qVnAIop/y1FMnsKCAcOdKjNxpSldmNtmielKICArpN/06ER0EF+DrBM44Rst+1dN/DvjLncLt1O0HPyULlV8srEObp0xccMWIXYrWCdZK1F8TrgFEEbc2NYYQRvnwdTkjcDr9F9L50fDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771376; c=relaxed/simple;
	bh=cHbOsDYc6FRSAZBgSUsxbBwACfI/09FS/wqUHC+kRAw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=XxaawMM22GNMm6qRm4DnkGcF2Zb4LTHOxwXnG08gNKIPxCqZv2MC0A7Oa7ar5equ5ZfQ2Y9RwZOU+QpmU1BbptWZLF0ITj4bjAsfoN46Duox8jnrasRa2vzp/IQokpDyZNXxusekSGNOuVkXQnESjQjntfotVdr+CfZprmOQQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:52 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: BC055385A8064E009AAB3104ACEDACA0
X-SMAIL-UIID: BC055385A8064E009AAB3104ACEDACA0-20260618-162852
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 0/7] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Thu, 18 Jun 2026 16:28:35 +0800
Message-Id: <20260618082842.2778-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the initialization configuration and routes for ES8389,
and add private members.
Describe the added private members in `devicetree/bindings`

v2 -> v1:
	-Keep the old ABI around mclk_src
	-Describe the member related to the HPF frequency in the DTS.
	-Instead of accessing HPF-related register values from DTS,
	 set a specific frequency and then match the corresponding value in the code.

v1 -> v0:
	-The binding patch has been placed before the corresponding code patch
	-Provide a more detailed description of the binding patch
	-Provide a more detailed description of the patch about HPF

Zhang Yi (7):
  ASoC: dt-bindings: ES8389: Add members about HPF and clock
  ASoC: codecs: ES8389: Modify volatile_register
  ASoC: codecs: ES8389: Fix the issue about mclk_src
  ASoC: codecs: ES8389: Modify the clock table
  ASoC: codecs: ES8389: Modify the initial configuration
  ASoC: codecs: ES8389: Add private members about HPF
  ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

 .../bindings/sound/everest,es8389.yaml        |  16 ++
 sound/soc/codecs/es8389.c                     | 184 ++++++++++++++----
 sound/soc/codecs/es8389.h                     |  12 +-
 3 files changed, 174 insertions(+), 38 deletions(-)

-- 
2.17.1

