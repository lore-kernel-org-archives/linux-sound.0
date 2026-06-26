Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD873CF054
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452860; cv=none; b=ZwbGzx65Ck4iP2haT00C0wEiNDFiFQ83H6aJZrc8WkrZGTLO8hrLpp/09lpcsal9JTGc3QQyrnPZjhWoldou5RcqqohhxguQwL5QYIpLeOcUIv3jrx+lrW4YHDDHOhR2V07fBXtZyzaXhxWOFtcAaHh9+b8lFWRzMqTngnFp3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452860; c=relaxed/simple;
	bh=dpI10ApiFkDmnpI6ZGNO5F6+76av+swp958FRthSfME=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc6s1KWz6tCJr+3ZhJdWRzI3bXWlbJcpbi91T/bVUCnUyUr8CSpB7ksEiD6/RT5h2PD0u6tXtn4e+GDEZ8vmJod8/Cw62VaMY6P+5dV1Qc32cPBv96vGi5AIa/mVC8Q8Y24yveFbeIiyI+CaeRKF+5MUI1G/cow/lHu/3lyIObI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pashZDLL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a8xJesiV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CejwR70B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9Puc2iad; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pashZDLL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a8xJesiV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CejwR70B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Puc2iad"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C678A75ADA;
	Fri, 26 Jun 2026 05:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUL8ApU2vmjfE1m1qWRE++F7wRZC2MgWcLxa1AYCmo4=;
	b=pashZDLLAFWOJjQrYpnTN3Xcmp4zQJN0f5acfPWDNWx9DnZMv0EhQIiobOENqKBX7FbiIM
	6THZtfHuxlByYC7nfTY1Rz1FnJUFwkImlwCb4tFWwETzrKEYSXrRleSBwr0f/M5TZb1B9u
	eZn24p6bLnmN3krzSb5PUZUNEzPR2h0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUL8ApU2vmjfE1m1qWRE++F7wRZC2MgWcLxa1AYCmo4=;
	b=a8xJesiVvAYQro1DivowOAjsE+g9LPtRMsfBpf3a8bI0XGXb+pWMmfo4j2NWaRYWlmfHaJ
	5DEry57g772TbjAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CejwR70B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9Puc2iad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUL8ApU2vmjfE1m1qWRE++F7wRZC2MgWcLxa1AYCmo4=;
	b=CejwR70BrEY1m1ua+lv2ogNcAyKvJjaZoVRGD/a4NQ5RiWKirnSpg6bVtOhRdzm9rPKgWB
	dEuTIVHefiL/1atgG7Hh0rT54mPtKRLXoPDmxU2+qE+UI0qVPonLbixy0T200eUR5E1HnH
	o8wDSZyTranRRrUxpxWVziO25vi48QU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUL8ApU2vmjfE1m1qWRE++F7wRZC2MgWcLxa1AYCmo4=;
	b=9Puc2iadXP9xaokIQ0mv2HlXZ/9OcAos+lzoWTR5f1sCtojIM5ok/78YHuKvIIF+IOw1vi
	O+AmjuKbnXXCu5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E609779A8;
	Fri, 26 Jun 2026 05:47:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4DqOHXcSPmogbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jun 2026 05:47:35 +0000
Date: Fri, 26 Jun 2026 07:47:35 +0200
Message-ID: <87mrwhua2w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiaming Zhang <r772577952@gmail.com>
Cc: tiwai@suse.de,
	g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller@googlegroups.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: FCP: Fix NULL pointer dereference in interface lookup
In-Reply-To: <20260625134933.425785-1-r772577952@gmail.com>
References: <87echuvo7x.wl-tiwai@suse.de>
	<20260625134933.425785-1-r772577952@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C678A75ADA
X-Spam-Score: -3.51

On Thu, 25 Jun 2026 15:49:33 +0200,
Jiaming Zhang wrote:
> 
> A malformed USB device can provide a vendor-specific interface without
> any endpoint descriptors. fcp_find_fc_interface() currently selects the
> first vendor-specific interface and reads endpoint 0 from it, without
> checking whether the interface actually has any endpoints.
> 
> When bNumEndpoints is zero, no endpoint array is allocated for the parsed
> alternate setting, so get_endpoint(..., 0) yields an invalid endpoint
> descriptor pointer. Dereferencing it through usb_endpoint_num() then
> triggers a NULL pointer dereference.
> 
> Skip vendor-specific interfaces that do not have any endpoints.
> 
> Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
> Reported-by: Jiaming Zhang <r772577952@gmail.com>
> Closes: https://lore.kernel.org/lkml/CANypQFb1EHj0xX8bA1WxSOSK-5xca6ZNKzOQcp12=s=puY7VFw@mail.gmail.com/
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>

Applied now.  Thanks.


Takashi
