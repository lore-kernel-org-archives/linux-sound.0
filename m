Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF952361DC0
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611547; cv=none; b=anxc2igyzAXo+NAu9KbLUA7qmb5lbaRNesQlIf1zeiD3weoSLe1xNKt8I+9KIqnd7ECyr8vRwDPFF0MIXPhK9l6aECyr5Iu0eRRf8WJsCcedPHrX0pkt7/8gFAYf83dqkHwMYnaVX0gHOROjnSmEStbtB2PkanrYz8JUfHkyS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611547; c=relaxed/simple;
	bh=un0GAay2ZRiVcn8tlsOG52sgddQpkNeEdzGS4bTV1pk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrfBXVUF8KbGLRZan3PwQiPubyJrfcwxwwCIy48jRa5gX88RBugfDLmr/y/WTBvaVWYA4m2HJUf/6b+OGb5plEON6Xyogv/cqfDx4gZ2fgIMWqo9AErTWcMANHRZ7bgdxIutEdPFoz1fZ3LkTUF5r95rG33L03IN+K5dIarOP30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LY36rIGn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nTwusIHh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LY36rIGn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nTwusIHh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LY36rIGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nTwusIHh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LY36rIGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nTwusIHh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29C845BDD3;
	Fri, 27 Mar 2026 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29km1mYU9FjFyYaRrsbqoSZKhV3fswQNwPzRZlDuV3w=;
	b=LY36rIGnPLjEIZfwLhpripHr2LtFhJpnLUrKveqisyaXlkPxMpub6Q8duOvhhjkZAFhr52
	upl60qtrkgGXnL8B2ML1GoR0zP93brt5blX/yBokPlwFnxuBjsXHNyA42LVpXI/Yf738wE
	fm8ikNt4cCIczgVYCSQ9v1cnAFaI0G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29km1mYU9FjFyYaRrsbqoSZKhV3fswQNwPzRZlDuV3w=;
	b=nTwusIHh3NirrKK1y6XWoS0PrrYJ7wAUmOIkc1onHKkUictD/MJeIfOXGp3Eu9HFj9kN1/
	gKZ36+Aci5s0VnBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29km1mYU9FjFyYaRrsbqoSZKhV3fswQNwPzRZlDuV3w=;
	b=LY36rIGnPLjEIZfwLhpripHr2LtFhJpnLUrKveqisyaXlkPxMpub6Q8duOvhhjkZAFhr52
	upl60qtrkgGXnL8B2ML1GoR0zP93brt5blX/yBokPlwFnxuBjsXHNyA42LVpXI/Yf738wE
	fm8ikNt4cCIczgVYCSQ9v1cnAFaI0G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29km1mYU9FjFyYaRrsbqoSZKhV3fswQNwPzRZlDuV3w=;
	b=nTwusIHh3NirrKK1y6XWoS0PrrYJ7wAUmOIkc1onHKkUictD/MJeIfOXGp3Eu9HFj9kN1/
	gKZ36+Aci5s0VnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F220E4A0A2;
	Fri, 27 Mar 2026 11:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aNjqOVZsxmkpJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 11:39:02 +0000
Date: Fri, 27 Mar 2026 12:39:02 +0100
Message-ID: <87qzp5qz6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Use pcm_lib_apply_appl_ptr() in x32 sync_ptr
In-Reply-To: <20260321-alsa-pcm-x32-sync-ptr-v1-1-02ce655657c6@gmail.com>
References: <20260321-alsa-pcm-x32-sync-ptr-v1-1-02ce655657c6@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 22 Mar 2026 00:02:21 +0100,
Cássio Gabriel wrote:
> 
> snd_pcm_ioctl_sync_ptr_x32() still handles incoming appl_ptr updates
> differently from the other SYNC_PTR paths. The native handler and the
> 32-bit compat handler both pass appl_ptr through pcm_lib_apply_appl_ptr(),
> but the x32 handler still writes control->appl_ptr directly.
> 
> That direct assignment skips the common appl_ptr validation against
> runtime->boundary and also bypasses the substream ack() callback.
> This makes the x32 ioctl path behave differently from the native and
> compat32 cases, and it can miss the driver notification that explicit
> appl_ptr synchronization relies on.
> 
> Use pcm_lib_apply_appl_ptr() for x32 too, so appl_ptr updates are
> validated consistently and drivers relying on ack() notifications
> see the same behavior.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied to for-next branch now.


Takashi
