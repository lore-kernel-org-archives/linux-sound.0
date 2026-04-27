Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962830E84F
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292091; cv=none; b=q/88uRlsyHX6102/Uz/M35VQY4QcR6/0+hIjuOyL90ktwg0e4hsI1ubAR5ndJL2fYeFHlX9Rce9hRjQ1+EG+Z+DnrAMjjLq1On6eLddVIZMAVxzz61kbIvSkPEOebWo49D9dLNXV+CjKy3qnbvCFwvkfHqKoq7yBMy/Tk8oeLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292091; c=relaxed/simple;
	bh=XrR8UQT3SYZEIZPgw4Q27ERO78nahVhqymlOUnOBBjY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=My0iNwJoFLcQLtfShEkkacbClPu8XTVjyYozZpgpbqTcQ7b+95Pr9aZdsQ3sRwTEJ4GY3UWVg3fWflF2bcOAJcEg3+6JyjZyox6zJ7GKg9CxPXN+eER2s8fuuttP/FAtcIjZZkNuTZ5w2DN7muCzy+dAHw+m8Mnw0HJMeQ1vwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fxJJ/bCw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1wYDpe0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fxJJ/bCw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1wYDpe0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fxJJ/bCw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1wYDpe0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fxJJ/bCw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1wYDpe0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86B945BD1D;
	Mon, 27 Apr 2026 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU0u6OWxd8mWZq1+vve2FcXArW1AAS9q83WyUtVHBXA=;
	b=fxJJ/bCw2dz7o3hUFDtwLgDqfsuYnBE1rMzEMnUPdz3mRg1LW4JjQ4uni3irlLbrzd83zG
	6V1tHGL6F67Tqpjrj/wfclTqpQVqQsu8iJBcitr2SuZkJdBFuJ6QqowMVlGPDqHv1tFqpe
	7Ktk7cNh4xZWKriAKlA+FJ6F747VSno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU0u6OWxd8mWZq1+vve2FcXArW1AAS9q83WyUtVHBXA=;
	b=b1wYDpe0FoEuBwjdz+jmW67vbVggloUUq6SNkeR12W7buuBGD/iyiRyb12lg8lAf8UEcIq
	y4b7mos2IzELXUAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fxJJ/bCw";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b1wYDpe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU0u6OWxd8mWZq1+vve2FcXArW1AAS9q83WyUtVHBXA=;
	b=fxJJ/bCw2dz7o3hUFDtwLgDqfsuYnBE1rMzEMnUPdz3mRg1LW4JjQ4uni3irlLbrzd83zG
	6V1tHGL6F67Tqpjrj/wfclTqpQVqQsu8iJBcitr2SuZkJdBFuJ6QqowMVlGPDqHv1tFqpe
	7Ktk7cNh4xZWKriAKlA+FJ6F747VSno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU0u6OWxd8mWZq1+vve2FcXArW1AAS9q83WyUtVHBXA=;
	b=b1wYDpe0FoEuBwjdz+jmW67vbVggloUUq6SNkeR12W7buuBGD/iyiRyb12lg8lAf8UEcIq
	y4b7mos2IzELXUAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5947F593B0;
	Mon, 27 Apr 2026 12:14:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3hNZFDhT72k+CwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:14:48 +0000
Date: Mon, 27 Apr 2026 14:14:47 +0200
Message-ID: <87eck0zjk8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Naser Al-Asbahi <nasserqahtan0@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A315-44P
In-Reply-To: <20260425154014.83982-1-nasserqahtan0@gmail.com>
References: <20260425154014.83982-1-nasserqahtan0@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 86B945BD1D
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 25 Apr 2026 17:40:14 +0200,
Naser Al-Asbahi wrote:
> 
> The mic-mute LED on the Acer Aspire A315-44P (subsystem ID 0x10251640)
> does not light up when the microphone is muted. The LED is connected to
> GPIO3 of the Realtek ALC256 codec.
> 
> Add a quirk entry using ALC256_FIXUP_ACER_SFG16_MICMUTE_LED, which
> configures GPIO3 (bitmask 0x04) as the micmute LED, identical to
> the Acer Swift SFG16.
> 
> Tested by manually sending HDA verb commands directly to the codec
> and verifying that GPIO3 drives the LED while GPIO1 and GPIO2
> do not.
> 
> Signed-off-by: Naser Al-Asbahi <nasserqahtan0@gmail.com>

Thanks, applied now.


Takashi
