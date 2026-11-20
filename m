Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194676;
	b=AGOvT9fosfJNJrPWQkdMI5eYcwGL0DmLFB4JUM1R418QSBwCfj7VpWz5OXZmETgBRN/D
	 OvCUxCjIa+QgbftFtCUNwqWo59+yRu+nif3G/KuKrkbl1A6m1AWo0xV4dda7bTwYjko32
	 SYO+1ws699gLDQmE8kppXmc5DuMYl/c3LJs9ilCyGyp+BOBnHmzRz8/0UVCNVtlTTUnEA
	 D0Jm9urPBoIk3pcf5zQ6JVnlnndXpm9mjazlSe+tChRrQhPj91jHEW47776DMOwkFeloI
	 xhCywPkx3UCWytr+83w5ua2mciWKJjE+BVzOD/VBWkSEUOJG4QxNrtbBwPTs9Xs5rYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194676;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=BMhJLGM4R0hAAte+jrWrfnwdVN1OkvRty9pCgJV9iEc=;
	b=icb4d9qXrg5OHKGGue66pUDpzmXpzZThTtmdF1PVgpmEdLrRd/+rF+PHBVe7qG1DMhl4
	 CbwgezzzAAXoDKv2r1A4WcFfacbQmF0VQdP7GQaO9gu5uQwZgZkVnzjS3Ka5tzlarKgI4
	 xvnbgAmKY62FAlSkoqFtOJZwbZXS3GqRECMuyNpDN/jBMQ9v4Y0ojJBiFXU0aFdxUg6N3
	 u8PneF7pnoJ1eNvKLf+d/pfxy5WGqUP2h7zPAmTMvyNSqMdIXqHdB4p2hRi/gQFOVxTpT
	 bSW3LK46w70/CUR4F8Mwtbru3For8CLQpySlkY6oSqcZFxdSqtH5utF1Wpngbq996LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WHbF29ci;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QXbriu9I;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WHbF29ci;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QXbriu9I;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FF60A2610;
	Fri, 20 Nov 2026 17:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7FF60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WHbF29ci;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QXbriu9I;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WHbF29ci;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QXbriu9I
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95B0122592;
	Fri, 20 Nov 2026 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMhJLGM4R0hAAte+jrWrfnwdVN1OkvRty9pCgJV9iEc=;
	b=WHbF29cik8Ru9RKxO+OfwJIAf5SD+CAJ56v1xz/1f2i8U5QlTxh6wwMfTglX83QVyNq/TH
	JQJeuaRmxHijnE0YiOWa9s4FifZlIM4bOMuCcPNWAnhAmIFML/+ZzMnul0PrgBArw0cNUQ
	X9pflJPC3HWqnRMcGZ11D9SZOrg0JIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMhJLGM4R0hAAte+jrWrfnwdVN1OkvRty9pCgJV9iEc=;
	b=QXbriu9IqGQVZMGqFy3UCVsp9oHFKDbZKxec5fW9g9ittup7flTKFmFW6hWbM2khdHznvt
	1Idbz2E+aPjOoWBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMhJLGM4R0hAAte+jrWrfnwdVN1OkvRty9pCgJV9iEc=;
	b=WHbF29cik8Ru9RKxO+OfwJIAf5SD+CAJ56v1xz/1f2i8U5QlTxh6wwMfTglX83QVyNq/TH
	JQJeuaRmxHijnE0YiOWa9s4FifZlIM4bOMuCcPNWAnhAmIFML/+ZzMnul0PrgBArw0cNUQ
	X9pflJPC3HWqnRMcGZ11D9SZOrg0JIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMhJLGM4R0hAAte+jrWrfnwdVN1OkvRty9pCgJV9iEc=;
	b=QXbriu9IqGQVZMGqFy3UCVsp9oHFKDbZKxec5fW9g9ittup7flTKFmFW6hWbM2khdHznvt
	1Idbz2E+aPjOoWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 146441342D;
	Fri, 20 Nov 2026 17:11:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WTcROS9/AGsvUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:11:12 +0000
Date: Fri, 20 Nov 2026 18:11:11 +0100
Message-ID: <874idbwhqo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Avoid reading beyond ELD monitor name
In-Reply-To: <20261120124607.2799-1-sreekuttan2156239@gmail.com>
References: <20261120124607.2799-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -12.30

On Fri, 20 Nov 2026 13:46:07 +0100,
Sreeraj S Kurup wrote:
> 
> snd_parse_eld() checks that mnl bytes are available in the ELD
> buffer, but passes mnl + 1 as the source size to strscpy().
> 
> When the monitor name is not NUL-terminated and the buffer ends
> immediately after the mnl bytes, strscpy() may read beyond the
> provided buffer.
> 
> Copy exactly mnl bytes and explicitly terminate the destination
> to avoid accessing a byte beyond the validated input length.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
