Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D92D7DEF
	for <linux-sound@vger.kernel.org>; Sun,  7 Dec 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765109638; cv=none; b=YayUM3EFfZchtSQH54TDR6BQ6xJ8QLyArackrxkpT5af53U6VMQ5N9R5wv2xsEQAt6XtwSUghSO+03XqFng4DFSjppUJEw5rM/SnOVBWgzpZKj0e8/m/InrkRhWZzER94tGXs2LwXo47TdcmLxGBs5L5k2q0biRB01pVKH3aA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765109638; c=relaxed/simple;
	bh=5fSgQBfmomwrGh9qAfss3utr8288//4JGQ6RiJ5d2Vs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOQewSbs8CrGoz+G3rzY+yfDvu9E/q513EJeidXe9yKe5Qoxy4hBq0RRl6GrVkOxhsg0cSPu8lZP7J3L1+JD8F5w/v5kiVVzsEhdkas5hz22+ayjgpPTeFvQA54cVBob9OFDI30Gs2vKT23RfNhm04CBkeh0zpedXMpsIjO1Qgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fg6vYIGF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ojLvKSL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0q7SW4D0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M71kq5mw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fg6vYIGF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ojLvKSL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0q7SW4D0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M71kq5mw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0B4C5BCF5;
	Sun,  7 Dec 2025 12:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgJ9ab+sO2AgmDiqLL4J9mwYl+yxpceAwnjroD6wI9Y=;
	b=Fg6vYIGFNwMPb3+Fc13BIQYHoqd0odFDatLJZiz1bKmgN52Tu8yJOmuQMIR0CJDlValeG8
	SGQ2wGEOvCY/oLiQ6ePkmHTpydhzTi/8nK8copRbbFUuYFXZhb526CaAiIvbwlBXtzOw/q
	lB5x6XHoddiKXyYKHdoDt0FNUmWLUaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgJ9ab+sO2AgmDiqLL4J9mwYl+yxpceAwnjroD6wI9Y=;
	b=5ojLvKSL+tzoNvjp3msOwiSIlSs83RntYQs5UbmB/RKimpzDC4AZsxUJy65FiCLQlrIfwX
	OytZEqIIN1/F8+Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgJ9ab+sO2AgmDiqLL4J9mwYl+yxpceAwnjroD6wI9Y=;
	b=0q7SW4D0d8jZH7TujUHYPPA38R7gAwAUIcxBa/UpprEoLQYhzQlANKilzW2QbM8Ud7KsBY
	xH4LdtTfG+pDjIeQAGoj/o7z8zKgVSF449VpTu0+E0BIiPS2oTqcl/aWP+OKtkXhhXe836
	hUSXOTQ7X9dueK+HCEjj3t0BujN6HgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgJ9ab+sO2AgmDiqLL4J9mwYl+yxpceAwnjroD6wI9Y=;
	b=M71kq5mwbsC68NyzF5w+/3dICIQAJ7d3rLA4h77qN6VF0fC+xz6JuuQS/lGZhjlWSQeqF4
	WDKPfY/x1c7qMBCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76D5B3EA63;
	Sun,  7 Dec 2025 12:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RS7JG4JvNWkwIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Dec 2025 12:13:54 +0000
Date: Sun, 07 Dec 2025 13:13:54 +0100
Message-ID: <87qzt6v69p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v6 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
In-Reply-To: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
References: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+]

On Fri, 05 Dec 2025 16:46:18 +0100,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add CIX IPBLOQ HDA controller support.
> 
> Joakim Zhang (3):
>   ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
>   ALSA: hda/core: add addr_offset field for bus address translation
>   ALSA: hda: add CIX IPBLOQ HDA controller support

Applied now again.  Thanks.


Takashi
