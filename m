Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390548A8C2
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639135; cv=none; b=PbLQ6KEglfB1aVVbcM7cCV9Z+tKaDzZ2CIH2mh6fcFfuIMzJJ5YqIxYdUQXySSR6aDAYQ/YFy65hZk2toQxNH7nCIb5H2b1z831CcHFAUmlSpM0OYMWhozFgagJ1syaDvBNodRHiQeyQCyloav+IshjrlbuFAED1m9J0F8Hqys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639135; c=relaxed/simple;
	bh=IThSGUi+5fqO1XxF5rqCazugMfLz6bDE4ON76DDZlaA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9seeM3W3df5ZvTXDXJ/LbzLYqQScQm3CRsUp9wKHFlz2O+Y4i+SiFVqELnx8EU/Px0VxqUd4NEr4KLP0RlwztqVDdn6JZrUC+hxrd7oU8lKVj1AC/ZG4v3z3UvoYzb4o2X252MsvRLLdWfSEqwCNcI2uFRVlMkbAAeZjGcLmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yS7+Jj+8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1TKs6rKj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oIufhVyu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Og0K7TvU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yS7+Jj+8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1TKs6rKj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oIufhVyu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Og0K7TvU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3130B3E99;
	Thu, 13 Aug 2026 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786639127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxZXeB/AVYnl46JkjNqHw3IbhImtaR0tvlwL/5H5SEk=;
	b=yS7+Jj+8SNUHUB8/dT5e3aP40eFVZUZpF2eHCCp5U7gDIq3QlA/qS+Ds2k6QrbA7KSxZ5b
	iTIaKE/ESiiihbf/1i7rO96jcB2yvQGwhDreXZxvpG9K/aITQVDTWpo5JY46F2eQoDSNPF
	7dciVGg3sKQEbR+Zp4goDXJ8f9V5ew8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786639127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxZXeB/AVYnl46JkjNqHw3IbhImtaR0tvlwL/5H5SEk=;
	b=1TKs6rKjwlH41qz53nJ2328l/d5V0BEVd8XELgNdVetOww0BMn1PXXxwAh1u0HgnVhzhzE
	0fpoQC3CigGOLEBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oIufhVyu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Og0K7TvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786639123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxZXeB/AVYnl46JkjNqHw3IbhImtaR0tvlwL/5H5SEk=;
	b=oIufhVyuQ/x0b4O9zW08+KuH/7J+JWuCcInuWnU/ixCQTG7VkBW7xzh2KXiXWtiJf1fQIQ
	iCaFU1pPaiEw+fwKPwtE5B7qYP8wT+sR57ROMuZoui9g6pwBaBy2ubkxo+I/IXiYYtx4s3
	ZuqyBrJNr146QS+8SSHpSIb1uc9RTVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786639123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxZXeB/AVYnl46JkjNqHw3IbhImtaR0tvlwL/5H5SEk=;
	b=Og0K7TvUU2m7hdMPM7DIPt3e+TMe/YTzze2CCWArssXQ34O3OnHKK9pSaR9/ttkluJJnIU
	5B2bQc1jPUerFyDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EDEA77EF9;
	Thu, 13 Aug 2026 16:38:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rvBlAhPzfWrlPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 16:38:43 +0000
Date: Thu, 13 Aug 2026 18:38:42 +0200
Message-ID: <871pc2x9f1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc7
In-Reply-To: <8b0c9a2a-26f1-4b88-a280-2575c21540cd@sirena.org.uk>
References: <317e8543ff401f09ccc2e93c8cd70e71@kernel.org>
	<87cxvmxf4p.wl-tiwai@suse.de>
	<8b0c9a2a-26f1-4b88-a280-2575c21540cd@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3130B3E99
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 13 Aug 2026 18:28:17 +0200,
Mark Brown wrote:
> 
> On Thu, Aug 13, 2026 at 04:35:18PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > This set of fixes is bulked out quite a bit by the inclusion of a lot of
> > > quirks for various x86 platforms, though there are a few driver specific
> > > fixes in here too.  Nothing here is terribly critical, we should be fine
> > > waiting for the merge window if it's too much.
> 
> > Pulled now.  Thanks.
> 
> I'll have one more fix from Richard hopefully later today:
> 
>    https://lore.kernel.org/r/4bb97547-4145-4afa-8014-71faa594bd36@opensource.cirrus.com
> 
> which looks like it'd be good to get in, especially with v7.2 looking
> like a LTS.

OK, I'll check again later, but don't be too late ;)


thanks,

Takashi
