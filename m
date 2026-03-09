Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79033CD8C8
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065381; cv=none; b=omfaVua3eMDmjb22gdCLLWXKiBKB32lTdiNUP/de3+0j6G4tIIv+fO+vIOZgR7cuWv/gH04Ey/MhSXJeEC2TEuxZHuRfeDTNYeCi/JXSucGtT4gNQNdNQlmI08vkBBiX4YLeJV0GuosF36QDXge2b67mQa/h0ce/gUPBjblU9Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065381; c=relaxed/simple;
	bh=eSZNDd3/VUhrm2Q1CITZFs+bU0OmnOEmqliWzDMZ5OA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vt6K3ex0211/prlaLS/oZZSwy8QB4QHYpjh/aJVSjeFS8tZzuQcZOeim2srLDXO0HDvaj2Wi9iNwNrdqEbUfSkyvzUHm8CmOg6S3rBBLPHveT6wNR/HO0W1dnXEcA25hsTuk7s+mRGKxdCOEwnT6DUuiIRwTbPbFkYtzIbuVxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N+dgTfJJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YupqzYf5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N+dgTfJJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YupqzYf5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N+dgTfJJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YupqzYf5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N+dgTfJJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YupqzYf5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE07E5BE12;
	Mon,  9 Mar 2026 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDKwS/QCNAnVjbfI+B0nNvJ6vljeP0HAYxclm45MUeE=;
	b=N+dgTfJJQijJWnJbc3foPa37484dCDTsoY1DizBarTgsNWNEVkcLz+xWj6xtPvtqgnuYPQ
	8Vu9sAF3E0lQsqaJcbfTSBg33jUWwsHPVOG5Gfvw1nk4LPXBMs7twtG/Mp5gkVDlznpHOE
	ywzgi6aypqj4A6i1ZeszFuQMzf+y/TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDKwS/QCNAnVjbfI+B0nNvJ6vljeP0HAYxclm45MUeE=;
	b=YupqzYf5t9Kuk0g4YBL/Ym/sE6buKullHgZJCYYEXhKWLG3pqRm9wd6bNYkXBtH4OtIGtH
	96DIG13mYHZqvWDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773065375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDKwS/QCNAnVjbfI+B0nNvJ6vljeP0HAYxclm45MUeE=;
	b=N+dgTfJJQijJWnJbc3foPa37484dCDTsoY1DizBarTgsNWNEVkcLz+xWj6xtPvtqgnuYPQ
	8Vu9sAF3E0lQsqaJcbfTSBg33jUWwsHPVOG5Gfvw1nk4LPXBMs7twtG/Mp5gkVDlznpHOE
	ywzgi6aypqj4A6i1ZeszFuQMzf+y/TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773065375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDKwS/QCNAnVjbfI+B0nNvJ6vljeP0HAYxclm45MUeE=;
	b=YupqzYf5t9Kuk0g4YBL/Ym/sE6buKullHgZJCYYEXhKWLG3pqRm9wd6bNYkXBtH4OtIGtH
	96DIG13mYHZqvWDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EB673EF31;
	Mon,  9 Mar 2026 14:09:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8gJ4IZ/UrmnFMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 14:09:35 +0000
Date: Mon, 09 Mar 2026 15:09:35 +0100
Message-ID: <87jyvlm6w0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
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
	<87y0k6whm8.wl-tiwai@suse.de>
	<CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 09 Mar 2026 15:02:17 +0100,
Gilberto Ferreira wrote:
> 
> Linux kernel 7 RC3 is out and still no HDMI sound.
> 

At best, please try git bisect.  Or if it can't work for you, ask your
distro people who can help.

And, I'm afraid that it's not the sound subsystem but the DRM graphics
driver that actually broke.  In that case, you're reporting to a wrong
list, and further ping wouldn't help.
(And for figuring it out, you'd need the bisection, so going back to
square...)


thanks,

Takashi

> ---
> 
> Gilberto Nunes Ferreira
> 
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
> Em qui., 5 de mar. de 2026 às 10:06, Takashi Iwai <tiwai@suse.de> escreveu:
> >
> > On Thu, 05 Mar 2026 13:54:45 +0100,
> > Gilberto Ferreira wrote:
> > >
> > > Hi there...
> > >
> > > I just installed ArchLinux, because I thought that perhaps
> > > Ubuntu/Debian was the culprit.
> > > So, I went ahead and installed linux-mainline from AUR.
> > > But I get this same result.
> >
> > Then please try to git bisect.  That's likely the most straightforward
> > way to figure out the culprit.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > >
> > >
> > > ---
> > >
> > >
> > > Gilberto Nunes Ferreira
> > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > >
> > >
> > >
> > >
> > > ---
> > >
> > >
> > > Gilberto Nunes Ferreira
> > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > >
> > >
> > >
> > >
> > >
> > >
> > > Em ter., 3 de mar. de 2026 às 09:17, Gilberto Ferreira
> > > <gilberto.nunes32@gmail.com> escreveu:
> > > >
> > > > Well... I really don't know what happened.
> > > > Probably my fault, as usual.
> > > > I do this:
> > > > git clone https://github.com/torvalds/linux.git
> > > > cd linux
> > > > git checkout cb9b6f9d2be6bda1b0117b147df40f982ce06888
> > > > make mrproper
> > > > cp /boot/config-$(uname -r) .config
> > > > fakeroot make -j$(nproc) deb-pkg
> > > >
> > > > But after that, the result was
> > > > linux-image-6.19.0-rc1+_6.19.0~rc1-00011-gcb9b6f9d2be6-1_amd64.deb!
> > > > I don't get it.
> > > >
> > > > git log shows me this:
> > > >
> > > > commit cb9b6f9d2be6bda1b0117b147df40f982ce06888 (HEAD)
> > > > Author: Vivian Wang <wangruikang@iscas.ac.cn>
> > > > Date:   Thu Jan 29 09:56:09 2026 +0800
> > > >
> > > >    ALSA: hda/intel: Make MSI address limit based on the device DMA limit
> > > >
> > > > So, basically, I give up!
> > > > When this issue gets fixed, I will try kernel 7.0 again.
> > > >
> > > > Sorry to bother.
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > ---
> > > >
> > > >
> > > > Gilberto Nunes Ferreira
> > > > +55 (47) 99676-7530 - Whatsapp / Telegram
> > > >
> > > >
> > > > Em ter., 3 de mar. de 2026 às 07:48, Takashi Iwai <tiwai@suse.de> escreveu:
> > > > >
> > > > > On Tue, 03 Mar 2026 11:27:24 +0100,
> > > > > Gilberto Ferreira wrote:
> > > > > >
> > > > > > Sorry... I am not an expert on this stuff.
> > > > > > I just like to compile the kernel...
> > > > > >
> > > > > > >> You need to *compare* between two kernel logs.  You can strip the time
> > > > > > >> prefix, and check which lines appear and which disappear in the new
> > > > > > >> kernel log.
> > > > > > How can I do that?
> > > > > > Via journalctl -xe -p3? journalctl -r -b?
> > > > >
> > > > > You can run "dmesg > dmesg.log" on the running kernel.  And you can
> > > > > get two outputs.  You can strip the time prefix from there by some
> > > > > script for easier comparison.
> > > > >
> > > > > > >> And, have you tested the revert?
> > > > > > I don't know how to do that.
> > > > > >
> > > > > > If you can point me to some doc, it would be nice.
> > > > >
> > > > > Have you ever built a kernel by yourself?  If yes, it should be just a
> > > > > git revert of the suggested commit and rebuild / retest.
> > > > > If not, which (distro) kernel are you using?  Usually you can ask
> > > > > distro people to build a test kernel.
> > > > >
> > > > > In general, please be more specific about your system and
> > > > > configuration.
> > > > >
> > > > >
> > > > > Takashi
