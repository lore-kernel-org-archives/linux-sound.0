Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75618BC2F
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938505; cv=none; b=NohLSxEqJrtHG6D5O03FZZ72daPnqDQlc6ndKozcQVV/v3Sdm2S/RC2ZNW6rCjrcdYNt5YPYGsn3devWSNhwn1UHT+4nxlArYEFCfwAbi0UrjSWh1ibY6d5a1YfHh4APmNaoB3xDkazqn5wo3Oz6NNnUwoq6ln1OFbKd/oa5fFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938505; c=relaxed/simple;
	bh=X97KUKmbzUHAvQ9lppO/yqeLZu5oLRLKlmwZEKx55g4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgvdcogkgOgFhxsLLOIhFeTgmpmUFn3yTgyI6sGPOSA4zd08seAUSVE6bQjHUH1oy4Ad6Dol9MzX8kBCP9igOT5fOKwwflrthk6nWt5Xc9C5GMUp17WpUsrc+IxW9aKWi1Vhnzb+f0RwZkAeGp3GqfmCa3S2zhbcb4z3j4ViXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txBvE-0001nz-QZ; Tue, 25 Mar 2025 22:34:56 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	robh@kernel.org
Cc: kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: soc-core: fix bitclock-master and frame-master present check
Date: Tue, 25 Mar 2025 22:34:53 +0100
Message-Id: <20250325213455.3952361-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org

To check for a none boolean property of_property_present() should be
used instead of of_property_read_bool(). The later returns a warning
since commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used
on non-boolean properties").

Fixes: 69dd15a8ef0a ("ASoC: Use of_property_read_bool()")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c6d8aef4130..1e0cdd778a3b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3403,12 +3403,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	 * check "[prefix]frame-master"
 	 */
 	snprintf(prop, sizeof(prop), "%sbitclock-master", prefix);
-	bit = of_property_read_bool(np, prop);
+	bit = of_property_present(np, prop);
 	if (bit && bitclkmaster)
 		*bitclkmaster = of_parse_phandle(np, prop, 0);
 
 	snprintf(prop, sizeof(prop), "%sframe-master", prefix);
-	frame = of_property_read_bool(np, prop);
+	frame = of_property_present(np, prop);
 	if (frame && framemaster)
 		*framemaster = of_parse_phandle(np, prop, 0);
 
-- 
2.39.5

