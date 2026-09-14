Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E12FE057
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366562; cv=none; b=Ogy41KAQepkJXbNKwz5tuNYqm/FqwZvYTVAl5mrrVDtf6X+3IF6K8D9FaneLN+E4RtP/gpJ2kRgYQH4PVyW1lb3MkYBg+Cj2Se7IIFnALmHFdLAsXurMnW0lJZwoTU+1llYI8A5LSytvqE1HB+cX3VUgmSTC4vTxFA5VNnn9Wxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366562; c=relaxed/simple;
	bh=/WtKMj5Mofkxo0h6JiVlBChgSZ0nXAfzNBy1Fmegt9s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I1Yaoqw4OZ/2ozH9RfVWdDm23ItGmmn4FIrwLjJLEc7UH+DeY8BUPVC9EefssDBwTQ961yUf+2frzgCI+9uRso/sxTJYmS5y01nwzde59PkR4+YpATvnm6dX4wiKF16CqV88dZgSJv2DoV5aMHE35KYg2Metgkjwfp4kh6rLoU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=goT13yjF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5l8jtdiY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hN/1FvJm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F3hvk7f2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="goT13yjF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5l8jtdiY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hN/1FvJm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F3hvk7f2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E22A219C6;
	Mon, 14 Sep 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eitiR7wM7t/ZwII3Y2o0DssiIzD0TJAncKRp7E8E=;
	b=goT13yjF/9wmrhRzNAoMoyHIz1dzZ+5NAbu90YRUdpyIIdPP3jq512v5u6BcL+8+zU0l6s
	MOMagjxjysgcXso8S6mWCu46qPEC9QuhTfSEqgf64fk7JtC33ugnGmMUXYcAcNF4rFlz3g
	hBy6b0i05VooWUwQDwC8dZAI01Ujztc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eitiR7wM7t/ZwII3Y2o0DssiIzD0TJAncKRp7E8E=;
	b=5l8jtdiYAyUR67nl0iEW/dsoaboLHSGe6Kz3qWZ3wqlZcdWnIvhraMVyZDrxFMf+blkN3k
	57Rm/Mib2LweboAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eitiR7wM7t/ZwII3Y2o0DssiIzD0TJAncKRp7E8E=;
	b=hN/1FvJmzsnLXJ0d6jOLpNQiZVvZM91Y0t5Xge/3eHOgJuICIrJYjzHLlFHfc9zVYEdBG9
	Rp1MeHELrvfmECd6FqW8YFycd4UbLWjDGHopmz/Ke7oA2CiOgYx3kHEfUyAOujFN7jDeEw
	340JPqqvF81Vs+zq5eXicvmx/ZTX1u0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=En0eitiR7wM7t/ZwII3Y2o0DssiIzD0TJAncKRp7E8E=;
	b=F3hvk7f2L1he1b2XJATfpZ1pWkRs9l0V13D/T0NYfUWjfGV0CgSwowvMDSp6NeWHrsVNJJ
	OOqXxJNPuYm2wmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E074A13515;
	Mon, 14 Sep 2026 06:15:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SGGNRaRp2r7fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 06:15:50 +0000
Date: Mon, 14 Sep 2026 08:15:50 +0200
Message-ID: <87tsnsqrxl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xavier Goffin <xaviergoffin42@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15-ax
In-Reply-To: <20260913211155.20305-1-xaviergoffin42@gmail.com>
References: <20260913211155.20305-1-xaviergoffin42@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Sun, 13 Sep 2026 23:11:55 +0200,
Xavier Goffin wrote:
> 
> On the HP OMEN 15 ax-202nf, the keyboard mute LED is exposed through
> NID 0x1b rather than 0x18. This reuses the existing quirk
> (ALC269_FIXUP_HP_MUTE_LED_MIC3) to allow the keyboard LED to reflect
> the built-in speaker mute state.
> 
> Tested on HP OMEN 15 ax-202nf with Realtek ALC295:
> - hda::mute/brightness properly follows mute state
> - mute/unmute via keyboard shortcut or via GUI volume control
> - state is kept on suspend & resume, and reboot
> - plugging a 3.5mm jack headset reflects the headset mute status
> - unplugging reverts the LED to the speaker mute status
> - USB/Bluetooth headsets are not covered
> 
> Signed-off-by: Xavier Goffin <xaviergoffin42@gmail.com>

Applied now.  Thanks.


Takashi
