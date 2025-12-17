Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47502836BE
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962425; cv=none; b=sdOsU/YQ/urEShnUGZXKYSX7tW48lSQZ9AvdLlIP0MbC4/GnWuF+D2BdI19LolxzVU8KX2scrJoF+Qh4tc15t6YF6joxF1iRsaecBog5iAIqT+vVOwcUDOok6UBEks3eXRkSYlTEaAQG5yFTKMgSLCCG9R9vJhLO/6k0R4ls51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962425; c=relaxed/simple;
	bh=0adw2LDv9cS1NkzjbRi+E18rfTCKBvEy0Tyy12/2VQY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5KssZZ6HkZTOK1/rGp/pWATwnWNvGqLged4X3g9UjKRlysBUE+3x2Dmm7eEDiv3Eakj0IRX6Z4N8hInKlzfNPFVtlKMV55xhC+IJVv4nuiDQ8vupi3TiO4uX1cZc0XRXvuxUPZZr5ygX1r6/+f67TK5BnWQIbd6APWV+HMtgGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nXGFkbF1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QnOnlmGZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TSsiEKGb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VoPSwhhl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nXGFkbF1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QnOnlmGZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TSsiEKGb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VoPSwhhl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB3EA5BCEC;
	Wed, 17 Dec 2025 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765962421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beJHZKAP723KFDrapzmo0H3kH1vjdxM+zE2kZ8ClXwg=;
	b=nXGFkbF1yJoGwvymaHsRaebLagF89lmdMnAxbUL4RnYY/1J471Ss8MzcD4YNBjYl+xfCKB
	QX+W6G6H827m+DvHwWT7MBrTj2I8zh7gQmqnZ+ibt6rBxk1CBRYzQZIKFQRpHioRflEopI
	bmDIsWq9AYw5a+HWq2pyB0Zzj75pk+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beJHZKAP723KFDrapzmo0H3kH1vjdxM+zE2kZ8ClXwg=;
	b=QnOnlmGZJ6pkm4PR+yLiqJ9aRdsHXEfUKeFWoY+uouBvpJ6UIZG/LGvKfCzeua2N/u1rPv
	QHwVVR+EKBHIKrBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TSsiEKGb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VoPSwhhl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765962419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beJHZKAP723KFDrapzmo0H3kH1vjdxM+zE2kZ8ClXwg=;
	b=TSsiEKGbQA8tdw79LnDOygQ7XYbb1S9JfzIwJ441MrdMkOXArfbvfN+rng3tF9ibiD+xiJ
	OgvnvtCLwGQA3qc09AirBnXlz36ffIr8YDFIWsrXtVVrPm0KASHJ+9S6joeRFwtVtwORzJ
	n9uYKgihdLPWVeOYMUgSqXsO1TTCr2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beJHZKAP723KFDrapzmo0H3kH1vjdxM+zE2kZ8ClXwg=;
	b=VoPSwhhlPA755CC/EF9WkrNClHAvJ9mb1K+XEoxOE1AZeo4X/V1chcR184x2TrYUyf3fYE
	f2Cas2MHlz5H5cBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8916C3EA65;
	Wed, 17 Dec 2025 09:06:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lf43ILNyQmmsUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Dec 2025 09:06:59 +0000
Date: Wed, 17 Dec 2025 10:06:59 +0100
Message-ID: <871pkteato.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirk Su <dirk.su@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix micmute LED reversed on HP Abe and Bantie
In-Reply-To: <20251217025257.44600-1-dirk.su@canonical.com>
References: <20251217025257.44600-1-dirk.su@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: CB3EA5BCEC
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 17 Dec 2025 03:52:44 +0100,
Dirk Su wrote:
> 
> Quirk ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO make mute/micmute LEDs
> on HP Abe and Bantie functional. But the micmute LED's function
> is reversed, LED will be on when Mic enabled and off when Mic
> disabled. Create a new function to fix the micmute LED reversed
> issue.
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

Applied now with Fixes tag.  Thanks.


Takashi
