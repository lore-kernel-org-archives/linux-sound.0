Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DFF48988B
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918946; cv=none; b=B1RabDt9m20le252iONloppb+vSWtLCr+tH1NfQlgoXljnzPfyaXzxjicVPiW9fNrvvWUEzK+TCeG/cK3LrIlBxeZoYGZcDTOdo8haSsjiDCf8HLiTWTw7FSsRHSxcY0pWxyKTkDmMXlO3eHbrSnUSx2iCRNr0DFTcYyzhv47vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918946; c=relaxed/simple;
	bh=0iwNrntQRr0m1Yb2cigO1f7CW9Jav1eJvZsnXZIo5Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXZQ5tVrn+SA1O8uLIlenwcqiXbVnPmSbYutGxzrsPva6KLvzcOUDScJewnoBCp7izeO/xihI7VxM4t33QKTjQ1WlLvY/HDlcKsKL1Sd1uNMRCYni+QNmq3ZK17Dr4YvPiSL6i8HlfnisNm3kUbVD3ZkXdz6UAUEAvv8Rv21A6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U/bq9SWZ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U/bq9SWZ"
Message-ID: <7be50891-3861-418d-8237-5340a80b9159@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785918942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5a3jSqezqxUEfUjeil0WyOPqkfR0LR47HkZsyhi4CoQ=;
	b=U/bq9SWZjoiYeGXR0cpRWGTRtXUuan+X46GVABOXE4TnHc7jxHDnK5R/29EwZvD/7oeviw
	Fgy7p+sNWIAUQ5oni36AcTRhm0mssa3U8rJ8ndYUW5atQTuwFKifzblWF3wiiN0mbYRc/9
	Tc1c4idptIAqxdeg3xS8UZ/9S3rGrTY=
Date: Wed, 5 Aug 2026 10:22:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that
 is not on the bus
To: "Liao, Bard" <bard.liao@intel.com>, Sergey Lebedev <lsa.uz@pm.me>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "sound-open-firmware@alsa-project.org"
 <sound-open-firmware@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260804225853.31585-3-lsa.uz@pm.me>
 <SJ2PR11MB84240C52AC5C4DB36B92AACCFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB84240C52AC5C4DB36B92AACCFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>> asoc_sdw_parse_sdw_endpoints() builds DAI links for every endpoint of
>> every _ADR entry the firmware declares. If a declared peripheral never
>> enumerates, its links are still created and later fail to prepare, which
>> takes the whole link down rather than degrading it:
>>
>>   sof_sdw sof_sdw: ASoC: error at snd_soc_link_startup on
>>     SDW0-Playback-SmartAmp: -61
>>
>> The Microsoft Surface Pro 11 (Intel) declares one physical RT1320 twice,
>> as two _ADR entries on link 0 differing only in SDCA class id:
>>
>>   SWRA  _ADR 0x000030025D132000   class 0
>>   SWRB  _ADR 0x000030025D132001   class 1
>>
>> Same link, same manufacturer, part and version, same unique id 0. The
>> part reports class 1, so only SWRB enumerates. SWRA is a phantom and
>> stays UNATTACHED across every boot and every firmware version tested,
>> including the November 2025 bundle.
> 
> Why not just remove SWRA from the BIOS?

Or add a quirk in drivers/soundwire/dmi-quirks.c to skip this SWRA
device entirely, this has been the direction so far to ignore 'ghost'
devices.

It's much safer IMHO than trying to detect if a device is physically
present or not.

