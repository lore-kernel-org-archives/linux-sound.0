Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F26CDA9
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580837; cv=none; b=pAVl1804bHUabuFLZ+Akf9uPHioPxsAY0FMd1QGJ+9uvPpobpQ9XKDxPrA5qJsPFn+tt9O0MxV7hz+d2PSpuvxAuSbdWZ+2YiEo+gHXDWwHhRcpCoWWjQuVwxnajHSp59LFNUEc8xEfFjInXZdp9Ng5C0s6OYeNple7Ofaz8XQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580837; c=relaxed/simple;
	bh=WEyYkpof9FQ9wxzmt9yxgXdvUZ5yezofqlz1rRRr7SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyJMPt1V/DKAL+0F6j8uno9ZiTwiJ6gbNHIuIbDVi683MSWdcxtHPLuwUnCtKFA848WtIHpzZXaslzn6Kl0t2SL2OkHWSSD+IYgkaaTeFCwlYPuRhgNYhbajy6M9PnyemxHs1gK/ihWrox5i/KbT+P5c5bvYVx+gvrCwrkUYbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwY4Wpa1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwY4Wpa1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4165d03308fso10985825e9.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712580833; x=1713185633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIfWhO56deLbZSEvQDXUk02FMIpJsCPYMFdPM9Dpyf8=;
        b=EwY4Wpa1t0VMyrdmXjS0phBWLnbhDaR/BkShQyeHNk+FEk3kY/MEoPBk4St5YWxaeP
         jG2/e/MFbAlC+CJ/QoTrtRjwMje6cvVfAOOV/TonalhDd4TmuaZx1xiBKCnD6jBD2l1E
         tghjbh3+ZMTr5GXHYrJR867K+98LIyWiVH/hL8meqx2zuBs9C3AfFRXHJDqXsOl7kUVn
         9biBwdgzmobqAdCTwQc4gBSURyilQIC/6uwuE/uxq6lySwClyykUuuREEaz3noQRCDoH
         tEtKVo/O2Xn/OIhYRAEThW+1pLbJEHSo6QCg9GoZ82otsr+f6znTAobqZBwdSM7hIGVA
         ibAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580833; x=1713185633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIfWhO56deLbZSEvQDXUk02FMIpJsCPYMFdPM9Dpyf8=;
        b=S/GIBcGJKUQJ9gp+wClFju3GVcXRu8k0YTlVFq03UOoNTPE/ZaQoiWt+IXrie+HeTQ
         BBJWpxMdLAENUl05G1/YWFEB/02umymcY2QmXVx9oeF1dKepGfRirF2R6D+1Jysapy0K
         0nE5HCLu6/PaPlnOGqVocHEvVGM7oYVK46kIvvu44C67xTdrVP4bEbLUSelei7ErOM15
         AJtEoRcdTEse0mtieoFjaEklLOFNMSG5IghZ1j6CQ0YP/idRZERZYHIW+5Tl8I49Rzvj
         bkZUx/0HALU4x8k6+3V9Zo/3tMZt3ahXWCRWeEvJSR8UiViMTHg6nDU0xrC8xtrp/zPI
         TsKw==
X-Forwarded-Encrypted: i=1; AJvYcCX+huTxYY5SntHjHkRVUZ4zfaqCQrKXsEC39n0hTs5frRG2U+26jlGMk6FSqWoZMgW6UNrCeTQuLFid7OxKBoOnC+PU0eyfqP/7/B8=
X-Gm-Message-State: AOJu0YzzkktNrqY1Ibw1/EZNZDFk7URs2tN3beY1rv/hUhI7UWYPTdb/
	Ct21SasFze6BIPLm5h2i98RCm0qfpKNkf7AyKGmRmtX+N+GKSOVog1k3BGwya8A=
X-Google-Smtp-Source: AGHT+IHyE5Dd+kfClSIf5iATYVOm+3kL+yD0XMIPSdxm4HEG5u0fs2phS7pNvDc9p8PpDMGtMsfFfg==
X-Received: by 2002:a05:600c:3b8b:b0:414:8889:5a2e with SMTP id n11-20020a05600c3b8b00b0041488895a2emr8878647wms.30.1712580833297;
        Mon, 08 Apr 2024 05:53:53 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id bg8-20020a05600c3c8800b00414807ef8dfsm13342654wmb.5.2024.04.08.05.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 05:53:52 -0700 (PDT)
Message-ID: <baa6543c-5e2e-4f28-a95b-a086b32d1f2d@linaro.org>
Date: Mon, 8 Apr 2024 13:53:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 2/2] ASoC: qcom: sc8280xp: Add support for QCM6490 and
 QCS6490
To: Bjorn Andersson <andersson@kernel.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
 <20240408042331.403103-3-quic_mohs@quicinc.com>
 <45yy3cvepk4uwi2jdmh4w6l5ac3dffqhbot6xzv2bwjvo637ss@pryzth2hghyu>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <45yy3cvepk4uwi2jdmh4w6l5ac3dffqhbot6xzv2bwjvo637ss@pryzth2hghyu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/04/2024 13:45, Bjorn Andersson wrote:
> On Mon, Apr 08, 2024 at 09:53:31AM +0530, Mohammad Rafi Shaik wrote:
>> Add compatibles for sound card on Qualcomm QCM6490 IDP and
>> QCS6490 RB3Gen2 boards.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index b7fd503a1666..878bd50ad4a7 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -169,6 +169,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id snd_sc8280xp_dt_match[] = {
>> +	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>> +	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> 
> We now have 4 <platform>-sndcard and two <board>-sndcard compatibles
> here.
> 
> Not saying that your patch is wrong, but is this driver board-specific
> or soc-specific? Srinivas, Krzysztof?

Normally this should be board specific.

In the past we made them SoC specific and provided a way to do board 
specific changes based on compatible. Recently we stopped adding new 
drivers as most of these drivers turned out to be identical and lots of 
code duplication.

Having these compatibles will help both the userspace UCM and provide 
hooks to do any board/soc specific configurations.

thanks,
Srini

> 
> Regards,
> Bjorn
> 
>>   	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>>   	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>>   	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>> -- 
>> 2.25.1
>>
>>
