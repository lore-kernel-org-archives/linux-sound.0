Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E578B3168F7
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146089; cv=none; b=foXG04oZW8akan0Lk1/kpCMkOsTzvdkQrE/wLpdVsnnBi1vRr/NNwZyhO7MA+o/FJGZuqv5qGV1gGZn8eVyF9GPDZTXZ2H5DmXvIsJT2YyJRNg2+vOEftoMeBzIrMEzZj6UAfveWGkrnbMcD05ALLW6ZSDrjsThjBhaw+9SvjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146089; c=relaxed/simple;
	bh=qGFw8FBIXmTSpHpEHqxUVYZWH0t4UludHCE3HUHMSmM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNcIep2AQF6kt/r20lj/vDuhkfZfvkLJq0jmZWCeIG0WeNgoG1LIT6Ue2GzsWW99wQPXi03wsEguVDYqFNYTyqQ9+fdvZLXt+8MjwHX08CY7Q/5Rm+wyT2dT7c1vQQwBihq0P3QxVsEC4m0IIlZm07tE3E5cjOZuItg+i7PGQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xJ4dQulO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UC/H/lOG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xJ4dQulO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UC/H/lOG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xJ4dQulO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UC/H/lOG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xJ4dQulO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UC/H/lOG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3206A5BDE6;
	Wed, 26 Nov 2025 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764146086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HlOmN3jMJp9EzokxJNCZpMueGDBJAXVM0ZWkpX11uSo=;
	b=xJ4dQulOLD7599DoppqIL/oqmd1wmxC/AHEjj2ogV9IIyBPgJ2pp0MfjYEvlnRRF03doN5
	J5mnZrCYjvQyJBn1qwDYYWTJPWWvaj57tpG10gsRI5L9l1PJ++4hYHkMQktbXJEVONbLrx
	PliD+BrZYGjdJF/NPnPvfXvp6/cqfdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764146086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HlOmN3jMJp9EzokxJNCZpMueGDBJAXVM0ZWkpX11uSo=;
	b=UC/H/lOGz3koAs/XAmqY/6/qxdJBDLPX72OKxUhgsw+F4JArBHt9yMU9UjPFUZTRsQBk7O
	332j9awom6/ATVCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764146086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HlOmN3jMJp9EzokxJNCZpMueGDBJAXVM0ZWkpX11uSo=;
	b=xJ4dQulOLD7599DoppqIL/oqmd1wmxC/AHEjj2ogV9IIyBPgJ2pp0MfjYEvlnRRF03doN5
	J5mnZrCYjvQyJBn1qwDYYWTJPWWvaj57tpG10gsRI5L9l1PJ++4hYHkMQktbXJEVONbLrx
	PliD+BrZYGjdJF/NPnPvfXvp6/cqfdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764146086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HlOmN3jMJp9EzokxJNCZpMueGDBJAXVM0ZWkpX11uSo=;
	b=UC/H/lOGz3koAs/XAmqY/6/qxdJBDLPX72OKxUhgsw+F4JArBHt9yMU9UjPFUZTRsQBk7O
	332j9awom6/ATVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E71EE3EA63;
	Wed, 26 Nov 2025 08:34:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIAEN6W7Jml0XgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 08:34:45 +0000
Date: Wed, 26 Nov 2025 09:34:45 +0100
Message-ID: <87see1b3a2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Cryolitia PukNgae
 <cryolitia@uniontech.com>,	Jan =?ISO-8859-1?Q?Sch=E4r?= <jan@jschaer.ch>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 0/2] Implement jack detection for HP Thunderbolt Dock G2
In-Reply-To: <20251126003805.2705503-1-tasos@tasossah.com>
References: <20251126003805.2705503-1-tasos@tasossah.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 26 Nov 2025 01:29:55 +0100,
Tasos Sahanidis wrote:
> 
> This series adds jack detection support for the HP Thunderbolt Dock G2.
> 
> The first patch modifies the existing realtek quirk for the Dell WD15/19
> docks to allow changing the commands/algorithm used for jack detection.
> 
> The second patch implements the detection for the HP dock.
> 
> This series was tested against both a WD19TB, with no regressions, and
> an HP TB Dock G2 without the optional USB speaker audio module. The
> module shows up as an additional USB device, so this should not affect
> its functionality.
> 
> Tasos Sahanidis (2):
>   ALSA: usb-audio: Modularize realtek_add_jack in mixer_quirks
>   ALSA: usb-audio: Implement jack detection for HP Thunderbolt Dock G2

Applied both patches to for-next branch now.  Thanks.


Takashi
