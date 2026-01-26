Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74722228CB8
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439797; cv=none; b=XTwtiEy4k08YrzaVQVt43eGrubJc1H5cD/mDcamNjOnfsOhGItyu+0q8GcNpG6VGHs+zTi4H0NcdQT8dFTCFegax9LpQqF0IaTfE5whvbX9RVALqHbPAW+Cc5hc+tbcCeYPwvjY7LJVfs05U/AKPCp5TDZPA4mtd7GzZjs2RsyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439797; c=relaxed/simple;
	bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aW0q1s6qynfc+0s0+tdZGCedvay9wFYGyOYOHlIoyKF5DZ4q6qNgaMNTWl3T0aotWOyBh7qY1H5naijywLuGhNESTfGo1NEyBNluhaPfSFJnHVSHWSPFwqRV2JUHnTZ3nPVXdx7kY7AgrGO3XrmzmQWrmgiXwsPciUlcfjh2x+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF+6NGSH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF+6NGSH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so35028995e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439795; x=1770044595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=MF+6NGSHKgeZe4a+wv0hiVEvlkkhgkFuVgcQSYzho0b7JVQhig+e77GSEG0IMpnxN/
         JwIfDIjFJ2K0001tkPpEk18JKljrxVKSUA+cWXXpG/DXgRi0D661eSWLTYjoZNvUvmxI
         oThl3GYgf2tYtuVdJWB3Vms59CHGt8qovDXQ3olM1UxtgZVx8IvSnoJB3LKh/Ixeh9ao
         EqBgUqn2AT1Yl6JlHSdEq3klRsjaJFBmDMIzgRaY3Zf6in4BGYsfmGs+iRxSXrtRzda4
         Mxk1NVvHMZTfFbKFkwp4Y9Wrqx83iE451TN25lVlqNnwrQl+dSIXw1Tu8YaKi/ZSIA8M
         qECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439795; x=1770044595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=CAoUf8Nl/XkyCycK4LjajmYrNDtK2EGoU+FlIg/s36RVKMAH9JQyNKOiNfuOQBKwjV
         Z7P3uWPu8GRT/eI4Mr3+u6FvbM4LxSb8blx7Iq6feBdLuQQ5YFHjHZMA79qoq3UNErpS
         VLsqUNmnNtpnjQH70Wavc1qoW+QpwQ/wUv2s24PAhjY3PVtY7RofSMkha9hE3dnl72jV
         HJO1lQMjeuCmr4mW52VuPlUqA5jEp+HuaMfzIvOeJLL4tv2oUOneUEGJw/iYs1xKtJrL
         3ayufCIDtUUvDg37HMnZfJ3fhr/Jzfa0mXXNS+Jq6w2aU9z5a5QGyl/LkuGQnStaHkTv
         Py0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCByhUgFKebx1PFRocZCfjZyIay+HKlXgZQ73mkg9OZ/FktquqGnMn2QAhuJoknvX9fKp9EOtBdi8BpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIQ0HtTSGJixmLlsLLGTBR6dzPF+ArLujzs/t0qvASkv6vQXU
	agkKGKi47iw5hn7ESsyLIZY+r7/wZyMubmvINcgIezzgEFPJ7XB15vIU
X-Gm-Gg: AZuq6aJQfFaLEoiPg2evR7IKCCcLePtDNmKCnTpz9HGO4GiUZ9OsyRZ2KgBLPwHON+b
	AjcWX0Cfm9B2qPYAH4aCf7n8IGa9sI5tb8cQWI/YcePUr+AR0vIbUwXYpbK1xY75Khk/w2e2q6z
	Y1rIFNW+51yHvzpLgAFQrS6vD1qfvEaLa7xIDx6UpSW3nrj+XXMtlG+thrH42bHjmXG/6JdINRD
	H8mXvAfOCWlwhMaXILiAhUoadsONuhEBQKVTdZJBWW5vDhBzOM0u0YBtZSy00+0kl4o5ksh5pth
	56kvROi38yZTTdDtW1bGEIYrSmUjM7yVTAUReb12tWUuyn4Wz8b7llM7q8e99ay4wL407qmNx1O
	E6gpqpbOXWjIZD+xy3VyRv15/MpXsMtWmsPm1ceEIrQTklF1qQf/zS2Ht6wxmng3/o0o1oNJ9mL
	7IIaoAryAyyseVWYzkB/Qf3ypZCPGtpQlsNv7n5H0oykA=
X-Received: by 2002:a05:600c:1382:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4805cf66a5dmr73588065e9.17.1769439793920;
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Received: from [10.25.211.45] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f745c5sm31743469f8f.32.2026.01.26.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Message-ID: <3e14a3a2-8686-42ce-8ea7-4a2380b2acdd@gmail.com>
Date: Mon, 26 Jan 2026 07:03:15 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
To: Mark Brown <broonie@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
 <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
 <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/26/2026 6:16 AM, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:18:42AM -0500, Frank Li wrote:
>> On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
>>> the SM coprocessor. Thus, the programming model needs no handle to the
>>> GPR node. Make it optional.
>> "programming model" look like software configuration.
>>
>> Thus, GPR is transparent to software and does not need to be described in the
>> device tree. Make it optional.
> I was expecting a new version of this with Frank's comments rolled in.

Hey Mark,

Sorry for taking ages with this. Got your message while preparing the patches. Just sent V2 a few mins. ago.

Thanks,

Laurentiu

