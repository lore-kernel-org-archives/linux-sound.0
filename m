Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213F28CF52
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840769; cv=none; b=DIbeXgiR5eHlzVXkQYvWnKpxZk/teV8TYK0boXp0mMJFQDqlaeeLTZju8m446en1nqbVm23plOzOvXr9oVNNBAh5/W8btY51srUdBIXCa9GIj+3Me/gWpN/CQr0w0rXTRQOtsyJ6Yep/XDyWZbGeri06jsOelJtAaxJC0QwQDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840769; c=relaxed/simple;
	bh=UPnFCkbAAqYodYYvidAkc2Mw5hSlfS7wopk3IkQjvIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YN0+4z9dwjz8yYvYGIy1boVXz42BMubmSw8OG/t0FVfP8QaGYv3nRAnTpUKwO+ZDn4PI47cwZeOLHGK9z3MyeBDMYQ9uCXce90dADaQWl2mQUdeDwXCye5qjlZ1mrw7gi0jvtMYLV3+xEnhMNgxBz5m6BHfzHDV/LvXQWdcJrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deNIUuG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deNIUuG6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597B8qhn024916
	for <linux-sound@vger.kernel.org>; Tue, 7 Oct 2025 12:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=; b=deNIUuG6MAaSiEih
	79Yj7xhMjsEva8COdIUzR3DRV2L/fgm7E3AiEFExXhnGZnQPmEcGj49XqoXHYeD0
	OSIqf6rMzFTdQwNpTW6lGZ7l6Ek7CZmVSf3EYzlHiL//MGbxZtvIzMSXW4+rmoQU
	oQLJUGvR1rxirkbUCyiOzPwja6p0qrH+3QmC6SDp+Rt2qAD0jDdgM3boVpYQUHba
	IN28eXrStO8O3aS9brbJXluFZ2OnuRBJrcGZOsT7pcKmt4XFu/a2atwa0Hcf0TTm
	ONbLovEQumn7FZ0oJEil0lIZxe1i61Y6yJ6tJbceuf0D/IlIaGGNKKuVIfASHsHN
	N1+4xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn7ghy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 12:39:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso19036071cf.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 05:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840766; x=1760445566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=;
        b=qg/WhrFlcIvSp7YcO8/2h+JPec+na6sdLMa+9NFFEtVfiLABH8HHZ63WQ3SsObf1cz
         TRWBbRA2ZkKnUpx4lmbyfvhd2zPWWdRpoVvlcZFMhpe+Am1UJaF3q88JFWc2FnJvAKxd
         loAb84HEA0VQRu8M1Bg45XDO62objVZEt+2zhwhHoXINiSCKCzJ2oZ2o0H5U/I3iQv5L
         UOLY16/5N9TkI/41YNElbh1EPvibT2Nb//Vl9dYBQYuZMbCS5Wqs1HTWUTB5juAIsCPW
         yivINYYxhZ0OaJU+2+U+FWA7B/lBYCJAnZGAhRKQkdriVyJwXKtL3jeG6+qaFHV6OQaU
         /m4w==
X-Forwarded-Encrypted: i=1; AJvYcCUULmMcMTa05d3SqKRVDMTmNnTxwxwSpS7e+gPFfjcQiAoiMOsqMUesnI6ral8nqB04dpAj257vPCieQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIVHQ7d9yqqBjRDbqS+lpuu/xnhRCTfrxDcklpYSHseY261N6
	xepu1eGoXz1ZOLYtqiQEyDlITGDv0iw9ODoVp4uljQEeKy/lQ20s7kRi8E4JvyO/rCaFu9zSR0a
	awfo6IMc8nd6BbGDvXbCfR66o7jfJ71PC66nt02CaKC2JfLQEjPmiN1cXLDloTsrOxw==
X-Gm-Gg: ASbGncumifnHIKsstaOkT6eAffdreSJPiOYM28gnHQUqyQQTneZJDz01y8uZpaJgfYP
	I2kcquH8O9K+TMO6b2XVoXSATaPP8W7zf5vXlbQz0JWYgFy/IH0GDVOykYrcjV4U4AbezmA9M5S
	ZIZqI+AnYgPWy52wWrAIxaXuBIWO87sEHMKIWy2b+c62WqFM+0nbbRmZnPN+NPX/+8mQQufpL/F
	i/i8H4Wyz4NTxuyZ62Ei5EBZCGT+pAkRJ+LI/X6bMbx862rh5ns8nUXRc6jhT+mxwXcfvqz7C3S
	NRcJDHZoMGZ77L2Tnwn1OGJ+UvZyvml0GPTbwApe2n2l36RNPWbDzAtToBdcKrF9qp9iIx3YuiZ
	gEZnVs653pn2/Sco7C0wC4DJ58Yg=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453721cf.10.1759840766108;
        Tue, 07 Oct 2025 05:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBOfqIkALCYby5/GHjIjhxo1RktcdDyNxe0vMnZPbSP14BURV+Jd5BfDc/NgetMniX/+yEhQ==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453201cf.10.1759840765488;
        Tue, 07 Oct 2025 05:39:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1386434866b.51.2025.10.07.05.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 05:39:24 -0700 (PDT)
Message-ID: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXx+tynWJXs8qA
 NRErTKGJae4g3P4fL10VjYl64F6grSQpw5QLHr0NKYY5iuRpps3PrGUKRcHYE4dqPCJe00z7OMG
 +nQmPDCTXgawULeVty3x4Fn2Ev/fVYCdrgidoMYCVRx2Jx8tWm5qGKUbUBhJ+fI6McYnpP+dB3c
 ym4AbzSyJA82y21eU9b3+mWRDqm7XQQ0Ih8LhIQe0VobMkZafIxrpdw8MgZYa+NEfm0zQCa0YdA
 patv0ARJN7XzMQalH8s1HdvPjwKpN1ulZ9cfLtENMGVZA5xsVL6hSK7dPsFxlvanI852DiqboLq
 GO8+GLQEL4NXqu10ep+ge2QQoF+id0hGFPuvdDMuz6mWCVZ/eO8BP8EU3Z4Tg5b9cbGKOap6w5n
 rFXkmYESRvb7y+YPuy5+xN4Ju5f3fA==
X-Proofpoint-GUID: Uobz-OXkZc7JLTFKsx0irq4Ef5mTr6Iy
X-Proofpoint-ORIG-GUID: Uobz-OXkZc7JLTFKsx0irq4Ef5mTr6Iy
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e509fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=83KosTCz9JabPjGXDAIA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/25 4:03 AM, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> 
> While at this, also add description of lpi_i2s2 pins (active state)
> required for audio playback via HDMI/I2S.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> +			lpi_i2s2_active: lpi-i2s2-active-state {
> +				data-pins {
> +					pins = "gpio12";
> +					function = "i2s2_data";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;

I.. doubt output-high is what you want?

> +				};
> +
> +				sck-pins {
> +					pins = "gpio10";
> +					function = "i2s2_clk";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio11";

Please re-sort pin entries by the gpio index

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad
