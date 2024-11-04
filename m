Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD41AF0A7
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718930; cv=none; b=DxxidJQODIshKBLYvb5rO7nZvciIzaltyfKuP7E2obzwi0oIXN/b3lnYkuR2yFkCKIUx02s3P5snkmWN8/bS4d/OSuKNZTSVZaSqXVkMEy/gkjxQr1mY3hrW5I+0TxR2HrIpP+Ovxdy9RwnBDUmHXoJx+4xTQWtqshmkJIqOn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718930; c=relaxed/simple;
	bh=d6QO4QYGlvPGTr3r5FY1HMjPPe70qv93K1mDlNdwVkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJEAwG/TLsCFo+nhV9FlZvsps0BZVYR0pgHVNNwwIImJQXo6QdPzdkcXahNjUW4IeoQvVSkAjGSPm7VVjCstmDR0o6L1Ke/Ulj6tr+NhKglfGBZTwzAAgj0DtTVXUpPSSsythZQ6dInAEDYYzcl+pSjZ0WF6yuU1zrPjP/GLqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA1POmll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA1POmll"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BCp9a005380
	for <linux-sound@vger.kernel.org>; Mon, 4 Nov 2024 11:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPm7hWUkTfuXs3mmy+IMG+HxOet17xzog7upRSLJQWI=; b=oA1POmll81HyLt/k
	S79/7kfcPtAq4IAVwPIC3XFeTx6gut752f9caP4jI7qZObi9tyeBIvAkCE8oDPFy
	jDfSSZR+zjYTaZVc2jX8RGRN4mGkOl6JROGsIGk2DrVhhOjD+ET514NDsnlyOmug
	fnfWLRc/LfEd8QV8wY5tswsqv9j3rE4uefLiaqEni2duOvIQO1WRFiUul2J3hGKP
	hKBh6shaBsauPoUdK8RdXF4Hv8xxdcg5lAAuYGS+qhO7iwMUQCT00bFXs5PvQo5u
	fJ67c7cKTNktDtTlPDlndwpqiF3vvqg3Nhgm15E4DWQJYw5L0qnq4EA43etMOZt4
	LkS9FQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s3ygb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 11:15:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbccc4fa08so10978046d6.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 03:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718927; x=1731323727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPm7hWUkTfuXs3mmy+IMG+HxOet17xzog7upRSLJQWI=;
        b=vxTNkwQh1WZvZfQVNra1n8uNgJQaA/NqdonXGHvaptEonLbaZiS9lbrZJD6eVCk6QM
         yxeYYX8y73r0H/HNC+0maiEZ1WLxORtBeS52n5pPYEPFpUu8RORH1SRUI6+amutud9O4
         DIITcS8LPYHEBBTy70RubFS/AdkZ55ApfyIQxTZ+lLzk4GpoQ1skuDrAEpykz/fZsJtL
         bPou7vU/NcwyltRnrchjRX6MMd8nFWTr2htodwBVvUoBa5VWLRzOCo8UHJJ9k6KVuuYj
         sih2SO9SZXVkdp/Et6V/zmS6EFXp5BMLjUsG7sTaxxfrlH8fCLcgFY3R+w2Kz3XLiOiR
         7YXg==
X-Forwarded-Encrypted: i=1; AJvYcCXgk8gjQQ/heCWx9dJwLKkZRxlKPlkyFXSFTCUJXmYfFkiJa+5M5ekXjPc1B/KSqv4b7OFIDG/Omgy4Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKP/thB3Z/zfD4C0Lw23MRwoyER89KVF82H3Z3DRocddrLdbrS
	q1FlDZBUEhreyyIK7dAhZOeR+L836p0vruStHJKg4OE8P8Ag1YzPUVyC/cNwi0FKdS/UUMB5/uK
	lC5HOOuJ0jvaMK55SLPlE7O1XDhf+K7mtFfBmVmXEKnk67/Taf/f5zkrj0yRieA==
X-Received: by 2002:a05:620a:1a02:b0:7af:cdd7:d6d8 with SMTP id af79cd13be357-7b193edb1aamr2141059085a.2.1730718927570;
        Mon, 04 Nov 2024 03:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEEocoupBY994SVKYmDQBEraVYB+dHfuiTwu9QnqVdzOdt1qQkKGFmvRV/Wq0sw8U7MpaTMA==
X-Received: by 2002:a05:620a:1a02:b0:7af:cdd7:d6d8 with SMTP id af79cd13be357-7b193edb1aamr2141056885a.2.1730718927195;
        Mon, 04 Nov 2024 03:15:27 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56494470sm537633666b.2.2024.11.04.03.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:15:26 -0800 (PST)
Message-ID: <731413b1-b660-47d5-96e0-719afb786865@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        linux-kernel@vger.kernel.org, a39.skl@gmail.com
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-6-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101005925.186696-6-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2hAOfs6olBmd6fQbBYlCDiaDDlajWcHQ
X-Proofpoint-GUID: 2hAOfs6olBmd6fQbBYlCDiaDDlajWcHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=918 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040099

On 1.11.2024 1:59 AM, Alexey Klimov wrote:
> Add sound node and dsp-related piece to enable HDMI audio
> playback support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.
> 
> The audio playback is verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
