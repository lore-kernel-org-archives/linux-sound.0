Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EE30FF37
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715987; cv=none; b=Ek0+dBX9AJvbibxiYpsrUKWycROipNh7sCpfJZQ10ig3ByjagnGmxG0kSOOUVxZJemyjfBer7Eox1EVh0t08aMCVMrQAaySxN6u8xhpKR+XRU/jNA23kDrCRHCMNNvb54p+c9qeFDuzWBBBze13bDWPCT4D2htvOk/ihOuS+bGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715987; c=relaxed/simple;
	bh=OCY06PKMClnqCPp4SWj37DKnUb7x2O9FdY0IsNqX08M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/NF530TMQhRjE8766rRAIOd0LiXd3T32WwlyXdg8f+MesnE/AbX+lt/3wK7sFlXVBDBbhVS8bLSL9q4Gj3mfTkDuumaoJI2KtZSa9HBFMarsQEOWeCgDzrWkH2TI/dipUgLSgk1oWBTv7N/HRgUleYupfY2INL4WMLu+5WzLAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mfytlTBW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eLTc4DZ7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mfytlTBW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eLTc4DZ7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mfytlTBW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eLTc4DZ7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mfytlTBW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eLTc4DZ7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41BE65BDC6;
	Thu,  5 Mar 2026 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksqWc8mQfACUQgdYRTIgJ66NiQLZg2o6tWECj7gHl9E=;
	b=mfytlTBWEKwGZsJU83cyUjo5C9Nsq9pVoWiEnzur01MrvT5IV+STEu+MqfFl8qTYTEABnn
	CsW5iZ2Rw5UpL4lEoTaivttHXpmApGYs0/PZVmajq2i5dp6zE2rPU7rv1JDfkwCh4avWcQ
	QK6yRGmYcRoqRDZFyfRmLdxAZJaooiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksqWc8mQfACUQgdYRTIgJ66NiQLZg2o6tWECj7gHl9E=;
	b=eLTc4DZ7R0mIoNTvfF1GoCPnpbqKoSuk340s8SVwnuDnHdm8t3OZ638/ITo0s2vd7rxMfo
	6GRTQzZ2LdFXbkAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mfytlTBW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eLTc4DZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksqWc8mQfACUQgdYRTIgJ66NiQLZg2o6tWECj7gHl9E=;
	b=mfytlTBWEKwGZsJU83cyUjo5C9Nsq9pVoWiEnzur01MrvT5IV+STEu+MqfFl8qTYTEABnn
	CsW5iZ2Rw5UpL4lEoTaivttHXpmApGYs0/PZVmajq2i5dp6zE2rPU7rv1JDfkwCh4avWcQ
	QK6yRGmYcRoqRDZFyfRmLdxAZJaooiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksqWc8mQfACUQgdYRTIgJ66NiQLZg2o6tWECj7gHl9E=;
	b=eLTc4DZ7R0mIoNTvfF1GoCPnpbqKoSuk340s8SVwnuDnHdm8t3OZ638/ITo0s2vd7rxMfo
	6GRTQzZ2LdFXbkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2357C3EA68;
	Thu,  5 Mar 2026 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x9z5BtB/qWmIGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 13:06:24 +0000
Date: Thu, 05 Mar 2026 14:06:23 +0100
Message-ID: <87y0k6whm8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
	<87qzq2kxrc.wl-tiwai@suse.de>
	<CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
	<87ldgakvsc.wl-tiwai@suse.de>
	<CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
	<CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
	<CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
	<87h5qxl8tj.wl-tiwai@suse.de>
	<CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
	<87ecm1jii6.wl-tiwai@suse.de>
	<CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
	<CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 41BE65BDC6
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 05 Mar 2026 13:54:45 +0100,
Gilberto Ferreira wrote:
> 
> Hi there...
> 
> I just installed ArchLinux, because I thought that perhaps
> Ubuntu/Debian was the culprit.
> So, I went ahead and installed linux-mainline from AUR.
> But I get this same result.

Then please try to git bisect.  That's likely the most straightforward
way to figure out the culprit.


thanks,

Takashi

> 
> 
> ---
> 
> 
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
> 
> 
> 
> 
> ---
> 
> 
> Gilberto Nunes Ferreira
> +55 (47) 99676-7530 - Whatsapp / Telegram
> 
> 
> 
> 
> 
> 
> Em ter., 3 de mar. de 2026 às 09:17, Gilberto Ferreira
> <gilberto.nunes32@gmail.com> escreveu:
> >
> > Well... I really don't know what happened.
> > Probably my fault, as usual.
> > I do this:
> > git clone https://github.com/torvalds/linux.git
> > cd linux
> > git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > make mrproper
> > cp /boot/config-$(uname -r) .config
> > fakeroot make -j$(nproc) deb-pkg
> >
> > But after that, the result was
> > linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.deb!
> > I don't get it.
> >
> > git log shows me this:
> >
> > commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> > Author: Vivian Wang <wangruikang@iscas.ac.cn>
> > Date:   Thu Jan 29 09:56:09 2026 +0800
> >
> >    ALSA: hda/intel: Make MSI address limit based on the device DMA limit
> >
> > So, basically, I give up!
> > When this issue gets fixed, I will try kernel 7.0 again.
> >
> > Sorry to bother.
> >
> >
> >
> >
> >
> > ---
> >
> >
> > Gilberto Nunes Ferreira
> > +55 (47) 99676-7530 - Whatsapp / Telegram
> >
> >
> > Em ter., 3 de mar. de 2026 às 07:48, Takashi Iwai <tiwai@suse.de> escreveu:
> > >
> > > On Tue, 03 Mar 2026 11:27:24 +0100,
> > > Gilberto Ferreira wrote:
> > > >
> > > > Sorry... I am not an expert on this stuff.
> > > > I just like to compile the kernel...
> > > >
> > > > >> You need to *compare* between two kernel logs.  You can strip the time
> > > > >> prefix, and check which lines appear and which disappear in the new
> > > > >> kernel log.
> > > > How can I do that?
> > > > Via journalctl -xe -p3? journalctl -r -b?
> > >
> > > You can run "dmesg > dmesg.log" on the running kernel.  And you can
> > > get two outputs.  You can strip the time prefix from there by some
> > > script for easier comparison.
> > >
> > > > >> And, have you tested the revert?
> > > > I don't know how to do that.
> > > >
> > > > If you can point me to some doc, it would be nice.
> > >
> > > Have you ever built a kernel by yourself?  If yes, it should be just a
> > > git revert of the suggested commit and rebuild / retest.
> > > If not, which (distro) kernel are you using?  Usually you can ask
> > > distro people to build a test kernel.
> > >
> > > In general, please be more specific about your system and
> > > configuration.
> > >
> > >
> > > Takashi
