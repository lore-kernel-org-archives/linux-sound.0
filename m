Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093EE321F46
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833530; cv=none; b=OUwkogQUe5CuOSZyqcj6zPNZQey9lejZBTU5hBO/zSoQNCYQfFPSC4861n7LFSF30+JAmwf/sd7TKIyDc3ujl+LgzI3TNHQOeIHM8hVcn4DpwSqIMPzF1b6kza7R8KJ1VA2T+ILNpQc8vMcOCcrl71c+WE33XOzfzEvQ/tXMiZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833530; c=relaxed/simple;
	bh=UMK6AL1uSkTmoVF1b1tU923K4ylIvaZHqPS3hgLyKKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oez8YLwHkmUOE7LbifGrX7TFLEdcNntQv9FGveDMBt3hZ/Xjenujfm722i15Esm7mL9H4GdaC8ojJobf5VRlMDPBYbiyBoqLxOAyDkyZYlUD6ChjkW9SInQ0G/9PI0ICvrtsQOJ8rDMspF75m35vc/RVjra2D3Me/40kGJCBiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1dvPbEQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kW95np1q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1dvPbEQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kW95np1q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1dvPbEQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kW95np1q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1dvPbEQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kW95np1q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FE59211F1;
	Tue,  2 Sep 2025 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81X6j2vieXmnlrrEaRULj4RBMRmpaJcbGSL/WKkvyrw=;
	b=1dvPbEQqCbywqAAZLeLVU7TNa+z1WDqFOEux+FD6uR6goXtsFiwgzF1paEumZQUeddu9k+
	zirCcc8jrz1cN9kurG1pHZoJDfZBIDBBt0CcT7dWuRS0D1z82wPCV9ufwVq0p74+NsX/8Q
	B9KkwbnY+xiEDBjiG6W9JKck4/V+chU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81X6j2vieXmnlrrEaRULj4RBMRmpaJcbGSL/WKkvyrw=;
	b=kW95np1qFIWe0USSVhnVT1bs2ePzbjbBD4slMQ4B3QrKRuDaPRSanOs7cLAY5uUE5qfJ10
	mq1JwpA4FH8uWyDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756833518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81X6j2vieXmnlrrEaRULj4RBMRmpaJcbGSL/WKkvyrw=;
	b=1dvPbEQqCbywqAAZLeLVU7TNa+z1WDqFOEux+FD6uR6goXtsFiwgzF1paEumZQUeddu9k+
	zirCcc8jrz1cN9kurG1pHZoJDfZBIDBBt0CcT7dWuRS0D1z82wPCV9ufwVq0p74+NsX/8Q
	B9KkwbnY+xiEDBjiG6W9JKck4/V+chU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756833518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81X6j2vieXmnlrrEaRULj4RBMRmpaJcbGSL/WKkvyrw=;
	b=kW95np1qFIWe0USSVhnVT1bs2ePzbjbBD4slMQ4B3QrKRuDaPRSanOs7cLAY5uUE5qfJ10
	mq1JwpA4FH8uWyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AEC513888;
	Tue,  2 Sep 2025 17:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6EErBe4mt2i8UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Sep 2025 17:18:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
Date: Tue,  2 Sep 2025 19:18:20 +0200
Message-ID: <20250902171826.27329-3-tiwai@suse.de>
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
bytcr_rt5640 driver only shows an error message but leaves as is.
This may lead to unepxected results like OOB access.

This patch corrects the input mapping to the certain default value if
an invalid value is passed.

Fixes: 063422ca2a9d ("ASoC: Intel: bytcr_rt5640: Set card long_name based on quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 0f3b8f44e701..bc846558480e 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -68,7 +68,8 @@ enum {
 	BYT_RT5640_OVCD_SF_1P5		= (RT5640_OVCD_SF_1P5 << 13),
 };
 
-#define BYT_RT5640_MAP(quirk)		((quirk) &  GENMASK(3, 0))
+#define BYT_RT5640_MAP_MASK		GENMASK(3, 0)
+#define BYT_RT5640_MAP(quirk)		((quirk) & BYT_RT5640_MAP_MASK)
 #define BYT_RT5640_JDSRC(quirk)		(((quirk) & GENMASK(7, 4)) >> 4)
 #define BYT_RT5640_OVCD_TH(quirk)	(((quirk) & GENMASK(12, 8)) >> 8)
 #define BYT_RT5640_OVCD_SF(quirk)	(((quirk) & GENMASK(14, 13)) >> 13)
@@ -140,7 +141,9 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk NO_INTERNAL_MIC_MAP enabled\n");
 		break;
 	default:
-		dev_err(dev, "quirk map 0x%x is not supported, microphone input will not work\n", map);
+		dev_warn_once(dev, "quirk sets invalid input map: 0x%x, default to DMIC1_MAP\n", map);
+		byt_rt5640_quirk &= ~BYT_RT5640_MAP_MASK;
+		byt_rt5640_quirk |= BYT_RT5640_DMIC1_MAP;
 		break;
 	}
 	if (byt_rt5640_quirk & BYT_RT5640_HSMIC2_ON_IN1)
-- 
2.50.1

