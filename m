Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACAE235BFB
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594192; cv=none; b=RtCB7aO+G24nibD6rzBLd2uQY57xeIFIOMcDz+od8hV+V38sjjRPhGTKENQBOMwREBPkPAik/mygKchc7xax8F5rto1H/Y25UYRJh7o2hYh/y63pK69nMLm85HgZSHM3RpjxAbixF1RHXnhZ+cGkksjF2HGcm0wkjLeakAvlJn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594192; c=relaxed/simple;
	bh=A+hDIdnbBcU+F5Cq93BvI4upWhFPI+rDxh8Bi4ZEKL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZwWXy090dxHoJ+bLkul0dtIE/XAC2xjj2s1G32qYPRotwpFxo+Mp8xSN/XWArfXkfKXi3lE74Eu09T1BvjGuXl0q8lq+6gUoIKU6Lf2uUuO+wq1UDbiXhgGgc1ZyShKdJkxUiKaIHkE6ZN4L9ErMnoYfOBvaB0yd3vXV0dcTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRcd2WWx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRcd2WWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743594191; x=1775130191;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A+hDIdnbBcU+F5Cq93BvI4upWhFPI+rDxh8Bi4ZEKL0=;
  b=BRcd2WWxw+61XBsNNFodxiJ7lC7XkB1aKb/SAG9dgac1Dssju9hbDNhc
   ka3CzC6RYs63/uktevSojQB/DGmVA0xZaZqpSrFgvCXsh32VU5rC5ldvp
   OKT0Kz+R7QHTzaqq3hTmJFlZPzS3lR60QWVYDZ10lwtAgPgG++1ncldUt
   arPT9RMetbq1F+KZakl1XeiC6Wkf0LbzQ02fFgVTEoFDxTL9gVHlA9vOY
   1Zs3CsQs5Q8jrMnvDXgTB2QCksOFBK2y81wr/auewk07A9ZCiUAFi08un
   I+5HhbK5B6jPg66yPO9adSqgiO8tQGkZbr3qRYmfWlnILHDTXl97HbTCx
   A==;
X-CSE-ConnectionGUID: TlFvsC64TfCO1P02V2K3CA==
X-CSE-MsgGUID: uv0vrNVhQAqBfDxus1dZ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56323440"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="56323440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:43:10 -0700
X-CSE-ConnectionGUID: /uE4BH99RL+EQ94dn2E1fQ==
X-CSE-MsgGUID: F7BKzhaXR1CYLsxBEMO5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="126924531"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.251.214]) ([10.245.251.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:43:05 -0700
Message-ID: <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
Date: Wed, 2 Apr 2025 14:43:57 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87o6xeyfkk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/04/2025 14:21, Takashi Iwai wrote:
>>> On the second thought, yet another variant would be to introduce only
>>> one new trigger, SNDRV_PCM_TRIGGER_PAUSE_RESET, for resetting the
>>> PAUSED state as a step before stopping the stream.  This can be
>>> applied to all cases for snd_pcm_drop() and snd_pcm_suspend(), too.
>>> If the driver doesn't support this mode, the PCM core may fall back to
>>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
>>
>> This looks identical to my proposed
>> SNDRV_PCM_TRIGGER_PAUSE_RELEASE_AND_STOP which is more
>> explanatory. It's not clear what PAUSE_RESET should do (probably the
>> stream should be kept inactive).
> 
> There is a slight difference.  My proposal, *_TRIGGER_PAUSE_RESET,
> doesn't have to stop the stream by itself, but it's only a preparation
> for stopping.  That is, a proper TRIGGER_STOP always follows after
> TRIGGER_PAUSE_RESET.

But what state that we move after we reset the PAUSE? is it RUNNING
(iow, equals to PAUSE_RELEASE) or something else?

In case of suspend while the state is paused we will:
TRIGGER_PAUSE_RESET followed by STOP or SUSPEND?

Most drivers are doing the same thing for STOP and SUSPEND trigger,
however it is possible to do extra steps for SUSPEND to make sure that
the whole system is in a lowest power state.

-- 
Péter

