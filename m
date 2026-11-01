Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546803;
	b=xq5tn32RRRjvz62HofxOudno+fYBqOS8eeUe4jFvzVuX4Bj35X97CkUChVIO2bSYmmnp
	 pd+ew59UxOnxHx8rcVKEGb1ZH396E95CMDcMTAkw3+QmE9/E+/It56zjzPowzDeoKngGB
	 seh+fHT4CIyuT/LHEJRqQ/rlMGF2Z4Q+vU4t/Gw1/Ddok9hoVdmDJdufNibGEGuYFaQC7
	 uSGOd0suVC+aXWz5wiHvznpW2fZX3WPbMVUjYazI+SH24t4JsFxlce1IkE2s8qatQJgu5
	 qZx+rXPIe5JMSAXATQo13q024qZDgphTMu4abTywqscnRIzyJAreBebU46OCMcrhM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546803;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=52jKgimrTd84xrYvjSddWThDrxhhsE9FTwPIYU9rfvE=;
	b=bY1zxwJmXpuR83nAO6tHoAL0xaHZZGm0GeFLtPqD6tbMCYY5iva/vCkUlqz/+6LDAg9V
	 DDWfrXvKlvQS97y/pQV/IyAguYSPi/7mmWa+D/Qz9tA0CnN/uVGRsfiw1Kq+70VdymOl4
	 KDRVpxIGUgqhhpvvTA5agtDwm4C7YX8WUC12MLVsHFyeaW706o7BQqs+eh6bmANr4nU/A
	 ou2zhzRCG/QyCHbUbzLOSetB94ZReOgSNzM6GQIzzSXlSRHkG+fYYoTkOJ9t7p1Ne5XPG
	 dTxBng5hukiZNQydt0HaDLFV5mV211SL0HPlUWY374eo5+v98Xpr2EmOFcWQRuY3uKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yY5UnKxX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="jslx2/5K";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="i/aA+Yda";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KjiDr2qL;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C0606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 15:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3C0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yY5UnKxX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jslx2/5K;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i/aA+Yda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KjiDr2qL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED8161F7B0;
	Sun,  1 Nov 2026 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793546799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jKgimrTd84xrYvjSddWThDrxhhsE9FTwPIYU9rfvE=;
	b=yY5UnKxX91NPGrYZXcJIJIXlE2YVJhDf9mEKWjtGe2tt1v9bUDUB15xagFVP29ljvkO5Gf
	wDiE27tw0W0wvYebqJdSeziEpDASNjf/pnlpKYv3FMBU7GJSOeRdxytporEPdOz4WL32f4
	B9wU0DAalfHbgcY918QTI7L2cAQi3WE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793546799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jKgimrTd84xrYvjSddWThDrxhhsE9FTwPIYU9rfvE=;
	b=jslx2/5Kq51FsKVXid6+Sb7v3YqH1RgnaBqTzxZAo3gRwU73+tpz7/TTMXEiuNPu1aYc77
	52cKpcdy8849itCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="i/aA+Yda";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KjiDr2qL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793546798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jKgimrTd84xrYvjSddWThDrxhhsE9FTwPIYU9rfvE=;
	b=i/aA+YdawaYD9yCnazbbQaseQ5M/WIoi0t/adzbs3RkFMqCPZmpDq1I/NVEKj5Tq5NHrF9
	qoiMEj6T0pBu0q42AsSZ7Ins9I9yexnEFGJWeME4H3WZYdLmGMXYYbfyd5vuUFTpjEd2yl
	neVnXdd3Rqq8zyQTKlihPdN84n1Ee2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793546798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jKgimrTd84xrYvjSddWThDrxhhsE9FTwPIYU9rfvE=;
	b=KjiDr2qLJbR7mqEGBmkGlEJbH/nS69sA72F9Jxm6KhHB+M5WtRmBYnTFCUmjYSB5KJ9JiA
	DCVQy9cjduXMB6BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 589C7134B3;
	Sun,  1 Nov 2026 15:26:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H366Ci1a52qrKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 01 Nov 2026 15:26:37 +0000
Date: Sun, 01 Nov 2026 16:26:36 +0100
Message-ID: <87mrrspo7n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: zzzccc427@gmail.com,
	tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"R.T.Dickinson"
 <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>,
	Damien Stewart <hypexed@yahoo.com.au>,
	Christian Zigotzky <info@xenosoft.de>
Subject: Re: Void PPC: PulseAudio issue with sound updates 7.4-rc1
In-Reply-To: <3452eb30-44be-cdd1-72e9-c15e145a6444@xenosoft.de>
References: <41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de>
	<3452eb30-44be-cdd1-72e9-c15e145a6444@xenosoft.de>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xtra.co.nz,yahoo.com.au];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,perex.cz,vger.kernel.org,lists.ozlabs.org,xtra.co.nz,yahoo.com.au,xenosoft.de];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,ibb.co:url]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.51
X-Spam-Level: 
X-Rspamd-Queue-Id: ED8161F7B0

On Sun, 01 Nov 2026 15:53:07 +0100,
Christian Zigotzky wrote:
> 
> On 01/11/26 10:15, Christian Zigotzky wrote:
> > Hi,
> > 
> > Although PulseAudio recognises the sound cards, it is unable to
> > successfully initialise the corresponding output profiles on Void
> > PPC since the sound updates 7.4-rc1 [1]. The output via ALSA works.
> > 
> > Tested with the onboard HDA ATI SB sound device, Soundblaster LIVE
> > Player 1024 PCI card, AMD HDMI audio and with USB audio. Strangely
> > enough Pulseaudio can enable the sound devices on MintPPC32. I think
> > the latest sound updates are responsible for the issue on Void PPC.
> > 
> > I bisected last week [2] and
> > ad28d2f607d1792c04531f2c5fd9ac0bf5bdcc9c (ALSA: pcm: Serialize and
> > check HW_REFINE ioctls) is the first bad commit.
> > 
> > I was able to revert the first bad commit and this solved the issue. [2]
> > 
> > Then I created a patch for reverting the bad commit. [3]
> > 
> > Could you please check the sound updates 7.4-rc1? [1]
> > 
> > Thanks,
> > Christian
> > 
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75c1cb8178fe84403fd95236ddf21754f0a4156c
> > [2] https://github.com/chzigotzky/kernels/issues/21
> > [3]
> > https://github.com/chzigotzky/kernels/commit/644ec7c1f2f812d5eb89741e643f742596a49b2d
> > [4] Screenshots:
> >      - With the sound updates:
> > https://i.ibb.co/675Yjxvd/Kernel-7-4-0-with-sound-updates.png
> >      - With the patched kernel:
> > https://i.ibb.co/9HDrnnm1/Kernel-7-4-0-alpha8-Power-PC-1.png and
> > https://i.ibb.co/vx77FdHV/Kernel-7-4-0-alpha8-Power-PC-2.png
> > 
> 
> The sound-fixes-7.4-rc1 [1] don't solve the issue with PulseAudio on
> Void PPC. We still need the sound patch [2] for reverting the bad
> commit.

Hm, could you verify whether the below oneliner recovers from your
problem or not?

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -965,7 +965,8 @@ static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
 	if (IS_ERR(params))
 		return PTR_ERR(params);
 
-	err = snd_pcm_hw_refine_with_lock(substream, params);
+	//err = snd_pcm_hw_refine_with_lock(substream, params);
+	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
 		return err;
 
-- 8< --

If this works, clear this change again, and figure out which check in
snd_pcm_hw_refine_with_lock() gives the error.  The function has three
preliminary checks: PCM_RUNTIME_CHECK(), snd_pcm_buffer_access_lock()
(& unlock()), and hw_parms_state_check.  The first one must be
harmless, and the real problem must be either
snd_pcm_buffer_access_lock() or hw_params_state_check().

```
static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
				       struct snd_pcm_hw_params *params)
{
	struct snd_pcm_runtime *runtime;
	int err;

	if (PCM_RUNTIME_CHECK(substream))
		return -ENXIO;
	runtime = substream->runtime;
	err = snd_pcm_buffer_access_lock(runtime);
	if (err < 0)
		return err;
	err = hw_params_state_check(substream);
	if (err)
		goto unlock;

	err = snd_pcm_hw_refine(substream, params);

 unlock:
	snd_pcm_buffer_access_unlock(runtime);
	return err;
}
```

OTOH, if the oneliner above doesn't change the behavior, something
else overlooked obviously.

Oh wait, it might be the 32bit compat path?  If so, the call at
snd_pcm_ioctl_hw_params_compat() needs to be tested, instead.


thanks,

Takashi



