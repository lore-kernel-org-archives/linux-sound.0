Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53CE3AEF20
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404761; cv=none; b=g7ZEwI1xZdFEimwi7zCtogkr3TvzASE0rs5Z6KFnWQu6LtpbdJlK2yxxgJarFJIYD2P5EekMfFB3EnfuBf3nDvIrBLlpPA9wzFDukrqT8AwGwbdeqUo14fwgDtpzrfk6C2NfxvgpXgiCppNR+r8QL3h5SV7CLFKCp81L+PiAeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404761; c=relaxed/simple;
	bh=iTEYpLqpHsAjKFQlcVoCcu+6TvG+QHwbJOjgDGCY3V8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sb+wyxdYk5e3p9jlZXJVf0ziRZ1MfhsQsCL58MRiBa3Rb0xkeOHReewbvyMMqSSaKnG0Q0ZHgawmk+7ds0jM65o5tp2CLBE4aTunkbhvj2qB0AECxJ8tiW8r0SnA3xVCHFKynvKXWLSlTudzpD7Vazf3Gott8NxE5LQquBDsoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rf1v593d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPSDqrsi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EfdPJ8Gs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5VJ3ntUx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rf1v593d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPSDqrsi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EfdPJ8Gs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5VJ3ntUx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3CE57D646;
	Thu, 30 Jul 2026 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3u3REreOXfWGjXHyXwYfRza2yLd2omikkiP5xzB3PSY=;
	b=rf1v593da9hT7Ry1CJK7oJ1KBh6IHOHVgTw1kYF5HqjxTlqy2ZvlbUT6T0oY6Prbw8fUdz
	l4q+GtCBuQdF2EmFmdFgSgnRhqw43Au+tlHb5ZoElfWjTwqlHIXAK0s2wFDAaFtwJ/jj4Z
	/BHRgTATNpo2ByqNPy8HzCzhtFcSs64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3u3REreOXfWGjXHyXwYfRza2yLd2omikkiP5xzB3PSY=;
	b=SPSDqrsihpKEdwBTDv5o9ckh9ax8+koQTeSUpZerMgDiJB7Dsn+t6UpHwxsNuSHtPG1ok4
	ElHZXhAEl6VL8UCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3u3REreOXfWGjXHyXwYfRza2yLd2omikkiP5xzB3PSY=;
	b=EfdPJ8GsKG30W1mNlXSoqBU0XzvyR36IVSlSqw/efzop25HQ4NkVxnw1PFbVUGaQqBDFoK
	eyAbZKUJE67d+zjDTjcxOvUsR5nFldCIMMFAo9nXS7wAjjsbLw1l+XvhTHEHf15Me8WSGP
	9rqpWpHy1mLaUQ+cGxbUZUOGIepQRTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3u3REreOXfWGjXHyXwYfRza2yLd2omikkiP5xzB3PSY=;
	b=5VJ3ntUxdpCEddoFIv9MzXPjCtVjkj1A0pl1ieLLYONoorJd+WT9tY5mnu3vm4osovGkHX
	lPWJA/iNLd7O3qCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B01A4779CC;
	Thu, 30 Jul 2026 09:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jUTRKU0da2orBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 09:45:49 +0000
Date: Thu, 30 Jul 2026 11:45:49 +0200
Message-ID: <87jyqc3j5e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] ALSA: hda: cs35l56: Use auto-cleanup for firmware loading
In-Reply-To: <amsa/K5eyyCBwNLa@opensource.cirrus.com>
References: <20260729083735.120219-1-tiwai@suse.de>
	<20260729083735.120219-7-tiwai@suse.de>
	<amsa/K5eyyCBwNLa@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 30 Jul 2026 11:35:56 +0200,
Charles Keepax wrote:
> 
> On Wed, Jul 29, 2026 at 10:37:24AM +0200, Takashi Iwai wrote:
> > Simplify the code to manage the firmware loading with auto-cleanup.
> > By the use of __free(firmware), we can replace the manual mutex locks
> > with guard() gracefully, too.
> > 
> > Only the code refactoring, no functional changes.
> > 
> > Cc: patches@opensource.cirrus.com
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
> >  1 file changed, 9 insertions(+), 26 deletions(-)
> > 
> > diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > index 78c2cf387a00..bc207ab5b020 100644
> > --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > @@ -527,18 +527,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
> >  						  base_name, NULL, NULL, "bin");
> >  }
> >  
> > -static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmware,
> > -					       char *wmfw_filename,
> > -					       const struct firmware *coeff_firmware,
> > -					       char *coeff_filename)
> > -{
> > -	release_firmware(wmfw_firmware);
> > -	kfree(wmfw_filename);
> > -
> > -	release_firmware(coeff_firmware);
> > -	kfree(coeff_filename);
> > -}
> > -
> >  static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
> >  {
> >  	int ret;
> > @@ -561,10 +549,10 @@ static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
> >  
> >  static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
> >  {
> > -	const struct firmware *coeff_firmware = NULL;
> > -	const struct firmware *wmfw_firmware = NULL;
> > -	char *coeff_filename = NULL;
> > -	char *wmfw_filename = NULL;
> > +	const struct firmware *coeff_firmware __free(firmware) = NULL;
> > +	const struct firmware *wmfw_firmware __free(firmware) = NULL;
> 
> Is it definitely safe to replace release_firmware with kfree? In
> most cases that is all release_firmware does, but it looks like
> it does different stuff if someone built the firmware into the
> kernel?

It's __free(firmware), not __free(kfree) :)


Takashi
