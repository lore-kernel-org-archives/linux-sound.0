Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00C29B78F
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759889932; cv=none; b=B94cq+0jWOfG3eN1pYP0S6M32MFEFtXlF+T5CRYEXPgZuIRi9nuN7rJbeaRmrYrfw6V0yNVajqyfhdcxC34ampiNM1Ov+ptlHPc+KDDoGmg3vjv9g7nSM3P+PBpWEpVsQY49V6+8Q/IMN31OaCMpOrYp2Wf01/8Eixl8igKmLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759889932; c=relaxed/simple;
	bh=eLUKCid2mCzEr3f2IULaa6Mi8dzk04iOMQ1Cu+awDD0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SzyL7IIYduBRmBsRj3VF9aC1po3t4fBMpE14rU8emPMv4ya1KIlf2Ag9LQpTt6VXmD79606qC/RA/dX1IKbL4lPy1+lHXfGhUUQruzTIpOQ/35Hcxps2tp8+FKA24JPj0DX7pvKorRcRktOGtSa1e+VYmIFNyzUfrVPMKBb4hFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahaQ+NAg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahaQ+NAg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1687805f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759889929; x=1760494729; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=micbjQhFRi56rmBZKMQCddkVTulgFVdWxWszGqRTF54=;
        b=ahaQ+NAgrWEPQIWuYqcDIOvUoZ3mn+pgDminfwb0D23x9JG3hjU5U92zv2E3HqJMO6
         gNawUbzwU2KVurUIPikMg9FOl2X/zB+5JZ0Qm+pQTMzwia3+/qHPF+/sJYrxsMj9KqHg
         GoiozcubMSwutgCST7fk3Fgh46HutkmdyGafcQJL76KUMdnL2bIzwpprswGJp1Bj7NAu
         AMIis8KZLI4JdFV6TBfdsfK+MuDnA0/wI6omoHxCAKvg9/t7Jnp2XCSBUx4AdDbCYeKf
         LXok8IgB0KIRL1Jr6znbw2hpYMT643pXKwmSLOn6d1VFMzZIHvJekxYTtk8bW8p+fG1m
         fK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759889929; x=1760494729;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=micbjQhFRi56rmBZKMQCddkVTulgFVdWxWszGqRTF54=;
        b=TmHPk0Rlk1HF/YD8GVMz+frkzl9fMC8PNOY27TN9UF06aLp/ii2/0XKDALJ4lBFIh1
         JRR5FWVr9uae6XbqOjEBARflOUkfvjKVoreZJcD010ZUdd/y8+2Hwqc13uBOdGCNpm5I
         QrrVcSYDTCSTFiZIPXAhlhZsQ6YgS8Jl/p9+6hK7CaQ1aByMM0fcNRoSetM+qQHvrLHw
         TYxmyhwH7ewV9RJC0ERbFT+FBp0TsCrdADv3v/u9Mxzr7OMr48xPsZMuj+uMUY08aHCv
         iuL5FomXcRbggqkJuJvHEXcNgh62U8Z3GaFz6ej5koBpvWmxa8rBIXpFM3dtCwy27ekS
         z9TA==
X-Forwarded-Encrypted: i=1; AJvYcCWhLokIDZgM+gN6lQxIfCcxB6UM9CySIVOZYzXim2UKU4BhijWkKMq2raKz8j6IFjPu5w4ZXw3jf2HawA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznWzpWBUe9cL+qOq2x5IaXOI/ZBlW3nPI9xlVpnp1G8qSzeAM9
	4dL0Tstq38TOnNGts/LooqpeeUB+2eT7jPNQu9dSnks/1vV3Q95JDAnx3cm5NrIWVek=
X-Gm-Gg: ASbGncsy+ZRHsh+DTDQ4NoTAf/VI/gHkr+DRm6zI3k/GVJDVwB+5Efb6gTe+pkfDbLN
	V6W9gTcHm2EkPxSJqpTyOsZoY50+H3T81Q98nX3t4t547/owHWje5nwcEmD0HhP7M4qSAJ561nJ
	xbvmC0pk6qmL3ezPDJMy9cF8u30iBrDC9OSMcC1fBZyTpG+TuoeryF7ec8PIbz1kllELyR275qs
	SzQyKOuwdoJJVyCdTm1f3Xzf5fEHYgv7Nj6q9pQgYHbmvRfMRMSWFvdoo0LSzkPoDW3kcFJ+Ei/
	0IM0wJE0L2WgYBeGG1D/khPVBStK6WftkdGx9cuKjAD3Pt8QiF7cDRr4CjbhU8Y16LrLJeTpwgr
	XaFYSu9k5sZm2mr7y6nbC1lKlkHMYZUWs+2CMkTfHf3Ke4gSDCV/fldU=
X-Google-Smtp-Source: AGHT+IFPMFJByHAQ3JW76Qjmt7UP+fMZMpkYgj4Y9V9tn3CZdsWTV3HC+ojk6qaBDfa1ihXXI4WNNA==
X-Received: by 2002:a05:6000:3105:b0:3fc:54ff:edb6 with SMTP id ffacd0b85a97d-4266e7dfdb3mr815912f8f.35.1759889928751;
        Tue, 07 Oct 2025 19:18:48 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:8c32:dd4d:57f2:8be7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c16990sm15668705e9.10.2025.10.07.19.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 19:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 03:18:47 +0100
Message-Id: <DDCKWVH8ORLM.357D9IKQK9YN8@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: qcom,spmi-pmic: add
 qcom,pm4125-codec compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
 <20250915-pm4125_audio_codec_v1-v4-2-b247b64eec52@linaro.org>
 <20250918-wonderful-deft-jackal-7d3bbc@kuoka>
In-Reply-To: <20250918-wonderful-deft-jackal-7d3bbc@kuoka>

On Thu Sep 18, 2025 at 3:03 AM BST, Krzysztof Kozlowski wrote:
> On Mon, Sep 15, 2025 at 05:27:49PM +0100, Alexey Klimov wrote:
>> Add qcom,pm4125-codec compatible to pattern properties in mfd
>> qcom,spmi-pmic schema so the devicetree for this audio block of PMIC
>> can be validated properly.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..776c51a66f6e7260b7e3e183=
d693e3508cbc531e 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -137,6 +137,12 @@ patternProperties:
>> =20
>>    "^audio-codec@[0-9a-f]+$":
>>      type: object
>> +    oneOf:
>> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
>> +      - properties:
>> +          compatible:
>> +            const: qcom,pm4125-codec
>
>
> Not much improved. Same feedback applies.

Around the time of sending this I thought to set separate follow-up patch
that fixes the other part here -- pm8916-wcd-analog-codec.

At this point, is it fine to send follow-up patch that does smth like
this:

+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+              - enaum:
+                - qcom,pm4125-codec
+                - qcom,pm8916-wcd-analog-codec

?

(I didn't check how if it will compile or pass checks)

Hope this is okay.

Best regards,
Alexey
