Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74073A8FEB
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129054; cv=none; b=gqd10pxE2N4Y1VK5Kb45tXa9fAZlzodGQ8/7kDe9AHrODV8wFkrCmfdGQM8tu31nMyuKkz77GCXZtvmMfCjJyAfYNX867l3ngrhKviMjdeMKBzQibUMNnxVccLQzDWL+ak3SiTzyt7CtnQWhIlVIQjMwRFH8hO+HfznsMmILQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129054; c=relaxed/simple;
	bh=RH4r7Sx6a5qajUOG28b7cl5LxfFgIOH6GOluc4MsAjc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbxZZlTy83ZazwNDg0mw5+hJFy2hVj2Un/O8mUhu7S/2ZlOmYLqzanc4Bv68geymLCHT5kELqZh8eGTYwLHqtBxQI6nQ3jYJSsLLYJsC6pwl4FcplAQUIAv1wwBDkG0RT09NXAhhV0t5aGXRkg+XYeT0skN4JMz8PM5K/S41L7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=htMAsl97; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w639Vlwb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=htMAsl97; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w639Vlwb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="htMAsl97";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w639Vlwb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="htMAsl97";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w639Vlwb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1EBE53E6C3;
	Tue,  3 Feb 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770129050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3+eRkRoq6S/XwWy2QUGYdexviJYgx2euLfJ6AnQ/Ds8=;
	b=htMAsl97Ytla69x6xdlXwhpc/QBKPL8UzWHmjUo1m8Bygxow9sONkQwNgBMUrgXN0TpyAs
	r7Tr3ia+KwZrhARneL5t6fcEC8k875YUPkJgW2h72IkDk/NzFDCwB+wtGMprhBLrNAbn8P
	CshYNs+PMi9fnPzn5WIht+yltvLjrCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770129050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3+eRkRoq6S/XwWy2QUGYdexviJYgx2euLfJ6AnQ/Ds8=;
	b=w639Vlwblg9YLONbFufMwC5p+hQGfL81ht2hSDjvTX2VDlOrBGyYzG4ZSzHI7qaW55oGE6
	6mVMnxkUwRFit1AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770129050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3+eRkRoq6S/XwWy2QUGYdexviJYgx2euLfJ6AnQ/Ds8=;
	b=htMAsl97Ytla69x6xdlXwhpc/QBKPL8UzWHmjUo1m8Bygxow9sONkQwNgBMUrgXN0TpyAs
	r7Tr3ia+KwZrhARneL5t6fcEC8k875YUPkJgW2h72IkDk/NzFDCwB+wtGMprhBLrNAbn8P
	CshYNs+PMi9fnPzn5WIht+yltvLjrCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770129050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3+eRkRoq6S/XwWy2QUGYdexviJYgx2euLfJ6AnQ/Ds8=;
	b=w639Vlwblg9YLONbFufMwC5p+hQGfL81ht2hSDjvTX2VDlOrBGyYzG4ZSzHI7qaW55oGE6
	6mVMnxkUwRFit1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F21843EA62;
	Tue,  3 Feb 2026 14:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y4r2OZkGgmn5SgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Feb 2026 14:30:49 +0000
Date: Tue, 03 Feb 2026 15:30:45 +0100
Message-ID: <87343hlx0q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samuel Dionne-Riel <samuel@dionne-riel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for Minisforum V3 SE
In-Reply-To: <20260203010132.1981419-2-samuel@dionne-riel.com>
References: <20260203010132.1981419-2-samuel@dionne-riel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 03 Feb 2026 02:01:33 +0100,
Samuel Dionne-Riel wrote:
> 
> First, adding a generic quirk for Bass speaker DAC avoidance.
> 
> This pattern (re-routing the bass speakers off of a DAC without volume
> control) seems common enough that having a "model" to match against and
> quickly use to verify may be worthwhile.
> 
> The alc285_fixup_thinkpad_x1_gen7 routing was selected, amongst the
> different options, as it should allow tuning the ratio between both
> speaker set.
> 
> The routing was verified using `hda-verb`, and picking either 0x00 or
> 0x01. Either routing made the volume of the bass speakers controllable.
> 
>     hda-verb /dev/snd/hwC1D0 0x17 SET_CONNECT_SEL 0x01
> 
> This likely will apply for the Minisforum V3, though there isn't a lot
> of information to confirm whether or not the identifiers are the same.
> 
> This was verified on the Minisforum V3 SE, and the root cause (the bass
> speakers routing) was found out by using pink noise, and playing with
> the mixers.
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> 
> ---
> 
> Hi!
> 
> > Indeed it looks like that we can cleanup a lot regarding this DAC
> > routing fix-ups.  Though, *_thinkpad_x1_gen7() has more workarounds
> > about the control element renames -- which needs to be verified
> > whether the very same workaround is applicable to other cases.
> 
> The renames were the reason I picked this particular fixup. It matches
> the fact these are distinct speakers, and matches the role.
> 
> > IIUC, this kcontrol names (DAC1/DAC2) match with your device
> > configuration?  Could you give alsa-info.sh output?
> 
> Indeed! Here is the output:
> 
>  - https://alsa-project.org/db/?f=69517ae9d95e21b50eddc64538c7094aaf356a07
> 
> 
> See also v1 for the methodology additional commentary.
>  - https://lore.kernel.org/linux-sound/20260201231216.1655154-1-samuel@dionne-riel.com/
> 
> Changes since v1:
>  - Combined commits
>  - Fixed order of the fixup table
> 
> Thank you for your time!
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

Now I applied to for-next branch, as it's no urgent fix.
I slightly modified the patch to adapt to the latest tree.


thanks,

Takashi
