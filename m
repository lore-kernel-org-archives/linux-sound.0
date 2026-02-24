Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261836EAA0
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931236; cv=none; b=MF+nIJlrrByG3gsNkIV8RoH9ldOPqPS86YNi0giKUxJ/Rp5HbB+gdgszr7WM/nD1RuNHotlbJaV8Tz7gFGloLc3iAGnMJ3EztgfXP/TSyFTtRi/rQqei8lmHQDzzWWgyWk1aQKjXkuhjSLWNYFkDLvlR/k3grb+hVfKcnQI6riE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931236; c=relaxed/simple;
	bh=Vc11rfCjD9YqKFV0ILT8ry9EocXP0Bj+cQIuEhcVr4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rifYIJFqctbS8tT7NOk5Xkq/fCTg8KYzjZ9iavj2GeGUrIAIkZjkeqBCgC9FJgSDX4BZG7DveTPoDRRpmA/hqb0k+dyOn2DxbhL8VUteq+fDSqEEkm6uEdK3Q8qiwy4zN1kf7LeqQOHHV2xlI8UH+7dmwGXXO0o2zzqEFtpYGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TB/M2Iwr; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TB/M2Iwr"
Message-ID: <def2307f-6e6a-4a66-983f-047848533e19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771931232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qoIiDBkEvTa+7o8mL/vp6Cv9lCM8GsurLki7VkpmQ0M=;
	b=TB/M2IwreFdJhPzEu4/RBDjuwp0ldD2VIjgW2oRmfbSyp3bDRkImVuM7/Sr9Sfnz/S242Z
	a+S3r+EtyTXhry64HIyuaGDe+m1AH5QayMWbOlbQerkw0F6XqJnu4cwJvmhjkAJuoMvRwd
	vWjlO6jBr7xIBd9uZmUJkrawUa2GPCI=
Date: Tue, 24 Feb 2026 11:58:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] SDCA Improvements
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/23/26 10:54, Charles Keepax wrote:
> Another fairly mixed bag of small SDCA fixes/improvements. Fix one DisCo
> property that was treated as mandatory but is actually not present in
> the first version of the specification. Fix the counting of routes for
> SU/GE DAPM widgets, this currently makes assumptions that are not
> guaranteed to be true which can result in too many/few DAPM routes.

Both valid changes indeed.

> Then finally a couple improvements to the volume controls, simplify the
> mapping between ALSA and SDCA volumes and pull the volume stuff back
> into the SDCA code. It just wasn't sitting right with me that it was
> being handled in the ASoC core given it is unlikely to ever see any
> reuse outside of SDCA.

Sounds good to me as well.

> Charles Keepax (4):
>   ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
>   ASoC: SDCA: Update counting of SU/GE DAPM routes
>   ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
>   ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops

For the patchset,

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
>  include/sound/soc.h             |   1 -
>  sound/soc/sdca/sdca_asoc.c      | 114 ++++++++++++++++++++++++++++----
>  sound/soc/sdca/sdca_fdl.c       |   5 --
>  sound/soc/sdca/sdca_functions.c |   6 +-
>  sound/soc/soc-ops.c             |  63 +++---------------
>  5 files changed, 117 insertions(+), 72 deletions(-)
> 

