Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FC121322B
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526575; cv=none; b=WbDeqGcZZFWzqtM4ifU3hPz1jLWRPhrvJJxuT9BCb8miL/0jpJ/sya2F0XHe7/8j9jfIciM03Muw/ptXi1CVsh4YxdRiLsMlB8TzTAiXyJUkS7jaJYAcsW7j8oeSjuxzmq/QebxkRt3W8vETEmC+nkM42CHYNRzQ0iLBNMsP7ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526575; c=relaxed/simple;
	bh=mVsEOFoVT22YApw3Dwo9nnRbfbocjQiRyRex4pPTD2c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leqNjuUDvIPWEqgShzO2ieRf9Rx2VagktzJyMH8FQ3y4xwvvUy6Dj/N+Lx2T/q3UccqEv0fmc/f0JyZUY9EsVFZ6Qz7Hn/pZjv838LoHm8VV6IG14fWN0mNb2g2yd1CwfqnWUMtf/sQp5p6GK3fXMRlYJePzXPdcv58bAsWQHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GAFwbFHn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s5l2MtrK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GAFwbFHn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s5l2MtrK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GAFwbFHn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s5l2MtrK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GAFwbFHn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s5l2MtrK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 850D51F38D;
	Fri, 10 Jan 2025 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736526571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5BeUv5+8OO+v6QYOTI34HmT8LngM7FIPmO40aEQ2EKA=;
	b=GAFwbFHn0/AWvDcFL51yrUcRqO0adHIy0ecZR93JIStDTrKdZ5YWd3u78E66YoFeASnCtH
	RAo6E+BS573r7huEHLx4uBxjzJ5/tPN+07ipS5vlNXwcfAe1wvqQt1IeDMIL5cPn+QcDJV
	qej5E5eXLWvjJ1ERyz8ZIkEt9duIUZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736526571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5BeUv5+8OO+v6QYOTI34HmT8LngM7FIPmO40aEQ2EKA=;
	b=s5l2MtrK2z22xKQFqZlPNJvY//JlGdgzPIU9VhkeYH4Hn2Nrd/7mpJUHj+6t4oOPJ5OiTu
	4nBzmYG9ID2e63Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736526571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5BeUv5+8OO+v6QYOTI34HmT8LngM7FIPmO40aEQ2EKA=;
	b=GAFwbFHn0/AWvDcFL51yrUcRqO0adHIy0ecZR93JIStDTrKdZ5YWd3u78E66YoFeASnCtH
	RAo6E+BS573r7huEHLx4uBxjzJ5/tPN+07ipS5vlNXwcfAe1wvqQt1IeDMIL5cPn+QcDJV
	qej5E5eXLWvjJ1ERyz8ZIkEt9duIUZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736526571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5BeUv5+8OO+v6QYOTI34HmT8LngM7FIPmO40aEQ2EKA=;
	b=s5l2MtrK2z22xKQFqZlPNJvY//JlGdgzPIU9VhkeYH4Hn2Nrd/7mpJUHj+6t4oOPJ5OiTu
	4nBzmYG9ID2e63Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D59013A86;
	Fri, 10 Jan 2025 16:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AduaEetKgWcCGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 16:29:31 +0000
Date: Fri, 10 Jan 2025 17:29:30 +0100
Message-ID: <871pxavdhx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v2 1/2] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
In-Reply-To: <20250110113326.3809897-2-cezary.rojewski@intel.com>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
	<20250110113326.3809897-2-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 10 Jan 2025 12:33:25 +0100,
Cezary Rojewski wrote:
> 
> The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
> register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
> word-variants of said helps do not expand to bare readx/writex()
> operations but functions instead and, due to pointer type
> incompatibility, cause compilation to fail.
> 
> As the macros are utilized by the avs-driver alone, relocate the code
> introduced with commit c19bd02e9029 ("ALSA: hda: Add helper macros for
> DSP capable devices") into the avs/ directory and update it to operate
> on 'adev' i.e.: the avs-driver-context directly to fix the issue.
> 
> Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/hdaudio_ext.h     | 45 ---------------------------------
>  sound/soc/intel/avs/apl.c       |  1 +
>  sound/soc/intel/avs/cnl.c       |  1 +
>  sound/soc/intel/avs/registers.h | 45 +++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/skl.c       |  1 +

I can take this, but as it touches ASoC stuff, need an ack from Mark.


thanks,

Takashi

>  5 files changed, 48 insertions(+), 45 deletions(-)
> 
> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
> index 957295364a5e..4c7a40e149a5 100644
> --- a/include/sound/hdaudio_ext.h
> +++ b/include/sound/hdaudio_ext.h
> @@ -2,8 +2,6 @@
>  #ifndef __SOUND_HDAUDIO_EXT_H
>  #define __SOUND_HDAUDIO_EXT_H
>  
> -#include <linux/io-64-nonatomic-lo-hi.h>
> -#include <linux/iopoll.h>
>  #include <sound/hdaudio.h>
>  
>  int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
> @@ -119,49 +117,6 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
>  
>  void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
>  
> -#define snd_hdac_adsp_writeb(chip, reg, value) \
> -	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
> -#define snd_hdac_adsp_readb(chip, reg) \
> -	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
> -#define snd_hdac_adsp_writew(chip, reg, value) \
> -	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
> -#define snd_hdac_adsp_readw(chip, reg) \
> -	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
> -#define snd_hdac_adsp_writel(chip, reg, value) \
> -	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
> -#define snd_hdac_adsp_readl(chip, reg) \
> -	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
> -#define snd_hdac_adsp_writeq(chip, reg, value) \
> -	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
> -#define snd_hdac_adsp_readq(chip, reg) \
> -	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
> -
> -#define snd_hdac_adsp_updateb(chip, reg, mask, val) \
> -	snd_hdac_adsp_writeb(chip, reg, \
> -			(snd_hdac_adsp_readb(chip, reg) & ~(mask)) | (val))
> -#define snd_hdac_adsp_updatew(chip, reg, mask, val) \
> -	snd_hdac_adsp_writew(chip, reg, \
> -			(snd_hdac_adsp_readw(chip, reg) & ~(mask)) | (val))
> -#define snd_hdac_adsp_updatel(chip, reg, mask, val) \
> -	snd_hdac_adsp_writel(chip, reg, \
> -			(snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
> -#define snd_hdac_adsp_updateq(chip, reg, mask, val) \
> -	snd_hdac_adsp_writeq(chip, reg, \
> -			(snd_hdac_adsp_readq(chip, reg) & ~(mask)) | (val))
> -
> -#define snd_hdac_adsp_readb_poll(chip, reg, val, cond, delay_us, timeout_us) \
> -	readb_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
> -			   delay_us, timeout_us)
> -#define snd_hdac_adsp_readw_poll(chip, reg, val, cond, delay_us, timeout_us) \
> -	readw_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
> -			   delay_us, timeout_us)
> -#define snd_hdac_adsp_readl_poll(chip, reg, val, cond, delay_us, timeout_us) \
> -	readl_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
> -			   delay_us, timeout_us)
> -#define snd_hdac_adsp_readq_poll(chip, reg, val, cond, delay_us, timeout_us) \
> -	readq_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
> -			   delay_us, timeout_us)
> -
>  struct hdac_ext_device;
>  
>  /* ops common to all codec drivers */
> diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
> index 27516ef57185..a48d74daf48c 100644
> --- a/sound/soc/intel/avs/apl.c
> +++ b/sound/soc/intel/avs/apl.c
> @@ -12,6 +12,7 @@
>  #include "avs.h"
>  #include "messages.h"
>  #include "path.h"
> +#include "registers.h"
>  #include "topology.h"
>  
>  static irqreturn_t avs_apl_dsp_interrupt(struct avs_dev *adev)
> diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
> index bd3c4bb8bf5a..03f8fb0dc187 100644
> --- a/sound/soc/intel/avs/cnl.c
> +++ b/sound/soc/intel/avs/cnl.c
> @@ -9,6 +9,7 @@
>  #include <sound/hdaudio_ext.h>
>  #include "avs.h"
>  #include "messages.h"
> +#include "registers.h"
>  
>  static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
>  {
> diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
> index f76e91cff2a9..5b6d60eb3c18 100644
> --- a/sound/soc/intel/avs/registers.h
> +++ b/sound/soc/intel/avs/registers.h
> @@ -9,6 +9,8 @@
>  #ifndef __SOUND_SOC_INTEL_AVS_REGS_H
>  #define __SOUND_SOC_INTEL_AVS_REGS_H
>  
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/iopoll.h>
>  #include <linux/sizes.h>
>  
>  #define AZX_PCIREG_PGCTL		0x44
> @@ -98,4 +100,47 @@
>  #define avs_downlink_addr(adev) \
>  	avs_sram_addr(adev, AVS_DOWNLINK_WINDOW)
>  
> +#define snd_hdac_adsp_writeb(adev, reg, value) \
> +	snd_hdac_reg_writeb(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
> +#define snd_hdac_adsp_readb(adev, reg) \
> +	snd_hdac_reg_readb(&(adev)->base.core, (adev)->dsp_ba + (reg))
> +#define snd_hdac_adsp_writew(adev, reg, value) \
> +	snd_hdac_reg_writew(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
> +#define snd_hdac_adsp_readw(adev, reg) \
> +	snd_hdac_reg_readw(&(adev)->base.core, (adev)->dsp_ba + (reg))
> +#define snd_hdac_adsp_writel(adev, reg, value) \
> +	snd_hdac_reg_writel(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
> +#define snd_hdac_adsp_readl(adev, reg) \
> +	snd_hdac_reg_readl(&(adev)->base.core, (adev)->dsp_ba + (reg))
> +#define snd_hdac_adsp_writeq(adev, reg, value) \
> +	snd_hdac_reg_writeq(&(adev)->base.core, (adev)->dsp_ba + (reg), value)
> +#define snd_hdac_adsp_readq(adev, reg) \
> +	snd_hdac_reg_readq(&(adev)->base.core, (adev)->dsp_ba + (reg))
> +
> +#define snd_hdac_adsp_updateb(adev, reg, mask, val) \
> +	snd_hdac_adsp_writeb(adev, reg, \
> +			(snd_hdac_adsp_readb(adev, reg) & ~(mask)) | (val))
> +#define snd_hdac_adsp_updatew(adev, reg, mask, val) \
> +	snd_hdac_adsp_writew(adev, reg, \
> +			(snd_hdac_adsp_readw(adev, reg) & ~(mask)) | (val))
> +#define snd_hdac_adsp_updatel(adev, reg, mask, val) \
> +	snd_hdac_adsp_writel(adev, reg, \
> +			(snd_hdac_adsp_readl(adev, reg) & ~(mask)) | (val))
> +#define snd_hdac_adsp_updateq(adev, reg, mask, val) \
> +	snd_hdac_adsp_writeq(adev, reg, \
> +			(snd_hdac_adsp_readq(adev, reg) & ~(mask)) | (val))
> +
> +#define snd_hdac_adsp_readb_poll(adev, reg, val, cond, delay_us, timeout_us) \
> +	readb_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
> +			   delay_us, timeout_us)
> +#define snd_hdac_adsp_readw_poll(adev, reg, val, cond, delay_us, timeout_us) \
> +	readw_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
> +			   delay_us, timeout_us)
> +#define snd_hdac_adsp_readl_poll(adev, reg, val, cond, delay_us, timeout_us) \
> +	readl_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
> +			   delay_us, timeout_us)
> +#define snd_hdac_adsp_readq_poll(adev, reg, val, cond, delay_us, timeout_us) \
> +	readq_poll_timeout((adev)->dsp_ba + (reg), val, cond, \
> +			   delay_us, timeout_us)
> +
>  #endif /* __SOUND_SOC_INTEL_AVS_REGS_H */
> diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
> index 34f859d6e5a4..d66ef000de9e 100644
> --- a/sound/soc/intel/avs/skl.c
> +++ b/sound/soc/intel/avs/skl.c
> @@ -12,6 +12,7 @@
>  #include "avs.h"
>  #include "cldma.h"
>  #include "messages.h"
> +#include "registers.h"
>  
>  void avs_skl_ipc_interrupt(struct avs_dev *adev)
>  {
> -- 
> 2.25.1
> 
