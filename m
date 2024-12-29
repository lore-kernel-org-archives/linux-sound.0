Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEB9476
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735494240; cv=none; b=t5iv/mUtM3jQjgpp848hoA/sNhqpBxJChDuaNs+Vz82fy69VUtGdDgzGcGy+FQ7SbXxsZHPLr/34ziNx2eY55KiWgtn/9NAnuyY7nfGTC2PX80sZv87zEHKjjqhVOqU0hKduxcsQPEMbjp1Zw5s3yae9lusTnMzjTukpZFrgAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735494240; c=relaxed/simple;
	bh=SeRSMl6zLVeJg78I9sZ1SRAQ/FgcXFp8bKcaEKNCSyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KA44P4gCVzRIM/yyOqvvpVGqkaPGM3jebg9TcNUqsVFUlzb6OQeVdlWF7d4Ea/T9aMm6qfy7Jz0gIOkjoT6KCGlxqL/LM3MyXVWPhdYaAmvSwkHU65Nf/tg4+1pgXw474J0GZ+2FbEMi3nphoNMAOEboHaxjZoXVG3UY91BPUcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Okuqt/fo; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Okuqt/fo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735494225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lZ6p6FAtxrmgDHPJRDTRFHyZSCPREEVTU0sInBqMF9Y=;
	b=Okuqt/folZwHXHXSEhMcFhGTI+e8sMD0IdNIfahtJUDEDVPg7OrEek7cFiUDfQ71lzOwxn
	HtEFXAWeRjGLuXOWg0DskPoOtfDLUtfOAHB9F9elYEzo54MRDi+HmZjsVskSSqmkgufXZH
	7SuD7wOndWOUPXw9+ub27g5G7L2xTOk=
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
Subject: [PATCH] ASoC: madera: Use str_enabled_disabled() helper function
Date: Sun, 29 Dec 2024 18:40:44 +0100
Message-ID: <20241229174043.781856-2-thorsten.blum@linux.dev>
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
 sound/soc/codecs/madera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index b24d6472ad5f..86abfbe56e1f 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3965,7 +3965,7 @@ static int madera_enable_fll(struct madera_fll *fll)
 	}
 
 	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	if (fll->fout < MADERA_FLL_MIN_FOUT ||
 	    fll->fout > MADERA_FLL_MAX_FOUT) {
@@ -4252,7 +4252,7 @@ static int madera_enable_fll_ao(struct madera_fll *fll,
 		pm_runtime_get_sync(madera->dev);
 
 	madera_fll_dbg(fll, "Enabling FLL_AO, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	/* FLL_AO_HOLD must be set before configuring any registers */
 	regmap_update_bits(fll->madera->regmap,
@@ -4576,7 +4576,7 @@ static int madera_fllhj_enable(struct madera_fll *fll)
 		pm_runtime_get_sync(madera->dev);
 
 	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
-		       already_enabled ? "enabled" : "disabled");
+		       str_enabled_disabled(already_enabled));
 
 	/* FLLn_HOLD must be set before configuring any registers */
 	regmap_update_bits(fll->madera->regmap,
-- 
2.47.1

