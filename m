Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9A23A9B3
	for <linux-sound@vger.kernel.org>; Sat, 28 Feb 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267589; cv=none; b=Xcgu6vyTGsjSndHuMYfVl/rxngrm4Tdsk47FvOO8tLp2ruMV+OesvkDutHpzHC/BCdgi8fB+FW9OdykwfVq1pDygABbzmXZltWLCXlpOsowZJ7WsbJAndpnyDz+P+F5MNjIS4OT9mlexwCZHx5ugawGm/HMspM0rwx+Jooddvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267589; c=relaxed/simple;
	bh=IwRUCLICBnHWUuwNPSth0CqMuDhhwTIwQIi2L6hd76g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JhkPBHQ6FddQEY8QggH7fa5GOSIUZ0wCPTjbQmZCkB+ZSvp/grB1fDAYzY/f6vSkjXCAtnvpO+Pi88Wx0nmS2AJt4f6MmHKcF1vxessPSeCKecMkSsGWxoSaxQJgg1njXfeHxFVOInFqwKQlJq2/rV5RzIu6kZjDy2pGpXnUqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X9iY//Eo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P5iz115x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X9iY//Eo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P5iz115x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X9iY//Eo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P5iz115x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X9iY//Eo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P5iz115x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 315BB5BCF4;
	Sat, 28 Feb 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/uSCn8EZJzA4TAe9KM6aCgikEuBl34LLR2qHH4EHR8=;
	b=X9iY//EoOSKHSIpCqAqjwXlkrfBV93G75nZkBncABaPrbwlJXIYX9PWyJAtHpoldnT7Q1h
	IxVOQxaVvDyQIG3aTHQ/yJC+q3tld2YYLybrze157RUPxaGUv2pl3e51iAv1V8gh1LgR3/
	sEkrm6SDZGkdiK4RYZ3yv1snexkprOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/uSCn8EZJzA4TAe9KM6aCgikEuBl34LLR2qHH4EHR8=;
	b=P5iz115xpAGdrSgaz/GPAWswJAdmfRi9WSsGMiou3T4/w1fT1rrFmAgTry0GexXlUqGEVD
	cgW2c+pFK3js4GAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/uSCn8EZJzA4TAe9KM6aCgikEuBl34LLR2qHH4EHR8=;
	b=X9iY//EoOSKHSIpCqAqjwXlkrfBV93G75nZkBncABaPrbwlJXIYX9PWyJAtHpoldnT7Q1h
	IxVOQxaVvDyQIG3aTHQ/yJC+q3tld2YYLybrze157RUPxaGUv2pl3e51iAv1V8gh1LgR3/
	sEkrm6SDZGkdiK4RYZ3yv1snexkprOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/uSCn8EZJzA4TAe9KM6aCgikEuBl34LLR2qHH4EHR8=;
	b=P5iz115xpAGdrSgaz/GPAWswJAdmfRi9WSsGMiou3T4/w1fT1rrFmAgTry0GexXlUqGEVD
	cgW2c+pFK3js4GAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECBC73EA65;
	Sat, 28 Feb 2026 08:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 115WN0GoomkSTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Feb 2026 08:33:05 +0000
Date: Sat, 28 Feb 2026 09:33:05 +0100
Message-ID: <87bjh96zem.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v7] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <20260224205619.584795-1-cezary.rojewski@intel.com>
References: <20260224205619.584795-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.17)[-0.863];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.27
X-Spam-Level: 

On Tue, 24 Feb 2026 21:56:19 +0100,
Cezary Rojewski wrote:
> 
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
> 
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Due to large size of struct snd_ctl_elem_value, 'value_buf' is provided
> as a reusable buffer for kctl->put() verification. This prevents
> exhausting the stack when verifying the operation.
> 
> From user perspective, patch introduces a new trace/events category
> 'snd_ctl' containing a single 'snd_ctl_put' event type. Log sample:
> 
>   amixer-1086    [003] .....    8.035939: snd_ctl_put: success: expected=0, actual=0 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>   amixer-1087    [003] .....    8.938721: snd_ctl_put: success: expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>   amixer-1088    [003] .....    9.631470: snd_ctl_put: success: expected=1, actual=1 for ctl numid=1, iface=MIXER, name='Master Playback Volume', index=0, device=0, subdevice=0, card=0
>   amixer-1089    [000] .....    9.636786: snd_ctl_put: fail: expected=1, actual=0 for ctl numid=5, iface=MIXER, name='Loopback Mute', index=0, device=0, subdevice=0, card=0
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Applied to for-next branch now.  Thanks.


Takashi
