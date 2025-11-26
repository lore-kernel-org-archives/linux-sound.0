Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68228B40E
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143614; cv=none; b=Zo/DCsAyNyhjrE/HWJ9Ps8wCWKJ0UT5rKNKZGkHT5c/eh45k8OkEvpYy+SfgaiRkX+jA+LpyBIe+ymiSYakg33Tp2JoVoGFvWFtTY++ZUgc2YG6n0+GVvI33jqCnnEnCq0Q0ivrwFoe6U4Pzm2NLLz0xQPBJaAeQskyUvRftGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143614; c=relaxed/simple;
	bh=9ptEpbDwGp4JEnRoCTxW7v27lj7VGVBywGJUGoQVcf4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btbXaR2GKehjlrGCX3grty4Qhf2uj34zoJ18tM/oWZOquAWmH3Hn6I7axvZ+gfUk/dbO/8QFxJPOky3Xc+LgP4wrK6HSyOgMsf1x9O5C6LIjuT+95uAIRrzYQTlwwm7DLEekpMhT6cRspm/7GnuiznSz2EdCX6jR8hIEl2zRQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t+tztZrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z16xvWk9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t+tztZrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z16xvWk9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t+tztZrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z16xvWk9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t+tztZrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z16xvWk9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 664B722C94;
	Wed, 26 Nov 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=t+tztZrSULWZwIAl+JiVg5WahlYjJJ8Z7oB4pylvjq0RIb55xhACcsS3/W6gcqTOg0EGiB
	kQsGd4WEZGxwjzUQvGenL0KCOgLnNfJoAXfHpDinrY8TGakrSTmqdBIYw3q40Jjz3FC0sa
	tD37b+tHzBdSbWzRl4MfRo9F7DdoITM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=z16xvWk9eHzsOVqgb3fMWmJyo6x3c8pvE6fQX5tcxAKkUju1rsS6RCc5WY1b019gX+HjuR
	d6UdSZXLecmyrMDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=t+tztZrS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z16xvWk9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=t+tztZrSULWZwIAl+JiVg5WahlYjJJ8Z7oB4pylvjq0RIb55xhACcsS3/W6gcqTOg0EGiB
	kQsGd4WEZGxwjzUQvGenL0KCOgLnNfJoAXfHpDinrY8TGakrSTmqdBIYw3q40Jjz3FC0sa
	tD37b+tHzBdSbWzRl4MfRo9F7DdoITM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHv5zIufOQb/6f0wW77owTuggEDwsY4q7diOAajEiCI=;
	b=z16xvWk9eHzsOVqgb3fMWmJyo6x3c8pvE6fQX5tcxAKkUju1rsS6RCc5WY1b019gX+HjuR
	d6UdSZXLecmyrMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3800E3EA63;
	Wed, 26 Nov 2025 07:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iKP8C/qxJmkrNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 07:53:30 +0000
Date: Wed, 26 Nov 2025 08:53:29 +0100
Message-ID: <871pllcjra.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Mute LED for HP platform
In-Reply-To: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
References: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 664B722C94
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 26 Nov 2025 06:50:09 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was enable mute led functions.

Applied to for-next branch now.


thanks,

Takashi
