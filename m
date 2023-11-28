Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U82unu8Z"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D94899
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701162616; x=1732698616;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HOzKkVTVh7JXfq8gy4qmefZpLCg2u46Kmb5aWdRTHCk=;
  b=U82unu8Z9s0fAvmoMEYXBTLkXdWjX7Fj51XXBAtqfarF9jV/R13uJytK
   GRZIjZj+D8Dk+SnwXaktH93+F83VmNyd+UCaDH4Lr3iFsxHl1LVjsekkT
   OkKZb74+rVXrZDMmMi34nQLJwQsYbHNsLlTsgFi1cVppFIHDHwJ1q2z7t
   64wDAnyzJeGoTJJ2cbVjRtQC4E3ZHbNK1tHx5g16l8guxLSEkFCO4scls
   plBwzw6fO6UasqZgWuh23sGDT0eq5rRmg5/+sHgs0Sz9YAwAvL0deVpUA
   psIHpd2Xyu4P5ok6dxrAIM8QJqjYXNrxVggYv2g1k5xEDbL4dd0Ukxq1W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="396788266"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="396788266"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:10:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802914383"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="802914383"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103]) ([10.251.221.103])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:10:13 -0800
Message-ID: <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
Date: Tue, 28 Nov 2023 11:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
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
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <875y1np5g2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/11/2023 17:43, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 16:40:57 +0100,
>>> --- a/include/sound/hdaudio.h
>>> +++ b/include/sound/hdaudio.h
>>> @@ -95,6 +95,7 @@ struct hdac_device {
>>>  	bool lazy_cache:1;	/* don't wake up for writes */
>>>  	bool caps_overwriting:1; /* caps overwrite being in process */
>>>  	bool cache_coef:1;	/* cache COEF read/write too */
>>> +	bool is_hdmi:1;		/* a HDMI/DP codec */
>>>  	unsigned int registered:1; /* codec was registered */
>>>  };
>>>  
>>> --- a/sound/pci/hda/patch_hdmi.c
>>> +++ b/sound/pci/hda/patch_hdmi.c
>>> @@ -2597,6 +2597,7 @@ static int patch_generic_hdmi(struct hda_codec *codec)
>>>  	}
>>>  
>>>  	generic_hdmi_init_per_pins(codec);
>>> +	codec->core.is_hdmi = true;
>>>  	return 0;
>>>  }
>>>  
>>> @@ -3472,6 +3473,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
>>>  	spec->pcm_playback = simple_pcm_playback;
>>>  
>>>  	codec->patch_ops = simple_hdmi_patch_ops;
>>> +	codec->core.is_hdmi = true;
>>>  
>>>  	return 0;
>>>  }
>>
>> I see,  so this is what I was not sure how to do ;)
>> I will rework the series and resend tomorrow.
>>
>> Thanks for the code snippet, I will make you as author of it, if it is
>> OK for you.
> 
> Sure, no problem.

The flag does not work with SOF stack which uses the hdac_hda codec driver:

patch_generic_hdmi() and patch_simple_hdmi() is not entered at all, so
the flag is not set.

The codec driver have is_hdmi_codec() helper to check the struct
hda_pcm.pcm_type, but that is not set early enough either.

The is HDMI or not needs to be known in hdac_hda_dev_probe(), I think
this was one of the reason I have opted to have the exported function.
We just don't have other information at the dev probe time.

# dmesg | grep peter
[    3.810841] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[    3.810846] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[    3.810848] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 0
...
[    3.814497] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[    3.814499] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[    3.814500] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 1
...
[    3.986610] [peter] generic_hdmi_build_pcms: ENTER
[    3.986627] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 1
...
[    3.996383] [peter] snd_hda_parse_pin_defcfg: ENTER
[    4.001562] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 0

-- 
Péter
