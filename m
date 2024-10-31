Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282ED19C562
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391626; cv=none; b=B9fYJ/W4f7fjaVV+8NjfBmMYMUUWN1zYgjhwZU1OEUdiDCj79KEz8noM1izGdlL5j5Nxo6kWM6bIbeZHNFMq8ZxxQH5fpjy92lu40261qpK7JGg7E/2WraGFeCFw7EIrlAlsBgyJ5izeJB8Iwsx5mCQGvBRDzjaBPKguC9DVkBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391626; c=relaxed/simple;
	bh=PurOHOtmhxFSTeR1C0jvtM67MPrL4QTz3dZFIUROUto=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2phcJaPmFNnqyNi8HcGMaTzRJTzWcPjaTszaTm2u8gJWvCvGPjCYytjUqroqGEXE0ms1Y1LV5xxfVJj4hWTVfhnnBFE8l1NUKYSOOqNKl4F/x6e5z5p1S7skuQYb8Vld1o1kvC3WKb/Tng0hz932t2wJ0jezOUrzGcx7lg2Wxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XuJaQaGK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Mavml3F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XuJaQaGK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Mavml3F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XuJaQaGK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Mavml3F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XuJaQaGK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Mavml3F"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 52D7721CEA;
	Thu, 31 Oct 2024 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730391622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sSvtL57+fugT2TV4x+llkSZ5/knd2Szh4vYAWxm3UU=;
	b=XuJaQaGK1USEwmdHATWjmJ0oemOr2s4VywbEaWHy/xUax1RH3CBJDgPWJSJvrT0QnS6SZe
	MaJDKhBLECxuyONlDnaosGqQndlgLb1WAkD2qQ7+WYwDzaJ/VlpbT36wVaWZT1aGGiTRUH
	XYdczGD6H0RlijFZzQ6lqvORe+EjY+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730391622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sSvtL57+fugT2TV4x+llkSZ5/knd2Szh4vYAWxm3UU=;
	b=7Mavml3FrEGpVLufXpSDDlnCkJGVSi3vyLWgW5M1n7/6L39yVdChmeqg196K+JWWrq5RZq
	Jka77Gkj2v4A8BAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730391622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sSvtL57+fugT2TV4x+llkSZ5/knd2Szh4vYAWxm3UU=;
	b=XuJaQaGK1USEwmdHATWjmJ0oemOr2s4VywbEaWHy/xUax1RH3CBJDgPWJSJvrT0QnS6SZe
	MaJDKhBLECxuyONlDnaosGqQndlgLb1WAkD2qQ7+WYwDzaJ/VlpbT36wVaWZT1aGGiTRUH
	XYdczGD6H0RlijFZzQ6lqvORe+EjY+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730391622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sSvtL57+fugT2TV4x+llkSZ5/knd2Szh4vYAWxm3UU=;
	b=7Mavml3FrEGpVLufXpSDDlnCkJGVSi3vyLWgW5M1n7/6L39yVdChmeqg196K+JWWrq5RZq
	Jka77Gkj2v4A8BAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B36C13A53;
	Thu, 31 Oct 2024 16:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id km9mCUauI2fRMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Oct 2024 16:20:22 +0000
Date: Thu, 31 Oct 2024 17:21:26 +0100
Message-ID: <87o730uttl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 31 Oct 2024 17:12:53 +0100,
Jaros³aw Janik wrote:
> 
> On 31.10.2024 10:15, Takashi Iwai wrote:
> 
> > Per reading the patch description, though, the behavior appears to be
> > pretty unreliable, as it depends on the runtime suspend.  We may
> > control the runtime PM better if we know that the beep must be
> > submitted; or it's even possible to runtime resume/re-suspend upon
> > beeping, too.  But it's maybe too complex than needed.
> 
> You must have misunderstood that, this unreliable behavior is what
> happens with your patch applied, once this patch is reverted everything
> works perfectly fine (again). Perhaps the commit message should be
> rewritten to indicate it more clearly, e.g. replace:
> > now those beeps are either muted altogether
> with
> > since 4f61c8fe3520 those beeps are either muted altogether
> 
> ... or perhaps it should be just left as it is...

Hm, so the beep works even if the HD-audio device is runtime-suspended
before shutdown?  Also, beeping at suspend/resume works no matter
whether runtime-suspended or not?


thanks,

Takashi
