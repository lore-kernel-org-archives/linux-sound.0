Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8904B221554
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759040991; cv=none; b=liuV9D/yasQwtI1q1a4HKIq8woRvc/dASBjaIOkWSlQHhexx3xJhDCpcAYMrVoS+kLnUOK5sha5AqA7F59/eguAURSFIQTYLjQCCCN4r5hs+OT+PvguZ3KMgiQBC/maw428dSp60S7YQxBC2+CnF9BfHtRAiYxGvMezs9a4c1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759040991; c=relaxed/simple;
	bh=hBE5n/dIhV0fhb+AaMeOO4UUmnzJsoNYDXdxRu6AARc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVLL+MBT0LgYT1ar1NCKNS+LH5bQKwhQYucIbodbH5tQvtZqEJTfmTYMH4dnfAMI8ZEXtmMTefe9tWG6hdzDcYuoLRDwkFjieGOW96LEkgEOhj2SjAmXbKqdAwHYyI0/Dm7LvKQK5jleGMarH2B5Do9MiLrIUGvHeF7yQNDJT/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+edKEJa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R6czpG1W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+edKEJa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R6czpG1W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+edKEJa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R6czpG1W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+edKEJa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R6czpG1W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAAA34ED00;
	Sun, 28 Sep 2025 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759040987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3El6M0yNj/K/wyfEbfxWxa3CoO1ZDauZZg0JaAFTwZ8=;
	b=X+edKEJaUCTvDsaziEFapKrjhxTFQJ+ErfJNHTQMAngRcWyYANohhLBNXWotZjyKoYsBlP
	K4hP3bD0YVWZpjrD0gFV78uz+OxCo9l0N/PY3lciY1XEtOmyosIjh+f+wT5L+vaputRakl
	uq8yF2lCgsalzZ34YNL+CzKuifuxR1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759040987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3El6M0yNj/K/wyfEbfxWxa3CoO1ZDauZZg0JaAFTwZ8=;
	b=R6czpG1W6anPOugSR5X2XmQciyMBczgFLMI/L/63DxY2oeYTzW+9Zhah0Ndm1VgXKgf3pH
	rWYFp3Kv5C8TiuAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X+edKEJa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R6czpG1W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759040987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3El6M0yNj/K/wyfEbfxWxa3CoO1ZDauZZg0JaAFTwZ8=;
	b=X+edKEJaUCTvDsaziEFapKrjhxTFQJ+ErfJNHTQMAngRcWyYANohhLBNXWotZjyKoYsBlP
	K4hP3bD0YVWZpjrD0gFV78uz+OxCo9l0N/PY3lciY1XEtOmyosIjh+f+wT5L+vaputRakl
	uq8yF2lCgsalzZ34YNL+CzKuifuxR1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759040987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3El6M0yNj/K/wyfEbfxWxa3CoO1ZDauZZg0JaAFTwZ8=;
	b=R6czpG1W6anPOugSR5X2XmQciyMBczgFLMI/L/63DxY2oeYTzW+9Zhah0Ndm1VgXKgf3pH
	rWYFp3Kv5C8TiuAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B91A613A3F;
	Sun, 28 Sep 2025 06:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LWXPK9vV2GgZGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Sep 2025 06:29:47 +0000
Date: Sun, 28 Sep 2025 08:29:47 +0200
Message-ID: <877bxj9jj8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio: add mono main switch to Presonus S1824c
In-Reply-To: <aNgCYm_b3IFmtbJ2@ark>
References: <aNgCYm_b3IFmtbJ2@ark>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-2.99)[99.93%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DAAA34ED00
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.50

On Sat, 27 Sep 2025 17:27:30 +0200,
Roy Vegard Ovesen wrote:
> 
> The 1824c does not have the A/B switch that the 1810c has,
> but instead it has a mono main switch that sums the two
> main output channels to mono.
> 
> Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>

Thanks, applied now.


Takashi
