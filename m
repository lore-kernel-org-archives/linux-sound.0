Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A635DA64
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150465; cv=none; b=NF3Lqg73ZteTEbteoK2CdzyMZGhJc9/JMInm9Cio0OE8Zf9AzdyhrjYOWezxNZyStqgn6oHUqzYQOo9IzYzqxDMhebo75obU8nSNSvsLOxJ4sJiL8AgUu4yL1EK26A4tqv7xxjyJQnsIuROIAKNsSWNHDKvWnZm/1bCgx97JJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150465; c=relaxed/simple;
	bh=17fnmFc4jdvg9V0Qi2i0MhjKYlc9Kg4MbfABRJgy/D0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiWD5hIOL73WCFGrj58kHPIJxRdDa78v9oxOxXlPHBxOSlziDNeoDX8hQt516401MSx+Olb8fPlEFxWqqVBD+wSW3nQMB3bgTll03TIXXcuwCJNRm/glq+vif5I+x4eT/HPUlVrnJHMqqcaS6AGwH0f5R4RHo1RuhQUprpbiNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qoGxLiuA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GcGYjp0e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dV/9wFkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=08vNQol/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qoGxLiuA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GcGYjp0e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dV/9wFkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="08vNQol/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D345A6A95E;
	Tue, 14 Apr 2026 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776150463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G+aFkG6+Is2TkI9tX5v75YLKykLj+nhm/R4eIVJCqw=;
	b=qoGxLiuAZCimSq3q0O6F3DFLiEwgse8v3txDiCg7y4Wb7JhyZg3l7pBmpTw6wxed7CEYw/
	7jxRKqHw4SYEBXlXQzxDc3ibg0UONPJG5/nDX9fLum46ASnAq+PEOtctITmWWwnTdMh1sa
	MxdgxvGd0Fbuof/l6vbkrNUvPReDkqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776150463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G+aFkG6+Is2TkI9tX5v75YLKykLj+nhm/R4eIVJCqw=;
	b=GcGYjp0eSbHnijBGaKsr31UvBWj2hfsMKFk+Jg7xz4BaN+mY/8Nv1qi81lpRZ7H83TUFm4
	bMKYarn6FU+XBfAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dV/9wFkp";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="08vNQol/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776150462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G+aFkG6+Is2TkI9tX5v75YLKykLj+nhm/R4eIVJCqw=;
	b=dV/9wFkphrqCZw0dfedObSwQCeyolm9JV/f6GjNrtb1gXw9lAVsaImL504CVYkdMp9lpr5
	Mi75d1SoavO6uvOL2Q+kCzjkef3rG+Sz3JERNNjnEFCdt4NKONGo4VtENNfsUAdUzL0+pg
	Lpxk5wLUKrMDGQyg2HnaEZZPS7ONcUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776150462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G+aFkG6+Is2TkI9tX5v75YLKykLj+nhm/R4eIVJCqw=;
	b=08vNQol/8LRfXVxIcX/6zaDvFgmlwChvvVmWC/f4YbNF0IZh7Ey8E5D1oDg7TJy0droWlZ
	DIA3AOTi5srOqVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8D6A4B302;
	Tue, 14 Apr 2026 07:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gN8LKL7n3Wm8PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 07:07:42 +0000
Date: Tue, 14 Apr 2026 09:07:42 +0200
Message-ID: <877bqat3y9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
In-Reply-To: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
References: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D345A6A95E

On Mon, 13 Apr 2026 21:45:34 +0200,
Cássio Gabriel wrote:
> 
> snd-miro has no PM callbacks, so system resume leaves the OPTi
> master-control registers and the board-specific ACI mixer state
> unrestored.
> 
> Like snd-opti9xx, the driver needs to reprogram the OPTi routing
> registers before bringing the codec back. snd-miro also keeps mixer
> state in the ACI block, so the codec resume callback alone is not
> enough here. Save the ACI mixer state on suspend, reinitialize the
> OPTi and ACI state on resume, replay the saved ACI values, and then
> resume the WSS codec. Hook the PM handlers into both the ISA and PnP
> paths.
> 
> Also initialize miro->card on the ISA path for the existing dev_*()
> logging and keep the cached solo-mode value aligned with the value
> written to hardware.
> 
> PCM20 radio tuner state remains outside this driver's PM scope.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

As it's no trivial change and we are already in the merge window, I'd
postpone this for 7.2.  Or, if this is the very last piece of your
whole changes, I can try to put.  Let me know.


thanks,

Takashi
