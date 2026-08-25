Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213225A640
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655884; cv=none; b=OXUyHsWdscTLYqTCGqgHILhHzzTsteH/Rygh744n24B1CBKUpPDBRARWYjCJiCF7B2/d3jI6GlLVG3oVtozCjYnKSvGETRIdPD5zwc5fa5MkE4vU3eitAbJ9KS5ByVBiJaQdf6Q41H0CH/UDYH0B5eBeWWuh4vgpE+Pz5tLaOpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655884; c=relaxed/simple;
	bh=XAmRwKy6rqYYQtXykzmNGd8JW9mpq45ymIPfFe2oVEs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CgmIpxDvCi4iyYmiejOBRc+dnGeVAJ2o0K5DhK1KP3MMSHr8PK8iK1grz8ggAmInU3WzQP6gztTToYc3Uw7MR+EZUOhqtLFwRQADY1BnicIxibYQTFLU5FQTumDw/i2feCPzSCPs/ZgegRyu6bTAYpLhbgufleWlsyMIUjm/G7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=doxY1tPY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=66kSnQlL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xQfY8VTl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gzM9SEEE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="doxY1tPY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="66kSnQlL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xQfY8VTl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gzM9SEEE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6C771F7CB;
	Tue, 25 Aug 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787655865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSSIo+D6ZbvIE/2dhkB6WSMQs/S1gZ+yCG8xQ8agXjc=;
	b=doxY1tPYv2xxmJoauQCo1iDEpnrawAGzjgpdOGUjo1B2CdIs8Vqq4Bgep2RB44+5/0QEhp
	CGr6P+32AMFNwOCpFlHa/oyGjNODG+p0O/HvMg9gCQQCJIul1y2aKsSTYVL+KdySiSzUb5
	dxowaUGRe6F51FRJFCq2h2EuQluKvv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787655865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSSIo+D6ZbvIE/2dhkB6WSMQs/S1gZ+yCG8xQ8agXjc=;
	b=66kSnQlLEbcmHgtVF/26bxRp0Wrwazjuu4MJGM1E0Elt5bWpFwJkEMZVmP2gDAb2Y9vWb9
	Vr1kImJRzfrqjyAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xQfY8VTl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gzM9SEEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787655860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSSIo+D6ZbvIE/2dhkB6WSMQs/S1gZ+yCG8xQ8agXjc=;
	b=xQfY8VTlnpCRkahFrCZskzcqAKjdEU0oSuT4ho8oE18KcrWYIh3SXhmfxlRt6PEaILL/rA
	g3vg30x6L6r6NOjNbYymchHtETXBJW+HscGjJSBg1u+DtdKFHA1yMDdo7ecx74Pkh5km2m
	4luufPKR7uoVmZrhJghqUg1dyDC8pDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787655860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSSIo+D6ZbvIE/2dhkB6WSMQs/S1gZ+yCG8xQ8agXjc=;
	b=gzM9SEEE09eMrcZl6py0XN//ZYxD4H63tmsURgAIT/eWoiTqQAFakvyyFOeN22cy+ncdCl
	IhHObht9vrohmRBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC69C13332;
	Tue, 25 Aug 2026 11:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2CtxKbR2jWraKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 11:04:20 +0000
Date: Tue, 25 Aug 2026 13:04:20 +0200
Message-ID: <87qzjmsbpn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Habil_Eren_T=FCrker=22?= <habilerenturker@gmail.com>
Cc: perex@perex.cz,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,	Habil Eren =?ISO-8859-1?Q?T=FCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker mute LED for HP Laptop 15-fd0039nt
In-Reply-To: <20260825084125.4103-1-habilerenturker@hotmail.com>
References: <20260825084125.4103-1-habilerenturker@hotmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,hotmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: C6C771F7CB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 25 Aug 2026 10:40:14 +0200,
Habil Eren Türker wrote:
> 
> HP Laptop 15-fd0039nt (SSID 103c:8bb6) needs a quirk to control the
> speaker mute LED via VREF100 on NID 0x1a (active-high).
> 
> This patch replaces the previous ALC236_FIXUP_HP_MICMUTE_LED_ONLY
> with ALC236_FIXUP_HP_15_FD0XXX, which covers both mic mute (GPIO0)
> and speaker mute (NID 0x1a) LEDs.
> 
> Use spec->no_shutup_pins instead of a custom shutup hook, as suggested
> by Takashi Iwai.
> 
> Fixes: e711ebfadc9a ("ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt")
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>

Applied now.  Thanks.


Takashi
