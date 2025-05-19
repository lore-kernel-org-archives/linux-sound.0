Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588E1367
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678091; cv=none; b=CF8V6/5WpQarhD1o5aqBp7qduGXQaooJcVL5+tiqVNxyHDxi9xlPX0nT6t1yvIoYkCwxNskfe64N8OvhQhE5NjO1/d2u9fZcfMDk8kNgEEqZPIl/8uAtPAPlaeinjC9nq2YkngBM3zmA3YalVbAnogfFsTdkFhqkVVowDqIpECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678091; c=relaxed/simple;
	bh=19iJKIAbpZ7SmuL7lnnW0tKv2q6FHIWNAb4oo5b3zJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHh6GzYxI6yq8S1n+tribb8ze6377DZ3YghWac9nj69nzHNuwZSCi/2hvRlHHipS3PZzGyiBouaevseeDE5wN6VqtL04cRP3B1OpSscuOlPJupUQ2ZbYmdbz4bT+Fi6wELUYVGsLzL5eOjL/sphkIxSUwO5JY0sGo4qsQ5xW5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ApiSP9QT; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ApiSP9QT"
Message-ID: <6fd54770-23fd-4fcf-aa7a-89502b1c8ca4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747678084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOVtUIsUpKMCs7ZKRT3i0A2Is5QbvRFsZF33I+4DznA=;
	b=ApiSP9QTcdsl8O76uwB6EOyu39Xl+OxzylEARPSBe0V3Wu+3IMSKk7H9u09iJUwi74bMz2
	/zGQgFefjVDPXbk9m3Al/4VtSRpdt2iGadQVaR4yiEZLgD+q0OePtmY9+Fe7zrOTLA8qm6
	Yjg4D4eCYZsCKz6FQfWXXe5sPXHsA6g=
Date: Mon, 19 May 2025 20:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/7] Add DAPM/ASoC helpers to create SDCA drivers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/16/25 15:10, Charles Keepax wrote:
> Add helper functions to add DAPM widgets, routes, ALSA controls,
> and DAI drivers, these will be used to create SDCA function device
> drivers.
> 
> This series should provide most of the core functionality needed to
> get a device registered and have a working DAPM graph within the
> device. There are some features that still need additional work, these
> are marked with FIXMEs in the code. The two main things are SDCA
> Clock Muxes (not used in our devices and needs some ASoC core work),
> and better support for more complex SDCA volume control definitions
> (our parts have fairly simple volumes, and SDCA has a large amount of
> flexibility in how the volume control is specified).
> 
> The next steps in the process are to add helpers for the DAI ops
> themselves, some IRQ handling, and firmware download. And finally we
> should be able to actually add the SDCA class driver itself.
> 
> Thanks,
> Charles
> 
> Changes since v5:
>  - Add small typo fixup patch.
>  - Move and add some comments.
>  - Switch from fixed poll time to fixed number of polls waiting for PDEs.
>  - Generate read only ALSA controls where appropriate.
>  - Export ALSA controls for SDCA controls with fixed values.
>  - Clamp control values to range supported by ALSA.
>  - Force export of a control for DETECTED_MODE.

Looks good to me, thanks Charles for bearing with my delayed feedback. For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
 
> Charles Keepax (7):
>   ASoC: SDCA: Fix minor typo
>   ASoC: SDCA: Remove regmap module macros
>   ASoC: SDCA: Move allocation of PDE delays array
>   ASoC: dapm: Add component level pin switches
>   ASoC: SDCA: Create DAPM widgets and routes from DisCo
>   ASoC: SDCA: Create ALSA controls from DisCo
>   ASoC: SDCA: Create DAI drivers from DisCo
> 
>  include/sound/sdca_asoc.h       |   42 +
>  include/sound/sdca_function.h   |   71 +-
>  include/sound/soc-dapm.h        |    4 +
>  sound/soc/sdca/Makefile         |    2 +-
>  sound/soc/sdca/sdca_asoc.c      | 1311 +++++++++++++++++++++++++++++++
>  sound/soc/sdca/sdca_functions.c |   10 +-
>  sound/soc/sdca/sdca_regmap.c    |    3 -
>  sound/soc/soc-dapm.c            |   84 +-
>  8 files changed, 1502 insertions(+), 25 deletions(-)
>  create mode 100644 include/sound/sdca_asoc.h
>  create mode 100644 sound/soc/sdca/sdca_asoc.c
> 

