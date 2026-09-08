Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A584AA1DE
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876286; cv=none; b=aZn38y56nT6Ej7o8WmCAWS+JKh4zYzOzRG7cnmfR+iGV2mcYaayu/L9OABJluKZA9kDcv0NG7IbxjLHQmHl9Tof91noEDvxK4afyu3v5O9AtoQqEPhZv0fRwmPw0dSDLXk3NHVnfWRUG2Nvt8dNieKWktOC8lhw/HFHWQjV9X2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876286; c=relaxed/simple;
	bh=9uUDsImbeasDycL/XU1mmCxRqeiAkyRDWagrjGh0r3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1NcOJ9AlLR+nmBYBoRj7GDkPtFrKXifGL5jZ9Q67gQssk70uvn/b2B8KRWYqrlq9ZYKyQ0juh0V9Z1jq+x+KBp5R12d8eRYE9iCIyRdYz7qnlWZhanMh2Wzv0JPvm011aD0+rjJ+E85B3C8tiQxsy+qVAvHAb0ytdM8SGyseN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDpg1GA8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDpg1GA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788876273; x=1820412273;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9uUDsImbeasDycL/XU1mmCxRqeiAkyRDWagrjGh0r3s=;
  b=ZDpg1GA8b+GyeiugztAASNfF3qem8ZkfZW0F/B4EfDIlFfsTvz3bsMCP
   vPxLZ/CCTdc/0BofbN1HS7nLT+WSrPfO+yP3SY0/D6iWUK6dGoZruXXtO
   8XdBGyzGFlE19lqyKA9ZHWtGdY4BvkgRuGraA5c8qfDVNgC1xUsQJHC2z
   m76CRl5g7tF7Qrqgq4XaRF00NW0QPVH30fi/ZaPvCGGipCqu39vsa+FTL
   xq0vyBoKM6vJjJXB+/K5XXaFJmn/Do5RxMbWIX/gRqu97EjQqkFyncQvu
   iE3dk+2naq1WUXa5ChJNcbgL4fOrawiecFCFbE1tmryYUJKiuDqbINacb
   g==;
X-CSE-ConnectionGUID: A2W/LkkHTymjgI+mgLM9nA==
X-CSE-MsgGUID: Pjaq4SMsSoe2UVi0QxG/NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89036593"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89036593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:04:28 -0700
X-CSE-ConnectionGUID: jLwh2G9lS62spQbEPg3IcQ==
X-CSE-MsgGUID: Y3YFUTARSc+jWqLDjgT7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="295932832"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.108]) ([10.245.244.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:04:24 -0700
Message-ID: <86b92d9a-53bd-4ea3-99f2-87e7f439a246@linux.intel.com>
Date: Tue, 8 Sep 2026 17:04:34 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
 <d7dccf9b-1729-4679-b20c-29fe4988d4c6@linux.dev>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <d7dccf9b-1729-4679-b20c-29fe4988d4c6@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/2026 15:06, Pierre-Louis Bossart wrote:
> 
>> gapless looks to be straight forward fort he first look. What made me
>> delay the implementation was the fact that I could not find any way in
>> firmware to support the metadata as one - OK, I can just ignore it.
>> second: in kernel and in firmware I could not figure out _where_
>> actually is the end of the current file in the buffer. In kernel we have
>> circular buffer for the DMA and userspace just fills it and since for
>> the kernel it is just data, it looks continuous.
> 
> I don't think the kernel needs to worry about anything. When the next
> track is handled, the data is just added after the current write pointer.

Yep.

> IIRC all the accounting needs to be done at the firmware level, where
> you have to reconstruct where the next track starts based on the number
> of bytes transferred.

right, the fw does not know the size of any of the files, and the
decoder itself is a black box to us.

The kernel can tell the fw that there will be a new file at some point
in near future (depending on the buffer size), but both the kernel and
the fw are in the dark on where that might be.

At this point I don't want to claim that it is supported when I cannot
really test this, thus it is not implemented.

-- 
Péter

