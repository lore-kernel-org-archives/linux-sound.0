Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B12D0C8C
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101630; cv=none; b=VJECwmjM8s//WhBKz2y977W7wbxZu8Y+IpCdBxX7AEPRu8qM5ksPhqVfFFGe4Kv2U53yaxWBMiTcyBYE/VAQYGF6ySL2YQneTfz9uXQu7RymaKOxVul7jfLKruIskDh5bbAJAeRVDwWg1dtgmPAIGbshChkTMk9jpSh1P9XbINw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101630; c=relaxed/simple;
	bh=HKypV4u1z7AQtKEV8qXfKdvAJq3j2oYfgAV7NWh5XKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndAdp2zva8muw2+NQKsJ5yYXz2IJPzgdHY3qSNWj6wlEmU+eWPAvjmgveeiatx0LPSabAscEbVEzNVJjNhh3YeWYVV6MsWRAZWu6byelxjKBekhPrgGHaQXosGq1c8Y1SE+6FksbIV8gjNxujcjj5H89TC5Y7mRSqYwhXjhYFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz2t1753101613t8c8f9366
X-QQ-Originating-IP: MoVW0Qm5NMBWEz3uPCzh4xqGQRVxpVf/CTDZ4DOFxxU=
Received: from localhost ( [113.89.235.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 21 Jul 2025 20:40:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5610268674547387337
EX-QQ-RecipientCnt: 14
Date: Mon, 21 Jul 2025 20:40:02 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, like.xy@foxmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: Add FS2104/5S audio amplifiers
Message-ID: <0D06FAB8CF1A9D4C+aH41IrERxjlsEAPr@foursemi.com>
References: <20250721103805.531758-1-nick.li@foursemi.com>
 <20250721103805.531758-3-nick.li@foursemi.com>
 <83f7c489-7001-49cd-97a5-4280eba95fe0@kernel.org>
 <F04DD98A69286426+aH4sT_P0GvttoCOq@foursemi.com>
 <ea2f30ff-b2cf-4b88-9fe8-78950a03d882@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea2f30ff-b2cf-4b88-9fe8-78950a03d882@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Ml1iSfLyJEsH6uqGRR3+xP8QHNbfVYXsSnYeBOM/m6w/zcTzaa3nqqti
	gd0s1GORj2ZlGHcYo7lwpDdXW6p+ZQYJyXIRX1H1TVgePYlM8jJlGeIDii7WGQXheqDv4uG
	E/kitWCgNgGF86i5QIUfA93x2S1bwV0+ryodBfbQVtz37p+vWHyOXiWq5wA6tLqcS+ly7CR
	gPJ7yQ/L2sAbdHE7nn1AqSU4X8D2UWSoUinywvqo49Rgc6ZZ6N51m1ahg4GH9zWU1thRDgZ
	TGNBN8jS5lxCHx54ZxiLH1tFbS4yPvubRk/UqZZbAp74ZwOGgJIIneZxxqSPGzTM2/xeGMx
	gEF0RAnRW6D1WfYl2jPGvywM81NfUPuw3zUEtHXLVs7wiTQd2VCsKhVMZqlPPKJhmE7mAT1
	Jcn7RWe6Brxtzc9cJhrC3GB6zQ0fEm+jsN7+a6n4zYRlgkZno1Y5m29nQKEafWcfsgKrWJc
	DPQp7a0BKraJ7ZQ9t9EOOYLZ/PetIt6meDsRkF7a84djV3qpFdNzX0UaxsWpKpZ91MEHloY
	yzsNVG5gXNQffgcx13Z9XKG1wpPd90wGy3ZCUgJ6sXGnxipSNHCDMXyPg1gzwL8f3/5/CYo
	516txO+z8i6wHPGvlH1Yqwaf7OT3TgFeKVJ1rCgtBWvish3CcoxC1UrcqDpFwHbLi/Z4GyN
	4hdVobQIQw+btPsfR9x88CLPnvpr9Ninpj6++CMvy1PH+xDBjpzKP1J5MJkCUSYg2BW7hTE
	RKr8svdbWi05O7IzLbghR+CpQwsupQmyhHckEn1d/A42ZBQuUthCl4MHF2ZTGw142OqSyi8
	u3zkjwD2KxDIdXWCxaU5yf1tyQ6BlNdU0+vHpcY+wI1X0/P8niyp+XSwi3qJscf9pbvYbRl
	DcrFuPGX6K8tnNq7+73k9d5jLd9U7o6Govv+pGKEZikXV/3QP6c1KoYKaCP8EhOwsU8Vidh
	BJg5qMmzC2nDGUqJqBHBajSE/gH5/DkmhbAwTEmf2s+8jT7W/bLp0qjYYd3aluiTQdnmlov
	qHCaLlQT80UJJjE+wqTZ1qyulTiUvbBZWUp0WCj3hI2C1xQmoF
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Mon, Jul 21, 2025 at 02:15:38PM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2025 14:02, Nick Li wrote:
> > On Mon, Jul 21, 2025 at 12:48:24PM +0200, Krzysztof Kozlowski wrote:
> >> On 21/07/2025 12:38, Nick wrote:
> >>> +  firmware-name:
> >>> +    maxItems: 1
> >>> +    description: |
> >>> +      The firmware(*.bin) contains:
> >>> +      a. Register initialization settings
> >>> +      b. DSP effect parameters
> >>> +      c. Multi-scene sound effect configurations(optional)
> >>> +      It's gernerated by FourSemi's tuning tool.
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - '#sound-dai-cells'
> >>> +  - reset-gpios
> >>> +  - firmware-name
> >>
> >>
> >> I do not see how you resolved my comment from v1 or v2. Nothing in the
> >> changelog explains that either.
> > 
> > Change logs are in the cover letter:
> 
> 
> And as I said I do not see resolution of my comment.
> 
> If you reject reviewers comment, usually it should be mentioned in the
> changelog.
> 
> Otherwise you get now the same review as v1 or v2. Devices cannot work
> without power.

I explained it in the previous email:
The power may be connected to the baterry/adapter directly,
it may not be under the control of the software,
in this case, the supplies are use as dummy regulators?

And we tested the driver without the supplies in DTS,
so I didn't mark the supplies as the required items.

Best regards,
Nick

> 
> Best regards,
> Krzysztof
> 
