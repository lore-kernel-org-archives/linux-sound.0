Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643B19DF8B
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485707; cv=none; b=FlhbAn93XnkXztRXH1ewgmGUg7M9aWRXnx8n3aax3t45lrCF5DSmj8wEFAkKC3EudrLbeTTkK0F3R+vRSHZfQThWBDsNG6UarMTp3Fk72MuYUQYqo1FFVgSOJhn2UViiO2ItlBEOmn+zIlZFhl14YmmrIhdbVogSRQRVuHUHg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485707; c=relaxed/simple;
	bh=0OEFqs6fWSD7qHTYYgdpJKBrdVJOKeD+Lj5mP6rX/W8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfL+Sh2sBxIbU/+6RtUcsdFG016WjXAqaAlSAAya5XaW96FwB8NCmRoCsvr7w09xGbf2KK06NhqJ5cMlTWUtYjzY+DTOm+YndwgNySpbK592yUq2zgho7h68tlQ469DKwSdzm5ubMvy4/KnvixniSdi81CVl77dTlELI1FCeNE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SYY3Wnol; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=odXKYY69; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SYY3Wnol; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=odXKYY69; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SYY3Wnol";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="odXKYY69";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SYY3Wnol";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="odXKYY69"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6872221F82;
	Wed,  9 Oct 2024 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728485703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+Fvml21IOqjXcgfv9i66edNj5h3ZX0gcbiIxHN86tU=;
	b=SYY3Wnol9xqd8HHp7q3w+to3+OLc4R5V3+4bSvMhwgOtEMz74dTjcptq13vsnJgQ1RdolV
	IXqQAAAWRQ1VmKVM2+nWLYBwYm2YpDngW3m8FJ+dtYMU9aHLSDvCJTSTZqH8nPr1xUZrg9
	gsSDS1as6md6O6hvRXP+LtoSvobUWAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728485703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+Fvml21IOqjXcgfv9i66edNj5h3ZX0gcbiIxHN86tU=;
	b=odXKYY69VQsUWbaRWe4JNHpVHpGo85NDoGLS2L25IN14TEKRwxAi+ei+1X1obX2cV5XK8Q
	zFm4ZWu2+dZBiYCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728485703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+Fvml21IOqjXcgfv9i66edNj5h3ZX0gcbiIxHN86tU=;
	b=SYY3Wnol9xqd8HHp7q3w+to3+OLc4R5V3+4bSvMhwgOtEMz74dTjcptq13vsnJgQ1RdolV
	IXqQAAAWRQ1VmKVM2+nWLYBwYm2YpDngW3m8FJ+dtYMU9aHLSDvCJTSTZqH8nPr1xUZrg9
	gsSDS1as6md6O6hvRXP+LtoSvobUWAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728485703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+Fvml21IOqjXcgfv9i66edNj5h3ZX0gcbiIxHN86tU=;
	b=odXKYY69VQsUWbaRWe4JNHpVHpGo85NDoGLS2L25IN14TEKRwxAi+ei+1X1obX2cV5XK8Q
	zFm4ZWu2+dZBiYCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 351A4136BA;
	Wed,  9 Oct 2024 14:55:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DHvSC0eZBmcDTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Oct 2024 14:55:03 +0000
Date: Wed, 09 Oct 2024 16:55:58 +0200
Message-ID: <878quxtjep.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH 1/2] ALSA: hda: tas2781: Fix missing setup at runtime PM
In-Reply-To: <e104300e8eb8f069768a705cb4b05a9a479850a0.camel@irl.hu>
References: <20241008122658.9549-1-tiwai@suse.de>
	<e104300e8eb8f069768a705cb4b05a9a479850a0.camel@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Flag: NO
X-Spam-Level: 

aOn Wed, 09 Oct 2024 16:32:52 +0200,
Gergo Koteles wrote:
> 
> Hi Takashi,
> 
> On Tue, 2024-10-08 at 14:26 +0200, Takashi Iwai wrote:
> > tas2781_runtime_suspend() clears the playback_started flag, hence it
> > leads to inconsistent state after runtime suspend is triggered, as if
> > the device hasn't been opened yet.  Also, the counterpart,
> > alc2781_runtime_resume() doesn't call tasdevice_tuning_switch(), and
> > this also causes the inconsistency.
> > 
> > This patch corrects the superfluous flag clearance and the missing
> > call.
> > 
> > Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1230132
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/pci/hda/tas2781_hda_i2c.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> > index 370d847517f9..6d173b721fd0 100644
> > --- a/sound/pci/hda/tas2781_hda_i2c.c
> > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > @@ -864,10 +864,8 @@ static int tas2781_runtime_suspend(struct device *dev)
> >  	/* The driver powers up the amplifiers at module load time.
> >  	 * Stop the playback if it's unused.
> >  	 */
> > -	if (tas_hda->priv->playback_started) {
> > +	if (tas_hda->priv->playback_started)
> >  		tasdevice_tuning_switch(tas_hda->priv, 1);
> > -		tas_hda->priv->playback_started = false;
> > -	}
> >  
> 
> This if-branch were added because I wanted to power up the amplifier at
> module load time in tasdev_fw_ready() with:
> 
>  tasdevice_tuning_switch(tas_hda->priv, 0);
>  tas_hda->priv->playback_started = true;
> 
> but I didn't want it to stay powered forever, if there aren't any 
> tas2781_hda_playback_hook() call with HDA_GEN_PCM_ACT_CLOSE action.
> 
> This seemed like a good idea at the time because the music didn't have
> to be restarted (for HDA_GEN_PCM_ACT_OPEN action) when the module was
> reloaded. But this is a rare use case, today I don't think it's
> important to have it in there.
> 
> In general cases, tas2781_hda_playback_hook() turns the amplifier on
> and off, and sets the playback_started flag.
> If I understand correctly, the playback_started will be off at the time
> of runtime_suspend()/runtime_resume() calls.
> 
> So I think the mentioned two lines from the tasdev_fw_ready() function
> and the mentioned if-branch can be deleted.

Ah, right, there is a tweak of runtime PM there, which makes harder to
track the state change...
Can we just drop the amp in tasdev_fw_ready()?  Then the whole runtime
suspend can be dropped.  And, the conditional amp off/on can be moved
again back to the system suspend/resume.  That makes less confusing.

In anyway, it seems that my patches aren't really correct.  Let's
discard them at first.


thanks,

Takashi
