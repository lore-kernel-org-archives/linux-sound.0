Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C632AAD6
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020256; cv=none; b=MRW/e2xf7Eyxae513ymsgRPutFRaruBGe2twOh1uCeLjmXC3ubUED6MLJegDyJ8IAsaPJ5zZLlETGGmdzgyFKIJAfSPFEy7IR+XInj8cIUPVLf/yDUKx/6vjfv7z+xxFi0/d+zX0MjKZ0GKmYB0uTgg2VZzxBZ8HvT+60T3h1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020256; c=relaxed/simple;
	bh=FqE1b9pIRBSCFcTZ+5Z6nJoFY93GTK0ofBcEewZ99WE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWAAzCZaBuxx9Mqaa9IN3nGHyPgZrDb8o5n6E9lCjArDjn4d9ovuYxDGTf/A8pug0LFFnatuAMVBOOj9xm1iajliZ7M1IMLiLYdex/OzGAFLkKzkfCyvkd3ViICrtR0lDMQzozXAgyUfWm+I81VyFupYB/aYirF7lKQATn9aYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePVN/QBP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gjSOBRaO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePVN/QBP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gjSOBRaO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePVN/QBP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gjSOBRaO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePVN/QBP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gjSOBRaO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19CA677DA2;
	Tue, 14 Jul 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784020252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jhws3DlPKGho3dm/9bYY4BaW2NmksO1uLYLZkT8eD8k=;
	b=ePVN/QBPSNPkkm+FoUKohcl/v7PBRVZnqtkQYGFqDvej98J0I/67uY3hGbtsNnj/yskndD
	SlUMZ4W23U5p40X6VLp1wPuWIBAK2wBEM1RCbFRyHSXZy5l87C0O6q5ElfqJ3iFtorBth8
	RJh668+hWPDEvJvg7ikGHjeP6Y+oiL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784020252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jhws3DlPKGho3dm/9bYY4BaW2NmksO1uLYLZkT8eD8k=;
	b=gjSOBRaOfhRc1tyKVB/6Zm1M5weGZQ0Fn07ekKmx9RGw+fv+CMBrR6WIuqakyoigqL0Uys
	iQHoTQNETRYi0GBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ePVN/QBP";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gjSOBRaO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784020252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jhws3DlPKGho3dm/9bYY4BaW2NmksO1uLYLZkT8eD8k=;
	b=ePVN/QBPSNPkkm+FoUKohcl/v7PBRVZnqtkQYGFqDvej98J0I/67uY3hGbtsNnj/yskndD
	SlUMZ4W23U5p40X6VLp1wPuWIBAK2wBEM1RCbFRyHSXZy5l87C0O6q5ElfqJ3iFtorBth8
	RJh668+hWPDEvJvg7ikGHjeP6Y+oiL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784020252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jhws3DlPKGho3dm/9bYY4BaW2NmksO1uLYLZkT8eD8k=;
	b=gjSOBRaOfhRc1tyKVB/6Zm1M5weGZQ0Fn07ekKmx9RGw+fv+CMBrR6WIuqakyoigqL0Uys
	iQHoTQNETRYi0GBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 058B6779AE;
	Tue, 14 Jul 2026 09:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C9HKABz9VWrcWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 09:10:52 +0000
Date: Tue, 14 Jul 2026 11:10:47 +0200
Message-ID: <87jyqyym08.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: seq: close a re-opened queue timer in the destructor
In-Reply-To: <422FDB81-2A68-47C7-A22D-2D3301E2E86D@doyensec.com>
References: <422FDB81-2A68-47C7-A22D-2D3301E2E86D@doyensec.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 19CA677DA2
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 14 Jul 2026 10:29:23 +0200,
Norbert Szetei wrote:
> 
> queue_delete() closes the queue timer, then frees it. snd_seq_timer_close()
> clears q->timer->timeri. snd_use_lock_sync() then drains borrowers, and
> snd_seq_timer_delete() frees q->timer.
> 
> A borrower can re-open the timer inside that window. A SET_QUEUE_CLIENT
> that took a queueptr() use_lock reference before the queue was unlinked
> runs snd_seq_timer_open() after the close. Open refuses re-open only while
> timeri is set, and the close just cleared it, so it re-opens timeri.
> 
> snd_seq_timer_delete() does not close that instance. Its snd_seq_timer_stop()
> is a no-op, because running was cleared first. So it frees q->timer with the
> instance still live. The queue is freed next.
> 
> The instance stays on the global timer with callback_data pointing at the
> freed queue. A non-owner START on the unlocked queue arms it. The next tick
> derefs the freed queue in snd_seq_timer_interrupt().
> 
> Reachable by an unprivileged user with access to /dev/snd/seq. No CAP and
> no queue ownership required.
> 
> Close any lingering instance in the destructor. There, ->timeri can no
> longer change: the queue is unlinked and all use_lock borrowers have
> drained, so no snd_seq_queue_use() can re-open it. Close it before clearing
> q->timer. snd_timer_close() waits for any in-flight snd_seq_timer_interrupt()
> to finish, and that callback still reads q->timer (via snd_seq_check_queue()),
> so q->timer must stay valid until it drains.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Applied now.  Thanks.


Takashi
