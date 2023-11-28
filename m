Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBjrnnBN"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3C3B0
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701172699; x=1732708699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yfxPBjK99C/x7K8jQBPJkHoUui07X/Xl86chAZ47rkc=;
  b=nBjrnnBNjF97dBqvmy8BZ8H6/2mpd/WVxFPZZW3vtqPNB4C/azOOQro6
   fvpN7YiJdjycL4al23AdsctG0AKPO5rktXID6HyLrSnp0GTjVPOxfkTzm
   RIz+A4hEIhtGbpG+xn2HRT2QygWMR/eMwtfe1lR25nAxGHUNUSliE+sIe
   jH01HDKr8VrnI+70v6tVGceOvjqgml9ELR60dZPfpKpoBo1ZLnz+8wP2q
   ShAdeqh1rfxvRZuK5qm84YA6enDBCEK3bgzdo0r4LxNf1ZcbRIbSxxez6
   lbOpnBpYUvSR1uyhmbgF2e9SgQWXZefPbg20/6zK2wnYOACLNONrfEmjZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383292371"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="383292371"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 03:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802941654"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="802941654"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103]) ([10.251.221.103])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 03:58:16 -0800
Message-ID: <6710fd66-2a70-4948-aafb-2fcf3d6d2b25@linux.intel.com>
Date: Tue, 28 Nov 2023 13:58:50 +0200
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
 <96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
 <87plzum9w4.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87plzum9w4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/11/2023 12:48, Takashi Iwai wrote:
>> Well, it is a bit more 'interesting' from that angle.
>> for patch two we needed:
>> https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/
> 
> Ouch, this kind of information has to be mentioned in the patch
> description.  Otherwise one would take only this series and face a
> problem easily.  I can imagine such a problem on the stable tree.

OK, I will update the commit message

>> I would rather not risk to move the hdac_hda as Intel only using address
>> 2 as HDMI indication - which I'm still not sure if it is Intel only or
>> generic HDA convention.
> 
> Sure, it doesn't sound right, either.
> 
> Can we then add DAPM widgets and routes later conditionally instead of
> having it in component driver definition?

The issue is with the DAIs. If I remove the dai registering from
hdac_hda_dev_probe() to be done in hdac_hda_codec_probe() then the probe
will not happen since we do not have the needed components/DAIs to probe
the card.

If we don't have HDMI then the machine driver will substitute it with
dummy-dai, but if we have HDMI then we are not going to probe at all.

It is a sort of chicken and egg situation, right?

-- 
Péter
