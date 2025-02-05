Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A52288C3
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757130; cv=none; b=syzCwk2dETxSF/5+BTo9YvdXoFw7+uSpNTfEkq/1FkBiOTZVVUeDKILOW1nDaH5/PHXFa6GhRbUAI6AP6Pqm5ZGiKVbpEM67vFzW2PqX/baS3lO/inbmJwHadKhZmpXxHkdYPCrf9Nh4JSa1Svv+FwqjPR37WW0P6PQt8MpOErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757130; c=relaxed/simple;
	bh=EAA/qLfpPcK/cE3/it0ae73jixUJk7mGJ2RDGO/Uqy0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+O6A4r2KlTb+noTCACP3YdchPypi4HYSP1BVYJJPsjiH8rtPbz1DgsN1j7FqldPMnx38+qZ0E0JnzEGIPTiJI4HgjCSnRqlCQ2owg21dDg3ImFyRQewskJRc51kseQBmLCCFkOtmXjMZ670HlXUMlFShW2SkRuViKpc4Qd+u44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I8RJPjM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ix8rdv31; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QlkV2xy0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0wdDByMN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I8RJPjM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ix8rdv31";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QlkV2xy0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0wdDByMN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA8501F791;
	Wed,  5 Feb 2025 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738757127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQf5DMlgIjRX0/9o1zJS8TyCn5TnPnyJKay4Qozy7Qo=;
	b=I8RJPjM1m220LIBsx+9gPQv/wToFFZUWcPVdbAz/y4hHkrAO5eBDaNDrgoVIVNoSqwzdeM
	ZnxxWLdvd/Gy/lvJMs8ioIx8+jkngUzFQtnj6DanBnbZ/JgduolVtBBqajivXNEf5DmUZJ
	KGisBDH+Y8AW8iWz3Y14ku0U5fHKK0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738757127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQf5DMlgIjRX0/9o1zJS8TyCn5TnPnyJKay4Qozy7Qo=;
	b=ix8rdv315bExdjAaTdX4PSHOwcwXwBO3J+WT4icjSmwA0NLSjhKBEskXzoWbh3U//yIBo5
	Hg17IE/HtAXlaFCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QlkV2xy0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0wdDByMN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738757126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQf5DMlgIjRX0/9o1zJS8TyCn5TnPnyJKay4Qozy7Qo=;
	b=QlkV2xy0Ysh7RBpUPghGh4wbv4CXlF/jX9y/9VM1tVxRAsmjkXU/8V5BhQiHgtGLdww56n
	Dkm9EH/nKlYEJ4cVcn2l3zUtwkjrhva/lFSK/6B/46SNW1WRRputyuQSk5M0Iaf2arVRjO
	NbLVpC+Mtige74kZ1UdhFvLFWmLYSgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738757126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQf5DMlgIjRX0/9o1zJS8TyCn5TnPnyJKay4Qozy7Qo=;
	b=0wdDByMNE44k8JKWDUaCxStOHzYpAaVgDkDdeB0kG8o/ktzDDb0WVcp0DUrDRiyxttBKPH
	SL6gaDbHlpZFh8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9F1A13694;
	Wed,  5 Feb 2025 12:05:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TwcPLAZUo2fxXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Feb 2025 12:05:26 +0000
Date: Wed, 05 Feb 2025 13:05:26 +0100
Message-ID: <87jza4zjeh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jakub Wilk <jwilk@jwilk.net>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: docs: Fix typo
In-Reply-To: <20250130180823.1864-1-jwilk@jwilk.net>
References: <20250130180823.1864-1-jwilk@jwilk.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: EA8501F791
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 30 Jan 2025 19:08:22 +0100,
Jakub Wilk wrote:
> 
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Applied both patches now.  Thanks.


Takashi
