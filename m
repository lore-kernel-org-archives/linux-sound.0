Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC45464E
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937036; cv=none; b=h3TPjus2dzb8xy5QNFu2gz6qDLwNdSZexbApS7PEX4MBbAptWpcr15Cp3SlK5Dp49IsuIoqx0ssBfabOENOxCQuvEt0hZfdIX4XOJ4kCCFmtQRg5OwIcjXmmSOu7OyqETbF9HO5XnEEncysJiI38cM/SOeEoIsdiRiCGBEylQAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937036; c=relaxed/simple;
	bh=8lItpIqt6TM0YWTqSGbaZfHqypxS8J8uBj3PBHA0714=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cASAmOaWdYeVE+Qp6Np0DHO/YIz5cQcAYGzrUxezGKJdqOcmhF7kqhOucp3VZ01TKl08hg9EmOR46Eytpn+lGfS33YOz8cw4RB827Ano1a0wEFfEksPY7RuUUX1qQDr83B0hN4tuGpWnBaHa+u4rJicjVkJX4F0npOrV7edKnCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BJAkD4bf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c3p0LAkz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BJAkD4bf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c3p0LAkz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BJAkD4bf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c3p0LAkz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BJAkD4bf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c3p0LAkz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9201B21C81;
	Tue,  6 Aug 2024 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722937025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wu2Oqv1taVVlP/EFuCOORJ3RsRzXUwLXXdpyZSXjuxM=;
	b=BJAkD4bfO0UpJBNpC6bV2KF83hBJ/wTZzSRQoUdmmBAet+E/OevFLs9lhnlPI7ViA0OQ4U
	rM/+CRi219dsnKlwsX4X1c5qM1+L+CNyy7GueXZzTMunqLqQ/30rEFIVTwfVKVFouNs6sP
	J03lg5MlYeAfW6ffrE4sRpoiUbuM1rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722937025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wu2Oqv1taVVlP/EFuCOORJ3RsRzXUwLXXdpyZSXjuxM=;
	b=c3p0LAkzj+hQz9C5p73qKPsNM5btyLCxvuUsHO7S8yZ2IzO04kWZk0kANT1ItCjKnDIsLA
	LxUJnKYNLibIr6DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722937025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wu2Oqv1taVVlP/EFuCOORJ3RsRzXUwLXXdpyZSXjuxM=;
	b=BJAkD4bfO0UpJBNpC6bV2KF83hBJ/wTZzSRQoUdmmBAet+E/OevFLs9lhnlPI7ViA0OQ4U
	rM/+CRi219dsnKlwsX4X1c5qM1+L+CNyy7GueXZzTMunqLqQ/30rEFIVTwfVKVFouNs6sP
	J03lg5MlYeAfW6ffrE4sRpoiUbuM1rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722937025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wu2Oqv1taVVlP/EFuCOORJ3RsRzXUwLXXdpyZSXjuxM=;
	b=c3p0LAkzj+hQz9C5p73qKPsNM5btyLCxvuUsHO7S8yZ2IzO04kWZk0kANT1ItCjKnDIsLA
	LxUJnKYNLibIr6DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F27B13981;
	Tue,  6 Aug 2024 09:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2v42GsHusWbGfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 09:37:05 +0000
Date: Tue, 06 Aug 2024 11:37:43 +0200
Message-ID: <87mslq9el4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:<linux-sound@vger.kernel.org>,	Takashi Iwai <tiwai@suse.de>,	Mark Brown
 <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,	Nicolas Dufresne
 <nicolas@ndufresne.ca>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5] ALSA: compress_offload: introduce accel operation mode
In-Reply-To: <20240731083843.59911-1-perex@perex.cz>
References: <20240731083843.59911-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Wed, 31 Jul 2024 10:38:43 +0200,
Jaroslav Kysela wrote:
> 
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-accel.rst" document.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Shengjiu, does this framework fit and work for your device?
I'd take the change only if there is a real user.


thanks,

Takashi
