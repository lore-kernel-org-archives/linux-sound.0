Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E938AC8C
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149030; cv=none; b=Rq/bRI0lH2OhSLysqqZR36LoFe5oSnFsTGtIBuRZojgdkXohl+aPN15HUb7TK5RP2/2aN6b5oDmr7F+YIfmAOe9K5Nv+pizqmea10POAJ+gJ5++1RgRnX/byU243OIsFyzoZVWDQAIKnpTlNKgnTHSorFxnc0XrT6inA/0Qzqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149030; c=relaxed/simple;
	bh=YD2z3hHvCix7UCDpbM2li1t6vWmITYSKd1Ek8SNEmIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kp8fyYnpCqwNjHPmOKQYKYio14BJBcY8TjIbxcD3x9jAz+It1gnIPyfLQnQyw4+OqheJqUrSR4YDsQmzFuIZ70niJH63eBKojE+jRiKpB8VUhMxg9zZxDWlWXWZWfozGbKWDukTCNl+CzXwMQSGoIf1SRV5MfUf+u9VkBX45Bm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVrXf5o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhzLaODu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVrXf5o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhzLaODu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACndCV3893001
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=pVrXf5o/EVBmE+wg
	BT73Rsn6SpKJ5wq+G76Ylf7BWahcXxLYD+eUmWPFXcaWhkwUpobx5lK3xRmxITXS
	bC+3ReO12w5lG0ypF9by+SDzV7dKvczmi4V1ObY+HulYNow/9x+coIgQOc0FDR5z
	tqh/NwxX4y8wUkQqnAe2Ol0tx6qnoYrTNmZo3PQbWnPYlAZ96o/M5CShmfzCT3Q4
	AKPsiGpksVlygVdcqY4yPVfjY54SOoGDSeJUIxOABYkWnjdZlzq8wUrR88zzeQ8x
	0ey8qW+7bpHy0Tuk5wPV+wlDXL8O9vInB7v/+JNZUUTfdiow3BeHh16CYZpK3pDP
	/hjuyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyr47f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:23:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso1682196985a.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149027; x=1773753827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=MhzLaODur5HaDKKfAJolC2toMukyCS8FTIcQbyyR1Mc84kOuPeh6mWLUb40RuqL895
         XSSrHeB1lpaj/qModOAGdNMQLa6GQx3DvspoTWxCYVUDlqpu0guLPhIy9i3R7JUgpLlB
         1T18TITDjSlSq/jNfn08f4mIrBAM0TVmlffrCnz0Q4yUtu1/18+4/Ia/9SDM7ZY4oU3y
         jmPTuvfO992/34Y1bZdZwr0EI50jdGAB3XplUbKLWKzQsdBs+k4B3qhmniQ6qI7ux8WH
         fS0MMpnt1oLrYeh2+EFlIDweXiOp8u54n6IWkfjwWcuaLe2BjTEjnsdHEAntOBgu6oKg
         pxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149027; x=1773753827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=TM+PNh64KNA/maWDVeNrSZ2JAmA/Tx51fhzxoPt2ooWXWrMPEbI9L44xzJtie3a4pn
         qOGx4xACtpKk/pWvMSUjMNGOOjN+t5vLura8MG5ua2TyxML0+3CM1C1/1DKzY1g/w5Do
         7jJ9Hb7MeG0XGE+vHz0Mia9Ajqb/U2jEX0xtwMNe2dPAX2zXx51bUX8TlmYrOsRmYqNr
         278yvw4RCspj4PGNs2KfLWRt+kTIMhoDfC1g1D+OuPVEt3QUJv6OIDKTfxYWDHaDkNCO
         5NwrjuJVBlTbgD+7kme79e3UCmT7Mug4KhnJI891+cy2xyZuM97a8NsCne64+hTEBEOx
         s2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUc8vrNK7b7CZyvVEQIAWVP1iEvZ2GQCSVoJOK4v4cFTGYMro9OgyS6cm9ipC1LAch1wM0QIzjjSw0waA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9fvXGzleP5k+1ThfoszgAOIqUKEn1e3zjSPJtbXvgloelc93J
	Z76JXgU8Gy0sdpigSRtz9ykk+nYLPuru94YLRDShk6+5yC6ZIZrm838Pm4BiNGOAWGF8CQV1VOG
	ACuXKsoIas4pvasXbs4Qevm2/RjRqCJ8PWITtBXSRpBa+/amgCYmuJ83gWi0gWCuvAw==
X-Gm-Gg: ATEYQzyMeD7vaGmSa646O26AqEWI6SDfRy+dP4r+tp65F2a0Vj5sdZldDOl+uT8AAys
	OCeJkCeNa59KogP9YmFB789U2DsODVT0bJDFQKvZ2I+wWHOazeq4oaQzxRHcQgds++M0CVnuXDJ
	QrzCQ0+knivvIJ+LqPHdONas+R9AoWh+jaWAlfxFahtgpLf42EgJ3nOAQmG/UZoAzk0RDOQUTYL
	50jFkDhFTvAdfkNFELhcOGvcLQgGakk//L//ZfgMPdUT3cK6ky/Ed9/ilIKx1/IQAfDhtdlvXz4
	N6Zd9fPJcN4CFUq4/15RDFf2k3yD5gZ4CYP30TAB5hNI2mSl+9gJvgcYqrogfq7n2OQ5bK+czjZ
	FWp3qeKyufnshat49h7jy4jpBchbPudV/SG7C4XXQIm3b+8VQvqXyjrw/uEqMsQ4NtgVx3Vj2Kb
	Af0cUg0B9x
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147055285a.26.1773149025721;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147048985a.26.1773149025121;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm37186097f8f.1.2026.03.10.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:23:44 -0700 (PDT)
Message-ID: <8ad5ecc5-ddd9-4d79-acca-41b3797f0f3c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:23:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b01b64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fMftll57hlJ_0ojk7d0d_rEbxkRB6YXr
X-Proofpoint-ORIG-GUID: fMftll57hlJ_0ojk7d0d_rEbxkRB6YXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfXyM/ipiANHtVg
 Nogef2kt9XSLPWzz3G7H5mUiJjCLZX9wVcgtj+apfe3C0tqGw248AlQGc6yRsNEb0kIXoabj7LL
 zT6PQXFhlww1MFzOs0/5296g382Qn5TffeoLNtDuNA43EPQxe7kqrwKGwQr+rf899waim1TAA67
 ODuUiU7stQrSE39eGoHGxfMoeIG1mvhMmiIN++eqvQQHjdsYro44nvvKLLujnHSE2ziwXlE1CdU
 ifrhj2DHV32vX7gM1yl8kdtvhtqVQIQKD681O34USwMIjIyWHL8mzTECx3XLZpv7ZCtUqEa95Wf
 6atDo/LrLHGvfyfBGeWJya+Y5ythAFm7seqPWhTMWPxDPH0Q1eJwiDXf47zdehoJN/M8W6/yh87
 6x2/J3L2usHrGhrr6nhbcW6wY1cseiVDBeiW/Na/jy+qxnn5/nhRYVUoAc1sOV4mso9jAV0EJX6
 m2TmPrpiYBYGSwCNGCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services

I've the same number of patches fixing the copyright for each patch 
touched in this series. Shall I post the series separately and fold them 
with the corresponding patch ? (IMO the former is cleaner)
