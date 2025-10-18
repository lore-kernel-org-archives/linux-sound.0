Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700481ADC7E
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760805500; cv=none; b=WJPoB4f199KNAZ+i5yI+cih2Yu0K/u789+OTSC4AxexSxkW143k+Ze2epjX12zuIcg0L4n8qSXuohSHsHuEd6Qk/twSFHoRWGEwc3s6uuQ+YoRdAc10Tqz9UZ5/cy5xcRwWcO+8Is05kc8UkdN1zXpJNUsjr+bxyY2/p2nqqNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760805500; c=relaxed/simple;
	bh=gPS3aYyU/JcbhBKCetolkWId0+mSOKXAZmGjpIjExh8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPQ4BBQqd72MtPhYbif1AItKMRnj+q8O1oIpx82zJVhWXAs51SXY1E4tNH3V3smj77NpR0b7WCStiGXl7D1peler0o1rOYsqRa3TEVbz5UlGzjCkFvg9eJnDgiFYIUsYescKqXcTPyNTqaGjUcAqIYm3mkw2dU5ezarrcLjNFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sj4BeL/D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ble4UIDK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sj4BeL/D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ble4UIDK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sj4BeL/D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ble4UIDK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sj4BeL/D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ble4UIDK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77494211F4;
	Sat, 18 Oct 2025 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760805496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/mOEWJlDLLfPFPrsWWmBAWDUXwGiGVHPNDnLvK4I6E=;
	b=Sj4BeL/DBOM7b9FHrNCzMqyQCeaB85r+IVKR61BhQXL8p2SWPIS+2isTaP5QAB8yYN0Oao
	jOuVpYS8K0AqgDw/B/vBRJsrHpsmgMoowV4pzSrhyYrywzhtF8o6y8jKPBU1H9lB3S9blI
	3YyjAti7pfwDEYUqvStYAj3xbIsO2oQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760805496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/mOEWJlDLLfPFPrsWWmBAWDUXwGiGVHPNDnLvK4I6E=;
	b=Ble4UIDKxDPIHuIcX44TusDcvjyvX4UmdIKZ/QAW8FhxZfkg37D/ni2JMb3TgQRNFMUxZK
	gMCUZP3e2933CUDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760805496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/mOEWJlDLLfPFPrsWWmBAWDUXwGiGVHPNDnLvK4I6E=;
	b=Sj4BeL/DBOM7b9FHrNCzMqyQCeaB85r+IVKR61BhQXL8p2SWPIS+2isTaP5QAB8yYN0Oao
	jOuVpYS8K0AqgDw/B/vBRJsrHpsmgMoowV4pzSrhyYrywzhtF8o6y8jKPBU1H9lB3S9blI
	3YyjAti7pfwDEYUqvStYAj3xbIsO2oQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760805496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/mOEWJlDLLfPFPrsWWmBAWDUXwGiGVHPNDnLvK4I6E=;
	b=Ble4UIDKxDPIHuIcX44TusDcvjyvX4UmdIKZ/QAW8FhxZfkg37D/ni2JMb3TgQRNFMUxZK
	gMCUZP3e2933CUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56D371386E;
	Sat, 18 Oct 2025 16:38:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wj7WE3jC82h3CAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 16:38:16 +0000
Date: Sat, 18 Oct 2025 18:38:15 +0200
Message-ID: <87ms5o413c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: dice: add support for TASCAM IF-FW/DM MkII
In-Reply-To: <20251017111145.263295-1-o-takashi@sakamocchi.jp>
References: <20251017111145.263295-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 17 Oct 2025 13:11:45 +0200,
Takashi Sakamoto wrote:
> 
> TEAC Corporation launched IF-FW/DM MkII as an add-in card for TASCAM
> DM-3200 and DM-4800. This card uses TC Applied Technologies DICE II
> ASIC.
> 
> This commit supports the add-in card. The configuration ROM content
> includes some quirks:
> 
> - The category value stored in chip_ID_hi field of bus information block
>   is zero.
> - The value of model in unit directory (0x00022e) is different from the
>   one in root directory (0x000006).
> 
> The hardware allows users to select the total number of audio data channels
> available for system from 16 and 32 channels for both input and output
> direction. In 16-channel mode,  all audio data are transferred in a
> single isochronous packet stream, while in 32-channel mode, they are
> transferred across two streams. After the user changes the channel
> configuration on the hardware panel, the device temporarily disappears
> from the bus and reappears with the new stream formats. During device
> probing the ALSA dice driver checks the number of available isochronous
> packet streams to determine the active mode of the hardware.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied to for-next branch now.  Thanks.


Takashi
