Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76424DD0E
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546190; cv=none; b=kzbZxy1diApPkdSdMS/nbJ94MvQBW7POOwHVUo0kprPHkcWF2ovqSdjKfpYoAlSXkCvNly2ZFxuezxAIzY/BrIGVIVFdVCCR5Te/Mv/t48ericxkpBTEc1ArAGU/twXfIhCPRlyd6Gkz5/eCFJy+m78xzmiyzl9oE1CfSvFHutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546190; c=relaxed/simple;
	bh=xyZHNhiJS/pHhq2vsxbLXqxnAxxt00CfAgWHeW4ulKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GxrFeZUpKoe4jysWIGZO55PbFY9PAoLBFirLDTh48vZEKhlpFehK9Oz3f08F+QXwWB7lUGdTPMyN5FUepNsTzqT3a6Img6/4uSCz0b5C7BZXWB4l0yi5aNjNX9sEkG7pZHtI3Sc0/h73QUEltbr4H9B2rgpoYNWP4X2oQd+eNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oC8FmeTe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oC8FmeTe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so43661925e9.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760546187; x=1761150987; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/6PIHQYpxFdcD3g1Rb8LKFnlbKq4ABhAEEAfugnKj4=;
        b=oC8FmeTeCyfVOQsBN63xBIgkfByxyiOlGP51OSIMZqCLycjDVO0Tv2ejEKLyEbyuGR
         YoP0Wn4P+g52AEG6x1em/qhXtvtssv6DVeycUqZpQfngKgL7Uz4Is+07LiGgb5zu3tuH
         oPDDvbF3+ipN9NUQS0ymPARy0P2HYyOcpfSlCV2IJLw1Wb1+kTdUZzNne9syb9TdEyTN
         OJ8u5GPZioMlNa9nH2HGvgTNsPOeP9IvuOuD+O/uJ+sLe6jfFna1olKNMejsJMUqi50x
         +qUaqmxWsbd/92MrnuTKuGpsttnJD+ZypNN3j2z602nDwV5iQN/hSXdDE+c3Pl20CaEs
         MTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546187; x=1761150987;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/6PIHQYpxFdcD3g1Rb8LKFnlbKq4ABhAEEAfugnKj4=;
        b=q0llHSJbp5UtggMrhZeo6TSl5C0O/BunP7C1jqyi+m8we5wfr7bOX6H9WuJWOTO3v4
         /F1PfkhkuOTr/wPS6JKWWR36YXvewYE0ogYzfw1gtxTd5pQdKMhnD1U6aXVXr5W/I5Ut
         96jPwwLH68GXk4t5zqR0C7RvLYic4zZw5RUh1CIZwaX9o5l76xYbMofhA1FHWR9puY6X
         Rcvb/qKjmZMBft8NGGOsnIFjL3/v19SMO/LQ3jOBrL8UxEJH5yhbb76oRPxYwMeeg9s2
         3Rv5OuFZ672FAT7yxG2Gh8nmcpDAbV+3RHhPMcQ5+Y06wENrd8XEzUwZln4dypr/iz1q
         wxnw==
X-Forwarded-Encrypted: i=1; AJvYcCVfUIQ6pHtPepMpBEuQ6ahSO94iUxCoM9z0vWvNYb3xFzemxvwkYHE7nHA7MQdEgh+2w33cxHqt5Mq26g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIvXVn9r1aNWE/zLOg+4jbMxlMwDtJ1npfuArf414K08oEUzb
	0Ixsb6Lx9FPSy0fLNtWQaqR9yE9a42GyCf/8IWOcC2VZtdkeMCes2UlQ2u5B+ex7PYI=
X-Gm-Gg: ASbGnctDeBB/diJvBvAxLkQHJRM5zDB3JYcvTjFi+f+o/K1CRKjVD/3M6/jk+Qkb/r0
	WHhkRpnNp1SRDClj44XnveWmLvrzmF6fnu9aCyW5Y/F5UkzsMhpHFmd09rMHAM3mXgDWm/wmgYp
	bfkkjSvZCxcVa7kOKGwsAHhFID/pjEetPhU9h7C5c7HAWqRVdrMz8PLorXGL8FUVem54u0FcC4y
	VWDuGY1gvw3yq1NOkrH6HabBX9l7nutZMaXlitaJ+OiKz4nrXns5ctMrPYqxuHQb95lFxw0hWbg
	QfdBSGj97lvJyKyoYRABweRel16tN5FQucYIhn33gnnfObjBYDVTOTzmIe1ykA4xsriX+aRV4/+
	glnJsu+v+sCXvIOiKbHPvErRlBc4P7izkAGl/FFF40jfZxrjT
X-Google-Smtp-Source: AGHT+IGVsX4Z6gvhEdWFe8CVNUsZF7cB3CGnm3rlIg452iDvItLU2/Uzxwubc3knG3XtRNgXtynQjw==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr17050645f8f.62.1760546187091;
        Wed, 15 Oct 2025 09:36:27 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:da1:8747:bd91:8232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3b9sm30734345f8f.11.2025.10.15.09.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 09:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 17:36:25 +0100
Message-Id: <DDJ1JCEPQA0S.2BS91YGW605E5@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Vinod Koul" <vkoul@kernel.org>
Cc: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Patrick Lai"
 <plai@qti.qualcomm.com>, "Annemarie Porter" <annemari@quicinc.com>,
 <srinivas.kandagatla@oss.qualcomm.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v3 1/3] ALSA: compress: add raw opus codec define and
 opus decoder structs
X-Mailer: aerc 0.20.0
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
 <20250917-opus_codec_rfc_v1-v3-1-7737ad40132e@linaro.org>
 <aMuTyZy50IvpAEG9@vaman>
In-Reply-To: <aMuTyZy50IvpAEG9@vaman>

On Thu Sep 18, 2025 at 6:08 AM BST, Vinod Koul wrote:
> On 17-09-25, 08:32, Alexey Klimov wrote:
>> Adds a raw opus codec define and raw opus decoder structs.
>> This is for raw OPUS packets not packed in any type of container
>> (for instance OGG container). The decoder struct fields are
>> taken from corresponding RFC document: RFC 7845 Section 5.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Co-developed-by: Annemarie Porter <annemari@quicinc.com>
>> Signed-off-by: Annemarie Porter <annemari@quicinc.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  include/uapi/sound/compress_params.h | 43 +++++++++++++++++++++++++++++=
++++++-
>>  1 file changed, 42 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/c=
ompress_params.h
>> index bc7648a30746f4632ecf6695868e79550a431dfa..faf4fa911f7fc2830c3ae42b=
93650fe40d8a776b 100644
>> --- a/include/uapi/sound/compress_params.h
>> +++ b/include/uapi/sound/compress_params.h
>> @@ -43,7 +43,8 @@
>>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
>> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
>> +#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
>> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
>> =20
>>  /*
>>   * Profile and modes are listed with bit masks. This allows for a
>> @@ -324,6 +325,45 @@ struct snd_dec_ape {
>>  	__u32 seek_table_present;
>>  } __attribute__((packed, aligned(4)));
>> =20
>> +/**
>> + * struct snd_dec_opus - Opus decoder parameters (raw opus packets)
>> + * @version: Usually should be '1' but can be split into major (4 upper=
 bits)
>> + * and minor (4 lower bits) sub-fields.
>
> Please clarify, if that should be 1.0 so a value of 0x10

Sorry for the delay.
So the spec says that the value must be '1' for 8-bit field for that
version of specification which it seems it should be 0x1.
The spliting into two 4-bit fields is for backward compatibility and
in such case any version in minor fields will be accepted (15 or less).
Anything starting with version 16 or 0x10 is treated as incompatible
version for this version of spec.

Well, at least that's how I understand the spec.
Value 0x10 in this case seems to signal incompatibility unless I am
missing something?

Thanks,
Alexey



