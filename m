Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF6311977;
	Tue, 23 Dec 2025 21:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526789; cv=none; b=T/oOeg+ZJ+M24Nnhg0AO/x24JIxquXp06r98ImYP5qQ5Z9GPoioqLsghuYz/0dpRyp/2NsdL12ZbExbIwNFFDIzXEB4r8hYmkanPpUSE94/XIaqtqOvOuVHQhODqf39rlmCuCEn7BV8KW/6IMmHwcJeRIkZWKava9qBuZITzNn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526789; c=relaxed/simple;
	bh=chtisksDWQeKKSd3BqZElfuZnqmZwkIvrdFfyKKOx1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZNMAJZv7NwGIDJdYGavmQK535AN1vvEwnWThSbbkmY4FQ2D8f1oWYzKuHsZnAm4kJBK1OzsPkixyfeRbQu7KItr8pzS6q5QZSurMHCatASJAlQMASVL/eTN9OQlfiNRjRnnKTSSTmVneJAsX3lD91OOJzABgAUpzoCeNex8bKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2mEBOBK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2mEBOBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132C6C113D0;
	Tue, 23 Dec 2025 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766526785;
	bh=chtisksDWQeKKSd3BqZElfuZnqmZwkIvrdFfyKKOx1A=;
	h=From:To:Cc:Subject:Date:From;
	b=A2mEBOBKzz596yh2/QGl31BcW5qIMvHu6UaEfEsaSuA79JmB/Awqw1JK3uJnWzX0t
	 0Z/Sa2EpZJpYpSeSUoxfEnbvsZAaEdGSkpuP4eOurvppWND2lMbP5nH+DsQ9C046yX
	 JozoFY1EdUYV/7AHQk/hkZvkQk+KxxqWj40WFFku6bpYNRGipsDSg3N6tT1NHaPOSm
	 o56JAexgeYqr6PrkPbC2eJL2/6KRXdItVch7c104+uyzBv3C7IJ2TCDwpguZSSFLql
	 mm1fcumhy15TvDEqKrlzPOTiwihq8o16tA9MGnTu96y8/S4TtdwM2G6fNHU8PIiWan
	 ad5KzEOc6IzEg==
From: Arnd Bergmann <arnd@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuming Fan <shumingf@realtek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt1320: fix 32-bit link failure
Date: Tue, 23 Dec 2025 22:52:53 +0100
Message-Id: <20251223215259.677762-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A plain 64-bit division causes a link failure in some configurations:

ERROR: modpost: "__aeabi_uldivmod" [sound/soc/codecs/snd-soc-rt1320-sdw.ko] undefined!

Since this divides by a constant, using the div_u64() macro ends up
turning this into an efficient multiply/shift operation where possible.

In rt1320_calc_r0(), the open-coded shift seems a litle simpler.

Fixes: da1682d5e8b5 ("ASoC: rt1320: support calibration and temperature/r0 loading")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/rt1320-sdw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 342494e0fc5a..245b9d9980f9 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1065,8 +1065,8 @@ static int rt1320_invrs_load(struct rt1320_sdw_priv *rt1320)
 	r_rsratio = rt1320_rsgain_to_rsratio(rt1320, r_rsgain);
 	dev_dbg(dev, "%s, LR rsratio=%lld, %lld\n", __func__, l_rsratio, r_rsratio);
 
-	l_invrs = (l_rsratio * factor) / 1000000000U;
-	r_invrs = (r_rsratio * factor) / 1000000000U;
+	l_invrs = div_u64(l_rsratio * factor, 1000000000U);
+	r_invrs = div_u64(r_rsratio * factor, 1000000000U);
 
 	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
 	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
@@ -1087,15 +1087,15 @@ static int rt1320_invrs_load(struct rt1320_sdw_priv *rt1320)
 static void rt1320_calc_r0(struct rt1320_sdw_priv *rt1320)
 {
 	struct device *dev = &rt1320->sdw_slave->dev;
-	unsigned long long l_calir0, r_calir0;
-	const unsigned int factor = (1 << 27);
+	unsigned long long l_calir0, r_calir0, l_calir0_lo, r_calir0_lo;
 
-	l_calir0 = (rt1320->r0_l_reg * 1000) / factor;
-	r_calir0 = (rt1320->r0_r_reg * 1000) / factor;
+	l_calir0 = rt1320->r0_l_reg >> 27;
+	r_calir0 = rt1320->r0_r_reg >> 27;
+	l_calir0_lo = (rt1320->r0_l_reg & ((1ull << 27) - 1) * 1000) >> 27;
+	r_calir0_lo = (rt1320->r0_r_reg & ((1ull << 27) - 1) * 1000) >> 27;
 
 	dev_dbg(dev, "%s, l_calir0=%lld.%03lld ohm, r_calir0=%lld.%03lld ohm\n", __func__,
-		l_calir0 / 1000, l_calir0 % 1000,
-		r_calir0 / 1000, r_calir0 % 1000);
+		l_calir0, l_calir0_lo, r_calir0, r_calir0_lo);
 }
 
 static void rt1320_calibrate(struct rt1320_sdw_priv *rt1320)
-- 
2.39.5

