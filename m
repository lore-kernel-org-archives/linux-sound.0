Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27B2144D7
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423722; cv=none; b=Oim9dT2p7e3dpu3CRVK9lIWjf1UBi0pmqnGA15rE9DeM2Ea7KY9DoE5GypLZXUo2E4aFEf08O8M0d9/4wU0c/qMJvUQBxtVeFGAvwoL7HMErr9dI/KkgIpEMYdHxqQEpu/LlhYfJ57gqaTXYjU+yX7DkdFPN5dLVbwnLLW/1F1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423722; c=relaxed/simple;
	bh=tMOz9Y6ViawhrZ9N6nnLGRuKDgQUfRbfnc1/xQ1mE6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqL3CoHZFmxIRz7twuGKzmFrOyBKDucw1ItBYayQTASeHq2ZxyEh7PD1Nkjmh3zNqTzyIlQZssHvsCG1fAEu5oOEwYNC83pSiY0oOMEKJNCH+Zjpw6g/xztMkaZLnEHR2pmaKGmFPHYbFRC78BxurHedctL+YK4VJdQEVv1hi9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TAetq+KR; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TAetq+KR"
Message-ID: <344c85fe-e5f1-4d14-8855-586e60becbe0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757423719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dM1x7ij+jBvOux3l0CastuCukC+rHKhbFX4wOt521Q=;
	b=TAetq+KRfyRV6gIKWn9xGIfFUQEheLpBjMyjC4dBZvt1HMqxGx+SCIeK4rN9/VtqGBYV8s
	dUhb+bOC4oZbK6RoXNagAXeefTKxR+4R+L7uJ2tggBMhkWLDawf0EXrryky3lw5sfT3duX
	m908qPY2cx9Kz+BakYYk00XWMdwb73o=
Date: Tue, 9 Sep 2025 15:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 11/15] ASoC: SDCA: Add FDL library for XU entities
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-12-ckeepax@opensource.cirrus.com>
 <9504c1fc-d65f-40ad-afd6-cc4bbb880b23@linux.dev>
 <aL7XMkyQr77zaPqO@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aL7XMkyQr77zaPqO@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/25 15:16, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 02:14:00PM +0200, Pierre-Louis Bossart wrote:
>>  
>>> +config SND_SOC_SDCA_XU
>>> +	bool "SDCA XU support"
>>> +	depends on SND_SOC_SDCA
>>> +	default y
>>> +	help
>>> +	  This option enables support for the MIPI SDCA XU Entity driver.
>>> +
>>
>> I completely agree on the need for a common library for file
>> download. But that functionality happens to be part of the XU
>> scope. Other things might be added by vendors for secret-sauce
>> controls.
>>
>> IOW, this isn't XU support per se but FDL support only. An
>> actual vendor-specific XU driver would rely on the FDL library
>> and add more things of top.
> 
> We can rename this to be more directly FDL, that seems fine.

ok

