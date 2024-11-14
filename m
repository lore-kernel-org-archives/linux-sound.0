Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552272C190;
	Thu, 14 Nov 2024 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731610461; cv=none; b=U3OSAtyOJlUxdPCbJp8GCjJGYHF/L7MMbagcfhr/kIOJ8umRm0cnG+E+sCJ2XNYSJHNStiS09pqYbeqLfi1/fM6Dh1boqC0qO9VIv2BnwSvx4PHCvtO44Xjnfr3jLkEnWaJUfwbDQ+yacQ7lLO0YgIOtj4OqNIwmaf7Q0jpfKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731610461; c=relaxed/simple;
	bh=nP0/dNyuYxl/up1JgcBU4+hV/85OLUjwiQ8BfozWENQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+r4AAi/m4UkynKI1SYxlvXuvKfdRp5dLxypzJ7a/2PjEhymGwVptlBs9/4vpUF8pda/Mb2iiwQ6UZvmKZrOebLhT04tvZ1tIzNEi31bo31VSxw8amauQ66S0i1dldJoSlWAiGRTycHdbzDDo3sj99kdvZW8HZw0WZHwZ4tNLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 684B629804EC;
	Thu, 14 Nov 2024 10:44:53 -0800 (PST)
Message-ID: <4717b9c4-8d9f-40d8-903e-68be30ac7d82@cosmicgizmosystems.com>
Date: Thu, 14 Nov 2024 10:44:52 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Fix control names for Plantronics/Poly
 Headsets
To: Takashi Iwai <tiwai@suse.de>, Wade Wang <wade.wang@hp.com>
Cc: perex@perex.cz, tiwai@suse.com, kl@kl.wtf, wangdicheng@kylinos.cn,
 k.kosik@outlook.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241114061553.1699264-1-wade.wang@hp.com>
 <87plmythnv.wl-tiwai@suse.de>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <87plmythnv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Takashi,

On 11/13/24 11:10 PM, Takashi Iwai wrote:
> On Thu, 14 Nov 2024 07:15:53 +0100,
> Wade Wang wrote:
>>
>> Add a control name fixer for all headsets with VID 0x047F.
>>
>> Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
>> Signed-off-by: Wade Wang <wade.wang@hp.com>
> 
> Thanks for the patch, but from the description, it's not clear what
> this patch actually does.  What's the control name fixer and how it
> behaves?

It will be better described in the v2 patch.

It modifies names like

Headset Earphone Playback Volume
Headset Microphone Capture Switch
Receive Playback Volume
Transmit Capture Switch

to

Headset Playback Volume
Headset Capture Switch

so user space will bind to the headset's audio controls.

> 
> Also, are you sure that this can be applied to all devices of
> Plantonics & co?  Including the devices in future.  I thought they had
> so many different models.

Yes, the quirk only modifies the control names that contain certain keywords.
Additional keywords may have to be added to the list in the future.

> 
> Last but not least, __build_feature_ctl() is no right place to add the
> vendor-specific stuff.  There is already a common place in
> mixer_quirks.c, e.g. snd_usb_mixer_fu_apply_quirk().  Please move the
> fix-up to the appropriate place.

I figured as much and I am currently testing with the function updated
and moved to mixer_quirks.c and will be triggered by snd_usb_mixer_fu_apply_quirk().

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>  sound/usb/mixer.c | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>> index bd67027c7677..110d43ace4d8 100644
>> --- a/sound/usb/mixer.c
>> +++ b/sound/usb/mixer.c
>> @@ -1664,6 +1664,33 @@ static void check_no_speaker_on_headset(struct snd_kcontrol *kctl,
>>  	snd_ctl_rename(card, kctl, "Headphone");
>>  }
>>  
>> +static void fix_plt_control_name(struct snd_kcontrol *kctl)
>> +{
>> +	static const char * const names_to_remove[] = {
>> +		"Earphone",
>> +		"Microphone",
>> +		"Receive",
>> +		"Transmit",
>> +		NULL
>> +	};
>> +	const char * const *n2r;
>> +	char *dst, *src;
>> +	size_t len;
>> +
>> +	for (n2r = names_to_remove; *n2r; ++n2r) {
>> +		dst = strstr(kctl->id.name, *n2r);
>> +		if (dst != NULL) {
>> +			src = dst + strlen(*n2r);
>> +			len = strlen(src) + 1;
>> +			if ((char *)kctl->id.name != dst && *(dst - 1) == ' ')
>> +				--dst;
>> +			memmove(dst, src, len);
>> +		}
>> +	}
>> +	if (kctl->id.name[0] == '\0')
>> +		strscpy(kctl->id.name, "Headset", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
>> +}
>> +
>>  static const struct usb_feature_control_info *get_feature_control_info(int control)
>>  {
>>  	int i;
>> @@ -1780,6 +1807,9 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
>>  		if (!mapped_name)
>>  			check_no_speaker_on_headset(kctl, mixer->chip->card);
>>  
>> +		if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f)
>> +			fix_plt_control_name(kctl);
>> +
>>  		/*
>>  		 * determine the stream direction:
>>  		 * if the connected output is USB stream, then it's likely a
>> -- 
>> 2.43.0
>>

