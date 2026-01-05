Received: from smtp134-83.sina.com.cn (smtp134-83.sina.com.cn [180.149.134.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DF313E3F
	for <linux-sound@vger.kernel.org>; Mon,  5 Jan 2026 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604603; cv=none; b=YvEGFhl5POVODhvkish23LYObZ5d6vVkR7Vz0KR2cwsgTJd+Pfn23+zVUkUnOlT9x35GHX5NWXs1/BCCIlLr1tLrj5/K278x3xTCU3coqQ47ukH7ZeOsmD93+FNcP2VJ5HKlL2FSlqDJtAmo34/eP9qCKXs9iInGORrW7YLoyWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604603; c=relaxed/simple;
	bh=7504Prx6MabqX4khxVDArXtlv5QqHMrycEPtlpv/YPM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=QZpNpWZ/ZSzvoZjYvF4KRPIn87+TkqFalUNnhwrT6JhYvGmV6NSNfOmp6YtPzSILbPDH/AURSRnJ1lmOc9OQlLhgGdTAHQBNhg9c59YjiTKAIQ0jXqhsIWX+gnzl62ta5hvVNXPtDY5kay1QuHIOS5S3DVPgLgvtAR6KPjBEz1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.29) with ESMTP
	id 695B814B000044A1; Mon, 5 Jan 2026 17:15:56 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9395A4DC23404802A895AD05B82B1210
X-SMAIL-UIID: 9395A4DC23404802A895AD05B82B1210-20260105-171556
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
Subject: [PATCH 0/5] ASoC: ES8389: Add some members and update configuration
Date: Mon,  5 Jan 2026 17:15:43 +0800
Message-Id: <20260105091548.4196-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

To improve the codec's performance, add members related to power and version,
and modify the configuration.

Zhang Yi (5):
  ASoC: dt-bindings: ES8389: Add property about power supply
  ASoC: codecs: ES8389: Add members related to power supply
  ASoC: codecs: ES8389: Adjust wakeup configuration
  ASoC: codecs: ES8389: Add members about the version
  ASoC: codecs: ES8389: Update clock configuration

 .../bindings/sound/everest,es8389.yaml        |  12 +
 sound/soc/codecs/es8389.c                     | 246 ++++++++++++------
 sound/soc/codecs/es8389.h                     |   8 +
 3 files changed, 180 insertions(+), 86 deletions(-)

-- 
2.17.1

