Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28D50285
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179940; cv=none; b=IDoSSiW0Xqp1NIdrOHBoQg8uZju/6rVO3jn5SfEDgKIDed6d9VyzL0aaks4yYy2OLLexAxo/bpdAbfOTSuR/D6s7qC1u4QMVEbBrvN8BUHAWosD315aVSNJ3q+QApHCa5M5BA296bXzKXUZsLdbSjqI7iKYNPx/va8jwuDdF3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179940; c=relaxed/simple;
	bh=R8WBzVxQ4TCBcB5LXIow0yyi17CfKqvu81Rh6if5WSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REffYgK9Y1m8cb/u1HRqj2DkReeUMkCPFZLo4xFdtyls9DNYLbaeR+iLoaJeaOKNyKorr3YpzGfgt3QovaG3GRfN8uKP3wsBCeAysy1Q6BUeE+53SpI3YHaY1x+Ur+CElsXvTa5PDod9Muc3NyxGN6DYbe986AtVu/0q1M9IZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K8DjrRcO; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K8DjrRcO"
Message-ID: <834e34eb-b293-49b8-a71f-1ee14f3f9684@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736179931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgF1uX2mF9tT19leUAyHkDU0JlCK8JGGSBy3IgdFaTA=;
	b=K8DjrRcOa70Nv6slkG5fdKXJWoeGFhEfOObFmrIGMxJlLB+1JbuCRZP2nHtLLTEmfS5UoC
	rtLdeFEzkECFI3cAQXG3VTvO2OmrqwdwGi1l2x09IDR6hlsZiXQnqTXgwotA1G3hpdi/Sc
	UO7jcEVLaKWxgYgWvOZ0jD3CiOsko0o=
Date: Mon, 6 Jan 2025 10:09:19 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
 <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
 <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
 <SJ2PR11MB8424334022EBCF6B4C375DCFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E5B23AF2CFDA5D4D8CDFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB8424E5B23AF2CFDA5D4D8CDFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>>> This laptop ships with a different DMI identifier to what was expected,
>>>> and also has the DMICs connected to the host rather than the cs42l43
>>>> codec.
>>>
>>> If the DMICs are connected to the host, isn't there NHLT information
>>> telling the OS how many dmics are connected? If yes, then the
>>> machine-level DMI quirk isn't really needed, all you would need is a
>>> rule that sets it unconditionally when mach->mach_params.dmic_num is
>>> non-zero
>>
>> That is a good idea. However, we also test the case where the PCH DMIC
>> and SoundWire DMIC coexist in the developing stage. Maybe use a quirk
>> for the different DMIC coexist case?
> 
> On second thought, we will eventually create the dai links by reading
> the SDCA functions and remove those DMI quirks. Not sure is it worth
> to change it or even add a new quirk just for temporary used?

If you have any NHLT information, that's a very strong sign that the platform does rely on PCH-connected DMICS.
If you don't then quirks are indeed needed to select PCH or codec-based solutions. I think it's fine to add such quirks for now, it'd be up to Cirrus to remove them later on when all the SDCA parsing is available, which could take a while.
