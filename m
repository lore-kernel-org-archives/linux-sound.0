Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E9331EB6
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076864; cv=none; b=gGAHV48pKkiA7H1r48dCu+TWw4Dmuk7KQl8caQNDK8/Gb4NuZA948eE9LrAmVOM81d/z7gXvbPVxP0OhEFHDw/6GHNQD3MSOVBHcOM2fOdoIwhM/lMFJu5Px9UdH/eHVHAAf/VP4J1OoX/odL7/6h/M62WLBP/dE4EpvRF//GY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076864; c=relaxed/simple;
	bh=VNknTwutbBKXx8ejTnNRYpC8oCXX4V7U56GS2vvLEsc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mbx3gWO6bygFNbM/BgT08EvH/JQlId2aKjP1CzhvUAskQL9Q8m1KmSNU+gLmc+py1np23YyXlXmq0VPww2L6kUQLYgDYfbSBiEZ+7OJW2uVvCmQpqSvnKVTdq1BQeXKJSlliwLSHLruq0lWrq/B5uZ5RazZprEzK2uEbqk8kuKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3S8UdE8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pd28b2cY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3S8UdE8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pd28b2cY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3S8UdE8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pd28b2cY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3S8UdE8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pd28b2cY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1DFB75AEF;
	Fri,  3 Jul 2026 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pc3zPCoinddTesMdGhzk9+Ywt2tmIROQpH8oWZs55Sc=;
	b=N3S8UdE8qUcbeopjFxfxP0h8UfeY533RBGcHAKyu042l+rYEBLONCPoVtRM2/AzgiVb82q
	B1Lsp9fI990f7QxqvCIPq4zQH4oZUgTXDp/15dk8fYXPiIr8qVxYaAb3Axs4bESZD46ciB
	ufqmZGW7SoJUG+vhdhZP7jqFSh45BK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pc3zPCoinddTesMdGhzk9+Ywt2tmIROQpH8oWZs55Sc=;
	b=pd28b2cYh7fYCnYDnH8mvXrQ/tebz3pLRDuqjLMy1ycjKHbMkpBvQhNBb37fjgoX/s1JAq
	OFWjwG0NdVXaREAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pc3zPCoinddTesMdGhzk9+Ywt2tmIROQpH8oWZs55Sc=;
	b=N3S8UdE8qUcbeopjFxfxP0h8UfeY533RBGcHAKyu042l+rYEBLONCPoVtRM2/AzgiVb82q
	B1Lsp9fI990f7QxqvCIPq4zQH4oZUgTXDp/15dk8fYXPiIr8qVxYaAb3Axs4bESZD46ciB
	ufqmZGW7SoJUG+vhdhZP7jqFSh45BK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pc3zPCoinddTesMdGhzk9+Ywt2tmIROQpH8oWZs55Sc=;
	b=pd28b2cYh7fYCnYDnH8mvXrQ/tebz3pLRDuqjLMy1ycjKHbMkpBvQhNBb37fjgoX/s1JAq
	OFWjwG0NdVXaREAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C461779AA;
	Fri,  3 Jul 2026 11:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k2bOJPyXR2r3UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jul 2026 11:07:40 +0000
Date: Fri, 03 Jul 2026 13:07:40 +0200
Message-ID: <87tsqg72mb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: propagate actual error code from register_chrdev
In-Reply-To: <20260703103840.253527-1-phucduc.bui@gmail.com>
References: <20260703103840.253527-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Fri, 03 Jul 2026 12:38:40 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The alsa_sound_init() function currently returns a hardcoded -EIO
> if register_chrdev() fails, masking specific error codes from
> __register_chrdev() such as -EINVAL, -ENOMEM, or -EBUSY.
> 
> Masking these failures under a generic -EIO makes system-level
> diagnostics unnecessarily difficult. Propagating explicit error codes
> from register_chrdev() is also an established convention widely
> practiced across other subsystems.
> 
> Fix this by capturing and propagating the dynamic error code from
> register_chrdev(). While at it, also assign the return value of
> snd_info_init() to the 'err' variable instead of hardcoding -ENOMEM
> to ensure consistency and future-proofing.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
