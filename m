Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBD1CF8B
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235516; cv=none; b=cRunb4pO5tp22jMtlr2zlMP7hxDkcat26WvtJRhtDONALJox3gOhfY4mZmJVgfOiakMm6ljYrWnMHswBRhxfxO+YffW05lh7OTABFBzMIaGN38GnW/4uNR19oGxTT51SHBFsAeMOdbEDjH87sMbeSrO/u6+dTUyvyxaDOWyjUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235516; c=relaxed/simple;
	bh=M20Wj92iwz+A7jCyNKJFt3EjWGT4Ew0TXw8VCB/bNnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDroZWCErvrfO+7U+SANCAYfCRKC9KTQMPLNm+4aDDI6NjsgTHUa0ng7SzKxUC2Ac/in3D+0Stg3jluhF6kLntDDkv+SuIDbgEaaoHOD/CLmJqdr0EC/o4WAphxSwan4m0FrZ/Y6PmJMUFLjNCTQ43EI1pknCwi6aAbTZzjroT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eUvT3lSd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pZz+xdyy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1SXbefWu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IZoFhiHz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eUvT3lSd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pZz+xdyy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1SXbefWu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZoFhiHz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED2592115F;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po+KG/tfCrPL+XU/pxit5serLcNr8EG5K6rGRmAY2xA=;
	b=eUvT3lSdYRt1eeDsxxELDx3g0qcGwfnn1Z/niOt/mDEjI1ZzOj1oIH8NHIkSzPdWeND5+w
	CX+jNd4Ouplct5hWZl9miq+p+yQZzBmCXkON0muzlStuqFUf5Kenx37QUiiZH9AooqIbYl
	IbgFMlm3REJVmVxPCbz4gxKr1G8pubI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po+KG/tfCrPL+XU/pxit5serLcNr8EG5K6rGRmAY2xA=;
	b=pZz+xdyyzA1VkJ4yWMDfFZwtDSsXsDbS+PIkYT2xRnYfVdbGFlMC8T4W6pqomWt2lP2QWV
	6PFk97PYP0q8yWBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1SXbefWu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IZoFhiHz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po+KG/tfCrPL+XU/pxit5serLcNr8EG5K6rGRmAY2xA=;
	b=1SXbefWuc1E0F9yiEmM+EaH8a52JP0/pz9F8coYmurw4rBsxpCvVNR6iakYOgsDNDl/Pko
	bJuWcXIky4cg3KU/oT+eSptlFzk1R2meSbfERwGecYBOFrXQwg0qtlaMaQD9mFIlbL29sJ
	hTs56Pp4MUDj+rECeyXIMMxsGNMmSaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po+KG/tfCrPL+XU/pxit5serLcNr8EG5K6rGRmAY2xA=;
	b=IZoFhiHzFQwdfNn7vn8i1m2Q07Imr9dSAkt7p76zoS3RbDbQkMbXNgpTZgKa1eAKis1Fz5
	J4fT8+P9mQpyrJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCA4A13A54;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBdXNTgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ASoC: wcd937x: Use *-y for Makefile
Date: Tue,  3 Dec 2024 15:18:20 +0100
Message-ID: <20241203141823.22393-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203141823.22393-1-tiwai@suse.de>
References: <20241203141823.22393-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ED2592115F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

We should use *-y instead of *-objs in Makefile for the module
objects.  *-objs is used rather for host programs.

Fixes: 313e978df7fc ("ASoC: codecs: wcd937x: add audio routing and Kconfig")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5a83ee963966..d7ad795603c1 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -334,8 +334,8 @@ snd-soc-wcd-classh-y := wcd-clsh-v2.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
-snd-soc-wcd937x-objs := wcd937x.o
-snd-soc-wcd937x-sdw-objs := wcd937x-sdw.o
+snd-soc-wcd937x-y := wcd937x.o
+snd-soc-wcd937x-sdw-y := wcd937x-sdw.o
 snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
-- 
2.43.0

