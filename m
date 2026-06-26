Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74813E8357
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473824; cv=none; b=ZQonL09EidOJlbOJ1qOYhf7G1u1y+ENWJM7/hQzRvVvHhI/EHfNMZPC7qGOQJgbdlmJFvC2CtD5cHwQGtvjAujvu1AJN6HTbGUt62Ll20sNWk6b/595LJJiwwIu3b/j58CinY9d+Q8xm6Jbf8TFC1phwnKbJtGkjzeTcUedy2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473824; c=relaxed/simple;
	bh=URZMbyFWfs043TfIYff5/br9y2IyLulWZ67dW6Anxgg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=CV/v7Gr1pto35Hv6MKO+0hea0AmUfR5ZXos3hlwhqJBvg5LV5wbeQGBPKIrznIhAGLFo4BewUCqQi/wwlRaGKxt1Q47Hp9/W2oJoxuzsTR9TbWSXck/Dt7ZckQHqpHCHhIE2yrzj80yyNuOuNqjJKtsRYMqBsxKYB0eDlUv6h4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A3E6431000068D5; Fri, 26 Jun 2026 19:36:18 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 300B82F6AED745FB9724B634532B9ABC
X-SMAIL-UIID: 300B82F6AED745FB9724B634532B9ABC-20260626-193618
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 0/6] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Fri, 26 Jun 2026 19:36:08 +0800
Message-Id: <20260626113614.27893-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the initialization configuration and routes for ES8389,
and add private members.
Describe the added private members in `devicetree/bindings`

v3 -> v2:
	-Add Kcontrol for HPF,and removed the description of HPF in dts
	-If mclk is not accessible, set mclk_src to SCLK_PIN.

v2 -> v1:
	-Keep the old ABI around mclk_src
	-Describe the member related to the HPF frequency in the DTS.
	-Instead of accessing HPF-related register values from DTS,
	 set a specific frequency and then match the corresponding value in the code.

v1 -> v0:
	-The binding patch has been placed before the corresponding code patch
	-Provide a more detailed description of the binding patch
	-Provide a more detailed description of the patch about HPF

Zhang Yi (6):
  ASoC: codecs: ES8389: Modify volatile_register
  ASoC: codecs: ES8389: Fix the issue about mclk_src
  ASoC: codecs: ES8389: Modify the clock table
  ASoC: codecs: ES8389: Modify the initial configuration
  ASoC: codecs: ES8389: Add private members about HPF
  ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

 sound/soc/codecs/es8389.c | 263 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/es8389.h |  11 +-
 2 files changed, 227 insertions(+), 47 deletions(-)

-- 
2.17.1

