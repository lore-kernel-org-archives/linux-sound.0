Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57774E0A
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159946; cv=none; b=cTHdDuNhRp2YkpLRvyUbdEFRlKB9zT4oHp4gKJQ6Ckmd0CtBdrBuBwBfwXOuUESMqTASlZpBsaJKj7kiABdP86pn660IeJnCeKrJ2tY84rftOfuggk/GdlfEfl6cz1sX2MqObnIAJG8lTwY1ti3gVldCg3izOfxz0GhXXJ1gt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159946; c=relaxed/simple;
	bh=yG4XwU75ZxFshbYkRVXzI993znr4vBhQUNHu8u62aNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYs/vr5whOKN+sFvHcWLiJbzdO337jtjyjAmuUbmXKNXkE/iAJx1U294WYKO3Vu9Aj24TWZw2fiigScPWnQRuFt7goWna0uoTP2rYXNFaofShugX8ajPNuuqWSRm2wwEZeXdR5Yl9ZAgNSsL3dc0GPo9fiXY/mW+rnmH/bK0Uvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD03534EA2;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A47B13A3D;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2FuNIIVDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 7/7] ASoC: xilinx: Add missing module descriptions
Date: Wed,  8 May 2024 11:19:06 +0200
Message-ID: <20240508091909.27062-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: AD03534EA2

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 ++
 sound/soc/xilinx/xlnx_i2s.c           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 299cfb5e2022..158fc21a86c1 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -721,5 +721,7 @@ static struct platform_driver xlnx_formatter_pcm_driver = {
 };
 
 module_platform_driver(xlnx_formatter_pcm_driver);
+
+MODULE_DESCRIPTION("ASoC driver for Xilinx audio formatter");
 MODULE_AUTHOR("Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 9de92d35e30e..ca915a001ad5 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -253,6 +253,7 @@ static struct platform_driver xlnx_i2s_aud_driver = {
 
 module_platform_driver(xlnx_i2s_aud_driver);
 
+MODULE_DESCRIPTION("ASoC driver for Xilinx I2S audio");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Praveen Vuppala  <praveenv@xilinx.com>");
 MODULE_AUTHOR("Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>");
-- 
2.43.0

