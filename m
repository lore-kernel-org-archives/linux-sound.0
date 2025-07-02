Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8270810
	for <linux-sound@vger.kernel.org>; Wed,  2 Jul 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466436; cv=none; b=uUZkbA0aSlwt/Vpz88B/QDBnWX+0Qiz2kWUxQKru2a965IqI5KO19fXhM5rEpXbaIfIehWlU3zl2C0xrhOAIcbwrjbSnvxVEgpKNscGUNN9UB+ajD5q2Clk/4GcMebT+wlXESl7lKNiQIgaNVFeKSV8KsKhjwn+DNdf9KRvzEhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466436; c=relaxed/simple;
	bh=nZLppcfa80TXZcd+/fgAIA1G9nKf1YgAhrykhQ1De8s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQUtZVvQdZls1azkao8KHoDdmDEJ/njUEa/1bd/oUmHnPVcrBF/v94MvqxcjbwFOU8bON/cJWzKSSkqt4ElhMcZQ61Sbj2vdcqPCzrH2R1lzFtMuyasWn4rQ6d+j7A01JyjyBBJxh6pcrXLGRNuyUUCiSifgIk0VTcgcceW4xRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uir5kiWQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PkTnkMdV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WDyEW+yg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KGb4TWHu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uir5kiWQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PkTnkMdV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WDyEW+yg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KGb4TWHu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B54BD21191;
	Wed,  2 Jul 2025 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zWcqR4Tz/0u2hoA6Atwb2r1pNk6oCZOGFi3VQevMeyk=;
	b=Uir5kiWQqIydgU7Ud6ecveFid90a6XlMfgNQSomBsykVQxgB9dVpa8YT/GUm8B0zRKoXKb
	I8xrYFUtIXPV5H49IR2A9QRBN3+DqvaDHyW/EK8JscQ/AlzxhRV7OQAqpE9PsUzkKrAtEG
	ZAkRUTvtxVmEHy+OOhfcIoXrrcG9Uck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zWcqR4Tz/0u2hoA6Atwb2r1pNk6oCZOGFi3VQevMeyk=;
	b=PkTnkMdVwCJXe38KdRpPMQuVmloNCJ8sfj/zhQ24wNq6pzkhnbnpx/bV8x3WIZod93/Z6A
	s7x8f0hpiQqL3IDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WDyEW+yg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KGb4TWHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zWcqR4Tz/0u2hoA6Atwb2r1pNk6oCZOGFi3VQevMeyk=;
	b=WDyEW+ygau4YTcMv3oqEQREvUxdKckkMZQqXEQ0Gdo5nDGcITyw/1GazoTe19E2t8iOrTe
	rby/a+cGMEkg0WtN0pVflqUcUGjBdlsisSXEm7zBzYUDWO6nX+soZJLD/LeN+GEljCVFK7
	Uaso2ikIr4XnYyVz5uiWtuIWrjwc/Rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zWcqR4Tz/0u2hoA6Atwb2r1pNk6oCZOGFi3VQevMeyk=;
	b=KGb4TWHudWAIMyZdBjJj35Vvs0L2iuZQK51u6CgYuxLTIxW3zY7tY3nAtjL3yghFQ0MrQb
	UmBA0E48wDMJ4KDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C7B913A54;
	Wed,  2 Jul 2025 14:27:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tM86Hb5BZWgtRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Jul 2025 14:27:10 +0000
Date: Wed, 02 Jul 2025 16:27:10 +0200
Message-ID: <87pleivfb5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Kailang <kailang@realtek.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com"
	<chris.chiu@canonical.com>,
	Geans_chen <geans_chen@realsil.com.cn>
Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on alc256
In-Reply-To: <SEYPR06MB627805243BFA48D81FD58B158240A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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
	<87cyake9w0.wl-tiwai@suse.de>
	<SEYPR06MB6278B60285176A9B98ECB65F8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<877c0se7iu.wl-tiwai@suse.de>
	<SEYPR06MB6278B9C65FA98E18C87EDC1A8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<874ivwe75h.wl-tiwai@suse.de>
	<SEYPR06MB62781EDBF735E177B909053B8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87y0t8clx2.wl-tiwai@suse.de>
	<SEYPR06MB6278A4E87874B8B894A1DAD48241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87tt3w6stw.wl-tiwai@suse.de>
	<SEYPR06MB627805243BFA48D81FD58B158240A@SEYPR06MB6278.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realsil.com.cn:email,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B54BD21191
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Wed, 02 Jul 2025 03:59:54 +0200,
Joakim  Zhang wrote:
> 
> 
> Hello,
> 
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Tuesday, July 1, 2025 5:15 PM
> > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > > > failed on
> > > > alc256
> > > >
> > > > EXTERNAL EMAIL
> > > >
> > > > CAUTION: Suspicious Email from unusual domain.
> > > >
> > > > On Tue, 01 Jul 2025 10:40:51 +0200,
> > > > Joakim  Zhang wrote:
> > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > > > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang
> > > > > > > > <kailang@realtek.com>; perex@perex.cz; tiwai@suse.com;
> > > > > > > > linux-sound@vger.kernel.org; chris.chiu@canonical.com;
> > > > > > > > Geans_chen <geans_chen@realsil.com.cn>
> > > > > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack
> > > > > > > > detect failed on
> > > > > > > > alc256
> > > > > > > >
> > > > > > > > EXTERNAL EMAIL
> > > > > > > >
> > > > > > > > CAUTION: Suspicious Email from unusual domain.
> > > > > > > >
> > > > > > > > On Tue, 01 Jul 2025 08:35:05 +0200, Joakim  Zhang wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hello Takashi,
> > > > > > > > >
> > > > > > > > > Thanks a lot for your help.
> > > > > > > > >
> > > > > > > > > > > Hello Kailang,
> > > > > > > > > > >
> > > > > > > > > > > I'd like to insert another question through this. That
> > > > > > > > > > > would be appreciated if
> > > > > > > > > > you could have a look.
> > > > > > > > > > >
> > > > > > > > > > > After system boot, we can see the default mixer status as
> > below:
> > > > > > > > > > >
> > > > > > > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > > > > > > numid=14,iface=CARD,name='Headphone Jack'
> > > > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > > > >   : values=on
> > > > > > > > > > > numid=12,iface=CARD,name='Internal Mic Phantom Jack'
> > > > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > > > >   : values=on
> > > > > > > > > > > numid=13,iface=CARD,name='Mic Jack'
> > > > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > > > >   : values=on
> > > > > > > > > > > numid=15,iface=CARD,name='Speaker Phantom Jack'
> > > > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > > > >   : values=on
> > > > > > > > > > > numid=11,iface=MIXER,name='Master Playback Switch'
> > > > > > > > > > >   ; type=BOOLEAN,access=rw------,values=1
> > > > > > > > > > >   : values=on
> > > > > > > > > > > numid=10,iface=MIXER,name='Master Playback Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=1,min=0,max=87,step=0
> > > > > > > > > > >   : values=60
> > > > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > > > numid=2,iface=MIXER,name='Headphone Playback Switch'
> > > > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > > > >   : values=on,on
> > > > > > > > > > > numid=1,iface=MIXER,name='Headphone Playback Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=2,min=0,max=87,step=0
> > > > > > > > > > >   : values=87,87
> > > > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > > > numid=9,iface=MIXER,name='Mic Boost Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=2,min=0,max=3,step=0
> > > > > > > > > > >   : values=0,0
> > > > > > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > > > > > > numid=7,iface=MIXER,name='Capture Switch'
> > > > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > > > >   : values=on,on
> > > > > > > > > > > numid=6,iface=MIXER,name='Capture Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=2,min=0,max=63,step=0
> > > > > > > > > > >   : values=39,39
> > > > > > > > > > >   | dBscale-min=-17.25dB,step=0.75dB,mute=0
> > > > > > > > > > > numid=5,iface=MIXER,name='Auto-Mute Mode'
> > > > > > > > > > >   ; type=ENUMERATED,access=rw------,values=1,items=2
> > > > > > > > > > >   ; Item #0 'Disabled'
> > > > > > > > > > >   ; Item #1 'Enabled'
> > > > > > > > > > >   : values=1
> > > > > > > > > > > numid=8,iface=MIXER,name='Internal Mic Boost Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=2,min=0,max=3,step=0
> > > > > > > > > > >   : values=0,0
> > > > > > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > > > > > > numid=4,iface=MIXER,name='Speaker Playback Switch'
> > > > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > > > >   : values=off,off
> > > > > > > > > > > numid=3,iface=MIXER,name='Speaker Playback Volume'
> > > > > > > > > > >   ; type=INTEGER,access=rw---R--
> > ,values=2,min=0,max=87,step=0
> > > > > > > > > > >   : values=0,0
> > > > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > > > numid=17,iface=PCM,name='Capture Channel Map'
> > > > > > > > > > >   ; type=INTEGER,access=r----R--
> > ,values=2,min=0,max=36,step=0
> > > > > > > > > > >   : values=0,0
> > > > > > > > > > >   | container
> > > > > > > > > > >     | chmap-fixed=FL,FR
> > > > > > > > > > > numid=16,iface=PCM,name='Playback Channel Map'
> > > > > > > > > > >   ; type=INTEGER,access=r----R--
> > ,values=2,min=0,max=36,step=0
> > > > > > > > > > >   : values=0,0
> > > > > > > > > > >   | container
> > > > > > > > > > >     | chmap-fixed=FL,FR
> > > > > > > > > > >
> > > > > > > > > > > It can auto switch 'Headphone Playback
> > > > > > > > > > > Switch'/'Headphone Playback Volume' and 'Speaker
> > > > > > > > > > > Playback Switch'/'Speaker Playback Volume', when I
> > > > > > > > > > > plugin the headset or not, but I have not found the
> > > > > > > > > > > related logic, could you
> > > > > > > > > > please help clarify a bit?
> > > > > > > > > >
> > > > > > > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is
> > > > > > > > > > muted automatically when the headphone/headset jack is
> > > > > > > > > > plugged by the kernel
> > > > > > > > driver itself.
> > > > > > > > >
> > > > > > > > > What strange is 'Auto-Mute Mode' would be disabled after
> > > > > > > > > headset
> > > > > > > > plugin/out several times, don' t know the reason....
> > > > > > > >
> > > > > > > > "Auto-Mute Mode" is a software switch, and it means some
> > > > > > > > program must have turned it off explicitly.  e.g. the sound
> > > > > > > > server like pulseaudio or pipewire disables it.
> > > > > > > >
> > > > > > > > > However, it seems that speaker and headphone/headset still
> > > > > > > > > can auto
> > > > > > > > switch. Please see below mixer status.
> > > > > > > >
> > > > > > > > Usually pulseaudio/pipewire takes over and does the switching.
> > > > > > >
> > > > > > > OK, I see, I will dig into it, could you please tell me is
> > > > > > > there any other software
> > > > > > switches in the mixers?
> > > > > >
> > > > > > Any mixer program can change...  But basically the auto-mute is
> > > > > > a task of the sound daemon.
> > > > >
> > > > > I disable both pulseaudio and pipewire from the Debian, and enable
> > > > > the
> > > > auto-mute, when the headset plugin but the switch not set correctly.
> > > > > 'Headphone Playback Switch'/'Headphone Playback Volume' not set,
> > > > > but
> > > > 'Speaker Playback Switch'/'Speaker Playback Volume' enabled.
> > > > > Are there any other possible reasons?
> > > >
> > > > The auto-mute doesn't change the mixer state.  It switches
> > > > internally, either by adjusting the pin control or the amp.
> > >
> > > OK, is that means all mixers setting should done by users based on Jack
> > status?
> >
> > The mixer settings are exposed to user-space and user-space programs can
> > read or change them, sure.  But it's not clear what is your exact purpose or
> > goal, so I can't answer much better than that.
> >
> > The auto-mute feature is implemented in the kernel driver level, so that the
> > automatic muting via jack plug can work without the sound daemon.  The
> > auto-muted state isn't exposed to user-space via ALSA control API (mixer
> > elements), and it looks as  if it were muted by the hardware.  Actually there are
> > hardware that do the auto-muting in the hardware level, too.
> 
> Takashi, thanks for your details, I think what I want to know is what did in the kernel driver level for hp automute and mic autoswitch.
> 
> I am looking the code, it seems only update the pins and not update the mixer, right? So when the headset plugin, it will auto mute hp and auto switch to mic at the hardware level, users still need to update the mixer manually.

Users don't need to update the mixer -- that's the whole point of the
driver auto-mute stuff.  When plugged, the speaker gets muted, and the
output is routed to the headphone jack with the formerly set headphone
volume and switch.  Even if you change the speaker volume/switch, it
has no effect as long as the jack is plugged.  When unplugged, the
headphone volume/switch can change but without any effect, too.

> Further, is there any place in the hda codec driver level to update the mixers? AFAIK, for the ASoC driver, codec driver level would update some mixers dynamically based on the routing.

The codec driver creates the mixer elements and handle them, yes.
Also, the virtual-master control influences on the volume of each
assigned output, too.


Takashi
