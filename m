Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7030CDB9
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204908; cv=none; b=RNHBbcUedUFT7jxGGOR1lZReY4OWOaFH4N9ygdFAIxfz0bHImGcnq2EJ7KOLNBb4nY3VBetz/RFRDBGF++VfzPv271bg3da9BgsU44gIf/jdCQaSd2lVvrc1xc8ZIGPTfHRqkJm61ffgHLqUPVf0m0w3N1xMSoxXjBlMkfFCF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204908; c=relaxed/simple;
	bh=0coe/QFA46JTNO8ZaDwBRkRFUpFZ853bhqXJwpYcdJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NTYWWfrOiP2eWacPPLe1jed0koLP5t6FfITHahIeAU7K1etpm7MW0nrMAeq48lGkOUjTYyeYiBLHQMCXkW04O7wxjSVjpRhgyme1ZEIPYo4Ey5N7vvOWWPLua+0zQ6Qyad9++HOb5UF3qhC/RBBMqv61mRREPonyxzuGs47d318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lk7TGhlz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lk7TGhlz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso6989265e9.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758204905; x=1758809705; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+c/huWZ2XQVoB94N5MFK08nC3wxU/KugANouKkKYms=;
        b=Lk7TGhlzYn6lyGn8+tHFCIin/wZclvaCNn1jUlAL5YNc3Y3YUN5A3jSRj095h//S09
         HQWdvLaugIm80UdoTqK9u0n/sN3EfK2q9t4EIiz3nmJR1uia9594eS+C99pxPj8mdR5Z
         2deea6jyfC4SRfJtlUXjOH7pX0cAxxxf9D/zVQpUFOJRFRpRf01aGs1MORhVe4DhJuMp
         Od7kkZIRngBJ0GUMSlORi+BAfOG2l/7Rb9AZ0JFlQJA8m+ss7U/GOPzMLzsA7dvdgxVz
         RSVbMab0NrCfmQM4AZXqsJioZjAMabqRlEJDee9qTOeU33++d6wNwJeMe7/FziBna6E9
         okmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204905; x=1758809705;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u+c/huWZ2XQVoB94N5MFK08nC3wxU/KugANouKkKYms=;
        b=VUfSWUzYhjXDQpnoChoJaazTfNk6BnT9WWAEwNWMbKUPpLdLzEXW6g7tg5OUzA4gim
         ROdnoCjDtl1J9Qb9w1+xVMy59D2PtTazyaFfMpBXuMKjcLOYlV0RK5w/sCbyZ/i7mOlD
         Nsbo++B15S3++YsT0VlcrdoJBsxHDkjY4Kmp71kj/COA2AhgaBRiPoD5Glq+gJI2lpfF
         LVeZ3pIQR/wWrXYntz7b2knOH0/a8LJJB/r95D+7e/3Fo99PVQvkVx3dc2seP1Jc7oYH
         hDbCTKwtRgTlMqRVL4Bd2BPJliAgD9/PNZha+bsMU6piekl6v+AGiQJ83YwWhrP1cCve
         CJig==
X-Forwarded-Encrypted: i=1; AJvYcCXkEpGsio1Mz6o9sOs+37pKsJDOnn4RWEWA5noRRQBA/av1kcXqCyvlonXwQO7De81+vXOXrA8i+Fl6uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzktb2LGnHQGulWKzTExkAgKD4jPtmE7g/hUH05GrVsQCGzCPnw
	4olaDlgB9ckNTCRQWRxFOS25SdJ1ZMWgbFT1uUzJboMFpr0DNI7h36Y0aGv1FG+ZEL4=
X-Gm-Gg: ASbGncsuF+83xUP6QJwOH33fz3M7kj/sXpb0RspCgFrW1nOxosDPThfVqiEYuQMfSuW
	JGDsbk/WPn3kJ8CPoUf9x4OE38eOcu3iAxLvpyB28tXLR8xub8Mx1yHAeVZzNRcBn2u6oys5Hr5
	OF0BzSKmqp0iM2m3YAQz5NfjQfNR7JWPB2aUi4E9499rxeVCAtdB25KBIwoDBOGmRkHWt7491OU
	Av9yVYwAe8uSSMuMFMbgygNlr7O5w57d/InU5b+6kykMEzkQZJLWIErTvcy+SQ3OSwt6E/H+iQp
	W0G1bWSEEG0rHAQ1/kwIPofhFaiqupvg9hb+gNOhJLEPm+VeRBFPLiSL/tGS6MBGlzeD23LouJs
	99AfrpwIYlj+ojAls9bDho/Rm10Iop3HwqMv2TuZeydqpcyI=
X-Google-Smtp-Source: AGHT+IEYvV21OOIrM80imACv5lq+0ZHSelW3dyd44ly0+BqTeDL00+tLVvxEUiu7IKEHLLcpukn1Bw==
X-Received: by 2002:a05:600c:1385:b0:45d:d944:e763 with SMTP id 5b1f17b1804b1-462070ed655mr54250015e9.33.1758204904949;
        Thu, 18 Sep 2025 07:15:04 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e93dd85sm94618805e9.22.2025.09.18.07.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 15:15:01 +0100
Message-Id: <DCVZMD9HWPX0.LOKMJXTY1Y46@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-5-81a87ae1503c@linaro.org>
 <58d32bd4-d854-4233-89c9-22c37bddfaa1@oss.qualcomm.com>
In-Reply-To: <58d32bd4-d854-4233-89c9-22c37bddfaa1@oss.qualcomm.com>

On Tue Mar 4, 2025 at 4:56 PM GMT, Konrad Dybcio wrote:
> On 2.03.2025 3:49 AM, Alexey Klimov wrote:
>> Add sound node and dsp-related pieces to enable HDMI+I2S audio playback
>> support on Qualcomm QR2210 RB1 board. That is the only sound output
>> supported for now.
>>=20
>> The audio playback is verified using the following commands:
>> amixer -c0 cset iface=3DMIXER,name=3D'SEC_MI2S_RX Audio Mixer MultiMedia=
1' 1
>> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 49 +++++++++++++++++++++++++=
+++++++
>>  1 file changed, 49 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/=
dts/qcom/qrb2210-rb1.dts
>> index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..e547537cffdbc13cfd21b8b8=
b7210b62996ff431 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> @@ -186,6 +186,47 @@ vph_pwr: regulator-vph-pwr {
>>  		regulator-always-on;
>>  		regulator-boot-on;
>>  	};
>> +
>> +	sound {
>> +		compatible =3D "qcom,qrb2210-rb1-sndcard", "qcom,qrb4210-rb2-sndcard"=
;
>> +		pinctrl-0 =3D <&lpi_i2s2_active>;
>> +		pinctrl-names =3D "default";
>> +		model =3D "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
>> +		audio-routing =3D "MM_DL1", "MultiMedia1 Playback",
>> +				"MM_DL2", "MultiMedia2 Playback";
>> +
>> +		mm1-dai-link {
>> +			link-name =3D "MultiMedia1";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +			};
>> +		};
>> +
>> +		mm2-dai-link {
>> +			link-name =3D "MultiMedia2";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
>> +			};
>> +		};
>> +
>> +		hdmi-i2s-dai-link {
>> +			link-name =3D "HDMI/I2S Playback";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6afedai SECONDARY_MI2S_RX>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai =3D <&q6routing>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai =3D <&lt9611_codec 0>;
>> +			};
>
> "codec" < "cpu" < "platform"
>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Yes, you're right. I need to sort it for the next version. Thanks.

Best regards,
Alexey
