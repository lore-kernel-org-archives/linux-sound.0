Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC41EF09B
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775465669; cv=none; b=nre0JS8FQfu42rhXEJFcLh31znCvWbYZ4zqynNVPLmM2gr5yXtvtLk9d4JRvgOdnn5gyiSyvmcDzI3JqzziGVWdU9z0y99TbdbOB2928J1nMOw9eavZOidvj++pRPcnUvYvkRbmuZTVzUvSF9odC5KpEmIY1Q7LKLiTNS7tqILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775465669; c=relaxed/simple;
	bh=07k0lpCOmM9PFMpr3whmsTqr/lNQOSWYkQu/uhd/iIM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqlF8kaXiTbyEhkBH/m4L5k9POZmOOXJkBjqJe41+ivFMigx0nqtz2h1W/gcL6aC9pTqhwFWvbZYPDNESRndcteQCjbVOWtCh//bofuPSMifEVOohbqwtr3rac4Kw9gtAQ76jsLtWe0tvn2SQrMwfy1YxrNtAKi6kd2fKFuWHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IgZGF5Tq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gssI7lk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IgZGF5Tq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gssI7lk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IgZGF5Tq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gssI7lk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IgZGF5Tq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gssI7lk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D1A04DE03;
	Mon,  6 Apr 2026 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p7qfF5Pt/gpLuakJqnARZO6SqXjlg6GPC5gaNmKY9Do=;
	b=IgZGF5Tq35Y131O8dE2Og/UDnBznCoEdyzSwsG7DkCY1b1ky4+XUyWvT08+L5f5SiEjT5t
	mOZqRjiVI06NteTInqdLcbc0jN4A0spN4QIYo+SoYyk8BrNvQ8G4IdYM0/+mQ6wL5kQEJM
	Pw6VqtHBWYLIqxBQxiyaJEN1MjxXlL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p7qfF5Pt/gpLuakJqnARZO6SqXjlg6GPC5gaNmKY9Do=;
	b=8gssI7lkQcgRtep25LjvkTYy5Ij3tVCPVlreLN02wapO4DGe6ajtNrLvoJZ5MKWzXYbKRA
	K62qMv0rYoFJkJBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p7qfF5Pt/gpLuakJqnARZO6SqXjlg6GPC5gaNmKY9Do=;
	b=IgZGF5Tq35Y131O8dE2Og/UDnBznCoEdyzSwsG7DkCY1b1ky4+XUyWvT08+L5f5SiEjT5t
	mOZqRjiVI06NteTInqdLcbc0jN4A0spN4QIYo+SoYyk8BrNvQ8G4IdYM0/+mQ6wL5kQEJM
	Pw6VqtHBWYLIqxBQxiyaJEN1MjxXlL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p7qfF5Pt/gpLuakJqnARZO6SqXjlg6GPC5gaNmKY9Do=;
	b=8gssI7lkQcgRtep25LjvkTYy5Ij3tVCPVlreLN02wapO4DGe6ajtNrLvoJZ5MKWzXYbKRA
	K62qMv0rYoFJkJBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A21B4A0B0;
	Mon,  6 Apr 2026 08:54:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XFblDMJ002k4MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 08:54:26 +0000
Date: Mon, 06 Apr 2026 10:54:25 +0200
Message-ID: <87wlyklb9a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fernando Garcia Corona <fgarcor@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IAH10
In-Reply-To: <20260405012651.133838-1-songxiebing@kylinos.cn>
References: <20260405012651.133838-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 05 Apr 2026 03:26:51 +0200,
songxiebing wrote:
> 
> The bass speakers are not working, and add the following entry
> in /etc/modprobe.d/snd.conf:
> options snd-sof-intel-hda-generic hda_model=alc287-yoga9-bass-spk-pin
> Fixes the bass speakers.
> 
> So add the quick ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN here.
> 
> Reported-by: Fernando Garcia Corona <fgarcor@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221317
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>

Applied now.  Thanks.


Takashi
