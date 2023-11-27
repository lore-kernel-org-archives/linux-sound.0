Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpez5xDw"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDB2B4
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701096323; x=1732632323;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k++rS4KJjI7oQEUM44rtMMAlNIs0/JrY4n1kXW7APuE=;
  b=bpez5xDwMv/JQBk+7OV50tSFD+82llyWwSjCJ9FYMYFFmgr8aXWHcb9U
   BWJkxsFXBiiBp46iJ2I3AauUsah4ubtqGlzfI4Hl8PNevlbXyZ45YiweV
   2FJ4cZunM9dwH6XAgoktD3D7jHE2rSKcuRiVne6mSylkrXKRS0YdUGrMi
   +lPL1Ud8iR3QlyUn0OwjP5UHNlU8JJxBT8M02iZdz7PAK1kRCGsMpkQQn
   aVC8a/JmngHtxC16e/WHFBdk+pUtbJYlv/Cy0ctFlZYLY+ftIMEX6vU2l
   WnRj/EKviBfsrJVG8b1FDPrz6CPYoQo/86DIY4ELzyOoAJd4XNvDCNNKM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457048479"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="457048479"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 06:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="768192520"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="768192520"
Received: from acornagl-mobl.ger.corp.intel.com (HELO [10.252.58.144]) ([10.252.58.144])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 06:45:20 -0800
Message-ID: <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
Date: Mon, 27 Nov 2023 16:45:54 +0200
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87cyvvp8t6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/11/2023 16:31, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 15:12:51 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 27/11/2023 15:18, Takashi Iwai wrote:
>>>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>>>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>>>> +			return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
>>>
>>> I'm afraid that this will bring unnecessary dependency on HDMI codec
>>> driver.
>>
>> For HDMI support we anyways need HDMI code?
> 
> But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
> thought?
> 
> With your patch, now it becomes a hard-dependency.  It'll be even
> build failure when HDMI codec driver isn't enabled in Kconfig.

The change in hdaudio.h handles the config dependency, if
CONFIG_SND_HDA_CODEC_HDMI is not enabled in Kconfig then
snd_hda_device_is_hdmi() will return false.

-- 
Péter
