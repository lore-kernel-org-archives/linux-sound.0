Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091048;
	b=J08Pj7gjcUbBOtrz2yq0o+peYWoL5EwH2sqEiaXQ6wgLtlIRlC0P5nJVMhu6xHOREH4o
	 166KJrw9vFkEfvmo/bPpharU/puk1HYSuZ3zLdNvVHAXpUh6/U6YfoaD0ardUQVrbbJ/3
	 A3oe5DNZfUZI+RLNKo26kv7qWwa9QfZEmcSJHk+J71K7+iawilxYeWOtA1gWgedT8GifT
	 1cuAtd1aFZ/loKkH6WS46ACdXdj0MJ6idIgfFgY2fa8FVoRG+jXsX/VooWLmeti+mr/kT
	 jPKaORhpcyjSiBRIExDKjHbdzwOjLT3R5oBOQ/f9Pv0wEgPtu5dzWS0jwtGvCh42ZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091048;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=wd2UA6qgOcs7aQYLlQST2OtjQ8yew/a9INiOBRetp/0=;
	b=E12IBAhbZXDKQtFRBiEB0gKFzVxHI5XyBFouoVWCas/H64Y3gM7tKDqFHb9sUw9sCDcs
	 PeP+Y9EwliHsUun6A0zioE8GLsn8uetxBCZyJvDmwaXA7/sWNrVFi+tNFIglJyVJNESI5
	 JEKA4I8OA0YfQnv10lwQYvRgftpYttLXzQZAkhP8EauCdm0t+xikReTjrYQqLVsPqljPg
	 AXLAfscrQNI5uZjUp2VOEZztNCQcmtpE4LNRJC1woJJBbnIEb/jwCXo0lr07XC/DuQeYX
	 RJy1LqXR0l2mOvwKEg5oUGV8c+WCgYNrodh8HAspnbqqT1zSRSIjDbI/noEWOeSHl1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vqwXLpsj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LRWfbKPP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vqwXLpsj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LRWfbKPP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A0A606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 12:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vqwXLpsj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LRWfbKPP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vqwXLpsj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LRWfbKPP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FC3221B9C;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wd2UA6qgOcs7aQYLlQST2OtjQ8yew/a9INiOBRetp/0=;
	b=vqwXLpsjXC9Xcyt5wEQ95Ese/3ILdYEFBPuNlfYFd/sfFXxdD5NbGMlDDhL+hvp0QLgEPw
	pdNN5brAkxu+I7OSASI3jiN8Bvkr/ZtwfXWdslA+/GX7E5J79jj8vixBbZMDLDZbw9klG/
	bb0zsMKJsUFCuqsHJBOMAraDZ7rG3dY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wd2UA6qgOcs7aQYLlQST2OtjQ8yew/a9INiOBRetp/0=;
	b=LRWfbKPPBmnUjPEagKWrdZE7c75F2q1B1Y7MLtYxAbcq7lHL+4KMTo3nlnb+Jr9vv6bAoA
	Im2qb/qxJwqBAxAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wd2UA6qgOcs7aQYLlQST2OtjQ8yew/a9INiOBRetp/0=;
	b=vqwXLpsjXC9Xcyt5wEQ95Ese/3ILdYEFBPuNlfYFd/sfFXxdD5NbGMlDDhL+hvp0QLgEPw
	pdNN5brAkxu+I7OSASI3jiN8Bvkr/ZtwfXWdslA+/GX7E5J79jj8vixBbZMDLDZbw9klG/
	bb0zsMKJsUFCuqsHJBOMAraDZ7rG3dY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wd2UA6qgOcs7aQYLlQST2OtjQ8yew/a9INiOBRetp/0=;
	b=LRWfbKPPBmnUjPEagKWrdZE7c75F2q1B1Y7MLtYxAbcq7lHL+4KMTo3nlnb+Jr9vv6bAoA
	Im2qb/qxJwqBAxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9151342D;
	Thu, 19 Nov 2026 12:24:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENprLGXq/mqWBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:24:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ALSA: PCM race and locking fixes
Date: Thu, 19 Nov 2026 13:23:51 +0100
Message-ID: <20261119122356.2134523-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

Hi,

this is a revised patch set for fixing some issues in ALSA PCM linked
stream handling.  Now addressed a potential deadlock and a slight race
Sashiko suggested in the previous series:
  https://lore.kernel.org/20261118135558.1928160-1-tiwai@suse.de


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: Fix potential ABBA deadlock at snd_pcm_action_nonatomic()
  ALSA: pcm: Simplify PCM buffer access gate with auto-cleanup helpers
  ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access

 sound/core/pcm_compat.c |   3 +
 sound/core/pcm_lib.c    |   7 +--
 sound/core/pcm_local.h  |  26 +++++++++
 sound/core/pcm_native.c | 125 ++++++++++++++++++++++++----------------
 4 files changed, 106 insertions(+), 55 deletions(-)

-- 
2.53.0

