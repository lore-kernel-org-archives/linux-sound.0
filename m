Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93468200133
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=AtmNii73PD2Cb+PNXxgKTTRM2mEBcA0rMou/ykjlLsVqHBJvCS499qxBReEhZ6NjrUI9Abd3mALvwl9legVIZ6HttbKMC11lRPLOalgfs4W9ZHKh36h/VGrv9Af/jybzlpc3xEeUX6xEAh/od9WbR5eg1Zq2DKrBLKkwcRAY+M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=PNF4LZixBmFILf1jSwL5cqQGAhg/ggt2pGhAo/TKOfo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsU7MB+Bi/ISRH793zuj7Ys5l3b9zUiKQjVc4Zp1FXr/+pPODTtAY804CPjQ9kM8un1DETNQXA7WU46jVta9z4Ab85lekjl+T3Not25MlLUzmiZuIq25o4iWmFsuE8lbCS9E/jgHeQ2iZtLWKDqwZkes8nZI8jBgE6U6T1Hbdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZX3hGOIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ck+BkYZI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZX3hGOIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ck+BkYZI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZX3hGOIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ck+BkYZI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZX3hGOIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ck+BkYZI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E69A81FB9A;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+/jv6OcRhDa5gXsMrCrnPh14KDFiA9C4uAe8Z+A24E=;
	b=ZX3hGOIMTwOah8D5Am2UisJBEE7TFZqn1xttNfW6fAoIyX7v++3ikJWi5dnyPmlq0CUEG5
	Fh/mow1s7GyQ2ZscjE1TDunn6N8zYP5E6s8gCAHC+FXLC3IAUstN2a8MORmW+mJcT++9/K
	V/XkVeNGsHo0zoqB5Bh3hRkMfTtSn2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+/jv6OcRhDa5gXsMrCrnPh14KDFiA9C4uAe8Z+A24E=;
	b=ck+BkYZIzw7kopZLuCP/dPSHDH2uGKWzntSuUxcBwD/JO3gMwfB++ENdiUWVvFGAK7QJy2
	rQo8Lz9B5y/QaJAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+/jv6OcRhDa5gXsMrCrnPh14KDFiA9C4uAe8Z+A24E=;
	b=ZX3hGOIMTwOah8D5Am2UisJBEE7TFZqn1xttNfW6fAoIyX7v++3ikJWi5dnyPmlq0CUEG5
	Fh/mow1s7GyQ2ZscjE1TDunn6N8zYP5E6s8gCAHC+FXLC3IAUstN2a8MORmW+mJcT++9/K
	V/XkVeNGsHo0zoqB5Bh3hRkMfTtSn2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+/jv6OcRhDa5gXsMrCrnPh14KDFiA9C4uAe8Z+A24E=;
	b=ck+BkYZIzw7kopZLuCP/dPSHDH2uGKWzntSuUxcBwD/JO3gMwfB++ENdiUWVvFGAK7QJy2
	rQo8Lz9B5y/QaJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C364813A7D;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oIqNLtx3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 31/54] ALSA: control_led: Use dev_err()
Date: Wed,  7 Aug 2024 15:34:21 +0200
Message-ID: <20240807133452.9424-32-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.955];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard print API instead of open-coded printk().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 804805a95e2f..54dcfce983b8 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -677,7 +677,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 cerr:
 		put_device(&led_card->dev);
 cerr2:
-		printk(KERN_ERR "snd_ctl_led: unable to add card%d", card->number);
+		dev_err(card->dev, "snd_ctl_led: unable to add card%d", card->number);
 	}
 }
 
-- 
2.43.0

