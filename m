Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9B45009
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 01:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736212458; cv=none; b=owZ9BBY14E90NJCsgBowXU6Wf3yZe02gUjRPybYb3imrkHNIF8LdwXMC3m0iFWQEdrmJGmWTbTq7iIcWBI2pTDU+wsEnK6wJSD6wJDHVXkncbO5hv5pyFh5022mW1OaWnuf49XvKhqLvgW5dlbbM1Hdy0WxT1DitGBqKc5sOb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736212458; c=relaxed/simple;
	bh=j41OwEow2/+WtKRTYQfmbGjuloR6Ei1FggzMYIFE9Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xws730IueXx1Twkw31N8kEMdUEfzBqehoYGAWB87iM+mNFpVHL+mjoi54hBixix4esD7hR3c/vCrkDoTeSpH1R0sVL0RKqlwRN6UWFK8cUonOko0SVYE2NYzJ3AHRNc8i2czAOf3IE0d5sxKMgrwsp3pWpm+DEs3Wz20dKhLSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ahhna+cM; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ahhna+cM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736212453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GjcpN1zi/1kRiTx1RxUwnV4AY0SoIg2jqQa48YTM6Ec=;
	b=Ahhna+cMYgfzVis159qNHlUFhRcaLBke4u+JVqpeMfEZ0hH8vlw3mmQaHVmYxn8RZsVB9U
	+a0EmEgLWO/kFRGje841XdSDmCS/SyK1hK1doY7JQ2E3wxdTYkXAgciYDGLbhFxXy3Rv0K
	5pgrEfvAj15/A0Km/GpgmvZF7wlKRUo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: madera: Use str_enabled_disabled() helper function
Date: Tue,  7 Jan 2025 02:13:54 +0100
Message-ID: <20250107011355.2035-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Include string_choices header as suggested by Charles Keepax
- Link to v1: https://lore.kernel.org/r/20241229174043.781856-2-thorsten.blum@linux.dev/
---
 sound/soc/codecs/madera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index b24d6472ad5f..a840a2eb92b9 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/tlv.h>
@@ -3965,7 +3966,7 @@ static int madera_enable_fll(struct madera_fll *fll)
 	}
 
 	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	if (fll->fout < MADERA_FLL_MIN_FOUT ||
 	    fll->fout > MADERA_FLL_MAX_FOUT) {
@@ -4252,7 +4253,7 @@ static int madera_enable_fll_ao(struct madera_fll *fll,
 		pm_runtime_get_sync(madera->dev);
 
 	madera_fll_dbg(fll, "Enabling FLL_AO, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	/* FLL_AO_HOLD must be set before configuring any registers */
 	regmap_update_bits(fll->madera->regmap,
@@ -4576,7 +4577,7 @@ static int madera_fllhj_enable(struct madera_fll *fll)
 		pm_runtime_get_sync(madera->dev);
 
 	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	/* FLLn_HOLD must be set before configuring any registers */
 	regmap_update_bits(fll->madera->regmap,
-- 
2.47.1

