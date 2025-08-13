Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576832E54C3
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097899; cv=none; b=D/aa5I27/4UU0F3SV8Bbeioz4hMS71xFhmUYPIT1CF5gOEL0IMYo6vBbVr8ntt/P3rhmbTLuJrra+EXgsOzj0mRUCt2PvfcFEjF0b+AMHXzcZ7mm/+EKr7b1W8MbyGFkwT6I0DsG7+qC0dHgyTMT46CnZVwhCWdDR0LvMA2IeWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097899; c=relaxed/simple;
	bh=5Ij/+MJNIyyOUaJ0fG6ovt/hCfN646CIBy36azaVfL4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O89wYL/Kh6c0wEBKTnpS5MSE8lpIohaGfckg5a9/55DSeDCoD7Q7hpjRAxlESreFQCqbEfJ1weOWCF6IK477KhPlfa9x8AgVfK7ZyW6Vjhr609QKHCR7zWMKTNHTGEyumrWzzpLBNx3l8oRU6HfyrC7IANvwmWhRhwX/GD7SZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7yR7Zd1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/S3VESOe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z7yR7Zd1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/S3VESOe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7yR7Zd1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/S3VESOe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z7yR7Zd1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/S3VESOe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 342D821AB4;
	Wed, 13 Aug 2025 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755097895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjXfC0D78hvPgysy6p8guQIlpYoj9JoEkp63jQGXFZQ=;
	b=z7yR7Zd1Wh47O9BWZCfJ4oprprvADaUCRWtYRgWrjIABbdwGq6wqWErKB7O4+/qdRPs/Pm
	881Upw6ah3Aejy7EwJqyhFTAJXxeA6OwDS3d1naIrk323N9MFg3QHQxPXBfQ5xWSgMhJ9M
	pPfGfulwWSgi2HfpxbMHA8Hos1qTcMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755097895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjXfC0D78hvPgysy6p8guQIlpYoj9JoEkp63jQGXFZQ=;
	b=/S3VESOedlmEj75WriaoBCXjM317gGBTC708f+bDGxu4ke9068PzCSt9gYnBLfHJWCJU4X
	NaSqtIWUNRcHvkBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z7yR7Zd1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/S3VESOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755097895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjXfC0D78hvPgysy6p8guQIlpYoj9JoEkp63jQGXFZQ=;
	b=z7yR7Zd1Wh47O9BWZCfJ4oprprvADaUCRWtYRgWrjIABbdwGq6wqWErKB7O4+/qdRPs/Pm
	881Upw6ah3Aejy7EwJqyhFTAJXxeA6OwDS3d1naIrk323N9MFg3QHQxPXBfQ5xWSgMhJ9M
	pPfGfulwWSgi2HfpxbMHA8Hos1qTcMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755097895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjXfC0D78hvPgysy6p8guQIlpYoj9JoEkp63jQGXFZQ=;
	b=/S3VESOedlmEj75WriaoBCXjM317gGBTC708f+bDGxu4ke9068PzCSt9gYnBLfHJWCJU4X
	NaSqtIWUNRcHvkBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0AAA013479;
	Wed, 13 Aug 2025 15:11:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UP3PACernGhoewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 15:11:35 +0000
Date: Wed, 13 Aug 2025 17:11:34 +0200
Message-ID: <87h5ybw921.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Fix compile error with CLASS() after label
In-Reply-To: <20250813150131.GA2842554@ax162>
References: <20250813090039.20064-1-tiwai@suse.de>
	<20250813150131.GA2842554@ax162>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 342D821AB4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 13 Aug 2025 17:01:31 +0200,
Nathan Chancellor wrote:
> 
> On Wed, Aug 13, 2025 at 11:00:38AM +0200, Takashi Iwai wrote:
> > By some reason, the use of CLASS() right after the goto label caused a
> > build error with clang and hexagon arch.
> 
> It is because CLASS() is just a variable declaration and a declaration
> after a label is a C23 extension. It becomes a warning in newer versions
> of clang but that can still be an error with CONFIG_WERROR:
> 
>   sound/hda/codecs/ca0132.c:4222:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>    4222 |         CLASS(snd_hda_power, pm)(codec);
>         |         ^
>   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
>     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>         |         ^
>   <scratch space>:193:1: note: expanded from here
>     193 | class_snd_hda_power_t
>         | ^
> 
> > As a fix and a further cleanup, just move the code into the if block
> > instead of the goto, and drop the unnecessary variable initialization,
> > too.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202508131651.BZD3v2Bq-lkp@intel.com/
> > Fixes: 8d0843bcdd00 ("ALSA: hda/ca0132: Use cleanup macros for PM controls")
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the review and explanations.

But I decided to drop the whole series for now (and fold the fix into
the original patch), as there are another issues that are caught with
clang.

Namely, when you have DEFINE_GUARD() locally in the *.c file, this
will lead to error with W=1 because of the unused inline functions.

Currently, I paper over with the change like:

--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -347,7 +347,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
 	})
 
 #define __DEFINE_GUARD_LOCK_PTR(_name, _exp)                                \
-	static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
+	static inline __maybe_unused void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
 	{                                                                   \
 		void *_ptr = (void *)(__force unsigned long)*(_exp);        \
 		if (IS_ERR(_ptr)) {                                         \
@@ -355,7 +355,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
 		}                                                           \
 		return _ptr;                                                \
 	}                                                                   \
-	static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
+	static inline __maybe_unused int class_##_name##_lock_err(class_##_name##_t *_T)   \
 	{                                                                   \
 		long _rc = (__force unsigned long)*(_exp);                  \
 		if (!_rc) {                                                 \

But I'm not sure whether that's the best way to go.


thanks,

Takashi
