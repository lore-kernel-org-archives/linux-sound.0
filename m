Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101CA2EB871
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988899; cv=none; b=IfC6CcHkW5VR+y2H1rJbzII9jlyHmRcnhmmdaH1z7Fjehjbtoihi4JyO/khxXZuvSni+P2GXuag4/VFCTzLR2KpHWXlvy4QO5+GwMeJPpEVtav7lvQIbCo8pBPEzJzWo4oG7swA5ZpGhAGC23vRiuE1fKI/+REEfjOqqRtdR+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988899; c=relaxed/simple;
	bh=iZ1yconFgP4SU+f/2nEV3Iq/VVfOyxDTTCJZle5egt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJgurUcOgheM777KqNmCgPLhWdmL+4Yz423/u1qwBs3wegdF5jybEsgYEFE1wB+EBSar4LaPq/4JX0T1LJSciQTZsfRlMCBhRFvpzzFGra+KYrNmhzh6nF5u7ZuA/sIAwr9ma9waTTkP/oXkK/pERBCFT0IcsJQplozLVxT5Jk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JN3bF89Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JN3bF89Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X87Z032207
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTkNPIlvtexAzRNVdxPe6P4Vsr6y+Ml/PHeKH4/6EBc=; b=JN3bF89Z0/kGEe74
	+d+OkDoXnmO7Pt1aqyPMYxptJs630LQsAAxVl7AGY58FHfo0+PgzoTBBdVlKBItm
	FOBXShPAWqxRb24FQZbr+YIa5SrT2/ljBq+xbJYxoXxCMcgOkrd2g+qlMBEErR35
	rEn6JDu3kbXZgOQPe92kx4drtyKt7XyrVoTOAzlDgo4M9yze1D68n7ivrpEpbzDO
	odHfTAUQd1hYws9+5ERImSeOQOJzLdJRAlPZPd73P6sddwMH6Rya5yvyBJZ5BEi+
	GZaqaJ1mjmS5jES+/e82FjacbksNdUjEfwjJ+ie14HajZDhzTG12TNKDYcFsqstZ
	Q5LRqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfk4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 12:28:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso3325751cf.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 05:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988896; x=1757593696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTkNPIlvtexAzRNVdxPe6P4Vsr6y+Ml/PHeKH4/6EBc=;
        b=LIeIbvTON+dYBCYb5cs6es46d43i/kxPp4iK9at/3coYsk55F+fMimWkpsVc6cdBVD
         4v39WZQhFq5qb9qom4ieyavdlDsNU1QVUL8BEu+QjFv3xUF0YRbS1Sj68vyJqRzb1fFi
         YTpB9qKuJrUBExJMjIaYJ8dDep3CeMGvACb7Q3DWFynI56bwxXFwhEBmy2PUPyeyResa
         ul6Muy1xpd6vF6xPViVDq1vvs1SLm1DM7uWB8d6uU+A0R1Wp801ZZPr2HAgAHplV6zw4
         c7/CnXDld2++ClSBB5WsKDt8ykTFew+i2XKeRLH3h+Tsq2jC2zrh7s8k9hajcnz7pX0N
         jGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVPf66kyRY+F6FGEc0UjuM4JGBs/xli4+eqLmBcI1exFslZbMgwvbWh1AVWz/Jdae4BoHtYxRAIrZ7r0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5VpObJYgHNFCStTAQTvlkG5p4qdF2amVfaOQOS8MOPIYKr+Sm
	Hv7gJg3R1y6BjZ5kqdvkRF1eZPYeY5QkTc25D9iVfHLgPtx8YNtUrv+KFjKr4lUFBE6gTtKjMfI
	zSFq1/dqNoiphwBkKQl/A8w6XzktN6ZSAFcp65GRMJ1FjQA9A763csWNrUhK1EqsZ6Q==
X-Gm-Gg: ASbGncvBrqwwaL+0hu9OUG0NjYaAEnF9yrYb0z9xg/cb/+jA9roKYfzN6RZt5C52fwm
	8cTzpDLyZ4vVUSc6HJF0OaQpLXmanoM6LQRD6way+KTb5SCp/97ttHkeWG68FoAuSKX112jou40
	uFRl/6vcv+TaH6XgEQXKNLs2jw9KIRNQLBLbRNouqehAab9J7UmkulHBx+slCrnCmdQJks7hXyE
	QraguYHIxYNBHViziY3n/gsBTeYNfae+13Hm//MqBgDHFmKFdUtZkia3/Kd7vyKdFQ22W62k7ST
	zK1D/K+iWU2oCO2f1G+ANWg6qUrtZQ33oCoN5ZROsWZSTken+u4p5jBhnTaHcJ+43EstqmLKl07
	DMqeCKW0INKhuKvTETOLSjQ==
X-Received: by 2002:a05:622a:5817:b0:4b3:4b14:b421 with SMTP id d75a77b69052e-4b34b14bacemr76922061cf.10.1756988896041;
        Thu, 04 Sep 2025 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKNLr2UG0L6qxbC6a5kcKv9i9FUtalfXAqyO8H2z7P9qA2jLyWbD9ZRvkUjs8xg0e9iD5JmA==
X-Received: by 2002:a05:622a:5817:b0:4b3:4b14:b421 with SMTP id d75a77b69052e-4b34b14bacemr76921691cf.10.1756988895551;
        Thu, 04 Sep 2025 05:28:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ade4sm14078747a12.45.2025.09.04.05.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:28:14 -0700 (PDT)
Message-ID: <105b3ce5-8934-444c-8cdf-e338af3e3552@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:28:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250903151337.1037246-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903151337.1037246-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xT9jFiwwDJlODOzU6LiwhhYbxJmcmMyP
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b985e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MRceF3MI-pe3xWiB1lEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xT9jFiwwDJlODOzU6LiwhhYbxJmcmMyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX26QvmxqiDu3p
 kNtpB8zzjgNWdYOAstSA5qgxxyFl21H3naBZ5C+tYIIk+as8R3SrFNKbc0JuZ+6M0RwWZvlHVyp
 a2wRbHkmgAsNfvlGx+eXUvHqvAoBvU4jVbgTjf5+wVXtx0XssxHWymtSVipNQ+G7t9vyuWIwzMz
 9eGyHNYEw/8LK8Css8v8fIizzSNJaqTWjurEbzPOYq5UaecCq1a/eYzgfp4Iz3l7VZyxF+QPFtm
 FXNedSXnMIffHOLC0YzPzsRA9ao34M39jwMyuoQbYpyi/Dvdx9Iw2qrhX1LJ6ej0TU9pJD/5fGU
 SZPCm6UKU4ZEbhiia4MPGVnHA1jK/F1NNQlZi1P00f4M8/8iXFDW36czwcWb+6Ed9DnqTPvPxoo
 oQ6AUJbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 9/3/25 5:13 PM, Mohammad Rafi Shaik wrote:
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
