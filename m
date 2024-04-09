Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DF5763F1
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 06:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712644214; cv=none; b=Li3DzF/yeRDJsj5FTh9ueka6Asdc77MjmSGQaEEf7idAG6R9cqOjK0qLdmyePRrp0ZpzDcMrfXxGmSoQ14H+EcxmWWTowhYvT2Oo5pOaYz0teNC1tdju+GKxmtf3vc4pjELObf5dP/IMdHp8dVWzSYjpvkdT3MQ1kAklZwjz6gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712644214; c=relaxed/simple;
	bh=GLlGOxsGfKxek5hcLAceq+1uQpJbEpoRFNLaAKCpyOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD5spyDpyhGM4WiHMq3R7ooCEZtKWcxwCvdYRwXQbAjZreOvXdnuQCZKzVoTqt9fpoa6Y5FZ9yMiu8T58xAbDYYmCGyIn4pUELMmplgkrVkybA3VTxiG6U7+TykpQTnKeILytrHXP+3e3j0dybCekJyg1e7lWtjryGcGxxqMMdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z78zFmzy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z78zFmzy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso5335598a12.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712644211; x=1713249011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JSfFuREisAT8UwnNGuE+3fIOXrzMP5PSYPhNRbJ9h10=;
        b=Z78zFmzyVO7vgGeX6ggF5tdD6JnpkXH5fi3gANx5HT1kah/N50ixTIVGyE+Sb2rqo5
         V94m0DZuvvRiJmLMQCn5pRtlT0E/6nqYESagmN8bcy8twqF9CFyGJx66HHznqpdJlBPw
         PgQySVFY2ITEk+jDw2qjjKGdErpYua3vrf9jHu/E966jiJY1TOHRmVrwUJhkyutN9Abb
         72X1W0zGYNSfLivHgTYamxpATBhTiZ/4ATaQ3u58YyIY3FO+K0kh1qHKCX5pShYx/52g
         a6qkeyNSEBl2XnvQZ7h+/T8234l30TLFEDwATf4O0tNPQ2Mkiii9nUAIbfEVU2ekfmPS
         96dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712644211; x=1713249011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSfFuREisAT8UwnNGuE+3fIOXrzMP5PSYPhNRbJ9h10=;
        b=FLxBSEcVaO1zTAOjxrzzzMJHqSkYJGCvySXamI46PcJzuFByX9GskFYXBUhm/KFOTb
         Vz1s9+eghST193wSSrh5RAOmemlypDc2NO41g5jwSvSedujOA5DymUqHZdAjtEWSgwzJ
         dLcxRAZvubWT00OF8xeKuz6N742f3vz//ixXKXTC+FiFQt05IxJmcak6n2G9SxkZLhlX
         M1u+cnD71R9A75LKZwqnksChUM3Sm1v0JeqJCXAu7Dfv4CdxotTiQEcDdnD1GFnrFm5w
         lLCmZh6YqQDuvQJQWlEOOrYQgk7UjqSYkZLJGfTy2gXalSqRiKx8d7apf3QNFsv3CTnk
         0UlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyw0UsXcq5xv/AI1qxwUH8lFZ/A7sl9GUyu34Jfukx9byRd6NHBiX5pXEA1QsmVe7uYDW7rH8X1EhswwRPzZhjEL/WXO0VHQ3OpH4=
X-Gm-Message-State: AOJu0YzRtlwIBGnpkgRdAvWJC9d8HvY//lOQJ1fPdrvhszbEikU/Apig
	XbnuZtIrMPuPtA3eXbhGbkJzydN2uyjH0A+HzKfOlryQ02wTB40Q24f6xXY+GAY=
X-Google-Smtp-Source: AGHT+IG/oFIIAzcBsZm/egCPjFK0/bLUFEtPbvyxlCvGIe0YLL/tYpAaT9ndRheyNFs0seWC7a0ZUQ==
X-Received: by 2002:a50:ab1d:0:b0:56e:4039:add5 with SMTP id s29-20020a50ab1d000000b0056e4039add5mr6697537edc.22.1712644211611;
        Mon, 08 Apr 2024 23:30:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id di19-20020a056402319300b0056b7ed75a46sm4986932edb.27.2024.04.08.23.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 23:30:11 -0700 (PDT)
Message-ID: <51e482b3-ffbf-46f9-972d-875d106c2474@linaro.org>
Date: Tue, 9 Apr 2024 08:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
 <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
 <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
 <69ab2bd9-401a-42ff-90fa-6600dd071722@linaro.org>
 <CAA+D8AOP6D+xUNF_XJXt-8dMi2qFyVh-Sbe8k67CzvUbnzrwoQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA+D8AOP6D+xUNF_XJXt-8dMi2qFyVh-Sbe8k67CzvUbnzrwoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2024 03:37, Shengjiu Wang wrote:
> On Mon, Apr 8, 2024 at 11:06 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 08/04/2024 10:01, Shengjiu Wang wrote:
>>>>> +
>>>>> +anyOf:
>>>>> +  - required:
>>>>> +      - spdif-in
>>>>> +  - required:
>>>>> +      - spdif-out
>>>>> +  - required:
>>>>> +      - spdif-out
>>>>> +      - spdif-in
>>>>
>>>> Do you need the last required block?
>>>
>>> Yes,  one of them or both are required.
>>
>> And? It's already there: that's the meaning of any. It is not oneOf...
>> Before answering please test your changes and ideas. I pointed issue
>> here and you responded just to close my comment. That does not make me
>> happy, just wastes my time.
> 
> Maybe I didn't express clearly.
> 
> we need at least one of them (spdif-in, spdif-out) in the node.  which means
> that we need to select  "spdif-in",  or "spdif-out",  or "spdif-in and
> spdif-out".
> 
> So my understanding is that need to use "anyOf", if it is wrong, please let
> me know.

Third time: it is wrong.

Can you test the code instead continuing this discussion

Best regards,
Krzysztof

