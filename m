Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A4364029
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259214; cv=none; b=aj60RSLzTHD3FK96swFV2kZx1SeWAKTwRAZwLNAADbFTz80Cr+CI4+v1rkDEodQNWzpbAFs4uPZtXVgFjiBYXm45V7iKrsWUWiAO03ddRHHm8EZf8KXZmnsju43LXOhBIOl/4AAwWfoI/OKknGEDQc1OptvXZZLZjs5ZDD4FwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259214; c=relaxed/simple;
	bh=EMP49n8Myx8KQke9Kn6Aejs0z52rTA9AJPbCv+iguz4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUXCNsrmpHo+sMkjuizA4U34Ws+IDUOic8YcBdZOwWtItmeJE+ca4IXt5/wnXZGs8PgcjeweeHUWio/h3GxlZVMb/iTR4WYdHeS3cNLqmJzLoUFE0AViqjtiREJb/NU0CuqnVUWO5GA9FfnxUwlO0BEDC1rHJIMiD9h7+8BH0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xowhMQ3/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FQW13B1a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dsfTdZDe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6IUOjNTE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xowhMQ3/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FQW13B1a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dsfTdZDe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6IUOjNTE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83F0F22774;
	Tue,  1 Sep 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LBAXflVIXxxJgVmIqtB2uv1NecDUw567H8abGJuU3E=;
	b=xowhMQ3/+CoO6m2kkQ3RZ/M3U2zuhnZ94m9Y8I4W3jtsCgawTY5wuPNmMFuDmoxXlaV2e2
	XeyDqmt3r7iNwUzQnrQRqN32pByE7sRUnBw/38xMWCCUfiEKjDHG+uH+65ueVgQcNBKZ5x
	e83hI8jFx5Htqh5uE2zwzjzkrUTktsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LBAXflVIXxxJgVmIqtB2uv1NecDUw567H8abGJuU3E=;
	b=FQW13B1ast4ChwW+GIbk09/n2enVyRKnym7MGeU+mJsJ/nE/nkxRDQ4sNHjRdqtBXxjIU1
	E+GSa8SC53FnvBBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dsfTdZDe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6IUOjNTE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LBAXflVIXxxJgVmIqtB2uv1NecDUw567H8abGJuU3E=;
	b=dsfTdZDeE88hNQtuB5tJwa/TGyFrTlF979HivmqBxIYcaN04WYsYkEW46FY2swcgKvi54h
	U+QtV/eU73S8l7xiRcm5wdcxivK5RYlt0z4F6Ah7yst2GuV6RhNSFbxoqLbyacXfNjznuB
	DsF3zOddn1DZ93wbLqTgnHTpDSFCM9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LBAXflVIXxxJgVmIqtB2uv1NecDUw567H8abGJuU3E=;
	b=6IUOjNTEuf+V93cdqMLwPSFFtZ7uYgk+0oKpywqI+SmRgD0JQXk7IEUSzv5B9M6UFTdQdN
	VO8D+KnK3nOXKlDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5457913515;
	Tue,  1 Sep 2026 10:40:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ap79E4Krlmo0CwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 10:40:02 +0000
Date: Tue, 01 Sep 2026 12:39:57 +0200
Message-ID: <8733vtdzlu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Drabik <drabik.p@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: usb-audio: Add mixer map quirk for Audient iD24
In-Reply-To: <20260831195855.1836617-1-drabik.p@gmail.com>
References: <20260831195855.1836617-1-drabik.p@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 83F0F22774
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
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
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

On Mon, 31 Aug 2026 21:58:55 +0200,
Peter Drabik wrote:
> 
> The Audient iD24 (2708:000d) exposes feature unit 12 as a 4-channel
> "Speaker Playback Volume" control (cmask 0xf, -127..0 dB).  The device
> does not actually apply this volume to all of its output channels: the
> left main output ignores it and stays at 0 dB, while the right main
> output honors it.
> 
> When userspace (PulseAudio / PipeWire in a stereo profile) adopts this
> control as the master playback volume, any setting below maximum
> produces a stereo imbalance on the main outputs.
> 
> This was verified against the device's internal meters: with the
> control set to 107/127 (-20 dB) on all four channels and a digitally
> identical L/R sine played back, both DAW return meters read the same
> level while the right main output metered exactly 20 dB below the
> left.  Restoring the control to 127 (0 dB) restored the balance.
> 
> Rename the control to "Monitor Mix Playback" so that it is not picked
> up as the stream's master volume control, in line with similar quirks
> for other devices.  The control remains accessible for manual use.
> 
> Signed-off-by: Peter Drabik <drabik.p@gmail.com>

Applied now.  Thanks.


Takashi
