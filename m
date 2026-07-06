Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FE3EDAC6
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326279; cv=none; b=f3ub8LVC2ktG2jzIhrLRBXQbqSat3niGNKRFb3t0LShuVICIp4tP5Jy+e8+dg+vpKc1TNtekdR3ZfBnTGY7O0FeBoO89N55/ir2AqnseSZiD74jNCmJUEjSH9TdCTO+9RDeUYoOg8QbDMoUD/aV9cfPiKDpQoIBycpYdc4FOUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326279; c=relaxed/simple;
	bh=khejay3Xe1HXOPytfuDOEL44dyuRX1WIN8zFv6BP7P0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6/j2YBmvhPiKGJkLe6Rrq1c+vFK10v58pN3gMx3aicX8Wg340JdL/8fgpIVXIuOvwry03LvUTQAWnkVGxi3OOmOXVThJ/2tR8XJnTtRn8AqAOj0wTwPRjt/AAnmNlF5Kmlpzn2P06p0YIz66JzdyeFVJzNj+v0QK0Xzg6lD2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ANWE1VuJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LwEzqVhZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ANWE1VuJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LwEzqVhZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ANWE1VuJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LwEzqVhZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ANWE1VuJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LwEzqVhZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF62A739A4;
	Mon,  6 Jul 2026 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783326264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4mgF4yXl0XwWUMILw5jCGPfLYuAq6dAN+3/v+uTtIg=;
	b=ANWE1VuJFQ2+p0MbGACs0x1wcvN2eTz2ScOiPQOVn1/rm68b34K77a+LHKeeuNP9aL4mHx
	4xNfk9kjy83afqTa1QyXCH8Uq6MUmCPVAplTIhQOs+q6dXQrXQrLymxfhW5g976V+P4m2W
	KLQDWmUPyC2z+eaEQ5suB1TK/fYdNA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783326264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4mgF4yXl0XwWUMILw5jCGPfLYuAq6dAN+3/v+uTtIg=;
	b=LwEzqVhZKkYjZZg4ziHKSO310y/2QWUHxC2FOteLnkmTtRPAJ0xJ+Ac+RdLJN62FY0leqs
	QVv4kMWmcBBPHNBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783326264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4mgF4yXl0XwWUMILw5jCGPfLYuAq6dAN+3/v+uTtIg=;
	b=ANWE1VuJFQ2+p0MbGACs0x1wcvN2eTz2ScOiPQOVn1/rm68b34K77a+LHKeeuNP9aL4mHx
	4xNfk9kjy83afqTa1QyXCH8Uq6MUmCPVAplTIhQOs+q6dXQrXQrLymxfhW5g976V+P4m2W
	KLQDWmUPyC2z+eaEQ5suB1TK/fYdNA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783326264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4mgF4yXl0XwWUMILw5jCGPfLYuAq6dAN+3/v+uTtIg=;
	b=LwEzqVhZKkYjZZg4ziHKSO310y/2QWUHxC2FOteLnkmTtRPAJ0xJ+Ac+RdLJN62FY0leqs
	QVv4kMWmcBBPHNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 571F2779AA;
	Mon,  6 Jul 2026 08:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kpr7EzhmS2oBKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jul 2026 08:24:24 +0000
Date: Mon, 06 Jul 2026 10:24:23 +0200
Message-ID: <874iic5xvs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa: Fix format specifier and function mismatch in mixer-test
In-Reply-To: <20260705171038.171966-1-malayarout91@gmail.com>
References: <20260705171038.171966-1-malayarout91@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-2.99)[99.93%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.28

On Sun, 05 Jul 2026 19:10:38 +0200,
Malaya Kumar Rout wrote:
> 
> In the ctl_value_index_valid() function, when validating 64-bit integer
> controls (SND_CTL_ELEM_TYPE_INTEGER64), the error message for maximum
> value validation has two bugs:
> 
> 1. Uses snd_ctl_elem_info_get_max() instead of the 64-bit variant
>    snd_ctl_elem_info_get_max64()
> 2. Uses %ld format specifier instead of %lld for long long type
> 
> This is inconsistent with the minimum value validation (line 335-339)
> which correctly uses get_min64() and %lld. The mismatch can cause:
> - Incorrect maximum values being reported on some architectures
> - Undefined behavior due to format specifier mismatch
> - Potential crashes when printing the error message
> 
> Fix by using snd_ctl_elem_info_get_max64() and %lld format specifier
> to match the data type and be consistent with the minimum value check.
> 
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>

Thanks, applied now.


Takashi
