Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE937AA9F
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508721; cv=none; b=KCpEYYLiQqOgTInyvFwuUrQEeuDh/S3Ok/4GGM33trgPtXHG83YC7qAh1KbMxrC92/UdEXP2uCAxvlY/3cND9f6KLw0YQIxtbrDr8oOum+kN+BVFCC3YPap1esuis58ieZsDL8wqdo0qFUT6JwW+eWZjWQ2xsl98RO6ksn/kD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508721; c=relaxed/simple;
	bh=GaHICxaAU4nGBCPL94ZwQ9ohUssSv1fN2l915O3gHcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=anQvqbmqnzrwuqoT0vbYOM4utozrwJrGy7GFGcxppBkb0pCRXdnp4XG/4wktHo/3ZmtJKyU/K5qLH+mbMUwgqCL8VUFZb1mva4XzImuan2mTB/Vq83HZFExdbuN4dV9MAvh2hpvrNgly8c38ol1yJD8b5K1DegfNlwOWuXJ8cXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=N34fbKrq; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="N34fbKrq"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6847wGuW5092903, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788508697; bh=iMBGtpZ94KUXdEaObCNQeM35jFMk44DbRMvqAOwJHqQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=N34fbKrqKREAa6HEyMhZ8zYKLCwxo21BqKIOUbOLeXYWKxpnCaM7mXIwkdwNq9hS/
	 JhRHNHZtN34aO9w8Mxv5A2NPdbOiJ92mAltX+LhjExfeY6twphm0kemP/i16LLX8Lo
	 Q2THotvoqnoy40/+2TNxs0OScA7tUfNZrxnOl3BigohSkH9s06MVppaRvlTXVQgWYp
	 ltJszWA3mwxqs0AZIrjlvCbof7oZyr9RexTgJqDWiflTWQbBeJtPS61VRnpP4haIF0
	 4I0CdJS28stu2U1XT14BmLtfKqhXLPAGBifTEglGo/04XDe14RUzwVL2ZvtEECutUh
	 U7Jr+DQ6WDacg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6847wGuW5092903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 15:58:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:14 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 15:58:14 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 15:58:13 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 3/6] ASoC: rt1320: fix uninitialized stream_config->type
Date: Fri, 4 Sep 2026 15:58:10 +0800
Message-ID: <20260904075810.121467-1-shumingf@realtek.com>
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

The stream_config variable was not initialized before being passed to
sdw_stream_add_slave().
This may cause unexpected behavior when configuring the SoundWire stream.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 90333779971d..72af413306fa 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3246,7 +3246,7 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1320_sdw_priv *rt1320 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
 	struct sdw_port_config dmic_port_config[2];
 	struct sdw_stream_runtime *sdw_stream;
-- 
2.54.0

