Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59B39EF17
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856100; cv=none; b=CjvWKKRRH9MKfOpgFBppVhPMwbnINEjUX7daNrvFTb8AsA4l4oywKIYh2DClnrkYgkbqFE8iCydvA5jUAY2Ov8ruGhre8UHRzgng9p0XvDXp48iaJGtuwzHJJ3d06kO2+r1AYBVAu9yNQ6Wg4dFR76tURhASxZ+QUuxnICCUAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856100; c=relaxed/simple;
	bh=/iwlNPuPlscrPUI5LUrivCGSx+4y/tV/Jq3KYCKTeUc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JB8H0HdT0K2F0dTxWBZJE/uM9hwbBfq9uof2Y+sZdJPFMDwgyNgvYJnBi9kgIBzymyNk3M9etA2IvYNny5WnWNu5JqXcPnT6SIx0ViqbYri39xFzBI0sWDRJShLfVDNlnGtuO7zKZGN7+WFHv5xaD+h1XxlSsjQO1p+ToKG1nh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FO6DXJjd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TAZ5TDKK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FO6DXJjd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TAZ5TDKK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FO6DXJjd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TAZ5TDKK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FO6DXJjd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TAZ5TDKK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5EA5A5BE85;
	Mon, 30 Mar 2026 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21nfDagVnySPrNSwWCRP1lqBk0uhqEdwabhP8r1kaRU=;
	b=FO6DXJjdXIViBG/5vghkJuw0YSgE0Rz7jULElBaTmHBoKFWNVkzGIENq6FVJ/0s4RWqC2N
	pE7lwWmFXFyzM3vtyPt2ufRPak5ls/e5rO2xAHUuaAthmCpdXZThmXiYj0ydhR8ZLZ6JWk
	s0nDSujm8CxioOPcgO9lUjuEEAlymcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21nfDagVnySPrNSwWCRP1lqBk0uhqEdwabhP8r1kaRU=;
	b=TAZ5TDKK07b9C5t/xPGFjiht69I+yu5kXffbCfsApizkoL89I5Rz5314ql+KBI/MyNBu42
	xIbXSU7WFe9JRxDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21nfDagVnySPrNSwWCRP1lqBk0uhqEdwabhP8r1kaRU=;
	b=FO6DXJjdXIViBG/5vghkJuw0YSgE0Rz7jULElBaTmHBoKFWNVkzGIENq6FVJ/0s4RWqC2N
	pE7lwWmFXFyzM3vtyPt2ufRPak5ls/e5rO2xAHUuaAthmCpdXZThmXiYj0ydhR8ZLZ6JWk
	s0nDSujm8CxioOPcgO9lUjuEEAlymcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21nfDagVnySPrNSwWCRP1lqBk0uhqEdwabhP8r1kaRU=;
	b=TAZ5TDKK07b9C5t/xPGFjiht69I+yu5kXffbCfsApizkoL89I5Rz5314ql+KBI/MyNBu42
	xIbXSU7WFe9JRxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EE174A0A2;
	Mon, 30 Mar 2026 07:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O2o+BqEnymkvJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 07:34:57 +0000
Date: Mon, 30 Mar 2026 09:34:56 +0200
Message-ID: <87pl4lu5wf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix error message in cs8409_i2c_bulk_read()
In-Reply-To: <20260330054131.434994-1-wangdich9700@163.com>
References: <20260330054131.434994-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-2.98)[99.91%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.28
X-Spam-Level: 

On Mon, 30 Mar 2026 07:41:31 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The error message in cs8409_i2c_bulk_read() incorrectly says "I2C Bulk
> Write Failed" when it should say "I2C Bulk Read Failed". This is a
> copy-paste error from cs8409_i2c_bulk_write().
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Thanks, applied now to for-next branch.


Takashi
