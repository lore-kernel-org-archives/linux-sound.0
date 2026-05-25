Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CA53D1AAA
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693764; cv=none; b=LoBOS2jnFwv4dUd8YAYeTuRWu68VsFNFOV4iy85GLo0CShzjHO4YaU4UwZIiyuwwCqGxDQptlCqgXH8xhUBLXk161zrv3PIvYIvjyURxlJ+WRrgaguXRoHzhGRfixteLNXjQaUn+rmSG1rhVhd7bQvCxIIZ5oa0V1drhVbAU1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693764; c=relaxed/simple;
	bh=lYRkUQWhLmnqC62rr656QCQ4qB4tYFH6qZd1VNZaITk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYoDDbZ/MK9Ta2kYDFMUWElOmCvgExlrtEbInuey3+QhYPC5TK81xv2+mpJeSwzYond1G/rL1dBvfhcMbpxGgiyC2TgmwwhTjwqioep/mnMKMbyNY3TQGUulhrQe4MC0lku51TbmGbaa1KKhtiDpYXvxXROvHyDwxVO5uf3nzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eWxbSwqK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KKDHi1WK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eWxbSwqK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KKDHi1WK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eWxbSwqK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KKDHi1WK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eWxbSwqK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KKDHi1WK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A289364ACA;
	Mon, 25 May 2026 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRuTE4Fkb4Eiiu26ZCVFDxScodbGUCSJMZ7a//ZDDAU=;
	b=eWxbSwqKYqAsTROlgzH/4dl5ZeHMD1zHCdU3jxQP9p8z997kuGINf8jpL8R47vFqHKSJ4a
	aNIm+CED1DT4IgV1ZD7bB4Ivm/j+v8IG+HCFq5/9KW4E5PY03ZwUl97TleFYPm10b8Prxi
	R4b6+2H1qlz3r8i8J1XwSvtV5ALs/7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRuTE4Fkb4Eiiu26ZCVFDxScodbGUCSJMZ7a//ZDDAU=;
	b=KKDHi1WKz0B3f6bHgq4cKjBo10w5j9muuCypDPUUg3IUPgNWykdYnyKzOXQxmSX+5pnKEV
	Mcrj48VTeK0adQBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eWxbSwqK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KKDHi1WK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779693760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRuTE4Fkb4Eiiu26ZCVFDxScodbGUCSJMZ7a//ZDDAU=;
	b=eWxbSwqKYqAsTROlgzH/4dl5ZeHMD1zHCdU3jxQP9p8z997kuGINf8jpL8R47vFqHKSJ4a
	aNIm+CED1DT4IgV1ZD7bB4Ivm/j+v8IG+HCFq5/9KW4E5PY03ZwUl97TleFYPm10b8Prxi
	R4b6+2H1qlz3r8i8J1XwSvtV5ALs/7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779693760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRuTE4Fkb4Eiiu26ZCVFDxScodbGUCSJMZ7a//ZDDAU=;
	b=KKDHi1WKz0B3f6bHgq4cKjBo10w5j9muuCypDPUUg3IUPgNWykdYnyKzOXQxmSX+5pnKEV
	Mcrj48VTeK0adQBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F4E059B0E;
	Mon, 25 May 2026 07:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HGOFcD4E2pHEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 May 2026 07:22:40 +0000
Date: Mon, 25 May 2026 09:22:40 +0200
Message-ID: <87ecj0gdhb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda: cs35l56: Fix system name string leaks
In-Reply-To: <20260522-alsa-cs35l56-system-name-leak-v4-1-a6154dd09cd9@gmail.com>
References: <20260522-alsa-cs35l56-system-name-leak-v4-1-a6154dd09cd9@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A289364ACA
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	internal_greylist_whitelist(0.00)[2a07:de40:b281:104:10:150:64:97];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 22 May 2026 14:49:30 +0200,
Cássio Gabriel wrote:
> 
> cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
> acpi_get_subsystem_id(). On success, that string is used to create the
> firmware system name.
> 
> Several error paths after the _SUB lookup can return without releasing
> the allocated string. This includes speaker ID lookup errors other than
> -ENOENT, and errors after a firmware system name has been allocated.
> 
> Use scoped cleanup for the temporary _SUB string and make
> cs35l56->system_name device-managed. This releases the temporary _SUB
> string on every error path and lets devres release the firmware system
> name on probe failure and device removal.
> 
> Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
> Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied now.  Thanks.


Takashi
