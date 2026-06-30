Received: from r3-144.sinamail.sina.com.cn (r3-144.sinamail.sina.com.cn [202.108.3.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C0526E6F2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804239; cv=none; b=AvI2JI+jPmK5c3YL7N/dOfUKI5bB3e5AvBrnm2VvZiM3Xy3E8OvwhP2XXDlKqVWxcjvfyUd0X0h2dwTuxPoWhWpA4uHkE8w2tfEUaW4kvee9ltZ2kjOpCCHj4bNPdA2KX7tCi2A8TSFnPuXZTFSPrRyU3XGVh/PzisHUzHRg0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804239; c=relaxed/simple;
	bh=1y7eDu1BrTW8X/NIk02C0UqgQ7S1+5+PveXMyZ5kyZs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=hQhUV2mvPIF0JXXn0SD/k2g6NWVF0OQYQ1cRwKowP3G87U5jA7EGtD0hx3TeQ2MLC8EMF5qZayKg1B2dmXO3gi8ZDBKqqwmG3RTtM+u70+tO21pXnz6a1gGAejIROG9PFuSfJcwOl0wd3Y0+h3GLcj8U9GWytTrST/naQDjIKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A436EE200001A79; Tue, 30 Jun 2026 15:23:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4591AB4941CD4639A65DF6CCDC909CDE
X-SMAIL-UIID: 4591AB4941CD4639A65DF6CCDC909CDE-20260630-152315
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 0/6] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Tue, 30 Jun 2026 15:23:05 +0800
Message-Id: <20260630072311.8427-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the initialization configuration and routes for ES8389,
and add private members.

v4 -> v3:
	-Modify the maximum value for the HPF-related kcontrol
	-No longer returns an error when the corresponding
	 configuration is not found in hw_params

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

 sound/soc/codecs/es8389.c | 236 ++++++++++++++++++++++++++++++++------
 sound/soc/codecs/es8389.h |  11 +-
 2 files changed, 211 insertions(+), 36 deletions(-)

-- 
2.17.1

