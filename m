Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzSdcj2h"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1415193
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 15:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701990407; x=1733526407;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kAl17usOA5d6GBSeFljpNfCwDDGWkVTVlMIetvdF7kk=;
  b=mzSdcj2h2oznfvsXiQAmIRizlC9Z9s0H4z9n3Tahd9+y0rFOvubK2Plh
   l6KuvVxMmTjLaX2vn95n51jbpK6gi8MCO55/MOrtP7RW3ZYYovhB1XhQn
   /exKzZMMseeteTNYK4aY7JcXWSvzYsmqppwQp3uwL57sTtlQJ57UjvkpL
   2R1oIZQ7kVKYcBK3SyAAAtxi8aAQBD+GBoBpawWNx2714utQo39Madntw
   UWA7e1dBUsamEWbftPLAPt2UW8vJXyKBIEInpgEg9mOKiD0O8ZW0coR4Z
   IWdSteqKudZtcf5jc2CeVFf5hgI33t5cp8fnW03fSIvKKjgT8rfO8vlPF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397108955"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="397108955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 15:06:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800899041"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="800899041"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO [10.212.148.159]) ([10.212.148.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 15:06:44 -0800
Message-ID: <ba39f664-595d-4f22-9bee-cb31cbaeaddb@linux.intel.com>
Date: Thu, 7 Dec 2023 17:06:44 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] soundwire/ASoC: speed-up downloads with BTP/BRA
 protocol
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/7/23 16:56, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 04:29:28PM -0600, Pierre-Louis Bossart wrote:
> 
>> The MIPI specification and most of the new codecs support the Bulk
>> Transfer Protocol (BTP) and specifically the Bulk Register Access
>> (BRA) configuration. This mode reclaims the 'audio' data space of the
>> SoundWire frame to send firmware/coefficients over the DataPort 0
>> (DP0).
> 
> So the bulk register access is accessing registers that are also visible
> through the one register at at time interface, just faster?

Yes, each frame can transmit a packet with a start address, length and a
bunch of data bytes protected with a CRC. With the default 50x4 frame
size we use, we can send 8 contiguous bytes per frame instead of 1. With
a larger frame you get even more bytes per frame.

Also because we program a large buffer with all the packets
pre-formatted by software, we don't have much software overhead. The
packets are streamed over DMA and inserted in the frame by hardware at
the relevant time. That means waiting for one DMA complete event instead
of dealing with thousands of command/responses with interrupts.

There are limitations though, if the frame is already transmitting audio
data then obviously we have a conflict.
