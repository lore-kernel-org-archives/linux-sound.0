Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEFF39DBC4
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737707; cv=none; b=rakxfmsHXjcvSwAMg9Ix75YiqDaapeeT8/FhYpRqcapvsyiR1+Cph+z3S+AM/R4Sx7CfXIktDUiToQK4evNDwg8QYAeu1dY6kH7gO8PvPYQagQZP4I120QRKL7MWYLOBv27svaklwVLyD4B7avQEP//76IZCEdgg6FV89GhV+FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737707; c=relaxed/simple;
	bh=O5+1XHAQ7r+TwG2DRgK1f4ptbddHtZZ4lZeLyi9kRB0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8qQsqB6TQqEqDZxOJomWJI6tUP0eYgYz1i6QOtYje6V6jCJkYHW9WLfVwnQ2bNeD6o6fKtqngZCa2rUinPHi5KsqkLD8ui3NDPf+gv9Uh/bDgpPr4zjiAet7F8majCn148qSGtAD9hetBQlC75c5qAVZc/zDoHviG+3hVQsI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=INDK25WY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YuC5y5Nd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=INDK25WY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YuC5y5Nd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="INDK25WY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YuC5y5Nd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="INDK25WY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YuC5y5Nd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C5214D240;
	Tue, 17 Mar 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773737703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/Te096J/DbSXO6ct+PGhiTw106kUuvymO6tyZ+73gs=;
	b=INDK25WYQ+4X7qZr2eSirFwoMRNzQ8Ha5LV2N3HAVk69BA2b82VU+eyH1UjTn1g1leAbU1
	p8HZKrecj8RTniB/QbNKscU0rkwGtBMmIXNkeCbZTx9IVIsv0KxC252gbTarSj1V54JSms
	HggEQXFOaovba22+IMVlTVQiGd8SxlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773737703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/Te096J/DbSXO6ct+PGhiTw106kUuvymO6tyZ+73gs=;
	b=YuC5y5Nd2BOa8ipRREVEnN5CVBx27OYiy+MS7HIKZ/LBOKBclIV6/wk1lRBnVTx3j7bWDf
	NlASyiFJUrD4yUAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=INDK25WY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YuC5y5Nd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773737703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/Te096J/DbSXO6ct+PGhiTw106kUuvymO6tyZ+73gs=;
	b=INDK25WYQ+4X7qZr2eSirFwoMRNzQ8Ha5LV2N3HAVk69BA2b82VU+eyH1UjTn1g1leAbU1
	p8HZKrecj8RTniB/QbNKscU0rkwGtBMmIXNkeCbZTx9IVIsv0KxC252gbTarSj1V54JSms
	HggEQXFOaovba22+IMVlTVQiGd8SxlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773737703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/Te096J/DbSXO6ct+PGhiTw106kUuvymO6tyZ+73gs=;
	b=YuC5y5Nd2BOa8ipRREVEnN5CVBx27OYiy+MS7HIKZ/LBOKBclIV6/wk1lRBnVTx3j7bWDf
	NlASyiFJUrD4yUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECD574273B;
	Tue, 17 Mar 2026 08:55:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OPcqOOYWuWlrBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Mar 2026 08:55:02 +0000
Date: Tue, 17 Mar 2026 09:55:02 +0100
Message-ID: <87a4w6g7ix.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexey Nepomnyashih <sdl@nppct.ru>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-lib: fix uninitialized local variable
In-Reply-To: <20260316191824.83249-1-sdl@nppct.ru>
References: <20260316191824.83249-1-sdl@nppct.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 3C5214D240
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 16 Mar 2026 20:18:22 +0100,
Alexey Nepomnyashih wrote:
> 
> Similar to commit d8dc8720468a ("ALSA: firewire-lib: fix uninitialized
> local variable"), the local variable `curr_cycle_time` in
> process_rx_packets() is declared without initialization.
> 
> When the tracepoint event is not probed, the variable may appear to be
> used without being initialized. In practice the value is only relevant
> when the tracepoint is enabled, however initializing it avoids potential
> use of an uninitialized value and improves code safety.
> 
> Initialize `curr_cycle_time` to zero.
> 
> Fixes: fef4e61b0b76 ("ALSA: firewire-lib: extend tracepoints event including CYCLE_TIME of 1394 OHCI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>

Applied now.  Thanks.


Takashi
