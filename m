Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420413541E
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809014; cv=none; b=pCAzZSYfBOTEUCitFQzCraWY/yoP+9C7HbkEKGHC1c3pS/5HcXESdS9zKSYam0cl5qmTBIy5evcpHSWgqvZTiHrvkiVazf8MxkRzbjE3/70nNA6o5A1RsnyzOxgRBZg5fJTDh1jOL6EqlURfyFOeqMylxWjgfESpFOHMfv77p68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809014; c=relaxed/simple;
	bh=gnWFGOdHgyKkqJGoUkB+8S+j6TZz9R+ggeq3opk4o+w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=motkxPF9UCWwVLu0UCKuehC9o7/Krv37AwD9AjwpSeUSdUna4KYrQBUZ2Kv2KyI2UuYEqyU9Cpp9r284vZ7CmA3eYG3hxvATEBIzm7TnVcZj+4356S3FP4YYCsRzM3Jp8lKO4/sEIC6/dp1IIePOA8KHMY2SvzHk7KfS3jfqWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JZWQuoaz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m2w93lFt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MdXH9X9D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZjW0NyX6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JZWQuoaz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m2w93lFt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MdXH9X9D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZjW0NyX6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC3DC21D64;
	Mon, 27 May 2024 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716809011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkgHNu7OrNaEO5zFmuTVjgy6rwlinh6di2u1yHXqBw8=;
	b=JZWQuoazaKkUt50Ws5GnLV24nhbYtpA8OIeoCHs4FwFMDyf1cBUmDNxH9St/r1K4qi1Z74
	UQYbwUXQU5srXAfYBfqKNCpCBd69zy7l2eHmui+6sLy8AteRb5U3XTQTFmpTmfXyk5Jmsa
	NEMw00NW8heq0VXYWv9rkBTKdhuJT5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716809011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkgHNu7OrNaEO5zFmuTVjgy6rwlinh6di2u1yHXqBw8=;
	b=m2w93lFtCIO9T/4nRFg5enB9knkGDiHZCIji1D9ErzENItImizimeAhfnqpDz8lDcs2vEF
	EPucVzjhsBfYhZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716809009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkgHNu7OrNaEO5zFmuTVjgy6rwlinh6di2u1yHXqBw8=;
	b=MdXH9X9DT6ofnZ6mHUI9MVBYl0XBLqFdL0Z9gGn5J4+PAm+cOksqygMGpoEhIEs9YBquq8
	H1m/0FbWx+SA7SDsGpWcQnUaaiyoLXxUlmGWYXRFxcQCIJzqq4LR2lCJle6FlUy1reWE51
	hOt+DMvtyQuzDa2hJ1RposeQRJj83Uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716809009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkgHNu7OrNaEO5zFmuTVjgy6rwlinh6di2u1yHXqBw8=;
	b=ZjW0NyX6jfvrR9GMfT20YTSH+FcEmOUaxk+HtM2q9pMUnBK/ovWpp7v0UoISHgzFl3Aq8H
	OmPERGTtIEI/I/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5B4713A6B;
	Mon, 27 May 2024 11:23:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JkxQJzFtVGbzWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 May 2024 11:23:29 +0000
Date: Mon, 27 May 2024 13:23:50 +0200
Message-ID: <87cyp7a46x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc:<linux-sound@vger.kernel.org>,	Takashi Iwai <tiwai@suse.de>,	Mark Brown
 <broonie@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,	Nicolas
 Dufresne <nicolas@ndufresne.ca>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough operation mode
In-Reply-To: <20240527071133.223066-1-perex@perex.cz>
References: <20240527071133.223066-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,kernel.org,gmail.com,ndufresne.ca,linux.intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ndufresne.ca:email,imap1.dmz-prg2.suse.org:helo,perex.cz:email]

On Mon, 27 May 2024 09:11:33 +0200,
Jaroslav Kysela wrote:
> 
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-passthrough.rst" document.
> 
> Note: This code is RFC (not tested, just to clearify the API requirements).
> My goal is to add a test (loopback) driver and add a support to tinycompress
> library in the next step.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
(snip)

Through a quick glance, the general idea looks simple enough and
straightforward.  If this satisfies the needs, we can go in this way.

A few subtle things:

- We might want to have a safe limit for the task creations.
  An evil user-space can fill up too easily.

- The error checks of memdup_user() are missing. 
  A caveat is that memdup_user() returns ERR_PTR() instead of NULL.
  So with the automatic cleanup, you'd need to fiddle with
  PTR_ERR(no_free_ptr(p)).

- The use of __u64 is rather for uapi headers.  The kernel internals
  can be with straight u64.

- The task list add/removal might need some locks.  It looks racy.
  Also the task runtime returned from snd_compr_find_task() might be
  freed.  Need for some locking or refcounting?

- A linear lookup is OK from performance POV?  Maybe enough for small
  number of tasks.

- Better to have a protocol version check and accept the R/W mode only
  with the newer version.


thanks,

Takashi
