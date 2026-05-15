Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFB3016F7
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827211; cv=none; b=LGm8dKj5CskGRq5JVRP4ybDPStbQfqxMl7cmApSjlZoCDZty51w1vQ6hEN388gMjkoomxxLBnWLEFpc3FyvwhRLSaUh5XdQx+79rzd+AKcFG5Z1O3ByYrR7dF1si3as3VYvN54OyCghcur4IMRr1/WXmvlmq9xZ0Fjtrb0IUXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827211; c=relaxed/simple;
	bh=vA6owbPed6gzzAQUjuNKzHN1TnKAPG03b8GblY5oYHs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOUc6CngHMu0RnqxSL+IigxdJJmn9dcB5YH8v+WNAIWd/gHY9xBodddZH660PAHV6EvCOpbIWu4pZan2jbZVJytHe+pKCNykgSkU5MOMf8c54YRkUDKbV767ByCrL5na6d7GRiLlHEOCWG7DUvkegKqCLaZJg0ARUfu1Zo1tneI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vbkf/uCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HLYPVQ+T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vbkf/uCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HLYPVQ+T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vbkf/uCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLYPVQ+T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vbkf/uCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLYPVQ+T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21A4B67660;
	Fri, 15 May 2026 06:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gUDnTWEwVTYdVbzIDrQKxgU/oAZbaYARi0F0+cAbMAA=;
	b=Vbkf/uCFDzj10z4AVauCB2edB2tdxX8xH++TlnDgpBu6mYeED23ucjb45cHt7vCcN1Pcdh
	IqYe9O/ZSi0/J7+Lgx/DYF4WiIqd+jdvTvewDx2Tm18bvXypzQzRyhfzLQTf6z/1njbYTg
	P4ix9HutXwWJ0Ru9nho6wzhQCcw5F6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gUDnTWEwVTYdVbzIDrQKxgU/oAZbaYARi0F0+cAbMAA=;
	b=HLYPVQ+TzIHkxDijS1KIXylGRPX9q+Jffs0fUZFJnJKU3w4pLy2/MsPX7lvVpPVI4IYMEZ
	CANGm7ns1ruBu3Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Vbkf/uCF";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HLYPVQ+T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gUDnTWEwVTYdVbzIDrQKxgU/oAZbaYARi0F0+cAbMAA=;
	b=Vbkf/uCFDzj10z4AVauCB2edB2tdxX8xH++TlnDgpBu6mYeED23ucjb45cHt7vCcN1Pcdh
	IqYe9O/ZSi0/J7+Lgx/DYF4WiIqd+jdvTvewDx2Tm18bvXypzQzRyhfzLQTf6z/1njbYTg
	P4ix9HutXwWJ0Ru9nho6wzhQCcw5F6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gUDnTWEwVTYdVbzIDrQKxgU/oAZbaYARi0F0+cAbMAA=;
	b=HLYPVQ+TzIHkxDijS1KIXylGRPX9q+Jffs0fUZFJnJKU3w4pLy2/MsPX7lvVpPVI4IYMEZ
	CANGm7ns1ruBu3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8A7C593A9;
	Fri, 15 May 2026 06:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iI6XM8e/BmovRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:40:07 +0000
Date: Fri, 15 May 2026 08:40:07 +0200
Message-ID: <87ik8puqew.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirga Yuza <dirgayuza123@gmail.com>
Cc: Jaroslav Kysela <perez@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add micmute quirk to Acer Nitro AN515-58
In-Reply-To: <20260510055951.9035-1-dirgayuza123@gmail.com>
References: <20260510055951.9035-1-dirgayuza123@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 21A4B67660
X-Spam-Level: 

On Sun, 10 May 2026 07:58:01 +0200,
Dirga Yuza wrote:
> 
> The Acer Nitro AN515-58 uses GPIO 4 in active-low configuration to
> control the mic-mute LED. This patch adds a fixup to register the LED
> classdev and associate it with the mic-mute trigger, while chaining to
> the existing headset mic fixup.
> 
> Signed-off-by: Dirga Yuza <dirgayuza123@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
