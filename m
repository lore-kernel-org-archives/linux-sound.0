Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87FD22A7F0
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573394; cv=none; b=ICD2qrWF53bUkHN6sRzh1cTlpwI0FgH2cN4vRNYP6QdCnbEzdAVsUfovf2W0uttd23jyP71dR/lWh6GCQMaSn2RBNZ6vtxLCeUoOWwrmm3TbPB9RKADO8un2Bz/2tmQSGY9h36KSB2ENoqAM9LAUcCQSVCcYan7Eue4/PD2M6Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573394; c=relaxed/simple;
	bh=a6AvEIpZolLiMx00esYYZTu77BSZ2r2hPt+E5G4SsNU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFztkCSPr4Bp9X82XYoLIevYF5CKErKOYSMi3ZwfcKFQee4Bs+Naacf6470XuXa3S3osPDtyUkhfniEcMti6WEKpYJInJZtXBJTDlT9iDJicbXx9kE6gQsfzOyTQGTU/D7SugKN11ndFSc7vGrGqwhbi8Il6LS8adJDJqTkDkdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SgSo17iZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mipiSnI+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SgSo17iZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mipiSnI+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SgSo17iZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mipiSnI+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SgSo17iZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mipiSnI+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6E763E29;
	Mon, 20 Jul 2026 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GiVQvdq6FYCoPa98ppFkBgI0k06xyXq03ILyXvPGXv4=;
	b=SgSo17iZkUuisxuqsnPUwIVWP44Wt7w547zsGIk/gly5UbzbZXpgprMUpITLS8YSUY/kVs
	DhMn+6pqTzCNh7VSwU5IrbXRiVkxiJd3T+1RV5LPQtjgtpCPGFxpj5cr9Q9llrbdVJb9/6
	kz7h7l1VdKgM4csVWWRUIf+dVGa3Em8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GiVQvdq6FYCoPa98ppFkBgI0k06xyXq03ILyXvPGXv4=;
	b=mipiSnI+zo1xFRVYLwLUlkL7N4E0/cM3xCcp0OADUMW7yK9K2fTsdEtJ/2JwjPVonOwHBz
	zxdX48Jo5tGfdhBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784573390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GiVQvdq6FYCoPa98ppFkBgI0k06xyXq03ILyXvPGXv4=;
	b=SgSo17iZkUuisxuqsnPUwIVWP44Wt7w547zsGIk/gly5UbzbZXpgprMUpITLS8YSUY/kVs
	DhMn+6pqTzCNh7VSwU5IrbXRiVkxiJd3T+1RV5LPQtjgtpCPGFxpj5cr9Q9llrbdVJb9/6
	kz7h7l1VdKgM4csVWWRUIf+dVGa3Em8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784573390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GiVQvdq6FYCoPa98ppFkBgI0k06xyXq03ILyXvPGXv4=;
	b=mipiSnI+zo1xFRVYLwLUlkL7N4E0/cM3xCcp0OADUMW7yK9K2fTsdEtJ/2JwjPVonOwHBz
	zxdX48Jo5tGfdhBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78B23779AA;
	Mon, 20 Jul 2026 18:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y/wbHM5tXmoITwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 18:49:50 +0000
Date: Mon, 20 Jul 2026 20:49:50 +0200
Message-ID: <87wluppkc1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caio Ramos <caioramos97@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Samsung 750XBE/730XBE
In-Reply-To: <20260720123702.799474-1-zhangheng@kylinos.cn>
References: <20260720123702.799474-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Mon, 20 Jul 2026 14:37:02 +0200,
Zhang Heng wrote:
> 
> Add a codec SSID quirk for Samsung ELECTRONICS 750XBE/730XBE using
> HDA_CODEC_QUIRK() instead of SND_PCI_QUIRK(), because the alsa-info
> report from this device does not expose a PCI subsystem ID, only the
> HDA codec subsystem ID (0x144d:0xc824) is available.
> 
> This applies ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET to fix sound
> being very low and distorted on the headphone jack of this system.
> 
> Reported-by: Caio Ramos <caioramos97@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=208663
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
