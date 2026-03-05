Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CC23D7E3
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710385; cv=none; b=HlS45HOyD+oMGlwybV/JzZJEPHk5SxWSQutcyOfbUagYBQ3Z0P1/JRzaePIMkRdBg+2n1TExrOXsw9CYP3uNICZcyAKRQxKSInX30Dxd8B4dLaR9fNEzciTQjUGuph73c6ZIFqjeAsL90yNIeTz2kolwhxvY0wyba+WlEKw0594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710385; c=relaxed/simple;
	bh=BaWZwn13PYoi9v+SrZBKOZNx2WV0xvgYNbfIglwzGJc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuEso/L49qEH6enJ6MRpWTnfq80TDmmJ6vSPoIL7g1YX2kWffoQalw9BMwPv19/7raQVtqWmHNPuRUAq0LJYL2JBIKloGmnvL6F6HdPrvaDA+yHXTIYMaaGqpH40T4ikR5nKubACyXglmwb83kBBBx+kBskxpuTHrYKbsVPsiEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8uP4EVq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibJ090aa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8uP4EVq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibJ090aa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8uP4EVq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibJ090aa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8uP4EVq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibJ090aa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4D195BCD5;
	Thu,  5 Mar 2026 11:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AupO18D1YUyp4DceCMAF0Lc8IfzZe+e59Ju9vVF20eA=;
	b=v8uP4EVqp7SGNnXnSe7ife2jYoXJFD9McS7cIwK0MnbukdTKtGO408l50vhiNcL+PLntqZ
	a9FDvhh6ddFkkio107U+Ev8w6k6eOkuLlJcbWPn4EyxYksE+DBS9XNRvWt4tba8cXjIw1C
	OZ9KrBjNB+xxjWYSrp3y0pBxbObw/0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AupO18D1YUyp4DceCMAF0Lc8IfzZe+e59Ju9vVF20eA=;
	b=ibJ090aawHP2fbE13SBaFl1YB33e8RYzacf7cAXsUK8VzgPN7QMZWoxBaJOT9q2KM/gNcj
	9UEmLadDsqWGSXBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AupO18D1YUyp4DceCMAF0Lc8IfzZe+e59Ju9vVF20eA=;
	b=v8uP4EVqp7SGNnXnSe7ife2jYoXJFD9McS7cIwK0MnbukdTKtGO408l50vhiNcL+PLntqZ
	a9FDvhh6ddFkkio107U+Ev8w6k6eOkuLlJcbWPn4EyxYksE+DBS9XNRvWt4tba8cXjIw1C
	OZ9KrBjNB+xxjWYSrp3y0pBxbObw/0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AupO18D1YUyp4DceCMAF0Lc8IfzZe+e59Ju9vVF20eA=;
	b=ibJ090aawHP2fbE13SBaFl1YB33e8RYzacf7cAXsUK8VzgPN7QMZWoxBaJOT9q2KM/gNcj
	9UEmLadDsqWGSXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86F593EA68;
	Thu,  5 Mar 2026 11:33:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id StKMH+5pqWljNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 11:33:02 +0000
Date: Thu, 05 Mar 2026 12:33:02 +0100
Message-ID: <87fr6ey0i9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 1/4] ALSA: hda/senary: Add hardware init verbs and fixup framework
In-Reply-To: <20260305032712.235231-1-wangdich9700@163.com>
References: <20260305032712.235231-1-wangdich9700@163.com>
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
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 05 Mar 2026 04:27:12 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Port the essential hardware initialization logic from the vendor driver
> and introduce the standard HDA fixup framework to handle different
> machine configurations.
> 
> Key changes:
> 
> 1. Add hardware init verbs:
>    - Implement `senary_init_verb` to send the vendor-specific
>      initialization sequence required by the SN6186 chip.
>    - Override pin capabilities for Node 0x19 to ensure proper headset
>      microphone support.
> 
> 2. Introduce fixup framework:
>    - Define a default pin configuration table (`senary_pincfg_default`)
>      to provide a fallback for devices with invalid BIOS configurations.
>    - Establish a quirk table structure for future machine-specific
>      fixes.
>    - Since the standard quirk matching relies on Subsystem IDs, we
>      manually apply the default fixup if `snd_hda_pick_fixup` does not
>      find a specific match.
> 
> This ensures the chip is correctly initialized during probe and resume,
> and provides a scalable mechanism for supporting specific hardware
> quirks.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

This looks already included in sound.git tree.  Please verify.


thanks,

Takashi
