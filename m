Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD391DED54
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826077; cv=none; b=rjsrfZWaJfeh9dhW6CB7+k/8D84z0ZbUD04Zvrnm8JAx9Y5gbK3RbfAgDlCytMVtIlfnUTKjTOQUXV2+gB23DF5gmgmlt0pJp0ef47drcSjvj8YgKbS6rG5yAFPCXgYPmuBUTSDu86+g+RnXjrxkTlgJaNG43NGrIfzvQXjrDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826077; c=relaxed/simple;
	bh=2ur59+1ubAVC1jOBmnnt5jTjvdpj5sgc0TtVhaeTRJY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gDWSVGOR5fVQy/X7rueB27TiYNynJxcYIqgCkZ6bgJ/ExBAH+DqwqcaTPOvsTb5C/nBGs6/XwMpALHCY3dkYyHAghV2W9nAFuSsDIWDkbINlDiTiC/j5/LOBIph+IvxIE+OBllc0nk5Z+eGlX9gBNMj3dXFrlNpZofKYKy9xYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lSnwrpxw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lSnwrpxw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso42099405e9.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745826073; x=1746430873; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn84KksoLA1XCM8eFqMm/ZJrcGihzBHVRs4q9bxH1gc=;
        b=lSnwrpxwjy2NBzimuYQPFOZGww1ajOJ9WiCeGo1prTQzG5rqlWrCKN7YEHMc/PUPN5
         9BoOyHoun4tWk6ipO+lc30w+j62Z9+rvUYtAZ0prpvDs111a1bRBvr98vKRvWY+egljL
         Oqb5V29FbrVuLklL8YFQ5nfYXOhaa3v9lcX5mz+fC2/XBwDeqa5CfkjghFzqhe6rbNoU
         dNisSD3Py9wiN1JVwFrUwpIF1F1iqZloJWMKtCJ7uy9SEZIF1Ocw9M4CfUc5Ux1TLKcO
         7qHxfqaJ5G7egKvPRzsNBCrqiw1LQL4Qoj1Iy1hCDMzF/ZSesWupW/jMvmcDWySOa9KD
         AWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826073; x=1746430873;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn84KksoLA1XCM8eFqMm/ZJrcGihzBHVRs4q9bxH1gc=;
        b=lcv9ohti+bHOeiikzZuyxYSTJl+Egp9f4awRuI2/93iApCJCjyusFGIyC3GqssfBZL
         WWe6SLsbWXz5hxRb9Q1h6fPQDcHCGlluTm3H7vf384XKGd5OYMNqadH2xdX64pxKviQ2
         g0Jbr5w4FLqST4qY7b4CBB62FVUsmfgtex628kEso5vPlR6QP9FYE6uguGggQD6DMblZ
         dX9xVbMT+DxZ8appbsSCQbXJgrzVtwQNtXUTT44X7rqKx1wPIZx3oFEtRsjXS1SoK3XK
         JnB2CtAEANKobsxriMn1cp3N2hdbRmUmc49DevEG+abdtUyqqh+d63POoLnID2LuaKI6
         +y6A==
X-Forwarded-Encrypted: i=1; AJvYcCXTWmorlMsTjtfBpsWysGw76+v2uhXBdd2WF/w3cl/4HjsDoaaBMXAjPNkFj/PH5Sns41U1sb82n0rulA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9/nRNL+S6OpQvlcqUlebiqorAFZ4pON8T5eA1KWrEqBP2KOD
	flWUZnB9+62hETR4UXcQKeO9DZpZkEr6jzi5uQQpPoUlq3o4YAvpRingacXdCaU=
X-Gm-Gg: ASbGncuRTY2kZ3hnmevilI3X5xaFGctupj6mg9Nj68AiQGz1KKKEFW0/5wo5pEXAwrG
	dISVqWVu/aLuCVaMcwGu9Kgdmy9Kl/PAF3Ll3wegtNv6awihDJPFgiizl2wdQkEmctnLoL1PQIc
	VXpA66TamN5qOHhsn4SAZkZcPs7d5zzXlK5ht++AUUrBy7NantVgG3gW1gHxaamtpes0yWMp+UX
	IXJAIy/iP9cfqltkjOTWZw3Gl76XxGTi7N0sgh3bpARnhT+hTpZ89K9QNl06BL+wgSn5/g7Q6Az
	7pK8/eziYMGrOh+CWddZDndajwC6jVxhVZ+kQ94=
X-Google-Smtp-Source: AGHT+IGL44vW5/A++LXsZvrcU+Vla8hGWRBCR3n4mujmGHag6lTr8K8jbX9VXFTAyePxtqUQY98O/g==
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-440a669994dmr78600255e9.21.1745826073423;
        Mon, 28 Apr 2025 00:41:13 -0700 (PDT)
Received: from localhost ([41.66.99.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d495sm10072538f8f.2.2025.04.28.00.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 09:41:10 +0200
Message-Id: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
In-Reply-To: <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>

On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
> On 4/25/25 12:44 PM, Luca Weiss wrote:
>> Enable USB audio offloading which allows to play audio via a USB-C
>> headset with lower power consumption and enabling some other features.
>>=20
>> This can be used like the following:
>>=20
>>   $ amixer -c0 cset name=3D'USB_RX Audio Mixer MultiMedia1' On
>>   $ aplay --device=3Dplughw:0,0 test.wav
>>=20
>> Compared to regular playback to the USB sound card no interrupts should
>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>> be handling the playback.
>
> "should" isn't very optimistic - I assume this works for you? >=20

Yes it does!

With 'should' I meant to describe the expected behavior from using this
since most people are probably not familiar with how this works.

>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
> [...]
>
>> +&sound {
>> +	compatible =3D "fairphone,fp4-sndcard";
>> +	model =3D "Fairphone 4";
>> +
>> +	mm1-dai-link {
>> +		link-name =3D "MultiMedia1";
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +		};
>> +	};
>> +
>> +	usb-dai-link {
>> +		link-name =3D "USB Playback";
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6afedai USB_RX>;
>> +		};
>> +
>> +		codec {
>> +			sound-dai =3D <&q6usbdai USB_RX>;
>> +		};
>
> 'co'dec < 'cp'u> +

Aah, I thought I checked for that already. Will fix.

>> +		platform {
>> +			sound-dai =3D <&q6routing>;
>> +		};
>> +	};
>> +};
>> +
>>  &tlmm {
>>  	gpio-reserved-ranges =3D <13 4>, <56 2>;
>> =20
>> @@ -1178,6 +1214,7 @@ &usb_1 {
>>  &usb_1_dwc3 {
>>  	maximum-speed =3D "super-speed";
>>  	dr_mode =3D "otg";
>> +	num-hc-interrupters =3D /bits/ 16 <3>;
> Where does this number come from?

I'm honestly not 100% sure. As far as I understand it, with
'qcom,usb-audio-intr-idx =3D /bits/ 16 <2>;' in the qcom,q6usb node (which
I've checked against downstream) we declare which "XHCI interrupter
number to use". Without the num-hc-interrupters property we get an error
that not enough interrupters are available (I assume only 1 is then), so
this value practically needs to be higher than the <2> from earlier.

Why it's this value and not a higher value e.g. 4 I'm not really sure.
Downstream code looks somewhat different and "max_interrupters" in
drivers/usb/ doesn't come from a dt property. I'd need to check more in
details what this code does - or maybe Wesley can help.

Regards
Luca

>
> Konrad

