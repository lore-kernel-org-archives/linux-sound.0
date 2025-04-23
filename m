Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A45242A92
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393254; cv=none; b=QDLonSS72K/VhYLGdiLyQGlUjBQooQ23T3enMrKI0JsGZaFmiVVbBC7ibM4YZZXVzxapRwMWRpw/eN09+Qk2KUsTiBIRJQzrGSjLW9B4SCkdJRsAknJt3kQe/ySQTABv0XlIupYEicgUv8aAHpks6xdBKFwdLcHlwvpjjUmNU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393254; c=relaxed/simple;
	bh=lTf8/oz52ZzT+KDmU30L6mvhIaKGBBl55sDJdjtcUw0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpEdRFQvw7FxIs2VBNSBKoYu35SpNGBbk/Lk87xQBLmnzu1I9QUG9Mxht0uSQPF3YrbLpO64YGCK1iTt4lEY91DzoMC16GEV4DrM6QUJExhF20TRwJxwjpnXNwt+gDaBYxYUNDKMEBcJvgMWCcgmOgiMCxurVrrmmhvByIN0Y0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTbZeJRt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rmKh6rD/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTbZeJRt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rmKh6rD/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTbZeJRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmKh6rD/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTbZeJRt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmKh6rD/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C9F21F38E;
	Wed, 23 Apr 2025 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745393251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDPo2B2tw1ms8EBFV/UV5UFrVfoVpyU0gws07DXDu+Y=;
	b=mTbZeJRtLovZ0YA6WzPRPNX3Kd+Re7iVVS68f9Pp0tgrxuQKtOj4gVpWQxcwP3FdyXsutP
	i+fUW7CA7IYSgCfYZ7fMZpbBcNUmJ12GhYznZhwAsv01lXZIj8+ke1BqSlU3pAKNzy1qJY
	ad7tqAn4XNGesbhIVJPc41+nep2o9yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745393251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDPo2B2tw1ms8EBFV/UV5UFrVfoVpyU0gws07DXDu+Y=;
	b=rmKh6rD/HL9vp1c21yFYIFLj3FGM7OOwgug8BxpOhdZH7X/8JOawuyLl1znjcpkz7NhoeF
	Ch8FlbUYx2zqKHCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mTbZeJRt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="rmKh6rD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745393251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDPo2B2tw1ms8EBFV/UV5UFrVfoVpyU0gws07DXDu+Y=;
	b=mTbZeJRtLovZ0YA6WzPRPNX3Kd+Re7iVVS68f9Pp0tgrxuQKtOj4gVpWQxcwP3FdyXsutP
	i+fUW7CA7IYSgCfYZ7fMZpbBcNUmJ12GhYznZhwAsv01lXZIj8+ke1BqSlU3pAKNzy1qJY
	ad7tqAn4XNGesbhIVJPc41+nep2o9yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745393251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDPo2B2tw1ms8EBFV/UV5UFrVfoVpyU0gws07DXDu+Y=;
	b=rmKh6rD/HL9vp1c21yFYIFLj3FGM7OOwgug8BxpOhdZH7X/8JOawuyLl1znjcpkz7NhoeF
	Ch8FlbUYx2zqKHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A3613A3D;
	Wed, 23 Apr 2025 07:27:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PBGsAGOWCGjmZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Apr 2025 07:27:31 +0000
Date: Wed, 23 Apr 2025 09:27:30 +0200
Message-ID: <87wmbbjq1p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Tavian Barnes <tavianator@tavianator.com>,
    Brent Lu <brent.lu@intel.com>,
    linux-sound@vger.kernel.org
Subject: Re: Bad topology file paths when re-inserting snd_sof_pci_intel_tgl
In-Reply-To: <CABg4E-nVdZa9oOi3a6FYQ60Wc93aq_8CpO2J4nZxVv94o98quw@mail.gmail.com>
References: <CABg4E-nVdZa9oOi3a6FYQ60Wc93aq_8CpO2J4nZxVv94o98quw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2C9F21F38E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 22 Apr 2025 20:48:40 +0200,
Tavian Barnes wrote:
> 
> I'm trying to debug some audio issues on my ThinkPad X1 Carbon (Gen
> 10), and I noticed something that's probably a bug: when I remove and
> re-insert the snd_sof_pci_intel_tgl module, it tries to load a
> different tplg file every time.  Example:
> 
> # dmesg -t | grep tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> # modprobe -r snd_sof_pci_intel_tgl
> # modprobe snd_sof_pci_intel_tgl
> # dmesg | grep tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
> # modprobe -r snd_sof_pci_intel_tgl
> # modprobe snd_sof_pci_intel_tgl
> # dmesg | grep tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
> sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/\xa0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff-idisp-4ch.tplg
> 
> The second time, it added an extra -idisp to the path
> (intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg).  The third
> time, the path seems to have become totally corrupted.
> 
> I'm seeing this on kernel version 6.14.3-arch1, which has no
> sound-related changes from the regular stable 6.14.3 kernel.  I can
> try current master but I don't see any relevant changes to the code
> that adds -idisp in sound/soc/sof/intel/hda.c.

Looks like a bug introduced by the commit
5458411d75947a4212e50a401ec0a98d4c6c931b
    ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
It overwrites hda_mach->sof_tplg_filename with a string of
devm_kasprintf().


thanks,

Takashi
