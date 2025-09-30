Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C93303CBF
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759247991; cv=none; b=LtpqTJuFeEd7+STvn3TXS2CkobqaR/Mg47XG8cvjiuRT0iU8TnWhNKHG7nhaL6LJIuTam5dRDiPXTAp9J2rgFyQ6MVnWHFcSyp3EHn/hWhmC+nJ5I7YXfdYaYg8oCupm5yPthU4aB9RJnLwU74Dmphkt9VUYdex+UG0e2gnH/LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759247991; c=relaxed/simple;
	bh=AVM+f6993GG3pPTGXpDB9FNg13zb0loTdcuhSe/D63Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PrEH7yGopWMInRywW/NH55nkEodVDwGZPX/P82jaXcfYY0l7K1UbgFww2GkQxH71eEhFWlrczRqXbLf9LNG4kHVfTehcIyyssh4Z7oAXLEkGUg4bv3vzrxdYW8uwxufWQcLSRPGiW+SR9lvpK1sEh/NU3mODZUWuwfxzXlv+hwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTj2ldqH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTj2ldqH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso40274355e9.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759247988; x=1759852788; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jewn4YU/vUIZPW/z42z8IyS83UgUexK9MRMwSa8wuVM=;
        b=HTj2ldqHqECeS++YJjG3LkVp9U62Kk2sFTKiNwdeaMizJxBXTU5LmE7bHHHj4WS9pg
         GxVlQJJBYrDCD8Q6kGJzgNodFvLWVxlF7IlrVnp9BlVd0fil4tp2S5zuNMgZ2b87IAOW
         zBCxNKKQ6u4fIcLXUkY10beovm5Zu/Ge7BdXnqYBCN53o8UULCqtqg1stn3Wz3EuapjL
         1vvvDLa6ZuU8VwjmQoXf4tRGWBNp7asa9UoN1lRSWrSEpce3AamM9u6oSKpBsGQiz5su
         sC4JQflC1AeLF4iWOKi8ybFXb/F9QS6Ek5WS1FsgSBhyNDk1Gixqse1hvkqhLqZ4u1hG
         mJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759247988; x=1759852788;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jewn4YU/vUIZPW/z42z8IyS83UgUexK9MRMwSa8wuVM=;
        b=YN6VJlRpsEA40+Noj+R+uuwE2xMGvVA6qcH0cP4mXmVXYK0p6xcnZQE7puJ6eBEO/J
         3qYA2s3k8HbM/Bit/iPpIC1XLTMYudYFUQNnRJWKw0B1jju4cea+Qdtx2o464kB91Ha8
         K/Gt1UBK2G8gj4pCnwiueDGpVn3whyr7B38GoGCnYufZykhsGAu5vW1kMYpTNztAqScz
         UqUIZAeObUksQ1hHkMC8BMtl5LbA3ctdCQhrM7PoxnlZpJnjYpujth02J4+N28YUfgF3
         v3LBrVt04zlY4E8Wv+8VyPXZy9fvSCLvZN62opY4KrSNMOW7ALozmXkRfKCnaCWEujKZ
         UeCg==
X-Forwarded-Encrypted: i=1; AJvYcCVizcqVCIWmpBXHn5qaxZXvccaIXMlmeZEkOVuyiR3QQBFHCIKeVXSZU/9aoHYcVx6aRe+iPJCu2unIPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKwDG6VPqoshZxs9pvt02v4sOhoIk91WhM7bMh2zEwfTnF9/0
	uo2KLfj2m/4wwP/Tx6CW4oFGN1K4+aCJzzdBOb29kXeAfJX0jS7AN4Z3jRK85yzFXr8=
X-Gm-Gg: ASbGncuVkTSmBvoTotEND09E/XoaoJEVUkfCw0IjKeVSseKMhFxu2bOK1WCQiDSZp8j
	FvZkJyTzMQXOtx13mtchbl3hROgN1nAsvNju5ed8Ik1kL2gmHsbHeFpCcF3WdVBQADrDWbNyQjs
	RcPw691E1E8CW8Ks1fbsrFLeCTJrasJhN7brzJ8yvzqdN+DecLxwfYQoOdZXcdTuQpg7pg3L7Vr
	oKkkxAPYo1sq9Srx9mKmAf/PrYSJwompQlpwMV5iXwa0WndHosN1X+slFBqXsx4356d44XPx6S5
	We4Vw4h+VUZZOGNjqs2SMjuAyrzSShSDBCtqf5pyVa+LUwhwjO0Te/JwK5BB9ZOeVwbsqw469G0
	/S6rmKpg8Vj+a28PTiHADzp1i8WFzTIWlwBg2YaNYycsgx+AZ+1Ow5/0PePw=
X-Google-Smtp-Source: AGHT+IGgWhUKC4p7LLQ65Y2Poqvj3Z/K2NZk/M2fzSl7pknsxh6YoTUT2JS4bAKz8Cg2Bjs6T9NXkQ==
X-Received: by 2002:a05:600c:4e48:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-46e612674afmr3283495e9.17.1759247988059;
        Tue, 30 Sep 2025 08:59:48 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:248:54ff:fe20:c34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f53802sm61255805e9.9.2025.09.30.08.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 08:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 16:59:46 +0100
Message-Id: <DD69D3NF9QWG.3NJDD1L5EQFMF@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <srini@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290)
 soundcard
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>
 <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>
In-Reply-To: <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>

(update emails, drop old ones)

On Sun Mar 2, 2025 at 8:20 AM GMT, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 02:49:52AM +0000, Alexey Klimov wrote:
>> Add soundcard compatible for the soundcard on QRB2210 RB1 platform,
>> which at this point seems to be compatible with soundcard on
>> QRB4210 RB2 platform.
>
> Is it? The RB1 uses PM4125 for audio output, while RB2 uses WCD codec.

That's correct. I also managed to enable hdmi audio, vamacro dmic and
pm4125 line out output keeping it all compatible with qrb4210-rb2-sndcard.

Things are mostly the same between RB1 and RB2 apart from last stage
in the output and analog inputs (non-HDMI and not dmics). The diff can
be described in board-specific device tree, amixer's control commands
and model property.

Is it still need new separate compatible "qcom,qrb2210-rb1-sndcard"?

Thanks,
Alexey

>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/=
Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index b9e33a7429b0c063dc5f5b806925cd541e546cf6..2493ed99268bf2ff83430201=
50c2c9aca4262514 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -21,6 +21,10 @@ properties:
>>                - lenovo,yoga-c630-sndcard
>>                - qcom,db845c-sndcard
>>            - const: qcom,sdm845-sndcard
>> +      - items:
>> +          - enum:
>> +              - qcom,qrb2210-rb1-sndcard
>> +          - const: qcom,qrb4210-rb2-sndcard
>>        - items:
>>            - enum:
>>                - qcom,sm8550-sndcard
>>=20
>> --=20
>> 2.47.2
>>=20

