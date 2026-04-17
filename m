Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804025B31D
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441076; cv=none; b=IywFYcicVJP/ZpIlkas5d6VkKZ5CeV/Wbn/45W4bRlJpQ9EuhcImByRJwueAVr/ItRVnbNOWpdr9yo97Lm2BQCAKsyFzvrHZTVvdz3O6NtxuaI78eOYnDl2odGd5nfKxIwn9VCH2sIk1R+w9B8HKSI6NqSifcYpeoJkSc9F2plE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441076; c=relaxed/simple;
	bh=T0FRwStzRxXUxcm6AquGatQGBP6eOwg3O2CFB+8uaDE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sczG24IuIh4hWsqRAxyWVk6fn3OJwzVR5HcLgUl7SzaInjK7Ihz22tvTGQTseHGELz/v481BkzZ/rrCqgfKUn3pl4j0mxY8J8vNcw1xbmO86K1FRkxyc9xd2ZNCIiieTYUZZt4297y/BLxwKx2sCHMyFJ+EdMNHTQ7jdZDbGwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B687fScZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMBYm/Js; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B687fScZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMBYm/Js; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B687fScZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMBYm/Js";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B687fScZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMBYm/Js"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3BA5BD48;
	Fri, 17 Apr 2026 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK2dQ14HkhBTXc0zWJKthPZer0bFN5vwJWFsm1+kpQ0=;
	b=B687fScZ2hjcbAm5Io72Xq8iksuyo5kOiKmercTnf7BhYDpdPruPPwDlKbfSn9t+sIuc03
	23Awzd5G2qHFRoeUYfAl8+tZiF+lgQkAQFyxO/gSZKBlN72z1NQQJpODxkqepPpNM/2vDq
	0M09vSHPlUMB5j8OdCmD8xX7pgrTJXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK2dQ14HkhBTXc0zWJKthPZer0bFN5vwJWFsm1+kpQ0=;
	b=PMBYm/JshVnuX9Fc8BFvVISbiKY8YkTbBSTTv0DMnpD9lmcEvNbgdMS1KXHHHgd4vKc51V
	p+olSYbxmAo1CyDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B687fScZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="PMBYm/Js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776441073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK2dQ14HkhBTXc0zWJKthPZer0bFN5vwJWFsm1+kpQ0=;
	b=B687fScZ2hjcbAm5Io72Xq8iksuyo5kOiKmercTnf7BhYDpdPruPPwDlKbfSn9t+sIuc03
	23Awzd5G2qHFRoeUYfAl8+tZiF+lgQkAQFyxO/gSZKBlN72z1NQQJpODxkqepPpNM/2vDq
	0M09vSHPlUMB5j8OdCmD8xX7pgrTJXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776441073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK2dQ14HkhBTXc0zWJKthPZer0bFN5vwJWFsm1+kpQ0=;
	b=PMBYm/JshVnuX9Fc8BFvVISbiKY8YkTbBSTTv0DMnpD9lmcEvNbgdMS1KXHHHgd4vKc51V
	p+olSYbxmAo1CyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BED8593AE;
	Fri, 17 Apr 2026 15:51:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kstDEfFW4mmDdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 15:51:13 +0000
Date: Fri, 17 Apr 2026 17:51:12 +0200
Message-ID: <87se8td1qn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH v3] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
In-Reply-To: <20260417150748.6684-1-jpfuentealbabizama@gmail.com>
References: <87o6jido5j.wl-tiwai@suse.de>
	<20260417150748.6684-1-jpfuentealbabizama@gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 8A3BA5BD48
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 17 Apr 2026 17:07:48 +0200,
Juan Pablo Fuentealba Bizama wrote:
> 
> Hi Takashi,
> 
> I've been testing this patch on the actual hardware (SmartlinkTechnology M01, 301a:159b) with a custom compiled kernel, and unfortunately it seems to cause a regression.
> 
> While the device is correctly detected and appears in /proc/asound/cards, it fails to create any PCM capture device (it's not listed by arecord -l). Before the patch, the device worked, albeit with low volume. Now it seems the quirk is insufficient to enable audio capture on this specific device, effectively muting it.
> 
> Given this, could we please revert this patch for now? I can prepare the revert patch and send it as v4 if that's the correct procedure.

OK, then let's scratch for now.


Takashi
