Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1F377EDC
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495121; cv=none; b=Za+YA7GuS9azlV1ff9OmzGyp+X/d0uQE7eYw2iowWGVuE4+sbDpLJ9ntvFwpXAnQ3Wyuv4TcxIOX0XSE38d6UUdwIFsLuE9XQlwfcoHs5wGjZ+Igckvyc4yfFP9wzAdzmOYL6DMQ3E29WA7yDR+PRb9eHd4Q8gPtXIkVIL4AdXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495121; c=relaxed/simple;
	bh=kZOwkIbmdZiQLglcqSk+BVrxiVYq2P3ePwFWj9r5Coo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMRFPxk9nHgVgc0log43hVtFin4iicDhEKj1eBUr+wKxCFRtMMXPI2bveXF26G3FjSHa8UQPNY66DxqLLM3PHBVGkh8d1ZP9YqhrjKIqo0koALehusldkTWjwXrBt1+qB9hDTpkO+2wrS6d+rEiCcUxwC1mayw5LuOL2z1vth0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G3WiJ8HH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XSoFETi0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vLLKvX4/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2+uHCKGy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G3WiJ8HH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XSoFETi0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vLLKvX4/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2+uHCKGy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EEBCF5BD3F;
	Sat, 14 Mar 2026 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2+N9Vlx9z2hOoz5sqTenVBPUDVEAoI1qwMNbJ5/sK8=;
	b=G3WiJ8HHAX8uOekSjwefS1fiXI2XN8Ps2voYed7uu77st1WntulBj8yUsSwghBOkAhGM1d
	mMEByQBoqWg/F3Gj+4Txhr6KJFxSGmR22qhyOmI5kCN4jsxsxiXmUD/Kj4viITuxfDqpIi
	7rgnFW3RndrFqhQgLoMlVxiilkiLeBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2+N9Vlx9z2hOoz5sqTenVBPUDVEAoI1qwMNbJ5/sK8=;
	b=XSoFETi0Ln5KJWdWtjYc3TUwy36sXRAkVBvvHJuHGxigCBTtNyRDXTknk1tDGEf4rQfatV
	N1MjUOvKabI3JWDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vLLKvX4/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2+uHCKGy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2+N9Vlx9z2hOoz5sqTenVBPUDVEAoI1qwMNbJ5/sK8=;
	b=vLLKvX4/97mNjgksOI40TVdSCZbrpvH9pe++DXAqMKBjNzODfMPf6FCD8ja3VMvCtPBPBp
	gq/+44O0DtTd2BU+JtnVdVNYrC/UyqV9VK9N/cVcizZeaciF1Kq1Uikbn9clk+GJdcWHRH
	sslwWaZ304/Kmua5iGZvQDnRM0YQpZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2+N9Vlx9z2hOoz5sqTenVBPUDVEAoI1qwMNbJ5/sK8=;
	b=2+uHCKGypoKhNQlXmGoSJhQzwrubwjd0dSAo3pogdoCCy9KO4zozzLimem+XrX9Cm68D3g
	Uzu68OzpsGkWkgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD1B142724;
	Sat, 14 Mar 2026 13:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rl38KEdjtWm/DAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:31:51 +0000
Date: Sat, 14 Mar 2026 14:31:51 +0100
Message-ID: <87wlzea660.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for Lenovo Yoga 7 2-in-1 16AKP10
In-Reply-To: <20260313080624.1395362-1-zhangheng@kylinos.cn>
References: <20260313080624.1395362-1-zhangheng@kylinos.cn>
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: EEBCF5BD3F
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 13 Mar 2026 09:06:24 +0100,
Zhang Heng wrote:
> 
> This machine is equipped with ALC287 and requires the quirk
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN to fix the issue
> where the bass speakers are not configured and the speaker
> volume cannot be controlled.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221210
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Thanks, applied now.


Takashi
