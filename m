Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC9237713
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158689; cv=none; b=Re/B8y62OOCiOhKWW6mraJw7S7jrhBF47b2KrfWTOGhNj+GRjPGnRq7vnXcwyzfSclepoHzKvicSkYKI2I95R7WWVpahAV8j0bVnhZsWUDBSEGyJMD7rV1sK198GsApBEHfW3hB+KK7j5tCM2KGCm4fRNyo8G6BvB+LWleSvQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158689; c=relaxed/simple;
	bh=1HgZ50D7h4TJe28rdGggnPyoweyr9+hmfBbQQVFJWCQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ps68nHYjIlYW5YDaOeXUhhS4T61ROFkqi59EDnqIg4tNMad3B7crAKJDEoypqLouLyyqMsPmnEikm42RmsQLrL2IO5p0KA1bZJZH+Kwi7fcE/D73pvf7mwt+0YVs5wdLVlw8PGEZriq7gIvc6cGxRW6Cx41ZJsEn4O7rVy7B+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qgX1Y1yd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7B83YmdJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=srluKGeo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wke9PSyG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qgX1Y1yd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7B83YmdJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="srluKGeo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wke9PSyG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FCE06A9A0;
	Tue, 14 Apr 2026 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776158686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZC4Vkvi/lIoQUIYpSeBRw1FP3f3AKNwLiR4oe1L0/f8=;
	b=qgX1Y1ydT4vFNBp0rujuDOjWdPdsqkTZvtRHZUKCTEKZQmQbfhQlWYczRSL0Psdi+oWp7D
	qp0mGjST2CE9cIgbXfdePsW1RmEBJbUJZBP4vYdLEK0GuhniR9OFVcC66mAw2TKF3HcGqb
	JnJSgIbweRKRdxxE/cKn44uBQY2LrVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776158686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZC4Vkvi/lIoQUIYpSeBRw1FP3f3AKNwLiR4oe1L0/f8=;
	b=7B83YmdJ+/5oFicQc/sQNcE+kxYNU56sotiRVlYOinWOHrqIMkdBjnqRkP1hd6FFfb+uGi
	owip0BbrykAiHWAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=srluKGeo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wke9PSyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776158685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZC4Vkvi/lIoQUIYpSeBRw1FP3f3AKNwLiR4oe1L0/f8=;
	b=srluKGeo973bhmeP/7xtAozqv25uD029K0eTh92NqwcypxkBxDjRpZbiIbtoGV57S0smtQ
	nAk3G/r57CshDv2khIulcOA1FCbs1pAhh9/9Qmp2cmMeCV+yj3MMv3WbOVQm4s7TusbvBx
	ewYn0D9Q4C0g8acSZfBBMlsWUotJLKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776158685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZC4Vkvi/lIoQUIYpSeBRw1FP3f3AKNwLiR4oe1L0/f8=;
	b=Wke9PSyG0HMBLWTo28jczL+W1I5t3gsgHZf9MPWEX+FDis4sQjAEBhvBj+aCKB9Lns4l2o
	ar2gYNTWXFy3fiCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6172D4B38D;
	Tue, 14 Apr 2026 09:24:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qj8yFt0H3mkgSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 09:24:45 +0000
Date: Tue, 14 Apr 2026 11:24:45 +0200
Message-ID: <87o6jlsxlu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <error27@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	linux-sound@vger.kernel.org
Subject: Re: [bug report] ALSA: usb-audio: Add error checks against get_min_max*()
In-Reply-To: <ad36dGpCBTGsyFr_@stanley.mountain>
References: <ad36dGpCBTGsyFr_@stanley.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7FCE06A9A0

On Tue, 14 Apr 2026 10:27:32 +0200,
Dan Carpenter wrote:
> 
> Hello Rong Zhang,
> 
> Commit 4f55a85cd4fc ("ALSA: usb-audio: Add error checks against
> get_min_max*()") from Apr 11, 2026 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	sound/usb/mixer.c:2711 build_audio_procunit()
> 	error: uninitialized symbol 'err'.
> 
> sound/usb/mixer.c
>     2660                 if (state->mixer->protocol > UAC_VERSION_1 &&
>     2661                     !uac_v2v3_control_is_writeable(controls[valinfo->control / 8],
>     2662                                                    valinfo->control))
>     2663                         cval->master_readonly = 1;
>     2664 
>     2665                 /* get min/max values */
>     2666                 switch (type) {
>     2667                 case UAC_PROCESS_UP_DOWNMIX: {
>     2668                         bool mode_sel = false;
>     2669 
>     2670                         switch (state->mixer->protocol) {
>     2671                         case UAC_VERSION_1:
>     2672                         case UAC_VERSION_2:
>     2673                         default:
>     2674                                 if (cval->control == UAC_UD_MODE_SELECT)
>     2675                                         mode_sel = true;
>     2676                                 break;
>     2677                         case UAC_VERSION_3:
>     2678                                 if (cval->control == UAC3_UD_MODE_SELECT)
>     2679                                         mode_sel = true;
>     2680                                 break;
>     2681                         }
>     2682 
>     2683                         if (mode_sel) {
>     2684                                 __u8 *control_spec = uac_processing_unit_specific(desc,
>     2685                                                                 state->mixer->protocol);
>     2686                                 cval->min = 1;
>     2687                                 cval->max = control_spec[0];
>     2688                                 cval->res = 1;
>     2689                                 cval->initialized = 1;
>     2690                                 break;
> 
> err not initialized at this break.

Thanks for the report.  Let's plug the hole with a simple fix to add
"err = 0" here.

I'm going to submit a fix patch.


Takashi
