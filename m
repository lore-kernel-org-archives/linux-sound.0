Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497B378832
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784450937; cv=none; b=oIlc+jdLWKLSPNODGaFHkSpaBws1itUAqxbsYxZXRIozw3GIV4uuwG4OhTxpZegCXwoXq49nRmAUyxRanHQ5c9vTwO1d5ySskyvdypLlITNaem66VLAm9QZq2aI87bjrkxChT9pIHR7vpqK6LbdMDxLQby0hOnEPznJ0ktI8h+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784450937; c=relaxed/simple;
	bh=tVaZ3JoXY9L4cB85m+WjbIi/U6g8+hatYmY0tZGYlkg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ex1pwNxQoHZ6D9276cKlk3YhqIh9CSRd7mV/Ps1hn0RjOia6BjagA1C7NAUyAHNyZL5HTMeCkdjO9HzmplR8fnif1BO4JJscBjLNg3zVGCRPxIo7C/MICwdujfDphkqiQqfuKrNg1e/nsESLUuZlPXCSEKl/MZr0gM57aCAMV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QlBJ8muC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zb2nixyE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mByHQhqM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U41wOEqe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QlBJ8muC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zb2nixyE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mByHQhqM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U41wOEqe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE897798B6;
	Sun, 19 Jul 2026 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784450934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhtW55RPd+V+t5TLKiUVno6m3BNl6v8uYA9lCmBL7KU=;
	b=QlBJ8muCHWy3KNmm3C30ipF0qa8M1gxdoi+GrHpXHkt0mdt5SLLoDZhTpnWtWJDk5f5ulh
	RBv9Xd5qy8i9GxpBkX6MxLiWqwGSoPC2ti7yWKwY8SXNAZdkaT6MMRrHVkge3Gh8qn/vkt
	3x1pIAlXFSpnutMIjR1TiRozYiN2jyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784450934;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhtW55RPd+V+t5TLKiUVno6m3BNl6v8uYA9lCmBL7KU=;
	b=zb2nixyETZIiIoDBKfiDwu7zVE8cLykU2/zZkEfJr0I0Hu2b7T5dwn6zc11klKAYS2naXa
	8eRBM++zEDGFSOBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mByHQhqM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U41wOEqe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784450932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhtW55RPd+V+t5TLKiUVno6m3BNl6v8uYA9lCmBL7KU=;
	b=mByHQhqML55tuwPozpH7Ao0KbaN2AbmxH5vmJ3k9MfGn0mqc4ffdgf7nn1WSbpjqzE/cf8
	KbSpABl14krJelbG6BwOYruuv4bHwKwOlfW8ftaaP98oGmnpQPoFEz29HTmoJKo3ZlMOzc
	XYy7XbkcjYhj2c5XStAuWehCNexoIBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784450932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhtW55RPd+V+t5TLKiUVno6m3BNl6v8uYA9lCmBL7KU=;
	b=U41wOEqev82PBaGCagMIhHLIzwRCsfOAigENnahE3V1WfKiDkxzKaOcwXKUnSZ1XspkABC
	VEqvS3A2oXbRRGAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41BE0779AA;
	Sun, 19 Jul 2026 08:48:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ttEMDnSPXGqQSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 08:48:52 +0000
Date: Sun, 19 Jul 2026 10:48:51 +0200
Message-ID: <87a4rns6to.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
Cc: "'Takashi Iwai'" <tiwai@suse.de>,
	"'Yufan'" <kuangfan955@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<david.rhodes@cirrus.com>,
	<rf@opensource.cirrus.com>,
	<perex@perex.cz>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-bh0xxx
In-Reply-To: <003901dd1525$71ebe080$55c3a180$@opensource.cirrus.com>
References: <20260716101708.86725-1-kuangfan955@gmail.com>
	<87ik6fut08.wl-tiwai@suse.de>
	<003901dd1525$71ebe080$55c3a180$@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AE897798B6
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org,suse.com,cirrus.com,opensource.cirrus.com,perex.cz];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 16 Jul 2026 15:17:25 +0200,
Stefan Binding (Opensource) wrote:
> 
> Hi Takashi,
> 
> We should be able to add entries for this laptop and others in
> cs35l41_hda_property.c to override all the missing properties from ACPI.
> The ACPI in those laptops is malformed, which means the entire _DSD for the
> CS35L41 is corrupted, and appears to be missing from the kernels
> perspective.
> In most cases the malformed ACPI is also not correct for that laptop, so its
> not a case of taking the settings from the ACPI on the laptop itself and
> putting them in cs35l41_hda_property.c.
> 
> However, we should be able to determine these settings ourselves, but end
> users will not be able to.
> We are actively looking at doing so for this laptop, and several others.

OK, then I'll keep waiting for your solution at first.


Thanks!

Takashi
