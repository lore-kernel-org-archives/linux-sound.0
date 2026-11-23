Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427375;
	b=ywDRRyvbktSRpU4lFKMRrM48kPPjsA9/I8Cj5ZMO5FejsHLfi0CyJ3wkt7HBgZQi0odI
	 ZEcrgEGUkjc958otZqW2HW3u709VCtdTBTTDO1W4FFZi5vx+BZ1jdpnAircw7P7SoqF/j
	 2QvQ/YVEzrAHB/KRnhg+Zn9yO3IARSU+InfZ80qPTCvVylqxZvojO/ZA+J5WzAAH5bC7s
	 fitSxUkXDXhgNN32cIk4y7NEgCiMMe1X4S4LEPLDtV5q4OwtTPNOjkUqCIrHVxTn0o5BE
	 VbNCe3E6kC5sSFnAX1qsIUaKZYPmcKlJ2hGb6ttQtqdSANmbTGsv32LwE6ou8dEXo3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427375;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=0yytMLtmenp2+JbD5eTpCPvw8PKzP++54gpCuRZJfcU=;
	b=x4ACUEwpw2Y9S/j3iY04ubdSYZZIWLjwNj71sersYHtF3pdkylulln3XVbLmnTVqDcuw
	 Q1y1pFILkHJRFBB7X6gOmjI0PR5jFH/PWaTtNk0z4Un2eRdisN4GBrHo7kQMDX31vMWOo
	 LiSPk4riT0Cl0wWrzHfrA1+LOwqbnpUa7jSOjgMzvz/5iU7MeGjHD0Pv0K9ry5J9GJUPi
	 07X2CH8UYBp+y0EGCafEyXWls15N4cZL56GinX0vx0mEcWud5tYSHi1sXTtgKspiWe9Az
	 WPxKNMFncPMe6d3RgvBb4Q1qfxRO2r86Eg2/Ces/SJ8OnQZinXJXAI8ZyEW5lTY7vOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rgAqzsXO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iuMoDgtG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JYQpu2h5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kwrprheE;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DCB606A31A;
	Mon, 23 Nov 2026 09:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DCB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rgAqzsXO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iuMoDgtG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JYQpu2h5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kwrprheE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2A8E1F770;
	Mon, 23 Nov 2026 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795427372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yytMLtmenp2+JbD5eTpCPvw8PKzP++54gpCuRZJfcU=;
	b=rgAqzsXOAXrrRxdT7yCYJA0ctgGtmy+MYIwRJF8yeqwspUwDTBYaoLF6yLMkL5JCncPkIQ
	sdXvTZ8muwWIgM0DpudCRgpYEbC+8qeYlQv0g6Y6D14QDlz8zXwlQzCYUC2A51zWSqEfMc
	K6NS6ShAzfx20cMXqKj4Ii8jpcf0jJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795427372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yytMLtmenp2+JbD5eTpCPvw8PKzP++54gpCuRZJfcU=;
	b=iuMoDgtGDMOHIHvE1vC6Sg9R/tMCzbSUgDb8RqEFpU96kJS72zHqY7BIPCdvqd3JfEne9v
	2YQ9HjLgZlGRUhAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795427371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yytMLtmenp2+JbD5eTpCPvw8PKzP++54gpCuRZJfcU=;
	b=JYQpu2h5aCOLfcw1lRqxuOF3IhEkfkNqgZ6WXRHuQdlGaQQDwU/PtiMvWcnXUgCLvbZm9t
	m0C7Fj7fsB5AYdV9w5wA4/3XtOR3AuJZeKnWCxBlYa4xeQbYXGLje09YTlexnxTDfDIWow
	4KLq2qrmE7xA1JosW5Aw7nlebvtvE/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795427371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yytMLtmenp2+JbD5eTpCPvw8PKzP++54gpCuRZJfcU=;
	b=kwrprheEqj1UX2eE/PlAk8gf2sJxqrl3c7mk01TaMvmrhmIh8705qU9bvDYfH99fhvKBxa
	zeHYk8V0ZPOqr/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A5DA1352B;
	Mon, 23 Nov 2026 09:49:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9O5qDCsMBGt+OAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:49:31 +0000
Date: Mon, 23 Nov 2026 10:49:30 +0100
Message-ID: <87h5h7dgid.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: shyckless@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Require CAP_SYS_ADMIN for SNDRV_EMU10K1_IOCTL_PCM_POKE
In-Reply-To: <20261123-emu10k1-pcm-poke-v1-1-097b8cb8daaf@gmail.com>
References: <20261123-emu10k1-pcm-poke-v1-1-097b8cb8daaf@gmail.com>
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 23 Nov 2026 01:36:20 +0100,
Suyuan Wang via B4 Relay wrote:
> 
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> snd_emu10k1_fx8010_ioctl() requires CAP_SYS_ADMIN for the commands that
> change the FX8010 DSP state: CODE_POKE, TRAM_SETUP, STOP, CONTINUE,
> ZERO_TRAM_COUNTER and SINGLE_STEP. PCM_POKE has no such check, although
> it changes the card's FX8010 PCM configuration. snd_emu10k1_ipcm_poke()
> stores the GPR and TRAM indices given by the caller without checking
> them, and the FX8010 PCM code in emupcm.c later uses them as register
> offsets:
> 
> 	snd_emu10k1_ptr_write(emu,
> 		TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], ...);
> 	snd_emu10k1_ptr_write(emu, emu->gpr_base + pcm->gpr_trigger, 0, 1);
> 
> So a process that can open the hwdep device can change this card-wide
> configuration, including which registers the PCM code writes, while the
> other DSP configuration commands are limited to CAP_SYS_ADMIN.
> 
> Require CAP_SYS_ADMIN for PCM_POKE too, like the other FX8010
> configuration commands.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Applied to for-next branch.  Thanks.


Takashi
