Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EB4EA39D
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674909; cv=none; b=s4ARQ52b34c0lN6mE3a2/55TnNq+Xqqk4Bi7VgarZX38tLhk1CjPE6nrfJMps6cyxx6Q7RRpF+Tk3t+7/OjwEDeAvU/0A/y2Oj6mucZ+2wSS3rLLtwriorS+WL+OLDw7ab7R+w8GS5ze/86H216wbQ4jgryK4kE13fqmSaEO5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674909; c=relaxed/simple;
	bh=i6MhToSUeXUaZjAInrxfmf5v+jFaJbeEauNI4hselkY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiBs74Vj1AUVJwsg3yB2+5pWg0lluxWpL/dyqOJ0/gBTx28930UMPU2m6THutygb/VArKJ9DzVXwCjff2m9tKE9Bmmk58ltiNgqiHSO5XsTjZo+iy/txgSN7FrU3aOd1FeWE/CV1QJ5CYGut8bCoqbov5MgZMCCq/Oz85mPAQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fvWUrcSI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+I0bGYqD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gW3rEXIu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z8mz7Od1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fvWUrcSI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+I0bGYqD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gW3rEXIu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z8mz7Od1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EABAE21CFE;
	Tue, 29 Sep 2026 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=518M9MBya01LM82FycnZEhBFFMo6IqemH7hrp2/q4PY=;
	b=fvWUrcSIvsOyjHlc9E8gB9EE0A8gfBfVcCpnTyqAbmG2UvqnyW02rFClaR/stEgl/npRlD
	5o/FsU/6Y8nq3zSfaTx2s8CBiyfIxBA7caxihPePJNdv1GlGxxXm2Zw//3JxBfw0w4C4cJ
	ECIKNOuYkwd0VyyIveNBNGpCjiQ97FI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=518M9MBya01LM82FycnZEhBFFMo6IqemH7hrp2/q4PY=;
	b=+I0bGYqDHdGCfSlVszS57xx/TA1EY3t9TYJi+7azNZbxMgciMqgT1XB26cdHQytsNN9onq
	SR2FL/kAn1rA+xBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=518M9MBya01LM82FycnZEhBFFMo6IqemH7hrp2/q4PY=;
	b=gW3rEXIuTkxLj24nZ8dYSeMlTcQHpU2mguC1o4M4Ae1Nst+IFBPg4qRvpi8+3EVTBIyWNC
	2o6aKTxl8pZcMTTABw9oIBvd+GQbcP+MfuHS12GO72cwvYrD4EJ59+HLJFDSYY7EnAr6Fs
	tLku6BZTYki21wCTD59Jk78YajRpVHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=518M9MBya01LM82FycnZEhBFFMo6IqemH7hrp2/q4PY=;
	b=Z8mz7Od1jV7Ui6GCi4Khdn4GRH9ZhA5n7VyHbNQvBxiJiTSs8zMmwfT5vl7qSqXhmGCWbT
	PxYeresv0UJ+4tDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA008133F1;
	Tue, 29 Sep 2026 09:41:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kTxeIMmHu2ppIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:41:29 +0000
Date: Tue, 29 Sep 2026 11:41:25 +0200
Message-ID: <87bj9g2y4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Darren Chang <darrenchangjr01@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for inverted sample rates on NUX NAI-24
In-Reply-To: <20260920122653.41993-1-darrenchangjr01@gmail.com>
References: <20260920122653.41993-1-darrenchangjr01@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 20 Sep 2026 14:26:53 +0200,
Darren Chang wrote:
> 
> The NUX NAI-24 (USB 3703:2000) has a UAC2 clock source that reports
> bmAttributes = 0x01 (internal fixed clock) and bmControls = 0x07, so the
> driver treats its sample rate as programmable.  When the driver sends
> SET_CUR(SAMPLING_FREQ_CONTROL), the firmware acknowledges the request and
> then runs the clock on the opposite base-rate family: asking for 44100 Hz
> makes the device run at 48000 Hz, and asking for 48000 Hz makes it run at
> 44100 Hz.
> 
> The result is playback that is about 8.8% fast, or 8.4% slow with heavy
> static on the 48000 Hz family.  macOS and Windows ignore bmControls, treat
> the clock as fixed and resample, so they are unaffected.
> 
> Work around it by sending the partner rate in SET_CUR for this device, so
> the device runs at the requested rate.  A new QUIRK_FLAG_SWAP_RATES flag
> controls this, applied through the quirk flags table.
> 
> Only the 44.1/48 kHz pair has been verified on hardware; the 88.2/96 kHz
> and 176.4/192 kHz pairs are untested but follow the same pattern.
> 
> Testing: the equivalent change ran on the device as a locally built
> module (44100 Hz PCM, device clock 44100 Hz, no xruns, correct tempo, no
> static).  This upstream form compiles for sound/usb without warnings and
> passes checkpatch, but has not been built in a full kernel tree or
> load-tested.
> 
> Assisted-by: LLM
> Signed-off-by: Darren Chang <darrenchangjr01@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
