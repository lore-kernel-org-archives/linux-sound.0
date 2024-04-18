Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB352576E
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422374; cv=none; b=jJfRF1YJyCdI0guPhuz3sSLYJTd8FFZSZdwHHxkeh2AqaFaLBeP2JQcDaVUFk4tQYbbbQVoFbGy64W9JqUv3bFxCvttd8t3MAGNa4y+77wXUwHMYIy1h8GM05cHLU6jdyTSev6miOHdO0J+pfE/5ajJSnUF47K/wrVnZLX215bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422374; c=relaxed/simple;
	bh=hlmRksAxcfLEUnZStGjbrE1vc2X7O5nhIvxo44ex/mU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=makh7KhRVGspG2v3y401q1SeX4x+hVpWZ6RYnisik60GYkZYroWkJx8Ps3VgeuLBlkmAt7ZeYqtSFTkW4FfHgtGHsjSO2/UsrunDGvfS375UiNhII79idK4sJHOgYw2KuVLhuIlyei+rnOI8vH8vT3TaCYUebpyHuBNtD5Qc6NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iPRfx8kg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCH4GLmD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iPRfx8kg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCH4GLmD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iPRfx8kg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCH4GLmD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iPRfx8kg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCH4GLmD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C37D5C51B;
	Thu, 18 Apr 2024 06:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yuQ+Yw8najZJXoNbW0oARbWQxeZa5Uz28d/MnglMx8Y=;
	b=iPRfx8kgox5QFtxJiWgIh7w7sbwKBNP0FkNvwLvzbFwtFe69CSVMdJ0mdna5DGTzqPuuub
	7iYyGjJP0Jze53QPlkpxfXoNDSvJitCS05xVnPhAvp72haZB0cowQLIXoNXqUC3+/dRBnN
	H7q/nVq4huectiJyX+JBX+xGYsZLFQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yuQ+Yw8najZJXoNbW0oARbWQxeZa5Uz28d/MnglMx8Y=;
	b=BCH4GLmDSgHIlTEHjmKYerCLJvk3TGUgby10PBk8EwC5hwo5SB6kh+aMRQq+vpSNhgWqqO
	wYXvm2FfdncbHnDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713422371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yuQ+Yw8najZJXoNbW0oARbWQxeZa5Uz28d/MnglMx8Y=;
	b=iPRfx8kgox5QFtxJiWgIh7w7sbwKBNP0FkNvwLvzbFwtFe69CSVMdJ0mdna5DGTzqPuuub
	7iYyGjJP0Jze53QPlkpxfXoNDSvJitCS05xVnPhAvp72haZB0cowQLIXoNXqUC3+/dRBnN
	H7q/nVq4huectiJyX+JBX+xGYsZLFQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yuQ+Yw8najZJXoNbW0oARbWQxeZa5Uz28d/MnglMx8Y=;
	b=BCH4GLmDSgHIlTEHjmKYerCLJvk3TGUgby10PBk8EwC5hwo5SB6kh+aMRQq+vpSNhgWqqO
	wYXvm2FfdncbHnDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4C4013687;
	Thu, 18 Apr 2024 06:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8S3ILiLAIGbZdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:39:30 +0000
Date: Thu, 18 Apr 2024 08:39:39 +0200
Message-ID: <87le5bxjh0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: Re: [PATCH 0/5] ALSA: hda / ASoC: SOF: Add support for PIO command mode
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-2.50 / 50.00];
	BAYES_HAM(-2.20)[96.19%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,vger.kernel.org,linux.intel.com,intel.com,perex.cz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -2.50
X-Spam-Flag: NO

On Tue, 09 Apr 2024 10:38:07 +0200,
Peter Ujfalusi wrote:
> 
> Hi,
> 
> This series will introduce support for using PIO for commands (immediate
> commands) instead of CORB while retaining the use of RIRB for unsolicited 
> responses (notifications).
> 
> This mode of operation is the recommended one for Lunar Lake family. 
> 
> The series adds support for the PIO mode for SOF and the 'legacy' HDA
> stack to make sure that they will work correctly when Lunar Lake is available
> for consumers.
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (5):
>   ALSA: hda: Introduce flags to force commands via PIO instead of CORB
>   ALSA: hda: hdac_controller: Implement support for use_pio_for_commands
>     mode
>   ALSA: pci: hda: hda_controller: Add support for use_pio_for_commands
>     mode
>   ALSA: hda: Intel: Select AZX_DCAPS_PIO_COMMANDS for Lunar Lake
>   ASoC: SOF: Intel: hda-bus: Use PIO mode for Lunar Lake

Now applied all patches to for-next branch.  Thanks.


Takashi
