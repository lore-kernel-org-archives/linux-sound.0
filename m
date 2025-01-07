Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B61F63E7
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280774; cv=none; b=H1WQaOcpUU5e2h+9DRYmR/ozkBkp0RF88oCNHBVNfcEFN1lNHwTf1wQfGZMXuv35DTuFdg9gjvJ/6uXTRiwyK12VUuSutkTDloT+xAod8HesO444v0fZdl0OeaKw96v6NtfVFH/mVoNjMWmfN8kdDOwK2DKqwJHSJa15Iv8Xf0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280774; c=relaxed/simple;
	bh=zMBk9a928u9kbLmCk/HkUdPE7HrRBACxgTbiV76I3PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dplc1pcelG5o3zi4iZMfJ9ViK4a8W3gd+CvYPbNhPtB6bIAhQN7x4OphXWvmeDh0PBM6aQjwSQ5GuPRPChgzKY3mzASLTBdyrzk/nRKfyBJ5nEg9n4qB/Ug+GfIqM6m0F2YsjKhTp+lubETIEq/nhcLyWUXn+mT0d3Efq7HMqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HcQWCEqN; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HcQWCEqN"
Message-ID: <f459b7be-169f-4ab9-9cb1-97db6e89a13a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736280768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akMmkrSAYpUIn/AauIKeqrk+3XDHhnlnbqf5tuNINHY=;
	b=HcQWCEqN2bS0nJrb7tHxObN3C//+asGH2cnJRch4BlUHQZF8MDw2lxM86VwRPIzQg5rRV6
	FyYdkdkDaloKcSy+HqHb9Q55oiZkpgeg/gjs7eBr2TLl5ACBDunE5+I7/BGBH3dDCJAZo8
	eP0PpyVS1x86XfNnBVDOKAZsHU2DxDM=
Date: Tue, 7 Jan 2025 13:56:50 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] Expand SoundWire MBQ register map support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, oder_chiou@realtek.com
Cc: jack.yu@realtek.com, shumingf@realtek.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/7/25 9:44 AM, Charles Keepax wrote:
> The current SDCA MBQ (Multi-Byte Quantities) register map only
> supports 16-bit types, add support for more sizes and then update
> the rt722 driver to use the new support. We also add support for
> the deferring feature of MBQs to allow hardware to indicate it is
> not currently ready to service a read/write.
> 
> Afraid I don't have hardware to test the rt722 change so it is
> only build tested, but I thought it good to include a change to
> demonstrate the new features in use.
> 
> Changes since v1:
>  - Fixed a potentially uninitialised variable.
>  - Added some extra rt722 registers, Shuming Fan asked for.

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> Thanks,
> Charles
> 
> Charles Keepax (6):
>   soundwire: SDCA: Add additional SDCA address macros
>   ASoC: SDCA: Update list of entity_0 controls
>   regmap: sdw-mbq: Add support for further MBQ register sizes
>   regmap: sdw-mbq: Add support for SDCA deferred controls
>   ASoC: rt722-sdca: Add some missing readable registers
>   ASoC: rt722-sdca: Make use of new expanded MBQ regmap
> 
>  drivers/base/regmap/regmap-sdw-mbq.c    | 219 +++++++++++++++++++++---
>  include/linux/regmap.h                  |  62 ++++++-
>  include/linux/soundwire/sdw_registers.h |  30 +++-
>  include/sound/sdca_function.h           |  33 +++-
>  sound/soc/codecs/rt722-sdca-sdw.c       | 128 ++++++++------
>  sound/soc/codecs/rt722-sdca-sdw.h       |  99 ++++++-----
>  sound/soc/codecs/rt722-sdca.c           | 135 ++++-----------
>  sound/soc/codecs/rt722-sdca.h           |   4 +-
>  8 files changed, 454 insertions(+), 256 deletions(-)
> 

