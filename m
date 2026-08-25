Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8BA3CFF65;
	Tue, 25 Aug 2026 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644798; cv=none; b=sj9C6m4bn2tMbYaHTAk4es2LMSLBYDu4bfU8dV/aIgFdCZhVGdX1M3zIpCXTQHty0Q7rS4VZq4BdBbMwMrmSJiqkxSe+oVbpzfySjNWDzbFPRMiKbygs4f2VNkyczOepfoyI+5+X+AdSfTKH7+OsUaU109qPsPpWOwtVd0AIBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644798; c=relaxed/simple;
	bh=n5m1/j4Y4gwDH/HBaLWNuflfiHE2b0JX7p4raQI9MD4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2wSqxd6xLicOKF+EXquMnGH+mNcWx2LWjKl+33oNCzkstihvFcC5/UkdjKnaiGMjqmDOmMVrEM7gZtg6XleHquF9+3F3iM5tU1NRkPFopSK7vkxH1mT+1t3kBH5lGDliiJAh5flpr7qfaYSnbUggb/dX0QoOh6OaWxxOzKQgM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o+4pjZ6b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oMSnqea4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tRDr5KNG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1aKU7Hgx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+4pjZ6b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMSnqea4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tRDr5KNG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1aKU7Hgx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4906D1F78B;
	Tue, 25 Aug 2026 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMWaJJRYuPPY8Ps5wum1jNYqSkp8y1Vg3ryyqNdrmhQ=;
	b=o+4pjZ6birxJPBdb5zckW5WhBPKl++aN2F1lJMfwro3F4Q2iIEgAc3p3c8D1Ol2QBHmQSX
	LmnoK1AEEKzazmzdd8muTqZYleO/f0X5l4odFnI+e99ZpOiLyE3yzwWTQG0JDCwxsMjDDK
	WmRjfvRlzYnVPwO/w6uOl/wwqIXfDu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMWaJJRYuPPY8Ps5wum1jNYqSkp8y1Vg3ryyqNdrmhQ=;
	b=oMSnqea40b2d6Jidv/yVi6DzKq+shXY6WVzvH5iIJ1SJr9xasUYSzoxouoe4fi7GJ9H1no
	Ceup0Rgp3a5Di1Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMWaJJRYuPPY8Ps5wum1jNYqSkp8y1Vg3ryyqNdrmhQ=;
	b=tRDr5KNGjHavQ7NZk/b8jL4k/91wyJtO3iOcXkvdZvn9fRlRcDqKgQMVaz0twTShKA3WI/
	bkv6VDR3iE8ZV2W0KxxA5r6nIH7hKIat32xg3bd0RcN/M5bI7v1l8ZRriURvRw+oY5AqzG
	/w63KZ+5RMnOjBd80LKzURIxT0dt8gM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMWaJJRYuPPY8Ps5wum1jNYqSkp8y1Vg3ryyqNdrmhQ=;
	b=1aKU7Hgx2tA8yv/KXDLuO5QIgr0zQttp403GLXXrHPJzFLUaoO74S5geAwrJl9Rr/TUFCU
	TmzIFCCfFEszFDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0652513332;
	Tue, 25 Aug 2026 07:59:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B741AFhLjWrybwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 07:59:20 +0000
Date: Tue, 25 Aug 2026 09:59:19 +0200
Message-ID: <87ik4ytyug.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	cassiogabrielcontato@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: i2sbus: Check IRQ before requesting it
In-Reply-To: <20260824100730.31601-1-phucduc.bui@gmail.com>
References: <20260824100730.31601-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[sipsolutions.net,perex.cz,suse.com,kernel.org,linux.dev,gmail.com,lists.ozlabs.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Mon, 24 Aug 2026 12:07:30 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
> The return value was passed to request_irq() without checking for
> failure.
> 
> Check the return value before passing it to request_irq().
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied now.  Thanks.


Takashi
