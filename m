Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE8217F5C
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434337; cv=none; b=s+FHEZeBvZ47Ny6Kj6QKvhoAdxxMxoihMJJGl+g/uzYc+GA8eHH1O5QTNhlExm+LuiS/uxH79a08YBQmnlKa7EsVS6ngFR4RH5baX5GLwxhN43Er8QcX4IRPzTnV7NBR2+zC72/YSX31ykHLzVIG0fkqeyzp7PtElTKQkWkPjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434337; c=relaxed/simple;
	bh=gSDxesM49WpeaTcX87H8gnypejOP8b0H0QSDFChWHTc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V21t/4PHpJMP1ltiZJFa7iundCbvDB596fuh8a3Au3hoB0nca0ECgWppXV4LkBrD+5oXfAqBfV3HceBj2hL1eX4WP6eckprPKwqgcVDJ9y2Gkz9QyK1VZUiVZhghhgLF5S96qHSBPXXFriglFvaaL+DX4JWdr/bAGDay+HpI2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yw5W2RUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wkom9a1o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yw5W2RUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wkom9a1o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yw5W2RUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wkom9a1o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yw5W2RUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wkom9a1o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31BA82115C;
	Thu,  9 Jan 2025 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxSNLYeIM0C5okdvWz8BbDAUxebsaN5Uy82EcU4HDTs=;
	b=Yw5W2RUBlZ6UqR7WjqT+S9RxOZWMBMR9xQlsFjBEBhXuXX9zGhJAbPtwSU47ZIKVd9A6W/
	r32HnxOU0uZ6oougvFyJWiaojF9tj8iKWniwPIlKN6h23OwkMbMZa/QMLPR3mnrBuhmlAm
	p5SUT3XOa5CuRLyHAFI4hcJ04XSHmXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxSNLYeIM0C5okdvWz8BbDAUxebsaN5Uy82EcU4HDTs=;
	b=wkom9a1ogkGarpZ0D1kHuPolH/hYPBcrt4aXrz4ta03wuA19DLaMvV7C8h1+2OwWjXuHwJ
	lm07GGpHrO/bcpBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yw5W2RUB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wkom9a1o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxSNLYeIM0C5okdvWz8BbDAUxebsaN5Uy82EcU4HDTs=;
	b=Yw5W2RUBlZ6UqR7WjqT+S9RxOZWMBMR9xQlsFjBEBhXuXX9zGhJAbPtwSU47ZIKVd9A6W/
	r32HnxOU0uZ6oougvFyJWiaojF9tj8iKWniwPIlKN6h23OwkMbMZa/QMLPR3mnrBuhmlAm
	p5SUT3XOa5CuRLyHAFI4hcJ04XSHmXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxSNLYeIM0C5okdvWz8BbDAUxebsaN5Uy82EcU4HDTs=;
	b=wkom9a1ogkGarpZ0D1kHuPolH/hYPBcrt4aXrz4ta03wuA19DLaMvV7C8h1+2OwWjXuHwJ
	lm07GGpHrO/bcpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F242B139AB;
	Thu,  9 Jan 2025 14:52:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V5FPOZbif2d9ZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 14:52:06 +0000
Date: Thu, 09 Jan 2025 15:52:06 +0100
Message-ID: <87seps59bd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<broonie@kernel.org>,
	<amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/3] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
In-Reply-To: <ea2b68d0-3280-483e-b42e-327851c319a8@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
	<20250109125204.3668961-2-cezary.rojewski@intel.com>
	<99e4c4cc-d380-44a1-b81b-92a20435bf5d@perex.cz>
	<87zfk05ass.wl-tiwai@suse.de>
	<ea2b68d0-3280-483e-b42e-327851c319a8@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 31BA82115C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 09 Jan 2025 15:41:59 +0100,
Cezary Rojewski wrote:
> 
> On 2025-01-09 3:20 PM, Takashi Iwai wrote:
> > On Thu, 09 Jan 2025 13:42:18 +0100,
> > Jaroslav Kysela wrote:
> >> 
> >> On 09. 01. 25 13:52, Cezary Rojewski wrote:
> >>> The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
> >>> register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
> >>> word-variants of said helps do not expand to bare readx/writex()
> >>> operations but functions instead and, due to pointer type
> >>> incompatibility, cause compilation to fail.
> >>> 
> >>> As AudioDSP drivers e.g.: the avs-driver utilize struct hda_bus (and
> >>> thus struct hdac_bus) as the base structure, add casts to address the
> >>> problem.
> >>> 
> >>> Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
> >>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >>> ---
> >>>    include/sound/hdaudio_ext.h | 16 ++++++++--------
> >>>    1 file changed, 8 insertions(+), 8 deletions(-)
> >>> 
> >>> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
> >>> index 957295364a5e..79a010dd0062 100644
> >>> --- a/include/sound/hdaudio_ext.h
> >>> +++ b/include/sound/hdaudio_ext.h
> >>> @@ -120,21 +120,21 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
> >>>    void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
> >>>      #define snd_hdac_adsp_writeb(chip, reg, value) \
> >>> -	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
> >>> +	snd_hdac_reg_writeb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
> >>>    #define snd_hdac_adsp_readb(chip, reg) \
> >>> -	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
> >>> +	snd_hdac_reg_readb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
> >>>    #define snd_hdac_adsp_writew(chip, reg, value) \
> >>> -	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
> >>> +	snd_hdac_reg_writew((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
> >>>    #define snd_hdac_adsp_readw(chip, reg) \
> >>> -	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
> >>> +	snd_hdac_reg_readw((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
> >>>    #define snd_hdac_adsp_writel(chip, reg, value) \
> >>> -	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
> >>> +	snd_hdac_reg_writel((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
> >>>    #define snd_hdac_adsp_readl(chip, reg) \
> >>> -	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
> >>> +	snd_hdac_reg_readl((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
> >>>    #define snd_hdac_adsp_writeq(chip, reg, value) \
> >>> -	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
> >>> +	snd_hdac_reg_writeq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
> >>>    #define snd_hdac_adsp_readq(chip, reg) \
> >>> -	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
> >>> +	snd_hdac_reg_readq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
> >>>      #define snd_hdac_adsp_updateb(chip, reg, mask, val) \
> >>>    	snd_hdac_adsp_writeb(chip, reg, \
> >> 
> >> 
> >> I'm not sure, if this change is wanted. The passed pointer validation
> >> from the compiler side is lost with retyping.
> >> 
> >> Perhaps, it would be better to create another set of defines for other
> >> structure pointers.
> > 
> > Agreed.  The cast there secretly assumes the type punning and it hides
> > potential bugs.
> > 
> > As those macros are used only by AVS for now, you can move to AVS
> > locally and redefine for the more appropriate types, too.
> 
> Hi,
> 
> Thank you both for the constructive feedback. From what I understand,
> to fix the compilation issue, it is best to move the macros into
> local, sound/soc/intel/avs/ location, perhaps into the existing
> registers.h file?

Yes, it sounds reasonable.


thanks,

Takashi
