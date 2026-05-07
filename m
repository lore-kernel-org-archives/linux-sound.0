Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41962402446
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164334; cv=none; b=XqlOpu5wmfJeZv4mg+nJCxepTh0+RPK9Xk4GUa6bIws8pzp6MNV7tWk0h3InjtRQye75/6E0SX3kq1ahQWGxWTeXY8igVZuwZr/iWumu2/+8CxDXI1rzbcOped6LinHejv544mFQmrMOM/56y6frpe1okdp/Jtn856lXO17edqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164334; c=relaxed/simple;
	bh=ZOe9gd8OL66znMfYDmOmtllf4RbX629LrB7rDoB/m5s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifaoUbIMYak4s8Zj3TQbzV92I5cltXM+TcxWNwu1gyPQy52CxITJHWGpor0LLnmSrW7+4sN3pYqB04P6ajJYt48gJObdqMQhKEmgg9s9EKLbN7SNv1etZv9MaOYrkeMisT4vJifX+bjw+7qs9QMre+elqS2D29ZkUqtHQdYb7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rh3KyZtI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VHn4vL6d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rh3KyZtI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VHn4vL6d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rh3KyZtI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VHn4vL6d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rh3KyZtI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VHn4vL6d"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53E7A5DA05;
	Thu,  7 May 2026 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778164331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhlYk+bWoXrN6AaWOLhqJDiC12vLsc6L1+Pw6cd/kB0=;
	b=Rh3KyZtIJiQlZIQPsqPwR0vEcuemq4GC7gSR5qlgiUPkTrvwK7EbN0UzHpc8Y5w/wr7AOj
	eeHJjur7CziKZvOD0OIGu0og+Xl8xab7W1Y2sQPDWF0jybbmwJRv/PZpuShZ01uXA1e/+W
	6ueJ8ZEq+BNluPSNTu2gD5PBOzNyNCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778164331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhlYk+bWoXrN6AaWOLhqJDiC12vLsc6L1+Pw6cd/kB0=;
	b=VHn4vL6d2dISS/4Y3z2YgJFEl5bxVV8StS28AOQ+nTcSRTBfvzlDi1fkuT3cRKRHoM1FCU
	D3ewU9qCDkj4qcBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778164331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhlYk+bWoXrN6AaWOLhqJDiC12vLsc6L1+Pw6cd/kB0=;
	b=Rh3KyZtIJiQlZIQPsqPwR0vEcuemq4GC7gSR5qlgiUPkTrvwK7EbN0UzHpc8Y5w/wr7AOj
	eeHJjur7CziKZvOD0OIGu0og+Xl8xab7W1Y2sQPDWF0jybbmwJRv/PZpuShZ01uXA1e/+W
	6ueJ8ZEq+BNluPSNTu2gD5PBOzNyNCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778164331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhlYk+bWoXrN6AaWOLhqJDiC12vLsc6L1+Pw6cd/kB0=;
	b=VHn4vL6d2dISS/4Y3z2YgJFEl5bxVV8StS28AOQ+nTcSRTBfvzlDi1fkuT3cRKRHoM1FCU
	D3ewU9qCDkj4qcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C780593A7;
	Thu,  7 May 2026 14:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Dt3OAWui/GlUOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 14:32:11 +0000
Date: Thu, 07 May 2026 16:32:10 +0200
Message-ID: <87ik8zp9xx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: hda: Fix Cirrus ACPI device reference leaks
In-Reply-To: <20260428074415.GA1632446@chcpu16>
References: <20260428074415.GA1632446@chcpu16>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 28 Apr 2026 09:44:15 +0200,
Shuhao Fu wrote:
> 
> This series fixes two missing acpi_dev_put() cases in Cirrus HDA side-codec
> ACPI lookup paths.
> 
> Patch 1 drops the lookup reference after synthesizing the companion in
> cs35l56_hda_read_acpi().
> 
> Patch 2 drops the lookup reference on the early !physdev error path in
> cs35l41_hda_read_acpi().
> 
> Shuhao Fu (2):
>   ALSA: hda: cs35l56: Put ACPI device after setting companion
>   ALSA: hda: cs35l41: Fix ACPI device leak on missing physical node

Assuming that the logic is correct, I applied both now.


thanks,

Takashi
