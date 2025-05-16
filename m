Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CF8214205
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387946; cv=none; b=ceSPlD37gFK9kV9HPtjjT8pKuG55OGKp04+ADq6r+K3muH7hMUdYOcG2CY/4vrZBV7ZhSdnkPPxIlD3f6nkBciQejSbGctdSS4vQ3cR6D6J0zFLTgwVjORWVSfPuHST09a637NCjdzZeW8xRxdMiWlYsgHKUGdIAJWYW2ge5C5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387946; c=relaxed/simple;
	bh=fYj5ATPwN2uCV3Mym4UJmDS5KK0YwTiYarQARM3PkmE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OneEm8RVg0+EhAp0W6pImBhAFpQUoeDF1MLO86hEbloQiPmXO+ObFA76VstSs70BO69oZjfXeNeOq2haAiqKjhTmQe9Vgz1cOdTbSaiP5oj88h2JgeqTH9XyY9vce7spqDzCBmF9iO3mjrYj5hq2O2yEdl9B+hp3Mx6VcW73s3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M1qRPx/W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7OelxXNx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M1qRPx/W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7OelxXNx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1qRPx/W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OelxXNx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1qRPx/W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OelxXNx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EF9B1F7F0;
	Fri, 16 May 2025 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747387943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hVhRgD9bjIp4r09bmwmMwH2vSQ5VkiPWbgxMV/P0l48=;
	b=M1qRPx/WAIwnntsX+8MDkesZ67IOJGqJIs2cApUGI8pzryDh3LWLrNQsTzjTptU8FzaFKt
	uNfv3HX7GqhSyr19bgXPAMKY1KLnUrUtRuvfBtD6r0vKbT6NqYQqsf/bE2UEGf76pr3SRe
	tJ/8MFA0pKSqmdVLhaLz9WyC1JFAue8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747387943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hVhRgD9bjIp4r09bmwmMwH2vSQ5VkiPWbgxMV/P0l48=;
	b=7OelxXNxRrq0vxZUrPbMzEM+Ig07/MBWjY8TthuDt43Eiq0/LY6jx/CIrxa/U0bC7Hu5/N
	pa/hSgu15bxZ4bBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="M1qRPx/W";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7OelxXNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747387943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hVhRgD9bjIp4r09bmwmMwH2vSQ5VkiPWbgxMV/P0l48=;
	b=M1qRPx/WAIwnntsX+8MDkesZ67IOJGqJIs2cApUGI8pzryDh3LWLrNQsTzjTptU8FzaFKt
	uNfv3HX7GqhSyr19bgXPAMKY1KLnUrUtRuvfBtD6r0vKbT6NqYQqsf/bE2UEGf76pr3SRe
	tJ/8MFA0pKSqmdVLhaLz9WyC1JFAue8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747387943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hVhRgD9bjIp4r09bmwmMwH2vSQ5VkiPWbgxMV/P0l48=;
	b=7OelxXNxRrq0vxZUrPbMzEM+Ig07/MBWjY8TthuDt43Eiq0/LY6jx/CIrxa/U0bC7Hu5/N
	pa/hSgu15bxZ4bBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D67D313977;
	Fri, 16 May 2025 09:32:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id waATMyYGJ2i0bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 09:32:22 +0000
Date: Fri, 16 May 2025 11:32:22 +0200
Message-ID: <87ecwolx3t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: restore auto-mute mode for Dell Chrome platform
In-Reply-To: <ee8bbe5236464c369719d96269ba8ef8@realtek.com>
References: <ee8bbe5236464c369719d96269ba8ef8@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0EF9B1F7F0
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Score: -3.51

On Fri, 16 May 2025 11:21:24 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was approved by Google guy.

Applied now.  Thanks.


Takashi
