Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB53B19A3
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=qgI8SfUTJabL2e/RDO9QqyMTVC6ImcyJVeProwv3tF4awDlzv2w7lHVtJZIu8eCqq7vElcN9s1dU6mkBFpca3+FLMdwgZW+9C3m5wznJwu1A7dwp4rxMS7hOa0jf/pjXoBwINMbg9uhc1Ho6j3pnw8Y1srWh1KsrEoGjI9TMDf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=2uWE5+OwNYjELUgmjJQoo3invKIRKlaz5dcKxblbQA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDHuzBtLMtrZ8TWZVnypn/JLXLaOC1bZIeWLzwp4+edhpcm2z6zeDdON/XRSPXZXgeMIcrBarJdnybRQ1+x1Vkijyx1R1YktoJFpK+KIgVpPXnoAsQBjqs9Lr+bKe/og+9w/djpkJfhVP+HNrqcGK8/Ir/Ng3CIP3qP6IXRZBHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iepB8Ayi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N0aECzat; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwWepPIn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bFUof2fA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iepB8Ayi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0aECzat";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwWepPIn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bFUof2fA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC1613E2A;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLJ0VbZak4DPljRHisdafBkQZXvlUzH7pt5YZxS/Xso=;
	b=iepB8Ayio+LliU+wJLPvGHqKzGkdYwnnGKanQwE91X6zjNc8nvWhiaskKYuEXyHYYW9jzA
	VG/8tkW7rjUrFh7alFjfFGFldTgLQ1xmcDUlu/SGBX7FNtOrKYEzrFYzVcChXQziDx1al/
	0lBuX8W2TFCpvh60hK99ZIjxYkTNRhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLJ0VbZak4DPljRHisdafBkQZXvlUzH7pt5YZxS/Xso=;
	b=N0aECzatL59i6GlNaZoQKyM6SBxQ7hnWwXDUiqek5+HMp7nKq9DUOgiMk6+zc7+mnSxMH9
	fIR5vYyiRACmnaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLJ0VbZak4DPljRHisdafBkQZXvlUzH7pt5YZxS/Xso=;
	b=XwWepPInA5D6hluVHm1qkFdNHvsziHKOCyRh5lnFkEor3ud6twLllkJM0N2b7RGkCdg/QW
	aLsmLQ09+wbx1jqbH7UKvynduSRD9Ujfbr79VVbPjmaMltKlMBO258QOZuOmrSXylmO9CV
	LZGGQAkdhxrpl1TEl5G17KXSQuetFTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLJ0VbZak4DPljRHisdafBkQZXvlUzH7pt5YZxS/Xso=;
	b=bFUof2fAudGjQ9nMTH8qYU0khJ23DzN4NBAkkStu7S3AGkT6hdmqrqdpjfsA3+hGron5V2
	ozfVGUua0aJBQ6Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15EF777A22;
	Thu,  6 Aug 2026 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EObvAG+TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 23/31] ASoC: wm2000: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:55 +0200
Message-ID: <20260806140006.1412298-24-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix warnings about mixture with goto

 sound/soc/codecs/wm2000.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 897b0acac5f3..41c8cfb346c6 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -796,7 +796,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 	struct wm2000_priv *wm2000;
 	struct wm2000_platform_data *pdata;
 	const char *filename;
-	const struct firmware *fw = NULL;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret, i;
 	unsigned int reg;
 	u16 id;
@@ -814,7 +814,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(wm2000->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto out;
+		return ret;
 	}
 
 	for (i = 0; i < WM2000_NUM_SUPPLIES; i++)
@@ -908,9 +908,6 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 
 err_supplies:
 	regulator_bulk_disable(WM2000_NUM_SUPPLIES, wm2000->supplies);
-
-out:
-	release_firmware(fw);
 	return ret;
 }
 
-- 
2.55.0

