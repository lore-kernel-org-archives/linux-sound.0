Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26036EAA7
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911080; cv=none; b=SFcPC2n2A/pmIuKwGHh3+q7Lem07KbFFIUW9n4Qn85Gq3TmIoql2Ccmv+7OQlM746wfxbLXbjDCfZy9LK9EfZkb8Y19pNuys5JEXWBCbXHPhSAvZ++oJYXTB9/s64gWyXvwfexNpkjR5VWOCXS5vFN1BA38Aw8vnyHIm0x3ppmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911080; c=relaxed/simple;
	bh=enhm0fgZ7cvpHwKA5IX3tPV2s21d1oH0qHqzq3DhcrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJN1L93k0roN+L2AE9cgZveBde6hyPSDtihV1Gyqd1pIsbOdhP7JEqeXOfXZiE97Z3va+vDisAzZsrH126LoCozqJpr9LKSCb8LYa3nQMhOuDvJNN9gVa7W2QJV4LI6u5YOHpup7jC+GNdHCGUDNddgcEmvu6uvR3ekE9foyFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKtPPF3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/zpGhzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKtPPF3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/zpGhzv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uMm1770574
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=ZKtPPF3TzQXeJCxI
	vQqPEYIW+n4THnio++yCy0Zpdu+66LcC7xdB/QnqocbGxLW7k1ce5fLn+zlp9lQ9
	XIhHU7h0OaJxOZdVDzIcCu9Klei6V0g98WlT+kjPUMYfRdBiEYuWVQCN8ld9hxFf
	Vy1pDB90rA3E+B5NKbYhKlwZ8cQaFZLVw2IsMt5wyZZ36Ny3+jKkz87EUA0B19/Y
	8X6NCs0/cQQyjFud5HJpuEljDBiXbzhQuNNs02jHMtl/P52Z2lxVfvHYk7WfYxcB
	BHotcCZc82HL7QVJai6mwxvmpXknZzIe52riBBcmYd/5VxGUTg6QfP3809c3j/5W
	+0tLSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tu82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:04:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc1634e43so26408985a.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911078; x=1774515878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=S/zpGhzv6yNqFc8PhsqBOjXto2RkCYC0h1wUHLUf4Fg4xaSa7RbMoLAbqci6N+pxlp
         So7Jxknw6mBByQ5J5X45/iaMGltUc6TjIE/xURsq1oCWf0KtafrI30wIsUAbgNv9XdRJ
         kB4hH7S9qe9VGmrNB8X+qFy49IMRcsv72SDBQSGOMo9B0DMnb02kyd0zZhMF3ahSJi6l
         VBS6/L7nM9WoBRlwe5Ld8PgsQomg7Cu4j0Osjh3yQaJO0a5VtFZgtRqQNlQP4cEhlrF2
         /8fGwxva8iR/XmLLghrP0kFeUvJZo6cHKw0206oQlMEVO4Iex8JLCLgJDY4lSzx8Hox+
         /kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911078; x=1774515878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=gXXFMUUJybiQZJ9zKn+KnlN2aseSpz5cWG3eNKfp1kuGkgVlA9E6NeOcNaIikuTqCG
         CWrRPw+RdhvmkP3RZHhV/slhOonN/f4XUrTxeS3LHcoVNOdN+UKrhOk+ohRUEwmaGVsT
         a824gfcToAVQjarkpwJLrZ0iOV8jcaCEnL1lIAb2+JnozfjnqOrDDjliOaYyrvy6H4NY
         EiPMGsIy14oNPB6RiAIDAUdgOv954z8CEJQAtM4b9XapAZjjIvcLToPDzzNBmFZk/a2v
         uBK7UgWyveGJkR0yY7XBP1ET7iGHXBY8QYS+NloxvnEeWeXn644wWH7S7O7Q0FRpmhnG
         hmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlprMO1rfEAliGlVSgJhlYu8Kg1Sf6EzV3GD8JFZ8/WJWBQ39PYcf2Pf1FDWiQ6pboFxzrHA40ImF9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwjRs0GW+V0n0xDxK+l/owEvRLpnx1opYaayjTIRsShb4ugQn
	PxElg6cdH6OoKQxL0KoM6EqOk/uR9kMrUNwzsOuwiErMM2oT3UZbRqMWn9Lu76i84hLZjC0cF42
	FFyaJbgzSbfmLZy61ZZ4XBmcKiP5ZF9q8+az9mEZhagICl84+LLRJ6R+lpNdAomOK4w==
X-Gm-Gg: ATEYQzwG1SnUbWbLw5nVPcPHEuj7W/B0z+zJ6I3F9gT1HYJfwXe87XtmlUghngR+RB+
	Q2LGm9xa9Y3WzZnUFF5Tv13oajNAAvhsPxl0p5iXkzSekVmVVI/DzEEp/hK4Ws+FJSDk36IbyGW
	450ATGsh9s8p+vwDwQ87vvi+P321uegaK/3l+p+IP+rhcI9x8h6917Bw9/WlxKZAYbX6aD2/Z1e
	V1YfHKW78KbZX5PVVREzqwpndt0e0+ayIAfLwmCdi77hFkqEZbpuL7vyxUl8xZtF4HydJZ/yAD8
	UweRb256jUUI/JNWBEd9E6SoMlWSH+1LyyKDYFfGbNMoziwQ134S4tnd9ExzexR+uzV+D7RtnE7
	F4NEsF7xqkDDmm3iG7XRGDfCll07r8zTZvcHdmzEsqMrG0kcsXSGYZzOSGLiiM3orv7clsRP9QC
	ld4avzBhD0
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605571cf.63.1773911077916;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605091cf.63.1773911077402;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm49542665e9.25.2026.03.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:36 -0700 (PDT)
Message-ID: <74a9bd51-8c35-4996-88ce-8c1995b506e2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:04:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service
 ID instead of defining it locally
To: andersson@kernel.org, konradybcio@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
 <875x6ug6yf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <875x6ug6yf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX34f3aXV6XheF
 Qfg5tRyohPYxuPNusaSX5ywev1z6kxiAMb5IOT2tYqkVETNjXm70NRB/prOVVeezAxy8gURQxk7
 1H5s9oTI9BOt8L9apCowORL7xPvmWTDEt0JBpSY7kXZ/5KlqZblWfki1HWoZLdjOWZYH/Uu4YcG
 whBBUWQBjCTH3n81QR3J9+KW7Etqhn/bN5QsxVA0Q0A8tGuIq4YwC8bmIiT69jnvcPY5Hz5sqq4
 uoBm4PDgaFMqZuHxQMKZOCtXdo52YSnz/0ioFU6gqug+k6GJ7KQazXcy/JE9iBlMC11vPdPJrJf
 e0vwsKNCxsXJjCZhi6uDkIBLPG2SUDgJZKiSAef0lD8+xxz8FroKDjFO7Y0E7d+/fZ2VffDvq4X
 rZtvVtykPGS7etQ88Ac2zboylmhGIyVlIjakMcm5VmWSN5FOGXNqwoqijmX2AlzQoly4A0dq1kp
 W+l2LYhcwrrPJIMQGCg==
X-Proofpoint-ORIG-GUID: YsHBDKos2HCV_y_tdvJb3fl0_aakw7zM
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbbc27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9ubS0I03ALhbG_YfUWEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YsHBDKos2HCV_y_tdvJb3fl0_aakw7zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190071


Hi Bjorn,

On 3/17/26 10:07, Takashi Iwai wrote:
> On Mon, 16 Mar 2026 18:14:14 +0100,
> Daniel Lezcano wrote:
>>
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> For the sound bits,
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

This one can be picked up for qcom/for-next

Thanks

   -- Daniel
