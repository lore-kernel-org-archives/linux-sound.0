Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E4381AE9
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 06:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665700; cv=none; b=rz7LsmgupxGNtiyrOIzYOBYWEEG6yEKTwVaH9gtX7PeLqg0B/dUaX/5taBVExY0adn8QNkjdGiqS5XZ5gcEwAjkZo533mt2KPwqMv0jP4kJ8GeirImXtNgZo6DMNaF3OVYD/pQtvdTWB5AtW0K6iBi4Jk6ighy7LPVj0nLt7dts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665700; c=relaxed/simple;
	bh=X844s9SaPHMewT9dgDoOCJo5bojWjLl2KWVQH9nbTtQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XyqlbY719OIF8lMlNXvZ6W8xbG8w2KK9icHRdLWuseD3Ca6n/ophO4ChNv+JZlsqJLQUr+67SfuFR9w0P9sH4pqgm41QTfXXrgv5Vno2dJqZDXanGPXXaDNldvoGPTljRBNOx/RQkfuJuQPwxQUkKmM+Evifc+UAVI8fZp4VBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YqU0TsUU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHlu6Sq7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ik/tONT2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/ogBwZc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YqU0TsUU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHlu6Sq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ik/tONT2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/ogBwZc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65A1C5BD10;
	Mon, 20 Apr 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Wy3RArGhODKu1huOD7kYoEs9mJ8TsBjH8l8+WCtDo=;
	b=YqU0TsUUyucW6um16xmRC3DaLmxX5wpmnGBVawHf0bx2SSPzOB1Plxsr7hXw7d2JpkAfA5
	WeR5w5eRtXQPRW2GAbK6aEF5Jglwpfev7EpfB9JM+6LwDE4ZhzDBKqiMaMVqvFKgr5xvuO
	ITbB8W8zStMpo3ySRva+SA5lTugCuIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Wy3RArGhODKu1huOD7kYoEs9mJ8TsBjH8l8+WCtDo=;
	b=hHlu6Sq7YRUpup0BLUAocUZwQA6eAGoIsOHuU9TZxKEETWIG4CrthfZ/SAWDkRcb93I2C+
	sjLiIo1zCvrCa0AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Ik/tONT2";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8/ogBwZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Wy3RArGhODKu1huOD7kYoEs9mJ8TsBjH8l8+WCtDo=;
	b=Ik/tONT2oWX55awioUCrPu/cDn0DH01DCiuSOfDqY+LHfkHWWaxRkV9FigAcvYCQkdQwGM
	5iRxjew9iIgmCZz2A0PQEbBuFP+g2rX7U/59nKfAWATmiXerR7NHfa8b1CYi1lVPw/DkcY
	1egxk4oZpkgqD68v/pygnxrur8atdzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Wy3RArGhODKu1huOD7kYoEs9mJ8TsBjH8l8+WCtDo=;
	b=8/ogBwZc7M97MzLC9RT+sgcTjQ9Uz0NTICDwDVLJaMMWB+LDT1eJ09phnqty2KU65PPACF
	x0IxcdisHnN+43Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28D49593AE;
	Mon, 20 Apr 2026 06:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uCw8CFnE5WkXDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Apr 2026 06:14:49 +0000
Date: Mon, 20 Apr 2026 08:14:48 +0200
Message-ID: <87zf2yb1k7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yenilmez99 <mehmetcanosma77@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for Acer Nitro 16 AN16-41
In-Reply-To: <20260420053351.547352-1-songxiebing@kylinos.cn>
References: <20260420053351.547352-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 65A1C5BD10

On Mon, 20 Apr 2026 07:33:51 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> The combo jack microphone is not detected/working on the laptop featuring
> the Realtek ALC245 codec, and mic pincfg is the default value.
> 
> So here, add quirk for it and test good.
> 
> Reported-by: Yenilmez99 <mehmetcanosma77@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221344
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Thanks, applied now.


Takashi
