Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88201D5162
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718776; cv=none; b=k/m1ZrmIMICvM9eDixpUKka2ZF8Cnm1lnmbi46uL99DiRwanhwfVCfHxjaar9qElycLjUpUNgZ6Tn96NWAZVXYyNLcFXDboIrZM/jNPZFAR4XHJqaHfM6i+EyMCZZ3apxdz0aGO0ch47F2oVhmtCcqQ3Qq3Sj2jZ9UzYYLQnImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718776; c=relaxed/simple;
	bh=GfTqS8OGtgvdq4CghxVn86HK6W2OBHBs1c4oIr7MYHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObrXqno9EwnPxq40U1yDeisPusZ1/gWJrY87422TGHo1H8LQSIBpe3c/tVarVQL4KvRop5iIxYXFjKIBEZFxX1q/xrWnzdrYA1zHZFzO0DWZJUFArKe9VGZ/mNUiHt/gXbSkCG46183OcWZt/n4OvSxCyVJ06S2IT8Wl0kzNSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxVVPBqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxVVPBqX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NlkCT027342
	for <linux-sound@vger.kernel.org>; Mon, 4 Nov 2024 11:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkrN5aPzH8cFJEUSM1S5b0+HOoTa6/UxeCk1GA3RQ9E=; b=cxVVPBqXDuq7NWL+
	K0ZmgTrC/lj+ijuwzxBWw59YbYsxfcyXoO4/cpsxY6E5KqxeqJV6REBqI1dMCVj0
	nyIBbRafDqPM7sopTLCJJcryagtohr8oQ+QT059X6poX5vCs+ngT09h+DW4JIyRu
	tFXrnb1xPulcBuYOK9ZRd9BPeljahCv1uFUEeofR7hidLsF7tdrzB6I/gZAKMs3c
	pRZsV3ERVhL4vcYbk76TP0LIz486cGWKUU5vuTVZwyCsmBsSHl5Vj1H+pivihBCY
	0dRGCUrzvWqbI3YnM50T3U1gIodUQzMIPpk0LQgtvhP/9R8DH+sP+n7fB0sKhrVP
	6RGZYA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxuxtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 11:12:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so12737096d6.3
        for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 03:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718772; x=1731323572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkrN5aPzH8cFJEUSM1S5b0+HOoTa6/UxeCk1GA3RQ9E=;
        b=iSB++HahyfkWKtJbcCLKujSMRgDWi/ijLkJ214BhxhpaHLan+XlmW9Cu6CCyEKLy6K
         f09T+8f/36+40Md0l0uS7Oa7kVWtOoXQlOsJo583xt3WuAxiDXQ084Rc7HhR0/WKvb2Y
         vZXWcgCV99aqX56xt0IVnRGtJGU+ePydfFJMkNbSj/cvjuJIdOBEqW9KBLpYIzoN2W0F
         Abf3uRIM0zg2kTnwOOxxVbhVlyZyJa9sjOcTsz664lXf2a0+4rtoefSF3XNETLzo8F1b
         43aUSQ5vCrE6z5zGcDji2vi1d4mERPpFVsP7YLSPsHRu0bq0kMcHuuryR6z9/UtiBWIC
         YQtg==
X-Forwarded-Encrypted: i=1; AJvYcCUe/3bTeEb+4nYBe/hcXenY0Rccqa0PAT+kqqyxd4Kik6c8Qn8jrqONg37nBp1+QRWBxz9D/vl+hlE07Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqD0fFl2TrnFxxVrhr85nxfDnWCBPQKFj9f37LYCqeUUlXkyg
	5n7Lcr0ZFdVf9Y8CepeEOJYLB0YkvzyXw/8jZb5BsYhqZaqZk1TBNIq1GFhNHrcShXGMWyrpmof
	CqtSp50Bc8Z2z8g6F1L3nW+XoDXVLP0hREBvAm5PT3Cviev5/HdH/RswH7LgJz4vlVeOlBQ==
X-Received: by 2002:a05:620a:17ab:b0:7b1:43b3:8189 with SMTP id af79cd13be357-7b193f68cf5mr2130262885a.12.1730718772730;
        Mon, 04 Nov 2024 03:12:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1kLsLhTw1eCaFhwc75OEkkLjLtmAZaNU8WNIlpyHgnRFt+2XGunT7R8lTybD+GT5231O6HQ==
X-Received: by 2002:a05:620a:17ab:b0:7b1:43b3:8189 with SMTP id af79cd13be357-7b193f68cf5mr2130260885a.12.1730718772318;
        Mon, 04 Nov 2024 03:12:52 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e08d0sm536708066b.115.2024.11.04.03.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:12:51 -0800 (PST)
Message-ID: <e9d5e5fb-a656-46f4-9f5e-c6092729709c@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sm6115: add apr and its services
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
        linux-kernel@vger.kernel.org, a39.skl@gmail.com
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-3-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101005925.186696-3-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2qP4qkUIwjHLG0zajnYUGwf-jeNGyquW
X-Proofpoint-GUID: 2qP4qkUIwjHLG0zajnYUGwf-jeNGyquW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=493
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040099

On 1.11.2024 1:59 AM, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB4210 RB2 platform.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
