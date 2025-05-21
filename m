Received: from smtp134-82.sina.com.cn (smtp134-82.sina.com.cn [180.149.134.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5F25F98B
	for <linux-sound@vger.kernel.org>; Wed, 21 May 2025 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824214; cv=none; b=YUMcnKZdTSb8+J09DZ5ARtBXPaBhYRqDZfbhu0xvF6scTzpvjw9OjPZekNdIDTj8qQ2HB5wXe3cYL/5DCrsGpb6tKEmupzNgFbmMkBerAPsflBjWs2KI1MbPpCbtfRI3EEMuTk1hQYe0H8ZDqtA/ZKzM1UXQEgG6v5RpVBR1XeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824214; c=relaxed/simple;
	bh=Ivb2ok1RNgLgwS0cQoqoiLI4W4kloKQfLCjkmUkdvik=;
	h=From:To:Cc:Subject:Date:Message-Id; b=OL2thUyrKt8T542iTSaViAYoh54jQBdNgKm5nUpf3+6oWbgMgkOdO3kbPkrFLHAsKNFL/HCUAbCkRcGgw6noUT3eO2eo13apTjOXs2/NzkdUVYhaevKs0e+OIgHoMx6dAvtmJDAPYlSPLi0u4ZVU9jtzq8EHbiAS0eyZOd/muoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 682DAE290000569E; Wed, 21 May 2025 18:42:50 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D5731ACF33804336A801F7AFAAAA4B57
X-SMAIL-UIID: D5731ACF33804336A801F7AFAAAA4B57-20250521-184250
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/2] ASoC: codecs: add support for ES8375
Date: Wed, 21 May 2025 18:42:45 +0800
Message-Id: <20250521104247.6595-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The driver is for codec ES8375 of everest-semi.


Zhang Yi (2):
  ASoC: dt-bindings: Add Everest ES8375 audio CODEC
  ASoC: codecs: add support for ES8375

 .../bindings/sound/everest,es8375.yaml        |  62 ++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es8375.c                     | 845 ++++++++++++++++++
 sound/soc/codecs/es8375.h                     | 118 +++
 5 files changed, 1032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml
 create mode 100644 sound/soc/codecs/es8375.c
 create mode 100644 sound/soc/codecs/es8375.h

-- 
2.17.1

