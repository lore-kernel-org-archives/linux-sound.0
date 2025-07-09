Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC32146D45
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752078152; cv=none; b=Y76Sx1N7NmPz4oNDjNVJ6CE2vhG7T88MyvkbciYs678f899W8CWpUwJ2gMPwiHwedTCippTt16BfmwfEuhYKUg4cfaBF+dVx28yT6gYj8zXlLvqsyQi7SqJM8Dd27YrzjtPkFDH4olCnTifAK5dUR+0eWzxOt65Df6pDMXpU0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752078152; c=relaxed/simple;
	bh=IX2Hi+DLgP0jrQHwwdTG74taiSmEACFFgYUn9LPDhqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cT03wpsLgc3o7g2FLHnDDUq20Qn9tRYHHki7iog0/4MDw6UId6vfe2ZqNGAg8KFW/kwCmcWqHQCbHLm8vRS39cDXNdkT7X+MvjOKGT/wdX6u6k6RvSb6CTWvQrHEXPTFVxaHDh1zafgO9y4QrCDXDQxFBi5bSBxt85++w/EQXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VME3Gbnt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VME3Gbnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752078151; x=1783614151;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IX2Hi+DLgP0jrQHwwdTG74taiSmEACFFgYUn9LPDhqQ=;
  b=VME3Gbnt1FRiq8QblOQ0CihUQbr6EKrshtQ6XGj6K1T6osd2wSN32RhP
   a1LEuDmJL/HjtkIGbxi+gEYp3tBIVxCWiWn0/OOZ+lfZOM/LsoK1W1FS/
   I8eUnpKZkPyEj2o7vJdylQpHzAndI3hMJpEbG73wYepq/5ul0taimdSlr
   7pJ3SWySz+30CrCAw0qSvGI7UHURnwrStdluuN3aXYG5V4qeYcLnlOxlC
   pYGhes2toPPBowAyFC8ovbUL3pjbMRk5f44rl7AqdzISExihpK48gpNLM
   lQyPSM8AhoxUe+M1neUqMHk0NZQ8B48FUoDXGQAohXcaf1zgEg52TuqCW
   w==;
X-CSE-ConnectionGUID: 7Wdu/pwPRJm0I5LrKiC/SA==
X-CSE-MsgGUID: MHazL0dUR0a6CsJkUqszWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79784646"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79784646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:22:29 -0700
X-CSE-ConnectionGUID: QH+NJTHuRUGiP6eGxokRQw==
X-CSE-MsgGUID: zkFo5VavT9SitT2KjUT6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159846897"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.199]) ([10.245.246.199])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:22:27 -0700
Message-ID: <831a87a8-1244-4f21-83d1-29d7dd8ea9cc@linux.intel.com>
Date: Wed, 9 Jul 2025 19:22:42 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sdw_utils: Add missed component_name strings for
 speaker amps
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
References: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
 <aG5vmbWvHyKllpdQ@finisterre.sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aG5vmbWvHyKllpdQ@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/07/2025 16:33, Mark Brown wrote:
> On Wed, Jul 09, 2025 at 10:57:45AM +0800, Bard Liao wrote:
>> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>
>> Several speaker amp was missed when the compoennt_name was added, which
>> results missing " spk:" from the components string, confusing UCM.
>>
>> Fixes: f792733e08d5 ("ASoC: sdw_utils: add component_name string to dai_info")
>> Cc: stable@vger.kernel.org
> 
> Why is this tagged as a stable fix when the fixed commit is in for-6.17
> rather than Linus' tree?

Sorry, my bad, I assumed that the original patch is already for 6.16 and
forgot to confirm this.

Should we re-send w/o the Fixes tag?

-- 
Péter

