Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204734887C
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247380; cv=none; b=eJlYAfgC7Xs0iDxP2nfMg8R5Mtx2EyRcTaZpDd6xh+cLCTyY8CFtXDbsXvbCcNi/gnBXD3tEHmzD8M19vaGH853ppoAPh8qqgod4H5/4OFKBQs6RlbqhasHK1OeVV8DMAa4vaJlhR3GIWaPhwitmA1HaEy2Sd9u+ybdxYWJTfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247380; c=relaxed/simple;
	bh=X/BHziO5NsoZbofxUX7RJFDD4dHeLgWXoG4PM+cupwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP8ACPjkmLi8IGlUUPLHaE3cJQeG/g+Seur9aWTaXtkYRleCDQX070ZH9vDDm+/VeJE+mN9l1GNLTpAznj9f0Rt3mpP7jMmFRJTNPF5G3BrdrjrRAhXCqfiV40E8ppH/Tehez6YXZEWd87PlwJKAvaORGDljnFaDgA4helP9Ubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR17ZWNu; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR17ZWNu"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c828daf83e2so1981031a12.2
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779247379; x=1779852179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQXnq6ff2CcEgG0fR35KaANgASFhf1ZCAbN7UJVtGlk=;
        b=ZR17ZWNuUwB5ZtOelsvRUg3nujPG/FfLMBrp+fjxZBJeh0F83mAz9v/fy61P2tqBo1
         llFHCnh8rBI6kkUDzNEh2uw0NKY3hSdQPLQ+ncbhi5ogp7OiHBQjuzHi+c6pCloQNRQa
         f/u7rfM1ewsWZu/rFm37+mmt7H+JcpbWeIaDQAigQizMUfMTvGJC01E7VBdNlTEmLgki
         pjruurEGonhCCgTOt69SP/nlHV/yrppfZ+ykglSam3PIRbihDrC0Plz8jEKegLaH5sPJ
         eiLuUiRkkAVaFqh9QI5/qE1aH1sE6Tkyijk6akXpXg0EVVf6RHi7bhJvE85ufrHe7Lo2
         rYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779247379; x=1779852179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQXnq6ff2CcEgG0fR35KaANgASFhf1ZCAbN7UJVtGlk=;
        b=Wkj5vfFgXRwzsGZ311xDOaqk9JYhj7VW4qQU4+SGXcSv8cG9XKUQJe01i4FZU7MWei
         /zvb0NgtHQUOZiJGU5/n8017EPbR3qjwAgLZLIta1JZzvOq8c75AGbc2OTq8D/Dx1JAw
         PCrvacajgvA/Y8KTGiuCgSAX4Av+dMm1ZI8V0MCm/in0BK5jZ5733lIPq+v4o6GYna3p
         nf+KfwIJIy8yRTwPXFk6ndowgiCStyGq4A2EafSjVBr7iYp7nEthGibnKKj0XIA802pJ
         t59bUlIXx0sV8Su/byPJ2qZ0ximyYvIHUDCz3Axs6IHcb5MDOJ0bJ6dJhNmF1HZjaPkp
         4xDw==
X-Forwarded-Encrypted: i=1; AFNElJ/ga9fF9fq4qZxvnFLT+5IUOI3hNYwTmR9BSJjgLW2v7413HdNI+37CQogJ/pLN7P1AEoqLUrIpLuJM7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9VcEJVgOJNN9VpWwvlPci00V5gJRhy0QrzwSVtt0/BOUhMeM
	QJy0YwTakFmVm86L2raBcp5L4TelJNT+4Y0KIH2CRAf73PNWPQPv/3jq
X-Gm-Gg: Acq92OEVnHYbd2ofbvxqYNZVzsvSq15ndJL1GPNrHx7c3wCTD5nW+qYpa0DPoMzpcOh
	BdkiNhdERIl0TYCwXjUd/hUYZYX7CwugTG66M4dJ1uLYJo992zT6qsKT2PDSR+q82kRgjPhQlDM
	4VSLvpIvPVBLYKddPjxHyRoAseNM1Ql0w2Jsr5MHMxxaaQJ6QCUzJ00yailHuBr7OyGr1Df7HFr
	5mgvl/2d3FoDLZ1eCG2wAE/6k0DmE7TbVJ2SwOmuLkCOQR6HIdHDOWWwALEoQ4Qw0sRfNjiMUO6
	mMvibNITAQtWDOiG/Oh0IYxcqx2JcqwzmJqG46M/Xs8uRO3Pvh7EYpWeNVk3WWgeQpDdGSYYGae
	pQgT/fxI1lP2et5HWq2iBq8OZnmX8ggbHj67T2mJwBq38igAGxKL13LAz1pONQzlGBWlVFy7uVj
	NBJpkAm7ryfDxl/V+OfE9+AdTA88q0kiX/k1N9kx+YAkY+cBrzNdno4jgL3XO6/qM=
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr251542375ad.5.1779247378893;
        Tue, 19 May 2026 20:22:58 -0700 (PDT)
Received: from [172.20.10.2] (114-137-66-169.emome-ip.hinet.net. [114.137.66.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm203376265ad.28.2026.05.19.20.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:22:58 -0700 (PDT)
Message-ID: <204dd64c-414e-6f6a-e992-c1fdb1b398ce@gmail.com>
Date: Wed, 20 May 2026 11:22:52 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-2-YLCHANG2@nuvoton.com>
 <20260518-heavy-bear-of-camouflage-d7c89d@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260518-heavy-bear-of-camouflage-d7c89d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/18/26 20:02, Krzysztof Kozlowski wrote:
> On Mon, May 18, 2026 at 10:47:03AM +0800, Neo Chang wrote:
>> Add device tree bindings documentation for the Nuvoton NAU83G60
>> audio amplifier.
>>
>> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
>> ---
>> Changes in v2:
>> - Dropped the word "driver" from the description.
>> - Removed runtime/software configuration properties:
>>    nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
>>    nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
>> - Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
>> - Removed unnecessary '|' formatting from single-line descriptions.
>> - Fixed typo in firmware-name property.
> You didn't really...
>
> git grep firmware-name
Sorry for the oversight. I missed it in the final v2 patch. I will fix 
it in v3.
>
> Best regards,
> Krzysztof
>
