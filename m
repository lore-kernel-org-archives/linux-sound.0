Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9C36D4E2
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769868; cv=none; b=uk7jwp2P7ZCkh7BrgsXzngU2G4ogrEIBiEKiB0hQ2RnnT2Dl6MerS2sLjeaDyLig5DLlztLv9EpaEF73JvK9qar1q+M1g+Lbxs09rC/FWTbCj91pr8a2FYRdKV4ZMve6FMzvz2aSTEi2yoF0SuVeU/kZd+YzN1x61f/B4D7bVpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769868; c=relaxed/simple;
	bh=OpEB4+b0Cv/cBn2v9wG02mISjMJq4HgDe23PS37roz4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1DU1PJqRuNA7surlIMx6tkz01R5X2uFkceESQrVuYrtzaJmEV5SjcVNqs6kapfugtAeR3G/PIjCCA1HtVBV7pxEAlB3/A7AvBsOkZAYKixbarKaLhKG1UKLZ2lx/smHSQ9kGSFZOXVYADtvvYBmnlSyhLsx/JFdx1HfmyHIll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Huzz1rts; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IwfLTnra; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rzmWKLf7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ob4NHNB0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Huzz1rts";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwfLTnra";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rzmWKLf7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ob4NHNB0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40AAE33724;
	Wed,  3 Dec 2025 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764769864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRLAcx40sVH5YBh5sypT3xpAIdJT4lRsVm/4lCsP2mg=;
	b=Huzz1rtsiUoYzkHK+v6jdTA0TktP6eJCuzq71UT+4sz9YozXJZaTxbDZ8EFyK5s7pt7v6K
	E9v5KfF/DHrY8de29xJ4i/YaIWad2UlXaal+/PwMn3IwInhSXepS/jaE1oVyHq9HRh7Uoh
	Y3eD2dJZijHCirt0BUVlMxm8xHtnkx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764769864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRLAcx40sVH5YBh5sypT3xpAIdJT4lRsVm/4lCsP2mg=;
	b=IwfLTnrauhjo6Hwqn8XSAu1VbSeGMs0hhrx8nn7+6ddpj/XYt7k/FZUsRLG+AI4FO47cR6
	H8ykZqvwgTPusGBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764769863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRLAcx40sVH5YBh5sypT3xpAIdJT4lRsVm/4lCsP2mg=;
	b=rzmWKLf771qoHWphB+E79MS7mwjqdQr1c8DllVhvs6YBhZDuKoMH12FqiGb7G3xtGQeDqY
	tmEhDUJgnwKJm1fT7XoT+FG5AxnMBQOMZjkuPcCMMAwx8/xMJ02jQgyrqg4tbQ0i1uOdc1
	dExWwjm+RDXPzIL2HW0Wkxin4w72ozE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764769863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRLAcx40sVH5YBh5sypT3xpAIdJT4lRsVm/4lCsP2mg=;
	b=ob4NHNB0BJ+60BZzJ900yfvYN83nc9PSc+P8n/4suqZ7ZwIZa/LZ14cRcrEkcC/7tZYgyy
	3LLmxFk150Hz3IDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 092633EA63;
	Wed,  3 Dec 2025 13:51:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qqoNAUdAMGkdAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Dec 2025 13:51:03 +0000
Date: Wed, 03 Dec 2025 14:51:02 +0100
Message-ID: <87pl8vsmgp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/9] ALSA: opl4: Convert to snd_seq bus probe mechanism
In-Reply-To: <gl22ngzqfqigynqtw7giz4cbyaanx4y4dwr5ltywwlq3wozk7g@oj5l34antqty>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
	<24b2d122830599b96f69fc20386f5830c758e840.1764677854.git.u.kleine-koenig@baylibre.com>
	<gl22ngzqfqigynqtw7giz4cbyaanx4y4dwr5ltywwlq3wozk7g@oj5l34antqty>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.802];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.26

On Wed, 03 Dec 2025 14:46:27 +0100,
Uwe Kleine-König wrote:
> 
> hello,
> 
> On Tue, Dec 02, 2025 at 01:35:54PM +0100, Uwe Kleine-König wrote:
> > The snd_seq bus got a dedicated probe function. Make use of that. This
> > fixes a runtime warning about the driver needing to be converted to the
> > bus probe method.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > ---
> >  sound/drivers/opl4/opl4_seq.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
> > index 7bb22089a093..043c537be293 100644
> > --- a/sound/drivers/opl4/opl4_seq.c
> > +++ b/sound/drivers/opl4/opl4_seq.c
> > @@ -118,9 +118,8 @@ static void snd_opl4_seq_free_port(void *private_data)
> >  	snd_midi_channel_free_set(opl4->chset);
> >  }
> >  
> > -static int snd_opl4_seq_probe(struct device *_dev)
> > +static int snd_opl4_seq_probe(struct snd_seq_device *dev)
> >  {
> > -	struct snd_seq_device *dev = to_seq_dev(_dev);
> >  	struct snd_opl4 *opl4;
> >  	int client;
> >  	struct snd_seq_port_callback pcallbacks;
> > @@ -175,9 +174,8 @@ static int snd_opl4_seq_probe(struct device *_dev)
> >  	return 0;
> >  }
> >  
> > -static int snd_opl4_seq_remove(struct device *_dev)
> > +static int snd_opl4_seq_remove(struct snd_seq_device *dev)
> >  {
> > -	struct snd_seq_device *dev = to_seq_dev(_dev);
> >  	struct snd_opl4 *opl4;
> >  
> >  	opl4 = *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
> 
> There is a build problem that escaped my build testing (on arm64). This
> additionally needs:
> 
> diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
> index 043c537be293..fd6f15be6109 100644
> --- a/sound/drivers/opl4/opl4_seq.c
> +++ b/sound/drivers/opl4/opl4_seq.c
> @@ -174,19 +174,18 @@ static int snd_opl4_seq_probe(struct snd_seq_device *dev)
>  	return 0;
>  }
>  
> -static int snd_opl4_seq_remove(struct snd_seq_device *dev)
> +static void snd_opl4_seq_remove(struct snd_seq_device *dev)
>  {
>  	struct snd_opl4 *opl4;
>  
>  	opl4 = *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
>  	if (!opl4)
> -		return -EINVAL;
> +		return;
>  
>  	if (opl4->seq_client >= 0) {
>  		snd_seq_delete_kernel_client(opl4->seq_client);
>  		opl4->seq_client = -1;
>  	}
> -	return 0;
>  }
>  
>  static struct snd_seq_driver opl4_seq_driver = {
> 
> I don't know if it's already applied, please tell me if you want a v2 or
> a proper patch on top of this (or if you even squash this into the
> original commit).
> 
> Sorry for the mess

Don't worry, I haven't applied them yet, so feel free to resubmit.


thanks,

Takashi
