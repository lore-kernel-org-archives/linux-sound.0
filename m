Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726633;
	b=wTswruV+1XuPTuCNJrwGBuunnHLbxaLVNgYRJzoV1ssOAar0B2hrqxo66Buo3/bWXMGm
	 YTwUTnvPCqZOesFMElZ08xDpriOt5S1kFYxhgqWE7HfdrAQOf3xObFEgKyPzbYnH+VVjn
	 L1USh0pzUi40/YLbfhdqxzjeuXNjcDKjJjHBqKbxFFT9WiItk4+UoaO0oKmAc/w7UfMmY
	 cksHTVPmDM1gcEDRn9Yows0KyHdFJrbOmsqsWiSoJsizTpGYDjBtszuuwD4mTBfpeIyQM
	 dx3rcwSWmtNEGCKcIzQ3fFpB7GT0WC/BiVYQFuOaW3oZwO+icJkCno2//PZHJzQSKkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726633;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lao6LJzaJ3Qalh9YZQw6NR3znQNVpF71VzIbnXWrGr0=;
	b=Pvbj5Z5cjtIuP3XZR9jejMF0G0hkmT+n9auTOLbILd5HrB72d9X+ngDsqH7j239ha4Ee
	 axtfHGlJWxS5ViS+Vi6BkMLHAG7LXvEzR2CWvfwoMmuA8b0DlKDSL+iTnVseXuYYtJNYj
	 I2BZg/e9DKKUq9l6QZT1YCszXiqGuq3pf8oMxs7UA7ZYmrHtlAzmOYRbeMeqNJP9EBZA1
	 TzMxoUX2OtU6WL+CcXRv389P/edQNe3HV4c0ieL3oAu1NNcu2zMdn69H3768U9U91ALxi
	 5BzRn1vgRE7w7ec/gCL2gdVVeWfeBaayuLk4SBUV72MJD5trKMRI2Ay/F3kitIVdpUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NLmtioVt;
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4151606A337
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4151606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NLmtioVt
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m/ibj+CJrr6gcQpwt3tG+9S9z5VbFOBOoeA/Ra6FQUw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793726628; v=1; x=1794331428;
 b=NLmtioVtwnokz39LVkWjlaKtMvhgcI/dA2smwzibPjN1O7W3zJCBqcwyafm18kb9gGjnCn/r
 Czt9GDwgIkG44K/OTGflWOZ1/DRUXNNgzfICvCSdmAdjylaV8yc6Q8H+VHvg1RjwEQmO+V9J8xY
 dPJv9mtlGluJ56WMV+e9RLQk=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 08ccdf66400b8021;
	Tue, 03 Nov 2026 17:23:48 +0000
X-Mizu-Trace-ID: 08ccdf66400b8021
X-Migadu-Flow: FLOW_OUT
Message-ID: <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
Date: Tue, 3 Nov 2026 18:20:48 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261103134958.2089136-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
> That's not the case for the avs-driver.  It simply asks: "is any PDI
> free?" and assigns it for the substream if one is found.
> No predefining.  Again, this aligns with how HDAudio streaming is done.
Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
PDI, no?

All PDIs are created equal, a dynamic mapping doesn't make things more
efficient. It just makes things more complex to debug since you don't
have a fixed mapping between dailinks/stream/cpu_dai/PDI.

Put differently, couldn't the AVS driver work around that fixed mapping
to avoid changes to legacy platforms that have shipped many moons ago?
