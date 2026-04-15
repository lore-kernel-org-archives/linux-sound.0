Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7526B75B
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256110; cv=none; b=f5Zqu3qTbM1k3U1kXEshm7hLiwtHYwBi3CfJ0tUFMB4QYzsIGhboCiyeBbjSMUyFCxawK394C/sLm2o5jcGT2QrYpk0r7Vwq6hQLbGjfh+cngJEExWWITm9ByWtDpW/5P2Jic/90LvllGY66nCxXi05m5JLKeHu1oicc5DjHoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256110; c=relaxed/simple;
	bh=0/Z5vujM0FnmvHHapwy8T7R3cqZOSlNL+/k19B3UIqo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DgiqQeASz86Ou6oYIIrsgOGdgwQXAxXHRTWMdCPE5lYvKN3/9nYKzIJ4/99EFsuQhVSE6+INVVWJ3m+1BKdCNcjbCfNCIp7Kjzebyb8Ee6cgb+9jmUphJ0khimOZLxY6XPzZx7jL6Uezg8uRsbG2oK1JDGGcZGQEzoncavOU7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OLQS0IQE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+PtFbPyk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OLQS0IQE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+PtFbPyk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OLQS0IQE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+PtFbPyk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OLQS0IQE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+PtFbPyk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 028606A7EB;
	Wed, 15 Apr 2026 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776256106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaHp/AN6cWbTH9q41UVuT3ppiylotkqb31psArtastQ=;
	b=OLQS0IQEJ74kSdupK6A7ayIsXUMhkPAMnnFFqDcKgGZR2H70L7DcuRG268CEhTdFrfyyUH
	hdP7tYsHiAphaj2jl51mvJS0Q8KZd+8LRF2QqGXT55fYwSqKSzsnwiyxFS5HnGVXAdX02c
	mhXh1u9BNlYM4+5olrMAtHK42Zg/+zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776256106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaHp/AN6cWbTH9q41UVuT3ppiylotkqb31psArtastQ=;
	b=+PtFbPykIH0JQTFWNCUzZgFJPahyUtK9gzAHf3WvDA6zcOKPLVFTTAt7qiDtiWkuiSAi1q
	xawlappffDCTZKAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OLQS0IQE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+PtFbPyk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776256106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaHp/AN6cWbTH9q41UVuT3ppiylotkqb31psArtastQ=;
	b=OLQS0IQEJ74kSdupK6A7ayIsXUMhkPAMnnFFqDcKgGZR2H70L7DcuRG268CEhTdFrfyyUH
	hdP7tYsHiAphaj2jl51mvJS0Q8KZd+8LRF2QqGXT55fYwSqKSzsnwiyxFS5HnGVXAdX02c
	mhXh1u9BNlYM4+5olrMAtHK42Zg/+zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776256106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaHp/AN6cWbTH9q41UVuT3ppiylotkqb31psArtastQ=;
	b=+PtFbPykIH0JQTFWNCUzZgFJPahyUtK9gzAHf3WvDA6zcOKPLVFTTAt7qiDtiWkuiSAi1q
	xawlappffDCTZKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6E3C4B9E5;
	Wed, 15 Apr 2026 12:28:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DpzfM2mE32naKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 12:28:25 +0000
Date: Wed, 15 Apr 2026 14:28:21 +0200
Message-ID: <87mrz4flwa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Tidy up error check for processing unit
In-Reply-To: <20260414-uac-build_auto_procunit-refactor-v1-1-afeb7efa6518@rong.moe>
References: <20260414-uac-build_auto_procunit-refactor-v1-1-afeb7efa6518@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 028606A7EB
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 14 Apr 2026 15:29:01 +0200,
Rong Zhang wrote:
> 
> There are two duplicated code paths calling get_min_max() with the same
> arguments in build_audio_procunit(). This once led to a failure to
> notice a code path that caused the `err' variable uninitialized when
> adding error checks for callers of get_min_max*() [1].
> 
> Move cases in the switch-case statement to tidy up the error check by
> merging the duplicated code paths together with a fallthrough attribute.
> This also eliminates the `err = 0' lines and aggregates the error check
> along with the corresponding call together, so that the intent of these
> code paths is clearer.
> 
> The refactor also has an interesting effect that shrinks the .text size
> by 16 bytes (GCC 15 amd64). It seems that the compiler was unable to
> perform dead code elimination for the `err = 0' paths before.
> 
> Link: https://lore.kernel.org/r/ad36dGpCBTGsyFr_@stanley.mountain/ [1]
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied now.  Thanks.


Takashi
