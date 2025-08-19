Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E40234984
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584459; cv=none; b=KPCvOVhiusU7LWAP3FCrMPqcN4HG2I19DhcMqbHnX3oM+K5IleNekiSdq5Tt+3mGBUEpj10uTEl/i5FaLmbAS9IrlGeV6cKDYZFbqK7PcFlnaMjA/d6SHg0bU5W4Nxhm3xn46ns1GeE33bsN40BIaBiSRec7AmE37UPyqjMyCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584459; c=relaxed/simple;
	bh=z/CPWp1muVFYf6HRyrBefcBbKIWASaHHqaWKki4OVsc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhXiGusSa+HNeEgssv5wCyk761uZHI3qV8LNyDw8pCVhcC8avQH0XbtsoKvKosXTSoD+eZxd1ECpSj8q2PQmwTM8ZwEYrHeIGaAgCfcn2laLBz4isfNtcW77E7fJXPjDS8PUuJO8pzHLtwrKK/2XVO/pMDk4pOrTKWnYkNt0RRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VeZJCRE2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gx1V0qt6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VeZJCRE2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gx1V0qt6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VeZJCRE2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gx1V0qt6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VeZJCRE2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gx1V0qt6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 881D02124F;
	Tue, 19 Aug 2025 06:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755584449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q7hNNPDDobD+wmtNRnZsjqfi7VhWUP9I1VgOcjr0p4o=;
	b=VeZJCRE2xewX/dVw7dwncZDWIzPnmRid36qey5yJ07LAwNzdG72tKDvjGxqfaJMaQgWkuY
	GzLJiRTi4QoJ5Ce8UNnTHyJXe1ntbJNtdxf8wbZyEbdx6EmyS8wMNBjo5hdrvnLFkMfe9k
	p7gWh+CHEpwDOeEZMzID2iMwTFhCnbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755584449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q7hNNPDDobD+wmtNRnZsjqfi7VhWUP9I1VgOcjr0p4o=;
	b=Gx1V0qt6HoHUr8wW0eb5dEkh0Tm9qTTe5cvjKlFFJSnpxJYYKvW9Wpn/h7aGsbFScPLsK3
	7KcwYyshNFhjx7Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755584449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q7hNNPDDobD+wmtNRnZsjqfi7VhWUP9I1VgOcjr0p4o=;
	b=VeZJCRE2xewX/dVw7dwncZDWIzPnmRid36qey5yJ07LAwNzdG72tKDvjGxqfaJMaQgWkuY
	GzLJiRTi4QoJ5Ce8UNnTHyJXe1ntbJNtdxf8wbZyEbdx6EmyS8wMNBjo5hdrvnLFkMfe9k
	p7gWh+CHEpwDOeEZMzID2iMwTFhCnbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755584449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q7hNNPDDobD+wmtNRnZsjqfi7VhWUP9I1VgOcjr0p4o=;
	b=Gx1V0qt6HoHUr8wW0eb5dEkh0Tm9qTTe5cvjKlFFJSnpxJYYKvW9Wpn/h7aGsbFScPLsK3
	7KcwYyshNFhjx7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51E18139B3;
	Tue, 19 Aug 2025 06:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JfJQEsEXpGhADwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 Aug 2025 06:20:49 +0000
Date: Tue, 19 Aug 2025 08:20:48 +0200
Message-ID: <87sehnvnlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14
In-Reply-To: <20250818204243.247297-1-kovalev@altlinux.org>
References: <20250818204243.247297-1-kovalev@altlinux.org>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 18 Aug 2025 22:42:43 +0200,
Vasiliy Kovalev wrote:
> 
> Add a PCI quirk to enable microphone input on the headphone jack on
> the ASUS Zenbook 14 UM3406HA laptop.
> 
> This model uses an ALC294 codec with CS35L41 amplifiers over I2C,
> and the existing fixup for it did not enable the headset microphone.
> A new fix is introduced to get the mic working while keeping the
> amplifier settings correct.
> 
> Fixes: 61cbc08fdb04 ("ALSA: hda/realtek: Add quirks for ASUS 2024 Zenbooks")
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>

Thanks, applied now.


Takashi
