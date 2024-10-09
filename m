Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877451DF27C
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488618; cv=none; b=DMq0HUrWRZ8aLbUNg3kzPOVMhwAXqAfV+OFvPDZamzsu+/GGGkh2ZjUgmQFXJC1mV5AoKWRclfbdrRM2Jggb9Bi3OSBtOfGKAi+LoOkc4sfkg9O8LfeLi6a1WdxCl2TJxRqXTJIC6BTMjxBho9291Y2IOjPUZ3RehZxI082FkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488618; c=relaxed/simple;
	bh=pKFit9SNUt+T9FcjO+qQzV+AKm9t5qODTuQOvm0mjho=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovERaRXwI6jiwK/9WZxyIUhqQha3hJ+O7L8iZQFRlf03J2CXtDzQRZpXVZp8tOgYRJ5DE9CeFi+HucbsnuyYhHQ/Bt/uue2ccP0quwPODJ0qHmIz9jEoh5bLbKUI7fDAtOg+0aLASz9VbXRs7R1o6w3jU0nS/EwW39C4isjSbb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pdMaRvVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RORIgFV1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tk4nm+U3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KU4zjNes; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pdMaRvVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RORIgFV1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tk4nm+U3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KU4zjNes"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8EA721F77;
	Wed,  9 Oct 2024 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728488610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86UOysiJF4LR0yQgH8C0h+pqHUC3gJELN4uNIjFPfhQ=;
	b=pdMaRvVvggfkFPOW6noLSjjFzY2rFuy2BZVUhCUGrIKTqQ8t6OIeKRQgA5n4fxBZYSlP3a
	7K0p+3ZL5+f22yPtHZsjORUYj7sGiz4yPRr9cWRxpOlS+WqrQrJps1NRb1YV5KKSDyOQom
	LXk1j4AUQBe7s1djVogq3CK8qty8JdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728488610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86UOysiJF4LR0yQgH8C0h+pqHUC3gJELN4uNIjFPfhQ=;
	b=RORIgFV1WuDsJSrRScisfaWwNzTsO7LjLPl1/uVitr7c6ZmgueO2SP62a/szD4afBcDe2o
	6jy4AJ8ch/jdUFCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Tk4nm+U3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KU4zjNes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728488609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86UOysiJF4LR0yQgH8C0h+pqHUC3gJELN4uNIjFPfhQ=;
	b=Tk4nm+U3UrpCSVGA9jywkOq7eYZPVHvRgGt7+8BGTeBkIMsRNmy/9Rh/UcMkbWKe9Dsg8k
	o2cj+qD7QwixQwgIvl5oVxhLonzw6pS/ExHA+WB7o4oWovH/fitpg9KYCPNHFocceCoTU6
	VcAp74dyGrqTPURCvltEEvg4yJ/5F7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728488609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86UOysiJF4LR0yQgH8C0h+pqHUC3gJELN4uNIjFPfhQ=;
	b=KU4zjNesfDEKm0CJUAjIUl//q02lmXdwGQegr90s9ezG2bLGklR7HxoU+3LhKjFAXKT/sW
	SKgSPP3gRm7NaxAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9BDA13A58;
	Wed,  9 Oct 2024 15:43:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L8AmLKGkBmc0XQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Oct 2024 15:43:29 +0000
Date: Wed, 09 Oct 2024 17:44:24 +0200
Message-ID: <8734l5th5z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH 1/2] ALSA: hda: tas2781: Fix missing setup at runtime PM
In-Reply-To: <5aa8095d5fa9421100370ae039011893947af34b.camel@irl.hu>
References: <20241008122658.9549-1-tiwai@suse.de>
	<e104300e8eb8f069768a705cb4b05a9a479850a0.camel@irl.hu>
	<878quxtjep.wl-tiwai@suse.de>
	<5aa8095d5fa9421100370ae039011893947af34b.camel@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E8EA721F77
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 09 Oct 2024 17:34:48 +0200,
Gergo Koteles wrote:
> 
> On Wed, 2024-10-09 at 16:55 +0200, Takashi Iwai wrote:
> > aOn Wed, 09 Oct 2024 16:32:52 +0200,
> > Gergo Koteles wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > On Tue, 2024-10-08 at 14:26 +0200, Takashi Iwai wrote:
> > > > tas2781_runtime_suspend() clears the playback_started flag, hence it
> > > > leads to inconsistent state after runtime suspend is triggered, as if
> > > > the device hasn't been opened yet.  Also, the counterpart,
> > > > alc2781_runtime_resume() doesn't call tasdevice_tuning_switch(), and
> > > > this also causes the inconsistency.
> > > > 
> > > > This patch corrects the superfluous flag clearance and the missing
> > > > call.
> > > > 
> > > > Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> > > > Link: https://bugzilla.suse.com/show_bug.cgi?id=1230132
> > > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > > ---
> > > >  sound/pci/hda/tas2781_hda_i2c.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> > > > index 370d847517f9..6d173b721fd0 100644
> > > > --- a/sound/pci/hda/tas2781_hda_i2c.c
> > > > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > > > @@ -864,10 +864,8 @@ static int tas2781_runtime_suspend(struct device *dev)
> > > >  	/* The driver powers up the amplifiers at module load time.
> > > >  	 * Stop the playback if it's unused.
> > > >  	 */
> > > > -	if (tas_hda->priv->playback_started) {
> > > > +	if (tas_hda->priv->playback_started)
> > > >  		tasdevice_tuning_switch(tas_hda->priv, 1);
> > > > -		tas_hda->priv->playback_started = false;
> > > > -	}
> > > >  
> > > 
> > > This if-branch were added because I wanted to power up the amplifier at
> > > module load time in tasdev_fw_ready() with:
> > > 
> > >  tasdevice_tuning_switch(tas_hda->priv, 0);
> > >  tas_hda->priv->playback_started = true;
> > > 
> > > but I didn't want it to stay powered forever, if there aren't any 
> > > tas2781_hda_playback_hook() call with HDA_GEN_PCM_ACT_CLOSE action.
> > > 
> > > This seemed like a good idea at the time because the music didn't have
> > > to be restarted (for HDA_GEN_PCM_ACT_OPEN action) when the module was
> > > reloaded. But this is a rare use case, today I don't think it's
> > > important to have it in there.
> > > 
> > > In general cases, tas2781_hda_playback_hook() turns the amplifier on
> > > and off, and sets the playback_started flag.
> > > If I understand correctly, the playback_started will be off at the time
> > > of runtime_suspend()/runtime_resume() calls.
> > > 
> > > So I think the mentioned two lines from the tasdev_fw_ready() function
> > > and the mentioned if-branch can be deleted.
> > 
> > Ah, right, there is a tweak of runtime PM there, which makes harder to
> > track the state change...
> > Can we just drop the amp in tasdev_fw_ready()? 
> > 
> 
> I think, yes. I tested it with TAS2563 (Lenovo Yoga 7 14ARB7 Laptop).
> 
> > Then the whole runtime
> > suspend can be dropped.  And, the conditional amp off/on can be moved
> > again back to the system suspend/resume.  That makes less confusing.
> > 
> 
> The runtime_resume() checks whether "Speaker Program Id" kcontrol (as
> cur_prog variable) has changed with tasdevice_prmg_load() function. If
> so, updates it, so I don't think it can be dropped easily without
> moving this functionality somewhere else.

Yes, I meant to drop only runtime suspend, too.

> I'm not sure if the calibration data needs to be updated before each
> power-up or only after a program change.

That leads to another issue: it seems that the speaker program id
change doesn't influence on the behavior immediately, and it appears
only after the runtime resume.  It's a bit tricky, and better to be
documented somewhere.


Takashi
