Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA83ACA64
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777894222; cv=none; b=uALl9KQ7jJ0h08DgchniRJ7znW6Tac69vtGnGeoDcbN20XpIL1XByWRD21+wAjnV5zjfv9NarsKkr5irG8fKYa/Ut+4ctfJeorspP+09XdVGxaMEz+6JQY5isKqmnMQx8fagpgpSmFBA8aE2EmEfBmNxTAENVISv+KOD3rDdVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777894222; c=relaxed/simple;
	bh=6JSv02po0RWTzO/bgtInmv9gCi0M4h3Bmh8I9Dx/p8U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bh3dYd/2E7pJr5LwjX+qnKZyX9oY8YGg5EjvDxpLRfM+XJ09kg8D/+sMJRTGYFvYFFr+IC/uzgedq1SDKDceV0ggIiS73AoRYY39e8P1qf0DiGcigULxqkdDjhaVxl7+XMjgDo8vfLBYUUPm/+5esAFZ8VZ1TVWTPHj7HKCkaoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kio4VKhi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pKDC1PSd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gh0F0dCM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fp0DFkOU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kio4VKhi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pKDC1PSd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gh0F0dCM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fp0DFkOU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3AD15C599;
	Mon,  4 May 2026 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X77MCTfP6oUt3rkFQ0tNawnARqoNxlYJz/UmLl3BZN8=;
	b=Kio4VKhi/OOgu2q9+wuAGCBvZCsrG3NcVmL8QHFyrCpKwiYqFwU6TPiZ5gzWJf566EOhts
	frAqoV/0qsRXK5iamsR4x3ZmeQCBHX+IO3k8U4t+FwaJZr6psIWNf8OEMvA5PVwPLnWhjU
	NHH1wmRZCPQC5JxnJUI2P2DmmENCmYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X77MCTfP6oUt3rkFQ0tNawnARqoNxlYJz/UmLl3BZN8=;
	b=pKDC1PSd9QNuk34awuh/+4NHOVCT22+54cAkUDOJKgoTNAi0AmG4uxYo1pHvfCsJM+aAK8
	/aDApjRZ0xGTD1Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777894217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X77MCTfP6oUt3rkFQ0tNawnARqoNxlYJz/UmLl3BZN8=;
	b=Gh0F0dCMOLc31M30fxQDtpjak/+U/9AXQQbmWIpcv30Cnhy1wER9IOQ50nwvhQL7Qd7bMr
	UQbx2kDf2O6A9IwQmYwrtW0SY1frbnOoR06PH3ofzQE2+vV19B2BBtyOu3bPvBgKmGmCLM
	RzAeyPkMzX7U/5f+QvhXD6h/ahq4EVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777894217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X77MCTfP6oUt3rkFQ0tNawnARqoNxlYJz/UmLl3BZN8=;
	b=Fp0DFkOUJXw515HKZrizgqWXM2pp5ZkcCiNtXr+u+Md4PAa4QVxFVN1a07qs4nJPvVssZu
	MzwOsMNYyaNYq2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0C4A593A3;
	Mon,  4 May 2026 11:30:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jvMFJkmD+GmXHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 11:30:17 +0000
Date: Mon, 04 May 2026 13:30:17 +0200
Message-ID: <87se87xvhy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: firewire-tascam: Do not drop unread control events
In-Reply-To: <20260503-alsa-firewire-tascam-read-queue-v2-1-126c6efd7642@gmail.com>
References: <20260503-alsa-firewire-tascam-read-queue-v2-1-126c6efd7642@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 04 May 2026 02:55:52 +0200,
Cássio Gabriel wrote:
> 
> tscm_hwdep_read_queue() copies as many queued control events as fit in
> the userspace buffer. When the buffer is smaller than the current
> contiguous queue segment, length is rounded down to the number of bytes
> that can be copied.
> 
> However, after copying that shortened length, the code advances pull_pos
> to the original tail_pos, marking the whole contiguous segment as
> consumed. Any events between the copied portion and tail_pos are lost.
> 
> Limit tail_pos to the position after the entries actually copied before
> updating pull_pos. When the whole segment fits, this is equivalent to the
> old tail_pos update; when the buffer is smaller, the remaining events
> stay queued for the next read.
> 
> Fixes: a8c0d13267a4 ("ALSA: firewire-tascam: notify events of change of state for userspace applications")
> Cc: stable@vger.kernel.org
> Suggested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
