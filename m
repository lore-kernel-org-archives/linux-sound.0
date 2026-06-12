Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BA26056C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266920; cv=none; b=cpT7Z2dtengv0w8SG3tH5RKyeHoRSkcu84VTGaFvlXKpQPq6MVM+/fSnE2KyO3mAmrIJ8mHqHUwPZSpMKJjGjgSFcOk60jndwPIrUmQuEarPw2oBTqDG0NhiCMaJBeSRdKYCmF0GS81b4Dex+8f7+bCmFzmn40x1YermTS8UcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266920; c=relaxed/simple;
	bh=XA9ZmO62jcfwaMxJ3NSBwcXLJ4R6OQVs3OAvcC203zI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNOnrR70jQZWlA2QxJqusYCjL+ciJABPydMH5kVbkF+bRtaC0XA7fezr1CgvGiEZP9r5uZnZ8NesPqNHWbtcfZfB8EfNnxiyZXkIZ9/PpiPbq/FccOKQKGEAcUiMnIf7yRCyKCxmVKNPvsik/8TS+EJ8oylaxcXVzCCXWDQTLyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z8oLmNHp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBeAZOm+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z8oLmNHp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBeAZOm+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z8oLmNHp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBeAZOm+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z8oLmNHp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBeAZOm+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B501B6C301;
	Fri, 12 Jun 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781266917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj6kWDFlwyzsH2aTYmJEQ5p56+2jxkueDLD+2BbNQm4=;
	b=Z8oLmNHpx/voAvXdRjpzNg4tjt0Sa5FF6L85Er9gvo8Dda29f0znME2jSwmbDkbN1lYccz
	O+L15l9Li1JKxhTn85HDObjK7e3T17x6g53ow8Am7PkLQgNr/o2aYKrmC76GcBG8a9Rxz/
	tbceDmV2ytleXmNgl5XhH3OGFxdqLj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781266917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj6kWDFlwyzsH2aTYmJEQ5p56+2jxkueDLD+2BbNQm4=;
	b=KBeAZOm+NZa0uENDqlgvMj8nltqeah6K1RUhIUV4K8BNHXo1OF05Lu4zUMQIFfJIgS/7pD
	GrG0wdSdZNJ0OCCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781266917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj6kWDFlwyzsH2aTYmJEQ5p56+2jxkueDLD+2BbNQm4=;
	b=Z8oLmNHpx/voAvXdRjpzNg4tjt0Sa5FF6L85Er9gvo8Dda29f0znME2jSwmbDkbN1lYccz
	O+L15l9Li1JKxhTn85HDObjK7e3T17x6g53ow8Am7PkLQgNr/o2aYKrmC76GcBG8a9Rxz/
	tbceDmV2ytleXmNgl5XhH3OGFxdqLj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781266917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj6kWDFlwyzsH2aTYmJEQ5p56+2jxkueDLD+2BbNQm4=;
	b=KBeAZOm+NZa0uENDqlgvMj8nltqeah6K1RUhIUV4K8BNHXo1OF05Lu4zUMQIFfJIgS/7pD
	GrG0wdSdZNJ0OCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95BD8779A7;
	Fri, 12 Jun 2026 12:21:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FslcI+X5K2rpKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 12:21:57 +0000
Date: Fri, 12 Jun 2026 14:21:57 +0200
Message-ID: <87zf10gd96.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cameron Graham <cam.graham@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk 800 G5 Mini
In-Reply-To: <CAG-YL0jyJ=oFCBJ7rfsP9Ocqr5jO1V32s1Bx9kgPEitTaksqyQ@mail.gmail.com>
References: <20260612094601.1209845-1-cam.graham@gmail.com>
	<874ij8htz5.wl-tiwai@suse.de>
	<CAG-YL0jyJ=oFCBJ7rfsP9Ocqr5jO1V32s1Bx9kgPEitTaksqyQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.975];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 12 Jun 2026 13:59:21 +0200,
Cameron Graham wrote:
> 
> 
> On Fri, Jun 12, 2026 at 11:35 PM Takashi Iwai <tiwai@suse.de> wrote:
> 
>     Applied to for-next branch now.  Thanks.
> 
>     Takashi
> 
> Thank you for the review!
> 
> Could this please be considered for stable backport to 7.0.x? It fixes
> a real hardware regression for the G5 Mini users, particularly media
> center users using Libreelec, where kernel updates are somewhat
> cautious.

For that, you should have added Cc to stable in the patch along your
Signed-off-by.  Now I added it manually and re-pushed.


Takashi
