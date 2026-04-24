Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50813BE65C
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030717; cv=none; b=lVHvW526xJ5NRkRbBUJ7narBB6CuWqSAblfd8Q/9WcDGkGMGtH5tLy8kTZP6q13XLV0IGbJTlasguhJBGoe/qx/ur7oVzXr7+VaHTacEzM7LBITDVe7q4waTLvFebQkGLIGXXCBBCg6BX6H0oN1dgWygWg1n9RehewGdk5ZoOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030717; c=relaxed/simple;
	bh=rSzN7e9ZxTD4WFp8PWPh1T4J7BMP4rhtRQfSs1Q03mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXlFu7k3xf+aDdoCvx6qv6+Fom6DrICB2woQdMtER3FNO3QvgV9EjRNbLm9SH1V0mCNgWEK0B3hZ+QQHTF2IMBwcF0eD5ngzIEZmekB8u/bVsKwYLT3s5OKveRdbU3PFJD2O5IFpjv3llRZwuw90YmLABkTVWgsmbyIjbSh+qnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hACnsWia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWG23Mh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hACnsWia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWG23Mh2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAZdUE1959419
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=; b=hACnsWiafhBTdTxa
	ZulVo/IH0FqF8qq2uuB0Ilmzo5C4o68OJHBWBjSiEu0Rb2dKg3JZ23giI7Z7SiO/
	5ZgE1Iklx5NHlGj+ncObqv5nKtngkYDfbA8lVY4Kp0JZvw0vLHoxgdzJN/tlDG8d
	Wup7PcReU+KoMQMTLVjPi6NSHfgRrO/ufQxsNfTlmhGdXa12M1LNKCIyL1lvDKCm
	/C9r0KMb5GD7IvdaBKAGWrDVwoXsKEuitA4OXOJkiphPf1Xq05OIvH5+p1gztmc3
	d7lq7uhvhyj2L3q6kj8N1jJ4K0kN5MYgQn4gKcxzk7sWSy2ycF0wQP4NEirZchbL
	LkP26g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrhfu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:38:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so21291526d6.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030711; x=1777635511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=NWG23Mh2x8fLQ0MLePY9re9cjk/TIJ4UcHwxRTOgGsnEia47tkojVMCI0hvRbn3Jwv
         JgYUiXitU+TGr0QdmaITXcF6hVK/NeLQhtu+lEmSycBPNo6+MX9S8XZCRYXSWPy3/4jb
         2vqLE7gMsY9eM0Aieyz0tB5osQflYn/fNddAcUEQ8V5UorOPE2UKleBZ9l+USj+eSNcL
         iNnlPSmvfHSo1Cyil6LiFkRdqcZM+UEjRa3eKTxtvd0E7N5j8rFkY9K0dPaz0l+2D6p+
         6EhzKlmyQTj/IbVc7nojyfAtN2EEHcMIWe+PBEY40U38r1afLF11I9Cd0UPc504gF+58
         DJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030711; x=1777635511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=eq4xmcURLoeGD9jjyTE5VZeykkkGpcvXdviX+vYj2NZovHx1V6ShUXas+FaRv7f2jS
         bhtORq+b9aGVRXVzqZl8SrsF5YA2el3Twl8KvMALDoBYwqDe1NsbyIJymxzaIZotkv2J
         tz2dkvfJv0Uv0NRw6dTreltWig6FEVoiH32Z7AXCkB3u1KFDAeISSRIl0aUQCwIPo0vH
         OnSZdo/kN8DHz/Fye4hjBUpc4mKr2sX1/0YxESMPeLXiQzHMuuTa9VkbSbZxnja4FSd+
         Dbwh7cgdOIj/UK6NSAil9dO0zGhVxx0y7J5DX+ThYkwa95yL7zZiXAA8T+FfoxSWKK6h
         ROkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gh9/ra7onlmXpZ4olcLM8GM5e13sNCDdkrbTtvoyyzi4iJFScGX68ZYMMfdgoxVplEom1Y+7wC8G9TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMURSKn/hRr6TwzrEeAjmvQ4e6GDeW3rPoNH1a5BETlzvQlPks
	lurbLzum+uSZiEOljg7JX6wI0zlN61NF8Izhp/FwoLipp6F0yIj9hMp1ofBS1GDIiGciHcqjA1E
	bUvsMSe/0Cqnvz190+zZzigJ8CNyB7aEPm3nVAbDGqhiKSImBVEwq3qEf9MKpA642IA==
X-Gm-Gg: AeBDietmGnJklpxYrLuSW9e0SXjJ+G6eO+jW8bdFa8QZVCVtniVWiThyippkIUHjzYT
	lAqz6sAD2TN5Fe1tto+TLopQuJy/eVyWmP29JjWRQQphrQvguYCdSauvi0JbwJaOSUepRZxPf4N
	jp11Z5V1j+MN5HAaRnYMqKdBz2u4gaqb5qgOfk5B7UlbVtUNbYlBsRn1jIXUHneN3T1jj0c6Wli
	rNTWhq+rVtqIyhBT4occZBBKbFn8AvQ1gIJeW3XKP0QMHzf1iJju1UW/yTmP1MOeAolf4Ez9omX
	bo+l6rFpwQVhDSOh70cAT6hLlpxMggKmIDlttGL16EbmCGSMl1lBWjT90sIYDE6zxb+goTEQxMq
	qK2nQX/bqfX9tKlf2SR49G1LS3bhYZxkupUIJNBBuM4mxHPg7qb2vgCuCMg7mJqv6Gv8FOy1buI
	zXvMvVF+LgYpc/DQ==
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356870996d6.2.1777030711640;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356870736d6.2.1777030711263;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e54sm777016766b.9.2026.04.24.04.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:38:30 -0700 (PDT)
Message-ID: <74c5344d-93e9-4842-9704-9d0c4a608d5a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:38:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Drop
 QSPI node and reserve its pins
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX7Ng0wdlAaiqS
 BwE9AW8uANYAuWFns+F7wYV9grWELZqnOixfCdpOO21yhNX6VjoxUppFZpSoFpWn0rIZ1yHzhsT
 3zUD2VTlIPL1SrG9pCPVr1OwBGFRBs628J1aTls21PQR5CvVLvyHp0WIN6v9Tk0MS5hffuRjZvV
 j7eXvwX+uZyT8OTYLtUIcLmCvkCbgAuuw+z1TcLB97k7A05S9hSwhCKadXfn8gzsvdIxF8hlh/u
 NWkwOL1r6Muv5C0LFozD/XAYvexVr+N3ilAi0cYH/4TI/atUlSVMOhtKPObbo7P4KxHdFdcDuas
 xkJtIZdL44jsQqLAHsnqnqUXqy7lR9linQwFUNKgQ7A/GSNp8+/eqZGDjqaAe/HelSe525dI9Lm
 m94sKaBbN9cJn079GkiLzglYq+f95fJwmAOBTSjOt60IzzSM1zhQN8REi69zxkL1KCoVq5eo12/
 Vqg1tKqHuguipxhQmkw==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb5638 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=VmJRAYmLPqqtz3Wu46cA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: mBEQO8zaexjwZWwRwWfr7FQi1PyE3QSl
X-Proofpoint-GUID: mBEQO8zaexjwZWwRwWfr7FQi1PyE3QSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111

On 4/7/26 5:19 PM, Xilin Wu wrote:
> The latest official boot firmware configures TrustZone to restrict
> direct access to the QSPI controller. Any attempt to access it from
> the non-secure world causes an immediate board reset.
> 
> Remove the QSPI flash node and its associated pinctrl states, mark
> GPIOs 12-17 as reserved, and protect the QSPI clocks in the GCC
> node to prevent the kernel from touching this hardware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

If you're going to stay with that flavor of firmware going forward:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
