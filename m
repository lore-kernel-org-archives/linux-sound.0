Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6CD2E5B32
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627300; cv=none; b=mrTSE0p6AEZatSo3fBPMgyEuqKhyM6/OUaSXxKmwV7PXJVCv2nhozuSoLlxCm58RvhK5O/fCUN5KhThT8SKtJ3CaPMBEIX2i+T5HZV72+voiOoUvfM7Xteu8bK8YDDIW2w5NRXdZxECBt7EwDLZD2KD6OcpCc4JYohcW+xhvhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627300; c=relaxed/simple;
	bh=G99ZPbE0qrXEWxpI9cnRms8DfqdX68C4eTHKs/UcMD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYIyb0UI+nMr+r/VQ4N3D48achi0aymcsDohuiWg2xdwJ41f2CJ2ZqVs90vvUqx88ovThk1ASkRrsmqcjrjv9ZvIRm4o2WKhVQ12PtjRym3o7wxxzLnmWzuVRGtWWLuRQlM1RhJxJH8S0XfPj+0y20LOCvQt6+ltio0E/iBwotE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA8PzSRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA8PzSRj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEd4rH024777
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 15:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXyMiKp6Pe+UsoaL5xjvf5aBb6HRAlCgHcOZD/wdeOM=; b=CA8PzSRj4MsKetOp
	iFUrF9KVRsp8LxbZKGn3ZZL5VBCWuTNtrZV5mlGAkOMeQcYDnQXpJew3FjH+fQF8
	FYMKGerxmrMflb9ZnKj7k8gO+basMKX5D04Z/JFXEWJkTKgxrk5kXI3P9U6fktiz
	BMoOqgYkgiKcDIzU3E1tbeCrc8O6+jYCQ5ko4fz2rdQGnt+im4UkTDfIjAjWd7n/
	ybC1e2jaRRbhFitr2xA3vsOc12f3gXRObrkGuBK9IeHiFBuPboM6+6anVyOBwPwd
	CEMkeyVHfYHB+sjfO+nz6DoD7tQY2f7lhRqhNQ1zdZj8QIhNhG2sFN0F3N+Uagmv
	1CMR8w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff10prn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 15:08:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54aa2c8926bso512336e0c.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 08:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627297; x=1761232097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXyMiKp6Pe+UsoaL5xjvf5aBb6HRAlCgHcOZD/wdeOM=;
        b=DwA8sGjW+CJlgEkPPNCgDhC1ZOXQFQOXClvhEm1eTYfFk+bSR5rDvQrTNv3kRvzwtc
         HsInzKgup/cOb4foAmCfQ0pVmadTAw62iuU2ZF6S0eynM6j1Ap6eKZgKj8K3QzcJCLTj
         qh4QRccroRmzchPuNUoZtfgISZW8doKCzZvQq59OPEtvaanJPsfGm4Yvpo75Mb0aGvJS
         7In/nEi6aEjiLdKgJlC1aHNuXco5RjR7CLpEmtdWTduus1qxzSYsqhg9jOp0qCYeMpHD
         LdnsvqoWSjBwJ1CROR9jDoKU0Na++mm+z04c9vNu4FWJeMPHRsHPeaZEIKJlIrdbIHcO
         wEfg==
X-Forwarded-Encrypted: i=1; AJvYcCV27YH2VFV5Pm6tmH42QTpwPlPoHAm02smvRcAcGZbmCAEjLfkxbQa9vCLZ4SzXhpLnllQiaEaL0GVutw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweiehM+f77Kkx404AnvQBzQ4OylbOy5WQ00wQGg4ZVb1FKsYlP
	XbbSRzTfTPrkW8EWQAIOkeaoZ95Yl7l++PlFeZycdoVyHD5qSrTHdoIjW2tS4b8uIFE5S6jYvJz
	0DtxQuPQDJAr9kggnJCdaM6RKvfp8NK80b/Hd6B55Ncdt5Lnc8+6+MJ+IceKPDs7Mvg==
X-Gm-Gg: ASbGncuHRfJ/LdKsJf5jRbbosjxx8R6oHJ3xz4fduQ5M0b0HtNQlWObrYfxu4VrusIJ
	moPP0yx7L7swUlrPFyNW4DbzjBX0eZBH6hex6JXAvSOitFqakevHp+ceByOh+VhLNfYY47MK0x8
	YoPEk30roKj6VGD3i84Gyu6OVbRiQOP0Dg74B4t1WSLlsAFGBwEPzdbMbJ2xP+YUIB9e5ruHC/g
	AoujXhZHO0eBNbYAFZuT40HN/F7FFzaLuBe0VnW8xRSBKPNkcxLzxBUKGa1C4As4q+BtlS+jgkn
	HvzgAMFyUVvD4wfBfmlLX2KgCwjDwKQd4/KQmDBopty/kvLJnOpIidHY8PRovXkn49EdSc8s9WJ
	ITDe/JYQUMf8/qpchhzfnzyqRSA==
X-Received: by 2002:a05:6123:2e6:b0:554:b927:dd96 with SMTP id 71dfb90a1353d-5564eca468fmr356765e0c.0.1760627297163;
        Thu, 16 Oct 2025 08:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWieiWFaaKyulx2rok1ilSzb8mCz8kPrQASfSURizbtH1xNaE0Q4mMvEcDFXidP9X2/I5HQ==
X-Received: by 2002:a05:6123:2e6:b0:554:b927:dd96 with SMTP id 71dfb90a1353d-5564eca468fmr356696e0c.0.1760627296637;
        Thu, 16 Oct 2025 08:08:16 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42704141cc3sm1877857f8f.9.2025.10.16.08.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:08:16 -0700 (PDT)
Message-ID: <b0d9cec5-1162-476b-8438-8239e1458927@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:08:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1
 soundcards
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX32lJVHcC9iCl
 3PzHx7qCwTHK1Ua3FyIZV2JrxGYBmFScs4ynhdEpZ1O8WzdqjTWLzrj5oUemvSw4Qq+qRySVwIE
 qw9j2HcPAy/t7UczidC/ApDlZGWQ8TsvK7+OR2AJWPAnW93cZ9ixED3NsVKNJoU87rgGkOswnMz
 aUG9q1p3wR/YeUVxeICgwPMnciM8E9hFWKwZMbGsS+Smk5fOSGfhZEQMxJ04t3uJP9JACEdOAY9
 4OH/eLfFmCn4tOIDGBjs+MB21QybI8RJM5+6H84afLcloPSyH3z76WRrmEHnAlxB+AiyRf1ZaLs
 fpHyGvn/1am5eQZPrukq6SugK+vOAXJIkV509ELbg==
X-Proofpoint-GUID: V6PVXXbQU8K3_-qF0dYnLXjOKX8MXZzf
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f10a62 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=7YHmJdMxG_e0k3IJONEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V6PVXXbQU8K3_-qF0dYnLXjOKX8MXZzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/7/25 2:26 AM, Alexey Klimov wrote:
> Add soundcard compatible for QRB2210 (QCM2290) platforms.
> While at this, also add QRB2210 RB1 entry which is set to be
> compatible with QRB2210 soundcard.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -21,6 +21,10 @@ properties:
>                - lenovo,yoga-c630-sndcard
>                - qcom,db845c-sndcard
>            - const: qcom,sdm845-sndcard
> +      - items:
> +          - enum:
> +              - qcom,qrb2210-rb1-sndcard
I don't think you need rb1 specific compatible here, unless there this
is totally different to what the base compatible can provide.

--srini> +          - const: qcom,qrb2210-sndcard
>        - items:
>            - enum:
>                - qcom,sm8550-sndcard
> @@ -37,6 +41,7 @@ properties:
>            - qcom,qcs8275-sndcard
>            - qcom,qcs9075-sndcard
>            - qcom,qcs9100-sndcard
> +          - qcom,qrb2210-sndcard
>            - qcom,qrb4210-rb2-sndcard
>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
> 

