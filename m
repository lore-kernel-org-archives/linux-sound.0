Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ABC37B032
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302645; cv=none; b=TuokYwLAg4KhyPwItnrQ+n3Wlw0IzXaNuonXvqtpNrvP4q+KI8R3o1Wo8S3HrTRWarykzNdvoXtMrdr1aUJGeCE3B80s5/c80wjgMcNmS9ZBHs60xEjqMKgJc99c/kRoV9qLDSGVg/R00SNXgs1CU+xux32299fsU3+GK01VfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302645; c=relaxed/simple;
	bh=0PQy1JOjAMvlvJHzriisCEinC27iAdqHWtoEHuvcIzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9lt2GwQecKQz5QCj5nRX1LUCT1+Vkv70WyXI5sFTmDo/92Ncw4nSknTRxccwhky0sZoXNiPmsverKZ7R6g6+4ttvmmdRzd49WKgodfhp3aL0QTxg25Akq7mhTku8/09lUVFy8JhLbEtvrntAOZH4dYz0eTTTG0vOg0JsrS6swc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o0ZlANqA; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o0ZlANqA"
Message-ID: <1bbfd9a9-45e1-4822-8804-c032cd7d7028@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PQy1JOjAMvlvJHzriisCEinC27iAdqHWtoEHuvcIzA=;
	b=o0ZlANqAdZAMNzheM4PiedxsjjgLFuXwcR4kQL6NSUkmgNy6VdbG7zxbAWoMpXnzGRj+LG
	34AjwHlvs03iNnS1ni4dueb6UN0DZYrXaiXiEnCdyAlUeVSwftQg/kK7MZkk65bKdkHvCV
	0LlCOsXUhD9DFgeij93LfB/kTEibHFE=
Date: Fri, 20 Mar 2026 16:51:10 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/6] ASoC: sdw_utils: add soc_sdw_es9356
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260319053959.9151-1-zhangyi@everest-semi.com>
 <20260319053959.9151-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260319053959.9151-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> diff --git a/sound/soc/sdw_utils/soc_sdw_es9356.c b/sound/soc/sdw_utils/soc_sdw_es9356.c
> new file mode 100644
> index 000000000..6f26a2e90
> --- /dev/null
> +++ b/sound/soc/sdw_utils/soc_sdw_es9356.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Based on sof_sdw_rt5682.c
> +// This file incorporates work covered by the following copyright notice:
> +// Copyright (c) 2023 Intel Corporation
> +// Copyright (c) 2024 Advanced Micro Devices, Inc.

Good to credit initial sources but you haven't added your own copyright ...



