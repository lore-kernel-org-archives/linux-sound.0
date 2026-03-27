Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EAE379ED6
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611916; cv=none; b=nFjCu2Si/4HOwEJrTi4o33Tn7PH7NesCJbqiC1RO7TaBCOt0OaekCCgEZ1Nkax//uZZMYC1eQ2VHzgB1ev4cPj6Emnr798LXc1J3j/7xAbNoP9k+qz4Qzt73tphX13K4emu4PLiw6B54kQUYAqfjlPo1TKHCub4vZ+g7DsXrQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611916; c=relaxed/simple;
	bh=awpEaeZ95q1NIHbwPt6nYhy6lMaAbT7hfRWjFyCsGzo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1YDrLe4FkQ7JqgkTMpCl0pwJr6zqkRSy+zV3GGLXo8hl6KGusX6zEelogVQR2jes0252d6H9N7gRe/ME9/YGwm69ADP6QrjI1/VwPEZ3qklP0d7v3hs2eXTYvu7lJMfNGo7Oz4lG72VKHtaBiEWQc8V09+4F8e2LSUWTqJwXU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hNhA4BRC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hyx+H0Kz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ds3wqZw5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N9/xx32S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hNhA4BRC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hyx+H0Kz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ds3wqZw5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N9/xx32S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D28D24D338;
	Fri, 27 Mar 2026 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUcs3rqT7gUhtfRsFcPJM9BI8KOmmD1ipYCaCvIo+R4=;
	b=hNhA4BRCMVbpOyzOHLxFLROgEq1GpLZUmXRd3U9MscT39sur5trIBeeHdoTRi+cyodALgo
	jNFis/kqaSjk/RyM0wg6uMPDfFexX0SEVzdc97eLVcT+0rigWI6vJZJpiCK4KXUuObzZ0u
	zpcalazUiNrbh5zazdIw7ZUB//EFe3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUcs3rqT7gUhtfRsFcPJM9BI8KOmmD1ipYCaCvIo+R4=;
	b=hyx+H0KzMp/opeEoG9IQ6eziIU9Njyg+mrgWex0Gc6V8U/WcE0Ac6U+MBO/zF7vgM/f62z
	NUlgsOKfOURyxnAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ds3wqZw5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="N9/xx32S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUcs3rqT7gUhtfRsFcPJM9BI8KOmmD1ipYCaCvIo+R4=;
	b=Ds3wqZw5hNp+D/+nh/zW3RRWQ/RqPlXSyVAVuKDAN8sl5X+vc3X+eRYojs7/P6D1n2WIX9
	iVJfdQIDotEaRDwMek9Z3kFZCLzU7P4KVej4q90hE/64ecCD8ngWDoM0DeSd9+2WH6+g3f
	QyRwQhA3wn6lXzXrhL5tYPNIOmcEjcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUcs3rqT7gUhtfRsFcPJM9BI8KOmmD1ipYCaCvIo+R4=;
	b=N9/xx32SkcgOoqDzgXtSF7bE1h8kwKgEnc+C9ptyhwRMJkTHPf/pXkm9y/IlhKzEJiYWKO
	fItCr4bUiSnltxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1E204A0A2;
	Fri, 27 Mar 2026 11:45:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mhdVJsZtxmlRKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 11:45:10 +0000
Date: Fri, 27 Mar 2026 12:45:10 +0100
Message-ID: <87o6k9qywp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: rotate standard MIDI output port scan
In-Reply-To: <20260323-usbmidi-port-fairness-v1-1-2d68e97592a1@gmail.com>
References: <20260323-usbmidi-port-fairness-v1-1-2d68e97592a1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D28D24D338

On Mon, 23 Mar 2026 14:46:24 +0100,
Cássio Gabriel wrote:
> 
> snd_usbmidi_standard_output() iterates output ports in ascending order
> and drains each active port until the URB is full. On interfaces where
> multiple USB-MIDI cables share one endpoint, sustained traffic on a
> lower-numbered port can consume every refill before higher-numbered
> ports are even examined.
> 
> That behavior dates back to the original implementation and still
> applies with the current multi-URB output path. snd_usbmidi_do_output()
> can refill several idle URBs in one pass, but each refill restarts the
> scan at port 0, so a busy lower-numbered port can keep higher-numbered
> ports from making progress at all.
> 
> Use ep->current_port as the starting point of the scan and advance it
> after each URB fill. This keeps the existing packet formatting and
> per-port state handling intact while preventing persistent starvation of
> higher-numbered ports.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Looks like a nice logical improvement.

Applied to for-next branch now.  Thanks.


Takashi
