Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8882E54B6
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923342; cv=none; b=PO7qP7yKFU/V82hn0dlHCf3z7SNTTA+KYxBrefCgL1SyfHHQXVGcQ5abBmhGEvEqrhtWEpcVjv6ILDHSyB9XH//G2SRwD9bI3lUMBfpHSqv6PCnC7JT6TWBv63bFEq13aliPSM39bOwKgaLlRSmI/QCESetejdmqnK78U5IaHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923342; c=relaxed/simple;
	bh=NxN20Gn0aHENTScrUN7kSeNIZDjx6Vfsg2GuEin00cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEFeudZFy4pEzQTkZUBXqBYso2n5mZloecOtls1wKadQtX6HxlNTTHALea4aY+RDUgaPUKsJxzv9L10g/HRCpuPYJKMQXqaU/H+QSTqhE/rT2EWZzou0RpOA+9HuvaDKQZwsti+i/snmcyCivDyPyh3hkXJM+sKn2E6qE2tMFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+Z3o74A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+Z3o74A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I03l024597
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 08:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkqyB913YY3yMnVNUtYTJNCapGusGIc3uihCU//zesY=; b=E+Z3o74AcYrQCKfJ
	q++aZsY3x5gkBr3fR2bN23BcfOK6+uSrLRIhdG5hmkc0vop4MqS0u6EVdS28qPoV
	+eT3NYEddOpyIszr5MYllrQTXdzh0vkcORMBlE8tfl9aHQlbs+3InWCJjMnOmZFl
	DKhB1USPR+ni34xj1RZB9RoKUN9xGoBp4j0beyNMwJolUSIfF7idDLiR1LcH2+ai
	UC+19lTNnkzpVkzkRE5O6fuleOYJrceegAczVRj2NWSftphzWJ/zkebMejZ/E7Ws
	ZVbqUR6OZcielbTxVxBdjMFVAZMqqpYPLKNfmwZt5/5tcfzS1Vvw4RQyCgxG4boi
	K6oNpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr47ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 08:02:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b302991816so83862511cf.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 01:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923338; x=1758528138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkqyB913YY3yMnVNUtYTJNCapGusGIc3uihCU//zesY=;
        b=rdlvY2IxhzyTD25uv7s1IuuiVOXCoaL1PiQ2EsRVIdc3tK2ul3/8EkuJe/cekEvFaF
         +xbZigzGPMRTF9EqVdIQWvutTtGa/MfXQ7at477uNKhmBLp4Bggw+BYL7lZMIJaualQH
         mE6Ekz/Ji+YG3OT6H9A3A0p5xg+u+BRtb/wcSmOfgkvF8zWVzqdCfFX1Rg+TnDo0PfOZ
         WyK48CUADo/PYijOl6uEIvCIj7KfwAxO25HMS8mBbai/3mLd2USRRXsvKy9vd6ebZijl
         0vJ0j6NOSdC6mChKl1IQhxlh4q1p3m2Xvc5P0BUg2VwRUUP77kHrElysCQ0q6H+SEB6y
         rMEg==
X-Gm-Message-State: AOJu0YyCD8TxKvA2m9gONtVejv0PH1SnzlBIGfEhNZEAiHX9jhcZHNUu
	+CNNpcmnZyxetGgnZz4F/hcTSuIqQYYROV6lo+K6PPUM3eeGZjgoOAauINmEMvrXzWfq1pTazCU
	ag8VCUuRRKuFEHI34NP7vxTkbt2Vim7U9BSkdTUpqCjzEMfcflNGRKHHkoApF20zmlg==
X-Gm-Gg: ASbGncvfNqUCD0MEqao5lHf/JxJscoI7HbGNkOstedBahyhTqGpIidsfybpXG3w5mj3
	T7IDTis90jYXwnWYBS1zPgqwKGxeiY07ewCnqwk97UNvVBbf07ROTEfz4yK7CfhGOq5eEKE8tHr
	bHOFt51oOUxt7GL4YzKuxQVC+JYGIxpzpbtjL2QRbkKMdkOG3Y3J6uoAWfTLS2AfgaNoKACnEZ3
	NlIBWIu7xga+Ja32MysDXSvafNTBjx6QGE9MUQx/qKr5Eh7G8bJM25kfvBXQqBw8s8TwNYiyvsQ
	CZDo1V1JEEpynSotWZgmzQ4eGRcOZJsYHySlWySwr6QvzaXqwJ7YWeZP+GBVgdvyLy0=
X-Received: by 2002:a05:622a:247:b0:4b6:3178:b253 with SMTP id d75a77b69052e-4b77d06a1f4mr163367851cf.58.1757923338473;
        Mon, 15 Sep 2025 01:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNw31LJSCp0juE0c9doaAiFovtWcdc7NGc8wtk3ZUQMcSD0QCoI0uGjhTOyxUVgoOmvnfINA==
X-Received: by 2002:a05:622a:247:b0:4b6:3178:b253 with SMTP id d75a77b69052e-4b77d06a1f4mr163367321cf.58.1757923337914;
        Mon, 15 Sep 2025 01:02:17 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e9fd89af70sm4863751f8f.43.2025.09.15.01.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:02:17 -0700 (PDT)
Message-ID: <f13c79a7-9595-4795-bd74-ea440f74a12f@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:02:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: qcom: sc8280xp: Fix sound card driver name match
 data for QCS8275
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JkBQ-RjwXFlSx103S-wHiGotC1RXX5e4
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7c80b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3r9HinHMD_fb42oTSBcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX5pK3uuVqktqQ
 MkwTFs0RTvQszoVD0QroeD9ruRpN4wQrPKo/IVK71LVKH9HZGGDTKI9DxYtet46GpcULC/W2UR4
 iJpvMZTfhLtN6JODiujDtv2Ht8mvBsOd8F8QBbQRWt+kdXeh6EihEBaYqOACVEFrFFs4GRJSBXR
 8K36f0NN3JM6EKvErPbR/4KLEvw7gOjITGh2xOK1+cRH+yvGzVXOyTQYdvIvRFAfTZ/y7ZkDR0i
 Hjccn1EHWD46SegwhVuNS2mnH2FstBLm5AXtQugWn8tltL1w1hBk6apx94hXXReyn5GsTvHmS3q
 J4X+mDFrdAGsO1z8fuiDaZHmaVx5teHc6+A2PEXQtLejpyBrmdX9K1QYfl8e+xMKoGSUfvoJ5VB
 A9zo4DV/
X-Proofpoint-GUID: JkBQ-RjwXFlSx103S-wHiGotC1RXX5e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000



On 9/14/25 2:15 PM, Mohammad Rafi Shaik wrote:
> The QCS8275 board is based on Qualcomm's QCS8300 SoC family, and all
I guess you meant SoC instead of board here.

> supported firmware files are located in the qcs8300 directory. The
> sound topology and ALSA UCM configuration files have also been migrated
> from the qcs8275 directory to the actual SoC qcs8300 directory in
> linux-firmware. With the current setup, the sound topology fails
> to load, resulting in sound card registration failure.
> 
> This patch updates the driver match data to use the correct driver name
> qcs8300 for the qcs8275-sndcard, ensuring that the sound card driver
> correctly loads the sound topology and ALSA UCM configuration files
> from the qcs8300 directory.
> 
> Fixes: 34d340d48e595 ("ASoC: qcom: sc8280xp: Add support for QCS8275")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..db48168b7d3f 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -186,7 +186,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> -	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
> +	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
>  	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
>  	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},

