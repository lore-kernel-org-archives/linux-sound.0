Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3B26296
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941562; cv=none; b=D0s3Ig6DOSiKTBJd4eSc4rG09wR2pCFo27U0KQr9XnjsIuUVHw5YjKud52AQCf8hbv621DNw0UEKgjvRy+K4xPNcrkN1J5QrCR9MEmWFXHnQRoEWrxytD5gZSxM3xv63HeqTu5mjHOwstOdGfopXihGgKWO20f5qy0e8hckTUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941562; c=relaxed/simple;
	bh=RBkg2MNlQYuIzFQ5egA5zi+Enn2S4Jri+aY2Z2qkUN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AagBcc2J43F+rE1JrIAo46wNuMJXFZQZzQ/fny0YEVCo/w8p+EwlYZW0kWiPDe/oyg5gAlLOFnPWJKsKAKj7i2jYh9UaBcwONS+eejl2Wt+ij8HPrspFRbPsMGZKZ7zX5QADNnsEJWcedTXst+dPL2qAyWKEB5h9xzFa6OGkJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=Varl0lE5; arc=none smtp.client-ip=101.71.155.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="Varl0lE5"
Received: from localhost.localdomain (unknown [119.4.23.72])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a31dcd48;
	Mon, 17 Aug 2026 11:23:31 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Qianghua Wang <qianghua.wang@senarytech.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 2/2] ASoC: codecs: sn624x: update SDCA helper call sites
Date: Mon, 17 Aug 2026 11:23:17 +0800
Message-ID: <20260817032318.3989-2-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260817032318.3989-1-qianghua.wang@senarytech.com>
References: <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
 <20260817032318.3989-1-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa00dbeed0709d8kunm432bab687347c4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB1JVkhLTx9DHk0eHh4dH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVT1VJSFVMSVlXWRYaDxIVHRRZQVlPS0hVSktJT0
	9PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Varl0lE5K59E5K/BNSaoBumtXvCsCZenj6r1SSUs1FvROVoEQNb3h6DVh1yfdDcstEnrWl0o35bHr4/lFs/EwN6zvp7AU41YwoanLgSYGFY89ukkQKvXgmLjt5qu46i8xZLGSCqY9Qa/zAfNBWjBmPZiCdknSiiOsW9KF+43nfQ=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=uhXLvH5U81C61DErz+yL7prNtu4xUIZWcaZXjrl4XcI=;
	h=date:mime-version:subject:message-id:from;

Current SDCA helpers drop the unused device argument from
sdca_asoc_pde_poll_actual_ps() and the SoundWire slave argument
from sdca_parse_function(). Update the SN624x call sites to match
so the driver builds against current for-next.

Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index 8fd37f18fe5e..c9e690482e8e 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -409,7 +409,7 @@ static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
-	ret = sdca_asoc_pde_poll_actual_ps(dev, regmap, fun, ent,
+	ret = sdca_asoc_pde_poll_actual_ps(regmap, fun, ent,
 					   from_ps, ps,
 					   delays, ARRAY_SIZE(delays));
 	if (ret < 0)
@@ -743,7 +743,7 @@ static int sn624x_parse_sdca_functions(struct sn624x_sdca_priv *sn624x)
 			return -ENOMEM;
 
 		fn->desc = desc;
-		ret = sdca_parse_function(dev, slave, fn);
+		ret = sdca_parse_function(dev, fn);
 		if (ret) {
 			/*
 			 * sdca_parse_function() reads the ACPI
-- 
2.47.3

