Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B016A33D51A;
	Tue, 25 Aug 2026 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644537; cv=none; b=hupIoGAc/GOLwz5iCxdG0SwT+U3iwgrNqOaCKf//5CT5+wVwFJMB0ER5Cpvl+SAFAxFN4xk5AduaS1/Ets83lLZBs1Tff8haXHaAoi/G4nszvlNlyMyo26bJT0EmnKXqhPp1kQWirNMLAyndbxI/M4B2J2GaumZQt5FMAnkG/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644537; c=relaxed/simple;
	bh=w6k4yxUIlgq3rTwngzAe8W4NW320TicNmCK7vltjCFY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtizN82Ite43fwtLthwzwqc6eVTFXuDaARcvfR2ZLsQZrn3hSN4/IbCI4iyo/C0na6pseDBUq78vYj5X5yJX6ER05fR4RrQXJCyVQa/hCo9v2YHTKGMEFVSiIIVfBMWHDTd5t/g8v5QRwGwAa/+rP+lEBsqpgc65sQ2+3D5nADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dwQRPwY9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CKTZjF9m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rgige9R/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HIaoTn/l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dwQRPwY9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CKTZjF9m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rgige9R/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIaoTn/l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64B7586D79;
	Tue, 25 Aug 2026 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcEOKAMSRfvcvkRR8DohH3uU+oR2/7ZyFshxDbXUS1Q=;
	b=dwQRPwY9sZuwSXU8oTeBJnF85KlnVBKouTiRv1BzIAIgWmftvpW2o2PlszAR04Jc4EsdGK
	kNXcIadpv4TO+IuDeEdoTAAA01x/v72Z14N82ofR3NGF5FJTnnXSADu5iYY9Tz84XMe0KG
	GdMF/ycdyJUWDmNoF9Ltb7/2nQg4+lA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcEOKAMSRfvcvkRR8DohH3uU+oR2/7ZyFshxDbXUS1Q=;
	b=CKTZjF9mGFPaY6w2S0BF6H9PElArL+CbgSP9PXZGhuFmgTkMNKzJljIVS0XF8I+1J/InGs
	WnQIrFgeeqqYfrDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="rgige9R/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HIaoTn/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787644525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcEOKAMSRfvcvkRR8DohH3uU+oR2/7ZyFshxDbXUS1Q=;
	b=rgige9R/DujZJDrU68a0yn51ac7mFWJwlEkfRYH5RZHcIse18gEUEe6CzscMTaW542tKzM
	9PXPMr5oBNMQlMucq04/4f4NzcCY43QJugPoI4O8fRxqINSbIN9oggftWXEibLzhUNkAbm
	9B9PnQNPhqv0Mi98uakAQv3LMycCJ1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787644525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcEOKAMSRfvcvkRR8DohH3uU+oR2/7ZyFshxDbXUS1Q=;
	b=HIaoTn/lvCHwXtgERq103Ba37AGuWOODV0R7j0GWrCJdQ1rpltMgb5fvrf0sqraxKZ/1Ee
	YQ12Ta0J/d22FxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EC901339D;
	Tue, 25 Aug 2026 07:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qrMjBm1KjWoObAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 07:55:25 +0000
Date: Tue, 25 Aug 2026 09:55:24 +0200
Message-ID: <87mruatz0z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Federico =?ISO-8859-1?Q?Valent=EDn?= Andrade <fandrade@frba.utn.edu.ar>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com
Subject: Re: [PATCH v3 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
In-Reply-To: <20260824140211.17003-2-fandrade@frba.utn.edu.ar>
References: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
	<20260824140211.17003-2-fandrade@frba.utn.edu.ar>
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
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 64B7586D79
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 24 Aug 2026 16:02:10 +0200,
Federico Valentín Andrade wrote:
> 
> The M-Audio Venom (0763:2084) is an USB Audio Class 1 compliant
> synth with an integrated audio interface, it does not implement
> GET_CUR on SAMPLING_FREQ_CONTROL, hanging up if requested on
> endpoint 0.
> 
> The first class request issued by the driver after enumeration is
> a GET_CUR on endpoint 0x02, freezing the device's USB microcontroller.
> Timing out on every transfer afterwards with -ETIMEDOUT, such as
> SET_INTERFACE, so neither the mixer nor any streaming interface is set up.
> 
> Analyzing a USBPcap capture of the Windows driver I found it never
> requests the sampling frequency, as the synth exposes a single
> discrete of 44100Hz on both streaming interfaces, thus asking for it
> is unnecessary.
> 
> So I applied get_sample_rate to avoid this check, and
> disable_autosuspend because the synth doesn't come back from being
> suspended.
> 
> Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>

Applied both patches now.  Thanks.


Takashi
