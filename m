Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452C1FA178
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 02:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757988780; cv=none; b=YJGY1r95GIqNeC4flWdbSfHtvRdRwnTS1HECCspNSa3KZKoP5FKwHGnfaxLLmMtEQvXd34Na2x36wNqkx7gcaS3hNrsdtysZnTAu42CBRaSP1xeQFT/6amfWSJ6EaB6BRRSELceWjFOWx7rKBvbFtzoOYKHLtZtWEpGAQqVuhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757988780; c=relaxed/simple;
	bh=ksjE7G2ADUt+g8e7n7Ia6BUsmR9Nd1o28adQZfTCLT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCM+PHep5cH8XMmfcRSzW6DHuKDokeyCg00jKs+iIxuA5UDJ9dj48cjkB0UJzjzsKcLs8OXzW1NdWJ+azspvLizPcmPhbN0mXOmdvIH5HhAJqFi/OitwlB0AOOMWtOLbfBaWr4VaVPQyyJup47fqi+3o4yt9v82tvuiIC+SLhMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuRI51YU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuRI51YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757988780; x=1789524780;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ksjE7G2ADUt+g8e7n7Ia6BUsmR9Nd1o28adQZfTCLT8=;
  b=VuRI51YUiRNY3MsL5KjJI3VR2n6CYVJpr6xDQiud4bxC/C7ZzLPqoRYr
   W+k0waA2ZApPEnvc0jcvhbxPLZWnNJHYace/f6R6ypwQbR2qR3KVHsAQv
   FyCuGuAc+NWWbWETJAYvCKMQ+9K99wukn+ofq/4TeBcGcUdb3wN8GishW
   sDTNEAN8la2J4fuLU3k9CseLE953vF9/Amq4Ix64HDJy+ZSIWKruVqcbL
   757n0E1hhvdna2728jAPrA+NdqNRGDbxY7xYE8vDK80wt5cfS2ReE2wW/
   X+oT2xpwnkCyuQPQ3yT+uv3OsJfzYC3NcCaA61XaC9kFDKCDNViAQTJ8i
   Q==;
X-CSE-ConnectionGUID: TGPTID26TlOL5TV9gHK2Fg==
X-CSE-MsgGUID: lOUK9QRcQve6tUmaFj8kqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64067694"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64067694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 19:12:59 -0700
X-CSE-ConnectionGUID: m1XXGGjySpa7K05T2e9uxQ==
X-CSE-MsgGUID: wdiG7dAGTqCtFXmZkZRB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="198484357"
Received: from unknown (HELO [10.227.10.84]) ([10.227.10.84])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 19:12:56 -0700
Message-ID: <d734de63-87ec-4223-a11f-b97dfeb77ecc@linux.intel.com>
Date: Tue, 16 Sep 2025 10:12:47 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add SDCA UMP/FDL support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/12/2025 6:34 PM, Charles Keepax wrote:
> Next installment of the SDCA changes, hopefully the next series after
> this should be the full class driver. It is worth noting this series has
> a build dependency on a patch working its way through the PM/ACPI tree:
> 
> commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
> 
> But we can probably worry about that later, as normally there is a
> reasonable amount of review on these SDCA series'.
> 
> This series broadly breaks down into 3 chunks, first there are several
> changes to remove the assumption that the struct device used for SDCA
> purposes represents the SoundWire slave. This is because the SDCA class
> driver will be made of an auxiliary driver for each SDCA Function, thus
> the SoundWire slave will be on the parent device for each individual
> driver. Then there are patches to add support for UMP/FDL. And then
> finally since the rest of the HID support is there and UMP was the last
> missing part required a small patch to add a function to allow reporting
> of HID events from SDCA devices.
> 
> Thanks,
> Charles
> 
> Changes since v1:
>  - Add timeout for UMP buffer transfers
>  - Add function reset
>  - Parse XU properties from DisCo
>  - Rename entity_xu library to FDL
>  - Add a limit to the number of times it will try the FDL process
>  - Rename soundwire device pointers to sdev to distinguish from Function
>    devices pointers
> 
> Charles Keepax (16):
>   ASoC: SDCA: Rename SoundWire struct device variables
>   regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
>   ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
>   ASoC: SDCA: Pass SoundWire slave to HID
>   ASoC: SDCA: Pass device register map from IRQ alloc to handlers
>   ASoC: SDCA: Update externally_requested flag to cover all requests
>   ASoC: SDCA: Factor out a helper to find SDCA IRQ data
>   ASoC: SDCA: Rely less on the ASoC component in IRQ handling
>   ASoC: SDCA: Force some SDCA Controls to be volatile
>   ASoC: SDCA: Parse XU Entity properties
>   ASoC: SDCA: Parse Function Reset max delay
>   ASoC: SDCA: Add UMP buffer helper functions
>   ASoC: SDCA: Add completion for FDL start and stop
>   ASoC: SDCA: Add UMP timeout handling for FDL
>   ASoC: SDCA: Add early IRQ handling
>   ASoC: SDCA: Add HID button IRQ
> 
> Maciej Strozek (3):
>   ASoC: SDCA: Add SDCA FDL data parsing
>   ASoC: SDCA: Add FDL library for XU entities
>   ASoC: SDCA: Add FDL-specific IRQ processing
> 
> Marco Crivellari (1):
>   ASoC: replace use of system_unbound_wq with system_dfl_wq
> 

For this series
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

