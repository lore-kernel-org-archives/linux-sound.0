Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F019AA56
	for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130467; cv=none; b=G5bU4a066o5bb2Jve7VYPuC3GqxjcH0KvakH/H/pzV5jeWK6rkZZCPb7H/3kvJBtfA+W9fWnWvxVrtnsmlwrC3J/2gH5J2Y5k6RRTsCDrT5AEiNEEwtbn/lEgjmKsfSzRiTD76Ham4ttz/okTFvQg+lM3SIbXkuptNH6u2gzg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130467; c=relaxed/simple;
	bh=aYUKCvYrYMmtNamzKT1ssz69D5yhkhu/8walpJBZIZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSu7EMpCHlxCTtXAA0dOwyanDhpRLTrWw/YO5h8o+jE/2fVdABGeTTCxt02sTbVjhNOE9nGP/ITyO5fDbpjOmnARw6eNCCbECg+8xw7v+NXt102CdQ36D0ZRmn9Ef3PcCQ4zWPpNXhGxz5ZdL97jHbMQomWjrDdhFFyb5Kj+21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r/8rBx/q; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r/8rBx/q"
Message-ID: <3ae5da14-c1f8-4403-ac8b-2cd558a8bbfd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qf3hdg7R6W9LGqDsWde8DxR9I1W8KyA2hyqQplCvT58=;
	b=r/8rBx/qpOOeL8HkmFboNcQ1285U8Ae37+Igx3P+zXJH5b35XNEjDG2LqdGldKKCmKWXYT
	LTKqFyLZvbr6YBWWEi5TpW1ucf2pee047sZah+ujqziTB8KE8KUFoHxStA9kviZyWCCNes
	AdqT81OSFpyNuj63n7cAyLj0PoiGMW4=
Date: Fri, 17 Jan 2025 09:59:25 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 07/13] ASoC: Intel: avs: Add MODULE_FIRMWARE to inform
 about FW
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 amadeuszx.slawinski@linux.intel.com, Mark Brown <broonie@kernel.org>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
 <20250109122216.3667847-8-cezary.rojewski@intel.com>
 <7c857d1f-e520-4fde-9b84-19b071fd8390@linux.dev>
 <fe5bcb7e-ae6b-4915-ac08-3a1e0eca62db@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <fe5bcb7e-ae6b-4915-ac08-3a1e0eca62db@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>> +MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
>>> +MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
>>> +MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
>>> +MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
>>
>> If you start listing the variants of ADL, then shouldn't you also list the variants of TGL?
>> Same for CNL, there are multiple variants, not to mention different signing keys.
> 
> The only reason ADL and ADL-N are listed separately is binary incompatibility - MEU differs between the two. In essence, one can use ADL-binaries for all ADL/RPL based platforms _except_ for ADL-N based ones. The code is the same, the verification process is different. For all other major platforms, no MEU differences so one binary covers all variants.
> 
> In regard to the key, the approach is: it's ignored.
> 
> Whatever is in the directory under 'dsp_basefw.bin' will be attempted for booting the DSP. By default, what lands on the market is a production-type-signed binaries. Internally CI runs with prod -or- debug signed binaries but we do not intend to share the latter to the official linux-firmware repo.

You didn't get my point. There are also binary incompatibilities between TGL and TGL-H (different number of cores) and in the CNL/CML space there were different production keys and MEU snaffus requiring different binaries to be released.
This wasn't about the production/debug problem, I was only referring to 'production' releases.
