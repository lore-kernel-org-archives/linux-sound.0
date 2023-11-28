Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO0TWO7H"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C398BDD
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 01:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701165204; x=1732701204;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ze3suMCTxMx1XPVCl0jboSQdHdduZbjsqMTzoxtQyUc=;
  b=gO0TWO7HadIoXwgiyof1cwvf6rBLul4TruxuDYr+T52nnpfGjB803evS
   X0HM0bI/TOmlIXMMLSdAjlCXNsbp4uhJi/SA9YReaDRh6aFhINX+mg8of
   pTHnSlrY5PS+I9z+5759/72S3xp3TMh6xUJuZWmhjTK0m2eOz8JwgIJg4
   CwWuqivcDjzdBeB0OOX6jpUhH3nMbUm+bhzKZcNUunJ5tw0S9xIQNZPJ6
   xW4pwyMnv0UIEYbEsYwpYZjopN9fnGYK1/A6yfI8jtrtvX7VHq+Pq5Rm2
   9/wqCR4eQdBClFu2Nvy7HmX8QApE68+GYFtpXEvMXVCwSf0bpPuShWYC+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="424042143"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="424042143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744847068"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="744847068"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103]) ([10.251.221.103])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:53:21 -0800
Message-ID: <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
Date: Tue, 28 Nov 2023 11:53:56 +0200
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87y1eimd23.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/11/2023 11:39, Takashi Iwai wrote:
> Hm...  I still find it's a bad move to use an exported symbol from
> another codec driver.

The other option is to check for 0x4 (or address 2), but I'm not sure if
this is Intel only or universally true for HDMI codecs.

> And, I wonder what if you have a system that has only one HDMI codec
> without analog one?  Would it still work with your change? 

Yes, it works with only HDMI codec (for example on SoundWire laptops) or
with UP2 board which only have HDMI audio support by default.

It also works if we disable HDMI and only have analog codec.

-- 
Péter
