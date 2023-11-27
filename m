Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5yJNO72"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2788C268E
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 06:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701094342; x=1732630342;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qvo3OHW5TO8LFIWZGXILVCyCq2+BIUOQXt5+5AklOAU=;
  b=U5yJNO72wUlbqul8i3EvTz5yowpCP5C3CkR0kDp+YyjjYF+PleY537J+
   7lbCCn7JwUPbYnNw6gZLHy4hxXce2yFzi2bwej+bMdHqpJBS1xefYo31p
   bXDC+y9/ACTJfhQvVejxWc/ChcNFjQVXiheUe6JcCeDWVzkPKkQTT2THQ
   wIy1xzJcmN97DUDl587PVy12WcvFc/SgSPmX/yKpqk2gYLR7xds8JTt+d
   9s3UpucV9kWzbCw0hxEzL3DD+FWNKnt84etTo3jLPFaO8U15QWtHYSoUc
   XnJfBhOBA34jzf20LlNfrBL0n1E7sCaipaSSDRr2Zg8jFgAoE8hPgQw2U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391588412"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391588412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 06:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="834330257"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="834330257"
Received: from acornagl-mobl.ger.corp.intel.com (HELO [10.252.58.144]) ([10.252.58.144])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 06:12:19 -0800
Message-ID: <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
Date: Mon, 27 Nov 2023 16:12:51 +0200
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87jzq3pc6r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/11/2023 15:18, Takashi Iwai wrote:
>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
> 
> I'm afraid that this will bring unnecessary dependency on HDMI codec
> driver.

For HDMI support we anyways need HDMI code?

> IMO, it's better to add a bool flag is_hdmi to struct hdac_device, and
> let the HDMI codec driver setting it at the probe, instead.  Then we
> can save an extra exported symbol, too.

We only use a combined generic codec driver which just supports 'HDA'
codecs regardless of what type they are.

When things probed via ASoC/SOF I just could not find any other way to
access to this table inside of patch_hdmi.c.

We could sort of 'cheat' and look for a specific (I'm not sure if it is
Intel or HDA generic) mask: 0x4
It is used in Intel drivers to identify the display codec, so the HDMI/DP.
If the 0x4 is universal among all HDA platforms for HDMI/DP then I'm
more than happy to drop this patch, but I'm not sure about  that.

-- 
Péter
