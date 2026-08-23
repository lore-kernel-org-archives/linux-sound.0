Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09361EFFA1;
	Sun, 23 Aug 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475939; cv=none; b=CKcMHd1xnY4mdklhdrfufJvCnPS+D09/cx3MUEVJrRHpHyHsUZ7DZXRethp831svVQjnptFFW7UtrEHlGwp/+c9lAfvT+PJl83gznBMoTqF43O9PJ0KgfPeoRvJG+xD8TJ4Nj+WmI0EO+omNp0jB0Lyt++AS8h0O21nCAqnwwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475939; c=relaxed/simple;
	bh=vsOcWEDvBgqt5lfrFV7XRFBvbpZz5egUudZakx668Ek=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqhXOj5aD0cCKSwTwrtmcmAM8UpGIPsldz9EmEWR3gaOHHqGmy+pS7ELWYta94mmzpCzhrIfse1IgfYJxAFSodPhYyUSxnp2wNo2qrpJzi/1pgNSy772PyBvSrQOlkVHFatnvNCaolWGilgQBz7tpXm3mpjj63vKl/k0TrvafDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i+uMHBfD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HlYJYgnV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MTBzPCvq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yfh5Zkp0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i+uMHBfD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HlYJYgnV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MTBzPCvq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yfh5Zkp0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70A7E8619C;
	Sun, 23 Aug 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4GWY9Wa5dx6+MAzuEtiXiV6w97+eD8mWFQzQFS6ooA=;
	b=i+uMHBfDSlfs0hROeqtzWz93glpFToZduKZNz/wyHdR4eK5c0pSzc5CbGJAw5WU2qMYqxw
	Y98x9wE1FcsNjl53U7pYtDu8HQo+gT57zKiTx0Y/bKpECJST85OcGz6m7MWhbJ9dt7NFEU
	MFVcCTOPwFPrUAvyzffYxToiYEE19SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4GWY9Wa5dx6+MAzuEtiXiV6w97+eD8mWFQzQFS6ooA=;
	b=HlYJYgnVUIa75QeIQMenSEC1fdMYDwEJEJMifQPV27CrcIUt6yu9wVPrDxDr5DT/Q1rxUO
	acIKAfQirbIQ3wCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4GWY9Wa5dx6+MAzuEtiXiV6w97+eD8mWFQzQFS6ooA=;
	b=MTBzPCvquvXsEztJQe8tc4iKykzkLFj+C1fEPX52Yq72GsrSiJ4qGr/38TMIg/FCG4kWNh
	9C8slh/4MVB3OzvwEszIf/ahME26u0fPtt4n8ZG8XvFUCDaHOcoWHkpA3L+xqr5G2aF2ea
	7HdXGBkR1tLDjyOIh4iDZOwY+5KjhKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4GWY9Wa5dx6+MAzuEtiXiV6w97+eD8mWFQzQFS6ooA=;
	b=Yfh5Zkp0uf5oH3TV5ZdjAXT7h/csNwvCgfSxif/xVQe4fjOpFP7FSLBduEt6H2YqA9sxVN
	2XIca9GqB9Xfm8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44E3013332;
	Sun, 23 Aug 2026 09:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d6x6D9e3imqzDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 09:05:27 +0000
Date: Sun, 23 Aug 2026 11:05:26 +0200
Message-ID: <87fr05w6jt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Neil Andrews <neil@androos.io>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add iD14 MkI to monitor-mix volume quirk
In-Reply-To: <20260823015353.686080-1-mrwillporter@gmail.com>
References: <20260823015353.686080-1-mrwillporter@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 23 Aug 2026 03:53:53 +0200,
Will Porter wrote:
> 
> Add the iD14 MkI USB ID to the existing audient_id14_map. This
> names feature unit 12 Monitor Mix Playback Volume.
> 
> Live meter A/B testing on MkI USB ID 2708:0002 reproduced the same
> asymmetric attenuation seen on MkII. At ALSA value 104, the right
> channel was 23.07 dB below the left. At 127, both channels were equal.
> 
> The misleading Speaker Playback Volume name causes PipeWire to adopt
> FU12 as the stream master. Reuse the existing map to keep the control
> available while preventing that selection.
> 
> Hardware-tested on Bazzite 7.2.0-ogc4.1.fc44.x86_64 with this change
> backported. ALSA exposed Monitor Mix Playback Volume after module load
> and USB reconnect. PipeWire volume changes from 100% to 35% and back
> left all four FU12 values at 127. Channel-isolated left/right playback
> remained balanced after reconnect.
> 
> Build-tested with CONFIG_SND_USB_AUDIO=m using the focused sound/usb
> target.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Will Porter <mrwillporter@gmail.com>

Applied now.  Thanks.


Takashi
