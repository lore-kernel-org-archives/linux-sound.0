Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6D24EA81
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684278; cv=none; b=ZesCYBlK5oDpj98mk+EDUcZ4ZAi2SfODC8xpWWIP9SyXvKDt1agd6Z+44BdwpJ8iNiKwIvIxgzFoxDVlJoGIatVStkkQsPzXo7JVk4bEnPfdjjg9u3N+VueY9DnkLTzv3eo14X6LRXXNEQLYzJA/SVlLGMKX2vJ6gc0pLFCQW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684278; c=relaxed/simple;
	bh=aLcYmbqZnzT5ZMk5Tmis/pfk5H7ewcrVc8NhXQUyIAY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A32xpfCHShqg2DK4qIUws8M1ntqzDe20kCpcvec/62goMczzSsu7uV70kzwp8gnsMDArybHiLR7FvSRLt1OWQUFPMDy3HN5l9l7wcQqgCzZ/GqC59clYs7oPD1UEFl/16iHIz3Iimz4Ayh3e+vcme+aJH6eBWi8UlmMMnQONhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kuo463vg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0MQHSI8D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kuo463vg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0MQHSI8D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kuo463vg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0MQHSI8D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kuo463vg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0MQHSI8D"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 913F11F385;
	Mon, 23 Jun 2025 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMHg22YyAB+yZjfiOOsJD1NoH1OyAfHDkyqstzpNmCk=;
	b=Kuo463vgyyJ4uGcI6EruolZ5/BwNk4HSmAML/aM6L3z79d6Topwbwp9ceROMoanCZT+vwY
	+1TN2ETVXvR5GIzHZarj21irpRxR93Ar53O7n4uyn04qSYGyLbB/hZv3PFn5Mha2IqARPz
	rz+Mgvc//tW3sEPgT31rwTbOXDyR2UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMHg22YyAB+yZjfiOOsJD1NoH1OyAfHDkyqstzpNmCk=;
	b=0MQHSI8DJj5hSD3ZCd70RmXJCeLJMKvuHRxCfxUT71iAGu8RjlZNWCelTm1eYYcGJuDlfJ
	dcjXZBzUNLMG91AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Kuo463vg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0MQHSI8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMHg22YyAB+yZjfiOOsJD1NoH1OyAfHDkyqstzpNmCk=;
	b=Kuo463vgyyJ4uGcI6EruolZ5/BwNk4HSmAML/aM6L3z79d6Topwbwp9ceROMoanCZT+vwY
	+1TN2ETVXvR5GIzHZarj21irpRxR93Ar53O7n4uyn04qSYGyLbB/hZv3PFn5Mha2IqARPz
	rz+Mgvc//tW3sEPgT31rwTbOXDyR2UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMHg22YyAB+yZjfiOOsJD1NoH1OyAfHDkyqstzpNmCk=;
	b=0MQHSI8DJj5hSD3ZCd70RmXJCeLJMKvuHRxCfxUT71iAGu8RjlZNWCelTm1eYYcGJuDlfJ
	dcjXZBzUNLMG91AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5060513A27;
	Mon, 23 Jun 2025 13:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l54lEnFSWWg7TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 13:11:13 +0000
Date: Mon, 23 Jun 2025 15:11:12 +0200
Message-ID: <87jz52mwlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>,
	"kailang@realtek.com"
	<kailang@realtek.com>,
	"geans_chen@realsil.com.cn"
	<geans_chen@realsil.com.cn>,
	cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack detection
In-Reply-To: <SEYPR06MB627832E929730EFEA1FD7AED8279A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-3-joakim.zhang@cixtech.com>
	<87cyaywr31.wl-tiwai@suse.de>
	<SEYPR06MB62781BB8AF7B964F54B4C2C5827FA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<SEYPR06MB627832E929730EFEA1FD7AED8279A@SEYPR06MB6278.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 913F11F385
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email,suse.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 23 Jun 2025 12:39:48 +0200,
Joakim  Zhang wrote:
> 
> Hello Takashi,
> 
> > -----Original Message-----
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > Sent: Saturday, June 21, 2025 2:15 PM
> > To: Takashi Iwai <tiwai@suse.de>
> > Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > chris.chiu@canonical.com; kailang@realtek.com; geans_chen@realsil.com.cn;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> > Subject: 回复: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for
> > jack detection
> >
> >
> > Hello Takashi,
> > ________________________________________
> > 发件人: Takashi Iwai <tiwai@suse.de>
> > 已发送: 2025 年 6 月 20 日 星期五 20:11
> > 收件人: Joakim  Zhang <joakim.zhang@cixtech.com>
> > 抄送: perex@perex.cz <perex@perex.cz>; tiwai@suse.com <tiwai@suse.com>;
> > linux-sound@vger.kernel.org <linux-sound@vger.kernel.org>;
> > chris.chiu@canonical.com <chris.chiu@canonical.com>; kailang@realtek.com
> > <kailang@realtek.com>; geans_chen@realsil.com.cn
> > <geans_chen@realsil.com.cn>; cix-kernel-upstream <cix-kernel-
> > upstream@cixtech.com>
> > 主题: Re: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack
> > detection
> 
> [......]
> 
> > [Joakim] Let me take realtek alc256 as an example,
> > hda_call_codec_resume()
> >     1)codec->patch_ops.resume(codec) // alc269_resume()
> >         codec->patch_ops.init(codec) // alc_init()
> >             spec->init_hook(codec) // alc256_init()
> >             snd_hda_jack_detect(codec, hp_pin)
> >                     ....
> >                     snd_hda_jack_pin_sense()
> >                         jack_detect_update()
> >                             jack->pin_sense = read_pin_sense(codec, jack->nid, jack-
> > >dev_id);  // update jack->pin_sense here, but not report jack status
> >     2)hda_jackpoll_work(&codec->jackpoll_work.work)
> >             snd_hda_jack_poll_all(codec)
> >                  old_sense = get_jack_plug_state(jack->pin_sense);
> >                  jack_detect_update(codec, jack);
> >                  if (changes)
> >                       snd_hda_jack_report_sync(codec);
> >
> > If the headset is not plugin before system suspending, so the jack->pin_sense
> > = 0x0, plugin the headset when system in suspended state, system resume
> > back, the jack->pin_sense update to 0x80000000 from codec
> > patch_ops.init(), then jackpoll work get the old_sense = 0x80000000 (but
> > actually it is not old sense before system suspending), and the current jack-
> > >pin_sense also 0x80000000 when calling jack_detect_update(), as a result
> > there is no changes, finally not report the headset plugin event.
> >
> > Is it logical to report jack status immediately when updating the jack pin
> > sense? If not, the old pin sense can still be trusted?
> >
> > Please correct me if anything misunderstanding, thanks, as a hda newer may
> > not understood very deeply.
> 
> I confirm this issue exist in the original logic, but your PoC also fix this issue, I quite agree with your above point of view:
> "I believe we should simply call  snd_hda_jack_report_sync() unconditionally, then schedule the jackpoll work,  as done in my PoC patch."
> 
> With your PoC patch, three issues(patch 1/2/3) have been solved simultaneously, please feel free to add my tested tag:
>       Tested-by: Joakim Zhang <joakim.zhang@cixtech.com>

Good to hear!  I'm going to submit the proper patch set.


thanks,

Takashi
