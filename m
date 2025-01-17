Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3E199FC9
	for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130468; cv=none; b=VnJFqvtV46Y8znb9KdJr2sjSYLAkApyT2q1j66hRu207k3iaCNb3O3P2WeKu90IGfdUofEbSzWBxexXYW0c3ZdRB0Eptk3KmfRgnh+gLuQRfcDoJJK9ld6woIe3X+PqjOVK5FzWZDg4yAgyhv1qecWTb/+cY19PWIInZXh4DTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130468; c=relaxed/simple;
	bh=qZDbHJYLvqUscVwMwT++s9R/i0/RaURbCVcL2de6txs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbue35VLWq+aPDyPuwWfMmU2rdlYNcRobTfOiMxSDPTlVqm6lCEHZeSFbScTPmZfoq7KNfgxENjayjGg2aFN0UL1VZYb9ers52705TE4HgZ7BUZuv2VMTVpj6MjJXFmMMqqxx+FyslqRtzeTdFBUnrTvSSSCIkl3PBZikYVFVZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N9gvtuST; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N9gvtuST"
Message-ID: <5ef1ac08-5025-4902-a50a-83915a54d72a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8AKpHZeuUd3l4cLe3j75fsbomJVuzoByNhsOGzW2Cc=;
	b=N9gvtuSTfAQRTFOY+QYpOmQZPeEGlhOtUP0qgZ7PEjF4f8RitZnx9ac+lD3HyYxuFfXcVz
	H3BOq3L/Kx9m4x+BbBcw7lmcsHEC6aC8aoJa3OtAlwxwyTXYuyh2C+bTZBkCFDuI62Y0OQ
	2OMkZAbsnfYDE4ZJjpgr9EX/GD9GVDE=
Date: Fri, 17 Jan 2025 10:11:24 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] soundwire: set frame shape and divider based on
 actual clk
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/14/25 12:16 AM, Bard Liao wrote:
> Set frame shape and clock divider based on actual clock frequency. And
> with that change, we can support ckock change in Intel platforms.
> 
> v2:
>  - Mave the check before writing the divider registers
>  - Remove the 'freq' intermediate variable which is multiplied by two
>    after divided by two.
> 
> Bard Liao (2):
>   soundwire: cadence_master: set frame shape and divider based on actual
>     clk freq
>   Revert "soundwire: intel_auxdevice: start the bus at default
>     frequency"

This looks fine so 

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

but one additional question: what is the default start frequency? There is an expectation in SoundWire 1.2 that the bus starts at the slowest speed to allow for potential programming of PHY registers before bumping the speed to a higher rate. I don't recall what is typically listed in the _DSD properties, it'd be a mistake to start blindly with the first listed value if it happens to be the max rate.

>  drivers/soundwire/cadence_master.c  | 22 +++++++++++++++++++---
>  drivers/soundwire/intel_auxdevice.c | 21 ---------------------
>  2 files changed, 19 insertions(+), 24 deletions(-)
> 

