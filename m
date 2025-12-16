Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0933507E
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867689; cv=none; b=NcVRLYz7FywSvCOSzRnhUHgqoSUiDaisy4TgSutoherEDZxxTucwLzV+r26HiuY/XWewHwm+ivPsfnpjHYH+XJq99NOZH0SNiOiz8Gq28Dh5hTeIHts6TgZa49NAs5gO2C4yRUQrMlyu2PTq8yCjHpCSSWh9vBSMkl905LwdXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867689; c=relaxed/simple;
	bh=K7NxHJ/m2kkqe6EPWfZbv7RkcXuadWk4Rw+BB9+XmTE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ga0n+dMoerRVViNc3qYY0TKe+C2HoSvgQu3HUa0o5as7kUo8yAPPPGu4LrEcAKfQqx6Zd2XEK4mCrsW/xo1VwuCAbTF4rfCRXxyihbrI8uryN57z0LQJpydnuIFl3k/m2fkx0O9i1byh3gUup3UeK+HaZWgYPtel2eAznc8ZmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6941007B00005785; Tue, 16 Dec 2025 14:47:24 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 963205E5A30C4757A7F7C35EE338C868
X-SMAIL-UIID: 963205E5A30C4757A7F7C35EE338C868-20251216-144724
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/2] ASoC: codecs: ES8326 : Add Kcontrol
Date: Tue, 16 Dec 2025 14:47:19 +0800
Message-Id: <20251216064721.4622-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add some Kcontrols for ES8326

Zhang Yi (2):
  ASoC: codecs: ES8326: Add a kcontrol for PGAGAIN
  ASoC: codecs: ES8326: Add kcontrol for DRE

 sound/soc/codecs/es8326.c | 18 +++++++++++++++---
 sound/soc/codecs/es8326.h |  3 +++
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.17.1

