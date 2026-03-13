Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A672389DF0
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395696; cv=none; b=AJd7vHIL6SklscR0zdLyl/BLRcS+Os2DuS64K4aXOTbUse5dI0aGENX4NRkFUrhQORQmDZn/zS6OzYxjKlzM6Yc8KFR0F7ciWHsL9pYgTksIhsISGVqqHQBDqSGvZUef6ub+hwYreW1mvqGsuwDMp65alyLtyd8cmoSUAYDKpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395696; c=relaxed/simple;
	bh=mGmG9qdEc9o3klhZUDFbuxd/q9OVbkGaCoHFJaPrwj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkD5//2177VCLB1xQuY/jyiNd7h2RC3QrcbdFKW7j0MUWXDGfJsabXwomNmj17cSCqbtXa6G2rvvW1rWvX9V7RCuUzzIEn7XXxt42ZvNOPkTx71oGqxgRkxBAvI2mlQ825dCzyHnRsxwMetLW/A1AYbiY47ci7mVoNnBvvLBsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fl9yq48A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8q57S0G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl9yq48A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8q57S0G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thCL3342923
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=; b=fl9yq48AWYq4Koxp
	NdmjP0DkAHll/iqQ4ohCJdEmA4aaCEapkQJomwpW843BVQkUcilSwXBNLnsJBWtS
	jeLXR+vwBwfKm226XUmuXqPJB4Qgv+buGJ8U9wLWdp6XQ1s1Cgek/cauwb2WVpWd
	VWeu/RlHsJm9+RxWgek0HLhZir/pIhi+SJ2Ps27kniJ5F04zA3FlFuQsc/Z83cG4
	2ZIPZ2qsFi2ArTkYsBrHA6doReUw536JlU3rkJ/z8JwCqRz1bvNKlt41kW1oj+Ci
	jFVAOjoe1NaEQ37HuQGvuDZiov/uuin7jaQxZw29+OL2ozIVIqxwDEXBeNdxmOaG
	li5aLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w492d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:54:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so126239785a.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773395692; x=1774000492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=;
        b=C8q57S0GSE3EVYRiZC8RUPifhnzZCwcVqYlD+jqElpvsGAucUIPSltZvjdAbEh3U+9
         shiiGCoVrVTdRNmYibwwt5HjLxzJWsvbZfZNZ4vm3/ypvxCG8BKOfR4P64DYQrmffkpR
         PxOFDMM+Nzyq/xB6eFJdy7o/7uGQL9P2BekdzeJMhNBlYogFyOiHDAkgscgeKBaDBqA+
         6Xu3L4DoZFrRCFtALVuf0K9LlVhzl4JlFsYPKPeo2SWfFJn31EP/EFLZ9agF4X21Pvx8
         nwKcQU4ScYzBkzRvy2r8y984/7Re8k0vw1aWxirxjLz6Vy2+tbKtt97IlMCxX0tYm5QX
         CNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395692; x=1774000492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/cIZXoOLP2oF8XCHl4D8XGDbx81OaYjdOnib68cMt4=;
        b=XGCZtpgV68+DaP+3Rce2V/9geRKndNCUazC5x3uW2SUKfUWDt/en02EITBcEnc78Yc
         gmTa2HgyoATqPxewv5HTs0ZHZMUDNHg8UE2gFMEcHR7E8/3puZEQffOud94YHO+0jpFx
         zpDGqBwTDqt2Y5CmyR5C1LByZngkTUPSWJPsA/3FpDrQwZ91chEnwrE6/S4o/Q3O11fE
         9M9F/xx41owgeyLoqVX/p6cRU/OFrC7tpVTxLgUMTcmmAHp8QRyorlyZZgTyCeG9JTLk
         ed49YlgzY7VDNVZ5NJQBhSou4gFP27VMOmA4xpcQS/9X3B+8teLKl3JIIpGQdTSoiUBQ
         4sUw==
X-Forwarded-Encrypted: i=1; AJvYcCVxAg48EEAg10GzDxihCHNYZEEzsngn8IcR6kSxYpGUrUOMvs6WILUa5ugJh+zqcBLy6PR9oraEnrYVLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNiz3/6xXsRJXYesSdfKqxW9mN383rAlNGmgxbjFy/8J5p63xS
	ULGG1pIvzIVg1tMff9jCDaMEOL6HZHDOCigdCdR+qtfC9mAVsiP5j5uqokLPpW4GAkN+QoU2lzs
	TE6Uppa9UWJrkB/mc+nwb1UckhUllJtJ7TIqSwJuWpf5iYQLsCtodCwCICC/8VRqkqUJCXN1LuA
	==
X-Gm-Gg: ATEYQzzpdSeNuaMTG2ARcK4nlPCLPjDFhyM9UtZJpV7SJHSG99XwNUzSdUvE9FIViKf
	8d62wnwG0sTyuD4SSXt7KTYzDs9m4Qr9l7heu+UvPFjhNDqvWE11hNcHTxEWf9rXj5Tf1tb8hyp
	TueWcWKt4TKVaJkIe2Z1n60o2S4dB2GFdIa+e9XMmKZHr/cpoAJooAufbGS+sE0uAVHxZWFuO19
	HnBQfXPQ/6L3Zc7zi7hqi1HqvtEiuemXrsNJZlVwvVYsea1Dz1fcv6dGm7ev4gQCjq48UOIpiva
	4jRBHrFMbZuEEoExlhGzcjQtZovJZm2G8PU1oBLpFaNujpvQQbGyWpsv7REU8h16kjKeMm0k66N
	bPkDShlN5xbu7DBvhM1Ng9ahq6eP4P3RF5LoDTCBIcXYvd54Nnh/VYSYmXPu7V4ajvtGen7DJ34
	Ti/sA=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr295751185a.8.1773395692194;
        Fri, 13 Mar 2026 02:54:52 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr295749785a.8.1773395691805;
        Fri, 13 Mar 2026 02:54:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb1eaesm34377966b.32.2026.03.13.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:54:50 -0700 (PDT)
Message-ID: <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 10:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_slim_ngd_ctrl_probe: blocked on a mutex
To: Tj <tj.iam.tj@proton.me>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IKsD9jBW97TVLbWYm5FaSvWIMt4l2yBn
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3deed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZJUiX155COc2pYIC8DAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX9PobFifTN8mG
 Ve/I3U3NIkF7Y7HFQnD22i3h0NqjhftR4b0zPKYnqIjqQFI2fYwO36C/sOYZcw/ErRQJxS38C+M
 8gK89PfVLeTW+DOC/SelBJnkND9wvwu8jYkE4UhjnZb6Luy9mAQMYeVPVj3PREYSaBV4gbNaWlp
 rEzv3k9TcIkVGRhRucmjLOWAI4dCg5faGwdDqmIvvXs1xtMrtoZz+gL+lIeAEEtM8gQDIIDfRLa
 3bzabodrOOMDvSZLLGwg4qQCQrAUWkLyAldvF4NEsmcGXjiWez1eEMCfLt6haqruvUsAmoAwL35
 +PTSZA0kPVtiE9z12SgGLWB6+FqwpbRIx+UtM1qkzKxVKV0/9TCuKApsL/a/UsuqX8duwr8n0JT
 7iVulYIeEaBBGwgRZFO+N0CW5RppdL4/e2IoAbz8iLNmxiVhCG0xIAC6HCKCZeAWhcnwUnMt8N0
 tCImv5/exFcyYECOVtA==
X-Proofpoint-ORIG-GUID: IKsD9jBW97TVLbWYm5FaSvWIMt4l2yBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075

On 3/12/26 1:14 AM, Tj wrote:
> Currently working on sdm850 device (Samsung Galaxy Book2 W737) and 
> seeing kernel hang early and never recover when probing qcom-ngd-ctrl 
> platform driver.  Only able to capture a photo of the stack traces as a 
> result; I'll try to transcribe the important parts here. My diagnosis 
> suggests that the module is calling __platform_driver_register() twice 
> and may be the cause of the hang.

https://lore.kernel.org/all/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com/

should be able to help with some of that

Konrad
