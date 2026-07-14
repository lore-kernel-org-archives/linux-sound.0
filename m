Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68083368958;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993491; cv=none; b=MC/Fuy1Heef0WC72yvbjOToWBjT7obO31GKtuXZ0VwY8QebEK6A+Cu0a/Zz7HLe7o1MARuu3jItrVSKcMY1wH9+/A7njrXDNSbkSI+YalWNGzuM7MMCBXk3y59dIiVmWlWxWn659fKWZoE+cpJC3h1IPx/P1KfBQi30yicmUuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993491; c=relaxed/simple;
	bh=fRAt+Xt8yytECXFT75hKloSifnKXAFZDtUzW0DAtgaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu8K7fUJMJ0MyuJq5UDiP8+BJeEB90X8dOcisQmyvFZBvLy9efm/5IifL/5s4k/NQGWJ5gOVmMgmqlZrEJFXMky8KqNar8p9ThOrznO4lDAfVu8oI18rsgs/7cWXkMwZa+QCR6XXTmVPdXB8jjm07P5kabgeFanddC1wz3/uDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i/oKD2eo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i/oKD2eo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=C2OhovbADJqYH9SjFWe+bdXuuSMpvFMRbOlHjiIHQYE=; b=i/oKD2eokJkBPLHZYeSRVyfMCA
	C1gElCK6m9h0+HqyzwNzCF9xssaoYxSWHgXjhOq2UKaPUgefw8+CIC+vZxovYrcZ73wKb6ZNqgUKx
	ZWec8VnQ3mjTj3AznUjA1n64c4h9hl4ZsxjoyvUXU9IAnE1P8F06V8YvQAxsSNCm1JeNo5kjSWkNk
	H0MbDKY4EqsS1AnToyotbquHKUhFMTilM2rE10/em9CVXh1FG0sHUeKdVwLpksJxboJVRzdGLKrlb
	iZSB9ux538MDXL3OgH69BXa8cmyA89r4lbO8aNsbwjvw9hJdC59sr6CU/SdVJhyypXcMLyAgVTnh7
	3jXknlPg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCV-0000000AgsR-3SPs;
	Tue, 14 Jul 2026 01:44:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
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
	linux-arm-msm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc format
Date: Mon, 13 Jul 2026 18:44:32 -0700
Message-ID: <20260714014445.569992-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714014445.569992-1-rdunlap@infradead.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
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
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>

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
 
