Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8088BE8;
	Sun, 12 Jan 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736673121; cv=none; b=sgk+uPp6OTBEKS/Z2/L+HmBUdLv33IxXaNFeyyzl/bLo9HwuGvVqay/jCLLcuEFP2NcHLWHuJCZx0tT+YpaV4agC7Q8AcFo6ygR1PocGiofAgec8JZhLe6WAIsNlWBV98jjZOUgLixgV8i5sPTYsr8JZu7dFSQC0NiRCZzOB0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736673121; c=relaxed/simple;
	bh=6YoHkTmbtyOybCZXIQwazykuIXXu79z0q3KQg9p+Qa4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbEHwScS1VOUM6h7BM6fh3XYh6lAD5PsVo9zhcq0QE1z1hUhMwph5Jzjxj1Dsr8vzGiheyOk2KOZ32LzrBURIjUuP52J3HpoTJ7Zl+aEgKbJCXUCh8DtOuL77adwwMOjzaVFZ9rqCdj9I8Ms9O6rk1d+rKaHZgznd2yesZebrpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H9DB0qm4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sn2p7wRK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H9DB0qm4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sn2p7wRK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H9DB0qm4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sn2p7wRK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H9DB0qm4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sn2p7wRK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 644B12122D;
	Sun, 12 Jan 2025 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736673117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CQXT/gvoMYWB88pzOvvtkdpkN6aqbRiW2oBF3k27/6M=;
	b=H9DB0qm4uJ/vHvfHDhe61flOSJw+hBDToVDZh9uvdJe/CUfjzg4r6n0Q5Srz74rgf70e9N
	UqZETJhu9LPP/5UEIDzy6B3Z8U8Z2e4zBV3KswVh+M5QJzI1+Bipsg9saIPlUNLvLYIFOu
	StIur+1kWfIyb97DxIj2BUqqeL2FrC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736673117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CQXT/gvoMYWB88pzOvvtkdpkN6aqbRiW2oBF3k27/6M=;
	b=sn2p7wRKvK9jy/2WHYxjwn6iO/DRXS+p4IuAc+avYr6ry9hD+BJBvEtCgTQi//qwswm5+t
	qEmhszn2exR8TEDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H9DB0qm4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sn2p7wRK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736673117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CQXT/gvoMYWB88pzOvvtkdpkN6aqbRiW2oBF3k27/6M=;
	b=H9DB0qm4uJ/vHvfHDhe61flOSJw+hBDToVDZh9uvdJe/CUfjzg4r6n0Q5Srz74rgf70e9N
	UqZETJhu9LPP/5UEIDzy6B3Z8U8Z2e4zBV3KswVh+M5QJzI1+Bipsg9saIPlUNLvLYIFOu
	StIur+1kWfIyb97DxIj2BUqqeL2FrC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736673117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CQXT/gvoMYWB88pzOvvtkdpkN6aqbRiW2oBF3k27/6M=;
	b=sn2p7wRKvK9jy/2WHYxjwn6iO/DRXS+p4IuAc+avYr6ry9hD+BJBvEtCgTQi//qwswm5+t
	qEmhszn2exR8TEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F28D13961;
	Sun, 12 Jan 2025 09:11:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lEAKBl2Hg2cTXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 Jan 2025 09:11:57 +0000
Date: Sun, 12 Jan 2025 10:11:56 +0100
Message-ID: <87frlotmzn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: fixup ASUS GA605W
In-Reply-To: <20250111022754.177551-1-luke@ljones.dev>
References: <20250111022754.177551-1-luke@ljones.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 644B12122D
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 11 Jan 2025 03:27:53 +0100,
Luke D. Jones wrote:
> 
> The GA605W laptop has almost the exact same codec setup as the GA403
> and so the same quirks apply to it.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Applied both patches now.  Thanks.


Takashi
