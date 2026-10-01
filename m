Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71F3B52EF
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838957; cv=none; b=lf+9rs6zA7kEYxxpWhriWz9DntBLfKbE8OerZTliQ8PSjdvb03Ez/qfqQh0fY8bTBmidESAOhBK3pyzPDbGZaWenEoHnV/6iOHNpKAJzm3OOnTWfyYGYvTG81ObRa38lY9QQ4fWd1nld31PYgYQ6KXbQnWPycYgIkM51EQfeLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838957; c=relaxed/simple;
	bh=TDB90B+h3PXWT6P8vGNlk+EvffhuY0cWhVty8zDbGIE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxYjmd1Tev2asVRCUdoJg3LvGq7t2aBBT/KFqcq59kwJ9+LaZO0xugMRcQviLJ/RqYWdA7x1t/4xYQpGByW+DySlqA21JbgSaXZMGGLqb8O2tVoM4fNExDzpwJbqYARUM7NaLSID8TUduyTCkIQYRThH7o0lCjeT7QcUNoO1Utc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cr+1j74j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JbqUP4Zb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GDXy7RPw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o5Du79NB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cr+1j74j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JbqUP4Zb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GDXy7RPw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o5Du79NB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2CC6E1FCC1;
	Thu,  1 Oct 2026 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790838945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIK4SC9eqruyr6PQ2rR/kVzHHgpBxMaeCiHD6C0q5wU=;
	b=Cr+1j74jvHR6zc1ngEuFPn6Ekw2+J+TorTHBSk15/sn2xrHe/e8jM0JT8WBDT06gRstXRx
	ViaxSexLU1MOeH3d2PyIizgqH2+gyftNvsfpWgYXr+cdOyPefNoLepknYXQ03dQuRzP/2Q
	Pg8zeTfZ7Abset+mjREhaKoebPc/wi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790838945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIK4SC9eqruyr6PQ2rR/kVzHHgpBxMaeCiHD6C0q5wU=;
	b=JbqUP4Zb1pEZeD0nNkwN/c8/FFDCQlZPNPg/4ByZCU9MDuEZIVBlQ2U6YL63kCOJoEmvXl
	ZPdDwrugZFaG9pDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790838941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIK4SC9eqruyr6PQ2rR/kVzHHgpBxMaeCiHD6C0q5wU=;
	b=GDXy7RPwsNVUXkmV2tsojjyFmzciK7d1XK/PDg0Ui8cWwDcz9tKlH42fvuryrt1HGq4cZY
	3ehyFaSWizVIp4BnZOdc/IbxWEsykd3nB2YpT5w/qQUttl1HsMKp+eyPNx60GN1ODtepPv
	geG0QkvWMiw9gpIUvXwmgQ/2A0cXXD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790838941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIK4SC9eqruyr6PQ2rR/kVzHHgpBxMaeCiHD6C0q5wU=;
	b=o5Du79NBDUaqLzF59Se20m1qHFYRsFfgkTWIqC7w8Iof0GbeAlapNAK/SaqWVJ9eTaQyaU
	jTdlemRED4XTruCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D23A6134B3;
	Thu,  1 Oct 2026 07:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i1CdKZwIvmoqFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 07:15:40 +0000
Date: Thu, 01 Oct 2026 09:15:40 +0200
Message-ID: <87wls13n8j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zeyu Li <13776528859@163.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
In-Reply-To: <20260928141200.20712-1-13776528859@163.com>
References: <8733ut5ylq.wl-tiwai@suse.de>
	<20260928141200.20712-1-13776528859@163.com>
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
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 28 Sep 2026 16:12:00 +0200,
Zeyu Li wrote:
> 
> Hi Takashi,
> 
> Thanks for picking this up.
> 
> To confirm the test setup: this was verified on an ASUS M5451GA laptop
> (codec HDA:10ec0235,10431814). Before the change, plugging in a CTIA
> headset was detected by jack sense (mic presence and VREF bias were
> set correctly), but the capture stream stayed permanently silent.
> After applying the ALC255 coefficient sequence (COEF 0x45=0xd489,
> 0x1b=0x0c2b), the headset microphone captures audio correctly.
> 
> I'm happy to test any alternative coefficient values if Realtek
> suggests a different sequence for the ALC235.

I applied the patch now.


thanks,

Takashi
