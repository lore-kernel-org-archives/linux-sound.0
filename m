Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35097271476
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370129; cv=none; b=FgaaDG8ddKwNYZ0cUeALnj+KHX/S+qQyizIpcw7KIIcnFNA12UdbqBzexjbS83pIHd/oZgaL+koH+Klx7FblTMU9/3JQeK25NcG0YKNPQXRoALKk1rE8PHFkoxRM9wF4WVdpZLTf0hvTwfzYCtwMkuKXnEI957zjxxPhClRzA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370129; c=relaxed/simple;
	bh=xX7OIg9RmkWuXYh1EF4fZYWHZlXuODWwGaLP9KBKe9I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0MtPO1TmL3x4uzMCf8/UXhBvuGElDbeKDmktKdASb5ZA1jLIvI/qIrRjPS2oudPlZN2wdL2YcwC5NZyI/2lYBVTD18TOittOdMEjmwXpBGk+i7i0z2ro76gGuOMasqWDZuItmn1emBpDNndmU8xiGuGlCHNOvGA+MhXM6jw+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ct7gT+4q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcPkOG3t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m+1lzEgm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fTtAYke; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ct7gT+4q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcPkOG3t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m+1lzEgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fTtAYke"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 302B0210F9;
	Tue,  1 Jul 2025 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751370125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ACLkiefjQmVEXgU3gpmEev0a4Vp/1pyOmHsyRIPYfA=;
	b=Ct7gT+4q+6cvij76lsv8EnZFSNuT1GEcQzEdrFTTpyzIKVEzjqko8fEfGhJamyDfYEiVi7
	iwXqIi6OYDHTJraw1DfZo4JfWTk1f6JZp5Td7sWp2gyIbE60rggNaOk/ZcXTENCNDP9HDV
	RabjQCzXgrASTcv5DPg4r1IwfZ5/WQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751370125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ACLkiefjQmVEXgU3gpmEev0a4Vp/1pyOmHsyRIPYfA=;
	b=JcPkOG3tuSPZZxPu2DjxLAaLN8+u8L6E65HhXiGG36dqlFIJu+rlDayOsucpR99rqoalLz
	/jAOugFStAu2wuDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m+1lzEgm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7fTtAYke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751370124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ACLkiefjQmVEXgU3gpmEev0a4Vp/1pyOmHsyRIPYfA=;
	b=m+1lzEgmYkS9Zb0AI6YTEmsSmX7KWal+fp7QIK1hibd9LGJrpZSvW9TOVeUwxfl00lhtXk
	McUJATFQAEgN/pnCtU2mYueAgMX/36cqR55qlDsuvpqu727N6ZFEe9uW7cD4OGBwkD8076
	orcHRj5kj7TAdo4OnyYW/MRfXD+5Odc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751370124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ACLkiefjQmVEXgU3gpmEev0a4Vp/1pyOmHsyRIPYfA=;
	b=7fTtAYkeUXNdJPfcWRjrkVM4eW2zsIIPleLMjUUwhnKXek3xlw0Pipp+lZIxM9xe5N3OR2
	h7ENqo+wp1L9GoDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E796813890;
	Tue,  1 Jul 2025 11:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EWHMNovJY2inWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Jul 2025 11:42:03 +0000
Date: Tue, 01 Jul 2025 13:42:03 +0200
Message-ID: <87tt3w6stw.wl-tiwai@suse.de>
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
In-Reply-To: <SEYPR06MB6278A4E87874B8B894A1DAD48241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 302B0210F9
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Tue, 01 Jul 2025 12:27:52 +0200,
Joakim  Zhang wrote:
> 
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Tuesday, July 1, 2025 5:15 PM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
> > alc256
> >
> > EXTERNAL EMAIL
> >
> > CAUTION: Suspicious Email from unusual domain.
> >
> > On Tue, 01 Jul 2025 10:40:51 +0200,
> > Joakim  Zhang wrote:
> > >
> > >
> > > Hello,
> > >
> > > > > > -----Original Message-----
> > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > > > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > > > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack
> > > > > > detect failed on
> > > > > > alc256
> > > > > >
> > > > > > EXTERNAL EMAIL
> > > > > >
> > > > > > CAUTION: Suspicious Email from unusual domain.
> > > > > >
> > > > > > On Tue, 01 Jul 2025 08:35:05 +0200, Joakim  Zhang wrote:
> > > > > > >
> > > > > > >
> > > > > > > Hello Takashi,
> > > > > > >
> > > > > > > Thanks a lot for your help.
> > > > > > >
> > > > > > > > > Hello Kailang,
> > > > > > > > >
> > > > > > > > > I'd like to insert another question through this. That
> > > > > > > > > would be appreciated if
> > > > > > > > you could have a look.
> > > > > > > > >
> > > > > > > > > After system boot, we can see the default mixer status as below:
> > > > > > > > >
> > > > > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > > > > numid=14,iface=CARD,name='Headphone Jack'
> > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > >   : values=on
> > > > > > > > > numid=12,iface=CARD,name='Internal Mic Phantom Jack'
> > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > >   : values=on
> > > > > > > > > numid=13,iface=CARD,name='Mic Jack'
> > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > >   : values=on
> > > > > > > > > numid=15,iface=CARD,name='Speaker Phantom Jack'
> > > > > > > > >   ; type=BOOLEAN,access=r-------,values=1
> > > > > > > > >   : values=on
> > > > > > > > > numid=11,iface=MIXER,name='Master Playback Switch'
> > > > > > > > >   ; type=BOOLEAN,access=rw------,values=1
> > > > > > > > >   : values=on
> > > > > > > > > numid=10,iface=MIXER,name='Master Playback Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=1,min=0,max=87,step=0
> > > > > > > > >   : values=60
> > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > numid=2,iface=MIXER,name='Headphone Playback Switch'
> > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > >   : values=on,on
> > > > > > > > > numid=1,iface=MIXER,name='Headphone Playback Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
> > > > > > > > >   : values=87,87
> > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > numid=9,iface=MIXER,name='Mic Boost Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > > > > >   : values=0,0
> > > > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > > > > numid=7,iface=MIXER,name='Capture Switch'
> > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > >   : values=on,on
> > > > > > > > > numid=6,iface=MIXER,name='Capture Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
> > > > > > > > >   : values=39,39
> > > > > > > > >   | dBscale-min=-17.25dB,step=0.75dB,mute=0
> > > > > > > > > numid=5,iface=MIXER,name='Auto-Mute Mode'
> > > > > > > > >   ; type=ENUMERATED,access=rw------,values=1,items=2
> > > > > > > > >   ; Item #0 'Disabled'
> > > > > > > > >   ; Item #1 'Enabled'
> > > > > > > > >   : values=1
> > > > > > > > > numid=8,iface=MIXER,name='Internal Mic Boost Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > > > > >   : values=0,0
> > > > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > > > > numid=4,iface=MIXER,name='Speaker Playback Switch'
> > > > > > > > >   ; type=BOOLEAN,access=rw------,values=2
> > > > > > > > >   : values=off,off
> > > > > > > > > numid=3,iface=MIXER,name='Speaker Playback Volume'
> > > > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
> > > > > > > > >   : values=0,0
> > > > > > > > >   | dBscale-min=-65.25dB,step=0.75dB,mute=0
> > > > > > > > > numid=17,iface=PCM,name='Capture Channel Map'
> > > > > > > > >   ; type=INTEGER,access=r----R--,values=2,min=0,max=36,step=0
> > > > > > > > >   : values=0,0
> > > > > > > > >   | container
> > > > > > > > >     | chmap-fixed=FL,FR
> > > > > > > > > numid=16,iface=PCM,name='Playback Channel Map'
> > > > > > > > >   ; type=INTEGER,access=r----R--,values=2,min=0,max=36,step=0
> > > > > > > > >   : values=0,0
> > > > > > > > >   | container
> > > > > > > > >     | chmap-fixed=FL,FR
> > > > > > > > >
> > > > > > > > > It can auto switch 'Headphone Playback Switch'/'Headphone
> > > > > > > > > Playback Volume' and 'Speaker Playback Switch'/'Speaker
> > > > > > > > > Playback Volume', when I plugin the headset or not, but I
> > > > > > > > > have not found the related logic, could you
> > > > > > > > please help clarify a bit?
> > > > > > > >
> > > > > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is
> > > > > > > > muted automatically when the headphone/headset jack is
> > > > > > > > plugged by the kernel
> > > > > > driver itself.
> > > > > > >
> > > > > > > What strange is 'Auto-Mute Mode' would be disabled after
> > > > > > > headset
> > > > > > plugin/out several times, don' t know the reason....
> > > > > >
> > > > > > "Auto-Mute Mode" is a software switch, and it means some program
> > > > > > must have turned it off explicitly.  e.g. the sound server like
> > > > > > pulseaudio or pipewire disables it.
> > > > > >
> > > > > > > However, it seems that speaker and headphone/headset still can
> > > > > > > auto
> > > > > > switch. Please see below mixer status.
> > > > > >
> > > > > > Usually pulseaudio/pipewire takes over and does the switching.
> > > > >
> > > > > OK, I see, I will dig into it, could you please tell me is there
> > > > > any other software
> > > > switches in the mixers?
> > > >
> > > > Any mixer program can change...  But basically the auto-mute is a
> > > > task of the sound daemon.
> > >
> > > I disable both pulseaudio and pipewire from the Debian, and enable the
> > auto-mute, when the headset plugin but the switch not set correctly.
> > > 'Headphone Playback Switch'/'Headphone Playback Volume' not set, but
> > 'Speaker Playback Switch'/'Speaker Playback Volume' enabled.
> > > Are there any other possible reasons?
> >
> > The auto-mute doesn't change the mixer state.  It switches internally, either by
> > adjusting the pin control or the amp.
> 
> OK, is that means all mixers setting should done by users based on Jack status?

The mixer settings are exposed to user-space and user-space programs
can read or change them, sure.  But it's not clear what is your exact
purpose or goal, so I can't answer much better than that.

The auto-mute feature is implemented in the kernel driver level, so
that the automatic muting via jack plug can work without the sound
daemon.  The auto-muted state isn't exposed to user-space via ALSA
control API (mixer elements), and it looks as  if it were muted by the
hardware.  Actually there are hardware that do the auto-muting in the
hardware level, too.


Takashi
