Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564843B4B7
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544855; cv=none; b=RsBMfW32z7C53XJpbS42Yiszq2FGS6+2f9Za+Y53o7pfBIga86I95csx7vl09v92i0Ml+a3p0Z4xaEc1SsYrKPJsLCF63br+evDZy/QqZGMFcPu728WN3O6TpCqa0b9jc+jGrR1f6iJdVM0juHjpTcnFWAR4HhuIhvSoNQpF0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544855; c=relaxed/simple;
	bh=Z2b06DO2DdqsVWBdayhh512WZSzY+OFiuXmvuQkhxzg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvPT/MxUH3SBsWLxoNi/raBHIYBY4xovPerqG7LSD2l94Ur7jWjf1OBRnWecNGlA2iNwdI4fkJNir+GZ9ZfBILfndZM9pNRQ+Ditol1VZbzdoLNo9sXNlwENJJDD3lCjZWziXZPGWOyWrn/Z7Gn/f1lUJ8HxjbLKdXX1ympj+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1FL1ifeS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vsm/Us1T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iZZhbho4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oBe07rf4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1FL1ifeS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vsm/Us1T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iZZhbho4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oBe07rf4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1479C1FCC4;
	Wed, 16 Sep 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZNLnCcrtHB+EPoJ0/W3a9PpaIumcxr/yyydybeZNCs=;
	b=1FL1ifeSrEoi6Pt+7RzVve/j5CgneUmvNrEbXrEsFudnWt9prW7oFn1Dw63AkE0ckO6/XU
	GlTZzuMTNIVi/SuFoS+g7YisaUBie98LQhKDwSmjMLnpbVVKBE0W6r7bQ4LJOl/yJuYGQ8
	NebXV8cAKsdkf467mw6495k9UbE9fGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZNLnCcrtHB+EPoJ0/W3a9PpaIumcxr/yyydybeZNCs=;
	b=Vsm/Us1TGKLsr/G+QxOSA6UC+pbFUXHUezQhI/RCoQ9wH23cRTjBWSVRkky5AbXIZHH5Vf
	+yCAfyzQG34NC5Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789544838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZNLnCcrtHB+EPoJ0/W3a9PpaIumcxr/yyydybeZNCs=;
	b=iZZhbho46hVQqhcvGlorfnDnHGs67ry8HFlVOPfkLRlZ+Nr/XchZU51lVbcWUs+qYzmvgK
	OAxOGHQz0sM6aACaRz2KhD5SvhgRg6XwLkpkUHwdk6ac4JSS7Pa5MSYlVgRva7DsT1N4sn
	2IegwBxAXKTx++ftiqpqc3pHVCk+/Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789544838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZNLnCcrtHB+EPoJ0/W3a9PpaIumcxr/yyydybeZNCs=;
	b=oBe07rf40B7Ahtyw8Do8iHi1ilX6hlCWJmy9xqj37KacsM8VVNPKxhcUUP/n3WvGIrOEuy
	sjNMElxZx+Nt1TCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9540F136A5;
	Wed, 16 Sep 2026 07:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8zc0GoVJqmrvIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 07:47:17 +0000
Date: Wed, 16 Sep 2026 09:47:17 +0200
Message-ID: <87zexhk58a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-2022-JP?B?GyRCPH43ejEnGyhC?= <997536907@qq.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
In-Reply-To: <tencent_2BCBDB797DA546DC6649A28E1FB5A48B7508@qq.com>
References: <tencent_2BCBDB797DA546DC6649A28E1FB5A48B7508@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[qq.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 16 Sep 2026 05:06:00 +0200,
周建宇 wrote:
> 
> From 09aa2aa6f566f10eb303dfd4731e1776d0a1c96e Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?=E5=91=A8=E5=BB=BA=E5=AE=87?= <997536907@qq.com>
> Date: Wed, 16 Sep 2026 10:30:17 +0800
> Subject: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The internal speaker of the IPASON SmartBook S1 (an Emdoor ODM laptop)
> stays silent under Linux, while the Bluetooth audio and the headset
> output work fine.  The same machine plays sound under Windows with the
> vendor driver, so the hardware and the amplifier are known good.
> 
> The BIOS reports the pin default of the actual internal speaker pin
> (NID 0x1b) as 0x411111f0, i.e. the default association 0xf, which means
> "unconnected".  The pin parser therefore drops that node already at the
> pin-configuration time, hence no mixer control is ever created for it
> and the pin is never driven, no matter how the output pin 0x14 is set
> up.  Enabling 0x1b makes the speaker work immediately.
> 
> The existing ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO quirk makes the
> speaker work, too, but it additionally rewrites the pins 0x14, 0x19 and
> 0x1a with Honor-specific values, which creates a bogus "Dock Mic" device
> that does not exist on this hardware.  Add a minimal fixup that only
> enables 0x1b as the internal speaker.  Touching 0x14 is not needed:
> with the pin configuration overridden at runtime, both keeping its BIOS
> value (0x90170110) and disabling it (0x411111f0) leave the speaker
> working, so 0x1b alone decides the output.
> 
>   Codec:       Realtek ALC256 (0x10ec0256), SSID 0x2782:0x0206
>   BIOS pincfg: 0x14 0x90170110  0x18 0x411111f0  0x19 0x02a19040
>                0x1a 0x411111f0  0x1b 0x411111f0  0x1d 0x4067b945
>                0x1e 0x411111f0  0x21 0x02214020
> 
> Tested on 7.2.0-1-MANJARO and 6.18.45-1-MANJARO, with both the SOF and
> the legacy HDA driver paths.
> 
> Signed-off-by: 周建宇 <997536907@qq.com>

The code change looks mostly OK, but could you try to use western
alphabets for your sign-off and from tags?  That makes easier to
handle for many other people.

Also, you don't have to add always the model name string; nowadays a
quick can be applied via the ID alias (xxx:yyy form).
So drop the addition to alc269_fixup_models[] unless you believe this
must be added inevitably.


thanks,

Takashi
