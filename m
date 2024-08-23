Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADCD4430
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420670; cv=none; b=CfaBguu3yXhGoUX3QuwfBf2NKSdEzn9l6EK4MYn86yeVuC6B2N/S0gDEiaBQklBD1R8rr5FmO17MT1NvDToWqK1MeW7+BwWQNfcriqiOwmEHSivqMxwNdg3RmtPiS/p8x90frX+r6mFJSzClkIcGum/aQTQZAoe/rBLNCPSjNSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420670; c=relaxed/simple;
	bh=OuqCuCBiUfjuCwx80BbZUSIcZVZH16InyVCCuJRewRI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lACEYuI6RprXEavL2kIrAvsNDbGjDklrjS2pk3125kx51CjRvm/7P9btYZo35xmGsWu8cNQXH5Z7FWqwo+EGRK2NkQO7mQjd08XGyZJ0egN0ehPYE+3uqFW/Tes9/LYmOvGeQ5h4qBrJWs1+Ag4nkB3D0yl9ORD6pybF7f1w+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goghnHxM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M5cx8/3X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goghnHxM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M5cx8/3X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goghnHxM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M5cx8/3X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goghnHxM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M5cx8/3X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14C7120320;
	Fri, 23 Aug 2024 13:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724420667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3j60Zx5AAGIoBkLqe9D2J+y7duSKv2GOP8LsXH430o=;
	b=goghnHxM0cFXEjVCPdQN2jd1+O3gym4LheQZiudH+8DowXe/CxocfMQx5CEg+exfNzWfTJ
	k1SxDkx7vWONDL9FDLy86fEE/Q828S7b9RiSE6lSDd2TxZ5kktw8jj/EezxZxLX2wU4f2I
	HmETMwjPY9sj+8ciPo5ZyeRaRiQYKKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724420667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3j60Zx5AAGIoBkLqe9D2J+y7duSKv2GOP8LsXH430o=;
	b=M5cx8/3XtseVH3UB6ucUbrMMSrJRL2wChBbbnC7dRGjoUWVOghLHadNbeoxnOVp8HhHMke
	euQIqPTUdpK/4ZAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=goghnHxM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="M5cx8/3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724420667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3j60Zx5AAGIoBkLqe9D2J+y7duSKv2GOP8LsXH430o=;
	b=goghnHxM0cFXEjVCPdQN2jd1+O3gym4LheQZiudH+8DowXe/CxocfMQx5CEg+exfNzWfTJ
	k1SxDkx7vWONDL9FDLy86fEE/Q828S7b9RiSE6lSDd2TxZ5kktw8jj/EezxZxLX2wU4f2I
	HmETMwjPY9sj+8ciPo5ZyeRaRiQYKKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724420667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3j60Zx5AAGIoBkLqe9D2J+y7duSKv2GOP8LsXH430o=;
	b=M5cx8/3XtseVH3UB6ucUbrMMSrJRL2wChBbbnC7dRGjoUWVOghLHadNbeoxnOVp8HhHMke
	euQIqPTUdpK/4ZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA6C51398B;
	Fri, 23 Aug 2024 13:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I84HODqSyGYQagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Aug 2024 13:44:26 +0000
Date: Fri, 23 Aug 2024 15:45:10 +0200
Message-ID: <871q2fl5eh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrey Kashtanov <austrum.lab@gmail.com>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: ASUS GA402XY (ACL285) Headset mic not working with 6.9 and 6.10 kernel
In-Reply-To: <CA+Qy7vRQnWx+0Au06hPbgASTRTxtNnbMxV=0jmJaZtsEBQ81zg@mail.gmail.com>
References: <CA+Qy7vRQnWx+0Au06hPbgASTRTxtNnbMxV=0jmJaZtsEBQ81zg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 14C7120320
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
X-Spam-Flag: NO

[ dropped CC to stable ML as it's an irrelevant list ]

On Fri, 23 Aug 2024 15:06:56 +0200,
Andrey Kashtanov wrote:
> 
> 
> Greetings!
> 
> I've run into a problem with an external microphone (3.5 jack headset) and
> fresh kernels (6.9, 6.10)
> When using the 6.9 or the 6.10 kernel system doesn't see an external mic from
> the headset (3.5 jack). Instead, there's only an internal mic plugged/
> available in the system.
> When using the 6.8 kernel or less it's okay, I can use mic from the headset.
> So currently I'm on 6.8.12.

If 6.8.12 works and 6.9.x doesn't, it's likely a regression in
HD-audio Realtek codec driver.  At best, try git bisect.  You can
focus on sound/pci/hda/patch_realtek.c.  If the bisection points to a
non-sense, it means the issue is something else.

In anyway, please give alsa-info.sh output, too.


thanks,

Takashi

> 
> Also opened a bug on bugzilla (
> https://bugzilla.kernel.org/show_bug.cgi?id=219158)
> 
> Laptop Model: Asus ROG G14 GA402XY
> Codec: Realtek ALC285 + Cirrus logic cs35l41
> OS: Debian Testing
> Kernel: 6.9.x, 6.10 represents the issue, 6.8.x no
> DE: Gnome 46, wayland
> 
> What I've tried:
> - Play with snd_hda_intel model parameters from here: 
> https://www.kernel.org/doc/html/latest/sound/hd-audio/models.html?highlight=headset+mic
> ex: options snd_hda_intel model=dell-headset-mic
> - Retask jack with hdajackretask
> - Install a fresh system on another ssd (latest PopOS) - after kernel update
> to 6.9.x (from the repository) it's the same issue.
> 
> 
