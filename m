Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5DB30E84F
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292061; cv=none; b=E0jd2pQiUm3WNDL1/lIHfqdfC/sf+gcIyfTi7P3Umdq38hhT6du7W9kZmvMkNXHC3Cqg+M33NjtV5w2EX+rTVpm6sBAlo9UmDRgjlm+XXp6Nf7lAqnDvF4+ANwCPLxVb0lTVEgbQB8Qy84xUX1/7UmOHZZMF7qd/LQEYTUKN690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292061; c=relaxed/simple;
	bh=Zcs0wA3CpUjA52GjDHAv3O5WhusUk8oVpDflF5Wj1eo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n16Gu27P/06HnHCkf3KxGXe7UFKZNdU/B2grNBW0E+BYdjXc0MswH557RTui1eTp9MG2bUM5rWSqwF55g85ll53PmbPTr4bTpzJx841lFnfNrA+KypmJYgk92cpCpUy/oEk8uxY7t9KofIX7eVrbykWN4QrN31e07C8ZkS5QVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gP6L1CMc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sT0qW7lI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gP6L1CMc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sT0qW7lI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gP6L1CMc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sT0qW7lI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gP6L1CMc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sT0qW7lI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 631C25BD14;
	Mon, 27 Apr 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8EbH2lUgYRw+kLzEQ2Lo65Ftv645L8REemFTzcyUtI=;
	b=gP6L1CMch4utR22NDEBTbK6CZuNR6AeYq4q+oUYqt4W9ofEZKi06669yTIrA8O9FQnkl/8
	T/pOKY85nYJgw8bIZU5NgS1D7tktNPZT3Ph0luE5poZWVLn+CkSBqJros33eNPbIHeTI+k
	ORnNuK3QMEYteX2ntfzQbubKK0myxag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8EbH2lUgYRw+kLzEQ2Lo65Ftv645L8REemFTzcyUtI=;
	b=sT0qW7lIPqtp26I233XLkcDZgi+VmCy6nXrEYAAEddWDqmSxpgN533TNRrCtL0OSXGu06q
	MJSuEys/RwWtkJDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8EbH2lUgYRw+kLzEQ2Lo65Ftv645L8REemFTzcyUtI=;
	b=gP6L1CMch4utR22NDEBTbK6CZuNR6AeYq4q+oUYqt4W9ofEZKi06669yTIrA8O9FQnkl/8
	T/pOKY85nYJgw8bIZU5NgS1D7tktNPZT3Ph0luE5poZWVLn+CkSBqJros33eNPbIHeTI+k
	ORnNuK3QMEYteX2ntfzQbubKK0myxag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8EbH2lUgYRw+kLzEQ2Lo65Ftv645L8REemFTzcyUtI=;
	b=sT0qW7lIPqtp26I233XLkcDZgi+VmCy6nXrEYAAEddWDqmSxpgN533TNRrCtL0OSXGu06q
	MJSuEys/RwWtkJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38E72593B0;
	Mon, 27 Apr 2026 12:14:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fbmuDBpT72mHCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:14:18 +0000
Date: Mon, 27 Apr 2026 14:14:17 +0200
Message-ID: <87fr4gzjl2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yuxuan Qiu <yuxuanqiu596@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: enable mute LED support on ThinkBook 16p
In-Reply-To: <20260424112107.22206-1-yuxuanqiu596@gmail.com>
References: <20260424112107.22206-1-yuxuanqiu596@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Fri, 24 Apr 2026 13:21:07 +0200,
Yuxuan Qiu wrote:
> 
> On ThinkBook 16p systems the platform mute LED is present and
> bound to the audio-mute trigger, but it does not react to Master
> mute changes.
> 
> The affected fixup chain sets up the DAC routing, but does not enable
> vmaster mute LED handling. Because of that, the generic HDA code does
> not mark Master Playback Switch with SNDRV_CTL_ELEM_ACCESS_SPK_LED,
> and the audio-mute trigger never receives speaker mute updates.
> 
> Add a ThinkBook-specific wrapper around alc287_fixup_bind_dacs() and
> enable spec->gen.vmaster_mute_led during PRE_PROBE. This keeps the
> existing DAC binding logic unchanged while allowing the normal generic
> LED path to drive the mute LED.
> 
> Signed-off-by: Yuxuan Qiu <yuxuanqiu596@gmail.com>

Thanks, applied now.


Takashi
