Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609412;
	b=qrF+EFMwGOAmK1+anaLPYXrzDhBOZpprv7ZdhKYAEiTV/6njbUrWBLpus77DFYdXmI5N
	 PfvG24VuwI2UiUu93ofknHwZHL8rVcbU3grLVZzm6fOu6stdL0g1a2hxBcBO3ViSYjhku
	 v3MyVJAuqIu7icuSX9jHUARpeUo3npKBhIyksKYx83sWd2Yqmf6vgrE699LovC9XXmnYp
	 GCnkzKbm5WTDKkizkkfsjMV21NLHqvUALTMl9qkkAnL8kluGbx9b8aMKZq2wJL0bqKpky
	 +la9CMs4kZkDxydRPTpv9PR1jRxw1bRC1aMhOP7aTAk4kjaojWwSCzCHZs63zn11u0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609412;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=mt7G0a5tL88xWpbLvssUpPfSa7xs4f7RrY8h/XruTsY=;
	b=kbNGJv/w0im4HTYCVuKUc9VrpzmyC8AK6dsQPbaADMZj0RfNrI0He9epsOQrU00y//3j
	 YnE5yhwNPZXLQdoeEteqiybYgethAJy0Inqe+yo+3bcE/bRj2FvCKBQl+kcF0BRiIbZIj
	 rlhNT9+yDbGdo3Q1Dwt0oINLKZHPq0mtLyicQquyUC/lal7NgHp3+xTEzhbhBJUBEj17T
	 MmIX2mOY7nQ92VW1ysjU+yV4c2FLjDUZvApT8lkzGbfnRKAR09LFqzKwS+k3WzXSpT5x7
	 Ucpk6UZMBsAJ3IKLeNIX8e7KcuyP7Vij4du+rFbdVPTdXKAB5z/A3lbyGfLJf2Dv0vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rk3qJNnB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Hiby9MW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rk3qJNnB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Hiby9MW;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87E606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 08:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E87E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rk3qJNnB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Hiby9MW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Rk3qJNnB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1Hiby9MW
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BE531FB35;
	Mon,  2 Nov 2026 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mt7G0a5tL88xWpbLvssUpPfSa7xs4f7RrY8h/XruTsY=;
	b=Rk3qJNnBDS5Eo7Xm+PrfGkMzzd8kU/Aw4OjzAEmzWiotmthDYxa3/tvqMSbHj04w13Vf2j
	VVgEnt2cHeLhIyB/g3TCkG30dzLR2ncRIaTW52mgjML99xvXuLm7vwB3U4urAw572ldnm0
	lAmILt5yR0kviugZEAXp5aXrEGcs0IQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mt7G0a5tL88xWpbLvssUpPfSa7xs4f7RrY8h/XruTsY=;
	b=1Hiby9MWsfj3BZ7KdEUq6CcrNFmF3clsDpLpEjwnZ74x1IfyMl3niudLCX2WWSimdbAHpo
	JvzqHSqM6hHeW3Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rk3qJNnB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1Hiby9MW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mt7G0a5tL88xWpbLvssUpPfSa7xs4f7RrY8h/XruTsY=;
	b=Rk3qJNnBDS5Eo7Xm+PrfGkMzzd8kU/Aw4OjzAEmzWiotmthDYxa3/tvqMSbHj04w13Vf2j
	VVgEnt2cHeLhIyB/g3TCkG30dzLR2ncRIaTW52mgjML99xvXuLm7vwB3U4urAw572ldnm0
	lAmILt5yR0kviugZEAXp5aXrEGcs0IQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mt7G0a5tL88xWpbLvssUpPfSa7xs4f7RrY8h/XruTsY=;
	b=1Hiby9MWsfj3BZ7KdEUq6CcrNFmF3clsDpLpEjwnZ74x1IfyMl3niudLCX2WWSimdbAHpo
	JvzqHSqM6hHeW3Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E67B134B8;
	Mon,  2 Nov 2026 08:50:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9xPKCcFO6GoxSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 08:50:09 +0000
Date: Mon, 02 Nov 2026 09:50:08 +0100
Message-ID: <87mrrr4ny7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] ALSA: firewire: fix inverted streaming speed between tx and rx streams
In-Reply-To: <20261102033652.1184893-1-o-takashi@sakamocchi.jp>
References: <20261102033652.1184893-1-o-takashi@sakamocchi.jp>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8BE531FB35

On Mon, 02 Nov 2026 04:36:52 +0100,
Takashi Sakamoto wrote:
> 
> ALSA firewire-tascam driver uses inverted streaming speed when reserving
> isochronous resources between tx and rx streams.
> 
> Correct the streaming speeds. This has no impact on existing
> functionality, as both streams are always reserved together when handling
> PCM substreams.
> 
> Fixes: dbd0cf204fe6 ("ALSA: firewire-tascam: reserve resources for transferred isochronous packets at S400")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied now.  Thanks.


Takashi
