Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F9331A4C
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603107; cv=none; b=Xm0CWq6G3asEeBamVbU+UrHyI6HZI4BWlFrPJ5lI0xTlWZnLgJ77d9fX9ZAHlWpaMYY4vJgWAYMOnpe6Vq/TOC6dlOWcQqHmUMcsXnvrCltl9gZ3gON2SgA9nGurEzTaRPi9/TynglASTdHDxfKonqF/8nXqrUp8yfRtkHQPnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603107; c=relaxed/simple;
	bh=D1Lx3fbbK1SoVaIywDLaBXCbCV2o7HPOnKOHfU+MHvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8RG5YntlNmpnDyDqiZLkL4HcXPpj7LN5gxXMn4uB5AkPe0Elmrkj/1RJJ9URwm8J7tLPplxdw2uu/MsM1cAiNrTTSX1ne219k2RjCRDjB2RglrV2JUpyckzgZk6frITM5DD2PFIwcZ0TpSJ8FY908ABhricQJIZ91N3HtK5cLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpdUu/BT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBl3Bg2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpdUu/BT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBl3Bg2R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1CG7WP060523
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=; b=kpdUu/BTL5rHMC6X
	VCKSgR0lMs2D5H2UfXfIoUMy4nJj5SXdnKlc6kzbJAH4FI6/GuHXIDbH5i1GYrdW
	EOFtUFeoDc3HxYbg19ee9kBTfTYH+1rWtS+qE53SJDlB/weHTewwX+X0GjUvAnBD
	MpgnH6hYE130lPPRZ9yZwpNWRc/re1J7OLbIH0SGlCMpJqIxqCXO60x7888lWQCj
	C2nD3fsI1a1ftWXPGIfy0FdryUgsC10MZt8UkZ6jHD+agVbo1j7zzaTbl0mz+xQR
	/pWVYc/xEvBailrdBptdqDdnFNLkq4Rs4lRhgkg52TKKD20Z8aE/4NTnnYaSb12L
	StwtFg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asavh8jnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 15:31:45 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-453109b60a5so801650b6e.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764603105; x=1765207905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=;
        b=QBl3Bg2R4564K+PcP1qPOswJ2zxo+XIPF9ze3R0Tf1zOLoyYj8zBY2khhBDr0l4Nyi
         X15Q0+FaZJQr5ECJouv1/sudEEPH6G9DgmhBukQ+M2/y+QedPcmjOH4XgBKO5oU44pDW
         9NsHEe8A3Xv0o4h7ATWfy7S1ZcVuvj7WtgR93LGzN+cqTC3Yg7c27NVj8vUX50AJlxBN
         0Q5EOAU/rpZYRptSCltjRLOkUbfoFymmyHSjpzkYGD9JqDs+xqBhcMPF1VN5lkG/hxfd
         SRX9Rg+xtGY5PCenKvBTaQ1V0LQA44LDww7E7oDX+A4JyLsPTPo2R+JYA5KOp3KdeMaV
         4XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764603105; x=1765207905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=;
        b=g/tkx4l9LJyM5G6x7PgUo9nzCqM92hkLZ2vQzrgQiTWwWXvtuzBqVB2olkQ2R4XCYH
         Kw2E8Qvg9HoG9eYEG7ajyCdEmVW/ThVaCUYImuNnS2zZCh6986BSzKEc2hsdXfYF1KOU
         GIcpjV53UXn/WfzNiCnNq1m55n3mpM5Vyf3/KXo0qm5mYFBj6Hs4aWYUtbJReu4OvWnR
         DkoB+uPjZZdIgGmLIr3iC5Q/xUnQQ7R7qRogXos4ynZv8oRMLNWG6sAnI3CfrY19bJG3
         kv3QR9Ni2m+Du2sRFWerskmGyWqjh2ktfLI7GF8Mj5Ou5pS+gE1bXFg3QZo8SM4G9YUm
         Bw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYi5YJWiYULHcJIQi2fr6kUSltq7Vf6++Feve0vshzEyBhqjEYa2noAKFhZN5l0aT0T7z5oMAaDEAnSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwDCKPqTIAzZgufdftaSm6zmQLAjAxwyNWfxuHu/qUkqRkymK
	i5VRWAuYgPUwTEympfai3WkVxfUrCzAMjy6Wj0s5EZh+pUgPEpHtLZUGSKKVYf/u+IAq1ZjKslB
	g91kGo7P7NTeDK/GZekQz8wwz4/rQGEExQfbiYE7ma8P9iDliNPnrXxLYBeeQSWATBg==
X-Gm-Gg: ASbGncsEjkqVHGvC+r+lGw27vyYcZdcscmKbTxh+10DUosmG3y5RneTm9cXVGmsklAm
	USgrILYpJ2k7uucByQpoLRVfpIZdX2YVo4215XIAysN/9XDFHWTbu9jnSl8k12l35seMqAi73ra
	S7aYVyiDzIS6WtWGCrLC6MKRNL+dNrBmtIIEqLOozSWnjvRNRBnQGCKiEWVsUARWMAUre+S8udn
	yPz2daaTR6Rwg2E/Ealny2YUKcDGUG/LdDQxtDV3XWyF6qiA6HIbngpVcznD6ie+3TlfA3et34o
	wbDs8hMpoK3/AoUtNiD2jwmHwpYp3SWTKHBn/U+VW5ruwbjRqaVuWx1Y4OQTuDY+05AnsV6mhCH
	T8c45Fpu8zAY+HGXuW+XXvkBoKBIPpmJ2wb6+
X-Received: by 2002:a05:6808:4f67:b0:450:c58d:8c3a with SMTP id 5614622812f47-45112d13fd4mr11912231b6e.46.1764603104217;
        Mon, 01 Dec 2025 07:31:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOVPe5/1O1JUcc9/LS3JmdUtFUyaDMruxTbp2fk0PfKd9Zq+QvfJm7nfIbFIqYhCD55rsbcw==
X-Received: by 2002:a05:6808:4f67:b0:450:c58d:8c3a with SMTP id 5614622812f47-45112d13fd4mr11912194b6e.46.1764603103661;
        Mon, 01 Dec 2025 07:31:43 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm252764485e9.13.2025.12.01.07.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:31:42 -0800 (PST)
Message-ID: <f599936c-4a37-4564-ab1f-c329ccda0f14@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:31:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback response
 data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IYFP27b8CrADnB20tPV6SlTwv-dy1HcZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNiBTYWx0ZWRfX2o9v61ecabeM
 kGZOpq5Zsq0NHTRKEd04AD5ZaHpf0epwCTei1XfotH8NrZ9CFWiSLNyXSCFgnEhNWTXiyk3uiDv
 uhKv/DSB1lZHToazmnEYoIWvixj2P/QZKjpjICtIKSCLr6bPLe6lSooe+a3B2cq9yPdi+gEnx+v
 3DMvInot8+yoESk4D3OokVEBMjasDaf+j/XHISl8TjWe52Ht9MJcQQNjLavIdezhJiX1sNML47g
 0YLbR4kNPlILLA/+zrTjlkX9J7eEzT8rHrFURv/dd4BsGqzAHb8PVM4klInHG3apwRJ7zj+GS2M
 RXuR4jEHsdN7KoH8R+frhOxAhqY0l9hyqq6pV0AKGLyVWxuOLi/U43VFMAtDGYGFF7S6DeHnvNe
 XbwMLmgBbi0MLelE1454abaWMTPz8g==
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=692db4e1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wcac9RVaDo837PQIeaoA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: IYFP27b8CrADnB20tPV6SlTwv-dy1HcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010126



On 11/30/25 9:40 AM, Krzysztof Kozlowski wrote:
> Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
> via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
> Ack).
> 
> I propose to take it via ASoC tree (Bjorn's Ack), because I am
> constifying things there already, so less possible conflicts.
> 
> Best regards,
> Krzysztof
> 
> ---

LGTM.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> Krzysztof Kozlowski (4):
>       ASoC: qcom: Constify APR callback response data
>       soc: qcom: apr: Use typedef for GPR callback member
>       ASoC: qcom: Constify GPR callback response data
>       ASoC: qcom: Constify APR/GPR result structs
> 
>  include/linux/soc/qcom/apr.h  |  6 +++---
>  sound/soc/qcom/qdsp6/q6adm.c  |  6 +++---
>  sound/soc/qcom/qdsp6/q6afe.c  |  6 +++---
>  sound/soc/qcom/qdsp6/q6apm.c  | 10 +++++-----
>  sound/soc/qcom/qdsp6/q6asm.c  | 10 +++++-----
>  sound/soc/qcom/qdsp6/q6core.c |  6 +++---
>  sound/soc/qcom/qdsp6/q6prm.c  |  6 +++---
>  7 files changed, 25 insertions(+), 25 deletions(-)
> ---
> base-commit: 8db0437c888596202bf1b996d6a152de3f83c4e5
> change-id: 20251129-asoc-apr-const-f9c768f0cda2
> 
> Best regards,

