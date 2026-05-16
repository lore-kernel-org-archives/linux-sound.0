Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D542548EE
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778938343; cv=none; b=cnT5+cOwLLyEosxETnMZeO2AsbivLJj+kIpCZImUNqo6t3TVolUuRpprG8hPU6xQz888b137oq1yn7AgoxWdu0xP/4I0fEemksijlYPhM6c99svRjBW+z+0ejrj9pJJkVzJty8yIkp4BPOMpUR6oO/b70VtN33th2OXtLS4eV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778938343; c=relaxed/simple;
	bh=38BmuvmjXRN/bGb6cEidVsj/mOcfBPwVU1Fzszf3VC4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMTF5LdTek7chWReS737HH95co4xduWyZIsIfrLi0ohrXQUABResHDausBt+d/bT1VkEejzI90Mz81nFflG8f4M8/LFv//ckLB40rAhqp+XsQFmY7u9XTk2oQNnIn/ed/hBJXrREOMqUcO1yU8Mxl1Ey5PEntFIla/Zwuopu0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DrH83L+R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8WMpp2m9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JCEvuA7O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JqmNnesX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DrH83L+R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8WMpp2m9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JCEvuA7O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JqmNnesX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92AFE6AAB4;
	Sat, 16 May 2026 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778938334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+cvjTB9YrHU+kksVsscCTUabJk/Gm/DlV3ykeKCBUw=;
	b=DrH83L+RfWz6rukebdqeJjL0W8l3qS2KQqmJvVlzCBUHrYOvIWkeSfXLapvjHZIbcKVMhG
	SMH0yCd8CWPpixivTfHGhW+prTV0D1c5vdrDOqwL/tBRe4hgBsQqLOfpGe47SsFEuG1qjF
	XQtq2uzhh3ktApU1P1nMYMGvpWhWn5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778938334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+cvjTB9YrHU+kksVsscCTUabJk/Gm/DlV3ykeKCBUw=;
	b=8WMpp2m9I4l4h1clXTqtHY33GCJbrvH+YXJYcmMFUALvzHO3lz2NJUfN24dmYwyQn4Ul59
	uL+Ywyi4MXi5JdBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JCEvuA7O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JqmNnesX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778938333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+cvjTB9YrHU+kksVsscCTUabJk/Gm/DlV3ykeKCBUw=;
	b=JCEvuA7OswcxVdFvybLyK/9Wo/TFMuX13sE0crKqWlMmw4tquZnmdTl0PeqgqfwIJd48TG
	N2LepXOC1+BGrfcXNHt/cZWIT9VYdGw1iTbWc06wFii9sAtrDYQuLO7Dtx8CgiwyG/G00U
	BacgZUZ2QSyzb2Jn8/i9kyouCEbVgt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778938333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+cvjTB9YrHU+kksVsscCTUabJk/Gm/DlV3ykeKCBUw=;
	b=JqmNnesX6lhFeJFUAFv5tFVLYvbwb6TP22qqIpmWBVhVkLkWVdQUo7smeOEj1lsqp/a95e
	HnsKDHhKQ0AadCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64C1D593A8;
	Sat, 16 May 2026 13:32:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1ysgFt1xCGo5VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 13:32:13 +0000
Date: Sat, 16 May 2026 15:32:12 +0200
Message-ID: <87v7cnxyxv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SirDoctorGentleman <amagicalfishy@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec SSID quirk for Lenovo Legion 7 16ITHg6
In-Reply-To: <CANXUdNb=dWnECdFe6dQWdqcOKjzHEZO2BizPv5QCX3c0SnCpUg@mail.gmail.com>
References: <CANXUdNb=dWnECdFe6dQWdqcOKjzHEZO2BizPv5QCX3c0SnCpUg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 92AFE6AAB4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 11 May 2026 05:56:34 +0200,
SirDoctorGentleman wrote:
>=20
> PCI SSID 17aa:3811 is shared by the Legion S7 15IMH05 and the Legion 7
> 16ITHg6 (codec SSID 17aa:3855). The existing PCI quirk applies the S7
> 15IMH05 fixup to both, so the 16ITHg6's CS35L41 i2c amps never bind
> and internal speakers stay silent.
>=20
> Add an HDA_CODEC_QUIRK matching the codec SSID, routing the 16ITHg6 to
> ALC287_FIXUP_LEGION_16ITHG6. Mirrors the existing Yoga Pro 9 16IMH9
> entry on the same shared PCI SSID.
>=20
> Signed-off-by: javi <amagicalfishy@gmail.com>

Please use either a real name or a known identity for Sign-off and
=46rom and resubmit.  It's a legal requirement for upstreaming.


thanks,

Takashi
