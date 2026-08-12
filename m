Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675052C86D;
	Wed, 12 Aug 2026 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512523; cv=none; b=G3mzyAO1+Vg57jOu9GP9KxDj01n9VIA1bZ7aJVsgwk2uAYfUoBdNXT9qpRBVHhL5oFzW/gQe+Eqf7FxalrJVD2a4i2ti5lagCbjQ3JGP8aRHa6rmjaHDJ2Z6LJWpSYKy4CkCCRYMtKhywL7eyNQU7u1sFJhA9TlFQncBM/Dhs+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512523; c=relaxed/simple;
	bh=3Jyv5pylXMUDdK3SxEt/22WnLJWrj/oHf2NjZhbwJN4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UmnenJoXvL5NR30RdfWgOcQLZj0sxrojOCBT+J7YIY8/PaZRtnrfJpSjBCeeohi73Yu1yymIs/DlqzrAwKra9uMBP/g5U7SVF9JTJvdKfF5SlnlfT3+ng6JHX01QL9n2rxvjxrWSe8tG6DW2GW52UICvcdkvnbZT4QCiGznwHA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ys3qxFON; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AYCEwI/C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uC2cPvpa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZC3Yw07K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ys3qxFON";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AYCEwI/C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uC2cPvpa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZC3Yw07K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C75C820B5;
	Wed, 12 Aug 2026 05:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw0JKWMy0gpaSIRQn8P3QClHWTtiKGajc8zjqp2UipQ=;
	b=ys3qxFONam8x3BgFqvpsGfXhK76wcE+sUSXcXOQdiFS8SJ53qlSXZGkwttgin+BoYfvN9+
	0nTvghDzUjxxivaKLvB/I1j2YfYFdnzcWXwCmh5vcL+ULkw0+X17SdzfnnDD91qsCy++kL
	9owyqbDS1ojMBvmdUISHAa5C3mYxO4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw0JKWMy0gpaSIRQn8P3QClHWTtiKGajc8zjqp2UipQ=;
	b=AYCEwI/CV9XyFB1eQLNhMTGz3EUW0ImcvylyfYxTR3vlRghUILBuUHHKtUOSLf77saJ1RF
	FQlgyjS4hXr0amBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw0JKWMy0gpaSIRQn8P3QClHWTtiKGajc8zjqp2UipQ=;
	b=uC2cPvpacKchc0TsXZdip6Co8+lgowZfm8FD823paslyvkzVXl0TWTQtelilvTZOxVs62B
	K4wPBYpSdvJkwb7STNWkabxfEKJOotU91+Lt3M14Tka2ZQdxMUDSlpMd884FYTqL8l267v
	cxF3fUr7KOd2ehWaC250w1APswQb7oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw0JKWMy0gpaSIRQn8P3QClHWTtiKGajc8zjqp2UipQ=;
	b=ZC3Yw07KlLbZSQtYDUmFGf9YCKvFfHIsEdUgUhrhhaoW57wPl7ipmRxmF1qJeTf+26rZae
	znQlhLMTbJ+tTRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17902779B1;
	Wed, 12 Aug 2026 05:28:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r2aCBIAEfGplbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 05:28:32 +0000
Date: Wed, 12 Aug 2026 07:28:31 +0200
Message-ID: <87o6f729hc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: vorhees-work@proton.me,
	Trevor Vorhees via B4 Relay <devnull+vorhees-work.proton.me@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Abhinav Mahadevan <abhi220204@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix sample rates for PreSonus AudioBox USB
In-Reply-To: <20260811-audiobox-usb-fix-v1-1-13c8b7f071ea@proton.me>
References: <20260811-audiobox-usb-fix-v1-1-13c8b7f071ea@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[vorhees-work.proton.me];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,perex.cz,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Wed, 12 Aug 2026 02:44:10 +0200,
Trevor Vorhees via B4 Relay wrote:
> 
> From: Trevor Vorhees <vorhees-work@proton.me>
> 
> The fixed audio formats for the PreSonus AudioBox USB specify a discrete
> rate mask but leave nr_rates at zero and rate_table unset.  find_format()
> therefore rejects every requested rate, preventing the playback and
> capture streams from being opened.
> 
> Add the advertised 44100 and 48000 Hz rates to both streams and report
> their 24 significant bits.
> 
> Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Trevor Vorhees <vorhees-work@proton.me>
> ---
> Tested with a PreSonus AudioBox USB (194f:0301) on Linux
> 7.1.8-zen1-3-zen. Playback and capture streams opened successfully at
> both 44100 and 48000 Hz after applying the patch.

Applied to for-next branch now.  Thanks.


Takashi
