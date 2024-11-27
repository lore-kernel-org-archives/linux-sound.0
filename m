Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CC81AD7
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732691393; cv=none; b=bbuLifTE5untDp7kGaO31bJiDggUldNiVNVq0EX1brymjYPVT+esR++jxv46BsSQ0NOTLjqgC36mgRBvacvY9wT4KT2gSuSMJWg0xrHY0E6L2EuX1gvBLMcbaMBX1AxOLcaSJgPv9SCQxK/kAEAtPyVOVVqFtflR1pWWJt72HyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732691393; c=relaxed/simple;
	bh=MI4FTbVBZe4KOAoAYbnJ83iPCPEePjfmQH62TdtG6nM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6y++iellvpPjZutzN3tjgPDP7uvr+a/LF8L+zR8rzM4d2pJ04NqqMEOrDPoZT4nDRvwoZ7ZI44tI1JHhFJAAujI9iVVtgoZS5zPeQRCOKpTk9qROsw+1xsiPlC+7F19tL/FOQDH6yTcCDRUc49tfBfVIngC6YEkZld4Usxmy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DUG8/1LN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LvtaWCXu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DUG8/1LN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LvtaWCXu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DUG8/1LN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LvtaWCXu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DUG8/1LN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LvtaWCXu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC3E821170;
	Wed, 27 Nov 2024 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732691389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ji21t1mTgYHxw7vWRbNBQy5sim2bth3sCnF3fuXl6hg=;
	b=DUG8/1LNolPpNPJrAZGEog3wu//VMNN5Dxbi2sylOiFOPENK0Gw4LC6csysVAXe2Zkcwyv
	X6f4Yxe0bb2cTSyTVOfX/vD6JQNI+rVeoYhlO84oilatofa28DNOOl4/BwhIgZ1sHylDzU
	d8Bee153E2sv4Vc4B/SHmesvLCxQjjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732691389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ji21t1mTgYHxw7vWRbNBQy5sim2bth3sCnF3fuXl6hg=;
	b=LvtaWCXuQl9BnnAdeW+6XOFyrRSfYBK1ttFj1W7kbeEaHSaLp1NnHCFx62l556AAmhoCtK
	55YxhqjBU37uWRCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732691389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ji21t1mTgYHxw7vWRbNBQy5sim2bth3sCnF3fuXl6hg=;
	b=DUG8/1LNolPpNPJrAZGEog3wu//VMNN5Dxbi2sylOiFOPENK0Gw4LC6csysVAXe2Zkcwyv
	X6f4Yxe0bb2cTSyTVOfX/vD6JQNI+rVeoYhlO84oilatofa28DNOOl4/BwhIgZ1sHylDzU
	d8Bee153E2sv4Vc4B/SHmesvLCxQjjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732691389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ji21t1mTgYHxw7vWRbNBQy5sim2bth3sCnF3fuXl6hg=;
	b=LvtaWCXuQl9BnnAdeW+6XOFyrRSfYBK1ttFj1W7kbeEaHSaLp1NnHCFx62l556AAmhoCtK
	55YxhqjBU37uWRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7541C13941;
	Wed, 27 Nov 2024 07:09:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nZ7UGr3FRmftEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Nov 2024 07:09:49 +0000
Date: Wed, 27 Nov 2024 08:09:49 +0100
Message-ID: <87serd9mpu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gax-c <zichenxie0106@gmail.com>
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com
Subject: Re: [PATCH] ALSA: core: Fix possible NULL dereference caused by kunit_kzalloc()
In-Reply-To: <20241126192448.12645-1-zichenxie0106@gmail.com>
References: <20241126192448.12645-1-zichenxie0106@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 26 Nov 2024 20:24:49 +0100,
Gax-c wrote:
> 
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> kunit_kzalloc() may return a NULL pointer, dereferencing it without
> NULL check may lead to NULL dereference.
> Add NULL checks for all the kunit_kzalloc() in sound_kunit.c
> 
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>

Thanks, applied now with Fixes tag.


Takashi
