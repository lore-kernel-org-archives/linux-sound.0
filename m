Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921827CCC8
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361545; cv=none; b=ppXDL0Bc3hjANfZNrMmQAtc+WH7cyBwaaeLdeolp9DuVFOMY3ue6Pdi3cIteRu4Spf+p+HaqnyFI919lsgq8szFVnAzBJMd4fv/+sUbir8RDSsJflCg4lIKK4PrSB5SlauljbhBPDovQML8NDSUS8ZzEdd0OpUfpGo6UQKVbHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361545; c=relaxed/simple;
	bh=yfN2uQGm7zbUd++gV/nEJsaDi3LFlJ4HhiGQBuIdi5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EvHEg3R8IxZIv8zpeHob9CnQPR2/NuHL8vXmDrVMnejX9tX+/hRK2cuzI3p4YuGNu6d4p9oiJpi9oDp6R/3vJckNGhci7kecRdbdlnZEozvQw8uf6D/Nc8e7qAy863SnoJAbtQP4wq+Su6LqxTDfg6XpSgJit82X4reBAauTDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tju3Rccq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tju3Rccq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a37a243388so3608296f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748361542; x=1748966342; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLKlrSM5FsamXha6aN6KEk+RGQKQsgUaENo7zbmfoNQ=;
        b=tju3RccqZMoLfrpizNOg32ku6XPo2Vr5LDfbDsQ5IiUV870YoIJgS1H/ATswtw/U2t
         Dh5Kb8+kkxc3Lp/LR5Mn8MRPEyA/GLTZxrzap6fiBTNVB2ELfET9yRox6X6GMLcRnXpZ
         QUxF4hQqxSbyuyvzCLK/BbzoMajB0zzAuiyx5jJ1geCa3c78jbdrXxvGB5IntAjV89xC
         IgO9Ppi5uTBbuW+C1qmZXriPhBNeXcFicHpkWcC3mSc+aK222HJlKzyQOijC8+/RsAce
         lMUe1EMhtfkLo+lqMsCNeNAbARlh+gmidif8bOcepupq5qvm0tT7smVTF819Mq13x5Sn
         nPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361542; x=1748966342;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLKlrSM5FsamXha6aN6KEk+RGQKQsgUaENo7zbmfoNQ=;
        b=bt5b7pyLsuuK6PN/rQncy+YfquEfBQLJoIEULfBC6SurNWJwFb9T4ojnAnbYtaHqEp
         o0foMuxZzsfdygLumTiQvVPoRu/6NS/lI4xGCRwsJD9P2G92CKsgnJnDGTYvyao+4Xzl
         m6KkG+iaDKUJO2Q/cg9yem9wS3BtSgoLxKrVIHJ3PIO8pBo4PHA6xJBWqSbxL3sLM6mt
         qeyAcvlMVSQslPGt8fGHR50GnsJrBfv3tWAhFJyK8nNLDEhhw1grdfseFnyQhzUvzePo
         Ere9bMTLJ1Hmnq6RBDaRR8h6raQDAc3k0jqDLfh1hwXeiWzggHrgDih49iS5ypfktF7x
         9Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCXqjh7UpL+SliaM/5poN+BUJqSOOLRn8BAmFrnNEMrleSn1Nut+VVu5ML34ozi4cd7wP5rALcONL/r4ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBQQrOi1++FcllvF1fYE9hvl2i2WQUFlQbhu/jXKuR5+I0jg6
	ZJ3loA0tVGkVcTIOzHiFZsjJL4trBgIM270FrkNMYllhcUdOVpIO+O3cGFg6smd82LA=
X-Gm-Gg: ASbGnctU+PuCUzB0JTYIeQDdtcGXYhnvqeICDgnX0yAG7exr27NWpJTZHtBPcXU9NHG
	6oSEH/104fIvKSWetljUcbHlVxGL0R0A9lhGhgUXErA/3Mzf8gKZwYRTOBKefqwNotVbzZm9BRd
	BEA0BYpIZpkAyQwgONNohgS+Ab+EVK6u9UObVaIehn34x/SJkdvZuKCweGfJv97LMwVdeZQGpHu
	aoyoaDX76Cx7aWmL9Z398UOhYy1Xf+U8jHjK+agibm7yz48pcDyqgV2lU+yMpyOoxnkWwFawCYO
	mYhV+bY3ja6XCXmLLxviX+MA2g4+4R0b3PO2Le6rlrieaD8Si8Cym7Jk4g==
X-Google-Smtp-Source: AGHT+IH8iNaWsyltjjn5hm92Mn0i+lKy9tqudHYWMWemBgptnZTFbGMbCShMorMXcJs0g8uoqovcGw==
X-Received: by 2002:a05:6000:2087:b0:3a4:e706:5328 with SMTP id ffacd0b85a97d-3a4e70655cbmr52232f8f.48.1748361541676;
        Tue, 27 May 2025 08:59:01 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d4132534sm8134257f8f.21.2025.05.27.08.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 16:59:00 +0100
Message-Id: <DA72FVL1VA1K.1MS0NMPR9PJ87@linaro.org>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
 <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>
In-Reply-To: <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>

On Thu May 22, 2025 at 7:12 PM BST, Konrad Dybcio wrote:
> On 5/22/25 7:40 PM, Alexey Klimov wrote:
>> Adds data and clock pins description (their active state) of
>> soundwire masters and onboard DMIC.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 62 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/=
qcom/sm4250.dtsi
>> index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23=
932c20bd048fbe80 100644
>> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
>> @@ -37,10 +37,36 @@ &cpu7 {
>>  	compatible =3D "qcom,kryo240";
>>  };
>> =20
>> +&swr0 {
>> +	pinctrl-0 =3D <&lpass_tx_swr_active>;
>> +	pinctrl-names =3D "default";
>> +};
>> +
>> +&swr1 {
>> +	pinctrl-0 =3D <&lpass_rx_swr_active>;
>> +	pinctrl-names =3D "default";
>> +};
>> +
>>  &lpass_tlmm {
>>  	compatible =3D "qcom,sm4250-lpass-lpi-pinctrl";
>>  	gpio-ranges =3D <&lpass_tlmm 0 0 27>;
>> =20
>> +	lpass_dmic01_active: lpass-dmic01-active-state {
>> +		clk-pins {
>> +			pins =3D "gpio6";
>> +			function =3D "dmic01_clk";
>> +			drive-strength =3D <8>;
>> +			output-high;
>> +		};
>> +
>> +		data-pins {
>> +			pins =3D "gpio7";
>> +			function =3D "dmic01_data";
>> +			drive-strength =3D <8>;
>> +			input-enable;
>> +		};
>
> Other SoCs put these in the common dtsi

which seems to be sm4250.dtsi in this case unless I am missing something.

Thanks,
Alexey

