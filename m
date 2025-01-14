Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9421ADA2
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736896982; cv=none; b=U51++bpFbXH3Wh7zVW6mt7Q5wOOfotf3F7FdKL4BrumvJhUW52jsgr+1jZ0t7IkLmpXq774hZ5D4+Ys2079lAD2x98A70obk2RCccyDlRX8UD9hoRpcDOO0KG1ax+MNG5bjPbZ2Cjf+6Ks09MMR1Fi6HD8XoioI6FZ5psuznltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736896982; c=relaxed/simple;
	bh=YzSVaQsnyAHg0q/DldlZak+nSnBizfx2P7UMa4fugG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fHtD22SRhLjADw4eoXlLxXPB2Rz0AEvY1utgEY824D1iqaoSf2543mOiJi+pZ1IeUssszPl1RkBJ6f2Gbm+lNuJi7GaSwqyMkVbQ3jaKbbE0NkKqa6YUzJ1tBoZtiT6NnZeMXCcrsOoaqXM79ijCQDuyBeUdagv1bQR+6FNDQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AH8ZWga9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AH8ZWga9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8015887a91.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 15:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736896980; x=1737501780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ktZm4+HEeNwL4UyziLyj7Ln/Gvcz2agAPMRL6M/1u0=;
        b=AH8ZWga9PGw7nV7xNObHqN0OZ4cEalwetNMrQBWMB+vxNeuNxQz1Oeabp81S3UupnJ
         toLuHMrZJR06kKEmYxe3o4XxQzCIVrvbM21JUY3lgzAi+ROwUm7b3YG32Z5WRu+ka6jY
         ZdNw8NkEqf7HBMsZoYUDvuihUwoVIjU2Xel1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736896980; x=1737501780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ktZm4+HEeNwL4UyziLyj7Ln/Gvcz2agAPMRL6M/1u0=;
        b=VNsCWuZ0qmLn/Uy46bR1cBpJyJguIq9tQf/ua2iZC2XZl/IYF+WPERSPsePoIYQun5
         N7jOVVQiuB+zIWztJIEEMWXJaSpK+8J/J7aiyGuH965myCNa3du1QFS70a0PoHkInwQD
         irevSAM9AOAnQg3b4PtPY+nVVX0SL0V/a0pHRVo8wsECV2jNnC6jDXFS5Ru+W6NMPSWF
         yK30T1KcYO2tW5v9RRN0OFTNA0QsiBpJ9MQCveErpN4YiveAKm0mt/T+Gqw4B727sb3Y
         ULXs7EHg0DuobXM93KTFa4fsTuPKeZlg4IrowUHgY143eY56uK+RxPdwS5L+l5VGauBJ
         ED9g==
X-Forwarded-Encrypted: i=1; AJvYcCXTHe2F9RoydtHB3bLdmAMsi1iMaS2lWWzjT+5QatJCZNT1jmTdXYLRbXL2FrHaUb1QiD2NwrKEAWM4Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX15skvB7KcRurXg+s8rx1U8qwUNkXbGaICysz4thH8mJcolb
	RDodEuDfG2JN3UU34k5ih0KlpZKQEarbqr0ar2LY7HSN6jjb6vVOVDMTMnzp6Q==
X-Gm-Gg: ASbGncvrEoDBvrs/Hi6RSHa2ScppL2rRW3OS2GkC68XJQYEbmimuNVsguN3Mvm336tC
	YXSssVLZTK27FEntzrghANEBVcB8egg5Eo4N34Z9YxPcUeTYPGa6s+cxHz6p6134/bSHXKlPai8
	hi+oRDdbL1G3paK7GIdtd4TLQplrw5COUuj6lwSuJZZuiwWWOzX1YZlc/Mciibc9tnBOCN39E4c
	r/djbO55VVWDol66yH7rdOpR3L2rNJTSjpj4Nu7eVjyetS3w29ibxFEdilk/KtXqtEWX357/VNc
	jhrKOzvGwNiuISrwGM80tbhvNxwyI6w=
X-Google-Smtp-Source: AGHT+IHYaaIEeCtxTSlEcqkzmsamMknTRKMWkeud5UyaD3eXdIdlXpa1+uQkyOgsb2JQ1mIA+JvKdA==
X-Received: by 2002:a17:90b:53c5:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2f548f33ba3mr40365723a91.10.1736896980453;
        Tue, 14 Jan 2025 15:23:00 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25c655sm72631625ad.231.2025.01.14.15.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 15:22:59 -0800 (PST)
Message-ID: <6653d749-608c-4a84-a9b3-fce2fe056725@broadcom.com>
Date: Tue, 14 Jan 2025 15:22:57 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/2025 12:36 PM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/bcm/pinctrl-nsp-gpio.c     |  3 ++-

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

