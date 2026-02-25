Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB583242D7
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009569; cv=none; b=FHYJvRRUpQVC4nphCVDhvYaHtOL3WWesDQ+auLTpeUP9Oowbas8VkDN7RsUOCF8ER5mzuzzM4o1GU2U8b/CoB+5UrDsg/tsXjw2zyqGEHVfGkoMDdiQpgYHHI3tciwFyIw8VBi6MOb44YyNnIfJCJEv0FAgX5zpeIgjqfeN9Oas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009569; c=relaxed/simple;
	bh=5Dazr7K5xhPbh2c5j7qlS/O4Cw9FcvLZl8/V7SRnD0Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHYQc04AyOryaKgwr+x/v8GK6yJGkKGkHiXYNIIxT292gzU1RJ6OS694R9LAjLlNYFki4bXrKRaQaUWt7Qi7OSm6vJy4D6/6oM9PNfuIdrcIODWx9ccfFftRrSTOJwCROkOrteQiEa2ZPocnbm3Me36/of7ziz+0GUB8SpRRIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wbba95Pc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VC3zvHk/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wbba95Pc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VC3zvHk/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wbba95Pc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VC3zvHk/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wbba95Pc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VC3zvHk/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C1ED3F702;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZoaB4xrDa8pUDbARiqX/ATV2BEDei9iBnw/6NRjUCs=;
	b=Wbba95Pck0AHY2VkucKqYIKduLyTEPC2h96/Vvb+6vta9n/QZSg/2XJDuP3GMbdn7Xbrdf
	9LQDRtCLbis4jbMWHtTp6z2ZUcZDIhQ+SHKaYsGvp4ehxwtEzLetgBfpcYGSgzHeqgeUux
	X0dXAHaRWbVkPbElgAbyfWGd0nH2PsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZoaB4xrDa8pUDbARiqX/ATV2BEDei9iBnw/6NRjUCs=;
	b=VC3zvHk/vDqlaYRLR9a9jguV7IuzNEcfwAV58VRWrj7OcTZ2aEE/Koprrsi1p49k1xDxu4
	pQZfq9BCI4nGrICA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wbba95Pc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="VC3zvHk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZoaB4xrDa8pUDbARiqX/ATV2BEDei9iBnw/6NRjUCs=;
	b=Wbba95Pck0AHY2VkucKqYIKduLyTEPC2h96/Vvb+6vta9n/QZSg/2XJDuP3GMbdn7Xbrdf
	9LQDRtCLbis4jbMWHtTp6z2ZUcZDIhQ+SHKaYsGvp4ehxwtEzLetgBfpcYGSgzHeqgeUux
	X0dXAHaRWbVkPbElgAbyfWGd0nH2PsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZoaB4xrDa8pUDbARiqX/ATV2BEDei9iBnw/6NRjUCs=;
	b=VC3zvHk/vDqlaYRLR9a9jguV7IuzNEcfwAV58VRWrj7OcTZ2aEE/Koprrsi1p49k1xDxu4
	pQZfq9BCI4nGrICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 545853EA6A;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMFrE1O4nmlTcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Feb 2026 08:52:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ALSA: usb-audio: Check max frame size for implicit feedback mode, too
Date: Wed, 25 Feb 2026 09:52:29 +0100
Message-ID: <20260225085233.316306-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225085233.316306-1-tiwai@suse.de>
References: <20260225085233.316306-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 7C1ED3F702
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

When the packet sizes are taken from the capture stream in the
implicit feedback mode, the sizes might be larger than the upper
boundary defined by the descriptor.  As already done for other
transfer modes, we have to cap the sizes accordingly at sending,
otherwise this would lead to an error in USB core at submission of
URBs.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221076
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index c887c2f5b25d..2e70dbc479b4 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -221,6 +221,7 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
 
 	packet = ctx->packet_size[idx];
 	if (packet) {
+		packet = min(packet, ep->maxframesize);
 		if (avail && packet >= avail)
 			return -EAGAIN;
 		return packet;
-- 
2.53.0

