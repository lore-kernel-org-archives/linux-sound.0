Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469FA1B0414;
	Sun, 12 Jan 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736693316; cv=none; b=eAQxJkhHkkbsM2RnVjkFcYWNMlmt52QBlmrf02tEPbuYL095jwMgk+kjY2eoM+qz2YFgQU+FiVN06mpCs5eyE0ZQgl2z695Co0Lzy0dwE5dfHl+VPejvS0/xDiqka6KxWrhMG6wXivXigDfOrgYEDbNsUplAllh46tQxwK0/Wfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736693316; c=relaxed/simple;
	bh=p6CfL6g4ywQfh2gdNbtjZGFiKNf40+RPKY2mPjYe3tE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IELV/lheTeYzciXZpvC4pncfVdPjylVGSu5jaDUG5sTgPLJpWXyAaz/mivc9MEoIcsibtpm67hB9rpuzHBta53Gb9cD+GB4LgZu7dDjqTSFmORMoe6b5bxAzYG2P+oAScmftOKiWnLDsw2kZ3+W1BmavUzIeW52T4xohObr+FXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BYTAteNh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n4Mb+C/4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BYTAteNh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n4Mb+C/4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BYTAteNh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n4Mb+C/4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BYTAteNh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n4Mb+C/4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48DBC1F365;
	Sun, 12 Jan 2025 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736693312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuCZGq4hqI9w1jubBZHYEd25mQ3nzyDDs6k6wT3Kyq4=;
	b=BYTAteNh+v9TQjhfVLrwa37cO+ZNYWN7HW6tXIaj0qV3JFeBPByR7YVRHHmydUJg1epfu6
	31ztAXob83zuNzYRluwXZ4VLg5m1rWqdm0nYsnIVSDHZhfdsZKnCLzjt/i8NGNkZJAMEV/
	Mq/H0NIxzovZGwsN2CyXzk0f9HQDDaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736693312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuCZGq4hqI9w1jubBZHYEd25mQ3nzyDDs6k6wT3Kyq4=;
	b=n4Mb+C/4wwcn6BV2CQoctm86veMqL78T67fkX97VDST96kNNswU2OklvchSEHuc/eloSqJ
	Nt0bu28iFTuxjJCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736693312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuCZGq4hqI9w1jubBZHYEd25mQ3nzyDDs6k6wT3Kyq4=;
	b=BYTAteNh+v9TQjhfVLrwa37cO+ZNYWN7HW6tXIaj0qV3JFeBPByR7YVRHHmydUJg1epfu6
	31ztAXob83zuNzYRluwXZ4VLg5m1rWqdm0nYsnIVSDHZhfdsZKnCLzjt/i8NGNkZJAMEV/
	Mq/H0NIxzovZGwsN2CyXzk0f9HQDDaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736693312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuCZGq4hqI9w1jubBZHYEd25mQ3nzyDDs6k6wT3Kyq4=;
	b=n4Mb+C/4wwcn6BV2CQoctm86veMqL78T67fkX97VDST96kNNswU2OklvchSEHuc/eloSqJ
	Nt0bu28iFTuxjJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 155FC13961;
	Sun, 12 Jan 2025 14:48:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FVp1A0DWg2fDJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 Jan 2025 14:48:32 +0000
Date: Sun, 12 Jan 2025 15:48:31 +0100
Message-ID: <87plks2im8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yage <icoderdev@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix volume adjustment issue on Lenovo ThinkBook 16P Gen5
In-Reply-To: <20250112131324.20900-1-icoderdev@gmail.com>
References: <20250112131324.20900-1-icoderdev@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sun, 12 Jan 2025 14:13:24 +0100,
Yage wrote:
> 
> This patch fixes the volume adjustment issue on the Lenovo ThinkBook 16P Gen5
> by applying the necessary quirk configuration for the Realtek ALC287 codec.
> 
> The issue was caused by incorrect configuration in the driver,
> which prevented proper volume control on certain systems.
> 
> Signed-off-by: Yage <icoderdev@gmail.com>

Please give your real name to Signed-off-by tag.
It's a legal requirement for upstreaming.


thanks,

Takashi
