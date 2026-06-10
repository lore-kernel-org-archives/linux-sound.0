Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA829B8E1
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076257; cv=none; b=V768cIg1ePu00p3Yy6q1oyQXRdfrg5IlaJCVptqNkvrQFB7xyHyYL7ST6/4fIBFXS15TQnScjMT0PB2duILQoa/zWiS3crOK6A2r94flbyZ2jXh8pmg/X/wn8b0F11r0GyxND18L7V6CKFn9vumJ/kli7DdO4LBNgxy5wVh92v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076257; c=relaxed/simple;
	bh=Gsghg8KZTFoL/CKtX2h2b8RKnxITGUCpSzWXCxEEYxU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJdWIYTzSfYNrGPIfSSgLkqQ2SWBHLHs6yPuhKYPO1gAxO7ylMcRebcPpngJEudvJNmJ9VyV7Pp6LlX98wNHLQVz/b5fucHWfnuuPiPiYNb4HZeW7AMkvRnNL534OI7NgzV4tMf+Tkm0gd+GowXkKraTXlPSsKLm0NWXTvHh1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1pTP4qSE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ur7Wr+jP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1pTP4qSE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ur7Wr+jP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1pTP4qSE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ur7Wr+jP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1pTP4qSE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ur7Wr+jP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FF656AC58;
	Wed, 10 Jun 2026 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5BO0SvwzK4jbgwa7AtAHBiEkY5EUT4Yh23UZbMFLsA=;
	b=1pTP4qSEZgData2V3HQP/G3SCDhmq38+JZJRg/mXziikNw1vLjgN+iWftpTMkTUEqhNAw2
	FI4p/sSp5sVxuAtOaKYpOZshpXkinsg+kSBBeCACwhHj4DTrgx70Y0CGVlTwsDnVwOeS7i
	ggyXocE8te7gM6sBS001JTgaVSpIBN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5BO0SvwzK4jbgwa7AtAHBiEkY5EUT4Yh23UZbMFLsA=;
	b=ur7Wr+jPbNdOkfYYfl2mQKTh6bfVYOE/C+mk6T+tPuGgzpZUX3WTD05G8522hPwvKxPwTe
	I9I/DgA+UYULb1Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1pTP4qSE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ur7Wr+jP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5BO0SvwzK4jbgwa7AtAHBiEkY5EUT4Yh23UZbMFLsA=;
	b=1pTP4qSEZgData2V3HQP/G3SCDhmq38+JZJRg/mXziikNw1vLjgN+iWftpTMkTUEqhNAw2
	FI4p/sSp5sVxuAtOaKYpOZshpXkinsg+kSBBeCACwhHj4DTrgx70Y0CGVlTwsDnVwOeS7i
	ggyXocE8te7gM6sBS001JTgaVSpIBN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5BO0SvwzK4jbgwa7AtAHBiEkY5EUT4Yh23UZbMFLsA=;
	b=ur7Wr+jPbNdOkfYYfl2mQKTh6bfVYOE/C+mk6T+tPuGgzpZUX3WTD05G8522hPwvKxPwTe
	I9I/DgA+UYULb1Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B0D4779A7;
	Wed, 10 Jun 2026 07:24:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qWNqBR4RKWrZPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 07:24:14 +0000
Date: Wed, 10 Jun 2026 09:24:13 +0200
Message-ID: <87wlw66eoy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Moritz Baron <moritz.baron@stud.uni-hannover.de>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel@i4.cs.fau.de,
	Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
In-Reply-To: <20260609141648.60608-1-moritz.baron@stud.uni-hannover.de>
References: <87ecig6l1v.wl-tiwai@suse.de>
	<20260609141648.60608-1-moritz.baron@stud.uni-hannover.de>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4FF656AC58
X-Spam-Score: -3.51

On Tue, 09 Jun 2026 16:16:48 +0200,
Moritz Baron wrote:
> 
> The Lenovo Yoga Pro 7 14IRH8 (ALC287 codec, subsystem ID 0x17aa:0x38b1)
> has bass speakers on pin 0x17 that are not routed through a DAC with
> volume control. This causes the bass speakers to play at full volume
> regardless of the volume slider position.
> 
> Apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN which corrects the DAC
> routing for pin 0x17, enabling proper volume control. This is the same
> fix used for other Yoga Pro 7 models with identical audio topology
> (14APH8, 14AHP9, 14ASP10, 14IAH10).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217949
> 
> Co-developed-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
> Signed-off-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
> Signed-off-by: Moritz Baron <moritz.baron@stud.uni-hannover.de>
> ---
> v2: Move the quirk entry before 17aa:3852 and add a comment to
>     clarify the PCI SSID conflict, as suggested by Takashi Iwai.

Applied to for-next branch now.  Thanks.


Takashi
