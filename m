Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AEC3DD506
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387958; cv=none; b=l0IhX20eWsuEEN+N8TrIJk2VezVqObADuW9BkWWmBGhvADZXct0y0wWlK2SRf9qYQwpJpYRXu/1qrQ/jTSWeIn4HNwU7dD18D7mXUci+Tt7JkHaAMb0D670poqHV1G1RHyxIo3oMhdinHX2ShjxY0taVpDHueKTEsgH+ON8rYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387958; c=relaxed/simple;
	bh=eDu7KO5wVpXqlpuFQGtibVoKwA9rv9uNhIjqKkHb9+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL+schMJkdTdWI+9ZqhmEeus28iyLnLGjE6ydt6+zkqmE7eq+ftW5kY9R0V8Te84GFa5l4tNM/oGE5+bqFWatU/F8tM8ihbessbWyE3RWmGamsQW0//s37lJz8d0RTWwjy921IqyXkdfkxXSvEYicT9r5gfROf/i1erHm5AS0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKCnrjMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFmchs4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKCnrjMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFmchs4d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jugu1753995
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=; b=aKCnrjMKVZdK5yIX
	bETBOhO6H1ZDfQzhCKPjHdfCoAFlqLsHSSXBQn8CC6bl0jSB262dKBMcbQMrvwDl
	jk3lPY4Uufcusa9MPsP6vMSRyDYHRUHz74XUMOFK2pUOIEAg2HYab0B6IRV2SjBm
	u8hm1JrHB9Pw7W3tMKQ+rOUOmPY9ZmE8n/pLDd6oa1l/XwMjbBo75LB4mymzjsg/
	pL7rb3l39mN4Tf0qJgJE/tD7iyWs4AkRTiSun0YIkLt08hKm6nod450jDWbwgSjX
	xSILhatTr3kZA/LHC7DOgshb+asq+zMtsSIk4msLDGfURca5+h4faYr1YhhFi5az
	Y9cohw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q1mqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a15cef334so2449191cf.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387955; x=1782992755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=eFmchs4dDiLN05SAltXK4VnaG6utoEN6wFa5mnhLVzKJEZlhBaHNtJEf5hys6eC95N
         i1SQRMRmipqMNbCLUiJWmOZ1SUEBFs2tXjauhIbK3s/Lcun45dYiGVedJu5Pgjv+rwKw
         womgwcHi2NhxC9BRtnTB4TUJsLtx2sO/U6dq4PfcV5PHXFUVy8atKIfFn19T4pHiwjYB
         2rJBcsEWMtAKWebNf50SwaqwavT9GB+BMdqrp0XdpQ9BqBjTbqMwHal+UoCYlrgG2zUS
         yUSoJHQK5xe0O463Zt8phsOAyXU6TawC37YSc0icvPaBk8/R4sxdRLWIWdAoyA5nyoXr
         lkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387955; x=1782992755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=dVX6ivLYaqzUCDvVaTGnLUdswYgNcQVvW1p2qB+DmQDvL+U3eAlPvruoPIZ0f/PfXe
         kgrRzdsrgkYg5uwN5W6uTOSNeRgSL1eQusvEXkRNEk44e7yVtrdpT4op7NT630KhSGGc
         1YmU1jlf4HhPTrz7ziGlViTF/WvA5C29iiuk/EjKOJUQ1225Kiopbx3hWvhFP5NFS9F1
         nn0fyemJtq+ghgZk7rcc6DjER8qf7n4HWmgyzomLL+9qA8zIH/Z1/eA2rnjPxrfEVvea
         34/BbnTfuQkRbewj5Rly+wn6xCU1BCcdNPEnJNm1Z471qN4hO383PMXQKiEcBUrVihtl
         CF1Q==
X-Gm-Message-State: AOJu0Yws7awjp9qqyeJlvt524LxWymPqxRzwv0Untj8pmg394prpJAkK
	HGw0/AxztG2TXWrXsUrUAU0xQXMV1Xk404+Yadg9VHNSu2ba9GmELTd6Ljw8llOqEvIYaG0y7g+
	T119WLabcxFanb7LuCfdMSKVPEv7Z1z4bBl1xBkJzXaW9ITYehrCVD+q1MRlDHv3amA==
X-Gm-Gg: AfdE7cn2hRH+7dDLh2B+FG7T+1t68oSWRfiJoQ6k4IrR8pGHp8lzemQK8yN5YjSIG7r
	AoRi/EIvu4Y4zAGMBAkSF4y+jdeJR/T7yaKSLoOvaXMZXYV6PWzsn0g7ofVAp8+fwMGjgFtc1cg
	JVjxFTASp77YhMHGVl127h1XDB+evkCJR1/e8jyEUtkrbh0JGNHM/TcU8CFwvSloCJGTm7Nib1x
	P1bbwUtRR2tm2RWk5icJ1da64N7rQyHsZh6Zyo3BrMywgVbvPo5HtJsOZpXKYNNBzr/cLYnNf8a
	SKePWXAE4tt7fn8kwuT/DxfzvPb16DsJgNmCcWQoj6RadLsoFTjdWDkXZY5ZAZBDFm2VJt4cZQY
	L5FyhYlCTtUJ/u7LoUDtD3PtspgVWWgLYKbw=
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663431cf.3.1782387955000;
        Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663121cf.3.1782387954346;
        Thu, 25 Jun 2026 04:45:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe6220esm165472966b.45.2026.06.25.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:45:53 -0700 (PDT)
Message-ID: <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XZ35LpMuBKQg3qLajzkVWDTbd_Tlolbo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfXydvuH3dX5dSf
 HLX2l8OPafzYeilfO1kHn/wFNFgr6vxWKgcKFY5mXntaIXRccI3Jx0ifkXqUFmPQXcPvWylKTKs
 R2OBlZEEqlPyeVbMarG50QowR73KWMk=
X-Proofpoint-GUID: XZ35LpMuBKQg3qLajzkVWDTbd_Tlolbo
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d14f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jzc4C1M-m5MPkDtnTmwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfX8UtWVp7ewwsW
 8OOwXaG+spjSmZPZvYpa9lnFTiOSmWH32xu2527G3JhJAC8iQWC2xXsg7P0XxYFt8fJbNAYhYLp
 vwLbJ0blxU/lfttY00ADGajOnJHkhKrNo0h629E6iDJ6XAdI+MjxnwhgH2XrPlMHUO0KIyFkRWY
 y2TAnAfmYxHnXfD2YNAUvpREiPmFHh44lujg+qLtbXPcKpHOujxFIleznJAlMZWphpzHWvgTF3s
 qFjXkpyTGIuVvmEXYQxXvrobBbgUeZv1kNdSFFCmGOFBWO9wmfJB9XnCWynLhij+SHxXjVmo7ZP
 Dq2IOQ1Kpz1D8eU1djpnU6oqtpI9XLj7ivvirXUWsv1dfUOuHNzrUrXafnPo+97gk59H0kKJ3Ce
 zFYzhroUpNnwgR5OsS69kbVCz1/QbK9IZ6/f0k9NB+Co/zrP1T80C01PR7AG0jAgddKtCe1NfTq
 edtPMjpNU/Hrq8vzwNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250100

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Just a couple style nits:

[...]

> +		rxmacro: codec@a040000 {
> +			compatible = "qcom,shikra-lpass-rx-macro";
> +			reg = <0x0 0x0a040000 0x0 0x1000>;
> +
> +			pinctrl-0 = <&rx_swr_active>;
> +			pinctrl-names = "default";

Let's move this down.. maybe above all the #cells

> +
> +			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
> +				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,

Please align all <s

> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "fsgen";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Let's keep a \n before 'status', everywhere

Konrad
