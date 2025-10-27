Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B42246BB7
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574435; cv=none; b=TQ8TyVTBA3JopBROKEHWlbK4WDx8Tp56QXuwUvOTekjDNGQX6cI6XiLSSMmJxJ9ExF9EYrN7/7ky+imO6gq4TIMk3QoSVfqaZi05TVPeEswV4I4e1oZXs7Kvrl97gwI8m56aRmm4jBDBGShu0FtPzf4jwuBgqHbdmoixff4g3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574435; c=relaxed/simple;
	bh=8iAWcRdVxyOVUgJfVh4iBHJb9G5tjEPIEMWIOvX4AtQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7tMWnC0oHXDE9E+K5M1JiP6wna2Bz3CFw6hrzuAlAwfLi6DS2JivTrgOPeQM1IVOERG5woUGRXZRwjf46dXmZKK5lLXRXBjinWY8A0YIVOCVkRX6Tewb84OQ1JF2pLc6CCzz4VjZ4+7oBDfrn9rm+sk9VOl7y/vzs3g7E+HZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLh3IT+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8wAN2Ok+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLh3IT+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8wAN2Ok+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLh3IT+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8wAN2Ok+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLh3IT+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8wAN2Ok+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F82A21A7C;
	Mon, 27 Oct 2025 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaU75B9zi3KhsYJHdZc/4b/IKIx3FxaBjQ+NTC6nHkU=;
	b=mLh3IT+AP3D3sFhbPk553sKBSjGXvhUm3LR3bCY4s+7Tlq1brxl9BnZa55wRu6wwMCqQYf
	1graAxyEznyQ4SF7I7rzrlhyiZlLCD5Ue6KTmcUzONCnXBLmu2RhsjYTgOismpifetMfWz
	eebp6ns/u8+FBNAej/GK+53NBhk+MG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaU75B9zi3KhsYJHdZc/4b/IKIx3FxaBjQ+NTC6nHkU=;
	b=8wAN2Ok+aS/4LZ3HXaK0UfFxN+L+ZXIQ4x533VgIn1Mtf7TbUUOZlXGtqj9g6zSTL0tDwK
	S13rVkRGjwxxr9BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaU75B9zi3KhsYJHdZc/4b/IKIx3FxaBjQ+NTC6nHkU=;
	b=mLh3IT+AP3D3sFhbPk553sKBSjGXvhUm3LR3bCY4s+7Tlq1brxl9BnZa55wRu6wwMCqQYf
	1graAxyEznyQ4SF7I7rzrlhyiZlLCD5Ue6KTmcUzONCnXBLmu2RhsjYTgOismpifetMfWz
	eebp6ns/u8+FBNAej/GK+53NBhk+MG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AaU75B9zi3KhsYJHdZc/4b/IKIx3FxaBjQ+NTC6nHkU=;
	b=8wAN2Ok+aS/4LZ3HXaK0UfFxN+L+ZXIQ4x533VgIn1Mtf7TbUUOZlXGtqj9g6zSTL0tDwK
	S13rVkRGjwxxr9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E95513693;
	Mon, 27 Oct 2025 14:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D7WUHR9+/2j4fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Oct 2025 14:13:51 +0000
Date: Mon, 27 Oct 2025 15:13:51 +0100
Message-ID: <87tszk1lgg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eren Demir <eren.demir2479090@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
In-Reply-To: <20251027110208.6481-1-eren.demir2479090@gmail.com>
References: <87ms5c3elt.wl-tiwai@suse.de>
	<20251027110208.6481-1-eren.demir2479090@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 27 Oct 2025 11:58:10 +0100,
Eren Demir wrote:
> 
> The quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt due to a different board id. This patch enables the existing quirk for the board id 8BC8.
> 
> Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works as intended.
> 
> Signed-off-by: Eren Demir <eren.demir2479090@gmail.com>

Applied now.  Thanks.


Takashi
