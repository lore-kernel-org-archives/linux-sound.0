Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9813ACF11
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638300; cv=none; b=jKHnr5GpduF/c6K/rCB6zHZ/q2T/tQ7KhpBlFFcKN6JuTFrEpC2kSV4+0MLc1xdaXuIOJRPzZTQBi67AR9cttP/kG9lLxMyQKFfsHzGdylkbMFjCsJ0rsDof0OKmQ7fwPGZBgUGn0xx2z3qiolVHgrdD1Kfvj7S6osaiPwu4FGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638300; c=relaxed/simple;
	bh=dG4i4O2JuV0TgviM5sAGKDt3/n/+VXM46M4uiFzSf98=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXlOmUIHtrTHOW7T7vwAbY5VM0Mh6G1dglI03bvC2qmHYZI/T+F59CVHvG/7iHhw8Kzjj7NokAiTraPbAek7vzuwltJVkmtZ8ZFeEvW/MvFmj9jH3dGYbG/gm0IsJx4SDX+9A05Bacchsp8Xx0HIlpKbolo0zyjbU5Ki8r+lyM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=at1wrrLG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FsBwvUgR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HCZaN0Ao; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uUpgqCmM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="at1wrrLG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FsBwvUgR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HCZaN0Ao";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uUpgqCmM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DE5E4E8F2;
	Wed,  8 Apr 2026 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoRTEgx+SlKIO+dXOjzQXdhQOBeOgT++k7pncdtKcKo=;
	b=at1wrrLGpvHAy82rhEafknY1Hm8ubj8O5CR//zZPO8Hd80ez9MmIZ5fqoMhZn9zCJAIo1v
	O9ZoC0xBmlxErdEN6lZDzgdrXSZ8aWWMNnHinxAjnit6vBGHQT8IHo8ZdKGsCnlQTkyrml
	QHMJCQEr6bsF/9/zsHYrzNdGvwJAsSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoRTEgx+SlKIO+dXOjzQXdhQOBeOgT++k7pncdtKcKo=;
	b=FsBwvUgRyF68si6/gDASaPPhKtKcpqm3TSirGWY/zNX82U24e/6X1jgJ9qV8kZA8jIpAAu
	m3OjZOADjpHYKRBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HCZaN0Ao;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uUpgqCmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoRTEgx+SlKIO+dXOjzQXdhQOBeOgT++k7pncdtKcKo=;
	b=HCZaN0AoMsuXeILb+L/QDJFgZe/8DN4bTOdRfvxXNK+BHvk0W/jAF2Zf494oOKoQGytSRi
	240N1uB6O9JbdhD7obqi84gn7dAZ+2K6rQrxO8kkb+7/yokULbMma+Zv2xu59F5ruTDIlc
	kZ7ZUT/Oh6pgOhRLIpjkuUTSfRVAA3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoRTEgx+SlKIO+dXOjzQXdhQOBeOgT++k7pncdtKcKo=;
	b=uUpgqCmMHPXBRqiUFlZ/DuF894gT4iA8PfKKy6cGGhS8Aa79c2B2TRqxFdZZfS+ffxdiY9
	/EsCbv9xJwhxKMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 316614A0B3;
	Wed,  8 Apr 2026 08:51:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IrLVChYX1mkkDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 08:51:34 +0000
Date: Wed, 08 Apr 2026 10:51:33 +0200
Message-ID: <87v7e1ltre.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ALSA: add suspend/resume support for InterWave ISA cards
In-Reply-To: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
References: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 5DE5E4E8F2
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 07 Apr 2026 17:35:40 +0200,
Cássio Gabriel wrote:
> 
> This 3-patch series wires up suspend and resume support for the
> InterWave ISA drivers and their PnP front-end around the shared
> GUS PM helpers.
> 
> The first patch moves the remaining standalone
> snd_tea6330t_detect() EXPORT_SYMBOL() declaration next to its
> function definition as a requested small cleanup.
> 
> The second patch adds a small TEA6330T helper so the InterWave STB
> variant can restore its cached external mixer state after resume.
> 
> The third patch adds ISA and PnP PM callbacks to snd-interwave and
> restores the remaining InterWave-specific state that the generic GUS
> resume path does not cover, including the GF1 board registers and the
> detected memory layout.
> 
> The resume path intentionally does not rerun probe-time DRAM/ROM
> detection. As with the shared GUS PM support, this does not guarantee
> preservation of sample RAM contents across suspend.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v2:
> - Add a separate tea6330t cleanup patch moving the standalone
>   snd_tea6330t_detect() EXPORT_SYMBOL() next to its function.
> - Extend snd_i2c_lock() to cover the full device lookup/list traversal
>   in snd_tea6330t_restore_mixer().
> - Renumber the InterWave PM patch to 3/3 after splitting out the
>   cleanup patch.
> - Link to v1: https://lore.kernel.org/all/20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com/
> 
> ---
> Cássio Gabriel (3):
>       ALSA: tea6330t: move snd_tea6330t_detect() EXPORT_SYMBOL
>       ALSA: tea6330t: add mixer state restore helper
>       ALSA: interwave: add ISA and PnP suspend and resume callbacks

Applied all patches to for-next branch now.  Thanks.


Takashi
