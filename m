Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065FF36E48B
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076780; cv=none; b=gch00D/M3E+T/ltcpM9B4GcIYzYApTPuofDFWw8aVqVDhAQ/QAZyhCvtay0fjlEZ18DEAcqyaLWSYi3W7JeoZUMV9Swr6acT0EJGoHmKz17g4bwQeiJ6bGQcM23WIB/0Lqi4r3Y3pT/kSG6pgSDnZtkhFF3X2pJkNbU+BSa7k6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076780; c=relaxed/simple;
	bh=2DTs6paqo7VZCKjh+M1PcgxbgYJCMEhRPxzfB0/Lw9E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4XSYAQYY4YyJzxP3cWXDqOuHIW/4AKDRoMQuyo7Eanj2nGkfhiNCgjnUnKLzMBOsOeXsyQIra6hirt/QzElREwJQu0gUs6EcERhsl9c0S1+iAYLuu/9iAWmGkONyHAfAYmuswMhypsgY3buP55QH1KFg2uQg6z+DJTGAc2eYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CcsMWEh7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MgBTFsxY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CcsMWEh7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MgBTFsxY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CcsMWEh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MgBTFsxY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CcsMWEh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MgBTFsxY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 191217609C;
	Fri,  3 Jul 2026 11:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTIc8oh+CP733tb/jv9yL2h+AiZvYwd15+ZWHu24bD0=;
	b=CcsMWEh7WoZiu0nUGzvee2s+kXM/3NXAsD39MsCY0rVXFK9Q8GHqDxa9tDjkf+/0YBg1yr
	TG205wCYbgxhaRVepGsor8uAIYvqq3h0rcngbDywzcQWzR+L2EYlshzTosEhi76vuLKyVr
	GDgUZNGKTkPKESeIrXyxT6x+yeVyyvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTIc8oh+CP733tb/jv9yL2h+AiZvYwd15+ZWHu24bD0=;
	b=MgBTFsxYNpT2htk1FtQDWBcnHD+Fp1wuMCnREZY9d5RxXsjfoHp412tvVV3aGIvzY0osQw
	wJNRZKU8m+Z93eDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CcsMWEh7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MgBTFsxY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTIc8oh+CP733tb/jv9yL2h+AiZvYwd15+ZWHu24bD0=;
	b=CcsMWEh7WoZiu0nUGzvee2s+kXM/3NXAsD39MsCY0rVXFK9Q8GHqDxa9tDjkf+/0YBg1yr
	TG205wCYbgxhaRVepGsor8uAIYvqq3h0rcngbDywzcQWzR+L2EYlshzTosEhi76vuLKyVr
	GDgUZNGKTkPKESeIrXyxT6x+yeVyyvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTIc8oh+CP733tb/jv9yL2h+AiZvYwd15+ZWHu24bD0=;
	b=MgBTFsxYNpT2htk1FtQDWBcnHD+Fp1wuMCnREZY9d5RxXsjfoHp412tvVV3aGIvzY0osQw
	wJNRZKU8m+Z93eDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66A43779AA;
	Fri,  3 Jul 2026 11:06:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JNTtF6iXR2qBUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jul 2026 11:06:16 +0000
Date: Fri, 03 Jul 2026 13:06:16 +0200
Message-ID: <87wlvc72on.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] ALSA: Remove redundant open helper return checks
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,xiaomi.com,gmx.us,openai.com,cqsoftware.com.cn,linutronix.de,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 191217609C
X-Spam-Score: -2.01

On Thu, 02 Jul 2026 10:44:37 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series removes redundant error checks after calls to
> nonseekable_open() and stream_open() in the ALSA core.
> 
> nonseekable_open() always returns 0, so checking its return value is
> unnecessary.
> 
> Several users were later converted from nonseekable_open() to
> stream_open(), but the original error checks were retained.
> Since stream_open() also always returns 0, those checks are likewise
> unnecessary.
> 
> As a result, all patches simply remove dead error handling paths with no
> functional change.
> 
> Change in v2 : 
>  - Drop the unnecessary assignment of the return value from
>    nonseekable_open()/stream_open(), as suggested by Takashi.
>  - Merge the individual patches into a single patch series.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (7):
>   ALSA: control: Drop redundant stream_open() return check
>   ALSA: mixer: oss: Drop redundant nonseekable_open() return check
>   ALSA: pcm: oss: Drop redundant nonseekable_open() return check
>   ALSA: pcm: Drop redundant nonseekable_open() return check
>   ALSA: rawmidi: Drop redundant stream_open() return check
>   ALSA: seq: Drop redundant stream_open() return check
>   ALSA: timer: Drop redundant stream_open() return check

Applied all patches to for-next branch now.  Thanks.


Takashi
