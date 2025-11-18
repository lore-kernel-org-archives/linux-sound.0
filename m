Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D822773E4
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448991; cv=none; b=fLYMN223MAGo+LHFkBS/2emLZzJCjoI4Y06tnYsn9mgZ/vPZIOQtbxAL55mbO46f+vI3WS39nDuX+V/MDNOunDygxRWTajkH4WQHR8QbPV4qj5z1VmqNCXUBlgfyMWjiaH0lTXQPBBsEWMgyyaNB4m9vT4sG02VZHoa0OZq8TdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448991; c=relaxed/simple;
	bh=wCZ73G7RwrNqiqCAcni2e4Fp4sSADdhjY2MbWf1Yea4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q2QdiW0ol/iVS0ZQe6q81CqhWCIdsXdTpuoWE4Hax5q9CWUQCC99amgtdzUa1GqwVc4V0eG9HO3WXbbCqjzU2h49GdvqvQAL2j+vyi4o6f1gx6tmHGX3NnjiDPfUc4BIDsQEhww6TilLGP6B237J9xlzCaaLdyLiSt2P4VEzQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=spO+t61G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SSFG/gjh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ITJ54wRO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5k0q5UO5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="spO+t61G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SSFG/gjh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ITJ54wRO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5k0q5UO5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE239211CC;
	Tue, 18 Nov 2025 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763448982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1A2otjNvgwmFNeiirPA/IN577qPVBNatF/AkNJN9nA=;
	b=spO+t61G1yPSBHGbzGOqliNShdcO1LDxhP6xB/CVxmUAcK+AJCnlUZMEMmWK1O3zdfstXb
	EHNahgJ4wlRWGN5ibtxb+GD+j/j0nNEnyOW3d1vdBdiw39xejx1IwWfc4emZJVQi3WpFiJ
	tQgpV45HnDkQzDfESan8zFDdOUZ+r40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763448982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1A2otjNvgwmFNeiirPA/IN577qPVBNatF/AkNJN9nA=;
	b=SSFG/gjhpmrrzgrz6IrYSp2Dw93iqRiDTOExrCYrKFdA3FJT4YnvdtuexeZIXChJTF5y5T
	ahIZbaVYsDZKs0Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763448981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1A2otjNvgwmFNeiirPA/IN577qPVBNatF/AkNJN9nA=;
	b=ITJ54wROM4tJhbtN38FGBuvhhuMZ3qG8K6lzQgguFTUnTw4atUSKD4RsvKDiFd1Gq0Bg4W
	0o8CYMiogfeP9e8mPe2E50u12fiHG2hxYpls3A4RcMR2UKb9mupEBl/LQTYRiStMiEF67+
	j+w17w5sAwQL01NUQrmt+rT6lm7S7Fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763448981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1A2otjNvgwmFNeiirPA/IN577qPVBNatF/AkNJN9nA=;
	b=5k0q5UO5YXEvLQNS1Cha84wfapPyh7TUZCtE3XUWYEfvHue72WvQyt6MhkB8+MiWHeVCYp
	4wUnrTtZr74WiHAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5A073EA61;
	Tue, 18 Nov 2025 06:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9VgyJ5UYHGlsQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Nov 2025 06:56:21 +0000
Date: Tue, 18 Nov 2025 07:56:21 +0100
Message-ID: <87y0o3esmi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rf@opensource.cirrus.com
Subject: Re: [PATCH V2] ALSA: hda/cirrus fix cs420x MacPro 6,1 inverted jack detection
In-Reply-To: <20251117.182351.1595411649664739497.rene@exactco.de>
References: <20251117.182351.1595411649664739497.rene@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 17 Nov 2025 18:23:51 +0100,
René Rebe wrote:
> 
> Turns out the Apple MacPro 6,1 trashcan also needs the inverted jack
> detection like Mac mini patched, too.
> 
> Signed-off-by: René Rebe <rene@exactco.de> 

Applied now.  Thanks.


Takashi
