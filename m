Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3A101EE
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349108; cv=none; b=eYrHrylbyr7S06rNN/uxuKj3jRtzB8SGtnV6icGgQwhu2AAFu8jy0BFvsQKEkotEW5piCd8Gu2d5lX02kl9Nq6fcsewvHM9njsjvgBkK/rNzglpW3I3KAP6cYtePnJye5zc5Y7zMvdyZtxDfLgkEqlNCAFbUMDY8MIyBucGS5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349108; c=relaxed/simple;
	bh=kYDLbfDrc8gdMnmSeM0qDth33UlYfXwielMprz5Pe/E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4BrlsQ7SEHDqTozWgAM/i1QoLbTK1zAf2S2Li6DIV8grM/bZxOzlvN+tAaYLGbAY7RcmpmMcnMlW0O6CqeiJ1FM8nT4043GDyAZhJlFazEJZ/Ymnq+VEYzzT12zMMqf0VuuoG74yaKFEiChxNQulGzQAliaQcL3gadK5CdBDQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=efoNTueh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pJv/of27; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=efoNTueh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pJv/of27; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="efoNTueh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pJv/of27";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="efoNTueh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pJv/of27"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82F0E1F388;
	Tue,  1 Jul 2025 05:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751349104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFHsXkQu33vqXfRc9tg0MGD+Dpn63tQ3UHypNPB0XcI=;
	b=efoNTuehf3bsE3idW6nrduqAEMai89L3sjLakuCv+kiX9o48jGYcsJTitYk85YglsrvLyA
	jSzfnmfc9YJRgNcParFJm5mHeMw8uW2BU9idUGsOTISOmmkN15J1iuM3mWHtySw1Md2pet
	3Bm8a2a7V7+iC6k8DFdmJSSt6qQb9wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751349104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFHsXkQu33vqXfRc9tg0MGD+Dpn63tQ3UHypNPB0XcI=;
	b=pJv/of27pb+wtPoo4gHI6g8sqGKZxY9Aoo1Sbb2ZnU29bUr1LIf4SnsRxpYoYslmY5xlDi
	OBtPqTcCkm8ZDqAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751349104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFHsXkQu33vqXfRc9tg0MGD+Dpn63tQ3UHypNPB0XcI=;
	b=efoNTuehf3bsE3idW6nrduqAEMai89L3sjLakuCv+kiX9o48jGYcsJTitYk85YglsrvLyA
	jSzfnmfc9YJRgNcParFJm5mHeMw8uW2BU9idUGsOTISOmmkN15J1iuM3mWHtySw1Md2pet
	3Bm8a2a7V7+iC6k8DFdmJSSt6qQb9wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751349104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFHsXkQu33vqXfRc9tg0MGD+Dpn63tQ3UHypNPB0XcI=;
	b=pJv/of27pb+wtPoo4gHI6g8sqGKZxY9Aoo1Sbb2ZnU29bUr1LIf4SnsRxpYoYslmY5xlDi
	OBtPqTcCkm8ZDqAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4680013508;
	Tue,  1 Jul 2025 05:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5OhXD3B3Y2jpZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Jul 2025 05:51:44 +0000
Date: Tue, 01 Jul 2025 07:51:43 +0200
Message-ID: <87cyake9w0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>
Cc: Kailang <kailang@realtek.com>,
	Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>,
	Geans_chen
	<geans_chen@realsil.com.cn>
Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on alc256
In-Reply-To: <SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
	<87a562wqzu.wl-tiwai@suse.de>
	<431c41bd52224eb5ac341c9c24d52af1@realtek.com>
	<SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
	<SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<5f2431ca8ef2453daa9da2034798e682@realtek.com>
	<SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
	<SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 01 Jul 2025 05:28:39 +0200,
Joakim  Zhang wrote:
> 
> 
> Hello Kailang,
> 
> I'd like to insert another question through this. That would be appreciated if you could have a look.
> 
> After system boot, we can see the default mixer status as below:
> 
> root@cix-localhost:~# amixer -c 0 contents
> numid=14,iface=CARD,name='Headphone Jack'
>   ; type=BOOLEAN,access=r-------,values=1
>   : values=on
> numid=12,iface=CARD,name='Internal Mic Phantom Jack'
>   ; type=BOOLEAN,access=r-------,values=1
>   : values=on
> numid=13,iface=CARD,name='Mic Jack'
>   ; type=BOOLEAN,access=r-------,values=1
>   : values=on
> numid=15,iface=CARD,name='Speaker Phantom Jack'
>   ; type=BOOLEAN,access=r-------,values=1
>   : values=on
> numid=11,iface=MIXER,name='Master Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=10,iface=MIXER,name='Master Playback Volume'
>   ; type=INTEGER,access=rw---R--,values=1,min=0,max=87,step=0
>   : values=60
>   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> numid=2,iface=MIXER,name='Headphone Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=on,on
> numid=1,iface=MIXER,name='Headphone Playback Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
>   : values=87,87
>   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> numid=9,iface=MIXER,name='Mic Boost Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
>   : values=0,0
>   | dBscale-min=0.00dB,step=10.00dB,mute=0
> numid=7,iface=MIXER,name='Capture Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=on,on
> numid=6,iface=MIXER,name='Capture Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
>   : values=39,39
>   | dBscale-min=-17.25dB,step=0.75dB,mute=0
> numid=5,iface=MIXER,name='Auto-Mute Mode'
>   ; type=ENUMERATED,access=rw------,values=1,items=2
>   ; Item #0 'Disabled'
>   ; Item #1 'Enabled'
>   : values=1
> numid=8,iface=MIXER,name='Internal Mic Boost Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
>   : values=0,0
>   | dBscale-min=0.00dB,step=10.00dB,mute=0
> numid=4,iface=MIXER,name='Speaker Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=off,off
> numid=3,iface=MIXER,name='Speaker Playback Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
>   : values=0,0
>   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> numid=17,iface=PCM,name='Capture Channel Map'
>   ; type=INTEGER,access=r----R--,values=2,min=0,max=36,step=0
>   : values=0,0
>   | container
>     | chmap-fixed=FL,FR
> numid=16,iface=PCM,name='Playback Channel Map'
>   ; type=INTEGER,access=r----R--,values=2,min=0,max=36,step=0
>   : values=0,0
>   | container
>     | chmap-fixed=FL,FR
> 
> It can auto switch 'Headphone Playback Switch'/'Headphone Playback Volume' and
> 'Speaker Playback Switch'/'Speaker Playback Volume', when I plugin the headset or not,
> but I have not found the related logic, could you please help clarify a bit?

Isn't it "Auto-Mute Mode"?  If it's set, the speaker is muted
automatically when the headphone/headset jack is plugged by the kernel
driver itself.


Takashi
