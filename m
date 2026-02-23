Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F434DB7C
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836862; cv=none; b=lMhM/fgNZRo7JEC6RUq98EVImw7hgUnQXgYE9zo01mVCH6tiSVt2fS8sK0ffWPmzysS+7R7bVkrH34XN1MMEW+jiltZ7IPYwpby966S+2N67JAnUYJ1yAmCmvx7GEPn/GYWs1jIQL++ZPfJ8d6E8bQ3OtEQ/JdbHPU6mwYmq8Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836862; c=relaxed/simple;
	bh=ogxN6n1ODyQcDYgeHtJSC/Pv88ShOTQ0TRwpZWHpjBA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oTNEa8LWfpjqaqTw31zGe2lv6K+VIzH7IIGieaM6n4NTQWPnt5Fc08UHqzuLExlYkOXQUyS8P3NsWriPKq1UVl4eTyGouHbycaGuGZnqY3vFK/3y6Yw+VnRltxR5s9WDxtY5FkiqEWDaWngIIBBl12gVUlfqPkOPOiu9qMdYUKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrxT7snw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgm3zxxU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrxT7snw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgm3zxxU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrxT7snw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgm3zxxU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrxT7snw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgm3zxxU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A13DD5BD01;
	Mon, 23 Feb 2026 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rl91X3IzBKeDPouMTQHRcAQhhqjeu2Pad47S/POEbDM=;
	b=IrxT7snwZubOuD9mc8UGe9E9e/HO3BU5NzTH6+sPnjFoiLDlF0KWIKkUzZAwMdKnkUwhha
	7mxU12T3EwAcCfrQ1bSAq3qiKwu9Vb5AMpJDVpt2OIgP9OzQ/8X36iMMngGmKvnte5FG8h
	cGAcesANbSWEbkHbpIfU9G7CJlNW1tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rl91X3IzBKeDPouMTQHRcAQhhqjeu2Pad47S/POEbDM=;
	b=kgm3zxxUib24usIRUiUKHcSteCqlWVYSyua/aeudoRdZ7rNGrElHgsZd13h4wUFD8jJSvW
	Hgb2YCT+ACtyiwCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IrxT7snw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kgm3zxxU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rl91X3IzBKeDPouMTQHRcAQhhqjeu2Pad47S/POEbDM=;
	b=IrxT7snwZubOuD9mc8UGe9E9e/HO3BU5NzTH6+sPnjFoiLDlF0KWIKkUzZAwMdKnkUwhha
	7mxU12T3EwAcCfrQ1bSAq3qiKwu9Vb5AMpJDVpt2OIgP9OzQ/8X36iMMngGmKvnte5FG8h
	cGAcesANbSWEbkHbpIfU9G7CJlNW1tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rl91X3IzBKeDPouMTQHRcAQhhqjeu2Pad47S/POEbDM=;
	b=kgm3zxxUib24usIRUiUKHcSteCqlWVYSyua/aeudoRdZ7rNGrElHgsZd13h4wUFD8jJSvW
	Hgb2YCT+ACtyiwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D5D23EA68;
	Mon, 23 Feb 2026 08:54:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IXaHFboVnGlbfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Feb 2026 08:54:18 +0000
Date: Mon, 23 Feb 2026 09:54:18 +0100
Message-ID: <874in7n8lh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Charalampos Mitrodimas <charmitro@posteo.net>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
In-Reply-To: <20260221-fix-detect-mic-v1-1-b6e427b5275d@posteo.net>
References: <20260221-fix-detect-mic-v1-1-b6e427b5275d@posteo.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A13DD5BD01

On Sat, 21 Feb 2026 20:40:58 +0100,
Panagiotis Foliadis wrote:
> 
> The Acer Aspire V3-572G has a combo jack (ALC283) but the BIOS
> sets pin 0x19 to 0x411111f0 (not connected), so the headset mic
> is not detected.
> 
> Add a quirk to override pin 0x19 as a headset mic and enable
> headset mode.
> 
> Cc: stable@vger.kernel.org
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221075
> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>

Thanks, applied now.


Takashi
