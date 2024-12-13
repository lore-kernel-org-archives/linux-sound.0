Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F498190696
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134266; cv=none; b=FLwvRUPuyNf3qEujOW2rujdTFeOmz5w1qJpYGCxL9d3GI4Og7hPXLsTtFn12tMRhs83/trWrq6ztJi6juAPdEJt3U6GvAxFO6JIS2+dSuc/Cyat+EkYDkh0VBfcZUQ5sJTaECyv4y7Ffrcge1lQJJXQzfV0wAYId9J90gfpsA3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134266; c=relaxed/simple;
	bh=LYdPQGswu8DVIF+KYEYRGj/aA+V4ms+9iQMh2rqG9ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRNjNB9a4c4tY0NhKK8y/r1hSqa+YiHE47QJEiJYICr10ZQDh+/a3IYwEj1GNQW9IvuxTP/RLYZNLVeYRDcIyXI3c9dkz0Gcwnh0L6suEhY7n28FX/ODs6LuYXhtW2kidddB5n5ZIvLbChjs765DEs7PoVBs++BP8qwzhTiVhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYNvWB6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYNvWB6p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9pX0p019080
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+UpY+SzgpLuXHX5fnR2cKEgGvVPipA5R3mDTkxv6gI=; b=MYNvWB6pqzA8YBtB
	U80Hl76jUF9GzAkU861jk1vHXCRQRGEX0Gup3B80NtMqA15PnzZtKonWPnDxxa9p
	WBvaakAOGAP3PHUh3ucFIaVhNtLSDcO3bOhp2GTe02FjqppNSkOhK0rTccxHWfiC
	xAjreDceXuGIICi2dDGKh7nGtf8mUqnwVLmIBDMakrAes8fykOTY3V91MIG3QM8r
	Z27cr2U8JzXU3uNR2j5bQnoF8EVgvR0C7erAxPZX+l+2ejYEVtKBj7G+3Zk+/Rig
	q3GtxHiltpHPShWsuWduZhNILVFu7F17M9xKRc0gIXlTyv3FOahcFxWARwOyukCA
	ZOuHdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb1x97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:57:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4678aa83043so5811651cf.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 15:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134263; x=1734739063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+UpY+SzgpLuXHX5fnR2cKEgGvVPipA5R3mDTkxv6gI=;
        b=KAQUiROou9Mg0/bQNFX179I8gAhjYevF0z0m7Q2nv9DR92fJZjWX2d8OBnAxufWG9E
         M0NOTmNEld+VETy/qDe2tIrV1mUBUph2GzCT31kO6goHoQjCHzdgBPargoeiX5cUsunE
         2saUFdNNo6tWjQd1N/ZHuI0qCuH7vh5Ao+BmklP0D6+i+hTb+Ihn35c4ez0i30CVGkYY
         c/oiaxGR4m1Gcl3dEvcTOiKIYrqCwDFi8cJ3ZIOrNHsQLdrbPSeTfx/H5GiTfjqhUHLS
         21yxdgd1HtA6wEPiFjLoTRkleMSSfFC+YhSPye3RQzASlHQgMsxr4pNkXigj8f9Jh8Vq
         T0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXznMRo+lZgPwL32vLgWHaZl2d31LhY7DKkVTA4pQUXLgjcKyBM5HOl2ADbf1V9MCL9AfItaVfxhc7RdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMmSXTFGZlhRftAF5KBu3KZ3F/FprEZ2LvxaDG3RTzMMoXVtj
	JRFiIewQp4yImGXVDrQdt4eFyWvpczClJbZWL77MBpjOr6Lpt7Os/9os37UyDh7UQ3MEhwkltqa
	gtRQP/Z/DcVogz/HU3fBKd8aasoYtN8Mn2x+ygvjnKKIvLhl0+GB3Hdtr7CBnBA==
X-Gm-Gg: ASbGncs0Ler+o/BTr4XkTwxb6oOrqqywWZToIphZ0lKtC+OJWBExfHAFHxoeHVDpQOk
	2tOKWQrvJcjQkc+wND52kfBr2M6SxoBu+PA8ol7HCXlT8OYXXGnXiC8Ktxisi9cB/PrG+9MLGvo
	rDilOzCbjVKx+WOODPkV0qG/6K56KdZwCKqlQN50zl8T5S4C6jRx/Jdn7O6aL3h+Im+oU9QcY/C
	2yI1l/amb6q8rr1hozVbAHqrktRI+zQDXHde3vwGqlqLdqZ02eRvnmar0EUFQ2hKy3yZOLa3qVu
	zRkksHw1qCfVBym1H6hXPXW6gENEmelr7A0=
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr30420271cf.12.1734134263190;
        Fri, 13 Dec 2024 15:57:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdf07u75lgXuB8ZdoFrHC5spOJU69BJNvJrmuLa08Zpi6Yb/7k7QK1DNmiKZHesJkLk+XaRA==
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr30420191cf.12.1734134262883;
        Fri, 13 Dec 2024 15:57:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae11e2sm329712a12.39.2024.12.13.15.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:57:41 -0800 (PST)
Message-ID: <db6ec08a-7810-4624-92b1-ea922a2ee103@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:57:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zeL4EtWJGJwXCC_2FI0rXSQBl9cAh7s-
X-Proofpoint-GUID: zeL4EtWJGJwXCC_2FI0rXSQBl9cAh7s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=701 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130171

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for max77705 MFD device. Supported sub-devices:
>  charger, fuelgauge, haptic, led
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
