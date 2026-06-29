Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8B19EED3
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708324; cv=none; b=TmttlcIGIOcTaayXs51TYuypqF2mVL35uXsxn+t/GpFMRLOO6FfIzMhjr/0gV0rCRuKDvKLYa3w2xP9C/m2Tx00p5h8FW5Qay5w94MdN5iUzr6fi1Up0JlY+NHXHs92AKox1mljmDmB6WKcDe71ZL8DmjaXH+xdTzDiglUYKXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708324; c=relaxed/simple;
	bh=rXLCNJs+Qe724FhfE2i9Q4xJ8zLaKMK4WBawo5xVmgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxPloV5Suo7GV5ERtfGRvelpQBo/VM+2IeJDu8eg5rf1yq5mTqpW3+A8iZ5eHDfJlgtJrS0KcxWQOlGnS8R4yU355vqjFfsq3jLFoB+rJexhFkb8wsRrTkfbcNMkhnU8X7kzRD56Bz24dBnkuAPCCHo+PbmsGipP5tKqVQlF0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nj62Dj27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9t9ScEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nj62Dj27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9t9ScEI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NUbO1777405
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=; b=nj62Dj27RzKisDHd
	tIpLgVCqIYUyM+CaF6mjNZzjTBMRGAFQT+EhVJWQIK7Nrf8/DidIBmFbQHqvaj5a
	2GVuX6kihYSF0TaHaKMJkTPKDuPxD4+/jUQe+0rZjc7ZJGEvZEC73X9mmeCbK31B
	IAMk5gSQUcY5GZmFJgpliRYnWoPJhtTJWCdEUYWQgcQW2KMFpALX4hFQAsCLRCSs
	2XIieii0C0rbuYaYErsVB8tQsP9GWrH8sr59xEF7NknMWoqu1vnBonhy1Fg+S+i5
	fFU/0uz36t/kmyYtShlhJgfRWDUTSiEpmVWgiHQtSovooWgv9cTsZ5kCdFaJYDe2
	MWiCvQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mhj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:45:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso2817331eec.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708322; x=1783313122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=;
        b=A9t9ScEIQBpZTrX+IEJb68hcLzBquu6fd5DvKIyZDrvj9rl6/T0DHoHauMrkPe+4NE
         NFtnJo9vrp29+r8csYD1iOcsD+hMc5He1PzHpLEJfLDK1CmEPlUE1tuvzOcFtEaNiu7G
         nSjRTPUOsnZ9KUQ/VP52IPc6o/eilm0S6dkHIqbfX72Iznm7FhqEjsjlClYbwEauL0mU
         QIVy/ulB0dGRSLpY88HZTJcs7Wj3f1eRJa00hJTtrSvEYT3HWyac2pH2OUUNg6fMj5z+
         eKIzqr6gCm81MI92D9xYsONd+bB/YgGgQVIE6vRscH0qwOhREBtmeNkkVpLZkH+f9kby
         6BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708322; x=1783313122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=;
        b=JvyOFkNV3XBizUk96oWJytUfCiqSGNc8CP9m3aAVvodMFfMo/X9aj1bxxm8BAC9JLo
         Vx7lyLxClt/GrepEuEk2kHDZmpUADrAVp7V+IU1p5fE7gRiYn6OaSU63+oFdACVzWQP7
         HxTj3gvzK3hUpLGUoZs6Dd6J6KHOtqA0Rr5uUJK2xb6ISCG+Uq3l2nGSFxiZDE3kN2QE
         KpNWEu/QuezAC4pyidjQ8KMj5OJbWSP0Bei21nOLrWeMuFcxVTrQvmtyKCdTodEgvv4G
         xsh8uwfcFz1UBcMeUOXfj+h5ByHxlJiLMr8bW/kpjvd4dcMZa9OkRGff9HWzUEs9FsYg
         ujAA==
X-Forwarded-Encrypted: i=1; AHgh+RppPofpQHUEi0prQRrUNRnGp6EieYbQFPDslQcYbdgJf3pfHVwyNqkDqVh7oGPoPCeVqSYphy7lpQau1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZzfA1ZYZI7cLiGWoYCLOfsxCbt27I9mHC3u8WzXq4Ymm8cxW
	kLJuwZPKz1Lvqsd3EtK6DHwNrxRW2Nw1Wp3jJAnJEv1pvO+a1U/lZo0yD2YR7ap+zmKTyDUXab7
	qoHxNh2qLMHSW1jLkuwXbz1dtNtbRnXTMeZEepQHnp5b7HyFFDyNWfd1FWIeM80TiKA==
X-Gm-Gg: AfdE7ckXHF8Av8pGcDCdWCPKNKte9exw/ClxIzyvN9qeQknyYWNGQM1Py+e91Rmj98w
	Xb85qi4p22o1DU/KqUVHUqRaW0mKQf+Gfy62hJcLQwDUxSTw3+rju5GK3en0rci6gsIuhuj7tnw
	Cu/0ArkcegIkyYldDK1ClMEkVCsgyzrnmv4GR6PtzLuhuMq2eXYWp/zmTDo1qSs27N82OITch2Z
	j/wrxczBww5AYRGjc/Pke6PgYktmQ1HRY/0xKHCgWhVonMB+o9fPC2FYPAJDl1Ix5uJTQOD2gTf
	sHCpZgFlQl3REgBgEia8zwlYdefk4YDf/61Q6RYPlCm4b5U19IjVwTC6DQP5Dtk/UDL3MB/ieyf
	cg/WkZPvo5ATZMR4wUfro27ucti5B5uXJg/QVc33e8LHUFw8Wjg==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4f:46a1 with SMTP id 5a478bee46e88-30cab4f49e2mr6958778eec.37.1782708321728;
        Sun, 28 Jun 2026 21:45:21 -0700 (PDT)
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4f:46a1 with SMTP id 5a478bee46e88-30cab4f49e2mr6958762eec.37.1782708321218;
        Sun, 28 Jun 2026 21:45:21 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm31828038eec.2.2026.06.28.21.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:45:20 -0700 (PDT)
Message-ID: <50d2ca43-0f0e-4ebe-9581-28f0d604129f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va
 macro codecs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260609-cheerful-translucent-carp-c44aff@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260609-cheerful-translucent-carp-c44aff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX3CWYIwgdG1YQ
 CCIV1/QUdPpq7X34eU+N7w/ZnG8fY/ovZFk6/DIJwcx36OSlr6MqGrpgn8wcOfugzXtglYDCY6L
 JSRqfiGhXKwEB6Xcqcjf4T0KnnnJBx0=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41f862 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PZ1Z1m0jGWrO_7-F5i8A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Fl5EHl6i2PFkn8ccF17NX_68-Pd6sork
X-Proofpoint-ORIG-GUID: Fl5EHl6i2PFkn8ccF17NX_68-Pd6sork
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX2BWvaj/JzWVy
 +jYvP8d37rZMdOFaGDidkdeudoCizuP1CZE5Q+GDn7wdhbOMiAH4ZoOxtNI3JtJ26aHOxUSC0Hn
 7a3a7pv5bav7xDsO0wFAscS0vv50x1iXqWA2wHgBo+oQT0KYBJwcyaUmOvvXMYH3cOS8Rb6akHe
 vv+odfV6YOjMPA2ENf5HPRfLE3acNeHDd5kEiFt5T3kYApKlMfQ3SVibK2SRq9yGgJrzQkrrnfG
 ACHW7Ek7MtKbMSfpCQZlgIwVtnEk3ir/Bjurv01phCdL6d9/E3C5bSO2uUqgdqQPazpc5oJT9T/
 oH7jhTZrxoiD9xPht8Gx51UTZoGZPWBtmPNp0Q804vP4XZ8bY5wWOVosxOTrgGw2lZUEGHBk1LX
 +r7v4Phx7q/7J90J/TY6toQwsX1ROsk55zaKX8nr2gxfc9vpEGCxUPGiHBcwO4aSjS10BopahV+
 RKOJv4/y2KcnXLJt7IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290038



On 6/9/2026 12:56 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:50:21PM +0530, Mohammad Rafi Shaik wrote:
>> Add bindings for Qualcomm shikra rx and va  macro codec.
> 
> Which are not compatible with older variants because?
> 

These are not compatible with older variants because Shikra requires a 
newer codec version with changes that are not supported by the existing 
bindings. In particular, Shikra introduces an additional adhoc register 
block, making the previous implementation unsuitable. Hence, new 
bindings are added specifically for Shikra RX and VA macros.

Thanks,
Rafi.

> Best regards,
> Krzysztof
> 

