Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51191282F13
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147924; cv=none; b=rZxy8Mbls+lTmzsSpHJK+VhBsj0nR6kqFok/GpYzNi5U/IhM+hA5+D69nJCDVEpUDimzsEFBv9V6Yi6hXvGr2/DdRZdeZkKSE2DZeVJk/tJ849NkxVexkV23xkl3G2QpQKFyIMQ3A+ojeGDI4XL8s6J7+3J5+YtGj4Y9j8m+HL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147924; c=relaxed/simple;
	bh=knLBPSQMF288O9mstVXv/c/5QZG4cv0X4XoUjn+al9s=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ixpUSKOIU53pHjadTQS0gUCzOmiU31tj5p7fCiLcUXl/EjGsrlW2JrjDOyr7dp2N43u4xxYK596UxbGkvwi5ou4V7VhZVVwQxjj9kK9Uj0q787WXQB37od3Axl8KWfJltWWebNXYU+xN+4qmSCkKmMKVRacEZs7eWNbevrslmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:28 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 96C9ADBA6E1843DA8C9DED3E722C1E4F
X-SMAIL-UIID: 96C9ADBA6E1843DA8C9DED3E722C1E4F-20260611-111828
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 0/7] ASoC: codecs: ES8389: Modify the ES8389 driver
Date: Thu, 11 Jun 2026 11:18:17 +0800
Message-Id: <20260611031824.4628-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the initialization configuration and routes for ES8389,
and add private members.
Describe the added private members in `devicetree/bindings`

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
  ASoC: codecs: ES8389: Add private members related to HPF
  ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

 .../bindings/sound/everest,es8389.yaml        |  23 +++
 sound/soc/codecs/es8389.c                     | 141 +++++++++++++-----
 sound/soc/codecs/es8389.h                     |   6 +-
 3 files changed, 128 insertions(+), 42 deletions(-)

-- 
2.17.1

