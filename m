Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF744E67D
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161343; cv=none; b=UQ3qcPFF1mLxSEq+zFKRV6bHdZXLCoCesnAjhyRpu09uICj+m0iMC53B9FnGBou1Z4RmR1lomNE7pqVSNSvz+CNvRtHq6z0S80wayisJkmIvzAn08geqbvR21CYMnu+Rpcrwjphd2FwKC49t8o8ZpIpWSeyTRlCqjWhBkn0o9Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161343; c=relaxed/simple;
	bh=vzOYzkQhA3h03pNfUq71X70jYaVhS0UWPJt11759qCU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ciHP8DRYqy5MXohVr6jaPIsso/4fRblprOG/rui6xIK0kpxGctfhJ1s+a+TJ8UU+bzeeqoZWweuhPElpJpxfxV/j2Sn7pKzqyhHzBqCYAbY92dBiQY5ndc7Iqk0JmcH0oJ7v0NXhN0Q9raKUhlS6qSaPVmEUgwMN2gECbsee1Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pSvyozpZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pSvyozpZ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68NB1qRI2236306, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790161312; bh=ZNkUz1ECm+AcdCvMGKnBFd8iO4GuDjF7VgsX2334+OE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=pSvyozpZ3zxOVioV/pTwp/35I3+fNPaBLtvD3HJR1hT9q9cIaweJP/I9B5rpEKzDy
	 9nAUGlRJSFnXofnkKV8lzn5ptqx14+hKYI+5Cz7lcX114ZpIjQwAt2+5bNd2Iy7qwq
	 gnSEE30VCP/ddsUYfZXKk79K5+UWlvZvJ1D2BJeEEoAAh4j3kKPS3cvRlDO0Ttbxo1
	 cBgyV9jGa9KvF1kTpG1i9oDMWepQEcB3kGrBWhOHG3NABvRmOMdz0WBv+vZFUdqJbm
	 UD9XV9ADlM1v6/+HHYYt9sX8eoz35/IZcUZd5dv5i6ifepSBy3dAGSRnH0x0Wyy5Gw
	 7IjGhZIz3qqEg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68NB1qRI2236306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 19:01:52 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 19:01:51 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 23 Sep 2026 19:01:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 3/3] ASoC: rt766: avoid re-initialize the blind write
Date: Wed, 23 Sep 2026 19:01:49 +0800
Message-ID: <20260923110149.3419743-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

We only need to check the function_status to determine
whether the system has undergone a cold or warm reboot.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt766-sdca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 5a1c1e10e6d7..28b4118e05c9 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -1297,7 +1297,7 @@ static int rt766_func_initialize(struct rt766_sdca_priv *rt766, struct sdca_func
 	regmap_read(rt766->regmap, func_status_reg, &func_status);
 	dev_dbg(dev, "%s, %s func_status=0x%x\n", __func__, func_data->desc->name, func_status);
 
-	if ((func_status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) || (!rt766->first_hw_init)) {
+	if ((func_status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION)) {
 		ret = sdca_regmap_write_init(dev, rt766->regmap, func_data);
 		if (ret) {
 			dev_err(dev, "%s initialization table update failed\n", func_data->desc->name);
-- 
2.54.0

