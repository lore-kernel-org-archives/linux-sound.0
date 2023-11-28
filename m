Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0hEkTQR"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6110D197
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 04:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701173776; x=1732709776;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=7wlfTkVA9T4sl4yTRAFwFkuqKuwz/x+zFV6VkHQubcM=;
  b=Y0hEkTQR/mcqiyR818sRQsCugkL3MC9Ok+ndXE2tBpSt/ehIrQX5UMCN
   MW+enqJfaCgkKqwi7l39O+2c54qgTYF2KsNFxBhaiTucrRzedaeegyxK9
   0zlnRlLogrBnCNsYRMOaKd/SgWEsoFwm25V9gcFhJkz6OzSd/bJjjiMek
   pPmZJaz3yqe8gobBUR6GMRvZ60KQ0XTqprhOo8/1jPyXNCKNK5JF49+Q9
   2CojnDhtV7s65tByFvYdqIl2DYXTSu272eorzQrgawYwH7Oc/4Wv5lTt0
   8t/6/3Op3SnQp3c1d04lXhZQVhloeN3niSHkVmc3YuVOsxFb86NOvC5oO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="390065364"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="390065364"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941901099"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="941901099"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103]) ([10.251.221.103])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 04:15:54 -0800
Message-ID: <30f05de0-f431-4972-9315-6b377cf43cf4@linux.intel.com>
Date: Tue, 28 Nov 2023 14:16:29 +0200
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
 <96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
 <87plzum9w4.wl-tiwai@suse.de>
 <6710fd66-2a70-4948-aafb-2fcf3d6d2b25@linux.intel.com>
In-Reply-To: <6710fd66-2a70-4948-aafb-2fcf3d6d2b25@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/11/2023 13:58, Péter Ujfalusi wrote:
> 
> 
> On 28/11/2023 12:48, Takashi Iwai wrote:
>>> Well, it is a bit more 'interesting' from that angle.
>>> for patch two we needed:
>>> https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/
>>
>> Ouch, this kind of information has to be mentioned in the patch
>> description.  Otherwise one would take only this series and face a
>> problem easily.  I can imagine such a problem on the stable tree.
> 
> OK, I will update the commit message
> 
>>> I would rather not risk to move the hdac_hda as Intel only using address
>>> 2 as HDMI indication - which I'm still not sure if it is Intel only or
>>> generic HDA convention.
>>
>> Sure, it doesn't sound right, either.
>>
>> Can we then add DAPM widgets and routes later conditionally instead of
>> having it in component driver definition?
> 
> The issue is with the DAIs. If I remove the dai registering from
> hdac_hda_dev_probe() to be done in hdac_hda_codec_probe() then the probe
> will not happen since we do not have the needed components/DAIs to probe
> the card.
> 
> If we don't have HDMI then the machine driver will substitute it with
> dummy-dai, but if we have HDMI then we are not going to probe at all.
> 
> It is a sort of chicken and egg situation, right?

I think I have found a workaround without the need to export a function,
it is going to be a single patch and should be OK for non Intel
platforms in the future.

struct hdac_hda_priv *hda_pvt = dev_get_drvdata(&hdev->dev);
..
if (hda_pvt->need_display_power)
	/* HDMI/DP */
else
	/* Non HDMI */

-- 
Péter
