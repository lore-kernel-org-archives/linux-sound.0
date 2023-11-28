Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9JDHmI7"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B7BE1
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701166540; x=1732702540;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=65Id7+ZmuDtmrZfPTK8wqeJENzNAYWzYS1CDivxGT6M=;
  b=L9JDHmI7Meeanqg041a6RxtwM68EksQQJ7HBmYmC3JFkFt5KtM+K804W
   BnhPE8R3CrFgKBFtPfI3v3BgU5iKOU4mqhA8M04tJ2SHWTirsyY+h/40S
   yaq1VuJTq/eLi6axb8BdKaLqcI6xUZxrHdQCCmuw0o0Dej/GerAxOOFRt
   xrbu34UtQOz7+8Zey4ywsZpZ+3NTT4Qh6fBtuDN3gHbuEDZCDotv/bQ9G
   JzUo2yi1nQMTa28Zf1WU3UEBGLC6YK+jxNW1craJohOk2/x8vjKNLNyPU
   rD7V8f4aJ2IYoWTNc0aJJk+NEL/lCov9EJSf4XfP6EuU+g1tdCSNAEC1f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="391766025"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="391766025"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 02:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015868142"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015868142"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103]) ([10.251.221.103])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 02:15:25 -0800
Message-ID: <96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
Date: Tue, 28 Nov 2023 12:16:00 +0200
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
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
 <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
 <87y1eimd23.wl-tiwai@suse.de>
 <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
 <87ttp6mc04.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ttp6mc04.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/11/2023 12:02, Takashi Iwai wrote:
> On Tue, 28 Nov 2023 10:53:56 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 28/11/2023 11:39, Takashi Iwai wrote:
>>> Hm...  I still find it's a bad move to use an exported symbol from
>>> another codec driver.
>>
>> The other option is to check for 0x4 (or address 2), but I'm not sure if
>> this is Intel only or universally true for HDMI codecs.
>>
>>> And, I wonder what if you have a system that has only one HDMI codec
>>> without analog one?  Would it still work with your change? 
>>
>> Yes, it works with only HDMI codec (for example on SoundWire laptops) or
>> with UP2 board which only have HDMI audio support by default.
> 
> Interesting.  With your patch 2, hdac_hda_hdmi_codec is without the
> DAPM definitions, and even if that's the only one that is registered,
> it will still work?  So it means that it works without DAPM
> definitions at all?

Well, it is a bit more 'interesting' from that angle.
for patch two we needed:
https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/

The reason is that prior to patch 2 the analog codec would create the
DAPM widgets for the HDMI also and the DAPM route would be available but
the HDMI would still not work:
we had PCMs for HDMI but non operational ones.

If we had a codec+HDMI then we would have the warnings that the second
codec is registering the same DAPM widgets again.

With the linked patch plus this series we will not register the DAPM
widgets and the machine driver would drop the routes.
The PCMs will be still created and they will be still non functional but
we will have no warning when the system have two codecs.

The core HDA+patch_hdmi is needed for the hdac_hda to have working HDMI
audio, but the patch init is after the codec driver's probe:

# dmesg | grep peter
[ 4088.698111] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[ 4088.698112] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[ 4088.698114] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 1
[ 4088.862882] [peter] patch_i915_tgl_hdmi: ENTER
[ 4088.862886] [peter] alloc_intel_hdmi: ENTER
[ 4088.872269] [peter] generic_hdmi_build_pcms: ENTER
[ 4088.872279] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 1

We need to know if the codec is HDMI or not in hdac_hda_dev_probe()

I would rather not risk to move the hdac_hda as Intel only using address
2 as HDMI indication - which I'm still not sure if it is Intel only or
generic HDA convention.

-- 
Péter
