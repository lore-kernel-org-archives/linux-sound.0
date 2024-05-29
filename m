Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F977363
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985926; cv=none; b=LM99ZLZmQVGYHtlktBHSkNf2zkfedRP756Dy/LAYJECWjZ4ayXYJLL9VNAKCx+1QGDioHhDzVnk4gi5YSr7yO4hybHqXOjPSFDDfcXfKOa9tX8QwZL38q6IebBtF1O4DwUVtlylDDcDKDUOx6YTgNfas0JAn//SsG3KKDqaa6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985926; c=relaxed/simple;
	bh=+H9RsBxTW4f9KMCRYy3ry+s0HP13yngDfWBqsNGJDoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKc3VbWR1SlD8YOVJuO3BI+gs4FtEh0v8Wcey/b4nEFq/mcSIrCYryjQrO6wdH0BNJBsZ23OB+/68A8gcOeVxE1cvSf1Gsvzo1fgcww8x0MAlW1bBiQZC+lXKTZqBZyNDbhNwBFQa2ngaFAchZrKbZy1lHErB+0h8hNMzFBHYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWPlTtVP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWPlTtVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716985925; x=1748521925;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+H9RsBxTW4f9KMCRYy3ry+s0HP13yngDfWBqsNGJDoI=;
  b=IWPlTtVPh+Qh7N5kHgF6Jp6r3NhG7b0sWaVyOAJFOT2bjzsL0p3u7ncH
   aCcQtXD4D2J5zpD9u6OuAWybzKAi3lzXmIYOMPOR29PC4QuSjZEJpGN4h
   +Y0jHrKYMJTabq4c0qbjxcAirCt+TustUEkxv91doCtKW7QFBJ07vqyMj
   xZL46Chx21jAZflcuwHv+KWcIBu7+Bk8S8TAk0lg0GLOZqXRqDiYtlsOc
   0pBbVb6S+s14XRgzdtiyWKj0ekVHdgosga0dsh5mTOTEuzqkSCoDyOG0W
   rmE3wxGfyLiPcKJcAUUk5czrtxXpC1nPON5HiakrUabUyzGWzrTsbDNK4
   Q==;
X-CSE-ConnectionGUID: wVxBypzIQpCQZLthDU4xYQ==
X-CSE-MsgGUID: BQopufZnRlOwBpR5RuyQ3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38769967"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="38769967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 05:32:04 -0700
X-CSE-ConnectionGUID: vsFfa547TOyxCm/hoU8aKg==
X-CSE-MsgGUID: brEedwesTPSX4nXq0gqMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="40419471"
Received: from unknown (HELO [10.124.223.77]) ([10.124.223.77])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 05:32:02 -0700
Message-ID: <80498cd3-609b-4ec0-aedc-3ef6d4bde408@linux.intel.com>
Date: Wed, 29 May 2024 15:32:24 +0300
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
 <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
 <cc7fc8b7-d470-4330-8cb5-6ba85065c74d@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <cc7fc8b7-d470-4330-8cb5-6ba85065c74d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 29/05/2024 15:17, Mark Brown wrote:
> On Wed, May 29, 2024 at 02:57:02PM +0300, Péter Ujfalusi wrote:
>> On 29/05/2024 14:48, Mark Brown wrote:
> 
>>> Sorry, it's already been applied and published with more stuff in CI now
>>> based on it.
> 
>> Right, I don't see it in for-next, for-6.10 or for-linus. This patch
>> should be sent for 6.10 and I can prepare and send the rest (4 more
>> patches) to close the remaining holes regarding to NHLT blob selection
>> logic.
> 
> If something is a bug fix it shouldn't have a subject saying "Add
> support", that is very obvioulsy a new feature.  Have these systems ever
> worked?

Well, it is adding support for something which has never been consider
as a valid configuration (16bit only DMIC blob in NHLT table of a laptop
[1]).
I have added to fixes tag to carry this patch along with the patch that
implemented support for preferring 32bit configuration in firmware (the
[1] would never worked, so that is unrelated).

The mentioned additional patches would future proof this whole DMIC blob
lookup by extending it beyond the bytes per sample.
These are future proofing and a would be nice fixes for the -rc, but if
not than 6.11 is OK.

In short, yes it worked well but we were presented with  unimaginable
vendor creativity.

[1] https://github.com/thesofproject/linux/issues/4973

-- 
Péter
