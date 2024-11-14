Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8301DA4E
	for <linux-sound@vger.kernel.org>; Thu, 14 Nov 2024 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591741; cv=none; b=iUFSFk37NSSyT4cTC6ww6GADH2sShP8ivt90/CKzWyaNnegakswpnGUW9h35WGmNelrgMY4tmlZ/zmISfEfQZ5va/5/MoO5zqKBqnBELE3DS/fWopu+W9LTAaTkZzGyt6Gluz1ju6NW/yeHMiBTjpDjL5HenwqRe7neTSyFP6R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591741; c=relaxed/simple;
	bh=GhBCl8h3aK84awA++wi3xVWoUGhm805liXbHN30g+AA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVKoxOrFD1Qkb7zbLcw5YiMEOFIxL2ibTnEIidfua0I4lnGdHKr+Mz2OTKWOkEeTHIwWo6MjfU436YQ99ptfW56dsbUrt0mPBVaKSdKfZQ66vxB3NfBlkRrpS3ZrNdlo7KH88ifAsmjtlvQdlz1+A/fbXGfPIa0KfY4U5PAvV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k5eYuDLm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bgDn9WyO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k5eYuDLm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bgDn9WyO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k5eYuDLm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgDn9WyO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k5eYuDLm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgDn9WyO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F3011F37E;
	Thu, 14 Nov 2024 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731591736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUPyQb/TXNSHfUhyWDB4azrlwNtRzTZ3ZRF+nbE1Jgk=;
	b=k5eYuDLmJCjNIidg7Ize7df3G8eQN5UwXH+2SFr96pQeccWU0eLl4Yoe4JqdbkIRqH3fpT
	I4QxSGKl0hibmmYhNieiugyZFsAhIoiUm0S26n2G8gznjbN6zIrEIG6fiohrNf8/+3Qb/m
	ON0blJ75nI55Pca/IchtOlWtKt+Ux8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731591736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUPyQb/TXNSHfUhyWDB4azrlwNtRzTZ3ZRF+nbE1Jgk=;
	b=bgDn9WyOlyqB+THIMb0YC5wMbGlAboOfun7G9dG4uAfQ9cKgLApJ0WmZkZLxataKp5luzY
	AWiaSIeqVS93P0Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731591736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUPyQb/TXNSHfUhyWDB4azrlwNtRzTZ3ZRF+nbE1Jgk=;
	b=k5eYuDLmJCjNIidg7Ize7df3G8eQN5UwXH+2SFr96pQeccWU0eLl4Yoe4JqdbkIRqH3fpT
	I4QxSGKl0hibmmYhNieiugyZFsAhIoiUm0S26n2G8gznjbN6zIrEIG6fiohrNf8/+3Qb/m
	ON0blJ75nI55Pca/IchtOlWtKt+Ux8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731591736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUPyQb/TXNSHfUhyWDB4azrlwNtRzTZ3ZRF+nbE1Jgk=;
	b=bgDn9WyOlyqB+THIMb0YC5wMbGlAboOfun7G9dG4uAfQ9cKgLApJ0WmZkZLxataKp5luzY
	AWiaSIeqVS93P0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0A9813794;
	Thu, 14 Nov 2024 13:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4tXMODf+NWfYYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Nov 2024 13:42:15 +0000
Date: Thu, 14 Nov 2024 14:42:15 +0100
Message-ID: <877c96szig.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 14 Nov 2024 01:04:22 +0100,
Jaros³aw Janik wrote:
> 
> On 8.11.2024 15:17, Takashi Iwai wrote:
> > OTOH, a question is rather the other route -- the beep via pcspkr
> > driver -- if this beep still works while the HD-audio is runtime
> > suspended: that's the interesting point.  Could you check that?
> > You can figure out which input device corresponds what, and try to
> > trigger directly there.
> 
> Beep via pcspkr module works fine without your patch - regardless of
> current PM state of HDA device; with your patch applied - the beep is
> very quiet if HDA is suspended (same as with firmware generated beeps).
> 
> > Also, one more question is whether the beep tone persists if you mute
> > the volume on the HD-audio (e.g. set "Speaker Playback Switch" to
> > off).  The beep tone at shutdown should be gone in this state, too.
> 
> pcspkr generated beeps are immune to every mixer/switch setting except
> for "Master Mute Switch", which mutes them completely (i.e. they are not
> very quiet, they are gone). And again - this is the very same as with
> firmware beeps; that would mean that both (firmware's and pcspkr's) are
> using PIT to drive "PC Speaker".

So, if the HD-audio Master volume influence on the beep output of
pcspkr, it means that it's flowing over HD-audio, likely there is some
analog-input loopback.

Could you give alsa-info.sh output?  (Run with --no-upload option and
attach the output).

If there is a mixer widget there, one of input pins might correspond
to the analog beep input -- even if the pin is marked as unused.


Takashi
