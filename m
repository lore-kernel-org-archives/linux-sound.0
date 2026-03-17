Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB8371072
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740257; cv=none; b=Y/x5VNZ8YRUgwROZhMGJSbrQ7/3oCDrE+1SfgLfABXMPqGNCti9pCTBgqMc9ThJAs+Mfy8BPzCR7uUSsAKQ+UXrdhOiSMzL/F1MFbDmbxerNOufxAwL4IjY/ggPpqfSxJIWeaT6b3tgroQW75OdcGVZwGUQjy+KTdOlVwW+OFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740257; c=relaxed/simple;
	bh=jVZYIYYu5NR2kUW827DS2lDNFxhHlkq/RhwYjreU5TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtivbZJTMxaEfY4JVzeOzoqQS9V4i6gr08gaONXEqqswPfzIgZiGf7u+f0wnmpUQd0I/iKtLpOWRNtEr8VFcnt8BuJa/LSeg56G53hS1g03MqRaYZDpV2dPQBfNleyLzETxfSKvOrjACtx844J638guqePhn9Io9c5PLnJTqJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0028KqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEvPHZHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0028KqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEvPHZHk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7NM9E1639254
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 09:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=U0028KqXKvwf6SWU
	C7xG0NhalfELkLxjnlY0jMUkk/Sa7dX27XKQdENvxt/FgMDmZz4ygjw1+VVNZJXX
	Ugbj9gC1dADoAXhut/GKm3gdJnS7WHa78d2Ghj00V/SQI51Zxvor3fRPZ9/JSeZJ
	h9/Ov8Qud++CaLO7cD8t4RzzqOxumIX56xhzbNH/GVM4Egbk1L+U+wCFsyNAJ31q
	xg4XOE+3jp785PrF3zYAuPqjeUQcGjMpo3QSpgYVVjXpYC1b1mISG8TCRiIsRHcN
	efGJYzc7mrQPt6+ySZSMU/IEHSX/xTm0mPMrejpZ2Y7aDOcQXWZXtE1SU4NiVOe3
	NATj5g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bmxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 09:37:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899e89bf366so95310546d6.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773740255; x=1774345055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=BEvPHZHk9j6CasUYw+A2J2fj+Uu8kiGh6xQMcTw8wLhURHfLiLtrIpx8zlzWvcpkB4
         DDOTRn2W8mLwxs8w5HRKrUozydzHduL0cAggdJsvT/v8ZcoMX5f5IprOna+hJoB1vFMr
         S3Fja1srsPfXk4yrYU93snX2xolPZiSM8Jyq5k510puJijCpne6ekZxOkZ56zxPf88vQ
         JoKlL2OOMcmiMEfwIhIzO1XVCikog3e03HhMDTp8kFzSLs3fcp5QH5rLX3nSewYlt/dJ
         ImKPhzfqhHJvCeWmbUtvEdmY4tFZD8CqqhQapdYrWR2ogGKLhm9Pt7sgZ/FUrn822jpv
         SGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740255; x=1774345055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=sPoFylGWlucrwpqJuLF0XS4OmguycUFGfJCGneDjfizC3VroPYEJQgTJNw8H+mIQi6
         O8CLB4fTTjBw/Eeh5JZmes0ANBQND+CQcFfLhrQmFoxrO2NV6CA1fsCsc4jUnSooSCl6
         YZqKW0q6M8cZDHg6oxRXZXIcD/OGIMqdR8nwI0AO419DcGQ8daHmUtM73o+e2JbCtBVJ
         Og/RKFN5XDAHaWoGuKTF/+jrLkQmuDJlXID77GKdRbC+p2J5POAJQJ99l+3/5mMjzxKs
         T4eIWgmGttSOiPFKk93APn6wOGw230Q98f+dSWksN52Vtz9ePA/7yEbbeXw9XHvRiyAv
         e3ow==
X-Forwarded-Encrypted: i=1; AJvYcCXVZJZq8kOIFCnjRdJv3Rq2YKdaBuJcHHSsqq/OXQt33mof3N9BoYfH10xa38ZzKArzvL95LliI6W5GoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Z3wsDtd9zEZJsCO3mqa/wDIhSf3yQoHzQQdxuksnwl/u3sgj
	hjlfy8bfsXBH7NPkZvLlgguAr6ym0zx0hwu/McAJK3xF16wwnaR6BtDcUoMJ+WtkdOJkQZ0V6Pv
	HZx3r+YqO6mFGLEtySrw/vGtAEOzqOBR7FpskqpgtRarkGszedRzLgRVGI+vKTlIttA==
X-Gm-Gg: ATEYQzz4nTqg3MXxaeX/QCIzZ9Molq8iBO07TJcO54bD+Sc+opHaAHx/7IJGXb5q03u
	VdSfqUxytI9L2KQGQj+QAEUNo8WN2J2RgD8kIeTniQa4UDW6I/wolf5UpQCia0oAKvlmlvFriJt
	9AlthFfqoR8RDmr8kt2riVjo5WLLOnXuxzI8v3dkWIBFo7EWSJA036TOYVgV+3i7iOk6usb22ip
	/CU5BYlPIqv1xU+qpepEQXNPYbw0EL5AZ9t+qja7TbcJiYc9AcbXkzPrlmJ3vU4dyEMcdAund0d
	gQWpfTQlu4BGRGd7KGT1Lz1/ePCvRAcUYiVx++R+JYZKacj8bSuASMw46evsqATmEQy9bxMTEpg
	JkQCr1RFSPAcN0qcHWJqn6c97vgy2wksCh8n9N7Aqi5QFBrBeJsBMhrrwN9fhzskgyoBWFzOfkV
	NHJ0uw5Y/T
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991591885a.27.1773740254717;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991586485a.27.1773740254241;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42bd696dsm16981086f8f.37.2026.03.17.02.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:37:33 -0700 (PDT)
Message-ID: <e25754a0-edd2-48a0-abc4-9b45d119ede5@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:37:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
 <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
 <2026031717-ethanol-zoning-80b5@gregkh>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2026031717-ethanol-zoning-80b5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GBpsthrpNxnI15zhmZuHp4o9674A_V9f
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b920df cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6xCDiqM1XSE8sYu1eLsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfXxVe8lKR6Nsfb
 3x1YGqH/7R6OAemqXK7EEJTYfxsOZ86a4H4on1ZKhqj3YOyzoGBPKbHJbHvjjN+/xMcYpK6AUE8
 XhOsTOseT+LEx3WWezOtHpPzwC420rExgElB72tZ00Gz+OGof2K1eTxdeF+d3vOA9sfvhRWfnt1
 31Yh10zDcQYDUYTdga6wGgcxbe+m+1SlRkuCKSDGWoagK5dfcIXECET5thK0QHgMIl/1kOO6dA+
 Ro9i9RioSrqu4b6yyUNyTlEf8ff42If/nrfAOCNA6ftNNgYJAmX86RCZ898QlSAVIdHwY+SAngx
 1htvm9StiM+zG++UWtuOvzdTiB0VUhLRAg3/0NL2CR9ON8xfOK7S4ti//mR8Y7pUDQWUTD8maVF
 ahviy+BAR9qid8jfW4XHynVd2vbIiabbvSlzk0WFG7iPLPX2j8CVzvVDJQuIV1MTJI4tTG6c71c
 RGLbl+UfaZVtb7lVSSQ==
X-Proofpoint-GUID: GBpsthrpNxnI15zhmZuHp4o9674A_V9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170084


Hi Greg,

On 3/17/26 10:07, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 09:51:32AM +0100, Daniel Lezcano wrote:
>> On 3/17/26 01:22, Jakub Kicinski wrote:
>>> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>>>> This series is based on the immutable branch [1] containing the QMI
>>>> service id definitions along with some drivers using them.
>>>>
>>>> How a patch can be merged ?
>>>
>>> Wait for the dependency to appear in respective trees after the merge
>>> window then repost the patches individually. I'm starting to get
>>> annoyed with all this cross-tree QMI/MHI noise.
>>
>> An ack is simpler for everyone, especially when they are trivial
> 
> Why isn't this 4 different patches, all for different branches/trees as
> there does not seem to be any dependencies here?
> 
> confused,

The dependency is on the definitions posted in v1 in patch1/8 [1]

The first version of this series was bigger. The definitions were in the 
first patch of the initial series. It has been picked up by Bjorn in the 
corresponding tree along with 4 other patches for subsystems he is in 
charge of and let the other patches left.

He put in place an immutable branch for those who want to pick the 
corresponding patch in their tree [2]

I sent this v2 with a subject prefix fixed and a pointer to the 
immutable branch. So people can just ack the patch or use the branch if 
they want to pick it through their tree.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com/

[2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/


