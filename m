Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814916419
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545748; cv=none; b=gHKOdIIEj2iXF6wj44qmdw0tL1zuj8OHb1pSWQ3jXUNdsAdLYrXsjCdtKzzLf1yRXcO93k7s6zb9e7DdfcNMfs4dRwEa2xOV4bPYWBGEiX5UzrLtoQTXi9h5j/HbE/6uP2Egd4qB8YtZlb4S3qIpn67kOwoLagu1b1rUr6H61wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545748; c=relaxed/simple;
	bh=m9T4IGlvQhm/+F0IKlw4XckrYCPgWa9ebpjwlQFm/Dk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKR5bCvyDVOkVxwIUn2NWakcyjcKtuEkzdYaiRK0fJE6tll4TJNvkMjtEZg76HHvYR9nnhtPNR09r8yc02P6tzTPzK6NodnJ+aRm+CJAyE1YNN7zY7Zb/uG1V0yo5BcDLvm5vhJXIT4UkiZVSr5qG7PB7zeimlDAY+dKNcgfpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUquDLtW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4zMySE9c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sQfkw85V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CAGwhglr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUquDLtW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4zMySE9c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sQfkw85V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CAGwhglr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDBCB21114;
	Mon, 25 Nov 2024 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732545744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK6vybVGWCHGFcuj3X2kfymgXLxTqeKt9NKsWibrygk=;
	b=RUquDLtWULIFsaMQMAIHERLnDrqOa3iRxPp1eVD+hHT8/cYzwP3gwBw7xXUuRw2YzY50FY
	6/ruwoEd3iD4xMZaadpiUucwqk8jb1bW18gFNoFpQeqz1FFuCkhMrhS+pUZqzaoKAu9uVM
	Qjv/8/f24JnVoQUbycgLsGTO7ju/Z2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732545744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK6vybVGWCHGFcuj3X2kfymgXLxTqeKt9NKsWibrygk=;
	b=4zMySE9cTRVEbIcHj+m+cBUF74SfEp1jpf+SGEHemoRoppDAmGYDHKPBPTpL/LEGfpioic
	pPfdv0V7clbtBxBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sQfkw85V;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CAGwhglr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732545743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK6vybVGWCHGFcuj3X2kfymgXLxTqeKt9NKsWibrygk=;
	b=sQfkw85Vi8wuwuxNRFaMMergg8JdK88Ibn3S+mm8rb63a8/VA57ayMXbAY0xeo8x5aaZOD
	WVY0il7lf1ffgGru7i0I+T+PLogqfs9qc7Cbv9+KJF+d8NGjpHaAVWg/t/rIANsUFnstEI
	rh0dLtd8Z6E5uSUSjKpDn9cuFKa+sIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732545743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK6vybVGWCHGFcuj3X2kfymgXLxTqeKt9NKsWibrygk=;
	b=CAGwhglruz/vuezMkmmFQmt/W4kVf6B9DKCi/GZ+zlgcTHv5f4aa0MjyhMfu90SHQfR+Si
	p1hsspT1TUGUxSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFA70137D4;
	Mon, 25 Nov 2024 14:42:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DAWmKc+MRGf+TAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 14:42:23 +0000
Date: Mon, 25 Nov 2024 15:42:23 +0100
Message-ID: <87wmgrxtm8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dinesh Kumar <desikumar81@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix Internal Speaker and Mic boost of Infinix Y4 Max
In-Reply-To: <20241125092842.13208-1-desikumar81@gmail.com>
References: <20241125092842.13208-1-desikumar81@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CDBCB21114
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.50
X-Spam-Flag: NO

On Mon, 25 Nov 2024 10:28:42 +0100,
Dinesh Kumar wrote:
> 
> Internal Speaker of Infinix Y4 Max remains muted due to incorrect
> Pin configuration, and the Internal Mic records high noise. This patch
> corrects the Pin configuration for the Internal Speaker and limits
> the Internal Mic boost.
> HW Probe for device: https://linux-hardware.org/?probe=6d4386c347
> Test: Internal Speaker works fine, Mic has low noise.
> 
> Signed-off-by: Dinesh Kumar <desikumar81@gmail.com>

Applied now.  Thanks.


Takashi
