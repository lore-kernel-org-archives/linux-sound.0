Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93D1BC43
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990522; cv=none; b=BoeCsmBSxOUi9GIz2iVG6y7dmFR0j7UkjW2ypaX4bj3xxcc2o8g+5b/+YqMQTMxoHdKhwMbdxYl3vmIqZS5cWlLR4g7peTFfKeDE+Oz4rOqT5SptAjseWub++tkJPcItQYEijxvxWh43UNElT9H/oqrnCO5rUcJmF/mKw7zuuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990522; c=relaxed/simple;
	bh=l3UikFxwwpwuDevmEyJBqFnkilOZU64JzC2Lk3VTLoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn0M725Q0E4p5Q0YxUt50Bc5JkHLb9dKkDd/JQCGEJfy4hPtxP7uEyaCHY98kRddaAlizyYWi1h/cJ7kThq+8UaFTvt0EmiOjUGJkzkdEzxcxAVy6ev4nT/KoaX/ToJ0ySClCKi1b7noHzd1r9lPgacnela9tX9ZkVUQgZ3dZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDKLGFrz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDKLGFrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716990520; x=1748526520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l3UikFxwwpwuDevmEyJBqFnkilOZU64JzC2Lk3VTLoQ=;
  b=WDKLGFrzpBt74Q5IibKu0hA1K9mzzQqPN7b2IDHZqEYhfCWR09v3cQMC
   Uo/dD/DNw1lSmuNC1oT1UlOU6g7HzO0UzDNeuBQ2QfWyRyJ/aaI0Oyl4Z
   qaktaRS3/YhxcAXw3ySWqDLFEGC21HbXASn1jkAyMuawItVUDZ+Px4FJ6
   i8dkpgkN5m4LqAtyYJ1xhKIH8+FIbr9U/q9pqLUKCamtvqPk+r/jrO3j3
   QlAT8VcqD2uaXRd77MxYk7NSTyFGkqB2ijaZ9T92N1GXKB4uigkn3q5ge
   o/anTr6qcJCdpgNygMKBK/x6qxeXfNNfBzqv/taPUSAnDPB6PrN1PSv+s
   g==;
X-CSE-ConnectionGUID: mEUf7sGgTn+rLt1vQ/el+Q==
X-CSE-MsgGUID: 4MPu/pEtQm68avmr722+wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30917958"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="30917958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:48:40 -0700
X-CSE-ConnectionGUID: HK+a0t28RNaZ+YURLVkffw==
X-CSE-MsgGUID: 24wMw02DSse07n1MLRou5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="66639075"
Received: from unknown (HELO [10.124.223.77]) ([10.124.223.77])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:48:38 -0700
Message-ID: <acd6b6f2-710f-43c2-8666-77ac64dee6fa@linux.intel.com>
Date: Wed, 29 May 2024 16:49:01 +0300
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
 <80498cd3-609b-4ec0-aedc-3ef6d4bde408@linux.intel.com>
 <cec50849-66ac-4557-856c-a6a423c118f6@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <cec50849-66ac-4557-856c-a6a423c118f6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 29/05/2024 16:36, Mark Brown wrote:
>> Well, it is adding support for something which has never been consider
>> as a valid configuration (16bit only DMIC blob in NHLT table of a laptop
>> [1]).
>> I have added to fixes tag to carry this patch along with the patch that
>> implemented support for preferring 32bit configuration in firmware (the
>> [1] would never worked, so that is unrelated).
> 
> Fixes tags are so widely abused that I don't generally pay a huge amount
> of attention to them, the pattern of new features claiming to fix the
> commit where something was introduced is very common.

Understood.

> In any case, if you're going to send a series for 6.10 I guess I'll
> leave it for now.

Should I include this patch to the series for 6.10 or wait until this
patch is available somewhere that I can base my series on?

-- 
Péter
