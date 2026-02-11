Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD08355041
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806784; cv=none; b=Rb8LfNX5CQNiC6+imdELmsTtjwQ0kAsQuI1HhiAUW3bz5RfmJVY9Uk1p4+YkR0dW9JIwjsaZ7sh8IUjlgBzFWcSSlS9V1W+WNih3QjVwSHEJNDIFnOf64YRErvFpLGA6LJHUEGddGpHIAWtqmigXN0ji0B4QEoGWJb/B1P1Q+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806784; c=relaxed/simple;
	bh=QGIwiaPCLFixSM++NpJ7Cpq30gA6dLEurQ5ELHX88YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smITATla3QIQUtEorM5CMEILIRGxhcsl5ilTKP5VOAB0Z9gG5K0zKbXk6F1qGOnWkEAl87oo08xFnScEY9XsvMxkd0blga+HAorT715X7VxQLi1iIebVLz567JHhueNqLFOYNY3Mb92y3f+xGfAgikaEpH5azHtohOBYfl6mJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+UVRv0r; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+UVRv0r"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824a3509a12so203118b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770806783; x=1771411583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXvOCgGfrRceg1PHpd9PorX/gFCsrWCHszPwM3z9+VU=;
        b=O+UVRv0rNdGcHgTE5BXYwpEMjEAi2+VirC147Fo2ehIL1CAomZRU5dY7zURwj5ydcY
         228Up+aG22nbohwDNCv7CmoSDD+O65dE0SckK3MbYb2UxUn19swZemxXdkV6waXmIfkt
         zgBHpQ4cqHvo5w0rer4NBohoazMZ7kXjZJcJ/iHeyXAHV9RvR/I1/C2zS3Hh7tuXgNnb
         JEg8LV7sAJ4Hh1NIWftaZ3gX+pkeyDfE/1gWjexub9tXV8FIQStsiLIurgP9L1wOAfru
         9xQFeaFDslARgLmCKjfePgZ0wzv2KRAZ/OHvSdntW2XW1GOQk1UpZCO4RjLoJAkqEQZ+
         GPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806783; x=1771411583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXvOCgGfrRceg1PHpd9PorX/gFCsrWCHszPwM3z9+VU=;
        b=cIraMXubTvmxTNbLQk8kXYgC1HtqXds8pdH2Wf5JVdjO4ACidlrnGWXwJda6Vthrxs
         k6fyf5ejNzo8VjYG8p0tKkcj1dSdJWG3DS4QvrTMYfeQxF0xgyuxTwEXCyIH5qZTNv6X
         9WxdgcPDBXEGOqJBX9LvJYOpjvSG9Baa4ldWln+aLOXLAnval173tf570fqCJQhM7onG
         BjaJpUoc2Y8msDFoPqXlG5k92xQYpFzi6/2rEL2ThH78sezQLfuhQFYwLpP6ZuoA9JrY
         +7KXPIgPxH4Tn3miDHDGEqtyToeyH/msEbikDjHehX78nVsjnxcifQPlDlJRctyl8iY2
         h4/A==
X-Forwarded-Encrypted: i=1; AJvYcCVXGde0c+jaRN+YYNqYy9SqIhLeK1n1qEBRYFQjtfa57/xUbAsa3E6FcTn0zDjTMgdtShHPaQr+PqgvNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vbyB6cCvG9c2I8G7T1s67/F57FAyuGbx0XokXPS+xGL5TwnO
	zFEq4T8jt4wGVwvADO8QIP4c2LRdj9aDaqDhGspXh2KsWIWZ5GIfA92m
X-Gm-Gg: AZuq6aKT42DEq+DVkydtgAH2d4A1vunwBixaDlCff8tAuY1iaao3LAH6AgBb8oE3na0
	mawM2P1EF8AZsLrec990nuEoIpDpoM2aZFKZU3hW4suBfhXEC2PucWRVltwj6H31cFBsXdrHEfu
	M4ziUl+LTQmh0FDY/cQNsXHQS33Gtg+Yels2PJOhnTO1fvcpTZWVtnlSLhv/NcMjMd4ARg6uE45
	hQ6hyMRaIcisSip/U/tPE1oyjgfxvk2bO1xQoPllnuLuHTNT+Ja4QMPHJ7jOXAzKLZykR7TQEXz
	hsx90OhQPw+j9PWW//lbmVi4LBquiFsJV4Fb4qkoWdzv1YLuqTarbQXIW36O+zOvEuRq5qRNJ11
	V5t3n7OwDtNgsZovO+qg9UzxF8a52AcLu4CtoNRcGYCHn4e1q1CKbuL1SHY1lJCr2DLi7sakSfw
	==
X-Received: by 2002:a05:6a21:a92:b0:342:9cb7:649d with SMTP id adf61e73a8af0-393ad01e8f0mr18899434637.26.1770806782730;
        Wed, 11 Feb 2026 02:46:22 -0800 (PST)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1967c86bsm1698863a12.2.2026.02.11.02.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:46:22 -0800 (PST)
Message-ID: <b30d7bfc-f92c-48cf-988c-b7dda4f56d36@gmail.com>
Date: Wed, 11 Feb 2026 18:46:19 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: add DMIC support for RPL platform
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260205020706.29058-1-qby140326@gmail.com>
 <aYYqIjmPesB_bo7j@sirena.co.uk>
 <6967305c-baed-4f0c-8201-b1610bdefd4e@gmail.com>
 <3cf99569-36a7-4ea1-be73-0605043a95ae@amd.com>
Content-Language: en-US
From: qby140326 <qby140326@gmail.com>
In-Reply-To: <3cf99569-36a7-4ea1-be73-0605043a95ae@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/26 17:22, Mukunda,Vijendar wrote:
> There is minor delta between RPL and YC platforms for ACP PDM IO enablement.
> No need to duplicate the code.  You can include support for RPL platform in
> yc folder itself. Most of the YC code can be reused.
> We can completely remove the RPL folder itself.
> Add extra checks for ACP PCI revision ID.

Hi Mukunda,

Thanks for the feedback. Could you please elaborate on what the 'minor 
delta' specifically entails for the RPL platform compared to YC?

