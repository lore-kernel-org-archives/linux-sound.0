Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D91331220
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519709; cv=none; b=DpJ3izRC1e67qulmMQegR4qiLaf+wLwIv3I61XA1KkbeuahSyWzUyPMg0XP/eyvHWHx8AEEJ7toWPCPbGUWMhEiuO9yV4AaYXip99DFC4sr5tMh0QFTVZetA2d9CBOK82Te0VLE/DUBgVuaheODYnlYWh60KIPp4uUpR4Co/dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519709; c=relaxed/simple;
	bh=9009pQb0lhWNLT9TdZm2IdFpoOb1iK47SlOvG96FfDQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rd+0W4BbVYRCkUuIDZFBC11ajBNl63bSoppSJ66G5b17h/oQS/TdCJZlQiRN3DObmG2YBXH6j1zoqrP5A6H/0vwIlvhqKNe8XtDwmThwc37K7G1ZFMizRFf11ElPKtqjeOOticToXp/Edvo12wSBWutdcIBBIaqGRF26umG7cSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zym6t+Mk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VPD3+Kg8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=shYX0BWc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HkCPESvw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zym6t+Mk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VPD3+Kg8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="shYX0BWc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HkCPESvw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 29DEE3F892;
	Tue,  3 Mar 2026 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772519706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/ANAyXcfF0bJjYUGJmdp0uvwW4XG2Sx4Lqz4TgFLbQ=;
	b=zym6t+MkT9vVrydDEtMERIAIJAg+fpvzxT42ISJPlA/aXuSkl1XG8ttK0ThKZJY1QSXSVv
	C5rNDHBqV4a8DwrREcDck8cId+68+FAVximgQXTifyl/kwXAk1UI1Zl+v6CY7R7FaxXUAA
	aiFCP3Qu4QFiIKbRdxGfaAmOIyT10Fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772519706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/ANAyXcfF0bJjYUGJmdp0uvwW4XG2Sx4Lqz4TgFLbQ=;
	b=VPD3+Kg8jgHbtjoVVSX6pvt7l2VbX/oVSR0SeCWXtgwcCrKLmq14hs9TUmTvFSrWmr3qqp
	+nvZvNcgOY18BAAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772519705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/ANAyXcfF0bJjYUGJmdp0uvwW4XG2Sx4Lqz4TgFLbQ=;
	b=shYX0BWcIf2vgqc5axwpHGsPWFolCpbBZ4edm+/hob8RFS/VpuY+xenY5N8Yl2eNUqwEH3
	KDz0LY50fceBSLQI5C/tUnUszy1JRuZ5AjhoTj9k3K870dH7uSWocHnIl2SAAApEbtO5XN
	nMf5qodlMg96o+I2Id5N8WCffhCJ+ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772519705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/ANAyXcfF0bJjYUGJmdp0uvwW4XG2Sx4Lqz4TgFLbQ=;
	b=HkCPESvw6FUiFev6xUu7qLj4C0Y/VZ0ck6JIwRyldj6Idb59AsWz8oVdFeRJNoiuq8+phN
	bRP41iIpeHl78iDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07CA43EA69;
	Tue,  3 Mar 2026 06:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jI6COxiBpmkuEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 06:35:04 +0000
Date: Tue, 03 Mar 2026 07:35:04 +0100
Message-ID: <87h5qxl8tj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
	<87qzq2kxrc.wl-tiwai@suse.de>
	<CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
	<87ldgakvsc.wl-tiwai@suse.de>
	<CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
	<CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
	<CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 02 Mar 2026 19:28:48 +0100,
Gilberto Ferreira wrote:
> 
> I don't know this can help in some way, but I got this ops
> 
> dmesg | grep hda
> [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: enabling device
> (0000 -> 0002)
> [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.1: Handle
> vga_switcheroo audio client
> [seg mar  2 15:26:10 2026] snd_hda_intel 0000:04:00.6: enabling device
> (0000 -> 0002)
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> CX11970: BIOS auto-probing.
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> autoconfig for CX11970: line_outs=1 (0x17/0x0/0x0/0x0/0x0)
> type:speaker
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> hp_outs=1 (0x16/0x0/0x0/0x0/0x0)
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> mono: mono_out=0x0
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:    inputs:
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:      Mic=0x19
> [seg mar  2 15:26:10 2026] snd_hda_codec_conexant hdaudioC1D0:
> Internal Mic=0x1a
> [seg mar  2 15:26:12 2026] snd_hda_intel 0000:04:00.1: bound
> 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> 
> 
> I really don't know what that means...

You need to *compare* between two kernel logs.  You can strip the time
prefix, and check which lines appear and which disappear in the new
kernel log.

FWIW, the above is the normal information from HD-audio at parsing the
BIOS info and at binding the interface.

And, have you tested the revert?


Takashi
