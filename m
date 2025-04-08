Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAC35979
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094073; cv=none; b=P1gJF3DzCbzLlDw9K28G/bCitYzpARmcvfrcLEjwfKjik7lYicUGWbtj+XTliIWl7jdK0wBGzCH/d2lfpDGgDBWHQNxVC4Pj8lO/nsDQ/J+CDKytJTxhuiUoF1nIkBlk+INVtDaOUr5meFcKepel+FwQnPr0l3RnuRRVkS9QNT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094073; c=relaxed/simple;
	bh=22Gs+qguXy5eF28mCFqtTKO+HTIgfIcsBP7r2bd7Z3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVfzilhktT+01uDm8bxdlqnAnIHXbGiFdnwxdWku4wyDt10MPArgkSYP6cM5J9Y/PLc0048lX5SXEa2AmO6VTeDyYLxxAelMqXKKmC3quXfowIeDg5AFmmOG7ODHiO+B0+lK92tr6KCfIu1prB3gNA37NKFwqP89kjfTqNkwnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmhfzTax; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmhfzTax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744094072; x=1775630072;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=22Gs+qguXy5eF28mCFqtTKO+HTIgfIcsBP7r2bd7Z3s=;
  b=DmhfzTax6pZFqHNp1xPhrQ0SRp3Q77e3WAMr5dvAu/MqaurJy7JrGwPd
   HtewGNYqua3J/RyGUXgcm+OjGzs2LsUum/kRhGDiQzDBl1XWUIolwzNol
   +VSEmeoul1si6B5QjCflwzhUp5W0HZzo/D0OF15Oo5P8SfI6vfDwvyuyA
   50ZTZabb7ckqJLfiHUF3PmGhcPsMpcOwyIOIhYvxFjxIvt458kxb/p8tC
   VSblEhZMzonlTbbMi49YUHk/zAas5lrCcyBHYq7t/DSlIvYztUn/EnkoJ
   TJWGn1Fscctw4C1AMlRCtjaaPYv1wKkIpPtCMc9smFD7FHYxYdDGIJEAB
   Q==;
X-CSE-ConnectionGUID: 2hLy4DH6Qqq9AsRoMOHKtA==
X-CSE-MsgGUID: T/Kl+ly3RZ6CBHkwcd4QHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49356277"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="49356277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 23:34:30 -0700
X-CSE-ConnectionGUID: euEFIizqTfGGI4hmqlYEVA==
X-CSE-MsgGUID: 1OrpKCPnSoCe73GFehG8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128692934"
Received: from unknown (HELO [10.245.248.64]) ([10.245.248.64])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 23:34:26 -0700
Message-ID: <bbc124b8-993f-42f1-aedd-fac7ec915717@linux.intel.com>
Date: Tue, 8 Apr 2025 09:35:23 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
 <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
 <87jz82ye7b.wl-tiwai@suse.de>
 <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
 <87o6xe7l4q.wl-tiwai@suse.de>
 <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
 <871pu95oon.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <871pu95oon.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 03/04/2025 17:01, Takashi Iwai wrote:
>> The fact that we discuss this shows how much this corner case have been
>> excercised (we eneded upm disabling this in CI testing for now in SOF).
> 
> I agree that your patch can be a good start, at least, it addresses
> the existing issue with the minimal change.  There are still rough
> edges and we'll need to address, but I believe the patch (or modified
> / fixed one) can be applied to 6.15 kernel, while keeping the
> development for 6.16.
> 
> I did some quick work on it, and now implemented
> SNDRV_PCM_PAUSE_RELEASE_STOP trigger.  I guess it's more or less
> aligned with what Jaroslav suggested.
> 
> The patches are pushed out to topic/pcm-pause-rework branch of my
> sound.git tree.  Please take a look.

Sorry for the delay, I just got to test the patches from the
pcm-pause-rework and they seams to work OK.
There is only one difference: before suspend the drivers will receive
STOP instead of SUSPEND if the can_pause_release_stop flag is not set,
but thinking about this a bit more, it sounds the correct thing as the
stream is really stopped.

-- 
Péter

