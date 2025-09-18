Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E913C8FF
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194493; cv=none; b=gka+Uo4xQoZfrnw6ajCGKyhp4aM1VX9x87smwaFJJ4hX6+tUoeFpKHFwvtJxI76Q/7tPrqAAqsHmgpF3cyQ0e0/iCHD4AoJ0Q0Py1Nwh7ESd3v/PZcGeM5NXTfyom3o8nJkKV8ykrXsWkfl/EFtMeSE3I496lu6odM3oQW9c5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194493; c=relaxed/simple;
	bh=WEa6is6m16w0o1GnlTpu4Z4MOHk4RhV2VSpcw14U1VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgL0zHk6Q2ey2y37kKHrBXGMs5NLcVVl19eEs/Dqxg0rp8MxyJzHdcp8dBdu+zWqGmdiFPcF2gOD/MvfYZ7l+PBW/Kfc1ciWk7o7cvU2VwzBwd9InUdB3xGaHQdOirp29gzIum1Mn7tuM2zJ7tyu8FnvIYhWDp/TEx+GeKQIAhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OV2lcIeG; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OV2lcIeG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758194484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=33NI10JupNvzF5LVk088MZ+tWcPvXkOtTzuIPkgIQlE=;
	b=OV2lcIeGO4gg71RHX8vqR+xJ1Kdl1nvhZ+LCImJeLBcA8n7apT6HhRPvU2oZ/VtqZ22kC1
	hFfrqTVvTvdAlWllI+eBNmJhyZJ01qXoiwWkO5QvEwQrziAHrOnNXp5H3lwniaXxMVGkIR
	juG1QjQX/mspF/P43V12sAub1fCG9LY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: pxa: Return -EOPNOTSUPP instead of -EINVAL
Date: Thu, 18 Sep 2025 13:21:02 +0200
Message-ID: <20250918112102.64314-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Return -EOPNOTSUPP from mmp_sspa_set_dai_sysclk() instead of -EINVAL for
unsupported clock ids, and remove the obsolete comment.

Replace other -ENOTSUPP returns with -EOPNOTSUPP to comply with SUSv4
error code guidelines and silence multiple checkpatch warnings:

  ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/pxa/mmp-sspa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 73f36c9dd35c..38815ca8f152 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -111,7 +111,7 @@ static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	int ret = 0;
 
 	if (dev->of_node)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	switch (clk_id) {
 	case MMP_SSPA_CLK_AUDIO:
@@ -121,8 +121,7 @@ static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 		break;
 	case MMP_SSPA_CLK_PLL:
 	case MMP_SSPA_CLK_VCXO:
-		/* not support yet */
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
@@ -139,7 +138,7 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 	int ret = 0;
 
 	if (dev->of_node)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	switch (pll_id) {
 	case MMP_SYSCLK:
-- 
2.51.0

