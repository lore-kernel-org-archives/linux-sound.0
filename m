Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7A28B415
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760160; cv=none; b=cihD2+ITOGlTZmx3e8tmWNyGEBPEjS97WCnat4i0SxstLTO4ZtyM5qdCnJ+b0VN2r2wF8C6Fh+MOOVWpxxA09FTHFDNZGLv8JOgP200bBywMntRgIftnCtjb1bHGabIz4s0rnTpLidvEtx5NaXE2Hm61HUHPvtn9aiuP1cPpp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760160; c=relaxed/simple;
	bh=4/KEuNfLf+svLxqhp5eEnviTiZr6miVMk4aKhHrFGXk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDR8VcvfQnAgVC2cn8ylamX/J2+RB21J518otDu7HzGMmVrajpyvex6bBD+p0ABPE9SrxCPclTTZezw3WNtIZKiMmUibyYOY/8tKlQ7wYVqL6zPfq6hcyc4l+XHEHZsb/vdeYZX1kyHu861QtSAzRC7xZ/+7GQoY7q16wCs5pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nh1dHz0G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YvyHYtbr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MBLaiYnv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UAaiVK+q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nh1dHz0G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YvyHYtbr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MBLaiYnv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAaiVK+q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5548336A3;
	Wed,  3 Dec 2025 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764760155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QH8dJFOvRMAf4vhF1s09grSxx3RQiQBRSjwyZZWkWjg=;
	b=Nh1dHz0GgnUFADq23vTg8yh8SGO8lMMdmoSdkpUoOpSvua5iJRc+cnlx7W8HAsvT6lKIfH
	vwHspcXl0xWwmW/SV5XhuI3u1j7hfd60dBDJJn9GeSAj8YdUfRsZOzAbSvRh8pFJ6xAUIG
	BQ7AYxbb/FGirUeDucntt9eO8/j4Iws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764760155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QH8dJFOvRMAf4vhF1s09grSxx3RQiQBRSjwyZZWkWjg=;
	b=YvyHYtbrEIVEcHaAFHi1IT8XbwuDU1c4LxQnIOoYiZBY3J6sJ3l3YgOREok/f51+aTD3wF
	LpMi8yGr9EMHlmBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MBLaiYnv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UAaiVK+q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764760153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QH8dJFOvRMAf4vhF1s09grSxx3RQiQBRSjwyZZWkWjg=;
	b=MBLaiYnvk3TGoxqzPJ3jHGNJV3UaX2CzG2w9xEpjK/Bc6co+DRn0r1yM0Jt2Yyq65A9rl9
	XoY3P/h7OPfwd9onV/8pacN//4Eai8Wn0GcEJu/H87a0TAc7zmfCexGPmKnpbgdGu9Q5Gw
	Q98A1nUP14RuQH+SzzyNnrK1doYEMvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764760153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QH8dJFOvRMAf4vhF1s09grSxx3RQiQBRSjwyZZWkWjg=;
	b=UAaiVK+qvYbNaWOunP+4n3E2HnKi3Rt06Y+HUjNm72U9UJXHraQl2wtVsufCJAZN77PIek
	jqiLfbbHpgssm2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93B5C3EA63;
	Wed,  3 Dec 2025 11:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id slLHIVkaMGlMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Dec 2025 11:09:13 +0000
Date: Wed, 03 Dec 2025 12:09:13 +0100
Message-ID: <87wm33stye.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HariKrishna Sagala <hariconscious@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	cryolitia@uniontech.com,
	franta-linux@frantovo.cz,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors
In-Reply-To: <c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com>
References: <20251203083319.58555-2-hariconscious@gmail.com>
	<877bv4t03x.wl-tiwai@suse.de>
	<c6694145-253b-0ee3-c0f0-4b492994bfe7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,collabora.com,uniontech.com,frantovo.cz,kernel.org,gmail.com,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: E5548336A3
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Wed, 03 Dec 2025 12:01:35 +0100,
HariKrishna Sagala wrote:
> 
> On Wed, 3 Dec 2025, Takashi Iwai wrote:
> 
> > On Wed, 03 Dec 2025 09:33:20 +0100,
> > hariconscious@gmail.com wrote:
> > >
> > > From: HariKrishna Sagala <hariconscious@gmail.com>
> > >
> > > Initialize 'status1' with a default value to resolve the static analysis
> > > smatch reported error "uninitialized symbol 'status1'".
> > > The 'status1' variable is used to create a buff using "kmemdup".
> > > So, ensure to initialize the value before it is read.
> > >
> > > Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> > > ---
> > > This patch fixes the below smatch reported errors.
> > > sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
> > > sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.
> > >
> > > The below is the flow of 'status1' it is used before initialization.
> > >
> > > snd_rme_rate_get -> status1 is uninitialized and passed
> > > 	snd_rme_get_status1 -> passed as is
> > > 		snd_rme_read_value -> passed as is
> > > 			snd_usb_ctl_msg -> created buf from status1 using kmemdup
> > > 				usb_control_msg -> sent buf for reading/writing
> > >
> > > Description of "usb_control_msg", states as
> > > " * @data: pointer to the data to send"
> > >
> > > Later from Usb control request, dst buf is copied to src buf but usb
> > > control msg request is made before initialization.
> > >
> > > Thank you.
> > >
> > >  sound/usb/mixer_quirks.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > > index 828af3095b86..06903c5de087 100644
> > > --- a/sound/usb/mixer_quirks.c
> > > +++ b/sound/usb/mixer_quirks.c
> > > @@ -2449,7 +2449,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
> > >  static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > >  			    struct snd_ctl_elem_value *ucontrol)
> > >  {
> > > -	u32 status1;
> > > +	u32 status1 = 0;
> > >  	u32 rate = 0;
> > >  	int idx;
> > >  	int err;
> > > @@ -2483,7 +2483,7 @@ static int snd_rme_rate_get(struct snd_kcontrol *kcontrol,
> > >  static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > >  				  struct snd_ctl_elem_value *ucontrol)
> > >  {
> > > -	u32 status1;
> > > +	u32 status1 = 0;
> > >  	int idx = SND_RME_CLOCK_NOLOCK;
> > >  	int err;
> > >
> > > @@ -2513,7 +2513,7 @@ static int snd_rme_sync_state_get(struct snd_kcontrol *kcontrol,
> > >  static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > >  				struct snd_ctl_elem_value *ucontrol)
> > >  {
> > > -	u32 status1;
> > > +	u32 status1 = 0;
> > >  	int err;
> > >
> > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > @@ -2526,7 +2526,7 @@ static int snd_rme_spdif_if_get(struct snd_kcontrol *kcontrol,
> > >  static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > >  				    struct snd_ctl_elem_value *ucontrol)
> > >  {
> > > -	u32 status1;
> > > +	u32 status1 = 0;
> > >  	int err;
> > >
> > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > > @@ -2539,7 +2539,7 @@ static int snd_rme_spdif_format_get(struct snd_kcontrol *kcontrol,
> > >  static int snd_rme_sync_source_get(struct snd_kcontrol *kcontrol,
> > >  				   struct snd_ctl_elem_value *ucontrol)
> > >  {
> > > -	u32 status1;
> > > +	u32 status1 = 0;
> > >  	int err;
> > >
> > >  	err = snd_rme_get_status1(kcontrol, &status1);
> > >
> >
> > The warning itself is rather dubious.  But it'd certainly give a safer
> > feeling to cover the uninitialized variables, so it would still make
> > some sense.
> >
> > But, the code change can be improved.  e.g. initialize the value in
> > the callee side, instead of callers; then it'll reduce all changes to
> > a one-liner.
> >
> > At the next time, please look at the patterns you changed more closely
> > and think again whether it's the best change or not before submission.
> > On the second look, often you see things from a different perspective
> > :)
> >
> >
> > thanks,
> >
> > Takashi
> >
> 
> Hi Takashi,
> 
> Thank you for the feedback and complement.
> Yes, will check the pattern and avoid this going forward.
> As all the functions call "snd_rme_get_status1",
> initialized here but smatch didn't silence them.
> 
> I prefer initializing a variable in caller side as it owns
> and aware of initialized value sent.
> 
> Sorry, if I had misunderstood your suggestion.

Well, you seem driven too much by smatch.  Just look at your patch
again.

You're repeating the same initializations and passing to the same
function.  And those are the only callers of snd_rme_get_status1(). 
So, instead of initializing in the caller side, initialize the value
in snd_rme_get_status1().  Then the whole your changes will be
oneliner like below.


Takashi

--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2548,6 +2548,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
 	CLASS(snd_usb_lock, pm)(chip);
 	if (pm.err < 0)
 		return pm.err;
+	*status1 = 0;
 	return snd_rme_read_value(chip, SND_RME_GET_STATUS1, status1);
 }
 
