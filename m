Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31B199BC
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858331; cv=none; b=q0fMQ1kL+UDEbi9Dtoupbzkj5Xx6Y+HEV3Qq4X+U3f+5kBOxNh9ff9D1/oQNuTYEgnZqlJ2//DvDRIlmleUJ72na18dLwoWewHDlpW30c3OmmFVFHDHYf2PgpkjueNjeANIRfF/yqUMslKxCOLnWMelnfhivu108Y0nuVWvmvug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858331; c=relaxed/simple;
	bh=vcomCsS8vGaH9x5JXSKM2sRl5VCMsY+8hq3RZ+ntiLc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbieXFJF9KFcYubfssbATf52U/KrhIrK9eUIVMufchYMuPWQzy+U7xwVBEcWdwFifzRfgA79dtTg9cH7+cV+PRUfjo2UROiqox+ObL99A3RegsZhLI1m8Rleys7SMKFAMaCtBO5PF+IV7uwJJgjBjBQeosVHvKUTH0snCzIBtV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rFeOaYj1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=suk5mr6m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rFeOaYj1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=suk5mr6m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rFeOaYj1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="suk5mr6m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rFeOaYj1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="suk5mr6m"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 548491F45A;
	Wed, 30 Jul 2025 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NC/ae93nUOfFJAm7ykrBqKhQrOW+D+LntLOlpAiHbU=;
	b=rFeOaYj1wmgMANPGjYHQ40elAOTfNuJlbhRVfID+eYznUenDHknS96Qhcmx+QjD4sQxQhb
	znMnxdXffFfwAgGfTtGjYI0SItM6pkyKEn2vWnsgzz7tQmRB0CGJ1wWp0M7K2gwrjS64pz
	TxcjxRnKI+AWAxOB0jMwQo0s8A0c17o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NC/ae93nUOfFJAm7ykrBqKhQrOW+D+LntLOlpAiHbU=;
	b=suk5mr6mUdpg4G2Km101DOwUFKTu+UgIXpz4Uco/pJaa0SG3ydasajEC4wKGNoz0n6eDDa
	8WUh1Lv56eY2XaBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NC/ae93nUOfFJAm7ykrBqKhQrOW+D+LntLOlpAiHbU=;
	b=rFeOaYj1wmgMANPGjYHQ40elAOTfNuJlbhRVfID+eYznUenDHknS96Qhcmx+QjD4sQxQhb
	znMnxdXffFfwAgGfTtGjYI0SItM6pkyKEn2vWnsgzz7tQmRB0CGJ1wWp0M7K2gwrjS64pz
	TxcjxRnKI+AWAxOB0jMwQo0s8A0c17o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NC/ae93nUOfFJAm7ykrBqKhQrOW+D+LntLOlpAiHbU=;
	b=suk5mr6mUdpg4G2Km101DOwUFKTu+UgIXpz4Uco/pJaa0SG3ydasajEC4wKGNoz0n6eDDa
	8WUh1Lv56eY2XaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 242CD1388B;
	Wed, 30 Jul 2025 06:52:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sPudBxbBiWhVOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Jul 2025 06:52:06 +0000
Date: Wed, 30 Jul 2025 08:52:05 +0200
Message-ID: <87y0s6rx0q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: edip@medip.dev
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek - Fix mute LED for HP Victus 16-s0xxx
In-Reply-To: <20250729181848.24432-2-edip@medip.dev>
References: <20250729181848.24432-2-edip@medip.dev>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 29 Jul 2025 20:18:48 +0200,
edip@medip.dev wrote:
> 
> From: Edip Hazuri <edip@medip.dev>
> 
> The mute led on this laptop is using ALC245 but requires a quirk to work
> This patch enables the existing quirk for the device.
> 
> Tested on Victus 16-S0063NT Laptop. The LED behaviour works
> as intended.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Edip Hazuri <edip@medip.dev>

Applied both patches now.  Thanks.


Takashi
