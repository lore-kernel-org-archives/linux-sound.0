Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84E30B502
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303350; cv=none; b=YrjOYeIJ/cjP/5LqwRGB4HCpcSlR9chBGd5HQssV1oZOpl4vrxyNFA6TJ/R4Qu/Vq2bIbC8VVaAp+VOjP8nLYNA8QEc+zmC19k46TCSosiLSL8MzrQj9hBcVJrP+w6pGxQpeo/G//ihnDauUMwhUoRHa0VUdFt/Th3H/9OGJ+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303350; c=relaxed/simple;
	bh=881bXsQ2TH5a5V0xQBYFtWrvIYVf280IqVL1fV/9xB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M8ygRC23SoRUBmxvYCZsDIllbVjzTdD/8Hwk4ab10paV8FEctKVwdbvFVdhsxPqjDkAp8lmgoZKpiURhNSI8gcgJjhRKwZKofsL7fKiHRNL83sSA28sUvtC5L+HSK3tymuuitZPTRpk7LtpGk8mgbgqEurgq/pg60/xb0HP0DZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AUE6vELN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NwRPL9yC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AUE6vELN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NwRPL9yC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AUE6vELN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NwRPL9yC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AUE6vELN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NwRPL9yC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D258B5BD31;
	Mon, 27 Apr 2026 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777303347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yzxDxp3tgrK7cuYPKZq9C8TKzd3qSGXfqAY/NJhy3Q0=;
	b=AUE6vELNfnbU9LUtRPFsO98RdzBk9y875a1+ABnDGxinzN0Vjes2oc7wKLP/76TuYvJzwK
	g7HxJQu3eJSo6HqO9GTBeXJsb8KyS1e34X09BYuXmilMUs5M0Vc5Qxi+VEROeBNiDxV826
	Yepv/17ZlyFf5/NHdJyHNU8xlqnHVwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777303347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yzxDxp3tgrK7cuYPKZq9C8TKzd3qSGXfqAY/NJhy3Q0=;
	b=NwRPL9yCo+vRenBh8KrVTbq/Qq8JVhQWJMdDWwPHj5TGPhmnnC6xEvdpmP9I1xGy4DCsRo
	sfeMDNJ72KAuQ3DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AUE6vELN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NwRPL9yC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777303347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yzxDxp3tgrK7cuYPKZq9C8TKzd3qSGXfqAY/NJhy3Q0=;
	b=AUE6vELNfnbU9LUtRPFsO98RdzBk9y875a1+ABnDGxinzN0Vjes2oc7wKLP/76TuYvJzwK
	g7HxJQu3eJSo6HqO9GTBeXJsb8KyS1e34X09BYuXmilMUs5M0Vc5Qxi+VEROeBNiDxV826
	Yepv/17ZlyFf5/NHdJyHNU8xlqnHVwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777303347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yzxDxp3tgrK7cuYPKZq9C8TKzd3qSGXfqAY/NJhy3Q0=;
	b=NwRPL9yCo+vRenBh8KrVTbq/Qq8JVhQWJMdDWwPHj5TGPhmnnC6xEvdpmP9I1xGy4DCsRo
	sfeMDNJ72KAuQ3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEF88593B0;
	Mon, 27 Apr 2026 15:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id emH6KDN/72kYTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 15:22:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Avoid potential endless loop in convert_chmap_v3()
Date: Mon, 27 Apr 2026 17:22:15 +0200
Message-ID: <20260427152224.15276-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D258B5BD31

The convert_chmap_v3() has a loop with its increment size of
cs_len->wLength, but we forgot to validate cs_desc->wLength itself,
which may lead to potential endless loop by a malformed descriptor.

Add a proper size check to abort the loop for plugging the hole.

Fixes: ecfd41166b72 ("ALSA: usb-audio: Validate UAC3 cluster segment descriptors")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index f8f56ace5652..b2c5c8198281 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -353,6 +353,8 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 		if (len < sizeof(*cs_desc))
 			break;
 		cs_len = le16_to_cpu(cs_desc->wLength);
+		if (cs_len < sizeof(*cs_desc))
+			break;
 		if (len < cs_len)
 			break;
 		cs_type = cs_desc->bSegmentType;
-- 
2.54.0

