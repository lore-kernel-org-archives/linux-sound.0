Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A3427281F
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807475; cv=none; b=R2ZbDG6ghXudmhjeZc4szHQ/ltmwQBwKoUnAUMEMgZei4XoILC3+MYy31kzpjbgM2zVP0m3387lBDbCHiGlQ2EjetRbgaoHBPjQ1+LuPrS2SKqFQJSI/y8CCwwGs0S6MRcWFQpdggkR8C+TCN2hvMJMvIdYaX9vK/dzjg73/1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807475; c=relaxed/simple;
	bh=Hd1wYP2WYkviLqKa+/kw8K1TDIqfFEdGFyx2vJMiRWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jjrWRLMqqUQ9MCzTYTKAmpkTqw9+2oFoVChmp/KAMEmmPQiWG+cCyACpC09xx6gsOLjzRmGE/bMlbHgOr0pRMx7IgSjBgY+b5yidaDKdzbsPCjH/rnQpgVMLpes8JHv+NspkWrK6CZWcO91xtejJq76BTayQHti7LYjWMHipgiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T4I2uh/p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T4I2uh/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749807464;
	bh=Hd1wYP2WYkviLqKa+/kw8K1TDIqfFEdGFyx2vJMiRWM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=T4I2uh/p7GoH1EmMjhpfTcKdRpy5Xc3Gv7PD1WzRhvnK4vuWeRKhr8MIjVwHSxETo
	 uNrNur793d2Dl2Hz/aK9vXXJ+/vurq4YsdbsVuQ1UxYcBHMb7NbZq31AG/zTTCN+xl
	 H1BiS1mXUozJ2MJcTKkbO4CyVR+CoDwj/RLlp5C5BtiBG8Qu5NsCw76KDzMfkf9r2o
	 6lTToiOOIHjkp4e9J/bZaBMrvcIYEzjLXqlNknN3CWC0DgKmUqZON0COdJuVzCnNZr
	 u1sQWcEh36g+SGx+ojdMZkFAcA5B2uetFDae12ACwFSox5Br3UGq4xvdd/MWjnupsW
	 4oLwTqJYi0V/A==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 809D017E046C;
	Fri, 13 Jun 2025 11:37:44 +0200 (CEST)
Message-ID: <ef20f7e8-9d78-44df-9ee4-841e7634460e@collabora.com>
Date: Fri, 13 Jun 2025 12:37:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Fix build with CONFIG_INPUT=n
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20250613081543.7404-1-tiwai@suse.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250613081543.7404-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Takashi,

On 6/13/25 11:15 AM, Takashi Iwai wrote:
> The recent addition of DualSense mixer quirk relies on the input
> device handle, and the build can fail if CONFIG_INPUT isn't set.
> Put (rather ugly) workarounds to wrap with IS_REACHABLE() for avoiding
> the build error.
> 
> Fixes: 79d561c4ec04 ("ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506130733.gnPKw2l3-lkp@intel.com/
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/mixer_quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index a0ffe8b559dc..7cc27ae5512f 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -532,6 +532,7 @@ static int snd_emu0204_controls_create(struct usb_mixer_interface *mixer)
>  					  &snd_emu0204_control, NULL);
>  }
>  
> +#if IS_REACHABLE(CONFIG_INPUT)
>  /*
>   * Sony DualSense controller (PS5) jack detection
>   *
> @@ -788,6 +789,7 @@ static int snd_dualsense_controls_create(struct usb_mixer_interface *mixer)
>  
>  	return snd_dualsense_jack_create(mixer, "Headset Mic Jack", false);
>  }
> +#endif /* IS_REACHABLE(CONFIG_INPUT) */
>  
>  /* ASUS Xonar U1 / U3 controls */
>  
> @@ -4331,10 +4333,12 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
>  		err = snd_emu0204_controls_create(mixer);
>  		break;
>  
> +#if IS_REACHABLE(CONFIG_INPUT)
>  	case USB_ID(0x054c, 0x0ce6): /* Sony DualSense controller (PS5) */
>  	case USB_ID(0x054c, 0x0df2): /* Sony DualSense Edge controller (PS5) */
>  		err = snd_dualsense_controls_create(mixer);
>  		break;
> +#endif /* IS_REACHABLE(CONFIG_INPUT) */
>  
>  	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
>  	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C400 */

I've seen the build issue report earlier today and planned to
investigate, but you beat me to it, so thanks for the quick fix!

I reproduced the linker errors on a minimal kernel configuration with
CONFIG_INPUT not being set and I confirm the build passes after applying
the patch.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

