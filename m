Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98D450413;
	Wed, 12 Aug 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545660; cv=none; b=EIZbCSCg1CNQMKK0JwJ6Sz1Z07IxEvoWZeaORQERzzpj+8exvelsuoOyRIq+4p808cwqmns2sLjhJhWDBS8OosIi6G82rygXepTQyPjDHCVragEo4YnZkaWfAObGIhIOb7JSMMbfCVzFun2/cQiJev7V83Oh5nFWY8rduyuDdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545660; c=relaxed/simple;
	bh=YOTy3hJhbUX9lJtzQ8sIRpk8BqacHNsXtf6DOoJhdB8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLG54CJYD48+TcgvT3SjYYSozHGEHDNEebU1KKkxbmb20bTtTFAKAmzGh5GNNeTw4Y3K/SN147lQx4oDZYlnnaWl82ABIfNoJOz1Yf80nS934JKzFLp8DsEIWUnid2XnBEaPU1DbrmynEDaPI1N88sup2p46nHN6sbZI2c378P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PgFSgt6+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Ml5RjZz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zufiuQNC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jIknYc6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PgFSgt6+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Ml5RjZz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zufiuQNC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jIknYc6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0B7A3DF3;
	Wed, 12 Aug 2026 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786545587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S14bbF84NZFdCYQ6AyoL80NY/HmhtwsVCka482r9AbU=;
	b=PgFSgt6+nsMtxFWtIrvlx+dmgRoQmONehYFkmJ9KgHT3O7fvPVvQTZQfsiZJdJXubDzwmj
	cP9QXp/NH657e99jlIeRSQB5qVKaGgFsoz6WDdL/jOhUu3yyy42KC6ybH6zGHvGwAbmzuY
	ODtvKI/n8XBA0rwKumZ4MIcMP3RZn4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786545587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S14bbF84NZFdCYQ6AyoL80NY/HmhtwsVCka482r9AbU=;
	b=3Ml5RjZzRn2Km3z4fJSBvD/ONWY501gaTlUtuJGhy7IUttOO4ebGEEYgib0JeCTHKrl86U
	mF9vkbHMHiY/DICA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786545583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S14bbF84NZFdCYQ6AyoL80NY/HmhtwsVCka482r9AbU=;
	b=zufiuQNCOpVTxjlTDreQ7v1gz0CB7hInFv4n6sTRv7boRjGn4GKXTEi+R9NOTkPxogYwOu
	peyrZ82rDyNT4O5Vnby0nfE7j1yXhZowd99v/c7zuCHIIFwgpygb2qnHuFzb9yfvrfd3Xv
	6PqqH0bFVm4Q0XnBRFk9Gowa11xhSe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786545583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S14bbF84NZFdCYQ6AyoL80NY/HmhtwsVCka482r9AbU=;
	b=7jIknYc6yIXTGIDniXW/yn+wTevG8Lg1ElYaycQnNXZAgAJtDeAewjM0M496hJBMWjq+s/
	4a5lukGJYGEtKOCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87AFD779B1;
	Wed, 12 Aug 2026 14:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5gF6IK+FfGqRKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 14:39:43 +0000
Date: Wed, 12 Aug 2026 16:39:43 +0200
Message-ID: <878q6bz9lc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: seq: Drop the dead struct snd_seq_event_bounce
In-Reply-To: <20260812141506.4016387-1-sammiee5311@gmail.com>
References: <87se4jze5c.wl-tiwai@suse.de>
	<20260812141506.4016387-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 12 Aug 2026 16:15:06 +0200,
HyeongJun An wrote:
> 
> The struct describes a bounce payload of an error code followed by the
> original event and its external data.  No kernel has ever sent that.
> Before commit efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in
> bounce_error_event()") the kernel emitted no SNDRV_SEQ_EVENT_BOUNCE at
> all, and since then it sends the event record alone.
> 
> Nothing has ever read it either.  Its only accessor,
> snd_seq_event_bounce_ext_data(), has had no caller for the whole git
> history, and it did not even compile until commit c7e0b5bf9fff ("[ALSA]
> Remove xxx_t typedefs: Sequencer") incidentally repaired the type name
> it referred to, three years after the git import.  Drop the accessor
> along with the struct.
> 
> This removes a definition from a UAPI header.  Since no kernel ever
> produced the layout, nothing can have parsed it, but a program that
> merely names the type will need to stop.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
