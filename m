Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6B626B971
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758608278; cv=none; b=c27TPYUoxJPY2DNfxIk4Eke5ZDz7v3Jql9fvqUOXcdulX040w3qGnP2ku9uIOiNszJ8Ozyygob3jhuMstylBUZzRJvNAo2I0W+qMwJSSsCQinPVbQocDcxA5Z6gw8QSe3pNlThvL2kUeCeB58UYWZfdWnHlVbl73WvNhMYIZeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758608278; c=relaxed/simple;
	bh=7/1Y1zgJEG55cbtZPVgrivYSuVqe2WpL5+kpkLC7dk8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnFBnm9+QB/kVpqcr3I6kTQYG6HfK62YIczT2N6Rgm+gYl5ff3obpCgTFucDgNJsZy7lRoEE9wBS51vfR6SXIkle0m4WuVfygs43B2L102/RfBu+ZlvQEqnB51ZLMW+8cf+iEjmfCmZEWUXGjp5bcTYu9WVpDW7sszxeIjMlQ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ftA8tEvU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TBpZbkOJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p0IuUi+H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hez+gvxO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ftA8tEvU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TBpZbkOJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p0IuUi+H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hez+gvxO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C58321F387;
	Tue, 23 Sep 2025 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758608275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUrfdIgv2V6DzKiD+/P0rxqDe+DUmvk0odPjAfH2sMo=;
	b=ftA8tEvUre3AZ3LHtHbLKrgx6cFZIdUqZ943aYi6vDQmUFgdcI4fOF6kkyTjTTjhMMwEhI
	e3zDpKVPLIGZzCYCQ+1NykpH4cRVZTLo3Tp2rrQD4FD6RT/tNMUzrpt20RbhDlsecYPGDJ
	Lv3jeS+IyQAi1v7cjhA3wRwJA+yquoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758608275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUrfdIgv2V6DzKiD+/P0rxqDe+DUmvk0odPjAfH2sMo=;
	b=TBpZbkOJ0MakiCbQwoVJT+FAypM3t/EgVtzgDE7ZSXos+PBa65O/6GLnOWklDP8WXY9VE/
	nyu8t5GTQoFbpOBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p0IuUi+H;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hez+gvxO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758608273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUrfdIgv2V6DzKiD+/P0rxqDe+DUmvk0odPjAfH2sMo=;
	b=p0IuUi+HBBk3jHVhgtBFd6MvWSsVcHqJhuzrp5vnC/DH6vjubA7BtRlgjZTC4xDx4fN+Lw
	isg9conx5tqZOmm9/4HfNkERLYJMRbLtt4eAO8zKoBnTJlpWJGee4hQE5paF+JQeqskYrD
	RLKTC2s3sT752cs9m7cRtuBa+octKS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758608273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LUrfdIgv2V6DzKiD+/P0rxqDe+DUmvk0odPjAfH2sMo=;
	b=hez+gvxOKd7GRbV41/POgbLP+CeKe5IdpkOp803cq6ZKPU71VtITuvAn8lUTwewqlPCxf6
	J+HCrf5GL0QHlLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0F07132C9;
	Tue, 23 Sep 2025 06:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hEwSJpE70miWFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Sep 2025 06:17:53 +0000
Date: Tue, 23 Sep 2025 08:17:53 +0200
Message-ID: <87o6r1n14e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Amin Dandache <amin.dandache@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: don't apply interface quirk to Presonus S1824c
In-Reply-To: <aNGbUkO8n6M8kggv@ark>
References: <aNGbUkO8n6M8kggv@ark>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C58321F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

On Mon, 22 Sep 2025 20:54:10 +0200,
Roy Vegard Ovesen wrote:
> 
> Testing with a Presonus STUDIO 1824c together with
> a Behringer ultragain digital ADAT device shows that
> using all 3 altno settings works fine.
> 
> When selecting sample rate, the driver sets the interface
> to the correct altno setting and the correct number of
> channels is set.
> 
> Selecting the correct altno setting via Ardour, Reaper or
> whatever other way to set the sample rate is more convenient
> than re-loading the driver module with device_setup to
> set altno.
> 
> Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>

Thanks, applied.


Takashi
