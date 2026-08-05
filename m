Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA91B3DFC62;
	Wed,  5 Aug 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943489; cv=none; b=U6vn608qFUfWi40d0TpEp+zjF8D7sioUtNyh+9HdCTh4Hcl7k3O943bl7zbL9cy1gJagqg4hh6+HUzMEyYle6mIkMlHjJcx4gUueIMYM+A61khMnR/OhGFCJhJWwINuGAzHhPH6sejWHlpP/nCqzgAMrepKiycjPs9yNySQkFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943489; c=relaxed/simple;
	bh=8Ib6YwTE2zWwzYqq63AycWDle6Jt+l3rkAHUqe/Ol4I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Re29ewMyk+KPrGLjDD/UJdCgXyMgczRQZT7vc4HKdSa8O6C5n402SD2CL3CQYRDQlebAWZ/A8o5ERZerRQkn8vGodkuJdS0Usm9His15sMPzQ1mU0U5Z1mf8gjUq13p3WNwvog0tAAOhz+dC9Fal01851PzsDTW7pSm5uNtLrKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=REHR1TWv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1UJdY/P/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2CtMeHQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I/Thk+Qu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="REHR1TWv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1UJdY/P/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2CtMeHQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I/Thk+Qu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3D353DF8;
	Wed,  5 Aug 2026 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbJ7vzZh0eRx4dc51VReXc/6uFB0XIU8eWO0j7bywIU=;
	b=REHR1TWvJPzMRfZAa3OMh/9i5uYSIa9D1dUIChpFPkY84+nrDS61buShAAYjkv5Iyd343U
	0g8161Odsjeorq+RcHtg3i5+Ql1LYRHmomZIAhV2k/gvUhqH+XcRHZCTdYVP/zyhq9v5mb
	/Lv0v0rJocXiwPUCmfPv892C/Vh4GKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbJ7vzZh0eRx4dc51VReXc/6uFB0XIU8eWO0j7bywIU=;
	b=1UJdY/P/ag20PZO0cmKilnEWrWbTVPyJT9BiRLvvIuEZALRJ9hTQEx0H+hVtpU+U2eVNW3
	+rHOPEr33FW5lFBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2CtMeHQ+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="I/Thk+Qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbJ7vzZh0eRx4dc51VReXc/6uFB0XIU8eWO0j7bywIU=;
	b=2CtMeHQ+iZ9CVF9s5x/oLZdWcSo21zvoNTIISVqh+AeEsKlqXsfnn8WCe/YbDr86JASr8X
	bpJflYosEWwIx8oBnbl9WGtdvKr0rjonbxoKqamOTvNsvPLGQnNumtFdQIgpWO773GP5wW
	KpYRdAN89pYFesyRQDkCwVLp6k7KLEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbJ7vzZh0eRx4dc51VReXc/6uFB0XIU8eWO0j7bywIU=;
	b=I/Thk+QuOxrOAjtn+b8nZIxCEEhTObyk/GKBS78mPxI2X7iHaS4iRwTj/zLtzU7MfGlyLW
	pe8/cOL6cRMmqoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C46CD779C2;
	Wed,  5 Aug 2026 15:24:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ors6Lq9Vc2okJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 15:24:31 +0000
Date: Wed, 05 Aug 2026 17:24:31 +0200
Message-ID: <87a4r0fv4g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luca Castaldini <luca.castaldini96@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED support for HP Pavilion 15-eh2xxx
In-Reply-To: <20260805122907.52302-1-luca.castaldini96@gmail.com>
References: <20260805122907.52302-1-luca.castaldini96@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F3D353DF8
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 05 Aug 2026 14:29:07 +0200,
Luca Castaldini wrote:
> 
> Add the subsystem ID 103c:8a0e to the ALC287 HP GPIO LED quirk
> table so the mute LED follows the speaker mute state.
> 
> Tested on HP Pavilion Laptop 15-eh2xxx with ALC287 codec.
> The mute LED now follows the speaker mute state.
> 
> Signed-off-by: Luca Castaldini <luca.castaldini96@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
