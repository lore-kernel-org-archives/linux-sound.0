Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BF14AA9
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209225; cv=none; b=ebEgW2NsemQ7vnT99WCxWB57GE50zKduwIeyPAlIZAQ9aJG4X7G6fxNkdWlWPgLI7YU7h22LTiff9xig67Fc6LlyW6UIP9Lu4RDwQcFNx50PoZunw0Ulx3x6I7aH2kem7pilSU9XSYlL9rscadcV05+r4Utn+eaYoRcPMt6w8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209225; c=relaxed/simple;
	bh=8ThBrHYseNWTgVIENZvM3X7g4bVp9jFWwMWyTq5gbZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0bqPPhwv8WmEpRh99/Fvtmm6tCV2LfhtVxxOI3dGOqE7+dn2SfE3JgNOnAUp2QZNnp73nf7txAiyHLictbV6HTkODvkaWRqk8zdQ0Kb+cr4fEVdUDO/VHB4HUZjL6nkRu3r/6MTb81XwkRSZoXz0m8UMPEB8dkA1QxM8+1ahC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0srTDVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0srTDVV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBViPf003873
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 15:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b/pYUHRY/Pf2sWjUsiTjX3SG
	fPJK5GCx6P2lJBvN2kA=; b=F0srTDVVl/a1cs1pvhgj6hW+AtRw+g8Ez0dCBcCZ
	V++pobwYDVwoxjtbI3tEd6XmEsinw7cWZXgfYKwsyfTGJx+le5DcL9pYzXfezhKZ
	G6KUC9smC17fnW9S2l0P823jYX27SD5RtuPFQEhruyqMSxTWvtYvjXOjKvTEiO/g
	Fv33hRGNJooCPPSnHLwO/pLXSCW7kr/DdlMamZcRh1ihLQeHKO4jOTnFSd9mJjPG
	CHMJH7j/qeP4RrNwtIuMfEzcalUWPerwUjoxss+uFUljoyKKhPFWC++cE1T5019a
	5sYJ+wfvULmDMTCgmsr7zlcs0L2NSt0Z9EqBuCuTOShFfg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tbrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 15:00:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb0e344e3eso14241836d6.1
        for <linux-sound@vger.kernel.org>; Sun, 29 Jun 2025 08:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209222; x=1751814022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/pYUHRY/Pf2sWjUsiTjX3SGfPJK5GCx6P2lJBvN2kA=;
        b=vL4XSFBy9Tqm3yYovGo1nj/OuKMi3lCPvnyjftLjki1nsR6vWUdTYCm8yCXipVzMMm
         2JIXVlcb14OG1m4/3pEeoPRwNORLu1KVkyGbaYYH2uG/d4XasRuhNcvNgrpdA+z5IHH/
         9MbNTlF4a8kPEowI5BG69Q1uV6ebp32zkmTTIVV/pSCEDb9rMf6qQv2Jpl6l3TQ1YKSn
         hOQYK0+VcgN4tdVUdTP787AfEMJO0cJhA3+t0HI+d0FQyMYrq7wg+qZgmE81vafKESxt
         lpXlUq6PHCDuv/nOMMzxlO3SAjhVQnq7EXzWeJgS/jBZp7zFSyQxv4gtBnEXOy0aeL/w
         1uhA==
X-Forwarded-Encrypted: i=1; AJvYcCVPorjmO2EwSFOsT4yRcXDqPZqMOaYXFVKHJaKC08dxwIIzgWer/g3HupEclpsI8czH9WI+CkQJ/xqWEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HaGGrqmHr08xRGLoOTGTojEX7LxW+FTSY9TVm+VLuy9X+z4O
	B7JcpeCapLDSeFx4nm4gNwVGY0fcR3fNJGTrtmJt+fADgfyf16v0g/VOOU+acDrtej6Q4P8KXrd
	pUKmKsRIqXWweAkI1EWudoG1rXQICGAEBjj+bzPg+1CeBk+GSg3NmVZ5+CK7c6aZgQw==
X-Gm-Gg: ASbGncsOVm0/xogWp5A0wMd5rTOOHXFHojJhxOQ7R1AALYzez87t3cqx4rlp9E3vVQ6
	wsnEhEIjTCaqnPO5L4B3GwYPn5uyit94pN+kEzXPE9MZlXQGVKIJPGb+3fdz4bIR7j0QrhfaZP3
	NkWdZKt6O5iwRyK4vU2qXiCccLs+m9nWyIJLE2u+vpMtyQX5wR0mvQxyNNPPjiQxVQTAew4L4D4
	uaSQlYTYL6Yy0TStB21yqFE+siYAQ74ECS6v6UaG6UCC/h2AguPITZ48vw7w5In3mboVA9Tqgx8
	ZW7D+TuoyONWdZpCLHlMnVmIcXLTkSgtGFWVhm1kR3PeeMdHOe359UVWJVJmFSUiaGGzoIUgqW8
	4w6rYPM9Afj0YcH5lSiRugloPVUw97kuZy/k=
X-Received: by 2002:a05:6214:cac:b0:6fa:cc39:9f with SMTP id 6a1803df08f44-7000233d01cmr161995716d6.32.1751209221849;
        Sun, 29 Jun 2025 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA5FIdyh/Au6WeKGTSUip3heR3p8gw5t0Q5mmyuMzcIuDDNsAdJQNEGpW6Ol5VHhlRtmZq8g==
X-Received: by 2002:a05:6214:cac:b0:6fa:cc39:9f with SMTP id 6a1803df08f44-7000233d01cmr161994646d6.32.1751209221184;
        Sun, 29 Jun 2025 08:00:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e30e3fsm11049641fa.49.2025.06.29.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 08:00:20 -0700 (PDT)
Date: Sun, 29 Jun 2025 18:00:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio
 codec
Message-ID: <mj3jhm6yr3bv5vbyyxxdo4x5niw5quxcal34wdg4vtplipycl6@kjhxtrqvqejo>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-2-e52933c429a0@linaro.org>
 <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>
 <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNiBTYWx0ZWRfX07FwDzzJ+oSQ
 RTYkr7SrT1n92T6HFRxomkkgOOZonkJTDjL5seCixB9ODeYiIQB5OLSfpbH1fB4atxC9NUQRo81
 nBxz8pK5kat5CXsLy4+Qd0yO+z0YeqbPZfOi7J8+3VnxhbSG+A2lXEiFynmr0+rx42pFwsDJRVd
 gMA/LhyF3uTt7j6RMztjJ99k/BhUKyqTWJz2s3qqo2/Ld5K9H+SP1+ggp1pS0faAhDf2c1iI5jh
 lsbs/bES54Iro0x0b5LPJ1FLJxe3EhBoJw3KwGGnaIvEvfV6QWLvF16sYCKv6Tbws2sO4yXTlEu
 wW5Ir+4P4z+dTiW8W25LfEEbahXgpX6XlISfKngd1sN4BjmWao11i/gLRjQem8nkKJYCnZ3x6pz
 kgLTMLjabAY9khYIcaZLZaFb4mYDIXMnj6LFDw/2dZVzDtNIMbr6YQp2nj472kYbBmg67Pjc
X-Proofpoint-GUID: Jji4ho0EwzM2BiIwZQg_ua0gCxYsPY_w
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68615506 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=PcvD3jq4JvdaTR1-S7QA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Jji4ho0EwzM2BiIwZQg_ua0gCxYsPY_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=501 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290126

On Sat, Jun 28, 2025 at 05:42:52PM +0100, Alexey Klimov wrote:
> On Thu Jun 26, 2025 at 9:48 AM BST, Krzysztof Kozlowski wrote:
> > On 26/06/2025 01:50, Alexey Klimov wrote:
> >> PM4125 has audio codec hardware block. Add pattern for respecive node
> >> so the devicetree for those blocks can be validated properly.
> >> 
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >
> > Remember to ALWAYS explain the dependencies between patches (merging
> > strategy), because this now creates impression is independent patch. It
> > is not and should be squashed into previous.
> 
> What's the proper way to describe such dependency?

Text in the cover letter.

-- 
With best wishes
Dmitry
