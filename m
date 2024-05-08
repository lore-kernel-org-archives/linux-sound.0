Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F08A7442D
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159486; cv=none; b=cYI6hDSWgAFQvvTMaCfdrh/kUn/btEZ7UekmMmgOF517f0Wlw705kzXCySxJGC/x7AlpE8BU4rIVvocr0quDfyLxTKjOsO20qa92C4rmi4mFZLhjkXQxYeiR26yK8vAnEVr79B3tOGhrY2wvCu5qw24lYYSv5K/wI+s2SO1uBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159486; c=relaxed/simple;
	bh=xskcIyrXGn0ZEl2R5E9LFAysL67FwDQzw17a1eWmeVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvwgxFfhzy0NHbDJOSgK1Pl0KazE17vHu2BIvc9SQ85DHE/+sSOrpOUceyrFc1HW6KRlp9Hp7ZW/nWXXAKUcnXvnFwyJ4O9S9ECsSlThVNkrSZ2xmT+coNge9nGhAfDIyYtLTl5M3m91pw7sJ1bfQvEjqWwdpgyLzXNT+OvC2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uYoMURD3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eJUtyd6k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uYoMURD3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eJUtyd6k; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uYoMURD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eJUtyd6k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uYoMURD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eJUtyd6k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4732522073;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP4FWmnBsBF6SKq0FRPk5cJSGEoq6/Ys2QgpKGBo1YE=;
	b=uYoMURD3BFw7W44Gjs1/i6ixP13SGyVSkjvgVqbtq8Aej9pAkMafmb6BQSo3xH+eqGNQLE
	5cdd2UumLIm6FmqUQKDOzQC6nX7Jo3PcmxZCe9tOxtx24l8LfmZgBzgu7WDNQgTvXWuiXf
	G98mjjvIs3xe8ElvICRZ8JVWrgR811I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP4FWmnBsBF6SKq0FRPk5cJSGEoq6/Ys2QgpKGBo1YE=;
	b=eJUtyd6kQlfXydL7PtscKeuM8C2dMGL/BygQ65P1faYrI6mti0NV2PcNCIGowHUc2E/Hqb
	pgp8fRxzzMtp3uCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uYoMURD3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eJUtyd6k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP4FWmnBsBF6SKq0FRPk5cJSGEoq6/Ys2QgpKGBo1YE=;
	b=uYoMURD3BFw7W44Gjs1/i6ixP13SGyVSkjvgVqbtq8Aej9pAkMafmb6BQSo3xH+eqGNQLE
	5cdd2UumLIm6FmqUQKDOzQC6nX7Jo3PcmxZCe9tOxtx24l8LfmZgBzgu7WDNQgTvXWuiXf
	G98mjjvIs3xe8ElvICRZ8JVWrgR811I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP4FWmnBsBF6SKq0FRPk5cJSGEoq6/Ys2QgpKGBo1YE=;
	b=eJUtyd6kQlfXydL7PtscKeuM8C2dMGL/BygQ65P1faYrI6mti0NV2PcNCIGowHUc2E/Hqb
	pgp8fRxzzMtp3uCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AEA013A3D;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8DFlBbVBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/7] ALSA: ac97: legacy: Add missing module description
Date: Wed,  8 May 2024 11:11:20 +0200
Message-ID: <20240508091128.25274-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.85
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4732522073
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.85 / 50.00];
	BAYES_HAM(-2.84)[99.32%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ac97_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
index 7ea274c55900..1484fc178fa4 100644
--- a/sound/ac97_bus.c
+++ b/sound/ac97_bus.c
@@ -95,4 +95,5 @@ module_exit(ac97_bus_exit);
 
 EXPORT_SYMBOL(ac97_bus_type);
 
+MODULE_DESCRIPTION("Legacy AC97 bus interface");
 MODULE_LICENSE("GPL");
-- 
2.43.0

