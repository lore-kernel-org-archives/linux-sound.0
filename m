Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D03E3DB7
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914515; cv=none; b=s2enybwsY7u9jNJ80JSbTuuRWMvTbNqmJkbZjGSkJmsIQpKbgqM2tv4IpYtZJ/1JZj7dY3KMtUx6hIryDdNX0ITd2+4/ncpPNDH3IUz5tB5EBEyOFYUExf+3bzqKH3BjMMnFqSV/9xcHhMHpIbSOiuJV/Moqe/JcaKIyvmzkAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914515; c=relaxed/simple;
	bh=oFVBrnVivdE55V4KYCO8uPs3OH1Vnj/Wt91B3ueBQ20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZ7EDbPQwEY452VU0xJUfm/SMdPVbb5904L64jARngMPfKFNHKOXtM/f8Z4sCdoBf4kHcd8FJhGC9OgO/JzBhp/r6FdSl5y70NyV/MKGFdc58qvr/sGlr+wEDMUQBOIqzpVlhNyox83439O0IQsIiDCfNYXtMkHy5ZQwWnujF7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gYcnqY8X; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gYcnqY8X"
Message-ID: <a8284c5b-765d-4d97-b7df-00e50156a998@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777914511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e20X23c3q5vPjWSS8Gzvwuv+tdPXd/VTT3rZiRyHwwM=;
	b=gYcnqY8XYY2PTLs81h5D9zEcz76Zmmy6T+QNh0ASD2BRiTcjM0e/mOZUQDpZHiVNNThoH0
	ilBrSAAk5/we79+XZJGzisyMWxIySHl9BWBKag3UF4C/TMOGOuO47EqsW8qyCu8hHoICwn
	fGs0BKS8SyzDzNr/nZ8VeiCjlqwjtaQ=
Date: Mon, 4 May 2026 19:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v15 1/4] ASoC: SDCA: Add PDE verification reusable helper
To: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-2-niranjan.hy@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260504125716.2015-2-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/4/26 14:57, Niranjan H Y wrote:
>   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> power state transitions. Per SDCA specification, after writing
> REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> is reached.
> 
> Changes include:
> - Add sdca_asoc_pde_ensure_ps() to handle ACTUAL_PS polling with
>   support for device-specific delay tables or default intervals
> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


