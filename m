Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDD42B307
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329307; cv=none; b=GAEAq2Z+6XLGfhFPiMUrZq1+LMXzMe95VIV1NWDP4I4DEXuq052RIOaL2qNUUz84vaJ00RpG4NlsMIh1p390AjXvsn6ZXqIIH/v4HvAMtq9KdafpfF/s8vl+jGw86sKGXbnwfFSvxRVzrYpuRwSPL+QZNcjC7ECVYV7e/PnvAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329307; c=relaxed/simple;
	bh=dtluOyszjaEVOB5vepSnrwx0MsVZ8OKeN7of4i90dKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjT3vYpX74O8EuYXbRNhM8CcnURRF2zfrgMhlCzP+TN5pKopSrjEjUSbXSTgTrDKT+qEEgtjK/BOS1UDARBUaIUWtZb5h5/2LpT6jpXCbJQO+l9IJSdcPKk9JrMMHAxcqDIz+wKH08gymMFAQZiSEIhSAiB7dx72L06mO8qBadQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA+sWz8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLltVwYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA+sWz8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLltVwYV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693tm54108056
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 09:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=; b=kA+sWz8ECxfCB+g9
	MM4hac2OneKBIHewOxgKvm8no/OEjSLkP6/1nMtV5yE53Nnu07LKUR3PaXwJV9L0
	HqSclmxeAhreVSTX9uYDOYuHxpwiZu86mMGG8NdlgwVeiYDNhvLWZCpJK1Z1qDNh
	CG7JxY3jCa++1Es5ex2tF0nDHfzdtyGkye3dUDZdRPHxJccKlAinW+qVv3Z5mqbZ
	cwm1JvH3ft41Yh/CtkI2QUXRum6j6VASBGBnX9/Udqm0IRN3aV1gK48ubycXkvvL
	CApSdEUxMG0MqVff3/s3Hj7/t9o5by24+A2kuYs1+z7xX3unqaUYrGNE1HRHh76V
	030U8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrfuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 09:14:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so10898601cf.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329291; x=1783934091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=iLltVwYVchi5YuhWbI2u5pbN6xrGnYEX9tOSiJ+7yj9pzTPE8aIxAi37sNLnXF48AT
         C8fgdeeTP2n+Po4lsBsEcQz3oa6mbgsiis3fE1Sv03rrqxIJXRLEuO4EFnQFXTVJIaa5
         DSUn4XZBgeRjgFqWUb/9yuVTcThR0Fomtww+xpB0PZVB72XzXyI9zm4qvlJ1/WrRJs+w
         aaYJSkV5SHgW0Mx3DxyImNzvuOnbcn4lQ+Zg7a5JMYA/N0Z35INe/fcf46+D5DEyEO2f
         9XX5nMlfRSvkcI9Id3ZiVl50+dlEEgErOdqT4tzFi7J0QKpbPRhxAOZM54D9Pe0/+TJo
         mvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329291; x=1783934091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=JghQ96PuC7AJSiF7c8uYcWtEv1NOIaFxh2NyUpQHBRyXwqWVEwB7ZUvL9+iWyrdhKY
         /lGfWGnzmRpJxjeTdxdD/25wWnYK6ndfzxu0S4X5oxw/PUE7Rg7HVCeLg+e0gqVS3EZh
         cCygVcHJNtLWzEsQWVtVSoVQ/spfLokq6KY+tsrE1nfKqy1Ytd96EQilr83qLwIUlWRG
         +bHAozMyAIlvVO9jvnclk43gMYye36ZzE5/EFY5HATCvDSTBHjA5TtzjXvln0g6vqF5m
         eRHm7YnAjjZ6GFeNXvmRYgZFc+z6GdRdv123KknDudVvspCtZVqhN2PRcUOYrkqzl3bW
         UMiw==
X-Gm-Message-State: AOJu0YzMON622qFOmj6SZapbe+jnsGzLSOYdhz433UL1aCIKNtVZK+r8
	6Roz8KK4XS6DYUCIRbYB35MF/3PQOfJhMDb8JEyPI8j1zWKCibL2ErYnk/XQrGio1RdKNv1HfwW
	fnJ+mKN6tXp11vuwivQq48V8qWJNulxqmUzhkkmqR94MSxITYt0CqMFrYVMaRqM5LeQ==
X-Gm-Gg: AfdE7cnLjJJqul5AGUM+071mQjt+rfX3v7oJHBu8epSNbxiB1sTn6YWwoTyTBQPKMbZ
	o93/AoI2rTw7mKUe1Z7kuPIkvvMD/oJYKCEUgC4GAsHNfRipEdd6X1XRmKMY/RkyiWFS9idmZP/
	nZt/Vgy3yiAn+5kqpMp//lVYj1f2cjp+pnLVcLkTz5L/SlGIMdCSWccRZHnte31Dn+4JAa+q/mR
	+snaruL5SpYbOirFV1Wxa4V4lPZpSCuFY9QxGiXOIkwlKChWBC2wfV5n5oFCG4ZdbM3CeZmMNI6
	3kCwhM6gvlLXvfMM8CLduLmnADoRh3btKLmhk2kt1YUgpgb/xZTkLZYH/M0C/LTvvKfn6bvkBNZ
	Zy3yJTWsubCIRSK5bgLzpiZ3PU5VvJctQaQg=
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899281cf.3.1783329290542;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899191cf.3.1783329290140;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b605506csm701001266b.6.2026.07.06.02.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:14:49 -0700 (PDT)
Message-ID: <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E4aqvq1H9c3bVfpge5Z9A7tFpq5XOeHM
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b720b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=32KPdnK23d6YPOs0wU4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfX3urcYCFhRe5J
 gPMBLkXspMeqV61I9t+BxaRBaq+t4+7UewulA+uizCKHileijgXN8N5h8hk2VWy2wp6V6u4PoMP
 4K+We7fzowO1tkfyXc00risT0/v2avQ=
X-Proofpoint-GUID: E4aqvq1H9c3bVfpge5Z9A7tFpq5XOeHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfX4Y8A1Mshtf+a
 /fAg0LCXYn5QNnkcrj1QmpqyPOnBfLzX7CefcheRwT6hYLkpNHoWlx2UZwSwzuntuERQf+Z+OYa
 4wEWY8qG5JEplF8ievcPJeF+We/mBjiQx7WXfX+5d1IO/VQMo07nQEYQJ+JdDJU1J6jKeJwPubx
 SDtw2sEs2PwHH0zGqz+JSBLTp0E+HUYg70g9AXlsNrGZ4AqQyhPzsF04M4BzoGt1Ke0CqCdC5gH
 HIw6t4w/2qIjYox3BQwGJo2rbc/g8cRoY58IeRsF/Kl3gAGsm8GZM84HMGkGmPr4tH5yOQdXfTy
 sVeP0twA2Tc6woaupbROLrE4Lo3ZTAED6vSoFxoR6xWrO8H0VjSizeog1tC8WYASqd3Co0XiNpX
 D/SVb/UfYCw7Ex19Nr5kPkHYJ/tA8fLVoMmpRtgEe39dhfPWRENRH2tqsfW2f5/0ilep15Y4T8v
 0sqgNTOQBbO188M4DBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060093

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This looks good, but since the binding is not YAML, it introduces:

failed to match any schema with compatible: ['cirrus,cs35l36']

so please also fix that up

Konrad
