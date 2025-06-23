Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3727585C
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691303; cv=none; b=QnhVyUj8D+RYAIBZJafWmKVZ24b12kw7HzpwUD/t3YrRzQSS11YQjLwKOebQ/yPqIpWR3vceCya0iKjsOaINAuxZ740dZwS4SuWycNP3wTiCvqVdjEa9WrEKPNZvwOEPDodABr+W+ZrIqKQ77nMgAeCbcVS8GkwItXa9D578OOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691303; c=relaxed/simple;
	bh=lCHEKHDTBGA7sngthTxGgEm0DdxCj/5wv0WcOAMH1rc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnDsEn0n0oWiUb8yo3QGAoLjstmHo8axO0xSyWyqWhiy8wVWAw0prgj3MaNaWmNM/3RhCbNpGjkWgNgEfhQGFUv6nsUR/OFoaiBEBKDdmcsHL7uSwTgpHUZAdzkJN/FHroWxkYnqWIqGEtuRMdK5xq/KaEj35RkdF2Zbh/26JOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oBEnQcLd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qzjn4OTv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g2BfOa9Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bJ19qL1M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oBEnQcLd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qzjn4OTv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g2BfOa9Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bJ19qL1M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFF081F391;
	Mon, 23 Jun 2025 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm17F0qCMLZaEtjGisUEhzTepmYvnFzS3mvvaRneJAw=;
	b=oBEnQcLd/BH6a1PaEqTZA9wn786AWwaK1mYUp8QsmDXV0Rr+SxYUh/nI5J4YZLpQbyJXIW
	tfrZNjNBUX7adiTLavlzHI9nohmi8BKyD0igVKeKGBGkN7kIfOq/Hd2FusIWLj1w+nB6K8
	AFhmCX3OmHRZznilLK/EfEWWr65ynZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm17F0qCMLZaEtjGisUEhzTepmYvnFzS3mvvaRneJAw=;
	b=Qzjn4OTvBiUP252OwBAO0qGPHpMZwgniIIIiJQAcxI3qlA0oBPGevbSrmHfH2tiAGoQn4a
	41th81XD+GWBcvAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g2BfOa9Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bJ19qL1M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm17F0qCMLZaEtjGisUEhzTepmYvnFzS3mvvaRneJAw=;
	b=g2BfOa9QTq+BfDYify54/Qiv/koTrnnA92LGszxSHSe682xY0sChZ3QdTVpWdE3irjVy7k
	D6ZKxUPZQXq6q4D1smiuvz5AQCmlnfU0SoP9RmRsdj66JJNi4YO9fJ3v2a4aSts73GaQj7
	x8sBw1KZHvIHfsi7YLmlTU/4Yz5wLJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm17F0qCMLZaEtjGisUEhzTepmYvnFzS3mvvaRneJAw=;
	b=bJ19qL1MImFgzJ5Yin9PpoZseyeqg70H/ZYqDStrNSqTKvK0VbYh8faWLiKMkJzdA2hBNo
	RR59MkthcJ5gcMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DF3D13A27;
	Mon, 23 Jun 2025 15:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ieiYJONtWWgTdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 15:08:19 +0000
Date: Mon, 23 Jun 2025 17:08:19 +0200
Message-ID: <87cyaumr6k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 6 G1a
In-Reply-To: <20250623063023.374920-1-chris.chiu@canonical.com>
References: <20250623063023.374920-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CFF081F391
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 23 Jun 2025 08:30:23 +0200,
Chris Chiu wrote:
> 
> HP EliteBook 6 G1a laptops use ALC236 codec and need the fixup
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF to make the mic/micmute LEDs
> work.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
