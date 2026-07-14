Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC9496915;
	Tue, 14 Jul 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044634; cv=none; b=ecpft3nFM3/wjdle30uuWkbo9FZUvVcqPrlIl0twT2nbXA6i9nOKKp+H3lIaimG1aCQpHyNfQo/r/2te1msapwUQm5VXQyTV6nRwr/5yOPFY4vnBdEy8OUIWtMMuVNZxl+yq4RI8Ih+pe6XyWDd3QUSF8Jf31x/b1i+39ZlvTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044634; c=relaxed/simple;
	bh=hDyismpOozAEVoOmgUQ54uCo1ccwIl3ZMVhVq1Kij1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixIpVxP3pFKCOdoHIVsTCx88pe5dClncs0W+Np/4lQL2uW2dP/SgafFj2/zPyV8yQbIU2lea08fR/UfW3iagC+KKpQehhwhemgRi9KrFIJxNzjB2RfE5Z4U6Ib7cZ9LSMTCI6/okVc1lL/2hrBfTJBlu+YNba5kpwxcE0aQDJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BaFalSuM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BaFalSuM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4EdELFsK3TvoDo1OMXUEr2bHgQdAjo0lXA1gte5k2tg=; b=BaFalSuMIYIBOpv5sb8ytE9jq+
	9UFkYQr90pmZseA7QDTg6VAsshHx1w2EUJ5xT9v4t1wzW762jSKWLMXiMWFv+wkcADAxaftVRTqb9
	4e20qv2O713Oth8rVW8uxvw12yDdTGNa8ojvklYCacQOVcchKiudwJ0mPTMeui6g4TPJFowpTpQjI
	wUlWEkQUVHLX8YnVFXUOmkR5+da1quumuUZbLlnR4iL01ibx55uEzJ+S4HR5wT873I/kuQAXPsSJl
	xmQ7FNrp8pG7SPk/sXREAAueh2OkCjpNPNN/KRTrlfx5uqGyk3Y2Epo61HnuUBzzeharizc2aToz5
	m/ddrYjg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfVM-0000000CbSi-3elQ;
	Tue, 14 Jul 2026 15:57:08 +0000
Message-ID: <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Date: Tue, 14 Jul 2026 08:57:06 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc
 format
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-2-rdunlap@infradead.org>
 <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/14/26 3:20 AM, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 06:44:32PM -0700, Randy Dunlap wrote:
>> Don't use "/**" for a non-kernel-doc comment.
>> Use kernel-doc notation to document the parameters and return value of
>> ntpfw_load().
> 
> As mentioned in submitting-patches.rst when submitting a patch series
> you should supply a cover letter for that patch series which describes
> the overall content of the series.  This helps people understand what
> they are looking at and how things fit together.

Are you saying that my cover letter was insufficient?

https://lore.kernel.org/all/20260714014445.569992-1-rdunlap@infradead.org/

-- 
~Randy

