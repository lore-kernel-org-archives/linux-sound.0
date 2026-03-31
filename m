Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7427FD49
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939850; cv=none; b=GDnCZohrnfGoXQoy6vIjbQzIo8bWQuYK61WpQ3OppZtuTGB9GX6qVQYr8nxFP8xuE1bbrZunCgT4kNQEQqCi4YLOBFUiJfMfSY6WB8GUv+WX86E7Dr+BFlg0e2TpPK8bDsy2ijncoFWD2mn6mJWt7fhhWjEV2yAKfLvXkxgC5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939850; c=relaxed/simple;
	bh=TOk4PfcseYKwqB3S6uKYZIbOIlmiqMQ2TcqmZqAiTAU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5Kh3/ou21dArFSDeCwHznmLcK8h/FfGlp8Vj6yld9pDwGHVDqHwFhDfs2sQOCwe39/4bD2iFc0GbIQKIPnjs3GffZpEokuooqguDe5WKFj97KhI+HBKhE4PO0EBoH4zYiQS8lLGEXOfnGNQV7Ld5FI28XOeUSz+Z4bUuFrXjpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TWA+iMih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=woQUGh/c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TWA+iMih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=woQUGh/c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TWA+iMih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="woQUGh/c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TWA+iMih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="woQUGh/c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C30EA4D542;
	Tue, 31 Mar 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwoDQY5pYBqRfG2ufiUeMIEu90M+/ormuhNKbfEq5b8=;
	b=TWA+iMihsR2Yw4/xhbbdgWiYwdprlDW41lCBapxwUnH8U1RfY/pdziEev0XPoOeeUc/S6V
	bwjYoYaca6WAokezoT7emROYI1Lttvv/9qPbuYIqnZG+2ICjBYwr1B4u1jrBwW9rx2hHiD
	65c3EfFbRW2gSK0MqyOQimpS6Gu/U5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwoDQY5pYBqRfG2ufiUeMIEu90M+/ormuhNKbfEq5b8=;
	b=woQUGh/cGyJyc+WiR6KNjToiX3qmlFyJhYPGkCACuSxsfg/zLhb9bEjU7AnlTDsaGjLvc3
	R7VSonF95bji1VAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774939847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwoDQY5pYBqRfG2ufiUeMIEu90M+/ormuhNKbfEq5b8=;
	b=TWA+iMihsR2Yw4/xhbbdgWiYwdprlDW41lCBapxwUnH8U1RfY/pdziEev0XPoOeeUc/S6V
	bwjYoYaca6WAokezoT7emROYI1Lttvv/9qPbuYIqnZG+2ICjBYwr1B4u1jrBwW9rx2hHiD
	65c3EfFbRW2gSK0MqyOQimpS6Gu/U5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774939847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwoDQY5pYBqRfG2ufiUeMIEu90M+/ormuhNKbfEq5b8=;
	b=woQUGh/cGyJyc+WiR6KNjToiX3qmlFyJhYPGkCACuSxsfg/zLhb9bEjU7AnlTDsaGjLvc3
	R7VSonF95bji1VAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98F2F4A0A2;
	Tue, 31 Mar 2026 06:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OLERJMduy2n5MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 06:50:47 +0000
Date: Tue, 31 Mar 2026 08:50:47 +0200
Message-ID: <875x6ctrug.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: add quirk for HP Laptop 15-fc0xxx
In-Reply-To: <20260331013536.13778-1-zhangheng@kylinos.cn>
References: <20260331013536.13778-1-zhangheng@kylinos.cn>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 31 Mar 2026 03:35:36 +0200,
Zhang Heng wrote:
> 
> For the HP Laptop 15-fc0xxx with ALC236, the built-in mic 0x12 was
> not set up, making it unusable; after adding it, it now works properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221233
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
