Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CD199B9
	for <linux-sound@vger.kernel.org>; Tue, 19 Nov 2024 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029683; cv=none; b=gSkN5oOo3epeYb90z1bCQ65qiGHuS5M0zRBJLm0JALNCME+3cJPvCLGnkzzAPD0uLTRdxrssr01D9ghdXOlHH1gEIQlf//YySOeUANrwKz5eQlcHe7RMtEmhW/G3l9rj2Ija+vN4qq1VPVJdP7GtFakPB1Mw5Eia8b7F6rId1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029683; c=relaxed/simple;
	bh=hX/pekVxwMsVEgazncnU9O/ofbSkCZQhDzG4QauijjQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxkOZMXd1bUCnpVdWYVpR/zi+8S8ldYkA0T2rZIAIli2Yvp/uXhYyFqqPGVOMfHrFQdFFGLAq8ea8PIQglf8UaTz/rQvwtJRW3CHeWpktlfwUCUb70BN0rwCfCeky9zQGRjRjuqSaKGpCDL3ZvaQCzJJjUZazbLD642w5EW/0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dwKBo1Xt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t7bQxZkZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=snhCnxZA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=izMr7fiZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dwKBo1Xt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t7bQxZkZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="snhCnxZA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="izMr7fiZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4431219F1;
	Tue, 19 Nov 2024 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732029680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxCWQq1beZZ5BME3CYR6RkP5Pwsx+NP3KcRZi1uVSb8=;
	b=dwKBo1XtDLBjNCtPU3JfE0cffFkpK01wvCegcBIxA06Eh8IB5yIEwVIeNP2t0lirUFmtxZ
	1WvU472ayC16dpjQRQssql/PHrcSu8Ls0deI3DaeWFF8X4iCRneeZwaRqHsx1zrwoarpdR
	Kz+3ejNRGzo2+otqzg3wHgwWlU6/gSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732029680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxCWQq1beZZ5BME3CYR6RkP5Pwsx+NP3KcRZi1uVSb8=;
	b=t7bQxZkZ65tJW+R+EDjaD4L7P44jKjcvvEwZfsKVd4VlhxwfJUzX/mxpVdhYMPAbGl9szY
	0REl4SFnfNgan9DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732029679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxCWQq1beZZ5BME3CYR6RkP5Pwsx+NP3KcRZi1uVSb8=;
	b=snhCnxZAAKsxUVb0oozUzHGbdg7/0JFnsK3LGocXU+zT+u2ImW4d94CtKxn7xuvUddYya0
	jk3LUbEiUtV3UqMe85O9jXOLPN91KmGGA/tj/4X5IBU5/PsF4fF6TUz0SSQYtVyvof+U48
	I2NiPeu6TZLWsu1pHkZVLK4ay0qTSnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732029679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxCWQq1beZZ5BME3CYR6RkP5Pwsx+NP3KcRZi1uVSb8=;
	b=izMr7fiZTkrFbEq2eiIquWKDgTkJfNGjJLAtQNOTukWyWz/h7hbqN0jiylWhKbAdbR6ZhA
	LSKegFmuovTfnnDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B18571376E;
	Tue, 19 Nov 2024 15:21:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2NUsKu+sPGccIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 Nov 2024 15:21:19 +0000
Date: Tue, 19 Nov 2024 16:21:19 +0100
Message-ID: <87jzcz5jww.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
	<87ikt7v028.wl-tiwai@suse.de>
	<74e49336-4552-4224-9b14-204d4264d647@gmail.com>
	<871pzuujkc.wl-tiwai@suse.de>
	<18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
	<87a5e9g68w.wl-tiwai@suse.de>
	<e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
	<877c96szig.wl-tiwai@suse.de>
	<98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 15 Nov 2024 05:34:57 +0100,
Jaros³aw Janik wrote:
> 
> On 14.11.2024 14:42, Takashi Iwai wrote:
> > So, if the HD-audio Master volume influence on the beep output of
> > pcspkr, it means that it's flowing over HD-audio, likely there is some
> > analog-input loopback.
> > 
> > Could you give alsa-info.sh output?  (Run with --no-upload option and
> > attach the output).
> > 
> > If there is a mixer widget there, one of input pins might correspond
> > to the analog beep input -- even if the pin is marked as unused.
> 
> alsa-info.txt attached

Thanks.  So this codec chip has no analog input mixer unlike Realtek.
Hmm. 

I'm not sure whether I already asked it: did you try to turn on/off
"Beep Playback Switch" (i.e. mute/unute "Beep" mixer element)?
It should control the digital beep of HD-audio's own beep input
device, but this might be also related with the internal beep from the
Lenovo firmware (and the output of pcspkr input device).

And, judging from the fact that "Master" volume influences on the beep
sound, it also means that the sound is routed to DACs -- for Conexant
codecs, Master is a virtual control just changes both Speaker and
Headphone volumes/switches, and both Speaker and Headphone controls
are tied with the Audio Output widgets.  You can check whether the
beep tone volume from pcspkr or Thinkpad ACPI is also controlled via
Speaker and Headphone mixer volume and switch.


Takashi
