Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54591A683E
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780555; cv=none; b=NAMiFTQFOSxTUmK0q2B5Z5OVd8I0WKJqZJQP6qwtQQ5W6eL6QDGsCiDP1IwqI7WzNLbyTiH/xS05vJlkoeiXjCmjCvWbKsjpCfzEb4QOv8yYbUr9aSgrO13j4lPvFfVK3XRxnKtPI+6Y4obHa/5z5PNCpsmfHIKm6b+AuYsU7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780555; c=relaxed/simple;
	bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukg/58Wmh8kgOc1SJzdPgdgfsG88eMOVg5R+GxXLo8Yenl/TgEy2VOifyyqKOilTeXOQutoSKtwC8bFFyVjShRE3ZS1XZBPgNteaR5PzmJ23i1eTOT7ej1rImIkhLWwkG+r/rQD0LdHWzsB3y8nY5cpsJau/TmZzjSQtrHeWjoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kV9T8WKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwbtFC+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kV9T8WKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwbtFC+6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwR581302643
	for <linux-sound@vger.kernel.org>; Mon, 3 Aug 2026 18:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=; b=kV9T8WKFGUR7GR7t
	BmoPKkpKLwPEM2BmAgc8G0u9ZAukWMNlUN8hUV/pWggiJwiKX/8cWzhRhNtYjCMd
	f4ppDmo8EZ9fJZeqhK06ZKIOwp3Qg8JFceOgY80JqpvszXDnMKJpXZlIbW09ReAm
	44sC262fAc4jjbX/mFjLnmBXTwH+g3lWAf29bobSQXIBcA3mxJur72jMWzyrmnOu
	Z/78F4rFGkEMau/01olZU7YqWvzKV2JRE9IbmNQC2Oh7BjRPISx3niNZEzpdpIBx
	W9dd81i8tuQJ1pRHuLhQMRnYIEV4cQHv9+aS0Np5+f1fn3k5T5UhR8T1mYBLgvvQ
	LuhhLw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrtb15b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 18:09:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe62e01567so287679a12.2
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780552; x=1786385352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
        b=IwbtFC+6Pl1j41gR1GjttfpATtk3RRRtdEJMrN4fcQ+c9QtFM2qlzZ9Xy0+qG+tIko
         hEfOQMSm+FwwcdNvSqIcQNIsyM0qEkxtFkF2p92xPc6pZgjatq1/APjOsJKyPmL5rtvj
         R5iCZfICLSqrpX0RdSPTnNUyqdvAdCrWCayjjSWc1XnfreAQjuvMfjegsenshX4twjQd
         /cIz5E0d70bqGxz6JXvRhIuF9gHpo6Doc9d+eiuw8GvMNcFVrrQx+JfwGOKYrNNtBacg
         kArT7oBIcT0a5wOzXAfcUFQoRNewjcBXVaR3KwVovE5IxQztWAG4oWhJFrbb3A/IytDZ
         TTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780552; x=1786385352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
        b=bYw2VlJ21TUrmWj7JyBqjP9qMOa+e/ABR4mLBWL6kgNUO7pOge2rvl9Z+Um+SQv9ln
         6Y7tCndVRmpCLAYIrzzM8G69b5ImIgMA+GuADPJUVAR2DzW/34AiGz/0LooXipg2ekkk
         iYCbIHSDC6X+YJBa+afAx6t3Tp73O2BESVnv4IY9VHr0xkg1kco4JzNIPdkCregC2sMm
         Jd6dKPK5SCqJq4Y5ZV2RLuLtKa7WqQS7IgaPxqs2+VywWY2sMcwOPCDWu8UfQwcnyDkj
         kYrDOy3TkVg4wF3DaYoNvcjIlQvZbTKeYRK0E0g3kRw4seto6HVPBoE4Oxe7VVbG5YA9
         mU0A==
X-Forwarded-Encrypted: i=1; AHgh+RoQY3s0/FHrfvXmKhP3Y0xP1f2NVYe9rgIUFVz3ti4OhDshw+tVnt1J3r+2FYzUnrFvpzX3fUXFyrqxcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQDohFnvK2iJENbxVo/v6TbgFfA2NayCl/Zyp9U3EG85HRdxd
	iMFnrhPaWMqFvzuNSH8IO6bCpLC9iRdQ69qcze0IizHICKtMPgMXxuH6ZWG4s93juYxDtYghZm1
	EQfWtfzeWKuARVZZMM9B9GMq2Y0IbPK2oPPSYlbrM6PJtNrjtbFl4wizPXcSOTUB2gP8gZpe1VA
	==
X-Gm-Gg: AR+sD10tfT7gue2VM2zPoiOSr/eDYHmoSMoMwDYUbHCvXMyJebV5d2jf6F6X+TNJhwY
	rOwODAf7gEw5/6HQuJDwPE1wMgfGN7aHDKpuLR15vfHbzanLMQm79SUeRKtBUzJVqacBD6R21YX
	qbFSz4lVmsYIFCAZTYsdah02wcA9PYYrmAHONOZHIMaAFFlNMr6za3AB0NA+1TGx6VAxW4qNZK3
	9+Phg3aGMSpTR11lLTmQm01WsUkA9Yxc2adwbuy0h6iZBWy6obqDNwEc1dM7m3RH185b52jQDS/
	liP3m2J0jw5+ScP+79W8nUi17kCuyE6Hzy8bJ/Ryy1OY8m1+rHoi9OeMS9EO/Z08dK75OEoMzv0
	at3Yj0GD76vuN6T9lHcNlyE4b+dQlw6rXsEo=
X-Received: by 2002:a05:6a20:6a10:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c92a62d94cmr11790946637.33.1785780551607;
        Mon, 03 Aug 2026 11:09:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a10:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c92a62d94cmr11790921637.33.1785780551213;
        Mon, 03 Aug 2026 11:09:11 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm65919018eec.28.2026.08.03.11.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 11:09:10 -0700 (PDT)
Message-ID: <bb8dd840-cf24-441b-b096-91cadf7b62a1@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 23:39:05 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] ASoC: qcom: add AudioReach TDM backend support
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <47bce201-5086-4f70-9e4f-e5c50059e487@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <47bce201-5086-4f70-9e4f-e5c50059e487@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX+FY+ZIII37uK
 jTbDrPbikEIk7HBxRPwMTgCHt0z6pK3bC7ulaPlb/lJGDipGnQtIJjaWenWtXLfydq+Tm4G1wJc
 5tnvt25iKDqCj7Uaf8W3VJ1ZSEPAe3n5TELnNmYcDsXfq/EbgHGxEVzCiFoEH0f9xcnxBgMt9cA
 ZyOkz8Hx+nBM76tS+Y6X+Xy+1z39yZhMU4RqAVpDiZr1AMD23hEGmhBL1X2ROxv/iVinvLAcF2A
 A/dsyeZr5Eoi/A5iA2/nqMZ8NuOZMHCY4ETeTpoxF1X8jTLUyiW+r2E9uvG+G0vKawENBMpHI4w
 woouetawcpyqLOMSZS+jSI6hG2R1IMoxbAXtYzwjYhJU7e74SxGhmlfZSVYGwfUWS69a+UiSbRj
 0bcUKTqZhnQ2GZ2gpaWtMdztMz1q2A4IGDaS81zBihRnYtGo4VRNyOmUP12yBacnZuEHduJMWU3
 wOeBy9mtbuekHrIMnFQ==
X-Proofpoint-GUID: OluxUNMIS3V7zcuKxmvaskDd_FlLbvme
X-Proofpoint-ORIG-GUID: OluxUNMIS3V7zcuKxmvaskDd_FlLbvme
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfXzJlGIyUFIlYs
 I5AXGmwPVRQuVEqA6+MA32hjrpH675jQeeyBi7L2N+THQAJW/EF0EwO0HEVU/QN/UFtIHjoKwGo
 QrGePoybdMVyOQJfDPhShYqCpeOLOoU=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a70d948 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=O_9MOtM5Qdc4zGp9YqwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030161


On 8/3/2026 6:37 PM, Mark Brown wrote:
> On Sat, Aug 01, 2026 at 11:16:03AM +0530, Prasad Kumpatla wrote:
>> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
>> up for the sc8280xp machine driver.
> This doesn't apply against current code, please check and resend.
Hi Mark,

Ack, Sure will check and update.

Thanks,
Prasad
