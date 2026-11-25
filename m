Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614248;
	b=RzGHaaSwNNq8586WTyaCgNklhg+b0Cd6AdQZFBgeAR4RwILogBHqOFfublAdyu2pZPtq
	 XCsPiI/8RvBoDot00ulPXJWnDi+VUwh75KtbQn9rpqY6+2RZIvRKNkEF/d2NkTdzo2s+k
	 bX4AqzzBaS5Ljy9FQVGCRaeihAqQY4vLZsGo65Z3RePgv+uD6RqgWr5CTRdyiqHskX0O8
	 YOssaOBHv0k4tFuk2C99PGk2XlvGzmyc5OnRkY/4AiZ/PkCeFgw+yxd7FzKzCZWvkztbk
	 kEdEkrLAeCy02otAxn6MVj+J6Ko4GvQSZ4JmgHERHYKa53PoJllZ6bxleCmlQB2VA0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614248;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=j3q9HpPZth+HMejjeUdO8k48owPnV5FzqlGhIFg0Rxc=;
	b=tvCfjqmPTPQJcp+715R+nBbPXIDZNA/+fdhn5bA3Fkd18IG6PJU14q0SWPL/hhBZHHxO
	 51R4pbuMlbq2/eDBVuCD1irsVOM/ddydnv52BjBpL5XAAUmkKYoRKTYwG9vjJEBKGhwkT
	 rZkTBVQlMP8PBmCUJ//5RztYuF4SbVKszi7SRv+y0CHyr4dXHhfap91A3VZ9RQhkzUWex
	 DQB6B87P3qs+4H/awvav688EbV359/7OC9cCUuFVRbdipSPkyry921HAIpPJauAXMZ/AS
	 4qNQe1rcD0AATP8cQs+DTrRneOHLfB/8EXTQfg0spjrX5YzQx4t9ZsXF1wNiK3tH5kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y9TXVxmb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pblz3atp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y9TXVxmb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pblz3atp;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0557606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0557606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y9TXVxmb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pblz3atp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y9TXVxmb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pblz3atp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC9641F7E4;
	Wed, 25 Nov 2026 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3q9HpPZth+HMejjeUdO8k48owPnV5FzqlGhIFg0Rxc=;
	b=Y9TXVxmb0kpfeezSInu/kOJ+oQ/DsRLB3++/b8F/mZkjd5JjMkKOuMHBzHfMcmsOgR6pkn
	ljouifGB5+14z8sUaDkkc5NjRJGL0tjnCFNn2TPSTY999IB+loAo2FIPxf/1cOI1otgmnB
	Q6XHd7nrpnda88cdOCZ1pTWop+FqZOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3q9HpPZth+HMejjeUdO8k48owPnV5FzqlGhIFg0Rxc=;
	b=Pblz3atpgow33Y85Hl6OKGnTbU2nDz7XnAVALmoRG94dOqU8WSAvtAqAJkD76YRvg1AC47
	wh8WvihrTx/kDADQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Y9TXVxmb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Pblz3atp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3q9HpPZth+HMejjeUdO8k48owPnV5FzqlGhIFg0Rxc=;
	b=Y9TXVxmb0kpfeezSInu/kOJ+oQ/DsRLB3++/b8F/mZkjd5JjMkKOuMHBzHfMcmsOgR6pkn
	ljouifGB5+14z8sUaDkkc5NjRJGL0tjnCFNn2TPSTY999IB+loAo2FIPxf/1cOI1otgmnB
	Q6XHd7nrpnda88cdOCZ1pTWop+FqZOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3q9HpPZth+HMejjeUdO8k48owPnV5FzqlGhIFg0Rxc=;
	b=Pblz3atpgow33Y85Hl6OKGnTbU2nDz7XnAVALmoRG94dOqU8WSAvtAqAJkD76YRvg1AC47
	wh8WvihrTx/kDADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 790BB1339F;
	Wed, 25 Nov 2026 13:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q0moEyXmBmtjNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:44:05 +0000
Date: Wed, 25 Nov 2026 14:44:05 +0100
Message-ID: <87wlq16n6i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: sandrees2007-ctrl <sandrees2007@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Infinix BL51A7H
In-Reply-To: <20261124132641.79890-1-sandrees2007@gmail.com>
References: <20261124132641.79890-1-sandrees2007@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BC9641F7E4
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 14:26:41 +0100,
sandrees2007-ctrl wrote:
> 
> The Infinix BL51A7H (Realtek ALC233, SSID 2782:a24a) has its internal
> speakers wired to pin 0x1b, but the BIOS pin configuration reports the
> speaker on 0x14 and leaves 0x1b disabled.  As a result the analog
> output is silent.
> 
> Apply the existing ALC233_FIXUP_MEDION_MTL_SPK quirk, which maps pin
> 0x1b as an internal speaker.  The same quirk is already used for the
> related Colorful L1 Plus (2782:a248) and Medion E15443 (2782:4900).
> 
> Tested on the Infinix BL51A7H: the internal speakers work after the
> quirk.
> 
> Signed-off-by: sandrees2007-ctrl <sandrees2007@gmail.com>

Applied now.  Thanks.


Takashi
