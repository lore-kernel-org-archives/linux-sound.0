Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758B3EDADC
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151531; cv=none; b=qyrSAGTusj0jRa2FPN182/ncLnbfIEIpMt6lGM0qd8hx4ARBgdzZLV4QZVvQXY7MFZ64Ko0aS+LueHpcH3JwNpmlpNh3H/JRQYJ716+qL4zJ6m5cFngUjzIt93vX7xkcM7/jk8WkGH/duhhebo+59xBmkI734qKlh04YAZb8iGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151531; c=relaxed/simple;
	bh=94GIgPLVNbC3YpkEVnY5qCFadYOOCK1fuM+W3U1HOC0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4hh63eHNiuTKvuBMWSMQ8XLA2wv0tuGLgpE7ySpRoLkEaNumZDW72fU2MZJdpFqGLsoeCgX5bCu/lFbnP3zp9gA8j0D0kcUH0hd0HB0u/FP1Vn9YQrg+Lfwu8wmQJW42WxLdVKIRPVju7YPMO9X7W9ge4X5lV1aCg76WWzY2oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cJCkODeY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O8B4j+GU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cJCkODeY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O8B4j+GU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJCkODeY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O8B4j+GU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJCkODeY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O8B4j+GU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C42515CF56;
	Thu,  7 May 2026 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrf4sX1UHWOdSDWyIsiTPPD7AvnFI5MzA7mzOGjKI=;
	b=cJCkODeYyZEwqQ/8Hm1snzoUiVaQb1xBNuBdO9KOvR9c1x4MxqXS2/lQHYF0gR3gV7QLT3
	XQ4LzP0W1XwH1LMpacEBpIEoPCddCJCjT9+0lTXzaSaE92AmaxirHoCG/WE7AlJOWTlJ9A
	9JOg90txRKYXJOvbkdNansjY4lItFg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrf4sX1UHWOdSDWyIsiTPPD7AvnFI5MzA7mzOGjKI=;
	b=O8B4j+GU0UMn+jjKKVzzEpCdtvlqbZzIntJaoeTXG1r7tShuDSAXDq77HM660o0sEQ9S/8
	JCLCO9XXphppBmDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cJCkODeY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O8B4j+GU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778151518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrf4sX1UHWOdSDWyIsiTPPD7AvnFI5MzA7mzOGjKI=;
	b=cJCkODeYyZEwqQ/8Hm1snzoUiVaQb1xBNuBdO9KOvR9c1x4MxqXS2/lQHYF0gR3gV7QLT3
	XQ4LzP0W1XwH1LMpacEBpIEoPCddCJCjT9+0lTXzaSaE92AmaxirHoCG/WE7AlJOWTlJ9A
	9JOg90txRKYXJOvbkdNansjY4lItFg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778151518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrf4sX1UHWOdSDWyIsiTPPD7AvnFI5MzA7mzOGjKI=;
	b=O8B4j+GU0UMn+jjKKVzzEpCdtvlqbZzIntJaoeTXG1r7tShuDSAXDq77HM660o0sEQ9S/8
	JCLCO9XXphppBmDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8ABD2593A7;
	Thu,  7 May 2026 10:58:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X6JuIF5w/GlWXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 10:58:38 +0000
Date: Thu, 07 May 2026 12:58:38 +0200
Message-ID: <874ikjqye9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Andreas Steinmetz <ast@domdv.de>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio: Fix endpoint-extra bounds checks in USB MIDI parsers
In-Reply-To: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
References: <20260507-usb-midi-endpoint-scan-bounds-v1-0-329d7348160e@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Queue-Id: C42515CF56
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Thu, 07 May 2026 05:40:50 +0200,
Cássio Gabriel wrote:
> 
> Both the legacy USB MIDI and USB MIDI 2.0 endpoint descriptor
> walkers can return a class-specific endpoint descriptor without
> first checking that bLength fits in the remaining endpoint-extra
> scan.
> 
> The later parsers validate the internal flexible-array sizes
> before reading baAssocJackID[] or baAssoGrpTrmBlkID[], but they
> still trust the descriptor returned by the walker. A malformed
> device can therefore make the parser consume bytes past
> the walked descriptor span.
> 
> - Patch 1 bounds the legacy MIDI endpoint descriptor walk.
> - Patch 2 applies the same fix to the MIDI 2.0 endpoint descriptor walk.
> 
> No behavior changes for valid devices; malformed endpoint-extra descriptors
> are now rejected during parsing instead.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (2):
>       ALSA: usb-audio: Bound MIDI endpoint descriptor scans
>       ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor scans

Applied both to for-linus branch now.  Thanks.


Takashi
