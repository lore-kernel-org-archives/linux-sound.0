Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615015;
	b=vyMGxfDaUcsU8zjOBZIFeGD5Gn5bVq8uqA39i8bB13hjXWn+TWHunlVIqH2mBsl10vU1
	 Gw61VA5kl7a1/Yyy8Mmr0L0YmcRJbCcxLnwEiTnTZqoE0yBMDZEPAYiF6j+I7qSFbtVhX
	 IQZHxg87whBmaPfUQ6pz5ufbd/CxxuhKjKdA1xKd6fT8ImV7SZ+W2hKbiEEXFr7omNs2Z
	 EF0e+EpKoGANY+LbRPM3KKKNJdKo++N+u34LBFhYHH+9gY0aIPB11JO0ShWz3AMYzQpFf
	 iv7sUTJhPjSVHkhj1Iuj9xuk15Mv+CmND4P6A4Fhvrc7ifzd1Hil/VhlyRR6fw6rekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615015;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=9w4C1ZbkD4dvO5vqJzlHVgqsFiJB6NDE/MANwcuGmF8=;
	b=O+smoTeLuWiSFs4OoK8/lU3XoCfruK2BSaKGb+LbNSALrTsdQ7HBmcmxQ5akOt7v9ZjT
	 B+dCJY/FuHuUbO3e8fAzdZCu7DtSaPt/JYUGMf43tpzF0s4V9er/CZaCW8kzQfUG4SV1P
	 UIMYoRioFAFDPdfOGsdXQSu22ToM84d+VAQ8Y81KNVEO3OixNyynHK8cboSXuY6qWsJbs
	 7zlUW3ulQeIENDGMUp3Kl2Sk21iLPnWlxTF1LvuBF4ik353K1dYw3Saj1Vzju7cLyeEqd
	 u6sCwHN4apxgqM0QMTDhE07EauhaUydMmKUyiq7Fr6Ct58iyK51pGZBECzwcxOnj5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kLR1o5V0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A08ksjMR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zHjZOZgB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HMn6j1bE;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E9606A31E;
	Wed, 25 Nov 2026 13:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kLR1o5V0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A08ksjMR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zHjZOZgB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HMn6j1bE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E922A220A6;
	Wed, 25 Nov 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9w4C1ZbkD4dvO5vqJzlHVgqsFiJB6NDE/MANwcuGmF8=;
	b=kLR1o5V0X6hTnOuLTAh1mGMClfPsDFuvf3dxeH6mORt8++9QNFgJUJYgWk9D6tEbZP9J/M
	6t/icLSuSZkPbiqIQbumhal05kOig8aaC7h5Zy6cGyvlpRk7E0VRgpWRF0oFPqf2D1UmET
	pUOSy8ggPR4f7+QRzzh8EkDYAAdaR5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615013;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9w4C1ZbkD4dvO5vqJzlHVgqsFiJB6NDE/MANwcuGmF8=;
	b=A08ksjMRFq23HC6LvUbuiDppqRL1h+GepKKfPAHJsk3JnEk9PqQeSNlkG8RFISYFMPiaZu
	2KqpiH1vzTZNiyDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9w4C1ZbkD4dvO5vqJzlHVgqsFiJB6NDE/MANwcuGmF8=;
	b=zHjZOZgBhNZmwlql6J5ky/m4ufI+cK/xU/U34jWzn1AN+v6CrMuuBJEBuIFFUH18Ec5A6b
	2pdyR4fO35oWXxyTncBuGEphIQwhROgMRhxdp8AAZaI3wQScsDOS2h9b45GyaaYKCRFDkJ
	YvTjK6K+N0fTVzYHTlTgx6gbj9Saov4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9w4C1ZbkD4dvO5vqJzlHVgqsFiJB6NDE/MANwcuGmF8=;
	b=HMn6j1bEWrlTSdQu7w+bHcZdwI0xGTSbk60xgN7mlK2m+5vuFdFVcL8zU1w79xki+V6DtJ
	puq5ZtbRt1dDCoCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 857841339F;
	Wed, 25 Nov 2026 13:56:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +pziGCTpBmu9QwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:56:52 +0000
Date: Wed, 25 Nov 2026 14:56:52 +0100
Message-ID: <87se0p6ml7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for custom control names
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-1-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
	<20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-1-1197ac8eacd2@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email]
X-Spam-Score: -12.30

On Tue, 24 Nov 2026 11:57:22 +0100,
Abel Vesa wrote:
> 
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Add snd_pcm_add_named_chmap_ctls() to allow drivers to register channel
> map controls with names other than the default "Playback Channel Map"
> and "Capture Channel Map".
> 
> This is useful for cards exposing several channel map controls, such as
> Qualcomm machine drivers with both HDMI/DP and WSA speaker backends,
> where a distinct name makes it clear to userspace which backend the
> control belongs to.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
