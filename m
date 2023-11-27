Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUhBYfIw"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864BF1A1
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099625; x=1732635625;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0rhUFKvAImg0DoQpIyV/pgM58toMDdCrae+OOckfr6U=;
  b=UUhBYfIwS+oVieaXBqQNx/R2JsHwBe+zSmBcbwvP3ZBmFR2AnTREC217
   MFrL3PDxj2dNAz1rZPhtlpQ4znqHmwrOqNocWQEZGUghkS4ja88OM+/oM
   Ps6o0uEjpR1oIL0zR7sa+pb1J8KCdScudHUk4MQlD5xI3hNaQaN85fU2u
   tihVuNdoUAlrERnbUx1M9sPJiN3cssnOVbY0qIPgvDpeUycvytloKxSne
   l8hgNE6hwv6bYwNhl7+JwtPbNMhgcg0o7hZOLU5Mhgp75StCMyyYwYNf1
   b+X8RUdYRvaqnrrhvCyZ7983AWjG9fFR9OlVE5PTSn2WwHWhOVwnbLZ8x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372897428"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372897428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="16322740"
Received: from acornagl-mobl.ger.corp.intel.com (HELO [10.252.58.144]) ([10.252.58.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:40:23 -0800
Message-ID: <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
Date: Mon, 27 Nov 2023 17:40:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
 <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
 <878r6jp6jd.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <878r6jp6jd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/11/2023 17:20, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 15:45:54 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 27/11/2023 16:31, Takashi Iwai wrote:
>>> On Mon, 27 Nov 2023 15:12:51 +0100,
>>> Péter Ujfalusi wrote:
>>>>
>>>>
>>>>
>>>> On 27/11/2023 15:18, Takashi Iwai wrote:
>>>>>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +
>>>>>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>>>>>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>>>>>> +			return true;
>>>>>> +	}
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
>>>>>
>>>>> I'm afraid that this will bring unnecessary dependency on HDMI codec
>>>>> driver.
>>>>
>>>> For HDMI support we anyways need HDMI code?
>>>
>>> But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
>>> thought?
>>>
>>> With your patch, now it becomes a hard-dependency.  It'll be even
>>> build failure when HDMI codec driver isn't enabled in Kconfig.
>>
>> The change in hdaudio.h handles the config dependency, if
>> CONFIG_SND_HDA_CODEC_HDMI is not enabled in Kconfig then
>> snd_hda_device_is_hdmi() will return false.
> 
> OK, that's at least good.
> But I still find it not ideal to bring the hard dependency there
> unnecessarily.
> 
> With the introduction of a flag in hdac_device, the necessary change
> would be even smaller like below.
> 
> 
> Takashi
> 
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -95,6 +95,7 @@ struct hdac_device {
>  	bool lazy_cache:1;	/* don't wake up for writes */
>  	bool caps_overwriting:1; /* caps overwrite being in process */
>  	bool cache_coef:1;	/* cache COEF read/write too */
> +	bool is_hdmi:1;		/* a HDMI/DP codec */
>  	unsigned int registered:1; /* codec was registered */
>  };
>  
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -2597,6 +2597,7 @@ static int patch_generic_hdmi(struct hda_codec *codec)
>  	}
>  
>  	generic_hdmi_init_per_pins(codec);
> +	codec->core.is_hdmi = true;
>  	return 0;
>  }
>  
> @@ -3472,6 +3473,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
>  	spec->pcm_playback = simple_pcm_playback;
>  
>  	codec->patch_ops = simple_hdmi_patch_ops;
> +	codec->core.is_hdmi = true;
>  
>  	return 0;
>  }

I see,  so this is what I was not sure how to do ;)
I will rework the series and resend tomorrow.

Thanks for the code snippet, I will make you as author of it, if it is
OK for you.

-- 
Péter
