Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7B28852E
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452761; cv=none; b=W9pxkVBhWXTiqBnuDhmt3gJg4Wovot2gTV6WUcc+68F3BL/5n7TYCEcY958X1vgTWl+JDfgLFF1uMb7iY5yqGBOugADAkmD+DKQlGXlcDf5zOy6Tzlw11jyQmmUSgeAMBQaLBws771V9wrp6c3A1Julbwblsm5X/4sTijooyHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452761; c=relaxed/simple;
	bh=Lmc19pAF3HbpVtZduF7eUZIrx2E3zuImy90UdCWbdVo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LiSJeBF0pdaeOor301w81SY1/EUqsClApZyo3fGPK/m4pSwMokRte0DZYusCler/JwSxsZIk19h7RpQh2SPt3hVl/aVVSvv2CR6O5S79AugvTFQYEHPIeFwo+IfaL1c2g3jHsRs5O1/tSx6aLvSQPF0WYPWH15KaIa5i+6SP5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PidvfcUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4GhwS4xf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D6B7hVSO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4h+6ZY0v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PidvfcUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4GhwS4xf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6B7hVSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4h+6ZY0v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDF8671F23;
	Fri, 26 Jun 2026 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vZR3DA9RCL5s1W4l2HlOYbwtCjsGgK5/XhoXoe4WEg=;
	b=PidvfcUQbvvjGE2ZIoXf3yxyx5zQxQth/JbYd7DNQKSVSTSFonLk2qUL+4WWzshtNEoBTn
	nciU70BYvOIMdH5LoewEv3V9ddXL0MAU0oax44Uvv2WcXjpwYxP3l1VIEbd+8Yp1KXwB8q
	rIAJBOQlftA+66bZNGGEUkAqs84jAdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vZR3DA9RCL5s1W4l2HlOYbwtCjsGgK5/XhoXoe4WEg=;
	b=4GhwS4xf833T0qe2nqqZdEpa9Y5HPTI+PnI0a83nvt4R5pfQ0nxO8Npf4eA/UN0spXtE5F
	S8IdLMCUTVOD0AAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D6B7hVSO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4h+6ZY0v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vZR3DA9RCL5s1W4l2HlOYbwtCjsGgK5/XhoXoe4WEg=;
	b=D6B7hVSO5Yipv2nz8L6sk699lxnoH1aEQJ8U8LxT80OKmQd8dXeqU7Fyq1jRa0nbdFz7O7
	0aj4hKoazHA2jeXr+blWvTLG8/Ja1O5Mqmnh4dIcPw+JSsQ5dX7Ghx8jb58eAzY4zz/1Fs
	UNo0YCBOywgaULd/ww8FYCoTKWgVPSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vZR3DA9RCL5s1W4l2HlOYbwtCjsGgK5/XhoXoe4WEg=;
	b=4h+6ZY0vyhGPTsC8DedT3yodVqgqQ8+9PF+3jZCjDfygbNg4/dBjz6yL0xJahCRBs54x8l
	Zu61DjAlzWPALABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B75FC779A8;
	Fri, 26 Jun 2026 05:45:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GO+0KhUSPmqeawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jun 2026 05:45:57 +0000
Date: Fri, 26 Jun 2026 07:45:57 +0200
Message-ID: <87o6gxua5m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oleg4260 <oleg.kucheryavenko2018@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/realtek: Update Acer Nitro ANV15-41 quirk to enable mute LED
In-Reply-To: <20260625134955.27465-1-oleg.kucheryavenko2018@gmail.com>
References: <20260625134955.27465-1-oleg.kucheryavenko2018@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DDF8671F23
X-Spam-Score: -3.51

On Thu, 25 Jun 2026 15:49:55 +0200,
Oleg4260 wrote:
> 
> From: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>
> 
> The laptop has a microphone mute LED on the F4 key, but it was not taken in mind when the previous quirk was added 
> in commit 00e44a68efef50f65b12854b41f098b4d50f10be ("ALSA: hda/realtek: Add quirk for Acer Nitro ANV15-41").
> Replace ALC2XX_FIXUP_HEADSET_MIC with ALC245_FIXUP_ACER_MICMUTE_LED, which enables the LED and chains the previous quirk for the headset microphone.
> 
> Signed-off-by: Oleg Kucheryavenko <oleg.kucheryavenko2018@gmail.com>

Applied with a proper Fixes tag now.


thanks,

Takashi
