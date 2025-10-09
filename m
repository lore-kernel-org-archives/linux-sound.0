Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368D1E2858
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023510; cv=none; b=sh5ioUGmL+DTiDd2M93gvDsC/ztLSnAavgqVwkZIWuNdjJSJzclrd+5OU4ny2eCS+rneOHG/C8/Lk02w81iVtM+FGopwH6Vo0RkywExK611dy4xpgfzHwteeCtstOIfLQBcEB9iAM93pZfN9syZH64lWBqojVJF7eqTwal8MDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023510; c=relaxed/simple;
	bh=NpJ4lQfb2fZu9QwAIvzljS9KYx6hqhDyEyM/zJnLT68=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bMp9L2C4vglP/sGnLDjAdEwhOJpdsUY/c9o83OD6h3KMV62FFH5Pa5vv9Mx6cgz8p+TtsrXo/mf9giWXvL4DWQdp00+wLR6VvzIcqLwzzSlP3DltH/mYsQNRqQwIZC3vJKLy1FuUbQjEe8oqxhIAxeWac7YBQyaHYwqCx0qFPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDNGhLiS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDNGhLiS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so9094795e9.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023505; x=1760628305; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaeUDsfd9sTW1180jO+0QTGZpCCHWZiAOxn4EOO0ha0=;
        b=LDNGhLiS4vYC2CzloRRzmr4xYn66yF5zPyoEaEeuH3qE0eNmv2ptqSj4ZimXCIR7Q9
         4L8vscEQUwfxr6kc90c4Fp2Iwvjmi3S01FuaW74sg27EKly55TwD1+OYBSIW0jsU80qO
         b/EGkSVAWZ7q5Mg+mWvXgZZU6T4Sgxxv2NEaRR4D6v5Suo3D7v0teR2OXaVOdClKqJGJ
         NSjqRBDAxwv2mD4EZfvi7J9skx4lPJ89IlvOtfjl7Lckgw9T4gweA3+7Eav+VLVabwpC
         GECp8+VfDlpu/PypF0sMfE2+9pl4uSJDUXpY9po7arRN7bKEIYO8AMpveuk7lK5AbSA9
         XdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023505; x=1760628305;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaeUDsfd9sTW1180jO+0QTGZpCCHWZiAOxn4EOO0ha0=;
        b=o6ku2mf8hL30iSRswMAtvQj4TVoTwcjFH4b340xJxl4/iBD9wCUb8vsjwbz/cHXCyV
         TqWAAaA/eWA7ceKLOOpm14Gqg4dZW0WweUn9ovilq8iX3IrQgOeFh0cmfxFZ9n+BTgT0
         UoT+2VeWk1XByacVplUdKBZrQgm3nsAJINBvjjL7GC7Dsf2ji47GN5H9U499vl+a8n6o
         ooYdWo0U4F97WWKsthss8LuJOf08Zp0/Rjl5nyKhFxD/1LZB2tom7iSFYJu9AUMUSy7I
         ZZF1uQhfiqFFN0lGtrTRvsIP1M9kJRHGyoQJeHpw4C/kRRbJ95WsM1X+0C3KeOVR1hk5
         795A==
X-Forwarded-Encrypted: i=1; AJvYcCWryql7dMUMqkNX6lSA4zg01oExRiPVqP8xUonILSweEthuHFlxkHdV9mc4AMmF8s2uYPM2y5jzcdiLdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0UyKimBJdfRNxklMvFYmSQYaub7J0dm3ryxXKhxzvUhgIrdJ
	BAHP5ZSYxlwyD55rz6ovEJivGo+5vP+q5DyKN2rwLLeXmLiH96WcxEFcayRwXo7RQiw=
X-Gm-Gg: ASbGncuss6ato4CllGdN/KpS58g8J9WowAiL/XNq756iKpUn5sTzUudnJk8dCnddOYA
	+Xd+KWe1nx2KYLJZ25ekQiUeY2H45lftVBfXtbU8uGzatvRaKLQy2aU8jNgyNSj+2/e7j1D3qzv
	wvo5jPgtjb4T4JVUSNpNoyLEU8GoCvUAiSTIvKnto5v9UrImWjqQRmm1AjTW8MYqEpWFRyFZNR3
	XRBa/SJ7CP2mVZ73wrMczeaJJs+ptjE0n2rgQ3iPh9EUJW6J9WfBmijPjS86/O4pOBCd5141cWG
	qytL9sJLu9pO+l5zVFbnKiZBOjnJXy+7C8UWtKLZXNShoL8U/OLOYkWj4DF9T9ryM30B1mbgvaF
	o6laDstfqXo3pY6VyiolqhEG0jr9WOseO13S1EUFMXhRI89p2ii+pdVPp1nnNfkhB
X-Google-Smtp-Source: AGHT+IEa0ViiyonOKuB72WiAM3yriwHBzcChfbGV0FyxvLukHsxAnCh+5OaxHUjUMTlExydg9IoGog==
X-Received: by 2002:a05:600c:1f06:b0:46e:384f:bd86 with SMTP id 5b1f17b1804b1-46fa9a9443fmr51283015e9.5.1760023505262;
        Thu, 09 Oct 2025 08:25:05 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:5333:92bd:dab:a2ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e980dsm38590177f8f.36.2025.10.09.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 16:25:03 +0100
Message-Id: <DDDW9FN6B097.188MIFGQOOSQW@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, <aiqun.yu@oss.qualcomm.com>,
 <tingwei.zhang@oss.qualcomm.com>, <trilok.soni@oss.qualcomm.com>,
 <yijie.yang@oss.qualcomm.com>, <jingyi.wang@oss.qualcomm.com>,
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] ASoC: codecs: va-macro: Rework version checking
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Rao Mandadapu" <quic_srivasam@quicinc.com>
X-Mailer: aerc 0.20.0
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
 <20251009143644.3296208-2-prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20251009143644.3296208-2-prasad.kumpatla@oss.qualcomm.com>

On Thu Oct 9, 2025 at 3:36 PM BST, Prasad Kumpatla wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Open-code some of the registers to make the checks anywhere near human-
> readable. Error out if the version is unsupported or if the VA macro
> isn't supposed to be present within this LPASS instance (since we can
> check for that now).

[...]

> +static int va_macro_set_lpass_codec_version(struct va_macro *va)
>  {
> -	int core_id_0 =3D 0, core_id_1 =3D 0, core_id_2 =3D 0;
>  	int version =3D LPASS_CODEC_VERSION_UNKNOWN;
> +	u32 maj, min, step;
> +	u32 val;
> =20
> -	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
> -	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
> -	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &val);
> +	maj =3D FIELD_GET(CORE_ID_0_REV_MAJ, val);
> =20
> -	if ((core_id_0 =3D=3D 0x01) && (core_id_1 =3D=3D 0x0F))
> -		version =3D LPASS_CODEC_VERSION_2_0;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && core_id_2 =3D=
=3D 0x01)
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &val);
> +	if (!FIELD_GET(CORE_ID_1_HAS_VAMACRO, val)) {
> +		dev_err(va->dev, "This is not a VA macro instance\n");
> +		return -ENODEV;
> +	}
> +
> +	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &val);
> +	min =3D FIELD_GET(CORE_ID_2_REV_MIN, val);
> +	step =3D FIELD_GET(CORE_ID_2_REV_STEP, val);
> +
> +	if (maj =3D=3D 1) {
>  		version =3D LPASS_CODEC_VERSION_2_0;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0E))
> -		version =3D LPASS_CODEC_VERSION_2_1;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && (core_id_2 =
=3D=3D 0x50 || core_id_2 =3D=3D 0x51))
> -		version =3D LPASS_CODEC_VERSION_2_5;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && (core_id_2 =
=3D=3D 0x60 || core_id_2 =3D=3D 0x61))
> -		version =3D LPASS_CODEC_VERSION_2_6;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && (core_id_2 =
=3D=3D 0x70 || core_id_2 =3D=3D 0x71))
> -		version =3D LPASS_CODEC_VERSION_2_7;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && (core_id_2 =
=3D=3D 0x80 || core_id_2 =3D=3D 0x81))
> -		version =3D LPASS_CODEC_VERSION_2_8;
> -	if ((core_id_0 =3D=3D 0x02) && (core_id_1 =3D=3D 0x0F) && (core_id_2 =
=3D=3D 0x90 || core_id_2 =3D=3D 0x91))
> -		version =3D LPASS_CODEC_VERSION_2_9;
> -
> -	if (version =3D=3D LPASS_CODEC_VERSION_UNKNOWN)
> -		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
> -			 core_id_0, core_id_1, core_id_2);
> +	} else if (maj =3D=3D 2) {
> +		switch (min) {
> +		case 0:
> +			version =3D LPASS_CODEC_VERSION_2_0;
> +			break;
> +		case 5:
> +			version =3D LPASS_CODEC_VERSION_2_5;
> +			break;
> +		case 6:
> +			version =3D LPASS_CODEC_VERSION_2_6;
> +			break;
> +		case 7:
> +			version =3D LPASS_CODEC_VERSION_2_7;
> +			break;
> +		case 8:
> +			version =3D LPASS_CODEC_VERSION_2_8;
> +			break;
> +		case 9:
> +			version =3D LPASS_CODEC_VERSION_2_9;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (version =3D=3D LPASS_CODEC_VERSION_UNKNOWN) {
> +		dev_err(va->dev, "VA Macro v%u.%u.%u is not supported\n",
> +			maj, min, step);
> +		return -EOPNOTSUPP;
> +	}

Why?

As far as I understand the behaviour before this change is to continue
even with unsupported LPASS va macro version. IIRC when I enabled sound
on Kaanapali QRD device it worked even with unsupported version, it just
needed a fix to calm down the warning.

Why this needed to be changed to error out as unsupported now? Will there
be a permanent damage to hw/fw if we continue?
Shouldn't this print a warning that execution continues regardless but
with low expectations?

I kinda get why we should give up if va macro instance is not present
but not about change of behaviour here.


>  	lpass_macro_set_codec_version(version);
> =20
>  	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_vers=
ion_string(version));
> +
> +	return 0;
>  }
> =20
>  static int va_macro_probe(struct platform_device *pdev)
> @@ -1594,10 +1626,14 @@ static int va_macro_probe(struct platform_device =
*pdev)
>  	 * old version of codecs do not have a reliable way to determine the
>  	 * version from registers, get them from soc specific data
>  	 */
> -	if (data->version)
> +	if (data->version) {
>  		lpass_macro_set_codec_version(data->version);
> -	else /* read version from register */
> -		va_macro_set_lpass_codec_version(va);
> +	} else {
> +		/* read version from register */
> +		ret =3D va_macro_set_lpass_codec_version(va);
> +		if (ret)
> +			return ret;
> +	}

Thanks,
Alexey

