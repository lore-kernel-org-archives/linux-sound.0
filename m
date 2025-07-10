Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED52EE99D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163754; cv=none; b=iNueWCQJY2Uauj3+OPmskfGK81PVTkjA5+xYifokGfb46dG2JPDd2O6KfSfpwWUiaxyLU4j7GIAzpBideiCQHef+1NhOncm28J7OEtZAc00b9BDl3C9FxRU/8r+hVHqc/nHRKS2EBTo6NErXE+hYUA2n7Ss8/qDOAKRYCyOmdmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163754; c=relaxed/simple;
	bh=N/aXBvT4CRm/+YYruIbNGAgz2RyYehB6jiUrVJyElIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW2wvwu2MqH01LspD+82c2cp0ZyIS1gSoYWAvP4yey3qYw8Vl+SDFjDw0hjqgwZonLrJN7breWowygTt/1ICYttrTqxraokUPo5WrPwYhbAptp1zLGWM2Sb+egX+b9Qk6oPigjcWuWCrS5eKSAuRid4SujF/kf5L1ryx9/jstWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmTGLJWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmTGLJWI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AFXPVW016792
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=CmTGLJWINImAHKoL
	C3DmEyyOHxwXFEHYDYwh9nNs9+qHt9oDnwlEHteC1OnCI6yisLYB4/ucmnYvvLrj
	9Gnq6RF4WjuDnhLew1VVzZh/snqX6sLbsFTDtDT88C0KSOr4Jr9wcZPL9Eg85AL0
	Kx45dAtjgRyOnaoGdJSd7P5kZQCjABqt56jZujpaGtfIVeGs0RuMBAUfcJSAXwyS
	vz75sSrZHISd4DCZLQUP/EVxIiXZYB3tRoFHAQTFkBZMnonxyXEwXKUUMo0Yke+A
	gy9X7lG2p3TUYGL40TOiN0KoHtT2U+B6nJ8XwMK+HwSgGGmHgEC7eAMpNCw7vVSq
	VAOVAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnwkhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ba561898so13328885a.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 09:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163751; x=1752768551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=;
        b=MwNLQBEqlWzNGaLgTjhI7kJeDsJEgyW0mP+O3I5TScgjKzutosyf66Z0HeS7uX37Zb
         TRjbCkB9Vb8sdBUlEU9DRAHH3nl4c1eUP3+2GJHU2DYMcktLH0VS+nCPCSkrkpW3qeDD
         17CQFh25b3rp6wFJNJ5Ka5SwIhHcFVesyAyaoKgGpa9eomy9BYlz3VJLaQbItv81YlGq
         4NSCaa5wGuovMD4MtTb3OfKxCo/6hrWIhQbdNmVl6f2grxCUEYxA0TpyH/QPB3FXl+rT
         BkNp4VuDd8iALGFOLBLOE9cGltHkBVP1Mye+73xxHbD7URvzcTcZsR0jDCv3UTB2Mb86
         kjsg==
X-Gm-Message-State: AOJu0Yx7tyG6e6yJE/iCSbd68/hs4RtBavrkJpj38Za1hFbt9frbxMr4
	CcBEjkJi7OrqhriYywnnY2G23c3v0pRnBwqeT4Exx7xwCsAZ1D0mdtOlwD3waFYgkD/mncn4R52
	BOvDXSZuRJOt0GaZUKnhrKPKa/wLslV1Ilfm7zo0oPzNuVg4fbXz3wbRmsIBlcV3qxw==
X-Gm-Gg: ASbGncumkztUn40k0og+poXSJT0w+kk2Y5gM/vCzYpMSak/LV45OBnR2Xz4/c9ZCNLm
	Pl96LQ6J6wSf/XZ/ibz+8DDosUT27n2hztwlt0lnN7rNOETd6sGWigXsntxijOMDOQd2lILeiPv
	+temUkfiH/uhoKcvzp2KU91/UnKNWHOb5XI6arNAO8rLnpQp6fwFQ+0Vbn1rYU5huyeoKCCFQBS
	JGiSGBWSESo/ikGvjjOgJi13/ht+WYk8d0wm6ooyPQhDhhOyG4FRVjwKZLnnCVzLgjdRWfJ5aVm
	bANJmJ3btNp1iH1M1rWsWEXkOlLvbfqiKxbkrAD3LDobngC89k5tFt+1Kww15s2XHdBRiP9oWhZ
	WsU8=
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7282785a.0.1752163750879;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeeRzlvLfbUeyU2SSOBFEfwuLO+KS9f2E54G98Fl8PmYU4woiYSJtTIHX8QfSQxlGnb4YxQ==
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7279685a.0.1752163750275;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm153830666b.5.2025.07.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:09:09 -0700 (PDT)
Message-ID: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfX2LTEDXnLYdN7
 K2JdEW1/J9VnzpoqiwTp9w0eRtnR0SmX7eBiqyj36OXHmnZvYQfNgfLlyNpie/ascL3E8cx2hEj
 PS5hbRIMn3GGmfIu3Lo+4xbV/uV5HFKNv/RAhPyMgYd0qIf1ovjdxcaqSKDA9PRst5qUvS6pMz+
 kjPwpj5JLC+L2dAHWz2kn1v03SiLkIeSyWQuQtyvwcN1UY97dYekSUWr2jcrBhvdvpft4Nw7QmX
 OVK+JAVRlgg6XcgHiLYIwBvkZ5siKChpeF8RlkFhrSFvZnO9VN3sN02PmLRYDM1+vWnjvkd84WP
 e5TsvwGScFA2aQftYn9OSBhnyureXF+v17pRVviQPDA+0KziLPzaFQ6RrD2GVsGpaVLy3DmPkEp
 y+3yoy839OcEX8Oj2MmJ1soceXGkCPOfiUY153L1Far2XhkKuyyUQUEmkiZXWv+13N6RCq39
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686fe5a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=RGHBBWgGYxkf0F71jXEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: a0XOBecWw71rQubvaRkX1wf3Pqti8fFM
X-Proofpoint-GUID: a0XOBecWw71rQubvaRkX1wf3Pqti8fFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=821 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137

On 7/10/25 5:51 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

come to think of it, there are a lot of drivers that can not
do any rate rounding - perhaps we could introduce a NOP implementation
in the clk core that we could reference, instead of copypasting
int foo(...) { "return 0" }?

Konrad
