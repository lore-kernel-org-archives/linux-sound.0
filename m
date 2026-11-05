Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793865154;
	b=0/3Uav9XgcwhjS9YkOYxtx1bQUmw2uykTYcqdNvKmjJonGvB0dMRBeOFq7ZIpBzPG/Kv
	 x6rnFEi2ZDC2nM+M/uvek/qnblSwJjFv4Rn7V9FfRbqgGuTXQWH5u0IcKQB22Way1NMr/
	 hwXNU0DK13PdgoMXgJG0u/6FonmG91RVs3rLhywIv9aYaaCNy1hnFxGrqf/aptnSq7EXY
	 KmLVZp2aBxfRfJ3k10woctZXxuB18X4Zrz4yumninFQzPMadKpRgFe/3IJHUY+Cqn5Z+T
	 CVeqbsBYS7Q/tUQD4IRl9s+9ICYpobHZ9AglPIa8OgW7+BD+C7+fG20J7owI+mKYeoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
	b=rhDADXZbByu0xoZlMcdlKLyclZaDuGD78DgIcO5yf5t7hBZfPy7Bi8b1EeXnRhORUYbF
	 Agj/04VqabKdoOLW8iZx/Ts4q5QQheYIOAQwU1pfiAK3rNvcl92C+PnWh5Rw9COObxaEe
	 N9fRpbpnqZGqQSCwX7s8qL2NhkmYL5E14BcxQ+uN8TPlOmlIH12nNFfPy2OeYd3W4ko0C
	 7g/75w7rH1zVr9TpfD8ljuxoommNM9fSQUQvH80Pb5u/EK6nEXc/YIRaSOGA1MpRAzVOm
	 WW+/kTX+gz6HkgamSrH5j21fvL7XwscWAY3p70XKxVZzykBzhJHT/U1qgzF/doPISPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B96606A336
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B96606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53fdd2fb171so16524691cf.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793865153; cv=none;
        d=google.com; s=arc-20260327;
        b=afFM42sY3CslC7t2+P8Fw9m9Uxr0eCIWLc1hlNiB/BkF3imsA/lyQiFYgFmEi9WCDO
         lKoNUgtEwEgCUi1eDD56fOBbV3FRg0ePY8z57cyBvjrSZEpQHCveP202r5f0BiUO0ySv
         GEHXTLWYmGJTOnom04RxqXrBdrhmTtMJXtUbMDndZPlbfVJpJEYNeWLZV+zSZ5Z35xAv
         dTe6DDlYC7oBehpW+WrPe00XZCUAyIKYNKJUvY1CKjbWmESOVlxhnj6+yTFrSbAjDX5+
         +Gbqn5bxCBbhp5S7j2fqTvJ48319pTaekv04cIKtJgEisuzGV4AZG7SD73hM0RVwabEd
         9h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        fh=OxsesZoATnOaI07EoBdeffzie+pUFCRe7BPTMuOIE8E=;
        b=ZS9PhmkCBd66AfaCzuLqKUz0M7qrPB1vFtH2ocWzYPuYoZMJDdCvhrxSWLQCzPhF2S
         +g71Jf/ucSErkD3RzXhJJrPkGz1p3iI2LeuMtjbi8d+DAfAr2JLA3FO32r2SIschqc9L
         /E+/XJZPl8QKUxhX9j9DN4NZVwODqjS+91CUXHE66Qw8P/4S+yD/lMH0rNACos21Tr9Y
         NNnVWzbpjzMWmWaRrKMV/miW4nw8LSHx9Y9TQlVd+R6TnQjT7Oo8vuZDyz93jN6K0hew
         t3q216orz+kmyVKIIicn6SiEi+kjCiZheVhkMgpOA6gWxixYMddN0+aJh3KGsD71ZiYq
         G3vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793865153; x=1794469953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=fj/Utz0+Y60yxuICoU+fCjL6rWSodnNW6GiJHpZFeQ+K2c9r1QwILznm9v34n66don
         oJmzfyvtULO2tr6wY+lSqq6zbRaU/rDDqXMmthU+VRX3LXLjyEd+frpxnTny+Zi6Bl40
         5aZFwvUXnt+aJD703LqQYGi16cJJa/n+KXmo6ZTgZv0HO08YeC/iQQlgbb6ehBs74UJC
         MqOimmMyxrchQL+wAPHSdoYvcUvNohjaX/Wfa4A3hfbTpbjwXam50XCSlFCHfrdVIki0
         zQQ45uBjHZUMzFHITfSuog9dfvY/WAx1yFsc7j/TyUIyCNISIizr7gkGXBMA7YHDjJzJ
         AWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865153; x=1794469953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=0okTg+79fJcsXHzfA15T3S8CYz4K70naOuHtEileQ+TgGqrGMtN+a0b8sHJVsoKqI+
         kgsFlpv67jusZa5Duw8Uvdk+WK4OQqgLqvgcHWN770SxunKHBAfyD11jAZy32Rp7ra9+
         bqNtldU7cD2/95KtsYaR+S6DMDHXJrOXVdromagztyZggK9oZY2Ekub6jbwYDmnDCz3e
         SJrGl2zmL2lOEnmSLpnXmaCADKwKkg0dk7RufBOX8L3fhe7UTN/iKYhMtoTN5tuLZm62
         71OT5Ht0RTFG3UsfrkHS+Dm+rZgSau19OWKRUftxKM8vvaZFnSJfHr3LV9LJvcbHCSIB
         VUGA==
X-Forwarded-Encrypted: i=1; AKwUvBzpmL4bOb2jDOXNncULMTJ9BKfZiK1E9XWqQFqNRKoC2QkyOnGTkOl+EuZ9G738CVNUco7T9llsjAUmWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8COOhXCSKRD1OC1j6MwePgk4fp+Gk0SZwWWrmbupjyoPeh8x8+
	0Mh2yiBRRlTi8tMc0f/9YRv5CEBVTWmBxr0UkQJa7DcAhvS6lLwLxRWNWHc7PLOjg0k0cdt4pLa
	s1B9QPstAaN7wEt8Dcz9W52FQwlIM2oO4N6XFCXS1+g==
X-Gm-Gg: AYBFou3yQhOVCbLG2S1tzegQXh40eejZ5fMiu1w4G23koMPYgIabOurUC7ETKj4Muvq
	kH42CA5gLbz0nyLkL60posXzaVXxNsr+rrueWhoVMglnCq/IIJ07SqfACWEmF26uOmHdQUBdTC7
	zBxKDMsK6S7zlJFW+W4+nEXHF+bWSisdhBu5AtYdjatp7/QbRSIR/SY5voj542LECUOOw37Qx5P
	L4TsBdJgg+XoiA6KgGvbskoRFF/33cXuQ4afXjZNb8djwfu7/Itdg3mg4HmhuP3GJdUjpm00j3p
	hwtIerpVL0sd6x+WdDJH1rbg+LM88dnHttJ80uBPj4PxnpbB/EYBIcJZ9taWfHUy0tiQPefm52d
	pWO/S9R/0wPOSQlsBMLnfjdxfgh/WpZVn7Sm9YeYbf98SrfWDFYe0ZT5JE9sgc7fvpdtKic3ymq
	orNUcvxeEh84mOlx6X
X-Received: by 2002:ac8:5e14:0:b0:536:79aa:de06 with SMTP id
 d75a77b69052e-542b781c097mr305348781cf.52.1793865152881; Wed, 04 Nov 2026
 23:52:32 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk> <auulmL-HXdzcdM2V@ashevche-desk.local>
In-Reply-To: <auulmL-HXdzcdM2V@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 5 Nov 2026 07:52:21 +0000
X-Gm-Features: AclHuK8oxaHoF3EiK88-RObp0nE6JLTdIkoUzrIpdnanDmHfkYi6XSLOF6A9rt8
Message-ID: <CAA6zWZKk9C_PnZKZueYYCT=XHcQA7r4SPM4MK8zWHLyYuxS=Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

> Haven't I given the tag for Intel PMIC drivers?
No I do not see it, the only reply on lore and in my inbox from you on
V1 is re splitting the Intel LPSS.
