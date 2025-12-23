Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16CD311977;
	Tue, 23 Dec 2025 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526808; cv=none; b=RAOUMGfCrubgen1/Mvom8OT/oRuSoa/EIrNosTF2WP1tI/TDaPckzKBmM0fODLVMz2azpwwrbBZFjYese6ybDo0PmzEET7N4IhQC8MFT3cRaBm8UgyBWCD+Vy2Q2jaAld9SebCq2XDbspOQbethMPtQP0t38v8hbSi80Ac+xeew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526808; c=relaxed/simple;
	bh=D6LNkBnKf059M6BLMV5W6odKm+Bri+H/iK86T+kHUE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jDZbcIcpqDIxepqtUfE4NuIEnK6dwXxJocVigunfEDQ9AJPdrwmd0jldoV5WHDNVZkx0n+GUx50PclOvBWB2oPORQe/1kFW7DPgPy9z4zZrb6JZ7kP1BkiPv2I2W2cL79t0D+iQlegKkK1wgiv/WYuDqKiK3O2DlkiM2mSlHiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj7mPszq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aj7mPszq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961B2C113D0;
	Tue, 23 Dec 2025 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766526808;
	bh=D6LNkBnKf059M6BLMV5W6odKm+Bri+H/iK86T+kHUE4=;
	h=From:To:Cc:Subject:Date:From;
	b=Aj7mPszq5wk1hRiWDUvdIIJ1ijCTe0kyJGtYuBkWwCDD5kjeb/jcS96Ky979yny7T
	 yqHCkqrAtdqkAuqlhwmw05iBFfQt7R1NHlwXPyCac0r9r8nodoRwzVWRaUgCuJ5K7o
	 Z8a3tnhEqSBSxQQB5F9MNYX0zpgpTIo8uv5M0MW/olBEiNXYwaWwt0pdM8traYeu0U
	 wv7XuYB0ektHlpSDB394P+SqFGK2zGKPaJSxA9tS+s8EleDHQhgNO40oT1Khh9BaQ8
	 YYoc8R6z4FrSMBVSke4TVL516eUZcJZ5QK3d2CL6INcLL0HplQXrAAEbHL/l7nIbdv
	 hb6tKMlMj+SUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuming Fan <shumingf@realtek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt1320: fix size_t format string
Date: Tue, 23 Dec 2025 22:53:19 +0100
Message-Id: <20251223215322.694265-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Printing a size_t portably requires the use of %z instead of %l:

sound/soc/codecs/rt1320-sdw.c:1494:30: error: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
 1494 |                 dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 2999ab95971a..245b9d9980f9 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1491,7 +1491,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			return -ETIMEDOUT;
 		}
 
-		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
+		dev_dbg(dev, "%s, rae_fw size=0x%zx\n", __func__, rae_fw->size);
 		regcache_cache_bypass(rt1320->regmap, true);
 		for (fw_offset = 0; fw_offset < rae_fw->size;) {
 
-- 
2.39.5

