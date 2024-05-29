Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFE14B973
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983804; cv=none; b=kwStkB2vyaje++C9UrANpPipgzp/PuFDhSydSeKW+8U8S9c6UN0SQL7/rJt+6X22Eo2grlgmc8P6fPIXXmGAQIqSJGuDWLI3hvO3M1TGNCzdwrCvdfuKZUxEbTzpI1VuhxUw3JqQ8QgMTpCbGNcXNhn42uF5rWEXpGT7rG+0pHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983804; c=relaxed/simple;
	bh=k3aKNBO4zspmrB+iQ3hfg/Lnw5Gl6O2eTIOuGCxluuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kd3yIFh9VCzOITWWcUQi3NbggT51fGycjA5+eMdlIx6IQfqU5Kju7Uk5j+4Pnz6GzUYnl5UyU6Q04vzT383TActBJv67Qj0rOfhiusN3eJKuC3e1264n0EvtrnOGTcuaHyo/8n5xXxJXNAvo6TAiXQX6iK/crEm5YLOcKkxbtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBF3eYoh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBF3eYoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716983802; x=1748519802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k3aKNBO4zspmrB+iQ3hfg/Lnw5Gl6O2eTIOuGCxluuo=;
  b=mBF3eYohLotHVMk6Nn7fDjUjVl4RnAPIpCDFr/2ZtiKUNdtXvZp9BkxA
   ThcZVfYuYB1gQxXpR5dIjjEOQ7Hp7lwLysWyA8anR40mLxS0mGUKJHucH
   VTlq8akyE4eVq8T6t2k3wq4rJSgscCpyVW539EQzVPivIZGc6Ycoz1KlJ
   YXJVX+GiA5lCcSkZddlo9XxqfG6it8LvZ8m4PBXlcEHiWl1GRyslaj0hH
   rZSOislYArrSHtfAhHScJ5z8/ODNjFzsNNisDkO0JsMZd+S1L/wPT8Zq/
   KeqXZmrb8RGHaUErqow7sT7u9L/+ZWUciOGyysaFm/CrTV/yKSjmJeJar
   g==;
X-CSE-ConnectionGUID: ukQRA4MNR++e6RZRQ6yjgw==
X-CSE-MsgGUID: p6wDmJZbRdWTgLZ54MNhMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24034773"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="24034773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 04:56:41 -0700
X-CSE-ConnectionGUID: 123Sv1kOSVus/ryPy1pk8g==
X-CSE-MsgGUID: tpLHy7iAQDyhWoPaa5uJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35496958"
Received: from unknown (HELO [10.124.223.77]) ([10.124.223.77])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 04:56:40 -0700
Message-ID: <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
Date: Wed, 29 May 2024 14:57:02 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
 <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
 <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 29/05/2024 14:48, Mark Brown wrote:
> On Wed, May 29, 2024 at 02:19:37PM +0300, Péter Ujfalusi wrote:
>> On 16/05/2024 10:56, Peter Ujfalusi wrote:
> 
>>> The ACPI NHLT table always had 32-bit DMIC blob even if 16-bit was also
>>> present and taken as a 'rule' which obviously got broken and there is at
>>> least one device on the market which ships with only 16-bit DMIC
>>> configuration blob.
>>> This corner case has never been supported and it is going to need topology
>>> updates for DMIC copier to support multiple formats.
> 
>> Please ignore this patch, I will send it again along with few more patch
>> building on this to close the gaps with the logic of selecting the NHLT
>> blob.
> 
> Sorry, it's already been applied and published with more stuff in CI now
> based on it.

Right, I don't see it in for-next, for-6.10 or for-linus. This patch
should be sent for 6.10 and I can prepare and send the rest (4 more
patches) to close the remaining holes regarding to NHLT blob selection
logic.

-- 
Péter
