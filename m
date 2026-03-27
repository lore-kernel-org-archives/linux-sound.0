Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5F377EA2
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611792; cv=none; b=CmXTamZ5OHi98EHek4NT+QKylgGdM0YTzZWWGHIzc/87IxDBSu+Gk0U7j6GfoZkD0JkRMLlSep/zKGcrzzWpaznq4iORH++GxSZyBY0d99YdAWH9HzhcKDzyzhtok+n0WOiMdtuy1rSWbNxokyiwsFKkf3dlXoSMymIw8uBGLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611792; c=relaxed/simple;
	bh=B4QezHimBBFH2JftSXQKvBpG+8OBz9ikfoq0LoqEboU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NiJbFYJPWVzbbgQEl271OoKuJ0uJ4dfxJLArME3R0JT9s7kEnsTvdflnwjQT8m9UXbHjRBE5Qm9X9lDe0IIKUn882ymCU+Nlull5TNLAohN1FFlX4wWysWQEeBrEa0vrmgFniI7vngKQdUhv0LLYymaZENht8zBcaJ74kNCMTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EYwM1r5F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zvjH6SJz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EYwM1r5F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zvjH6SJz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYwM1r5F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zvjH6SJz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYwM1r5F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zvjH6SJz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB58B4D338;
	Fri, 27 Mar 2026 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuMof5YbpUOWekkCMRraikna1rNxndYApnVoDpNG1tM=;
	b=EYwM1r5FRG94Ro1HpaEM3VfKdiYby56wApBMCMDoFH1d/7wshusNxgi+2c9pcmQ5Pjxl8w
	xzhcFAkXv7n4V8pzEwpIlYswG2lzQRqpJVpXLnu3q66n1Ys4sz/7DYfwW9H0BpBtsTFmeI
	HZ3R7CPSVhUuN2nve9xITBAfqfrqAog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuMof5YbpUOWekkCMRraikna1rNxndYApnVoDpNG1tM=;
	b=zvjH6SJzbH4SuzK12XzVxupUVJTZuSeKw6/GRDvNoeDEtbws9DRHIYXaPklkcGDxztnB3A
	f4Jzn4oSe/Mrm7BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuMof5YbpUOWekkCMRraikna1rNxndYApnVoDpNG1tM=;
	b=EYwM1r5FRG94Ro1HpaEM3VfKdiYby56wApBMCMDoFH1d/7wshusNxgi+2c9pcmQ5Pjxl8w
	xzhcFAkXv7n4V8pzEwpIlYswG2lzQRqpJVpXLnu3q66n1Ys4sz/7DYfwW9H0BpBtsTFmeI
	HZ3R7CPSVhUuN2nve9xITBAfqfrqAog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuMof5YbpUOWekkCMRraikna1rNxndYApnVoDpNG1tM=;
	b=zvjH6SJzbH4SuzK12XzVxupUVJTZuSeKw6/GRDvNoeDEtbws9DRHIYXaPklkcGDxztnB3A
	f4Jzn4oSe/Mrm7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A0AA4A0A2;
	Fri, 27 Mar 2026 11:43:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SDZrJE1txmmOKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 11:43:09 +0000
Date: Fri, 27 Mar 2026 12:43:09 +0100
Message-ID: <87pl4pqz02.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] ALSA: core/seq: Optimize the return logic in cc_ev_to_ump_midi2
In-Reply-To: <20260325015119.175835-1-songxiebing@kylinos.cn>
References: <20260323024742.220707-1-songxiebing@kylinos.cn>
	<20260325015119.175835-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 25 Mar 2026 02:51:19 +0100,
songxiebing wrote:
> 
> There are multiple early return branches within the func, and compiler
> optimizations(such as -O2/-O3)lead to abnormal stack frame analysis -
> objtool cannot comfirm that the stack frames of all branches can be
> correctly restored, thus generating false warnings.
> 
> Below:
> >> sound/core/seq/seq_ump_convert.o: warning: objtool: cc_ev_to_ump_midi2+0x589: return with modified stack frame
> 
> So we modify it by uniformly returning at the and of the function.
> 
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503200535.J3hAvcjw-lkp@intel.com/
> ---
> v2:
> - fix warning: this statement may fall through [-Wimplicit-fallthrough=]

Basically I don't like to take this kind of change just because a
stupid compiler can't handle it well.  But this particular code change
itself is simple enough, so maybe still worth to take.

Applied to for-next branch now.  Thanks.


Takashi
