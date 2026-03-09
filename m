Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0769341076
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046745; cv=none; b=IkGHe5cyKGAQCGGYX7ssoE8RSoRWCBZfcIUEATZiDvOnPvpssKLG7Y8cnvJDccpTw4AgLaubhKLmC+Zvqa7kAaYHQOOgX0SgOzt3Lt5AU0qcVMw5kAa23xmZH3LRDu/GgdR/pCo7iXSq3YQw7taxIRHzKEO12wYYpJteEKsqSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046745; c=relaxed/simple;
	bh=+27Wu7bkf0SLOUtasiAMT/KF3H2YYTCC4PP0+NZr2nU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgXi+Z01mB7OomPviZVJ8UqYBpZvtRXdJEXW3VeZr/lnFywKnQvfcAK3Le3+Al2vlReylcWvsyo6JbBLgS8Mlgnpu2N35X+t6BLptH7/aivuMPpJdQBlT9xEQWsBmWUEHyybFfR3+OkaQltMJPsj7VvGnkadjQB4kkzkPJ0gYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bmhbiMY5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxcD7uBL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bmhbiMY5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxcD7uBL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bmhbiMY5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxcD7uBL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bmhbiMY5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxcD7uBL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 113375BF00;
	Mon,  9 Mar 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoYUkoq0LVZQbrZuhlqyEu8vgMjSi0APYqD38y/y8uE=;
	b=bmhbiMY5TAU9mfXIbXUvyJby99y3DP1/u6woU5xy1NnCDHBY0Y7GiHYn8BQgcPIWllf1aY
	2anzF+sS7NTux+WtsJafsRFlYl5b5qfOjpihZXpRG774/OXeTmgsAGicoBgRNg34/8vebS
	dRsEYTTo4kdFFD0ZlXDYlEY6L2NSbxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoYUkoq0LVZQbrZuhlqyEu8vgMjSi0APYqD38y/y8uE=;
	b=jxcD7uBL3D64q5b6yEjcczIJQLRB0iIC+aYKBehn8ZBX6jjN/0aoemQ7oV6HrYV+QTQezo
	11Hjsn3g1/PefLAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoYUkoq0LVZQbrZuhlqyEu8vgMjSi0APYqD38y/y8uE=;
	b=bmhbiMY5TAU9mfXIbXUvyJby99y3DP1/u6woU5xy1NnCDHBY0Y7GiHYn8BQgcPIWllf1aY
	2anzF+sS7NTux+WtsJafsRFlYl5b5qfOjpihZXpRG774/OXeTmgsAGicoBgRNg34/8vebS
	dRsEYTTo4kdFFD0ZlXDYlEY6L2NSbxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xoYUkoq0LVZQbrZuhlqyEu8vgMjSi0APYqD38y/y8uE=;
	b=jxcD7uBL3D64q5b6yEjcczIJQLRB0iIC+aYKBehn8ZBX6jjN/0aoemQ7oV6HrYV+QTQezo
	11Hjsn3g1/PefLAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D90343EDFB;
	Mon,  9 Mar 2026 08:59:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gSKvM9SLrmkhSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 08:59:00 +0000
Date: Mon, 09 Mar 2026 09:59:00 +0100
Message-ID: <87o6kxtm3v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Liucheng Lu <luliucheng100@outlook.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk
In-Reply-To: <PAVPR03MB9774F3FCE9CCD181C585281AE37BA@PAVPR03MB9774.eurprd03.prod.outlook.com>
References: <PAVPR03MB9774F3FCE9CCD181C585281AE37BA@PAVPR03MB9774.eurprd03.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 07 Mar 2026 04:27:27 +0100,
Liucheng Lu wrote:
> 
> HP Laptop 14s-dr5xxx with ALC236 codec does not handle the toggling of
> the mute LED.
> This patch adds a quirk entry for subsystem ID 0x8a1f using
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup, enabling correct mute LED
> behavior.
> 
> Signed-off-by: Liucheng Lu <luliucheng100@outlook.com>

Applied now.  Thanks.


Takashi
