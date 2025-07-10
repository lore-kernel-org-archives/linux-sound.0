Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AAF27A916
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162830; cv=none; b=BwtdSnN7fu9P0WfqG1TzyZvGXgR7Ga3EoHyxUoE22tPoyAy/DeiTb+/ZCkeDYL6UabviZorBwmCmZLMWplW70OB2ZXJhDLiOaYJ63Fh7QO57Di9bd4x7y96YCb2trQHkDpZ+Y419b+o4UkQ1uqsxu0028DmGNP8Wsdm3ltupJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162830; c=relaxed/simple;
	bh=IkBoNhttrTtkaubDJe8GX/zJdY0BaFLFvaMb15n9VAQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBrNMqO4nLqtR592Hx4RN37eoatcYUUMTVJSv45I52dNwVuTXhMkMveqnBH9gcASAB3Z7I9/M2qsGqvxScMhf1lAmtTWP35NSD2dDQsR0C1XBDvdhhsbDalVQK9NF6MCjW4GNizFdLH28r8oaVgA9S/7sCch7OyE8x7nhnCMNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZjqwG/BZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BozYFRGQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZjqwG/BZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BozYFRGQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZjqwG/BZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BozYFRGQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZjqwG/BZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BozYFRGQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EAFF1F457;
	Thu, 10 Jul 2025 15:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752162824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43gQc/GEYmcCJWsGfpJtKf771cWtvI+yuBklyQeWbPQ=;
	b=ZjqwG/BZeFzEdOOkwcd9O6iVDw3kwYyHpCuNdL9HohMk1d116i6xAVmvs89qh1+KLfNU1A
	YlHMfvIooDXkYbk4rT1yIRKvlbgEV+e2Hf86aIOld46OnbD1RBd2UC4RWwX0NauSpXbAS9
	S37bxyN1SB/E3Vb4GI2vliJFjRKwxYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752162824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43gQc/GEYmcCJWsGfpJtKf771cWtvI+yuBklyQeWbPQ=;
	b=BozYFRGQ8dEAFQ+2NXRdq/oWbxNPw06h/d13X9oVtNCZLyuy90GjQJMPiW2S27lzeGkBrm
	E1l/BA9cJDyUYsBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752162824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43gQc/GEYmcCJWsGfpJtKf771cWtvI+yuBklyQeWbPQ=;
	b=ZjqwG/BZeFzEdOOkwcd9O6iVDw3kwYyHpCuNdL9HohMk1d116i6xAVmvs89qh1+KLfNU1A
	YlHMfvIooDXkYbk4rT1yIRKvlbgEV+e2Hf86aIOld46OnbD1RBd2UC4RWwX0NauSpXbAS9
	S37bxyN1SB/E3Vb4GI2vliJFjRKwxYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752162824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43gQc/GEYmcCJWsGfpJtKf771cWtvI+yuBklyQeWbPQ=;
	b=BozYFRGQ8dEAFQ+2NXRdq/oWbxNPw06h/d13X9oVtNCZLyuy90GjQJMPiW2S27lzeGkBrm
	E1l/BA9cJDyUYsBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4F15136CB;
	Thu, 10 Jul 2025 15:53:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nA/FMgfib2g0UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 15:53:43 +0000
Date: Thu, 10 Jul 2025 17:53:43 +0200
Message-ID: <87o6tsvy7s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ahelenia =?ISO-8859-2?Q?Ziemia=F1ska?=
 <nabijaczleweli@nabijaczleweli.xyz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: emu10k1: fix "for/take a while" typos
In-Reply-To: <6fvir6xkdvdu4pfo7hcv7zucaxosxjqb5t7gklovzcglnfkvc7@tarta.nabijaczleweli.xyz>
References: <e4owjda3hf5vjc2237m3ctokey4qglfrciga6ho24bd4os5awk@tarta.nabijaczleweli.xyz>
	<87tt3kw26n.wl-tiwai@suse.de>
	<6fvir6xkdvdu4pfo7hcv7zucaxosxjqb5t7gklovzcglnfkvc7@tarta.nabijaczleweli.xyz>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabijaczleweli.xyz:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 10 Jul 2025 17:44:20 +0200,
Ahelenia Ziemiañska wrote:
> 
> On Thu, Jul 10, 2025 at 04:28:00PM +0200, Takashi Iwai wrote:
> > On Thu, 03 Jul 2025 20:21:29 +0200,
> > Ahelenia Ziemiañska wrote:
> > > 
> > > Signed-off-by: Ahelenia Ziemiañska <nabijaczleweli@nabijaczleweli.xyz>
> > > ---
> > > v1: https://lore.kernel.org/lkml/h2ieddqja5jfrnuh3mvlxt6njrvp352t5rfzp2cvnrufop6tch@tarta.nabijaczleweli.xyz/t/#u
> > Well, "awhile" is a proper word, AFAIK.
> Yes, but these two uses are clearly typos of "a while";
> "awhile" is used differently: you could do
> -	/* Step 3: Wait for awhile;   XXX We can't get away with this
> +	/* Step 3: Wait awhile;   XXX We can't get away with this
> for example.

That may be true from the strict grammatic POV, but "for awhile" is
seen relatively frequently and loosely perceived.


Takashi
