Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353E366DDA
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910948; cv=none; b=gGt0/HkqY7sCjbSqWNwRySMZkK6H4MMBIiAxFLftxxEY2fOqfAvNPo9EV9QM9B871OpCeLx32dfROtIz+APl+kypCB07/pszFjUwLK6slA0S+2cB3Oxt0Mq7NaKflFkBIDEHzP8XxKpjPYXn8bwOvNaDzh+SuBtT5LgmUceGG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910948; c=relaxed/simple;
	bh=rFYQ77mBbRdOk2Q3EJ203LJMJt4lPsFrx6TYibicFuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0O7hOYfBbjVH34NAbAY2GeQbJR/vEFKMxZoSs3bzlKmlzFstHjxTlytMPJ7BsHkf+gECMrFkOr0JN9PSWSC+WsyJdWD01HTgztj3TECFuTVgfDeH8JkM9IMKXgF7H8yX6wOE8y524efqZWbPKsflwKOTwHTqyCFd2xbPwD+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOnVAmL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Usrvmur0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOnVAmL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Usrvmur0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J741Cj2883774
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=SOnVAmL3naEmqvxp
	wCam5A5ffUzxVU1QmNFR4kL3wVfl9kBJLap874hNnZL/A10nu8uG3NpMfPSZKbM2
	tOZefy7xFI7IbFBTZC3+UHFn2G+KuWnvWrGjNSSDg3WTW80omdEH/MQd8BVK1BtD
	WD3+ZiQR7pprQ8lVhbIgczFYijPq3rCfgPvdLMQXhuJwso9ZiGB5a6cgLIBossql
	PmQwNA2RP7CCoZ5Wnc2RXGqkpJHV3PRx4KY7bA2jduYZJnGtIsttRlXveyHJC1Qe
	VRqtCjpEZ1tbDfn/Q/uGHLwfF0hDJSTj25jpJpD3s8rZ4EZdpIkRa8Y9XE4RYli2
	8i55zw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuu6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so7538494241.3
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910945; x=1774515745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=Usrvmur0ciM525rP5WBv/EbbkC28XEw/GrwJhejDUcrirKaj5EZymTeVwc3vA6DvJD
         /xQUZIqR+6DVrT0/K9a8JRVY9JbLG61L0awN/FA4lQ5+E0B1qoHNoJW4cio7w7HiZt6A
         V+8WOdaR4FmVIyezOj4VCr9hc+86Vlpz0YGjM4V1PWYWMXo4KCoNjhL5pp+ArliDAf7k
         zM83vrb3CO9bqHQ9ov3eu+8gimOieHZkbZNcGg4k5QoIWrk9rp9l2ijPO82e5PIEbZ8p
         /BORM4d7LL75+R5U+8m/BlJ543Xu1IOkQprykiO7KffWGo0fK6uF4SS7Hr3MKb0ITGEY
         jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910945; x=1774515745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=AkxFIGqzwJDJxrQ1Do3Pk5ub+Xw1c7dc6hv5f1jz7bheNXPYz3qLD8yEAm/GVyOAtS
         WT/WN5l++N75rarGHlNZqZ3xDbPcQ//7ZsnfvuBtBTTd6nvjI/9EY01EkG5jPN9PQm74
         RjHFBKWjuhAjAmgTXpYBai8KKlm2LGFVxvVAtJwkVKttVcommQ9wZCSEiDQ3r/0ZZev7
         wPkgnb8SI7aL6GVDalVW1lRngkt98lKBaNKY2hgIQIfTI753hTmTKRBq5Zw1BpylTWme
         EE2D0feKmmNdsDtATuaTUG0Qw/kV6SC7yqu/kIfjimfx5P4z6c2BBUIitBfQpTfZRiqS
         IbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5McTzU5A0sq4S/Z8J1Q9OBx/aGLD1zF2k56Yz1UXHKcKl8ebVsJQtXVkXNzJE6p2Nwp5E1WC4ZNWfPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ7DqM6kQFgnlX/x1XfLy02HxlYcgd8Uwzla7tQkadaTOBPtg4
	kM6BCk65BRdIpRWLKFYqmD4LgR2kEmzLAb6pYVfEufA3G4Sy3GCCrMA0h6JrZOHCpiZHvFfDn8N
	qYF80o1eErRjqhmk9y/80Fo7aCU1CU34jBUJnGq45qrcvlll1KOSF0RP2P5opdc4PDD02UDQNrg
	==
X-Gm-Gg: ATEYQzyHlg5XDKHWph/ArPHzNrv8Ze6prMCJ9T2i0gqanAvVisyyekPY13JBPnCQpX4
	AhKWhu7Y3DHb3bGciGiJi9aozdyjH5WIrDyU1eKYahPzv0W/z0uJ7xHLiTm4tx7iEknm9OjcCHC
	xQycltx9AIkBmm5EiHZr3owNqW5R2SZnS/6MDpd43P6VzZJG2BfLtPZ2LBMSfNrVY4tx0aHKwYb
	ff1z8c18cFdJ7WwzlvoQC9dVJflH1rk/psxDFR+v6zbImDPztPIzC5ast0E1u6+MHA07yBIB62b
	FQWHhevjn4nufzgZMSr7N8vFrgWwN1WGO9jiARFqe4Y+rfTXG9xELmotI4pawyFCenEVcl5cPDR
	RnMImD2oolJujX7q2NhIM7GDpz0FX1PFlREWRehvoScUGByJ6udHnErPQb53mqCsvH+O55BW7/O
	AoG9FnLFL9
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1267009137.24.1773910945452;
        Thu, 19 Mar 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266966137.24.1773910944965;
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm48733435e9.8.2026.03.19.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Message-ID: <c26aad81-ac48-4ba1-987b-ab6c271fc095@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI
 service ID instead of defining it locally
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org
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
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
 <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y3fxL6VuzW_SZVMObHZ6sM05z5iOlAON
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbbba2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=BdGfMZ6iCwODMfnLSHAA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX48bjvfYKTp8o
 QWRj7EeAuZll2U46jPEkkAMY52EV9a4IyjV9smd3rvfRNS2jet8YHSfFWlGPZ+hCxo8X28k+/Y8
 kwzfHUiXaMRMM/tcPrPVGw7meCDO/ZQ0bPcqikoxECaw82ohdwyOTx+j6QnOSHYFZhrnAgymPSe
 F0TMuU1HA1tPfFfd1YVnQltYs5/bcawNtiT2kbpvzMH/OCkKAs8DaU1jrs+ULpwfidU6c2gmcxk
 VOKZt6GJZR087HneHyVDlfq5tQyPZ/x2Fp5Riq6CrJZIKso7yc7oJ+bXQKUhfGb3Vi2nZSZxSeG
 KtuY7juBs7YWCVT3GZVJHjqext4MpwNQqVzc8DrUFw5xUn1G6/X7aYVqSJSeqGoTo4CQqq4Yo9u
 jkWH1oIrFfLFRS/pexxQRjh4k1jVUrS4ijeKRhe+dpoA4Kgsx+dHpX2jecrmsC6jjK2aPGoUyT3
 ATEGkUCUjDK3kdfCpiw==
X-Proofpoint-ORIG-GUID: y3fxL6VuzW_SZVMObHZ6sM05z5iOlAON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071


Hi,

On 3/16/26 03:09, Bjorn Andersson wrote:
> 
> On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>>
> 
> Applied, thanks!
> 
> [4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
>        commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Just a head up I'm not seeing it in qcom/for-next
