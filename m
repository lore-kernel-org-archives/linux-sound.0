Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6993101B0
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873168; cv=none; b=gv2lYvjaGJtBIRdW5QElHgJ9f+viOkAk7oMLiHFHdp3BKHXVMTEwABDQDxdpHQSBxPGL2mpeQjtr+i1uZHO0NQuZBcsT+qgNMxzo1YJ+K5V8IwTOHVKyrurYikaBYbV1Q/Q4KQVagK8sxnu2OpBmekn48163UawHOEzgb5r/sMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873168; c=relaxed/simple;
	bh=Zdeq0plwQu1L8/mh+416BUPe+Ds15irxMlQco5kulkQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIIZ8QrCCvcbyVoxkqi2TMJnS0yXL3M+8CHWgjs+RGCb/i/codkfz3bKIKpyEOJPRNPg4hJogMjNLBapQhvdN/Yi1R3RI4uaJWBcxwNB3MWdQkbc71Lz7dJXjB5Af+E/1EparGSGut+D3ac1wOfk09PeVVje3LROeGHXcG4wSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yupRXuxN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wb2moRIX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yupRXuxN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wb2moRIX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yupRXuxN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wb2moRIX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yupRXuxN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wb2moRIX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D8E16A826;
	Wed, 22 Apr 2026 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776873166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZD5qyaLIgf0At3h4ghuakxTT2resPbom6PjdIQqTJ0=;
	b=yupRXuxN8iaILcHSk7KJCgWIBhNCOAaiOh/E+CQEwD9TsKXvqu4WQ3aSI+Ljmu0183E/2v
	PsyGrYHUIF40RMRwPZgD0NKUecDD2W6skUck4DSaG/dfYmwgR5UEABq9Fku6cs3G9PeFFP
	CQK8HlweKvmNkny7FF9Sh8ZTxB4AXHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776873166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZD5qyaLIgf0At3h4ghuakxTT2resPbom6PjdIQqTJ0=;
	b=wb2moRIXhlvMb/F2q1Pcc8LO7TnibMFEPLwxiB1WNl7l1KU/f/0zZSsSk/ALbLKUY0ldiM
	/ccjloHWTYkzhUAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776873166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZD5qyaLIgf0At3h4ghuakxTT2resPbom6PjdIQqTJ0=;
	b=yupRXuxN8iaILcHSk7KJCgWIBhNCOAaiOh/E+CQEwD9TsKXvqu4WQ3aSI+Ljmu0183E/2v
	PsyGrYHUIF40RMRwPZgD0NKUecDD2W6skUck4DSaG/dfYmwgR5UEABq9Fku6cs3G9PeFFP
	CQK8HlweKvmNkny7FF9Sh8ZTxB4AXHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776873166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZD5qyaLIgf0At3h4ghuakxTT2resPbom6PjdIQqTJ0=;
	b=wb2moRIXhlvMb/F2q1Pcc8LO7TnibMFEPLwxiB1WNl7l1KU/f/0zZSsSk/ALbLKUY0ldiM
	/ccjloHWTYkzhUAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE28A593AF;
	Wed, 22 Apr 2026 15:52:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tT6/LM3u6GnKOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Apr 2026 15:52:45 +0000
Date: Wed, 22 Apr 2026 17:52:45 +0200
Message-ID: <87ik9j3sc2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Sergiy Kovalchuk <cnb_zerg@yahoo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Avoid false E-MU sample-rate notifications
In-Reply-To: <20260421-alsa-emuusb-samplerate-notify-v1-1-8b63bbc1d7f1@gmail.com>
References: <20260421-alsa-emuusb-samplerate-notify-v1-1-8b63bbc1d7f1@gmail.com>
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,yahoo.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 22 Apr 2026 02:53:52 +0200,
Cássio Gabriel wrote:
> 
> snd_emuusb_set_samplerate() unconditionally notifies the E-MU
> SampleRate Extension Unit control after issuing SET_CUR.
> 
> If snd_usb_mixer_set_ctl_value() fails, the control value has not
> changed, yet snd_usb_mixer_notify_id() still invalidates the cache and
> emits a value-change event to userspace.
> 
> Notify the control only after a successful write.
> 
> Fixes: 7d2b451e65d2 ("ALSA: usb-audio - Added functionality for E-mu 0404USB/0202USB/TrackerPre")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied now.


Takashi
