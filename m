Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242435F197
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687111; cv=none; b=PVVA2Dc6HRb339oWvzOt8BiLCud7olPgUDLf4gamGvq2nFvy8naKrDEk6t1O2vlxnSZZx3EtK9O47XOwTAUe0T5sZZdyJTV7nkQi4Ey6dW/PpL0tLQ0o5vh/k6LX9FIkwprfAT6w80mRd2u5OngXo2uIBcgK+48By2DbYP6h/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687111; c=relaxed/simple;
	bh=hauPKJFFK3i8NsTy/V3icSrBdRiV4SrhARUBT8/7oww=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIj9NQ+ttVz4qB0G17ySr6/Pm/P66RsFKTD659HVhbU05CEgUfpScR0IGab/5JG7ykwyUC3xXFkedgVkj1790QZXe4YwOiaDhb2juUnSSqcTjxKAJh4ONydDFLyA3PlHOANG2zCXord8eBxHoOoAE7QFG+cb1xtPh4g/qG5DWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n9jr0l/K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZNNB0Ijt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n9jr0l/K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZNNB0Ijt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n9jr0l/K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZNNB0Ijt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n9jr0l/K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZNNB0Ijt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7AAA5758CA;
	Wed, 17 Jun 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WoojYLiw+UHdeWhS2DXosMq8RZh/tIxMny3iP5gShU0=;
	b=n9jr0l/KqlmPFyUMamlN5ELnYOvpVmkMpqThDtq/6HAJrXyEQOBjID6IPiNYZ+3G+3Rx8d
	NIMfoXzcD7jZX0cqQuarWoCxJYS80xod1YHhZl1H/Ysoo00ofIn/kT1VXCi6CFXqV6wlPv
	Wmo9lFjLm4lBAbE/j7fh423FZ6y9hcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WoojYLiw+UHdeWhS2DXosMq8RZh/tIxMny3iP5gShU0=;
	b=ZNNB0IjtnyIyFlu1ZWGrY35rQobGeJX065m9brq0fWUWNJNsin0FTu+QpJhjAjgvR5fYbY
	6HuEMbY6kgn4+kBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="n9jr0l/K";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZNNB0Ijt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WoojYLiw+UHdeWhS2DXosMq8RZh/tIxMny3iP5gShU0=;
	b=n9jr0l/KqlmPFyUMamlN5ELnYOvpVmkMpqThDtq/6HAJrXyEQOBjID6IPiNYZ+3G+3Rx8d
	NIMfoXzcD7jZX0cqQuarWoCxJYS80xod1YHhZl1H/Ysoo00ofIn/kT1VXCi6CFXqV6wlPv
	Wmo9lFjLm4lBAbE/j7fh423FZ6y9hcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WoojYLiw+UHdeWhS2DXosMq8RZh/tIxMny3iP5gShU0=;
	b=ZNNB0IjtnyIyFlu1ZWGrY35rQobGeJX065m9brq0fWUWNJNsin0FTu+QpJhjAjgvR5fYbY
	6HuEMbY6kgn4+kBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B37A779A8;
	Wed, 17 Jun 2026 09:05:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LfjREERjMmrQUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 09:05:08 +0000
Date: Wed, 17 Jun 2026 11:05:07 +0200
Message-ID: <87qzm5pmf0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Galen Hassen <rwekyes@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
In-Reply-To: <20260616173257.37373-1-rwekyes@gmail.com>
References: <87se6mrah4.wl-tiwai@suse.de>
	<20260616173257.37373-1-rwekyes@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7AAA5758CA
X-Spam-Score: -3.51

On Tue, 16 Jun 2026 19:32:57 +0200,
Galen Hassen wrote:
> 
> The Lenovo IdeaPad Slim 5 16AKP10 (PCI SSID 17aa:38b6) uses the
> Conexant SN6140 codec. The internal microphone is on pin 0x1a but
> the BIOS configures it with pin default 0x95a60120, which includes
> a jack detection bit that causes the kernel to treat it as an
> unplugged external mic rather than a fixed internal mic.
> 
> Add a pin config quirk that overrides pin 0x1a to 0x95a60130,
> setting the connectivity bits to indicate a fixed/always-connected
> device. This allows the internal microphone to be correctly
> identified and used.
> 
> Signed-off-by: Galen Hassen <rwekyes@gmail.com>

Applied now.  Thanks.


Takashi
