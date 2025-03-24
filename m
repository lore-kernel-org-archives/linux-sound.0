Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCF1DF72C
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742851426; cv=none; b=Si2J7VdjgT1mqckEF8WGnekQqg471GMjrJy2HCqWgT6173w7sPGkfFM6vQGAmYoc4WnqktLJ4rKmlq/hCYnjJHOcUWwj5rs6xp2ypPvQ94oUXeBPOCZbYL9pIrBHYtixcFA5SzKUFTonaD+S3ZX3RIsJSv5weOFV3wutTK+YdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742851426; c=relaxed/simple;
	bh=UTUdJW+tKk3vPZgT3TJ0AeN9SvekcKX07d1L4HTLMJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvX00U4sOlteL/+rMDAc+jrrG/OCmWQfc41fQDw7Y22dxxEc060SpAhPjLGVYoqSwdfxLq8Nc2ViYZj3rm/x2Ye+6bghAJSJr5/eXIgvO+sO7ZC1kx53okeLJY37r81+03mKAwWamW/b8Ai4PU1ZQqXggWPfaQjDvPDoTGgSTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vsqvG6+r; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vsqvG6+r"
Message-ID: <6b946a9c-8c62-44aa-8127-da06d23fbfaa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742851412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkafT/a29tMauOrN+7qyryvVtizh0X2ZoWPRcBdOIhg=;
	b=vsqvG6+rheqIoX1skLe40fwx1nmLhUIdshosnAdhGgFu4J5pYAv62A8UksQlze7gHOtJy6
	KXEMTgvRgvZ1bJXE/BV1JqIrQdsDmF1vnG3zu7AacmEFgzUKSYbx43k2yfuOfrxltEGgJw
	76Z7qNLpD1+bt5Y6+HK5tqyKVPWNZpQ=
Date: Mon, 24 Mar 2025 15:51:04 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH for-next 0/2] ASoC: Add Intel machine driver support for
 CS35L56 on SSP
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250304145010.288082-1-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250304145010.288082-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/4/25 08:50, Richard Fitzgerald wrote:
> This adds support to the Intel machine drivers for CS35L56 codecs on
> Intel SSP port using TDM. Also adds the match entries for this on
> Tigerlake systems.
> 
> Richard Fitzgerald (2):
>   ASoC: Intel: Add sof_cs35l56 driver for CS35L56 on SSP2.
>   ASoC: Intel: tgl-match: Add CS35L56 on SSP2 for CDB35L56-FOUR board

It'd be worth explaining why sof_ssp_amp.c is not good enough?

It's been used for CS35L41, what's different with the L56 that would require a new machine driver?


>  MAINTAINERS                                   |   1 +
>  include/sound/soc-acpi-intel-ssp-common.h     |   2 +
>  sound/soc/intel/boards/Kconfig                |  15 ++
>  sound/soc/intel/boards/Makefile               |   2 +
>  sound/soc/intel/boards/sof_cs35l56.c          | 254 ++++++++++++++++++
>  .../intel/common/soc-acpi-intel-ssp-common.c  |   1 +
>  .../intel/common/soc-acpi-intel-tgl-match.c   |   5 +
>  7 files changed, 280 insertions(+)
>  create mode 100644 sound/soc/intel/boards/sof_cs35l56.c
> 

