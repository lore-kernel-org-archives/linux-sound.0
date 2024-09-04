Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742C126C01
	for <linux-sound@vger.kernel.org>; Wed,  4 Sep 2024 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447780; cv=none; b=p+O9MrvEfdJuzsSde0FhYI0rEZwk4eKYpfwwfZcgs/HwH1bB0bM2jT5G+V1SzPLZdziQF2t7YKH7SNkJx2ecHYxTsMkPmQujlA41/kw0P56Raf/hGVndYuEN2OTdxraUB1EfnuCchknPGL9hoBFcYouu/CmQs2Y0b4BzsgYOHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447780; c=relaxed/simple;
	bh=AvbdibDys27AiKxXZ4LKVN28gJBmCOOCt7Ep0ioq4CY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoKsAh2i8A6zyJ4SbABXgzc7SxWtRJ3VnJfKodmWJxogra372wPpS1HLAn7XPKp21uBwQvyRHckG+tWhEfBu0Fq7hRJCf8Ha9DiWFZ6dVPr26t9j6qKSrjpB0ZgeLBzciEA718eLcg734ZV7YkjJpavjCuyD18aFn7o1aqoJI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uEhPbbcX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HhfKt64G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uEhPbbcX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HhfKt64G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uEhPbbcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HhfKt64G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uEhPbbcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HhfKt64G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5191721993;
	Wed,  4 Sep 2024 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725447777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQ0x6Pm4AAcfDfi66xxWu27ItjUqBeJbZaFuCFx0ac=;
	b=uEhPbbcXUh5Qnm0C3T+NtP3RdG1piPp38ExVoU3sFp3Jrh5E91xkF/Ln0FexoJUSULDZZC
	nERsNijkpcZRgkKY0NbBf9pcF+bmlnUslumsmkPMZQNpEZ9VUpFmuzmhmdL9TyLhEZRqCN
	NhitfFczhu+MhJlpHJY9rAQJda3ufMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725447777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQ0x6Pm4AAcfDfi66xxWu27ItjUqBeJbZaFuCFx0ac=;
	b=HhfKt64GiZkxsr5IQPJYXeCKsADrf78gdIdFgH8uOdqxO5MYn5Qf/ywYlUfCs1n8Mj0G6q
	qn92EtFvxtGp2aAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uEhPbbcX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HhfKt64G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725447777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQ0x6Pm4AAcfDfi66xxWu27ItjUqBeJbZaFuCFx0ac=;
	b=uEhPbbcXUh5Qnm0C3T+NtP3RdG1piPp38ExVoU3sFp3Jrh5E91xkF/Ln0FexoJUSULDZZC
	nERsNijkpcZRgkKY0NbBf9pcF+bmlnUslumsmkPMZQNpEZ9VUpFmuzmhmdL9TyLhEZRqCN
	NhitfFczhu+MhJlpHJY9rAQJda3ufMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725447777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQ0x6Pm4AAcfDfi66xxWu27ItjUqBeJbZaFuCFx0ac=;
	b=HhfKt64GiZkxsr5IQPJYXeCKsADrf78gdIdFgH8uOdqxO5MYn5Qf/ywYlUfCs1n8Mj0G6q
	qn92EtFvxtGp2aAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AFC6139E2;
	Wed,  4 Sep 2024 11:02:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l15ZBWE+2GZFNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 11:02:57 +0000
Date: Wed, 04 Sep 2024 13:03:43 +0200
Message-ID: <87zfonists.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Adam Queler <queler@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Adam Queler <queler+k@gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable Mute Led for HP Victus 15-fb1xxx
In-Reply-To: <20240903202419.31433-1-queler+k@gmail.com>
References: <20240903202419.31433-1-queler+k@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5191721993
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[k];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 03 Sep 2024 22:24:19 +0200,
Adam Queler wrote:
> 
> The mute led is controlled by ALC245. This patch enables the already
> existing quirk for this device.
> 
> Signed-off-by: Adam Queler <queler+k@gmail.com>

Applied now.  Thanks.


Takashi
