Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C663E5A1C
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917507; cv=none; b=cHDyPS41WoH+DdhNKjpjqugy9oYlNfs4CFaAw7KYvTElPHrjW/zx/s/+ClqObqCOGHi+U5ICnwLNtE3AJNFkaFi7Bh5/Hp0ECztr10IkXK4W8V5Zxb9N9fgXm/C/V08m5/h7e9QI1Op9mygkrZcC9FpgG2RVu9UnOA7EWGPtExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917507; c=relaxed/simple;
	bh=cqxh7qvMAZ7yfgGZ0UJ7+X83/R8JWb53aSHHvKSCjb4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKbBIz8regGvvq+nrlz9sbDofmCqdWY5U/pTO3Zrl7Tu+u9/kkHOqUvLAJy5uQdKuRhy6RULjfGK/o5xzmtM5PYIRtR2Li4XsX2MzHBMrso4gtnU+yax6WunU6dsYI7J5xiz39H/zEvnc7xlkwcUElE4BwKz4RX3Igr+OwLxcuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fRS+1bp+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zp15hU1Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NaL9vuxI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3mPVmSjo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fRS+1bp+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zp15hU1Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NaL9vuxI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3mPVmSjo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 193B83E1C;
	Wed,  5 Aug 2026 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785917491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAY6QFDxub0qwbyomMYKBq+Y9oG620uEL5xrkZ6iGqc=;
	b=fRS+1bp+d86BPpwKIX2MHVgOaDqeHb2Emes4OLq8uxc1Dslchfnf4EGwxmmBtDBEdfqcTO
	jbXdgMXwuPeMsL25l0YhlG6Ug2JLR3TiXHYBg0dTtxrTxGL2JyNDDa3sHN2Zj4ZwLhjrMw
	Dqj4/r/KHPRZtbdUmOwaRpdk2GDT11Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785917491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAY6QFDxub0qwbyomMYKBq+Y9oG620uEL5xrkZ6iGqc=;
	b=Zp15hU1Yc5XA0Fz95X+bryq4q+lYSQ10X/3yU1tcEgPIBxPkhmZ927xQG3KT/jBYoqnWMA
	LjR9Ov6MS8Rfh8DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NaL9vuxI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3mPVmSjo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785917487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAY6QFDxub0qwbyomMYKBq+Y9oG620uEL5xrkZ6iGqc=;
	b=NaL9vuxIidhXAPlJ26zvjWP018buInNDKzvtIxoK30vDEjYtHrZR68OuLlEot42nX0nijd
	UNfbHN6dFvzsstyecniQUp5r5IbjumJnhvGGRl7wGHjRHSTn64fJFrMLe/JY7Vf3hLNMjw
	fLKiJ9Xq4KQONFRtTPAc8IzVLYflI9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785917487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAY6QFDxub0qwbyomMYKBq+Y9oG620uEL5xrkZ6iGqc=;
	b=3mPVmSjo3bG/AJqXy+9yBJ+ESL1BrOx0zuxtKMYRhrojEOIL+0HNIRankbgjPWwJff2p6L
	IggEE19JgkKJFGAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C153E779B6;
	Wed,  5 Aug 2026 08:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9AHwLS7wcmpVZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 08:11:26 +0000
Date: Wed, 05 Aug 2026 10:11:26 +0200
Message-ID: <87bjbhgf69.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Ma <mapengyu@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	Lei Huang <huanglei@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>
Subject: Re: [PATCH v2 1/2] ALSA: hda/realtek: Fix headset mic on Legion AW88399 laptops
In-Reply-To: <20260804185325.22861-1-mapengyu@gmail.com>
References: <20260804185325.22861-1-mapengyu@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.it];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,outlook.it,kylinos.cn,realtek.com,gmail.com,starlabs.systems];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 193B83E1C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 04 Aug 2026 20:53:24 +0200,
Aaron Ma wrote:
> 
> The ALC287 codec on Lenovo Legion AW88399 laptops does not mark
> the combo-jack microphone as a headset mic, so the HDA parser
> treats it as a plain microphone. The headset microphone route
> and inline headset buttons are therefore unavailable.
> 
> Enable Realtek headset mode without treating the jack as a
> headphone microphone, and enable headset jack button handling.
> Suppress automatic microphone selection so the internal microphone
> remains selectable while a headset is connected.
> 
> The existing 0x1d override is redundant: firmware already marks
> that pin unused, and the override triggers a "SKU not ready
> 0x411111f0" warning. Drop it.
> 
> Signed-off-by: Aaron Ma <mapengyu@gmail.com>
> ---
> Changes in v2:
> - Based on the original 1/3 (df2538d54b3c0 "Use AW88399 I2C fixup
>   chain on Legion machines"): reworked to enable headset-mic mode
>   and inline buttons.

Applied both patches to for-next branch now.


thanks,

Takashi
