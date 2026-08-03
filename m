Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC7239DBE5
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742124; cv=none; b=XWzn5LCe21z0xCOQUP0EXmQjFR8ZYI1VhnZe33meNfEtZyOy9+5a6RBX8zaJgjOkt1d+SHxgoC2KnCyrlTrXJys+ngfqHopKvkHvtElAjOkqLu2VMcdAFxZDCUFe+ynqQyXHlY+9YooNfXJCNVYulZPLO9z67uvtt5w0uJJV7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742124; c=relaxed/simple;
	bh=Avz4tewrEczHHV64vLLoNWzwzZzeFo9mRyRSLgF/JFg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pl2jsb66mBn3k8yh9vgU2sfOSwjqp9hBLhhQupDqivGUz8zB/+DiAU/KBYhYz8LoERjOHTsuKZGKB+WnV7NG2AahPU4rYmlkXGxakZbG9Wb7vYWT2m+1K2fVLNpyVYAohPTZ3nfwEGo+b7arlg/CJfaPesWPndvwm0X75AjfsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QNGoYESX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B8JYec0R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zz8ouTZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=umsA548n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QNGoYESX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B8JYec0R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zz8ouTZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="umsA548n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80AEE4652;
	Mon,  3 Aug 2026 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785742117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3zvVrOJsOBc77ljYAzQZWZFZw1u2N3xZdlgUGs5cJ0=;
	b=QNGoYESXxUR292e+54uB4QxPPa+NnuDH7tiMKBBH5UQo96ruI0O87t0aU1MMKUkUhisxuR
	LvGaTqqmI3KGP+JE0pn8QcHR8MCoN0SWmRXwIUTGEa916Iz+dDwrnbkLiOxDZmCCapcETt
	Z6HPrjIXXD1dww5y6lM/qqBiXqKK7JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785742117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3zvVrOJsOBc77ljYAzQZWZFZw1u2N3xZdlgUGs5cJ0=;
	b=B8JYec0RSMMO+5QRBelpqwxmE8hkOKzjbjE8rDivExwAEOSplvYv9OPUQu+7vkEIPVXlmU
	N/4JnXE+oB/TYcDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zz8ouTZM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=umsA548n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785742113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3zvVrOJsOBc77ljYAzQZWZFZw1u2N3xZdlgUGs5cJ0=;
	b=zz8ouTZMzur3gV2ELXdmKrO7p40qHwaGJ1TmP4Y+e3DKlP9q99KYEzDjCCQ+eQ6thpUTJf
	JaIEqF8EepV2LmdkP2nSr9IZRN2FQ06s6WNNj+NIAg45/G/i5qsHh5LN2WayQ6L/B89Txe
	ZtXQULmjJWgHQhy3Mu+bhYF5gX8Dp3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785742113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3zvVrOJsOBc77ljYAzQZWZFZw1u2N3xZdlgUGs5cJ0=;
	b=umsA548nix7THHDkfO2NFjyqhXyY4q+4S/0wN/KGEet3SEWReTjPLtF4Omlp9uL1MW77hb
	qKYly7izGnhtqzDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 389D6779A1;
	Mon,  3 Aug 2026 07:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w7CsDCFDcGoYJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:28:33 +0000
Date: Mon, 03 Aug 2026 09:28:32 +0200
Message-ID: <87v79racin.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Sean Rhodes <sean@starlabs.systems>,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Limit Star Labs internal mic boost
In-Reply-To: <9291ae0c-a36d-4443-9304-8f1a5eca5118@cachyos.org>
References: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
	<74989ff6-1f15-428a-8620-a5101d3f19f1@cachyos.org>
	<9291ae0c-a36d-4443-9304-8f1a5eca5118@cachyos.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,starlabs.systems:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[starlabs.systems,vger.kernel.org,perex.cz,suse.com,kylinos.cn,realtek.com,gmail.com,canonical.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,starlabs.systems:email,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 80AEE4652
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Mon, 03 Aug 2026 09:24:00 +0200,
Eric Naim wrote:
> 
> On 8/3/26 2:12 PM, Eric Naim wrote:
> > Hi Sean,
> > 
> > On 8/1/26 4:13 AM, Sean Rhodes wrote:
> >> The 30 dB internal mic boost is too high for laptops, especially with fans. Limit Star Labs internal mic boost to 10 dB.
> >>
> >> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> >> ---
> >>  sound/hda/codecs/realtek/alc269.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> >> index 379e1458f4ac..42756a3f3f8e 100644
> >> --- a/sound/hda/codecs/realtek/alc269.c
> >> +++ b/sound/hda/codecs/realtek/alc269.c
> >> @@ -4188,6 +4188,7 @@ enum {
> >>  	ALC245_FIXUP_CLEVO_NOISY_MIC,
> >>  	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
> >>  	ALC233_FIXUP_MEDION_MTL_SPK,
> >> +	ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
> >>  	ALC233_FIXUP_STARLABS_STARFIGHTER,
> >>  	ALC294_FIXUP_BASS_SPEAKER_15,
> >>  	ALC283_FIXUP_DELL_HP_RESUME,
> >> @@ -6725,6 +6726,10 @@ static const struct hda_fixup alc269_fixups[] = {
> >>  			{ }
> >>  		},
> >>  	},
> >> +	[ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST] = {
> >> +		.type = HDA_FIXUP_FUNC,
> >> +		.v.func = alc269_fixup_limit_int_mic_boost,
> >> +	},
> > 
> > I guess the reason you're creating a new quirk is because the existing
> > ALC269_FIXUP_LIMIT_INT_MIC_BOOST is chained to ALC269_FIXUP_THINKPAD_ACPI.
> > This makes the quirk identical to ALC269_FIXUP_THINKPAD_ACPI. Would it be
> 
>                     s/ALC269_FIXUP_THINKPAD_ACPI/ALC233_FIXUP_INTEL_NUC8_BOOST
> 
> > worth reworking the existing ALC_269_FIXUP_LIMIT_INT_MIC_BOOST to not be
> > chained and then create a new ALC269_FIXUP_THINKPAD_LIMIT (or similar) for
> > whichever devices that need it?

A good point. If you come up with a new change, try to make a patch on
top of the latest sound git tree for-next branch.


thanks,

Takashi
