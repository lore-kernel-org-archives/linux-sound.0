Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7C154433;
	Mon, 20 Jan 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361633; cv=none; b=rkh0soZVHINou3Vv2ZQciXlu5X1IRAakWX4PYY/hw3qLxMQ2P0Al651sx3CFJdtcJ3nG+mp7l3N2wn44W39SkS2KFBNY6bXdqunALZ9gissafPP/AsEnhUe0iPEy+gJ6t7B4nmibVrar40XslkfcC+NSA/A2aKEiAhZDnLrBqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361633; c=relaxed/simple;
	bh=EqGCYuajAiEV9G14P0/ghFNJVD+YFei0XsTECpYLP08=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gba18PAPAPfud6U4UmcQ6B5KbONqimFrD4LUZVFiXwL/dXNEs2x+lYQlSSGaXTwBEgMsn6Ze9Xc9L8Wid/7rQgGBdCA0YWZKmEqZNZdSDiUXj9wtmyclZJMSKonEWirziTW4VdDXJWwg5x5bEcbtlcH+xpy+ryg1/VzBVILolsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AChhXTsv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d6Kx04MT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AChhXTsv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d6Kx04MT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AChhXTsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d6Kx04MT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AChhXTsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d6Kx04MT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0AE0D1F7A1;
	Mon, 20 Jan 2025 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737361630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVP06ucTpHh7gUa3Itr4yGzD02d8uIzkB0WfCijHvmM=;
	b=AChhXTsvtugvxHbfJz9azHjdkK79MPnd4aIqM444j5QRCYLHFv7GRlhlPlKSuD2WjG5ZyI
	QwoBN/dYmQeJvH/8d1mRkDY4iIf6asYw1DUf0TqvahqFL6KZuKSjcT+S9PMXqNKzw9eN77
	51JxC6RLq6BajbmL9HsZjjEw8xVp5ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737361630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVP06ucTpHh7gUa3Itr4yGzD02d8uIzkB0WfCijHvmM=;
	b=d6Kx04MTINLIu1sltspR1pyTEqfv2VvqrF666brw6OUoHdNLAfWVvz9iz0xfHSaKPKHiUj
	C667xa09sVw3tdAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737361630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVP06ucTpHh7gUa3Itr4yGzD02d8uIzkB0WfCijHvmM=;
	b=AChhXTsvtugvxHbfJz9azHjdkK79MPnd4aIqM444j5QRCYLHFv7GRlhlPlKSuD2WjG5ZyI
	QwoBN/dYmQeJvH/8d1mRkDY4iIf6asYw1DUf0TqvahqFL6KZuKSjcT+S9PMXqNKzw9eN77
	51JxC6RLq6BajbmL9HsZjjEw8xVp5ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737361630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVP06ucTpHh7gUa3Itr4yGzD02d8uIzkB0WfCijHvmM=;
	b=d6Kx04MTINLIu1sltspR1pyTEqfv2VvqrF666brw6OUoHdNLAfWVvz9iz0xfHSaKPKHiUj
	C667xa09sVw3tdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5349139CB;
	Mon, 20 Jan 2025 08:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B+ZbKt0IjmclLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 08:27:09 +0000
Date: Mon, 20 Jan 2025 09:27:09 +0100
Message-ID: <87plkhq49u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan_richards@creativelabs.com,
	wychay@ctl.creative.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH v3] ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions
In-Reply-To: <x3glr6fetk7d7hlqimkv6g5krz2oibe7yusms3d7zk4ofrhlrx@75avihssncc5>
References: <x3glr6fetk7d7hlqimkv6g5krz2oibe7yusms3d7zk4ofrhlrx@75avihssncc5>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,perex.cz,arndb.de,vger.kernel.org,creativelabs.com,ctl.creative.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Mon, 20 Jan 2025 02:10:30 +0100,
Ethan Carter Edwards wrote:
> 
> There was a lote of code duplication in the dao_clear_left_input() and
> dao_clear_right_input() functions. A new function, dao_clear_input(),
> was created and now the left and right functions call it instead of
> repeating themselves.
> 
> Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com/
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>

Thanks, applied.


Takashi
