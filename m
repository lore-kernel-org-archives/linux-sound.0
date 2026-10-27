Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109787;
	b=fw2WtmUt0nxtCvrgWwV90TjjeKcQIbNbPH71MgEDuSuggt1mrBnjB0ekT81tSV4/zILE
	 8Tzxj/tOJ6dQOYOumyLor/LMlqlq49lVOUpEdotNfri/gYdVtcFjrvPVw4hx8VYJSj0hL
	 z/dRqVBgZjYrEmsIr2ZyoTTct7aeUMNkNO6w/adNVL1uDExFbY/65x0Fe2DUJBYwgAnLL
	 rbZNV7pF/ef2h6da9Pv3TFj5hgyfNP9x0sKk4mzoQ0xbGGetcDhQZPaqfziW1REBy6xjL
	 JleUPQl9u39PJa/y37rxxeljGvdueGD29PHujzAAZxNX0X4Vqdq3nRJQ7MdbrtB1YnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
	b=EE4O+doUGRNniJOiWeZEV5u/695f22XMCLpkx4owNIUqVMYUF+Z/9sZ+6rmkDzt0NXC1
	 WU4tau/+Q8b9Gi9Ajsb0ePkTH7npeIPt609XiO/DQFx/wA2BwYa9Eik8s9Z5ODYV57S/w
	 Onf1VgDQyakURxY69Mq2rDwXV0cBB3prXFniLwoU0Pd+QtNLEVcB8J4sHIpvIwY+az/V5
	 RfO99RKRKhs8BK060EnQT0rVehtR7c73rZXnOzWaGlmYNrkXVv8tJTf4ToPShke/GdABN
	 FKN0f3bpNUaj4PMS3XtRUbEpxWXj4pRKrazSrBXJcM2NGpTMmYIOBBSWuL6xcL40udQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D1606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoGTV2948260
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=; b=a8ewLFbqdXfjKUjK
	MMA/shdVyvemvXTbn0l+T819XaIhFdb2FIu1ugEAL94GzrVa4GtSxzBND4Mzb5NE
	unrLCM3ZBBsKzgIstFTRN01z28yAjZhkqV1FPFDO1TynSTxQVO4sVvEHKYMDiWm9
	tNpyQx3VQnqF4Ig6ObCEbsY0kYgEmWVur4coSOOrTeA4Z+l5DrjUIBkEAGsa/jYH
	9VZE8yxR/FvTC5Of70GTzWAHLD4Fg6kkg0b29MszjADf6/PlVV7JnozpzMbMwGc/
	jz5HvW54sQuc5Mk857WNGmwAW1Ms9SuX+UfLr8kMY/gdEJkCtrsX4W+CV+vwalsf
	xl+nRQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21ekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so85071e0c.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109785; x=1793714585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=HV1zgTgX+LFVFrWYiJ/97rGDJdWSJHSGX9ZkUHK2TBmtFFobWP6Cy7aPl8yT6oxeSV
         QIaIqfpqpV/e1yFPxN8RaNzwV9XLh2+srZU1GSTAdoXhaCnZLEPgUImjbqO3FxCS3Mb/
         0lPfSBvj+mmGqWqNF9YDnhlP24AUx7YRyHq70cvql3mAGFFBQX8nNyORK0vob8FAVyEa
         N/j8ajEnzcmx6cZOj99rfRb/HCazFXK3xMs37iN2Nu8O+q4MOY4DPczCDMXoFzKF3Rq1
         LJuxRmV2maiovJHXE6cOhrqpJt9dZf1mQ0EBI51krBB/aWrMiVTIe63oz2gnRVJT0zBQ
         KIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109785; x=1793714585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=b3zznLxwnnbFrMD9QLUGu2rZ/d16L/fkyRmOHvrOtx8JYqWlvCkxZeFxrpP5X2Dqb9
         E8RNXpsVwuDyfT4/oQOEFfwDtY/trHIoN7okTYTpE71PMZ+PrvbFLtdgF1E/mE9SlD8+
         /I9ix0Z+FozgDRJZ1h/cxXaz+WDQV3O6YqQAZFhgpO3p4miD8mCgzvNw1rb/WJNQnQKs
         gneBTuoRj/UAWGXlUpfzhfVK2h7tq4ijmpSIwYiglHWO4VcHu8uv1Ww5gqGoHpDjCYGB
         xWButb8gCduEm+0OKYDw6YXlW64K6atb42Sv96piqO3TevanDIvWlKn1C8pDlVFjCVvs
         ntJw==
X-Forwarded-Encrypted: i=1; AKwUvBzuK4p3k80GyxtFa/fvkMNNXTqxQ71fL4/d/8gEf0mv7ImDmKBFxgVnze81F5eHSKC6fo9tgL+oSRVKIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJNz8V4i1+5xAmYxpflYSv7yIeUfxogegtTeC3eVqmqFOfFC5au
	DkKskc2u/KMGj4bg5AFqWtnH12kf0PHmMBGxBfWy75pkWboaIBmsIjn1wRZjqVqPsqv7katiIMX
	NEd57SJR4WI0r2YEOClJRStjH8rsgKOcsBgSmGX8dhHGD1AaTS0u0KVjpsMrwEoF2kQ==
X-Gm-Gg: AYBFou2jm0/cRkhHMZkHXHnrE+Wpr2mUocMrTEfQuJXWmo7lccMXjByP//pjc1lY/Xb
	W/5KLP02y1jy/AtSIOk2itt7SnJA7U/RwMXBekUIj5UyINAxe5SyKJmofYcOC49FLGMGoePotMk
	d0YdTo8JC71LIh0Bu10gYbxnm29L59zInXHkWVYqkPMfHxe21bsSsWktqOz8x5y3ZOihm0BoXrE
	7KPGob5P5LF1/gnW1ybX/lSX/KvtvvGJsKN2GJeZMLL95CDGHSj8EproYgs/frI0fDUYnQqNLoH
	XYM2sJ+rAZNX5KbigChDN0tf+hrF+AdIO1nQtAMQQdf1l27qs/ncWZSzn/zLYLqbyjqCei5UahW
	MJDQa4InDq0jYd8+tsATW2g==
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420263e0c.1.1793109785128;
        Tue, 27 Oct 2026 07:03:05 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420220e0c.1.1793109784529;
        Tue, 27 Oct 2026 07:03:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm459999666b.10.2026.10.27.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:03 -0700 (PDT)
Message-ID: <1ae7cffd-f39e-415b-b2f5-ed3179284d6e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:00 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
 <auCsCPL7gK2lIR5q@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auCsCPL7gK2lIR5q@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX4dYO3jZw1Zwn
 56h/thlJGbudko5q3anxrVMIGXjzOC4m4iyv0xxphStdCf5uITHd4Whk+HnP+Zwb6+/oCpnhEpD
 7+1YacNUetQRwjNdI06lj92fMeBKfRneuQ3OkL8zGca3MV5tYaPZEI5dHd3jtfm7q0z3GGi75MG
 Va4bfcSjFQtIOkPO46mNFh/Z4dX0IZF6/7YzGFEKx3gxi1t9Z0bI1blf4DO4nFNNjst/8vwfjEe
 vyHLvOogJs+v4RFhwFoo6Pi1enbd8cCgfn3enRzTwLqvnKtY5Urene+YWMkiUypD837E0IPbam0
 iNwCmytKL7525jzUIsrBB2n3d93p6EHsF8HJg2Niw49bV+h6G43tXImFeZay++lYhShtvDtIyTB
 XFjVzh1Y76r9kfF7Y0tKWlOZnqPz3vEmHCQzRkPePNduYluW137Kv73a1Y30NdSGwKQnPX0Yh3W
 MdZSmKvgbH074n/tsHg==
X-Proofpoint-GUID: 0VSVlIhNQRSZumWgkdPbNPs8dQgN-aU5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXzwoEnc1TLMWo
 59Obmlt6aEOvYj/dPO2bHv45yqo5U9+iSeLjgWPyH1XXZUDlTNc0zZxZYUhI3LesBeI9HNXGDPG
 2Xsjias0EkzbB+i0b2JB1zQYYtgHVoI=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0af1a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=DwHBtBTWuPJZlIKgACQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 0VSVlIhNQRSZumWgkdPbNPs8dQgN-aU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/27/26 2:50 PM, Richard Acayan wrote:
> On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
>>> The Audio DSP (Digital Signal Processor) is responsible for audio and
>>> sensors on SDM670. Add this, along with the SMP2P nodes used to
>>> communicate with it.
>>>
>>> The sleep state is included to prevent the following crash:
>>>
>>>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
>>>
>>> Otherwise, it is unused.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>>>  1 file changed, 168 insertions(+)
>>>
>>> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>>>  			#freq-domain-cells = <1>;
>>>  		};
>>>  
>>> +		adsp_pas: remoteproc@62400000 {
>>> +			compatible = "qcom,sdm670-adsp-pas";
>>
>> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
>> fallback here? Then you can drop a driver part.
> 
> Actually, looking at downstream, this should use the LCX power domain.
> Can power domains be omitted like on SDM845, or is LCX important enough?

It's used for "proxy voting" - i.e. the OS turns on the power so
that the ADSP can boot and set up its own voting (through a direct
interface to RPMH on its side), and then the OS drops its votes again

Konrad
