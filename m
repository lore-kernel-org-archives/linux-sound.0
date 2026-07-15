Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370A42BC47;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073933; cv=none; b=Pw3F2JhZpkB1ACu+WK6lDrj/T17xdxUSFihP9U5Bpsnl2L1n8oSvedCLMtKS8XLLonpsJa6Yy/a8ae6NzTrfjFh3rOHM7bYXB529N68uJuxkAWMkZ/qXrFommFJ9zU+ITc2yCIQa1FZ3N9+XwBVarPtkAXfPFr4C8O2DKUve5BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073933; c=relaxed/simple;
	bh=tO0R5pHZYR2iN8g+X9gftEqBzWL6MuTW9QhN85RyTtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXYjNdkACOrSmWclwRD8FtbdTvUbwMCHMmgn6znOVEM1z1KGzBYQkaT+PPKxDNv2zPoCKxAkewF46Vo1Tnr0Ru3hgWqsEizkQ5M1K3BUQXozUKT9rctq8DEji0e6A+XqWkRPKjat3984u6BvmA8vGyqWK3fSOS6UUe1SXF+ydhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A8d0NQ+F; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A8d0NQ+F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=whUJBq9j7Gjt4+AHK6WYV+GQWugxRvRw0PxjhsMjkDE=; b=A8d0NQ+FTZXw7OoJA2+XIB1Hkn
	+RlrilZKqSNHdalqtsNGkPjs9/c0Tm2w9bXHd2Q76r2Hk4zwFSuc7kw+LKLBgDcdy23yIjZP7GaB7
	1LNE4RIiSdzU7psxeFqilDGB93VzJrYax6oEz7Eexo18fzv08lmcu+bgZV+XZXwftyLBT/5M8DmAn
	YfpIS0+69viuum399syVOGg/adjeRcKnP+FlMGNdYPnol2DInd1FoZJNYR7V70cCcrkaAiqIjpKWS
	3tp4EiKziVDcF7CC3LpIF5WzO6L3uyxBLnd+JLHyFwapMn5InV7T4OO+f3pSwqGD64XQBBg5P9V0z
	5OEasVjw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7w-0000000DTcu-2ZXa;
	Wed, 15 Jul 2026 00:05:28 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/14 v2] ASoC: codecs: NeoFidelity: repair the kernel-doc format
Date: Tue, 14 Jul 2026 17:05:12 -0700
Message-ID: <20260715000525.739874-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715000525.739874-1-rdunlap@infradead.org>
References: <20260715000525.739874-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't use "/**" for a non-kernel-doc comment.
Use kernel-doc notation to document the parameters and return value of
ntpfw_load().

Fixes these warnings:
Warning: ../sound/soc/codecs/ntpfw.h:2 This comment starts with '/**', but isn't a kernel-doc comment.
 * ntpfw.h - Firmware helper functions for Neofidelity codecs
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'i2c' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'name' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'magic' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 No description found for return value of 'ntpfw_load'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org

 sound/soc/codecs/ntpfw.h |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- linext-2026-0710.orig/sound/soc/codecs/ntpfw.h
+++ linext-2026-0710/sound/soc/codecs/ntpfw.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * ntpfw.h - Firmware helper functions for Neofidelity codecs
  *
  * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
@@ -13,10 +13,11 @@
 /**
  * ntpfw_load - load firmware to amplifier over i2c interface.
  *
- * @i2c		Pointer to amplifier's I2C client.
- * @name	Firmware file name.
- * @magic	Magic number to validate firmware.
- * @return	0 or error code upon error.
+ * @i2c:	Pointer to amplifier's I2C client.
+ * @name:	Firmware file name.
+ * @magic:	Magic number to validate firmware.
+ *
+ * Returns:	0 or error code upon error.
  */
 int ntpfw_load(struct i2c_client *i2c, const char *name, const u32 magic);
 
