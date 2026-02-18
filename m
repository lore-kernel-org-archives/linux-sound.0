Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3719F13F
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401401; cv=none; b=kVW1IWzJOkhDNV3KeDLMCSxmtNaqnfztuPBLirlM+US+mLDo2+8991mNtlvLGRqMhZPJr8aKFYjfp2it/knsADuqhX7foo8yunR1cqsLLz5FfFNFwcyU/Fv/zpSTuztDjseQXFWIJRRgX9dHjy70SQMQKwk4CszARmQuXfBYZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401401; c=relaxed/simple;
	bh=D3fpv/MhO0Ruoxl2bXCudBuKl9uyfbN5SqWoOGWekPE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fybp7PZ4qhPtACG5oFqnrbb3OliGf1sRBnQADC9T8LDdokpDZC7j6AIpyskBKTonTqzSOfL/DZeElCxhh4tJo2BJ3EqWYMWQbnTo6Rg3v3w9exPyITZP/2MpNqjpyzbjhg+vAGhXR5rIwhl1WER1do2XqTfZn6AJI1YDhi0g0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gJTnD2Vv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zRSc7QFK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gJTnD2Vv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zRSc7QFK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gJTnD2Vv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zRSc7QFK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gJTnD2Vv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zRSc7QFK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E9783E6D0;
	Wed, 18 Feb 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjXcgp/2FshXrpa7bTiUM/k/TxDxTOS/txeTjNa+Yw8=;
	b=gJTnD2VvdYK2B1/gFJdD3i8GPMhwwYJ2Lt8qXNuAZCtMPXQ3gDjSFJt4HPdqUOPR2c6bP7
	bvGXEhw9EZTSxd4cyjjeOoaD+QbyiP4dhs2SE5Nmk1j3zPjupN6bxq6yZKX68Ls8zEPzYM
	ylIS4tdvW2AQEFp+6STSAe95mUl7oMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjXcgp/2FshXrpa7bTiUM/k/TxDxTOS/txeTjNa+Yw8=;
	b=zRSc7QFKae29y4Y12BH7OTK463V9OkMKLOLqNF2vJ+FRpVSXcTNBAAXlxPtA6BV/b6zIEw
	0dP/Tp9gokgUTTCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjXcgp/2FshXrpa7bTiUM/k/TxDxTOS/txeTjNa+Yw8=;
	b=gJTnD2VvdYK2B1/gFJdD3i8GPMhwwYJ2Lt8qXNuAZCtMPXQ3gDjSFJt4HPdqUOPR2c6bP7
	bvGXEhw9EZTSxd4cyjjeOoaD+QbyiP4dhs2SE5Nmk1j3zPjupN6bxq6yZKX68Ls8zEPzYM
	ylIS4tdvW2AQEFp+6STSAe95mUl7oMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjXcgp/2FshXrpa7bTiUM/k/TxDxTOS/txeTjNa+Yw8=;
	b=zRSc7QFKae29y4Y12BH7OTK463V9OkMKLOLqNF2vJ+FRpVSXcTNBAAXlxPtA6BV/b6zIEw
	0dP/Tp9gokgUTTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D60DB3EA65;
	Wed, 18 Feb 2026 07:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LT2MrRwlWnfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 07:56:36 +0000
Date: Wed, 18 Feb 2026 08:56:36 +0100
Message-ID: <87y0kqa3ij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: isa: Add SPDX id lines to some files
In-Reply-To: <20260212195905.3726149-1-tim.bird@sony.com>
References: <20260212195905.3726149-1-tim.bird@sony.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 12 Feb 2026 20:59:05 +0100,
Tim Bird wrote:
> 
> Add SPDX-License-Identifier lines to several files where
> they are missing, mostly in the sound/isa subdir.
> Use GPL-2.0 as the id.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

One file for sound/hda/trace.c slipped in here, but as it's a trivial
change for all, I take as is now.


thanks,

Takashi
