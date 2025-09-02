Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748092D239A
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833540; cv=none; b=fZCzgCPgGSqpWJkBDyjOOafEcQolV4yxz41maVBTcssRddD6XBCygTzEdAS+xt7Ql3usLzyTfk7dscrNFOtEb5kFTMBwnJDUhiQ0lFzecnMN6FNH59JHpBjCLSdjW1H8P9GK33DNDofuHOUUV1t1DlNuz7eJRTY4NIHZiigDtB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833540; c=relaxed/simple;
	bh=1sSLVXYSZauByzHFajXIPjaV/xOPBqIjHNOaQt4MQII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imzwokY3DGWa46jafJfRKRq8kVjW3BiwSw9+9M36fnpT+lz5H0Gpdpa//D26S2ELF5OhuTWCZdV0rGxcD2S6gzw49STbg7gFqKcL9pEQ10PSv5hymamDcaA5VyuSgLKzoDGBb3tCs6mMxEfjCkuMqad5Q4G3ICydi0eWwEIhhD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LFBeIzvM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a6hiYE2R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LFBeIzvM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a6hiYE2R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LFBeIzvM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a6hiYE2R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LFBeIzvM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a6hiYE2R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F14A211F2;
	Tue,  2 Sep 2025 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYQ9jg8CEZ7jS8cgwoeXNoQaLBwZMmCcnn+wNfH4lVc=;
	b=LFBeIzvMmpIh0PmrF17VNNyzb4UatFFB8NkI587L/2oG80Yybh4RkrfGMK6tMB6umvkv3G
	T2rBjzaI7lx4RZb8DD2HFPDHKd5uHGb1JUcPfheZ2WQxLXYhtlwwL9cThg8nCJx7MJGY7Y
	F/B1AOEyo0vsgXHEXt6qApGqnFZTmnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYQ9jg8CEZ7jS8cgwoeXNoQaLBwZMmCcnn+wNfH4lVc=;
	b=a6hiYE2RyzvD9mjCChXWv2Z1YzPTPgWy1BcqXL1G6v9d1UBoILuY12ASldIebZFQBiC02r
	Du3fcn2zakR4xCDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYQ9jg8CEZ7jS8cgwoeXNoQaLBwZMmCcnn+wNfH4lVc=;
	b=LFBeIzvMmpIh0PmrF17VNNyzb4UatFFB8NkI587L/2oG80Yybh4RkrfGMK6tMB6umvkv3G
	T2rBjzaI7lx4RZb8DD2HFPDHKd5uHGb1JUcPfheZ2WQxLXYhtlwwL9cThg8nCJx7MJGY7Y
	F/B1AOEyo0vsgXHEXt6qApGqnFZTmnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYQ9jg8CEZ7jS8cgwoeXNoQaLBwZMmCcnn+wNfH4lVc=;
	b=a6hiYE2RyzvD9mjCChXWv2Z1YzPTPgWy1BcqXL1G6v9d1UBoILuY12ASldIebZFQBiC02r
	Du3fcn2zakR4xCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46B1F13ABB;
	Tue,  2 Sep 2025 17:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GDn+D+4mt2i8UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Sep 2025 17:18:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping
Date: Tue,  2 Sep 2025 19:18:21 +0200
Message-ID: <20250902171826.27329-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902171826.27329-1-tiwai@suse.de>
References: <20250902171826.27329-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

When an invalid value is passed via quirk option, currently
bytcr_rt5640 driver just ignores and leaves as is, which may lead to
unepxected results like OOB access.

This patch adds the sanity check and corrects the input mapping to the
certain default value if an invalid value is passed.

Fixes: 64484ccee7af ("ASoC: Intel: bytcr_rt5651: Set card long_name based on quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 67c62844ca2a..604a35d380e9 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -58,7 +58,8 @@ enum {
 	BYT_RT5651_OVCD_SF_1P5	= (RT5651_OVCD_SF_1P5 << 13),
 };
 
-#define BYT_RT5651_MAP(quirk)		((quirk) & GENMASK(3, 0))
+#define BYT_RT5651_MAP_MASK		GENMASK(3, 0)
+#define BYT_RT5651_MAP(quirk)		((quirk) & BYT_RT5651_MAP_MASK)
 #define BYT_RT5651_JDSRC(quirk)		(((quirk) & GENMASK(7, 4)) >> 4)
 #define BYT_RT5651_OVCD_TH(quirk)	(((quirk) & GENMASK(12, 8)) >> 8)
 #define BYT_RT5651_OVCD_SF(quirk)	(((quirk) & GENMASK(14, 13)) >> 13)
@@ -100,14 +101,29 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 static void log_quirks(struct device *dev)
 {
-	if (BYT_RT5651_MAP(byt_rt5651_quirk) == BYT_RT5651_DMIC_MAP)
+	int map;
+
+	map = BYT_RT5651_MAP(byt_rt5651_quirk);
+	switch (map) {
+	case BYT_RT5651_DMIC_MAP:
 		dev_info(dev, "quirk DMIC_MAP enabled");
-	if (BYT_RT5651_MAP(byt_rt5651_quirk) == BYT_RT5651_IN1_MAP)
+		break;
+	case BYT_RT5651_IN1_MAP:
 		dev_info(dev, "quirk IN1_MAP enabled");
-	if (BYT_RT5651_MAP(byt_rt5651_quirk) == BYT_RT5651_IN2_MAP)
+		break;
+	case BYT_RT5651_IN2_MAP:
 		dev_info(dev, "quirk IN2_MAP enabled");
-	if (BYT_RT5651_MAP(byt_rt5651_quirk) == BYT_RT5651_IN1_IN2_MAP)
+		break;
+	case BYT_RT5651_IN1_IN2_MAP:
 		dev_info(dev, "quirk IN1_IN2_MAP enabled");
+		break;
+	default:
+		dev_warn_once(dev, "quirk sets invalid input map: 0x%x, default to DMIC_MAP\n", map);
+		byt_rt5651_quirk &= ~BYT_RT5651_MAP_MASK;
+		byt_rt5651_quirk |= BYT_RT5651_DMIC_MAP;
+		break;
+	}
+
 	if (BYT_RT5651_JDSRC(byt_rt5651_quirk)) {
 		dev_info(dev, "quirk realtek,jack-detect-source %ld\n",
 			 BYT_RT5651_JDSRC(byt_rt5651_quirk));
-- 
2.50.1

