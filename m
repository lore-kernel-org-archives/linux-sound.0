Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2419CCEB
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242944; cv=none; b=iBHM4gZskeZZDDAkaRpsBAkNxa+KxkTvyShHQfSY7Yfvjl+TZv2LqeBQgof7xaBz1TbFvDiM+e2eKMSq3S2U7JyAN6T4xt9ZQ0P/W5UfZPUwpyamn3SCCZYkCfX7RM/UyXeU3bIPNax0BkckSCFuyA2x2Y+8Xnu3dDfrGiaGsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242944; c=relaxed/simple;
	bh=HiwUGh3h+O4D+lzmLCV51vt0qg2e8Je1TkPAjVdCxmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3U1YnQW6pO1Z05LUQ4uhY/MfoPTRnu58dbR/eZ5P/yBNBBF6rKnUDagtBjnx1Bc8NJ5oQbac/1L/pGOdiyVCr1tRoe9vrDMSJsMLlruddpO4QhPFY1xqKRy28Xh9SqzWFycaspCdS1Vb6cpprBHJtqB0x5XQD/1QNF+TGn4U1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU+bUkIc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU+bUkIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719242943; x=1750778943;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HiwUGh3h+O4D+lzmLCV51vt0qg2e8Je1TkPAjVdCxmw=;
  b=kU+bUkIcGIp1vCAyUCTjBEeh5ux/ZW1r1CZaQxYCW6xfrFVmLNslJO3C
   oiZAWx1mNbYACxDG2Vc6plqQlE4vusYOGjIMfHXnVZmLCMqbVstSCaenD
   4LlQZTd4R6HbZuSPPk90Os4/OlZ1e8A6hW/Mw+IABpLL6rrtiV6akA0Ms
   rJbSeH5A2B7AuQij/wsd2j6+IFiWzdciGNVUBEACPidFFdYavJJ3VMxD2
   aVEfX0cBw1I6rOswwV6RkhzH2v6VncGntIGa9T3ck5OCr0iPauDMhiFfX
   8kOP/2nbmmxrjm/sZRlcK9G6zaArZxaNAyUIq0mM+yZmzVXt7xmERk8G7
   Q==;
X-CSE-ConnectionGUID: wJyM6I8VTimCcfh6gq6kuA==
X-CSE-MsgGUID: VhKg3eMLRDOf+9gZN8OPPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19121780"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="19121780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:29:03 -0700
X-CSE-ConnectionGUID: 4ms7eq/DSAuvFoNIefQEjA==
X-CSE-MsgGUID: C3igsDhVTYi5ndlAgzS+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47703976"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO [10.245.246.230]) ([10.245.246.230])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:29:01 -0700
Message-ID: <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
Date: Mon, 24 Jun 2024 17:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 Brent Lu <brent.lu@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
 <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/24 14:37, Mark Brown wrote:
> On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
>> From: Brent Lu <brent.lu@intel.com>
>>
>> Add a helper function max_98373_get_tx_mask() to get tx mask from
>> max98373 ACPI device properties at runtime.
> 
> Similarly here.

I may have misunderstood Brent's patch but this isn't a fix really, more
a cleanup to use ACPI when possible, with a fallback to the existing
hard-coded setup if ACPI properties are not found.

I don't think it's a real 'fix' impacting users, in the linux-stable
sense, nor that this needs to be back-ported with case.

Brent, please chime in if I am mistaken?
