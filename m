Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E1313298
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136738; cv=none; b=QaxRr+1mBBjj/nYrUPMI1arTf53eRR4B591faXKd6bCrnZASit6IemqI30DV8vjWX8qiAiNAv8Me+A/0BgH9hQ32R44FRYZ4CqbH+iE2c8to/cFaBNDguBfqRv5qbrCaaXNSqOji/nXITie53WDBp8+R8HKeThD3XXvnYo79Yjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136738; c=relaxed/simple;
	bh=AymO8zGcZHFLWNLxNtuUORYFzGqb0odTjrvGTrgE5cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtvZM/ry7CPYP+YXscYqy0p8EveChK5Ud9qYDl8EIUblSrxCkAVobNYF8nZTMWsp3QtYA+Wf6p2FCM8jZk5uZRdeqLTfC9C/hKMvhhaSI9fzhRiTVXcx+qKhTOeHnLK3QbaNHevfTRK1o8qHRbkRFNN0YCT9MD84VwAHkEfQfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoEDC6Xv; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoEDC6Xv"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a80c36350so1054379c88.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775136736; x=1775741536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iibtdNU6z0QQOGUxhBBzEm9ND/EIrbq8U83mqPtmm0=;
        b=MoEDC6XvMqKtws9xUvOsrMsHIZzRt5B97LeDkusQYGyBJFRSYKG5jnHwtAZZSh+VTY
         mX9d+wcMS0BewgOUtPwdpbaKGnJfZON/SugcCCvR9WP8BaCU8y1G37tgXrCL4VRhq5/T
         N7gRZng/ATGunkGv0gNtpE8naJWPnikt4WW6eaK0FWxTUAdiWb+PVb0W0ocFjzZg9AM4
         iZOloJ7FUGaTp3l7M4xBRgKEwXI7lU45Jx84UandsbfVj3vNVpcEwizhj+7M/2SPsGD5
         HVWqCf2H/jPOyTzG/fshBmwBukaNpMPrCh+1sWE0BSOgnCKrfHk43yEmVdnTetzgLLZi
         we/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136736; x=1775741536;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iibtdNU6z0QQOGUxhBBzEm9ND/EIrbq8U83mqPtmm0=;
        b=IgAal88ChNbIE0AP+3YXQgyesu/q6XxkSFVffKudvcLoihIcOwD/AocY45b3t7kd16
         z4aFsSXDUr12faZNgwOEHddVyABPMmG1fEQDQuogCWK4IslsrbBvINUksMjYtQ5i+JR4
         kTfqTjRN7a+DuO4QwqFOIWC/0BZmQ4I1mXWjiqkWGceeRnoImV8YkjMxAl3Yb1xSfsZ9
         kPx22JXlhK5kDtysP+4Ew6dPNIqisCGh3bClCe3JUd2hr/izFmFoRwQLA8xvDpjJS0tE
         EHDpDNygPEVtQH6DBPqpIZ8dL54kWAHsKLuzvlDmAbGzBMLS6BNvL3Cinv5ETXafeWm0
         FKJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQMNKjAd5s+OLW9BFmgu9jLkhKVpZjeguDfPCU/0UFzgIO1tJYWWVzh2cn9m7M5eXDLlKCSh9eIcjYzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVsfXskrFJuiZlcHSdOhFoquQKXW6HcxahvJYtmQET4DX7jTu
	UuGRVToiE1XRQqMtCEzq3qQTkZ4lJBpwiPi444krjp6s9FL3N5J8Q+/x
X-Gm-Gg: ATEYQzw0zhnbO2Yr0b+TiNiN7ocZZwcHbI2iXxfa3omFuGHm97OwiFKewedJdbeN4PJ
	DJJtyyhPlK+zRJWt07Kezn7OwmPR+E3agMHQIxZwzsjjNgFBpjc2dR463W9a2TteWWvoMZ/OCND
	3t86V6M+ztOF/o9NO5Mzke8S6UZaiekyC/Wh+efkGRF2vkVG2LIkTkueqnQL+aOHQR2MbtlC41p
	YiFfJzYPGRdtt/9wObHImYAX/YjaEbeLGYNd7awi6PwZfqTFbW0jDhmMCwYmxjtyTi1A87e6MTV
	sTd4r5e2dTc9rMatXw8XmCC3Vw2ICAs+kuOXlWDR/G6nqdGaxHDYusDvi1Vxn/m0inUGSafQeLT
	phXdyPypy2jr4BhWgxUSsXoaAETZf2kxFU992OKLh+HhqXWz/+bEv+sYTWMfeIz0nceu8pUOqy5
	GibaeD2eW86+D0Gt4++ymkk4gDZ92sEdu4i/CYkDf7Ki7VaWxsPtH9juEZJTD/BsAPtNYHBGXQ1
	bJZ7jPptuKpuVc=
X-Received: by 2002:a05:7022:b8c:b0:128:e693:b61c with SMTP id a92af1059eb24-12be64f8154mr3966424c88.27.1775136735666;
        Thu, 02 Apr 2026 06:32:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm2158669c88.14.2026.04.02.06.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:32:15 -0700 (PDT)
Message-ID: <c119da2e-cbb3-4e11-9f56-837c4fd73d26@gmail.com>
Date: Thu, 2 Apr 2026 10:32:10 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Notify IEC958 Default PCM switch state changes
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com>
 <87pl4hiq2o.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87pl4hiq2o.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/2/26 08:01, Takashi Iwai wrote:
> On Thu, 02 Apr 2026 02:20:21 +0200,
> Cássio Gabriel wrote:
>>
>> The "IEC958 Default PCM Playback Switch" control is backed directly by
>> mout->share_spdif. The share-switch callbacks currently access that state
>> without serialization, and spdif_share_sw_put() always returns 0, so
>> normal userspace writes never emit the standard ALSA control value
>> notification.
>>
>> snd_hda_multi_out_analog_open() may also clear mout->share_spdif when the
>> analog PCM capabilities and the SPDIF capabilities no longer intersect.
>> That fallback is still needed to avoid creating an impossible hw
>> constraint set, but it changes the mixer backing value without notifying
>> subscribers.
>>
>> Protect the share-switch callbacks with spdif_mutex like the other SPDIF
>> control handlers, return the actual change value from spdif_share_sw_put(),
>> and notify the matching control when the open path forcibly disables
>> shared SPDIF mode after dropping spdif_mutex.
>>
>> This keeps the existing auto-disable behavior while making switch state
>> changes visible to userspace.
>>
>> Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
>> Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
>> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
>> ---
>>  sound/hda/common/codec.c | 51 ++++++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 47 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
>> index 09b1329bb8f3..5e74b02c45f6 100644
>> --- a/sound/hda/common/codec.c
>> +++ b/sound/hda/common/codec.c
>> @@ -2529,7 +2529,10 @@ EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
>>  static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
>>  			      struct snd_ctl_elem_value *ucontrol)
>>  {
>> +	struct hda_codec *codec = (void *)kcontrol->private_value;
>>  	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
>> +
>> +	guard(mutex)(&codec->spdif_mutex);
>>  	ucontrol->value.integer.value[0] = mout->share_spdif;
>>  	return 0;
>>  }
> 
> I think it's better to assign codec to private_data like others, and
> put mout to private_value instead.

Agreed, I'll rework it that way for v2.

> 
>> @@ -2550,6 +2559,33 @@ static const struct snd_kcontrol_new spdif_share_sw = {
>>  	.put = spdif_share_sw_put,
>>  };
>>  
>> +static struct snd_kcontrol *find_spdif_share_sw(struct hda_codec *codec,
>> +						struct hda_multi_out *mout)
>> +{
>> +	struct hda_nid_item *items = codec->mixers.list;
>> +	int i;
>> +
>> +	for (i = 0; i < codec->mixers.used; i++) {
>> +		struct snd_kcontrol *kctl = items[i].kctl;
>> +
>> +		if (snd_kcontrol_chip(kctl) == mout &&
>> +		    !strcmp(kctl->id.name, spdif_share_sw.name))
>> +			return kctl;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void notify_spdif_share_sw(struct hda_codec *codec,
>> +				  struct hda_multi_out *mout)
>> +{
>> +	struct snd_kcontrol *kctl = find_spdif_share_sw(codec, mout);
>> +
>> +	if (kctl)
>> +		snd_ctl_notify_one(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
>> +				   kctl, 0);
> 
> We may extend struct hda_multi_out to store the assigned shared SPDIF
> kcontrol pointer.  Then it's called directly without parsing at each
> time.

I’ll switch the callbacks to private_data/private_value and
use a cached shared SPDIF kctl, while keeping teardown safe.

> 
> 
> thanks,
> 
> Takashi

-- 
Thanks,
Cássio

