Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED0366074
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290660; cv=none; b=TnQZAxmhmtbwWQpVHCDaC/eySgqEXgtAizU8XvkZmf4+UI36EYOHspW+6VFgWgWJtulj/fs0pJgsW0vK1oyBcFfoG/YZE3CQv0Bs0SVdkdrZu3kNL0/txj1hHwkzMDDb7NTCsiO8Z4jIeT2CxbzYMT4eOFJgEDemjAuNN6NldII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290660; c=relaxed/simple;
	bh=/xlvKsw6Gu/lK27ADDuh1f8nwdAZ0aQHlCObbmz75YY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IyBYGgyFiBGkIlxeG9bLR364uDjthWNLygPdB72Va3FKmtblE7KxpMnioJDlAwua5wlNNdh0+didf7Q5RgWAMbgj467NSi4jRrX8svbwmiue+Bxc4AbAQs2UoV6/oaz9JB0ybErwPrQbz4cTIurmUWtXRphYpO6oxPbQzbsLNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TaU1EZdC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IBnGLRKZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TaU1EZdC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IBnGLRKZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TaU1EZdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IBnGLRKZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TaU1EZdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IBnGLRKZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30A0E6A8FE;
	Mon, 27 Apr 2026 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vi/1oICQzj9j2iupgzHMO/BDWgBj1gKfRIjR0yCs13Y=;
	b=TaU1EZdC9/GQKvMmlZHD81me069JoBvI3F0m9QMIA1qFBcoQYzb/hYuBKhRsfQ/gTGOAV8
	uWwFt7ecX3vYpTqEc8Ux9gX81xf+3+xN2w8grcoaohDTBj3TL5ZLoSdRzD79TJLhQBcyIX
	57gQ05dIosBxu/OebWkU6VqBt1wJyBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vi/1oICQzj9j2iupgzHMO/BDWgBj1gKfRIjR0yCs13Y=;
	b=IBnGLRKZwvUs5wlXMqUPlsP9XtslGWkcLmk/khGeUI/l3gLwR6NWZC5cSxn8htujKNQ5Js
	MuqiHQTAP8aYWbCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TaU1EZdC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IBnGLRKZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vi/1oICQzj9j2iupgzHMO/BDWgBj1gKfRIjR0yCs13Y=;
	b=TaU1EZdC9/GQKvMmlZHD81me069JoBvI3F0m9QMIA1qFBcoQYzb/hYuBKhRsfQ/gTGOAV8
	uWwFt7ecX3vYpTqEc8Ux9gX81xf+3+xN2w8grcoaohDTBj3TL5ZLoSdRzD79TJLhQBcyIX
	57gQ05dIosBxu/OebWkU6VqBt1wJyBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vi/1oICQzj9j2iupgzHMO/BDWgBj1gKfRIjR0yCs13Y=;
	b=IBnGLRKZwvUs5wlXMqUPlsP9XtslGWkcLmk/khGeUI/l3gLwR6NWZC5cSxn8htujKNQ5Js
	MuqiHQTAP8aYWbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCE5A593B0;
	Mon, 27 Apr 2026 11:50:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MsWaNJ9N72lgcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:50:55 +0000
Date: Mon, 27 Apr 2026 13:50:55 +0200
Message-ID: <87mryozko0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: aloop: Fix peer runtime UAF during format-change stop
In-Reply-To: <20260424-alsa-aloop-peer-stop-uaf-v2-1-94e68101db8a@gmail.com>
References: <20260424-alsa-aloop-peer-stop-uaf-v2-1-94e68101db8a@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[8fa95c41eafbc9d2ff6f];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 30A0E6A8FE
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Fri, 24 Apr 2026 14:48:41 +0200,
Cássio Gabriel wrote:
> 
> loopback_check_format() may stop the capture side when playback starts
> with parameters that no longer match a running capture stream. Commit
> 826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") moved
> the peer lookup under cable->lock, but the actual snd_pcm_stop() still
> runs after dropping that lock.
> 
> A concurrent close can clear the capture entry from cable->streams[] and
> detach or free its runtime while the playback trigger path still holds a
> stale peer substream pointer.
> 
> Keep a per-cable count of in-flight peer stops before dropping
> cable->lock, and make free_cable() wait for those stops before
> detaching the runtime. This preserves the existing behavior while
> making the peer runtime lifetime explicit.
> 
> Reported-by: syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8fa95c41eafbc9d2ff6f
> Fixes: 597603d615d2 ("ALSA: introduce the snd-aloop module for the PCM loopback")
> Cc: stable@vger.kernel.org
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
