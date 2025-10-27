Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2272C15BB
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578720; cv=none; b=HjZOgMNEznq/leyf0Pmzt4kIIsTOIW6lPb2xz1pmqiktjEUlLz2rHJzi5zGiBmI3yt1ukyKc/4ZVj8zk8sA/C5p/c7Auexbrz3sEeGVIH3I4JUXjR8Mz03iI+ByVOc2ZJ4MloVg63wSNZgevpObU+zUKGgmH4rE9d2oQz3v2Ojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578720; c=relaxed/simple;
	bh=T8zAZKKfgW+uSWSNt5IGX/BHiCSiW08v+PRZ4Lgg+6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxT2Aj4uqpS8KxBcjREkSX+Dd1bR+zZHwyWbVILsRS9ii7Ms37inkg4CORmQughzeqLVsdOsE2fJw75LrrkeqqGOl+Ne6reEFqcv8RLrHM+6KFm/lYKK4/5+wBzhEUFyAAIjMS0GiqzuppXBreHMQJxh3JeVAWQsfoLTWHhrHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oUSNb/4A; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oUSNb/4A"
Message-ID: <56b67df2-4545-4882-8fbf-de5080dbb537@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761578715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMGZ5MzKKLr8JW7OLgrf4McDcfAULa1WMojMZu1nNlg=;
	b=oUSNb/4AkexPGXLdAneYc0CywP2gXbg39gG2lrwjlsUlxv2CF7f6ZMaaAUaYfrsusrxjvr
	JySpIj+fQxl3T8r9JaBA2IavQOt9Jjs6mkFH2t4tudoBdocp9i9agjnT4sAUg4A5yq6ZMs
	s9Ve9SWBXrOXVoY3BZYk5V+DFpwRiwU=
Date: Mon, 27 Oct 2025 15:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 RESEND 00/19] Add SDCA UMP/FDL support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 10/20/25 17:54, Charles Keepax wrote:
> Next installment of the SDCA changes, hopefully the next series after
> this should be the full class driver. It is worth noting this series has
> a build dependency on a patch working its way through the PM/ACPI tree:
> 
> commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT)
> signature")
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

I added minor comments on one FDL patch, but no reason to delay this series further, firmware download is a must-have for newer devices.

For the series: 

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Nice work Charles!

> Changes since v2:
>  - Add mutex to lock between UMP timeout work and IRQ handlers
>  - Clean up UMP timeout work after FDL fails
>  - Use IRQ number rather than a boolean to track used IRQs
>  - Reduce FDL retries to 6
>  - Check disk size of firmwares
>  - Reset on more FDL failure paths
>  - Reorder volatile control check by entity
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
>  drivers/base/regmap/regmap-sdw-mbq.c |  23 +-
>  include/linux/regmap.h               |  21 +-
>  include/sound/sdca.h                 |   5 +
>  include/sound/sdca_fdl.h             |  75 ++++
>  include/sound/sdca_function.h        | 119 ++++++-
>  include/sound/sdca_hid.h             |  21 +-
>  include/sound/sdca_interrupts.h      |  19 +-
>  include/sound/sdca_ump.h             |  50 +++
>  sound/soc/codecs/rt722-sdca-sdw.c    |   4 +-
>  sound/soc/sdca/Kconfig               |   8 +
>  sound/soc/sdca/Makefile              |   4 +-
>  sound/soc/sdca/sdca_device.c         |  20 ++
>  sound/soc/sdca/sdca_fdl.c            | 499 +++++++++++++++++++++++++++
>  sound/soc/sdca/sdca_functions.c      | 212 +++++++++++-
>  sound/soc/sdca/sdca_hid.c            |  58 +++-
>  sound/soc/sdca/sdca_interrupts.c     | 271 ++++++++++++---
>  sound/soc/sdca/sdca_regmap.c         |   9 +-
>  sound/soc/sdca/sdca_ump.c            | 262 ++++++++++++++
>  18 files changed, 1573 insertions(+), 107 deletions(-)
>  create mode 100644 include/sound/sdca_fdl.h
>  create mode 100644 include/sound/sdca_ump.h
>  create mode 100644 sound/soc/sdca/sdca_fdl.c
>  create mode 100644 sound/soc/sdca/sdca_ump.c
> 

