Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0855E40
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715173230; cv=none; b=qWp0icQzVGtP/6WIG3vaglX/V40vhgJDfDFk6mk1erkC4jb8SWdLdW3Kho2KCXgI6WN0hg5kVzuG9jzZyqKqSLOlDLUvaszqNrDnSuLsgXlHL94hPZbPqu4Yygp251ddxo+Ud0OiF5vQ7CfRvc1hTql5Qt+amdiwgPw6P1ysOfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715173230; c=relaxed/simple;
	bh=p3b9HAuy48AB59lYfQxTeNKlyZOQS1GtQaTy6rE/uYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btU9xQ0LUEqZStXzUmQsQmOOmQxjUjUIUaCAEJp3lkoNafHnJcPc7fepvUosELal+O0xilOBlchcfuZL0DGk7sLKoVt9v1oJDfJ8/gXaVw6AjaoMfkrDGdsSmyGIASRSO1zflhHzvvKyfFe4slNAG3MwxMlO51gNFsRXnEupdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0g/sxJW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0g/sxJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715173230; x=1746709230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p3b9HAuy48AB59lYfQxTeNKlyZOQS1GtQaTy6rE/uYs=;
  b=R0g/sxJWTpcqf0mHAGsxbs/tjZ7AYgAVRwhkOU2UgqUd3t6s8WTL9iO7
   UAtfcSFMZUEEcZshzd5VFpZZ2LKQh4NiFru2KR4O/KdMLUHAgKTtRKIo4
   LHr2/odcKOVmV3AQkkOMrH3x5H8+cZs/ygp8MJYv+qROatUffVoKRvFwe
   EuB88vWFrQxQB1Z+McYVomUfv00M9phEXoI/sMA4HdgAeq3nH/ys0jDBk
   baOQnFMfYJe/h4tCgs2XFrRhTi35N9drCchCfnNs5ryla4QY7gUeNZLE6
   kL18JO5a8KIWBo8S03df8LNKvxA+4zVfA8pvm7goE+WhOuSj+youjjnxX
   A==;
X-CSE-ConnectionGUID: 2kBt/0SCTROpBuS4uIQCFQ==
X-CSE-MsgGUID: 0FNOxBkTTOmNaQScb8FkkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21629283"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="21629283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:00:29 -0700
X-CSE-ConnectionGUID: 32+dlIDRRv6drbrM8tnx/w==
X-CSE-MsgGUID: EqSH+knsRQquaBXGyaQmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28846425"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:00:27 -0700
Message-ID: <5107f281-20c7-4088-84c8-4ec04f3d3c9a@linux.intel.com>
Date: Wed, 8 May 2024 15:00:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/34] ASoC: intel: Use *-y instead of *-objs in Makefile
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20240507155540.24815-1-tiwai@suse.de>
 <20240507155540.24815-13-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240507155540.24815-13-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/2024 5:55 PM, Takashi Iwai wrote:
> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
> 
> Let's correct the old usages of *-objs in Makefiles.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Nit: there seems to be preference to capitalize Intel in commit title ;)

$ git log --oneline sound/soc/intel/ | grep -c "ASoC: Intel:"
2712
$ git log --oneline sound/soc/intel/ | grep -c "ASoC: intel:"
212

Otherwise
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

