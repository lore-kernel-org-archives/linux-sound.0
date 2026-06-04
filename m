Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D433A9FF
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586716; cv=none; b=CveIVgOfUbjaQlUImiYZQgiL0TWeeiPlpPYdqz0lA+jErP3/sQiaI+9GPKknfb4hJC26Gs/5G19foLlhQs0Kwkpl/9SJf+e7F8Zvoe5DLlegnmXH8BRDYuHoviG8V9S0W9XWm3t4ewmFClqijA1ZVZFF33SxMaNH2PfcgfmUqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586716; c=relaxed/simple;
	bh=C9cagF5abvdEQHjNshnxrTzucRodkqdts2Ww3Gkmz/c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uyAOqF/eyJrokx7N4KAP60tY0ZeSB6InSgn7KISR2F2I5HhLMuRc/PKpUvTVfjr6fBHV3Sdu3BG/2tr1+dIzWfxCZjOooFawwDwL6/1NVlnqfppct1iYn5RsHUgvgZwbszEJBtBG9BsOFUrUOp9SmtbalP7plVUmkXWXeJSFwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AZjRKecQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6YWXJ5+s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AZjRKecQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6YWXJ5+s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AZjRKecQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6YWXJ5+s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AZjRKecQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6YWXJ5+s"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 017F47583F;
	Thu,  4 Jun 2026 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+tl9fLV+v9MnjAB0XSlwdxsyuoHtSlaGOrRIdboS+l4=;
	b=AZjRKecQpSFGWEy8Z8P+p87j3NQIVk/I1uj1NRrqb/JjkQ0c2sRC/vp4O/DQv9Gd1xPPHn
	jhxG/Hfmr08Sq7KstkBPugoHx5FZtQ9W1YNulcj/gziDGLftAJPzYVc0JsbDIfkz86QcJD
	mFrB6kQAdAXBo1HWB5j0OrWZmPjHZmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+tl9fLV+v9MnjAB0XSlwdxsyuoHtSlaGOrRIdboS+l4=;
	b=6YWXJ5+sRb37zZiN9aO7AHBPwzsTSV1Ja1WP8y/8ectpY8+K8hKmjN/hSR6xzRrlzKxqgp
	jQuZsVmdepfnrqCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AZjRKecQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6YWXJ5+s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+tl9fLV+v9MnjAB0XSlwdxsyuoHtSlaGOrRIdboS+l4=;
	b=AZjRKecQpSFGWEy8Z8P+p87j3NQIVk/I1uj1NRrqb/JjkQ0c2sRC/vp4O/DQv9Gd1xPPHn
	jhxG/Hfmr08Sq7KstkBPugoHx5FZtQ9W1YNulcj/gziDGLftAJPzYVc0JsbDIfkz86QcJD
	mFrB6kQAdAXBo1HWB5j0OrWZmPjHZmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+tl9fLV+v9MnjAB0XSlwdxsyuoHtSlaGOrRIdboS+l4=;
	b=6YWXJ5+sRb37zZiN9aO7AHBPwzsTSV1Ja1WP8y/8ectpY8+K8hKmjN/hSR6xzRrlzKxqgp
	jQuZsVmdepfnrqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4A6A779A8;
	Thu,  4 Jun 2026 15:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lGq7MtaYIWoJJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 15:25:10 +0000
Date: Thu, 04 Jun 2026 17:25:10 +0200
Message-ID: <87v7byuy3t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ji'an Zhou <eilaimemedsnaimel@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on linked streams
In-Reply-To: <20260604142559.3840881-1-eilaimemedsnaimel@gmail.com>
References: <20260604142559.3840881-1-eilaimemedsnaimel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 017F47583F
X-Spam-Score: -3.51

On Thu, 04 Jun 2026 16:25:59 +0200,
Ji'an Zhou wrote:
> 
> snd_pcm_drain() uses init_waitqueue_entry which does not clear
> entry.prev/next, and add_wait_queue with a conditional
> remove_wait_queue that is skipped when to_check is no longer
> in the group after concurrent UNLINK.  The orphaned wait entry
> remains on the unlinked substream sleep queue.  On the next
> drain iteration, add_wait_queue adds the entry to a new queue
> while still linked on the old one, corrupting both lists.  A
> subsequent wake_up dereferences NULL at the func pointer
> (mapped from the spinlock at offset 0 of the misinterpreted
> wait_queue_head_t), causing a kernel panic.
> 
> Replace init_waitqueue_entry/add_wait_queue/conditional
> remove_wait_queue with init_wait_entry/prepare_to_wait/
> finish_wait.  init_wait_entry clears prev/next via
> INIT_LIST_HEAD on each iteration and sets
> autoremove_wake_function which auto-removes the entry on
> wake-up.  finish_wait safely handles both the already-removed
> and still-queued cases.
> 
> Fixes: 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain")
> Signed-off-by: Ji'an Zhou <eilaimemedsnaimel@gmail.com>

Applied now.  Thanks.


Takashi
