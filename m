Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CC3B637C
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728896; cv=none; b=aqYzUyrNNuT7Wj8R5jIED/DL9FUi97K5KRtbnlwfINg30O68BRc0Eo4mDwhM8YT1kvzC3yl3fxqBPBBUY2r4HrCJjh+AYPFmQfEfx6D0A0lfk6KEQp5g23BZDeU93BLulYHExZPcrZXYaTFYKHGU2owJDf1LdZtLMs0dpNFD7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728896; c=relaxed/simple;
	bh=a6BpQS/Zlubwp11Na/aOX8I6YeEnwjifrtjO0/c7Y20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvB2+OY6D+nx+GRXBUCzRlc2pRse8gVEMSY8Km7YUkh6yb31eac13CDoaTcDPCQ94J66bEInEfLTlSK8pYrIdBJ36byd5vfzGVUn3RgdS8abzbdkSBR1nIrHhcmenw6CIKxmzl0nO1S24gu9WYMr9P2VJkyUaLd1uqO7tPeHc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=URZuAC3R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y1iLXqiV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RCNZpuIi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i+3j5Crt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="URZuAC3R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y1iLXqiV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCNZpuIi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+3j5Crt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B58B05BD1E;
	Thu,  9 Apr 2026 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775728891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXxttOx4Ftt6CrI/mDkEtKPODNtOcnhqLchfPH+a/88=;
	b=URZuAC3RptJ2s177aQ1O3088glufI6t9XD89ti8QUYmyq4QRWRUwd2cmhLF654vrszaGFi
	Xo75LBdABAem253QYrtriOtrSzrnI+1Mviu/kZIOCGiP8Ni1lVi9SEt+Yh9opNhFxr6f9E
	kDn07bEXrHDxniRmRBCTSX9efZ1YgHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775728891;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXxttOx4Ftt6CrI/mDkEtKPODNtOcnhqLchfPH+a/88=;
	b=y1iLXqiVItkIEKvWf1Us7osNE5mc4teU6mZAF+znWllzbZ2HMXayP2NSNhhYIaLQ/0JB3R
	i7bJyGbpf4kw6JCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775728890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXxttOx4Ftt6CrI/mDkEtKPODNtOcnhqLchfPH+a/88=;
	b=RCNZpuIiXROxVbFnlRtNztepzB2Y/droH5q/0C+Grw7R8eKWz64ia0nxqHLUlGA7xw1Wvv
	vUHl2mwjOQm6yKmw0egsZA8DXemXJ9Y4UgNFpNkHYx6AD0yDMr6jfUCxjbHkb43vpX7Poh
	3833NqZMK3hBqX8DQKY8nGLh9nszAG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775728890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXxttOx4Ftt6CrI/mDkEtKPODNtOcnhqLchfPH+a/88=;
	b=i+3j5CrttzCwmgzotjRivsEM7G2G0XyQi+5gMEx7m/tLDk9jkH4JKJxgrQBUmaN2IFNVI9
	UKVbXSwYE0cqUUCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7ABF64A0B3;
	Thu,  9 Apr 2026 10:01:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TAbpGfp412m8cgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 10:01:30 +0000
Date: Thu, 09 Apr 2026 12:01:30 +0200
Message-ID: <87a4vcjvut.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: i2c: ak4xxx-adda: seed AK5365 cache with reset defaults
In-Reply-To: <20260408-ak5365-cache-defaults-v1-1-fff639aca3e3@gmail.com>
References: <20260408-ak5365-cache-defaults-v1-1-fff639aca3e3@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 08 Apr 2026 17:17:37 +0200,
Cássio Gabriel wrote:
> 
> snd_akm4xxx_init() clears the register and volume caches before
> dispatching by codec type. The AK5365 case then returns immediately,
> leaving the software cache at zero instead of the documented AK5365
> reset defaults.
> 
> The AK5365 capture volume controls read from volumes[] and the proc
> register dump reads from images[], so the initial capture volume state
> and proc output are wrong until a control write happens.
> 
> Seed the AK5365 cache with its documented reset defaults instead of
> adding a guessed init sequence. The datasheet documents the reset
> values and states that MCLK/LRCK changes do not require a PDN/PWN
> reset because the chip has a built-in reset-free circuit.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
