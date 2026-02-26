Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9E3876A8
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120757; cv=none; b=ZzbBgfH8pJU4gHgy0CGOkuRJcUPARowDvz5JW3++3jB99G+tAG65sXjPl5ciA3gysp7mh6SO8X/FoHoq7KYNimjezrvPGnXAG0Sksdy0TzyHBCUnP1MBiNC2lpA/ljVsIsbERzL9hhGHfzIy7fxHtwb4fdlohZAVnnXeLbu+lRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120757; c=relaxed/simple;
	bh=rkIDL0c2L/xJ+7R3XpZkl24g/twJ8JEah+bXaJBrp4g=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s78FnQb5C3Nz65sOELdDHl5lcbUfDFA+1ahFd1cYUUidaBu79rZPK25oRyAkaPbSY5Meez2q0ryLCXswSYnPFzMP5kd7Tknf8WDE/H6IQP1xGySF2qezBN8JsWz9PartDFyUGSSetCscbnPsCXa6WYz0bZwPTS7an1o7+I+Tb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DXJd+24I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sNaF8eUr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DXJd+24I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sNaF8eUr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DXJd+24I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sNaF8eUr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DXJd+24I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sNaF8eUr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81B514D3E1
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR5EQwBwftu2Bf/Md5OdLurz1iurkpNdYJAQQAj52xE=;
	b=DXJd+24I/LMyNItsFqC1ruVU8JXrEtEKTMbvJKODBNh12Nt+mp8LsBUv8nY4MYPgwLA2cJ
	PzOy7FGv54qqHeAVgS4K+upVHFJOuhlFeGRrJuzRV0927inTg3OH8+hd0ma4S/VbCKzuxK
	r6t4KQJO7w657UExAHnU6kBKz7QLs18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR5EQwBwftu2Bf/Md5OdLurz1iurkpNdYJAQQAj52xE=;
	b=sNaF8eUrk7d1rC24xrZZuwseu6p/+SEyJE5JUN4syOs2hsxc/HMR0ob22RS60AJW6iQ/aa
	7tBVoNCsp1NgLLBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR5EQwBwftu2Bf/Md5OdLurz1iurkpNdYJAQQAj52xE=;
	b=DXJd+24I/LMyNItsFqC1ruVU8JXrEtEKTMbvJKODBNh12Nt+mp8LsBUv8nY4MYPgwLA2cJ
	PzOy7FGv54qqHeAVgS4K+upVHFJOuhlFeGRrJuzRV0927inTg3OH8+hd0ma4S/VbCKzuxK
	r6t4KQJO7w657UExAHnU6kBKz7QLs18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR5EQwBwftu2Bf/Md5OdLurz1iurkpNdYJAQQAj52xE=;
	b=sNaF8eUrk7d1rC24xrZZuwseu6p/+SEyJE5JUN4syOs2hsxc/HMR0ob22RS60AJW6iQ/aa
	7tBVoNCsp1NgLLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BCEE3EA62
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S2gZGbJqoGlWbgAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:45:54 +0000
Date: Thu, 26 Feb 2026 16:45:54 +0100
Message-ID: <87v7fja4p9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: SDCA: Fix comments for sdca_irq_request()
In-Reply-To: <20260226154414.1081568-5-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
	<20260226154414.1081568-5-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 26 Feb 2026 16:43:50 +0100,
Takashi Iwai wrote:
> 
> The kernel-doc comments for sdca_irq_request() contained some typos
> that lead to build warnings with W=1.  Let's correct them.
> 
> Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Oops, this one slipped in a series.
Will resubmit as a separate one for ASoC.


Takashi
