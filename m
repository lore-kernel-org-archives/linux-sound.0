Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E238D3FD
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573409; cv=none; b=IgfKkOVTyKw0KBfqqSL16KCW92Co68MshkAcatB7xsF0eVrF0v/gHJ1d8ZwTEkYAKq1iSM+mE3y9rGV0Lfxt8uG1NxaIB6HLNO1CSOJaH3QTFPxcLMyF4qW/Dl5UaS9jt+01wGPUB1l5hEXNWb3ffm3UivH9kqUsFezAoJx8qb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573409; c=relaxed/simple;
	bh=QJbXtu5v2+bAafxS8bftd0t2pahC8XQvAqqa7M+H7Tw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpOrlab3IxF6OLB/nrgVB7eUcylPkpEenR2hVndolNRGfieNUK7klD8ZyNZTqROc1+L8I6PJykrGrg177A13g/xVvaXfP914Qg85gAn5XLOe8fofgxnCGDu4+dd6KB1Cz6D6cDCQx/luo/zoJBiXlz9lI6WwvviR+iY3PZvupyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YN+E/JlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/WQISubJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YN+E/JlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/WQISubJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YN+E/JlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/WQISubJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YN+E/JlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/WQISubJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 746D67A167;
	Mon, 20 Jul 2026 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3yvbE5+xExqEyuMfL0GPxobaon1xgfNFJaSNpUtJrYA=;
	b=YN+E/JlTptLDtF5uQyFaPWjIcUoazULQY8oTOs6xOMzu16LERrBjyU3MS8uH9dT2FKhPj7
	/QA8GW5orKhRTGz5GkWDnHruOwHCsGc7N4G/mrqpIFtZ5NPzBYDbDRbxLo/T6EwB78Ksfc
	iyGplzw+HdzOCJGapobBdRHwuYhFD4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3yvbE5+xExqEyuMfL0GPxobaon1xgfNFJaSNpUtJrYA=;
	b=/WQISubJHgRME3jnhR/GthNKl52TXK3JoWfgKA+WaafghpuHKwGY0Z24DwQZrsDp5vSdP3
	19Xif9tGFdIgLtAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="YN+E/JlT";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/WQISubJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3yvbE5+xExqEyuMfL0GPxobaon1xgfNFJaSNpUtJrYA=;
	b=YN+E/JlTptLDtF5uQyFaPWjIcUoazULQY8oTOs6xOMzu16LERrBjyU3MS8uH9dT2FKhPj7
	/QA8GW5orKhRTGz5GkWDnHruOwHCsGc7N4G/mrqpIFtZ5NPzBYDbDRbxLo/T6EwB78Ksfc
	iyGplzw+HdzOCJGapobBdRHwuYhFD4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3yvbE5+xExqEyuMfL0GPxobaon1xgfNFJaSNpUtJrYA=;
	b=/WQISubJHgRME3jnhR/GthNKl52TXK3JoWfgKA+WaafghpuHKwGY0Z24DwQZrsDp5vSdP3
	19Xif9tGFdIgLtAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C221779AA;
	Mon, 20 Jul 2026 18:50:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RxQ5Ed5tXmoYTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 18:50:06 +0000
Date: Mon, 20 Jul 2026 20:50:05 +0200
Message-ID: <87v7a9pkbm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nikita Maksimov <nickstogramm@yandex.ru>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on Lunnen Ground 14
In-Reply-To: <20260720180214.73770-1-nickstogramm@yandex.ru>
References: <20260720180214.73770-1-nickstogramm@yandex.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 746D67A167
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[yandex.ru];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 20 Jul 2026 20:02:14 +0200,
Nikita Maksimov wrote:
> 
> The firmware on the Lunnen Ground 14 marks pin 0x1b as unused even
> though the internal speakers are connected to it. As a result, the
> speakers are not detected.
> 
> Add a pin configuration quirk for PCI subsystem ID 2782:a212 to configure
> pin 0x1b as an internal speaker.
> 
> The pin configuration was tested on a Lunnen Ground 14 (DMI product LL4FA)
> with an ALC269VC codec. The internal speakers and microphone work as
> expected.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Maksimov <nickstogramm@yandex.ru>

Applied now.  Thanks.


Takashi
