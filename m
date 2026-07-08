Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AEB3C4174
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507160; cv=none; b=rrixfoRWZWmkriQDlT/bnV8GjkFcSdFwr4xjcp7DjmvOZYdsUO2DcS1SIfAaA7FAVmD1fX1ABBKQq1LY335djkchGw/434jFekWnE241H033tFeCUGnCQLQlwKsNYZQ4ecouJmX7LDHrM01YEmWd0VmYDQk9sTLdJWw5ibzbpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507160; c=relaxed/simple;
	bh=Sw6BWklX2WQUDlAdQ0XshsnWxG1kH+FDq0zjd/JJN2k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpCkopnugx7tCKUB2W8vjid1wBD87gQkRqUzBYXnemrtp4np2LHrNwElLqodINCMp/Pd2px1moQ8PQsxhOLUyRAzDQsBuky7M1V2MTsGQhezFT5v/umuHygv5bJyoracmIgcGCLsX3SXfV/SA6uVqtbiFyecOB5e7EJsNCCK4vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUjvFaXA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U9JKPyrK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KUjvFaXA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U9JKPyrK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUjvFaXA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U9JKPyrK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KUjvFaXA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U9JKPyrK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D63975B52;
	Wed,  8 Jul 2026 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nn3UIcDPiImegF32opBZ7MP8bG/Rp/KoNt2x+YETtqQ=;
	b=KUjvFaXAPFZaNDr422D6liU5Skc3Tmb6GQZNktErtuxUHdiC591w/zfhBlM1pjYZO4+TWD
	zcO4fhZ3Tk2Bndd7uP5YJaW39caBGjD+2j2YtFKjkrGdKHB/jV+xiFBZnqEmmv1IPesJkX
	gFKY0wsf4Np5Yb71UxZ/Ip/+kDBWPD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nn3UIcDPiImegF32opBZ7MP8bG/Rp/KoNt2x+YETtqQ=;
	b=U9JKPyrKS/Lb5rX8mVbDzctjg9v/RJYlUiVSGFylBbVqh3V7FRBGW6sp9cvxEcXXUcqkcV
	azB6HeC/S9iJRkBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KUjvFaXA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U9JKPyrK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783507147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nn3UIcDPiImegF32opBZ7MP8bG/Rp/KoNt2x+YETtqQ=;
	b=KUjvFaXAPFZaNDr422D6liU5Skc3Tmb6GQZNktErtuxUHdiC591w/zfhBlM1pjYZO4+TWD
	zcO4fhZ3Tk2Bndd7uP5YJaW39caBGjD+2j2YtFKjkrGdKHB/jV+xiFBZnqEmmv1IPesJkX
	gFKY0wsf4Np5Yb71UxZ/Ip/+kDBWPD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783507147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nn3UIcDPiImegF32opBZ7MP8bG/Rp/KoNt2x+YETtqQ=;
	b=U9JKPyrKS/Lb5rX8mVbDzctjg9v/RJYlUiVSGFylBbVqh3V7FRBGW6sp9cvxEcXXUcqkcV
	azB6HeC/S9iJRkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A7C1779AE;
	Wed,  8 Jul 2026 10:39:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7lDBBMsoTmo2HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Jul 2026 10:39:07 +0000
Date: Wed, 08 Jul 2026 12:39:06 +0200
Message-ID: <875x2p6a0l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Agustin Luzardo <agustinluzardo09@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Redragon H510-PRO Wireless headset
In-Reply-To: <20260705184227.113588-1-agustinluzardo09@gmail.com>
References: <20260705184227.113588-1-agustinluzardo09@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4D63975B52
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 05 Jul 2026 20:42:27 +0200,
Agustin Luzardo wrote:
> 
> The device with USB ID 040b:0897 (Weltrend Semiconductor chipset,
> sold rebranded as the Redragon H510-PRO Wireless headset, reporting
> "XiiSound Technology Corporation" in its USB string descriptors)
> reports a constant value on GET_CUR for its PCM Playback Volume
> control while still supporting an actually tunable volume. This
> trips the sticky-value detection in check_sticky_volume_control(),
> which disables the mixer control entirely:
> 
>   usb 1-4: 5:0: sticky mixer values (0/100/1 => 80), disabling
> 
> As a result, the device boots with playback volume effectively muted
> and provides no way to raise it through the normal ALSA/PipeWire
> mixer path.
> 
> Apply QUIRK_FLAG_MIXER_GET_CUR_BROKEN so the sticky check marks the
> control as get_cur_broken and relies on the cached value instead of
> disabling the mixer control outright.
> 
> Tested by backporting this quirk flag and the supporting
> get_cur_broken logic onto a Linux 7.1.2-zen kernel build that does
> not yet carry it, and confirming that after applying the flag the
> kernel log changes from:
> 
>   usb 1-4: 5:0: sticky mixer values (0/100/1 => 80), disabling
> 
> to:
> 
>   usb 1-4: 5:0: broken mixer GET_CUR (0/100/1 => 80)
> 
> with the control usable via the driver's cached value afterward.
> 
> Signed-off-by: Agustin Luzardo <agustinluzardo09@gmail.com>

Applied this one now.  Thanks.


Takashi
