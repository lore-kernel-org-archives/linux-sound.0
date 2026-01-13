Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC14D355041
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 22:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343387; cv=none; b=QAoi/vK/3bUKMxk/LUtz6hCosEoWGYzSTemuMiNvSeSW8Z7OYI5+zC9bP5h+LocDICFxt0QfI9Z633pVgp5jwX7iMmmT+69kHo+YN2BuhYf962Djon2RyfROugBgWXTufZ+t0jZbdabWd69Y0KbtXY0rE7k2VmS34eGpGat3174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343387; c=relaxed/simple;
	bh=bVhYvNTXF3SlyvcjHWEUmmBFYvLe6ZUBzWb0rR250YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSQeUP2spV9pWt+P1QBGj6GeDoUlThH55QGEf3Ka7FmSkaDGEetz78z9uEresypDTijckjwG/glHQnP/+yoGUMaMyqjZG0O20Je1x0CzYnP+WamZ4EnKr4VTDkOzGqXiFTRV2+KttlkpjLXUP92pe7iJ3/Z4HGCY8VTnmK5aXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LhQPFxsL; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LhQPFxsL"
Message-ID: <2e1b5ce3-94c8-4e74-9358-aeec57dc7a87@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768343373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0jcwHjD7hRI2Iii8S1pM6uCgHZGfw3cbEt/7+4WatY=;
	b=LhQPFxsLOJOwPfA1AdfZueBhZ+BvmZqEtgy6U+Nuh0pQg3id+QHKlI9VdMzsUA9+k/gaMs
	wev+jj45oOsxMx67vaVg0StYWYwmNgwS45sbL9Cg8DWpenfL8cyDxm2PKxa9ExZjjeeb+R
	7NcQ05PRHPrmoS4s0Fj8hEqv8iVxSWE=
Date: Tue, 13 Jan 2026 23:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] ASoC: Fix sdw_utils calling wrong codec init
 callbacks
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
 <aWYoqQAYydHkrtQX@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aWYoqQAYydHkrtQX@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/13/26 12:12, Charles Keepax wrote:
> On Mon, Jan 12, 2026 at 02:07:55PM +0000, Richard Fitzgerald wrote:
>> This series fixes a problem with soc_sdw_utils.c calling the wrong
>> codec init callbacks, because it assumed that the DAI name could be
>> used to uniquely identify the codec. This isn't the case, especially
>> on SDCA which is a generic driver for many parts.
>>
>> The second patch is the actual fix.
>> The first patch is needed to add a missing export to SoundWire core.
>>
>> Richard Fitzgerald (2):
>>   soundwire: Add missing EXPORT for sdw_slave_type
>>   ASoC: sdw_utils: Call init callbacks on the correct codec DAI
>>
>>  drivers/soundwire/slave.c           |  1 +
>>  sound/soc/sdw_utils/soc_sdw_utils.c | 43 ++++++++++++++++++++++++++++-
>>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

It's not obvious from the patchset title that the first patch probably needs Vinod's Acked-by tag
