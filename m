Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE44A1DE0
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051231; cv=none; b=kmO0B7vdMy8Um4WGAbeZ8SziGn4M1NzOvB1kwf/mRCSyQhH3BtiJgK65JVu6uyIOpJ+z0PEZTuJWxyYD6oJw61j+04ZV4v/LlUffB0YU5RJ5SanS4GEAvat634XAqLVHRdq3/T1DAMiti+CoxAerfTy9J2NMTeScG/cLssVvHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051231; c=relaxed/simple;
	bh=PuZ4Wcb4fllGVSeZG+twFyuT8s6IdfWYkKsuIc5Y0yk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU4S/WnHS50lhNcygde/f3NmfagTg74lNalqi8md1YE0m5FA8P9PRxr6W6AlyN/67HQVIynusMdkD0JpfLU7I+gSN/EYN8WEb2W9Q2yzjYwbAVrv3W2U3u0tFjWT3KZHbpSoUe7P738P7Al48GOBzmMSV7orPCymJ/y+EKBKV4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hV8kavdn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3FrhX0T4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K26nN1bH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wxYuxgys; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hV8kavdn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3FrhX0T4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K26nN1bH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wxYuxgys"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B6D021D2E;
	Thu, 10 Sep 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789051224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qheMWz3EmJunAQL3o3CqacSHxSVQrccK2Vf/1UqKDv4=;
	b=hV8kavdnRUoeSkd3C/xDftRUiJaP+ADPuVDzIAKDArztGcu8ILMoZq2Fqab8/MrKBMWNeR
	8uDx7Rrze5N9JH9AUTKcWvhvBEpiOtRNEAqj0BrxXQaursYOLmRbmTHnpbILW7xcz6od+3
	/s8LD/wK2fFXhgcsi88iMft6nAo4x8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789051224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qheMWz3EmJunAQL3o3CqacSHxSVQrccK2Vf/1UqKDv4=;
	b=3FrhX0T4lzmv1LdNWKW/7FbC9G1qWYkaFQffsYdhhxKWwqAGAeoSLEO+xlAStORl3No0D6
	a3CPEKgSGxq8kQAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K26nN1bH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wxYuxgys
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789051220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qheMWz3EmJunAQL3o3CqacSHxSVQrccK2Vf/1UqKDv4=;
	b=K26nN1bHXGKHqvcUgD5SCV9bzNPDsxw6Z2eiPR28d+FaVoQa0SVzrC5mskfAXn0juhlCIg
	QnVgJQdpbfrUNSfo9WXZB1+GjQm59lPepEzFg+9PCoabAN5483VeR7rUo2Q5WOIoh6tj0w
	7dsjwP9dWmv8+RuBokIDwtCLvMbjQuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789051220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qheMWz3EmJunAQL3o3CqacSHxSVQrccK2Vf/1UqKDv4=;
	b=wxYuxgysi2JWHRI+4ayQtEVD/tv3562mJAvVqx5CFYk5tHGZXhU+Z36z9d7Fwwb25dcxR5
	nLkzglyGWpqY5lAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7EE513A5A;
	Thu, 10 Sep 2026 14:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B7upK1PBomoZXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 14:40:19 +0000
Date: Thu, 10 Sep 2026 16:40:19 +0200
Message-ID: <877bktkw4s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: snd-hdspm: add PCI ID 1d18:3fc6 for RME HDSPe AIO firmware 200
In-Reply-To: <178904827476.7.2964197537734761535.1610750460@slmail.me>
References: <178674392532.7.10140952469564861620.1550442282@slmail.me>
	<87fqzsb043.wl-tiwai@suse.de>
	<178904827476.7.2964197537734761535.1610750460@slmail.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 2B6D021D2E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DISPOSABLE_ENVRCPT(0.00)[slmail.me];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DISPOSABLE_TO(0.00)[slmail.me];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Thu, 10 Sep 2026 15:51:11 +0200,
AtmanActive wrote:
> 
> Hi Takashi,
> 
> I verified the equivalent of this patch on the original RME HDSPe AIO
> (firmware Revision=200, PCI ID 1d18:3fc6, rev d4).
> 
> I could not rebuild a patched module right now (that card is
> temporarily out of the machine), but I previously tested the same
> pci_device_id match on Fedora with the stock snd-hdspm driver, like so:
> 
>     modprobe snd_hdspm
>     echo '1d18 3fc6' > /sys/bus/pci/drivers/snd_hdspm/new_id
> 
> Result:
> - lspci showed: Kernel driver in use: snd_hdspm
> - /proc/asound/cards identified it as RME AIO
> - hdspmixer meters responded to analog/digital input and playback
> - alsamixer was able to control all card parameters correctly
> - playback and capture worked at single speeds (44.1 kHz and 48 kHz)
> 
> 
> 
> Please add:
> 
> Tested-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
> 
> If you still want a rebuilt-module test, I can reinstall the card
> and repeat it. I am not a kernel developer so will need to
> dual boot and follow the instructions.

OK, I'm going to submit & merge the official fix patch to the
upstream.


thanks,

Takashi
