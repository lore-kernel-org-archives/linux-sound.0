Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9F2BEFE8
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860073; cv=none; b=egnW4cVrAh56ZfQuYayCgsDJYUc01cOMcD0JK+mGB4OiTNhFeYUTXqraYQGHyMmakUlkZQ1UbPcqi5lPgZERlH3LTSjlRKLxXT3eIDioaWSwN8015HUujkwrGyHZWDABoq9U6xe/a0F3g8mOTcwtFr1MxKZWK9qe8C8nH9ZAmJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860073; c=relaxed/simple;
	bh=7Bc8qnatG4EHunZTj7qAuITmDEGC7WQMkpDIbUoMfAA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AI/dFEqFk29TwqUWtuPI2c5J1UCiolklCJU+cE9rnM2GOBPauh0A+MEruHqSHu1X7MAQ6V/seCHffJot9WGGDGLTp5Yf9nUzOsNBf25xLXBRWF32+q1ZqHlpfjeDDO/zEbv41n7LYi67ML/BtHaarFR1RE48BWlWF0bb3EB3T/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AatbxTdr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pgo3jD44; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AatbxTdr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pgo3jD44; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AatbxTdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pgo3jD44";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AatbxTdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pgo3jD44"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 733B166D38;
	Wed, 27 May 2026 05:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huNET+gMtUSdlVZLys0+0OGm/SIVo/ISE10d093BUSE=;
	b=AatbxTdrqSFfzZpNmy/kzRt8izzHlDgzdBrGripiL9QbbRlgDH7ts++AuvhjBg4GTAVtSJ
	6T/QcPVfCzD2miz/yiAMzGEQc4b+Xt1EEGDlV0tVsORdJQX6ercddxfjNvKb0VIjhRIpA6
	eRoallTLwe8XeM2xoH3bFUXQ5dPC7n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huNET+gMtUSdlVZLys0+0OGm/SIVo/ISE10d093BUSE=;
	b=pgo3jD44uqgTlYSVEsCkJKfx7vs46XvMDWEpvecQ8AKONS4SRCKcvdiO0MhyTPE8UBU94+
	UgYKhbBJCHfRw4DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huNET+gMtUSdlVZLys0+0OGm/SIVo/ISE10d093BUSE=;
	b=AatbxTdrqSFfzZpNmy/kzRt8izzHlDgzdBrGripiL9QbbRlgDH7ts++AuvhjBg4GTAVtSJ
	6T/QcPVfCzD2miz/yiAMzGEQc4b+Xt1EEGDlV0tVsORdJQX6ercddxfjNvKb0VIjhRIpA6
	eRoallTLwe8XeM2xoH3bFUXQ5dPC7n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huNET+gMtUSdlVZLys0+0OGm/SIVo/ISE10d093BUSE=;
	b=pgo3jD44uqgTlYSVEsCkJKfx7vs46XvMDWEpvecQ8AKONS4SRCKcvdiO0MhyTPE8UBU94+
	UgYKhbBJCHfRw4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B13A5A66E;
	Wed, 27 May 2026 05:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1ipYCmaCFmqaNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:34:30 +0000
Date: Wed, 27 May 2026 07:34:29 +0200
Message-ID: <87wlwpwh3u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH] ALSA: seq: midi: Serialize output teardown with event_input
In-Reply-To: <20260526152608.1250473-1-rollkingzzc@gmail.com>
References: <20260526152608.1250473-1-rollkingzzc@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.de,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Tue, 26 May 2026 17:26:08 +0200,
Zhang Cen wrote:
> @@ -125,31 +128,44 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
>  	struct seq_midisynth *msynth = private_data;
>  	unsigned char msg[10];	/* buffer for constructing midi messages */
>  	struct snd_rawmidi_substream *substream;
> +	unsigned long flags;
> +	int err = 0;
>  	int len;
>  
>  	if (snd_BUG_ON(!msynth))
>  		return -EINVAL;
> +
> +	spin_lock_irqsave(&msynth->output_lock, flags);
>  	substream = msynth->output_rfile.output;
> -	if (substream == NULL)
> +	if (substream)
> +		snd_use_lock_use(&msynth->output_use_lock);
> +	spin_unlock_irqrestore(&msynth->output_lock, flags);
> +
> +	if (!substream)
>  		return -ENODEV;

Please use scoped_guard().  You can drop flags with it, and the return
-ENODEV can be right after substream assignment.

> @@ -229,12 +249,15 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
>  	params.avail_min = 1;
>  	params.buffer_size = output_buffer_size;
>  	params.no_active_sensing = 1;
> -	err = snd_rawmidi_output_params(msynth->output_rfile.output, &params);
> +	err = snd_rawmidi_output_params(rfile.output, &params);
>  	if (err < 0) {
> -		snd_rawmidi_kernel_release(&msynth->output_rfile);
> +		snd_rawmidi_kernel_release(&rfile);
>  		return err;
>  	}
>  	snd_midi_event_reset_decode(msynth->parser);
> +	spin_lock_irqsave(&msynth->output_lock, flags);
> +	msynth->output_rfile = rfile;
> +	spin_unlock_irqrestore(&msynth->output_lock, flags);
>  	return 0;

Ditto, use guard() or scoped_guard().

> @@ -242,11 +265,20 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
>  static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *info)
>  {
>  	struct seq_midisynth *msynth = private_data;
> +	struct snd_rawmidi_file rfile = {};
> +	unsigned long flags;
>  
> -	if (snd_BUG_ON(!msynth->output_rfile.output))
> +	spin_lock_irqsave(&msynth->output_lock, flags);
> +	rfile = msynth->output_rfile;
> +	msynth->output_rfile = (struct snd_rawmidi_file){};
> +	spin_unlock_irqrestore(&msynth->output_lock, flags);
> +
> +	if (snd_BUG_ON(!rfile.output))
>  		return -EINVAL;

Same here, too.


thanks,

Takashi
