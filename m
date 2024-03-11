Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2EC3AC01
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174975; cv=none; b=qtT9gWdSVmSdhmGzmBMsiGFU7HPcIzvVhemOmuF5I97pz3smka7KYZVYDJFkd6Pdj09jnHWJ8PyzjGwn6jWzG6GtXwh9CRRtMdZWFicbVcAKLjN4GOr9BiI+6Z8ZgpqOoUW+6N+hwBnLIOa3+6EVDCtto893zfOQAPOGqFHSmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174975; c=relaxed/simple;
	bh=MoiGuEXoeNnFbs8XG2MBZ9cFccakDyrL6Y+DL3qjUB4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mcno/kv58eRZt6Bg8k7yezQy6NK3s1N88i4wdTJ+BLXuOdBWikJ1hzC/NYt+mtJDB9y5EZseLRHP6qpAQPFwsAsruK/M2KE2YezRwaBet7nKmQjUxdLxAIY+TpapTxcGT0R2bgCNt36JhkMVNS2gCHm/iZWRbQdDjKI4KJZSi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AEHDUkEJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YJMOpddp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BZN0d2ap; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fe8wanlo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AEHDUkEJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YJMOpddp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BZN0d2ap";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fe8wanlo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 551E7219A5;
	Mon, 11 Mar 2024 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710174970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iy7jJRCm6zQjCN3pktNOhJEIfBJgjfgkLfOVDBIeOyQ=;
	b=AEHDUkEJCmY5mqUDSalI3h0UFjunmrtNKmzEksCq2StvERIdzxPCc+EKf92O6DYCPyN23g
	duG/jbXsdfcA+IWmegBLO2AUYENBacb9GJ3VLJts09CGwc5+XfM4w0fK/klhj9AjlSuu6w
	gRsZmxMSvH34PJodhINnyZlEgEYmitQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710174970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iy7jJRCm6zQjCN3pktNOhJEIfBJgjfgkLfOVDBIeOyQ=;
	b=YJMOpddpGrcDcc+vE9tgQjLpodlvAXDyZBpYZ60uTcNFpfsRa4UkoAQaf1nOMCz2T/09ny
	1FDWAi/H6UblrnBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710174969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iy7jJRCm6zQjCN3pktNOhJEIfBJgjfgkLfOVDBIeOyQ=;
	b=BZN0d2ap/xdNZHkGGuUs2RYh8JkQ3ZxZWz1uxWs2L5NwQNsCeqmICoYodID0vym/E2rDCm
	3SmrXwl7JihSoDov4XZesymIf4mP8/IugLneblxb1D6SjWpLMZyGi5PQ81w0MCFdM070ZJ
	pJWmyy+G6SyRjQXXqzLVw5geK225wSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710174969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iy7jJRCm6zQjCN3pktNOhJEIfBJgjfgkLfOVDBIeOyQ=;
	b=Fe8wanlowDUvD3/YHzWjc+1IbQzRCIj/189u/FlSQB2W3nuZa9KUx/2Hb/1DNwEK+po20r
	XpNhyQavPDTo5aDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18E30136BA;
	Mon, 11 Mar 2024 16:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Oy18BPky72VGGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 16:36:09 +0000
Date: Mon, 11 Mar 2024 17:36:08 +0100
Message-ID: <87il1sraiv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?f=E6talize?= <faetalize@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH v2] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
In-Reply-To: <Cr7YybgkHCTDgDNzWyiSSkh_2jepJZ755gwCbKBKVOF2n_69m9TAEpb4Hikk-iEtQPxED0Zs0pdEYcwbI0a7qQdxPhiL2Fr3xkS7ta5jojo=@proton.me>
References: <Cr7YybgkHCTDgDNzWyiSSkh_2jepJZ755gwCbKBKVOF2n_69m9TAEpb4Hikk-iEtQPxED0Zs0pdEYcwbI0a7qQdxPhiL2Fr3xkS7ta5jojo=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BZN0d2ap;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fe8wanlo
X-Spamd-Result: default: False [-2.31 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,pm.me:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -2.31
X-Rspamd-Queue-Id: 551E7219A5
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 11 Mar 2024 17:29:21 +0100,
fætalize wrote:
> 
> Some HP laptops have received revisions that altered their board IDs
> and therefore the current patches/quirks do not apply to them.
> Specifically, for my Probook 440 G8, I have a board ID of 8a74.
> It is necessary to add a line for that specific model.
> 
> Signed-off-by: Valentine Altair faetalize@pm.me
> ---
> V1 -> V2: No changes.

Now it looks much better.  However,
- Please use the same From matching with your Signed-off-by line.
- The submitted patch itself isn't applicable cleanly.  Likely due to
  your mailer setup that breaks tabs and spaces.  Fix the setup.
  At best, test by yourself before the submission.


thanks,

Takashi

> --- linux-6.8/sound/pci/hda/patch_realtek.c.orig 2024-03-11 11:59:02.989267710 +0000
> +++ linux-6.8/sound/pci/hda/patch_realtek.c 2024-03-11 11:54:16.764227013 +0000
> @@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269
> SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> + SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
