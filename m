Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C76364942
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046006; cv=none; b=dI+Zxq7EyTUmVJPbUcB0u03npzqnQFf0mYqp0sql6qwSU/2TOQU6N/P0E28YwPgGvswtMaRISTFjUJNMuSWtJoqquAhYGvNu6V0XWslyA0l9/tX4saT4LsuO8PECuV5PJsNbBEaj7tqWDaZqbWYGuqxTvMI/Jqzpo0rOauk2bJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046006; c=relaxed/simple;
	bh=yYcxQimYqGuLHv4bfiQ3WSfgMeex8W8/pOXfses39zM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=np0qMIVEfoLgPPibG56Zv6gxPptuUObUFUWpZ6mCmb6JEQYRmkt2ujB6ZzPG6titIAQbiQUJlHBXIexMinjdBoV0Jz08gcprAfpUAwzV01dzi8h531rq6hArZBU2KBP9TpCIbrTMRZUXQck5kdJOZ4sga5JLTVenhw21PI1tqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KanUngoI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JhTaBe2s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=svmIdk8t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zbQIj1Pd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KanUngoI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JhTaBe2s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="svmIdk8t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zbQIj1Pd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0E68671CD;
	Fri, 29 May 2026 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780046002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ToL37xApIQQfT09/RmWeXO3HI4v6BETi0zrh/YH0Iw=;
	b=KanUngoItqWbcXOW4kIXHZaR7POZSHG6fKD3Kx8B+dcasXlBYvFfhDLojMHl0Z4yJzp54z
	XQx/FHi1Jdypn9PS5Jm/gPMMsKeHH+aqNgsJyfvTqIIlCmGjiwz5gsZL99x0PJTtcP89lX
	QEhnPt9XelWjLTi8wlw26DTpx3Ye5ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780046002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ToL37xApIQQfT09/RmWeXO3HI4v6BETi0zrh/YH0Iw=;
	b=JhTaBe2s7cLoUohGUGPNsQxJDFuAjzYA6fcj+vfnrugZJrszNK7ZHfKQlO1s+54DSS1v5E
	LqbFwhRH2CEDqaBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780046000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ToL37xApIQQfT09/RmWeXO3HI4v6BETi0zrh/YH0Iw=;
	b=svmIdk8tncWIbnx384ZNJ7cs7mZj1XAmaUilJRhn55rMcJnsob1+Jt7yAuDVJ6OhzbUTWe
	Yncxp7nIHmLsxlTAK6TRv5I9nKgjMtxBovThvj7zi9wvlcgDnBHpEVSaXvvt9IlxwhhHK3
	JiV5qUM5jxiDw7wBDQebRLOca4rK8E4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780046000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ToL37xApIQQfT09/RmWeXO3HI4v6BETi0zrh/YH0Iw=;
	b=zbQIj1PdmOpIotxZSjLu0mwAlKqsdZcL2C9ctoS/N9D956dLfbqAAbgirl7IUQcuA4lwr8
	82kNguVGNe8qxtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C65B5779A7;
	Fri, 29 May 2026 09:13:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RU8UL7BYGWr/QwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 May 2026 09:13:20 +0000
Date: Fri, 29 May 2026 11:13:20 +0200
Message-ID: <87wlwmr32n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steve Smith <tarkasteve@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
In-Reply-To: <CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
References: <CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,rong.moe:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Fri, 29 May 2026 07:21:27 +0200,
Steve Smith wrote:
> 
> 
> Hi,
> 
> I'm seeing a regression in the 7.1 series (including the latest RC)
> where the volume on my Edifier MF200 model EDF100038 (connected via
> USB) has extremely low volume; raising the volume to full makes it
> just audible.
> 
> I have bisected the issue down to a single commit:
> 
>     ❯ git bisect good
>     86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03 is the first bad commit
>     commit 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
>     Author: Rong Zhang <i@rong.moe>
>     Date:   Sat Apr 11 01:49:04 2026 +0800
> 
>         ALSA: usb-audio: Do not expose sticky mixers
> 
>         Some devices' mixers are sticky, which accept SET_CUR but do
> absolutely
>         nothing. Registering these mixers confuses userspace and results in
>         ineffective volume control.
> 
>         Check if a mixer is sticky by setting the volume to the maximum or
>         minimum value and checking for effectiveness afterward. Prevent the
>         mixer from being registered if it turns out to be sticky.
> 
>         Quirky device sample:
> 
>           usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01,
> bcdDevice= 1.00
>           usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>           usb 7-1: Product: Feaulle Rainbow
>           usb 7-1: Manufacturer: Generic
>           usb 7-1: SerialNumber: 20210726905926
>           (Mic Capture Volume)
> 
>         Signed-off-by: Rong Zhang <i@rong.moe>
>         Link: 
> https://patch.msgid.link/20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe
>         Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
>      sound/usb/mixer.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>      1 file changed, 45 insertions(+), 3 deletions(-)
> 
> Additional device information:
(snip)

Looking through the log, I couldn't fine the error message like
"xx:xx: sticky mixer values ...".  Can you confirm that?

If the error message really doesn't appear, it means that the sticky
volume check itself passed, but the patch caused some other
side-effect.  Does the patch below have any influence?

Anyway, Rong, please check this in your side, too.


thanks,

Takashi

--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1364,7 +1364,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		if (cval->res == 0)
 			cval->res = 1;
 
-		if (cval->min < cval->max) {
+		if (cval->min + cval->res < cval->max) {
 			int saved;
 
 			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
