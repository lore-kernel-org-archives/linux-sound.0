Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A1B3AF64B
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508370; cv=none; b=dpjKNf0KubA1tXyI+k5+CDJYDY48ihWB3PDONw7rl0QarFAHClzpzRhbpwclujbYD/cSso8AC3Kl5CfAZRYgp8U4CnfoAnPcQqXEf/gVOtYty69fCBrlLulVGZT5TT/lgRf6KSOA+hPcJZez6RlmJwmr2wvaU9tMy6xR+utdIkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508370; c=relaxed/simple;
	bh=fknr8aQ17KZmV1sObp2GqeBbCQwJ8IiprR3JCXZ5xEM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwlfilSFNXAFUU1/B05sDhlmHrOLa8bEL3sTo0f006yVo2VvgMh5Q/naw6K5IA0cG10kYqoIlW1Qv3L6ARs0BgH5FBdMsyy+cCDNs9yW4RCekscDTT/EMb1Nsk9mSIoeRkFnvDoNYaZwOidoH6vQ/pK95o9a/ZtUpOrJkpEhJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=msSnj60B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3MbfsOCr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=msSnj60B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3MbfsOCr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="msSnj60B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3MbfsOCr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="msSnj60B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3MbfsOCr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E37C66BDEA;
	Mon, 15 Jun 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781508367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3a7xvtc+V/WyPKdyCGc06OkE3G3Rz9nDiUTbsd3n10=;
	b=msSnj60B50qRBNuSDHLVkqv3No2Z2cXd3ddtCAk+OdrZbtgXY0DnpcQ790HDKPdW5TbnsY
	0VquX9WBpfrJO8lPFD4gmf9+3rQt2YNIrxX040AfVqb7gbRSBx/KIMHOBjx56EpiBTcTw7
	f+uXmeCwqrHMK2xK1qeku00Ec7d6w90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781508367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3a7xvtc+V/WyPKdyCGc06OkE3G3Rz9nDiUTbsd3n10=;
	b=3MbfsOCrgakCZTNUxHeeFCjQLiFCP6OtAFvZP+su/+9Z9zakgruy8ELs6Url4dWgJJo68k
	FkN6r3RjPOaGQ0Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=msSnj60B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3MbfsOCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781508367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3a7xvtc+V/WyPKdyCGc06OkE3G3Rz9nDiUTbsd3n10=;
	b=msSnj60B50qRBNuSDHLVkqv3No2Z2cXd3ddtCAk+OdrZbtgXY0DnpcQ790HDKPdW5TbnsY
	0VquX9WBpfrJO8lPFD4gmf9+3rQt2YNIrxX040AfVqb7gbRSBx/KIMHOBjx56EpiBTcTw7
	f+uXmeCwqrHMK2xK1qeku00Ec7d6w90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781508367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3a7xvtc+V/WyPKdyCGc06OkE3G3Rz9nDiUTbsd3n10=;
	b=3MbfsOCrgakCZTNUxHeeFCjQLiFCP6OtAFvZP+su/+9Z9zakgruy8ELs6Url4dWgJJo68k
	FkN6r3RjPOaGQ0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE7C1779A7;
	Mon, 15 Jun 2026 07:26:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aM7/KA+pL2q5QgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 07:26:07 +0000
Date: Mon, 15 Jun 2026 09:26:07 +0200
Message-ID: <87pl1smfhs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: fix use-after-free of borrowed substream in snd-seq-midi
In-Reply-To: <20260615002821.47317-1-doruk@0sec.ai>
References: <87pl1xk06z.wl-tiwai@suse.de>
	<20260615002821.47317-1-doruk@0sec.ai>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E37C66BDEA
X-Spam-Score: -3.51

On Mon, 15 Jun 2026 02:28:21 +0200,
Doruk Tan Ozturk wrote:
> 
> On Wed, 11 Jun 2026, Takashi Iwai wrote:
> > There has been already a similar fix queued in sound.git tree for-next
> > branch:
> > ef7607ab1c8adc6258fb1b27d08e26aecdc18a58
> >     ALSA: seq: midi: Serialize output teardown with event_input
> >
> > I believe this already addressed the bug.
> >
> > Let me know if there is still anything missing.
> 
> Hi Takashi,
> 
> Thanks for checking, and you're right -- ef7607ab1c8a ("ALSA: seq: midi:
> Serialize output teardown with event_input") addresses the same race my
> patch targeted: event_process_midi() borrowing msynth->output_rfile.output
> while a concurrent midisynth_unuse() releases the rawmidi file and frees
> substream->runtime before snd_rawmidi_kernel_write1() pins the runtime
> buffer. That commit serializes the output_rfile publish/clear and pairs the
> output snapshot with an in-flight reference, which closes the window, so my
> patch is redundant.
> 
> Please drop mine; nothing further needed. Thanks!

Thanks for confirmation!


Takashi
