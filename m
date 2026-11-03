Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691881;
	b=3IaAi1J/2vuRREfiiaea3HpzOvA0SiWKIKLaRMJC14uj8p6wwHsb2V2rOGmIAnoCmrYG
	 czFcP8BmO64thQkqmYOFlSz06agmajYxeZrbmbtbhlutPHeRI4et3FFV6AFLsOCynwz1C
	 jh6qIGYr9QZ/clvpsDCSUtTdL2pLifc2Ld1DHHycJyybE/F4HC1PIdxceM9GtoCOr8AK5
	 gS0jcdwxXYBnH77cY0lQ/OnR3pt/cJ7YRPw1gIFYPeMfmdPuyfs8jUetg/8AecALOJ+ZV
	 Dx/V8fTeqEVlNXnb7dySA8wZTwHskOncEv70it8RG9ioZ8OJaLwtHBJY5kLxNEv2DIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691881;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=I4rnc0MrED3dJqv3cesE4ZCBRNeo7kH0Pr29AAl4OT0=;
	b=YK2H6iSCtja+LeSAJdgX/twd81S8lGX0YBzhSnbeuO3xKnxtLUSmvtdV2QG5CuY92NpZ
	 zIuyAjbX8LblfeAfX2CMA0ERSHMZYuud6rsf6Kw2uq0Ca8pi2AfEM96ZLtTaZ7BfsBQ0A
	 kGLLIKo9S3EaJBZveryz8kt1ae1fV4YubCLOnQ9m3j/8N9Sr8dXflnPm3wIAItyN/opxD
	 plBBljVCWLiP7/eBOHYMYLDRaCZspG8zypvnuspRi565lBw81fbY1T9fmMc2bSgjVwBHF
	 PoPCPLh8Oxn3PduguwF+6p+1/MW6dIuagvUJwrrKdvH/EW7OZWjjQ9ETi4ALxA7pRBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U3F9Ri+f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kLVZ4wM0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U3F9Ri+f;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kLVZ4wM0;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702C606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8702C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U3F9Ri+f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kLVZ4wM0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U3F9Ri+f;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kLVZ4wM0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 955C02201A;
	Tue,  3 Nov 2026 07:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793691878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4rnc0MrED3dJqv3cesE4ZCBRNeo7kH0Pr29AAl4OT0=;
	b=U3F9Ri+fuhrCCVY/Iuw+7yLPxm6BDrrnhThFHCzrTSFe1dO8kJFcZsKEFI8HToafUmzPPJ
	kWV+nRaWtheVdWMe8btMrRenxZ7rDH8pVtSZ4NAyWLD2oDBOmqxPmh4/s6pg7nDaQMQovS
	4L4/a95WLqVrZtJ8jbys6FB7QvL9vPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793691878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4rnc0MrED3dJqv3cesE4ZCBRNeo7kH0Pr29AAl4OT0=;
	b=kLVZ4wM0gkg+gFYo0zSo/np2aYadkvHBtEIYgBTToUFow6LjTcM3X3KALp6fXpicMttqVO
	AKaD+R+1z9Lh4HAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U3F9Ri+f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kLVZ4wM0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793691878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4rnc0MrED3dJqv3cesE4ZCBRNeo7kH0Pr29AAl4OT0=;
	b=U3F9Ri+fuhrCCVY/Iuw+7yLPxm6BDrrnhThFHCzrTSFe1dO8kJFcZsKEFI8HToafUmzPPJ
	kWV+nRaWtheVdWMe8btMrRenxZ7rDH8pVtSZ4NAyWLD2oDBOmqxPmh4/s6pg7nDaQMQovS
	4L4/a95WLqVrZtJ8jbys6FB7QvL9vPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793691878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4rnc0MrED3dJqv3cesE4ZCBRNeo7kH0Pr29AAl4OT0=;
	b=kLVZ4wM0gkg+gFYo0zSo/np2aYadkvHBtEIYgBTToUFow6LjTcM3X3KALp6fXpicMttqVO
	AKaD+R+1z9Lh4HAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D165134B8;
	Tue,  3 Nov 2026 07:44:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xtyNAeaQ6Wr0WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 07:44:38 +0000
Date: Tue, 03 Nov 2026 08:44:37 +0100
Message-ID: <874idy2wbe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	zzzccc427@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>,
	Damien Stewart <hypexed@yahoo.com.au>,
	Christian Zigotzky <info@xenosoft.de>
Subject: Re: Void PPC: PulseAudio issue with sound updates 7.4-rc1
In-Reply-To: <DFCEA32C-0340-46B0-BADF-839E8C675FE9@xenosoft.de>
References: <87mrrspo7n.wl-tiwai@suse.de>
	<DFCEA32C-0340-46B0-BADF-839E8C675FE9@xenosoft.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 955C02201A
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xtra.co.nz,yahoo.com.au];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,vger.kernel.org,lists.ozlabs.org,xtra.co.nz,yahoo.com.au,xenosoft.de];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Tue, 03 Nov 2026 08:34:52 +0100,
Christian Zigotzky wrote:
> 
> On 01 November 2026 at 04:26 pm, Takashi Iwai <tiwai@suse.de> wrote:
> 
> Hm, could you verify whether the below oneliner recovers from your
> problem or not?
> 
> -- 8< --
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -965,7 +965,8 @@ static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
>    if (IS_ERR(params))
>        return PTR_ERR(params);
> 
> -    err = snd_pcm_hw_refine_with_lock(substream, params);
> +    //err = snd_pcm_hw_refine_with_lock(substream, params);
> +    err = snd_pcm_hw_refine(substream, params);
>    if (err < 0)
>        return err;
> 
> -- 8< --
> 
> If this works, clear this change again, and figure out which check in
> snd_pcm_hw_refine_with_lock() gives the error.  The function has three
> preliminary checks: PCM_RUNTIME_CHECK(), snd_pcm_buffer_access_lock()
> (& unlock()), and hw_parms_state_check.  The first one must be
> harmless, and the real problem must be either
> snd_pcm_buffer_access_lock() or hw_params_state_check().
> 
> ```
> static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
>                       struct snd_pcm_hw_params *params)
> {
>    struct snd_pcm_runtime *runtime;
>    int err;
> 
>    if (PCM_RUNTIME_CHECK(substream))
>        return -ENXIO;
>    runtime = substream->runtime;
>    err = snd_pcm_buffer_access_lock(runtime);
>    if (err < 0)
>        return err;
>    err = hw_params_state_check(substream);
>    if (err)
>        goto unlock;
> 
>    err = snd_pcm_hw_refine(substream, params);
> 
> unlock:
>    snd_pcm_buffer_access_unlock(runtime);
>    return err;
> }
> ```
> 
> OTOH, if the oneliner above doesn't change the behavior, something
> else overlooked obviously.
> 
> Oh wait, it might be the 32bit compat path?  If so, the call at
> snd_pcm_ioctl_hw_params_compat() needs to be tested, instead.
> 
> 
> thanks,
> 
> Takashi
> 
> 
> - - -
> 
> Hi Takashi,
> 
> Thank you for your patch.
> 
> I tested your patch today but unfortunately it doesn¢t solve the issue with PulseAudio on Void PPC.

Have you tried changing the call of snd_pcm_hw_refine_with_lock() in
snd_pcm_ioctl_hw_params_compat(), too?  Or check the call in
snd_pcm_hw_refine_old_user(), too.

If it doesn't change even if you replace all callers of
snd_pcm_hw_refine_with_lock() with snd_pcm_hw_refine(), something
wrong in the test itself.


Takashi
