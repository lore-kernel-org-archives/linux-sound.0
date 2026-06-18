Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636F1DFDA6
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797802; cv=none; b=hvsB7joT6Bava1a9Kya7btjeUe+Q9pCwciwcw92SmnZ3roddraLaZTg3GzyZtv2eRlkYGL89bcS6AbRuXcfMxZRAiED5HA/FgBOG/z0JYsuMAbQNRQz4Edqn0WDZVr6IdfG9/MG4PDieulfbnAR0PwEodW8ykWCYYODHF+qhmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797802; c=relaxed/simple;
	bh=vILcy3xOx5tABkg+vMU2xvvv4q0lx2KQziJhwr3mlhk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=puc+iczfJawwThoQhRF+HGbCPxZBr5tE/BQF27ZxEI5pGNqUMP9Payei3HCC71yHACYHGbEUa4rON5bLUxQag4kiIfg3N31amxK4ANHjd7t6d1zIxqFRct5IDhLqgpVx6bs9+JY/SkxDdJjhGUOBdk0khV+iYHrnrFLtXY/e5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YoeNLoqB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMbTlsrj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmVb9Znu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CtBxzyha; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YoeNLoqB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMbTlsrj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmVb9Znu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CtBxzyha"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFA9775E99;
	Thu, 18 Jun 2026 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkEIwbELxHI36R1rnjqgbR98XhDxUybobKdfsY/c2/4=;
	b=YoeNLoqBD6/CKubUH6LnybWkj8YoT83GjgFHGNG98+B50FhnAmPAV9MSCXVaTI6QxoAK4R
	A5ONDHIsmKxrGz89rXWFlurvBok9JpBD3HgjHvDWWSvy1DACfi/40AM2l452mtcB2kX/7o
	sy3kSg4dsqPRxfq8fkH85CO0oHqPnKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkEIwbELxHI36R1rnjqgbR98XhDxUybobKdfsY/c2/4=;
	b=PMbTlsrjwvMhnKX3loT0HcZsToc/tMRxzopNkCvJC0vMfouTMf+glX7noG84bQ+EhvqNzb
	wc18M3s6QTfWNhCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hmVb9Znu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CtBxzyha
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkEIwbELxHI36R1rnjqgbR98XhDxUybobKdfsY/c2/4=;
	b=hmVb9ZnuOC0yPwVgs0UpW7XmCJSVMbechiVtmZn6nOxRugy1LW4G7ulvI0YeSG2mk6CixF
	ci8Z+fg/uWzxUIoqtTCkVnacrkhD0wrgxv8eerBF2oWgF/pmZTA/FSVAKKNiOvJcqcwCq2
	CmvX2KE4Y8Ebn1PhPMiqKivNGGZ9aDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkEIwbELxHI36R1rnjqgbR98XhDxUybobKdfsY/c2/4=;
	b=CtBxzyha/kO4MTX4XzrXUHf7ezr3U+2fPCCC53QkiYPn97Fn2Wf3mMIx33MjHySNvoEIbP
	qhe/U8qiF3sPnXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0E59779A8;
	Thu, 18 Jun 2026 15:49:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XazOKKcTNGpfbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 15:49:59 +0000
Date: Thu, 18 Jun 2026 17:49:59 +0200
Message-ID: <87eci3kfvc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: jean-louis.colaco@orange.fr
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH 1/1] ALSA: usb-audio: Add quirk for YAMAHA CDS3000
In-Reply-To: <20260618113202.8363-1-jean-louis.colaco@orange.fr>
References: <20260618113202.8363-1-jean-louis.colaco@orange.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[orange.fr];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[orange.fr];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CFA9775E99
X-Spam-Score: -3.51

On Thu, 18 Jun 2026 13:32:02 +0200,
jean-louis.colaco@orange.fr wrote:
> 
> From: Jean-louis Colaco <jean-louis.colaco@orange.fr>
> 
> This quirk is identical to the one for the Yamaha Steinberg UR22, here
> applied to a CD player that also uses the Steinberg USB interface.
> This quirk is necessary to avoid sporadic "clic" noise when using the DAC
> of the player.
> 
> Signed-off-by: Jean-Louis Colaco <jean-louis.colaco@orange.fr>

Applied now.  Thanks.


Takashi
