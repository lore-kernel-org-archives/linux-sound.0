Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EB30DED1
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775465075; cv=none; b=J93ojw/YDSy5VzYqFZfILQxv3FoL94efcktV13Pd9j0CLaJzkVw5PqQAnnaSq+7IyQPUWE0rOnSOOlYuCxq9PG2I5McHBmq/5c+WuLwjC7zFJrZbWXcYKK3MY9AvztiRKcdJXIdKtDYBTe6s6IvGlEe0rjRO1hw4vF7taFglmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775465075; c=relaxed/simple;
	bh=Vg7OVT5wBfnYprHIo4SrpM4AQJMvjTTpDmZ9qsikxzQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AedE5VX4ieTYVom9U8Ae1/kkpeHWUXJUwGHdtIn4pxBKTpBoDXftj1MsAgBQDi2/f2vDcCm7OT/1cRSA02jfM3kt8RsFRA0suxKtYGbhul2QAsXdOPiBlojP/dIE7v2G+3OtwwPRn2JWiiZsYhhD8POpRZMjf04O4VYAS+aAmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2INTl1we; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bPm3zpnS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2INTl1we; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bPm3zpnS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2INTl1we";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bPm3zpnS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2INTl1we";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bPm3zpnS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DD444DDEF;
	Mon,  6 Apr 2026 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j97UfREAl7T22sBTLesSpdrXDO5JmB+dkkE0zL6euic=;
	b=2INTl1weGWBQDEy4IkkBe0BPfu+DcCRXeUis/tRddmFagvXkUZYIbqHldf8ofhvvGu/dih
	LkAHlN4MQnTH+f6jTDvPxwRl3hBkT9j+vgl8fWSEVZPzYtJOhIZ4bMjDQqFs/+irlgGvcy
	zvPTvmCn+K40KUC/EnSiNroOKARKG1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j97UfREAl7T22sBTLesSpdrXDO5JmB+dkkE0zL6euic=;
	b=bPm3zpnSxMeC+H7qQbMv9MyCnjh+Nw4/bVhf3O6UaT1p4uEX+D77Sx7RkoWEys/K0On1ht
	zN1YZ9MFmAcFI+Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775465072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j97UfREAl7T22sBTLesSpdrXDO5JmB+dkkE0zL6euic=;
	b=2INTl1weGWBQDEy4IkkBe0BPfu+DcCRXeUis/tRddmFagvXkUZYIbqHldf8ofhvvGu/dih
	LkAHlN4MQnTH+f6jTDvPxwRl3hBkT9j+vgl8fWSEVZPzYtJOhIZ4bMjDQqFs/+irlgGvcy
	zvPTvmCn+K40KUC/EnSiNroOKARKG1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775465072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j97UfREAl7T22sBTLesSpdrXDO5JmB+dkkE0zL6euic=;
	b=bPm3zpnSxMeC+H7qQbMv9MyCnjh+Nw4/bVhf3O6UaT1p4uEX+D77Sx7RkoWEys/K0On1ht
	zN1YZ9MFmAcFI+Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D25A4A0B0;
	Mon,  6 Apr 2026 08:44:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CDvkEHBy02ntKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Apr 2026 08:44:32 +0000
Date: Mon, 06 Apr 2026 10:44:31 +0200
Message-ID: <873418mqa8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Add missing sentinel initializer field
In-Reply-To: <20260405222548.8903-1-npetrakopoulos2003@gmail.com>
References: <20260405222548.8903-1-npetrakopoulos2003@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 06 Apr 2026 00:25:48 +0200,
Panagiotis Petrakopoulos wrote:
> 
> A "-Wmissing-field-initializers" warning was emitted when compiling the
> module using the W=2 option. There is a sentinel initializer field
> missing in the end of scarlett2_devices[]. Tested using a
> Scarlett Solo 4th gen.
> 
> Signed-off-by: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
