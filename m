Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A811E7C04;
	Wed, 15 Jan 2025 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933411; cv=none; b=JJggO+RP1PgJ2tRcq6L0s8wCeS9aT1b6zK5B/UJQmv0nf1XWZiGmXORYZMx1iY8aUS9EA2hvzZk6YmAdi/Bf7wtHWz75kt9L5OvdFH7VpE5HBSKZ0hOXSzCSQhNH0WtAQM0dQvhet5L0FOzlLslTK4Oprg6/5AR5bRL/fcii/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933411; c=relaxed/simple;
	bh=PnjBgcDpunrxhqPcw2vL5Cw+GGc8j0d3qaaFPC/JKRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DBA3+3gbbfU84M4gnWJl/Y40pSjcvDJJeb4o5N0Oy8P64X7686yu7+yLeCQnVPVBZR2d5sXrAw/6CXzUcSE9/MyPC8Au8uvvMadduLCLbjSP6wSQBObP8Mg4P2LJFRDKVrhsDSp2dzoa6iOgpqOHW7bxiTgJphYCqoqbbAwldQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnTanbFj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnTanbFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736933410; x=1768469410;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=PnjBgcDpunrxhqPcw2vL5Cw+GGc8j0d3qaaFPC/JKRo=;
  b=VnTanbFjaJ3FyX9wDrp741q4liaekI4bPNWomHt5DVg5OieOBxA8yX4f
   z1+om3r//7q4r+YwRU8+P6Jn8GLxxbXSZOUt1jExM5lLZqyLV4x0277Rz
   nkeqLT3yEWz6H/88pmEKEJj0UNCDte09sG7BOUnl3gqzkNlSsreqEK2Wd
   cJe4Lj2WNjZRjx3z9WGDtQj17IBbQvJ+HJp+oP1C0VmMUbaJ6Ef44UlQS
   4WhoCxZPhsTfMxX78DnWAfFsyIPJQHpPUJwIduzo7y7MYRDEWyYLdS9LF
   oDhGgQNndfP3NUy6qkifnIe64OaXTu1A+/5ezoLRkSyTPucQ8y89NEVHH
   A==;
X-CSE-ConnectionGUID: FSCcQW7IRtC/TT10VLX7kA==
X-CSE-MsgGUID: zvTTptrNTCSNiKDw1SAcDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36473889"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="36473889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 01:30:09 -0800
X-CSE-ConnectionGUID: 0oUH/twIRjSXfwb6AOme9g==
X-CSE-MsgGUID: xOlcsy13Qv6lCiXqZbnlbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="105670026"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.106.14]) ([10.246.106.14])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 01:30:07 -0800
Message-ID: <2c8b7b48-ffd9-4593-a4da-b119a2036384@linux.intel.com>
Date: Wed, 15 Jan 2025 17:29:55 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250114200726.969501-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250114200726.969501-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/2025 4:07 AM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>


