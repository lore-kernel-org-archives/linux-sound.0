Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86138F65E
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445575; cv=none; b=XQN67LUt6zTzlFiqkBnnmk0fxyS8I91IPG1s16CL07vNOj5EKxWyz+FIxym730xcgqIpzchji/GLybI3iUS30sNR4Fzeuuqe5LJ0q+/VyALYbP43WnhqDr3bff26YJUsnLRNAcMm365ZEMZOUF2iBcGo7VML8METouAH9RlvSoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445575; c=relaxed/simple;
	bh=taRjSMjKPq6MvjNWJ8aTlxRWcj2a7ABpwlKs5emFqqc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3DlTsTkB+z1y8G2JANK+9KL2IZCeinZhxEwomIuNW8D3ug1DMPwUzhhgO8Ka5NSN3ueI9LTR6NFBbc222RSAJ88cXdf5g7qN5CwCC2965PNR/yhg5JcKjR2vlBmrmsmM0bfdFCiJh322tFktOZBe9tTrF/SUxGJix5WAoJlXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uly6fAcJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LHm/cuhv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uly6fAcJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LHm/cuhv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uly6fAcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LHm/cuhv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uly6fAcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LHm/cuhv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA08D5BD0E;
	Mon,  2 Mar 2026 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5OVqtVrOhnUOnAK1dgDtX9mldifh6E/oCBcCGVQHY=;
	b=uly6fAcJS4cCfTcFFKbyfRTVAQYOFd6BgwdQt7qfj7zHrOXr2eInWPLElWqCl8hZSsLzgY
	tHhoRUqG9lKl00kLP0td9SB+JHaFrP1cyUxRqRIR5ALk4r/eynJT5IlCHhjtId69lfY2s1
	yPIO7SCg7krKLS9zr/DObaExTdlcUCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5OVqtVrOhnUOnAK1dgDtX9mldifh6E/oCBcCGVQHY=;
	b=LHm/cuhvhxUjVS7lD4d4afQOl15JAvkrDnYFWKjHYn19PhaXzplrv7EA+Pw5Nhi8rgu4VG
	EJSOfe0Ur8lkdZDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uly6fAcJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="LHm/cuhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5OVqtVrOhnUOnAK1dgDtX9mldifh6E/oCBcCGVQHY=;
	b=uly6fAcJS4cCfTcFFKbyfRTVAQYOFd6BgwdQt7qfj7zHrOXr2eInWPLElWqCl8hZSsLzgY
	tHhoRUqG9lKl00kLP0td9SB+JHaFrP1cyUxRqRIR5ALk4r/eynJT5IlCHhjtId69lfY2s1
	yPIO7SCg7krKLS9zr/DObaExTdlcUCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5OVqtVrOhnUOnAK1dgDtX9mldifh6E/oCBcCGVQHY=;
	b=LHm/cuhvhxUjVS7lD4d4afQOl15JAvkrDnYFWKjHYn19PhaXzplrv7EA+Pw5Nhi8rgu4VG
	EJSOfe0Ur8lkdZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C1BC3EA69;
	Mon,  2 Mar 2026 09:59:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YsMRGYNfpWmiEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 09:59:31 +0000
Date: Mon, 02 Mar 2026 10:59:31 +0100
Message-ID: <87ldgamu0s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 0/9] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BA08D5BD0E

On Sun, 01 Mar 2026 22:37:16 +0100,
Rong Zhang wrote:
> 
> Some quirky devices tune their volume by linearly tuning the voltage
> level (linear volume). In other words, such devices has a linear TLV
> mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).
> 
> The series mainly adds quirk flags MIXER_PLAYBACK_LINEAR_VOL and
> MIXER_CAPTURE_LINEAR_VOL to represent this case respectively for
> playback and capture mixers. Afterward, apply these quirk flags on them.
> 
> Some MV-SILICON devices with these quirks also have another quirk: VID
> conflicts with Focusrite Novation (0x1235). Hence, add support for
> string-descriptor-based quirk table entries and define an entry for MV-
> SILICON to deconflict them.
> 
> Some improvements to the logic of volume range checks is also included
> in the series to help identify quirky devices with linear volume.
> 
> Rong Zhang (9):
>   Revert "ALSA: usb: Increase volume range that triggers a warning"
>   ALSA: usb-audio: Add helper function for volume range checks
>   ALSA: usb-audio: Improve volume range checks
>   ALSA: usb-audio: Support string-descriptor-based quirk table entry
>   ALSA: usb-audio: Deconflict VID between Focusrite Novation &
>     MV-SILICON
>   ALSA: doc: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP of snd-usb-audio
>   ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
>   ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
>   ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices

Thanks for patches!  The logic looks good and the implementation
seems reasonable.  One slight concern was about the string matching
patch (I explained in another mail), but others look fine.

Maybe the patch to add the missing documentation for
QUIRK_FLAG_SKIP_IFACE_SETUP should be applied individually beforehand.
Could you send it a fix for 7.0?

The revert of volume range check makes sense, but maybe that should be
combined with your rest changes.


Takashi
