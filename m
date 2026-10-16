Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54196509F18
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169218; cv=none; b=QZOQ9FJwVA+bb+38/sf2ObX7BBrD/a32SJR8w7TJegmU+L50tpfM+ZDHeVdMFisoFKCrXusfiLZn0eeQx1T6B007cpWF3pT6ErJuM+ZpYM2mQTMdgMImbFXEpgOBXGx9HJ4/Yb1TrobjCB7H5+582fIVC5VcE+GKMgS3uwzcGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169218; c=relaxed/simple;
	bh=pFmiut43QOhgLsvpptGAcXJCUNLF2IIpexlRc4gPkrs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBAW9WPSmqqHtfBXDdq827Vq9UTw6VHeHlj37lNZ+AkLOjaivn4Gc/peJL+KLXdT5mst6kfjXqbKwXopexlzn3U6RE7GZjBFDkxwP8+ZaxSmcnMF6cWQOEWeqy+DzUNBmtjOVEAf5qqj9q+2ISNj9ImtEorvkg5aCBYOw7SHh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUsbA68j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NGr/4EAl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LwgpmY1z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9z4wW2lE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUsbA68j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NGr/4EAl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LwgpmY1z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9z4wW2lE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A3B291F393;
	Fri, 16 Oct 2026 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792169213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvrw4UHzR00imf0ZL6HCtOT5eUpVqblQ43XAwRqBMi4=;
	b=KUsbA68jXbDWbhsnwq6dGcImu9Yw0XU3UIOJYRPBsch1+lQ5KOEKksoZ/uSlxN041RwClG
	cJI35wcfd8hQPcN1LiM8MIOddw9F1/WXeFL6JlH9F2AjvFEfiP9rSnTrncwibpci7FjHMu
	zAXW5/eeRYf/CPZiNDjnQSbqSyFKcPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792169213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvrw4UHzR00imf0ZL6HCtOT5eUpVqblQ43XAwRqBMi4=;
	b=NGr/4EAlnIYY5iv6x0kz/GGTBYY/0hbhPoSp+si+fHc0OqyP3ISD2jrRrRXXr+gRyPLoqH
	mvQtprVk1ZwwbXAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792169211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvrw4UHzR00imf0ZL6HCtOT5eUpVqblQ43XAwRqBMi4=;
	b=LwgpmY1znK6r5CduEwtD2K99eXZYWMuNIdlkZLbdzgotvgBAoc5SVjHTWgCUWuMnvQCaxu
	xwIqGUu42vEsHzsaBB2BuM8RDVfP8OHj+c11zkwT9992Kk7cFANwQTPLI0gFeyRw6vaA8p
	M0x++CfqHr87SjWsy2I9CzGEB1RoxvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792169211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvrw4UHzR00imf0ZL6HCtOT5eUpVqblQ43XAwRqBMi4=;
	b=9z4wW2lE2nh/PvnDRnONSECR2JwDuTpTGAaHr11EL63UGEGJBwX7X/i/IXJ4czVRUeMAEF
	WSfSrAyRpjJrfUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E839139B7;
	Fri, 16 Oct 2026 16:46:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qx6TCftU0mohPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 16:46:51 +0000
Date: Fri, 16 Oct 2026 18:46:50 +0200
Message-ID: <871p9p385h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Piotr =?ISO-8859-2?Q?Gli=BCniewicz?= <p.glizniewicz@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: 6fire: S/PDIF output
In-Reply-To: <20261016073132.109288-1-p.glizniewicz@gmail.com>
References: <20261016073132.109288-1-p.glizniewicz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,zoho.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,zoho.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 16 Oct 2026 09:31:29 +0200,
Piotr Gli¼niewicz wrote:
> 
> The DMX 6Fire USB has a coaxial S/PDIF output, which the driver keeps
> disabled. This series enables it as playback channels 7 and 8 of the
> existing PCM device, the layout chosen in the RFC thread [1].
> 
> Patch 1 takes stream_mutex in the "Digital Thru Playback Route" put.
> It fixes a race with prepare that exists in mainline, and patch 3
> depends on the lock.
> 
> Patch 2 adds a playback channel map in the order of the manual of the
> card, FL FR FC LFE RL RR on Line Out 1 to 6.
> 
> Patch 3 adds the output with the "IEC958 Playback Default", "IEC958
> Playback Con Mask" and "IEC958 Playback Switch" controls. With 8
> channels the card runs at 96 kHz at most. The Pro Audio profile of
> PipeWire 1.6.9 opened the device with 8 channels, so with this series
> it gets 8 channels at up to 96 kHz instead of 6 channels at up to
> 192 kHz. A client that asks for 6 channels still gets 176.4 and
> 192 kHz.
> 
> A UCM profile for alsa-ucm-conf will describe the channels: the default
> variant with analog 5.1 and S/PDIF as two sinks at up to 96 kHz, and a
> "HiFi Analog" variant with analog 5.1 only at up to 192 kHz, which
> turns the switch off while in use. I tested a draft with
> PipeWire 1.6.9 and this series; I will send it after the kernel
> patches are accepted.
> 
> [1] https://lore.kernel.org/linux-sound/30dcedc7-3b56-4396-af3d-6c2701ef1cb7@perex.cz/
> 
> Piotr Gli¼niewicz (3):
>   ALSA: 6fire: take stream_mutex in the Digital Thru control
>   ALSA: 6fire: add a playback channel map
>   ALSA: 6fire: add S/PDIF output

Applied to for-next branch now.  Thanks.


Takashi
