Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF027D770
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207233; cv=none; b=q0podTSvguBiyNCe5IzTOvH5AEDqsh/sTJ3ANUKXl8RAlE6JcxhB/Vt6OixDDabRsqmpXq6cwpSrGjz47tJ6eM2nQpEbXKfPUiC6IzMMw0ajgmemR909y5lX+X73MF/UK7E/VP+kwHsaCPlMe7Uz+wQ6kZPo6ynaIw3R9cLKEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207233; c=relaxed/simple;
	bh=JiEtdmWuQ8qWiib41zMCxorKXqE1zjhNvNfPqishaYE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QM6+W9irISiG2ZNtqR8OIT/DbFOYTQOTQ1EfeZXD+Torb2o7lZMwGA5BGsWwIKZDC0+aGYXjkOYySC3PJ29Xc/cyK3MIgB/EMTWvMj2t0aZwSTwnUwNrMyge/nnUel2X8ix1X1UessBLGtcmMRBiLWUre0MjWihoc9XhHmC64Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ywpXR5RW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMRb2Tvu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ywpXR5RW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PMRb2Tvu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ywpXR5RW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMRb2Tvu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ywpXR5RW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PMRb2Tvu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C877521244;
	Tue, 22 Jul 2025 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753207229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5KLnc3qAyjxhiYZ6EUL4sniPLS3yktzqO9hZagvRak=;
	b=ywpXR5RWhBcl2M+NuVy+cUhDxeKeyHsuCATRMBrK7ETVH8V0DS66ioJA/tqScx+QiAYgse
	KAG4uJ62DrRnUxTS72aS/y95Eq5AY4XfUgmMx6UJbW7Pz9WTJHvPYxfbWVvKeQEqDeDjcf
	Hs8/igtht4t98WcQlni+jfDqDIwu1WA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753207229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5KLnc3qAyjxhiYZ6EUL4sniPLS3yktzqO9hZagvRak=;
	b=PMRb2Tvuxy8zzbt74sVnzEL3/4WU1UrzzxjwaBnNA4I3P0K0jb/9+ZVkBajJG/zPIeuK3E
	6YtvnosyQ5qAI0AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753207229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5KLnc3qAyjxhiYZ6EUL4sniPLS3yktzqO9hZagvRak=;
	b=ywpXR5RWhBcl2M+NuVy+cUhDxeKeyHsuCATRMBrK7ETVH8V0DS66ioJA/tqScx+QiAYgse
	KAG4uJ62DrRnUxTS72aS/y95Eq5AY4XfUgmMx6UJbW7Pz9WTJHvPYxfbWVvKeQEqDeDjcf
	Hs8/igtht4t98WcQlni+jfDqDIwu1WA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753207229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5KLnc3qAyjxhiYZ6EUL4sniPLS3yktzqO9hZagvRak=;
	b=PMRb2Tvuxy8zzbt74sVnzEL3/4WU1UrzzxjwaBnNA4I3P0K0jb/9+ZVkBajJG/zPIeuK3E
	6YtvnosyQ5qAI0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95ED213A32;
	Tue, 22 Jul 2025 18:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MZFYIr3Rf2g6YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Jul 2025 18:00:29 +0000
Date: Tue, 22 Jul 2025 20:00:29 +0200
Message-ID: <87wm80m7gi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SHARAN KUMAR M <sharweshraajan@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute LED mask on HP OMEN 16 laptop
In-Reply-To: <20250722172224.15359-1-sharweshraajan@gmail.com>
References: <20250722172224.15359-1-sharweshraajan@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 22 Jul 2025 19:22:24 +0200,
SHARAN KUMAR M wrote:
> 
> this patch is to fix my previous Commit <e5182305a519> i have fixed mute 
> led but for by This patch corrects the coefficient mask value introduced
> in commit <e5182305a519>, which was intended to enable the mute LED 
> functionality. During testing, multiple values were evaluated, and 
> an incorrect value was mistakenly included in the final commit. 
> This update fixes that error by applying the correct 
> mask value for proper mute LED behavior.
> 
> Tested on 6.15.5-arch1-1
> 
> Signed-off-by: SHARAN KUMAR M<sharweshraajan@gmail.com>

The Fixes tag was forgotten here, and I added it manually.
Applied to for-linus branch now.


thanks,

Takashi
