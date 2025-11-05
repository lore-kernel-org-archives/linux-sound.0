Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3633532D0C8
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354738; cv=none; b=KbeEmfvJ0jxy4uciie4Re/jWZkh9QW2SHjUfvN+f0eOIPAOA4nao+3hOzByt7fZUkQa2N2bD7X/+nF9vU9WROvRsiAMHOT0mUJr00Gk7wPPmelEkgcsHGLEpEq5VkhKG/8pcVsi5lLtZquAqzVz8Ne11xZhTNOGtzqpAprgMG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354738; c=relaxed/simple;
	bh=1vBVa5ClM85ICse8q8kystFMhRNSFdmMv/BjncqSZEQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iP+Z/xxK4gVEs9Kfuk1KNE2DPlSvw2HO+ADS469zgPy2TpOrSy38Lfh4bgUN88Po/cdSXdhxghgQsU0Yv2ca6XqHevWBp49g15ZydyXbBDd/W5ZYoKbC7Jvrt0QAuk9Mb2BF1BrH5HrFFzKz70WR7bW0PnD6Vpl+pjK1TyRVQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGvCAENb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8fR0u8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGvCAENb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8fR0u8s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5B34Zl655150
	for <linux-sound@vger.kernel.org>; Wed, 5 Nov 2025 14:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Of7YlMuwPvDSMkMgodOkia0A7gtDddUZ3uLq0jRzNw=; b=XGvCAENboleZYd5H
	H7KEZMUOUj67/zrXAw/EY8S9vizU/ddCOyVXMhv3m2JzTBFNFKYpNqZWKBmKcj8a
	z0LWg/YFP37tjB2N7ree3AuckeTPSnSzj2ZF+LVNJjYl1CVNEa6VaPuQH6KZrybJ
	HrM9ryyNvNKLD2G75BwY5tXmBcWtbCqbiA3lTQ7pxYcrkxnl0lGYg3fSELr5Q3+R
	s9/nfhpQombWVdA8EEPQS3WLBjQRighYqLeGq6cSNEMIuv+DHBkgyeHga9L2lBnl
	JJ22y2UVvQlU9Whn0l888GQfdT420D9mS70QPQd+5+nAd9fUIG2f3WlRMkj0FHHX
	XrGuJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8gjvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 05 Nov 2025 14:58:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso9766061cf.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Nov 2025 06:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762354734; x=1762959534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Of7YlMuwPvDSMkMgodOkia0A7gtDddUZ3uLq0jRzNw=;
        b=L8fR0u8s/tUENxUPlNeHo6FOWrP4bhnXxrPCXHrKdp1XrKglAq9vWX0lo7QKy2oqES
         5l6Lqf9VpHWXbaB3Dj8YSlZX/DyLd8nxzIlz3mBU3TXRQpoW9ERR9pp3rQYzrZGun6Q3
         gdaoR/CHmypHvYjBCLPwFa1MhMSNyjDkUkUm9jeTDEo8z8VUDOq88aDGa/E76WNf9sTY
         ifZQoWBv2R2Pr/4gp4fv97V5TM2+sIb2C+/f7tovclssOSXP5oztZC4CMnWZoQUZhuI2
         ov/FRwGmd1siyG2uPiEb5zsNi+pIr2UOdlOrL0VKdupRhUnDIlFeqOHHK/onJgzKoQud
         nxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354734; x=1762959534;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Of7YlMuwPvDSMkMgodOkia0A7gtDddUZ3uLq0jRzNw=;
        b=O45vvVwvGJ1IPPe99UeGnTag2j26IEFpza3dRpYRV/uFvKrARPoQdteNL7X0hhnQSj
         GaifwIVk3f4nB1lGSwyZI6mqLRyfxly++2lgvygmvtc/fQhBy3gk5AV8OP2kKrkl4Mwh
         +ZkD4QnL/PJXs6/juJMIcq9z76yy24lG1PKlxoHaqUWR5OB046h0I7nRoMBF4A6lDd9+
         GEHcJoK8dXawNAbFzOPgfOOF65u7Hxm7Y+nQqkFn2+klFm3Fg6n2ZJUxQZ+BvIa0xtYF
         ma9w+FLt7HhoqSgl0w6dtb206gNMLYpTNge8rCHrtjBx7H//E8oIoB0iXR2Pk4KH6C2J
         +TCw==
X-Forwarded-Encrypted: i=1; AJvYcCVtukuPblugyGNYbd2FJZAnlISZAkwBGfrU+JWpQ+kMcAmPJodO9Trija7C2C3OZlKA0ridam+SsQnacA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlth7P1ZDP5VlbczkuGN6pQjctvYznxBdKWdL+0iV5SegvG1h
	s+aztOHxKm+24lLsFVtuT1oMowDiMAoc9VX6EtDAKZ7wtyUDO/rsm/SNbyKvbLWjMzKd2uZwndu
	3eIpSHXH5fChCTso3nWbi1ifdRSVNQxhWYLrghfXMZOQTI2DlgB93aF0aeas8mJcD9g==
X-Gm-Gg: ASbGncuptjTGZhOskJ4InO0p+M3xCVWHOo2lKQlG60UCMDQZW0RZP0KF0FjFV0xzefP
	rOQ6SaUvOTZ+yTUTAkfeZY8HuIBFvxUVqjnTW5r7xACzHqSk+5MVeQrMrgAqW1IZdgnhJTSfwbG
	76Of+Oh+Y0XxkHe7ljI2Whdm3sGOsKGRTsPzNJYscHaKVfd171B/HOiHMIsVgbbS8M7BbtvfWn2
	FgriHFTKt2Q2p//G75u8y8s47ixELoNWTVraqSBcmX8DvInnWedusZpqlhq1zC4yAHG+639mfTI
	G/4QLa5bUOQ3JIuG0sXjBnzxjaZVy9T9Tbb05D41CRL98De8heaFHtlY92cyU4PoWGLrj11TWCX
	PovuFe4fd5305eOnHYUplLA4dbw==
X-Received: by 2002:ac8:7d05:0:b0:4e8:91fd:979a with SMTP id d75a77b69052e-4ed60dc3731mr99108121cf.35.1762354734266;
        Wed, 05 Nov 2025 06:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdQ3gzwvCqjhB3OmouGTFW63ewZihyDhjY7zVMw6vSpc3iQ3K5mDt07khoB47BgfjJzf61sw==
X-Received: by 2002:ac8:7d05:0:b0:4e8:91fd:979a with SMTP id d75a77b69052e-4ed60dc3731mr99107611cf.35.1762354733769;
        Wed, 05 Nov 2025 06:58:53 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm10676001f8f.5.2025.11.05.06.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 06:58:53 -0800 (PST)
Message-ID: <e06b5209-e814-4be8-adec-7a0cf14a453b@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 14:58:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gSECAVDAmYzDq0bzrR21PVjbADEvvM6C
X-Proofpoint-GUID: gSECAVDAmYzDq0bzrR21PVjbADEvvM6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExMyBTYWx0ZWRfX325PSGDhfhH6
 2oqeQpF+++zXFxu+67IG9rSkeErCPHpiGJiEHtTcU/M/XRYiqaeHIBPziTsO2D/MoBhHQZyCZ7+
 PZAa/o1kpSpkFk58XepIckQSAqPO/C62Q+8M0+e/xqo5GWOsly1EcldZSN8MH0Wb9hee4phdnib
 tvTXrZww6GqL4H4qZbsMAijybFEQ21rfxaNJSr41mSV89ujIwAZxy1LHgurMJ1BIJnj1rx1zrUg
 deBVyWVTu8GYLVakFFLhYAOGLVADeCjMmuzNCrzrxKw+IYpISBwfMhr6szXJ/pG2HRPPczql3Yc
 K5gc2PpTuobPx1rRCoMnVVdBkWOxd75k+inRESbUF2TMu8b9OBG+eb0okVeg6sKz2ckCc8Wx6Il
 yHzL+al4sm8E9Onr5vSgqZXkSIEClQ==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b662f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XFxd4amYmj4aWiUiTBsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050113

On 9/12/25 9:32 AM, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
> 
> Tested this patchset on T14s and Glymur reference platform.
> Alexey also tested this on SM8550
> 
> Merge strategy:
> 
> I think the patches can go via soundwire tree given that Rob has
> provided Reviewed-by on the of_property patch.
> Vinod are you okay with this?
> 
> Changes since v3:
> 	- added bit more flexiblity to driver with a missmatch message
> 	to address incorrectly specified dt-entires.
> 
> Thanks,
> Srini
> 
> Srinivas Kandagatla (7):
>   of: base: Add of_property_read_u8_index
>   soundwire: qcom: remove unused rd_fifo_depth
>   dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: prepare for v3.x
>   dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
>   soundwire: qcom: adding support for v3.1.0
> 

Hi Vinod,

This patchset has been in the list for last 6-7 weeks, can you pick this up?

--srini


>  .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
>  drivers/of/property.c                         |  33 +++
>  drivers/soundwire/qcom.c                      | 257 +++++++++++-------
>  include/linux/of.h                            |   9 +
>  4 files changed, 199 insertions(+), 108 deletions(-)
> 

