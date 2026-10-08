Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E52FD69E
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470458; cv=none; b=iy1elszLZN4je9GPTGG3IlgnVoVKCrqzZmxGxDgCz8rzOuKOVf+tCgZ+usiLOcmRA6xlLEBUvsG6Plvy8WWqmP3go7apbU43d2dlLm/iM/BpA4uspbeWXn0Bn59itwxMtznwYDOFwD3OwmV34kwMIAcLyl/L00XwqZhtbzrWxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470458; c=relaxed/simple;
	bh=iIAQzkx7gFtlr4jgvhCECYYG1AIdRppnBIYooO3hVfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3qzqhdM2zxvcJ0AYvhRH248OZ6dhpIyb260GGd0x6X1kMs9tEvDuKB1fwN2EYjDjTETdb1R3jLCw7iZ+dchx4oqZiCblop2kKbNpQVodMpgD0mM8piDU8gTE/YAqioS9wsuR3CH3hAPhExMZHDSf3QQgoB2MwBkUgwdj0X//jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkhchEAh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkhchEAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791470457; x=1823006457;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iIAQzkx7gFtlr4jgvhCECYYG1AIdRppnBIYooO3hVfs=;
  b=bkhchEAh9mNdDr6XUS/yfxHNVZzdi4YMIpqP+2AUZwUDs+h1Z/dhYMNv
   y8SXw4ZLJG6kce8iLltBoFe8skVZuR4P9UdkpzbwNkfySRrk5QvEqi6OW
   yOYwxIUmCi+NKN9HJPDstJb4RHkt5BVJLgUXijE9Euiktjdihcb0TrmB7
   qWOmli9TjfiT7AfIwdE787Wt0xj7Bb/cLRz1O9Y+7cmSzcxhPzaw+lKAu
   9k76X9ZvaZqktdSy/xMKcXaFVeLikthxG+++yKBfiOo2l6BqDTnSPEse/
   uXyf1TyECjVeofB8q5viYc06z5tWwBoyZU2/5dK608pg2jV7US6AClwgZ
   w==;
X-CSE-ConnectionGUID: fR98gbYGQDygscEx2oucYA==
X-CSE-MsgGUID: E8v1XzuzRgqszQYdQYIFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="265336"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="265336"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:40:56 -0700
X-CSE-ConnectionGUID: ZESeUTOtQsiq7gJaIqwgrw==
X-CSE-MsgGUID: yLqrsJHFTna9W/HDGLWT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="16234"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.74]) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:40:55 -0700
Message-ID: <05504292-57cc-4f1b-85f3-7c0fe26b8dea@linux.intel.com>
Date: Thu, 8 Oct 2026 17:41:16 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Intel: Make sure that link and host DMA is
 coupled after use
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev
References: <20261008090045.15008-1-peter.ujfalusi@linux.intel.com>
 <asdt0K3W_YqErRUa@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <asdt0K3W_YqErRUa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/10/2026 13:17, Mark Brown wrote:
> On Thu, Oct 08, 2026 at 12:00:45PM +0300, Peter Ujfalusi wrote:
>> Couple the Host and Link DMA when the stream is put.
>> When the hda_dsp_stream_hw_free() is called the Link DMA might be still
>> locked and we would leave the DMAs decoupled.
>> hda_dsp_stream_hw_free() is not called for code loader use or in case of
>> probes or trace use for example.
> 
> This looks like it needs a rebase - it doesn't seem to apply against
> anything I have.

I just picked it on top of you for-next, but but was created yesterday
sometime, sorry, I will check.

-- 
Péter

