Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F149EC65
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784072; cv=none; b=cx2rQiaaARfS4GVOEjGJ6SJEyxNcEqyDOix2UYk3Nra0Q7KETGMk/2NhCnbs4IxYA8EE0zB5s+2nhn3wLQN5tGMRsE7nfI/mizlc2hbBNTtZOaQCfeB6fZX+3x0vDHm/dJHXa4+VA2OKEsCKpdFjQneHCia8N7yHMzJGazcC7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784072; c=relaxed/simple;
	bh=+J91eDr7kWpWxL2VErpxQSnatb/cbGe70zHEmvdVQEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLpyT8F8rANUlFIXONYH4picnLRvA/Kd1iwYXXz8cdKPorcZ3zMScBkfJ9lahHM8CQVf9Z/0Njm+kaA2EytwkA/CJYRkvkY8txACyjgIiIHu8bwhdJil10tINNa132Z94llFoCB61OqC+XTxKB1LAE1+JaP2R4iS9vRFGOFPHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKOYizD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAqJiVca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKOYizD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAqJiVca"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmmnC2651981
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 12:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=; b=DKOYizD4bBHncWGl
	CTB5/7gu5v6R12yd2UovTGFWcxBmw9uHBv4l8uH9gMjKWYlO2OlItU9DBI2kU3xg
	8WanJcPp/ikThYtLa82oP+h9bCpbq6UqdE1h0GVXbIg8bzqjVb7asvBEmlhSn1/S
	Vbtec5ggzkFjJk1qpN/rxiXYVcQge/eVGg7k9sFJMLMoQYaiK5zHOn8y/iH49ueg
	L2vy79wXrkfhePL4VJ6yduAVD7BHIBLbHw4wQMRlaRoTXUEChJ8ajwlIG+5NVv49
	3SxZeMoPaBL3jOsR5wTNyM4GfkSz8jqJ8AMIsx3gQuYQyr+XeZ2Nn2d4xD4wap9k
	/WyeOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0ky9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 12:27:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cd9fe6336so10249066d6.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784070; x=1789388870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=RAqJiVcaaeZLy17GIU/DH668v8F1QTDyjolb9htz98b9vjISR234mobIN/pPuZBT3N
         gYn2lnGwD/0LELSE4vUWSaNxGbLuWsSuL8Mk5+vYlUsq33Jvv8G6iOqgxMQ2pY+uWwiQ
         Ti/CSorYtCqNLGyIWG1+x/z12yzCT2U9eayj5JbprH8/V9AXEmbhHIZfzA6H1xKwrjoL
         8B0giV4cTMhoQNEg8SEfhkYHHIIUyP0B6XQVvegSUGeXvd7lVOlDpt5ls9rO0T7VHD2M
         rMXIHiTsZ8xzkdfs6qS7+Dm29a1Myit7akfMbNC0KgaB5JeCXOD16OnBgT76feY/2gwk
         j9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784070; x=1789388870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGw+UONwD/1MsqquhuuqfV+vYDTZQZWhfcVMBBeRj7s=;
        b=WIysrUuW5ms8oXni0z1Hms3EX5xKhQTzFazIydNmjt3myMGK777/50ycdopXRQPbgD
         sdj15KsiZ5ePExG0d+CRp2V/dUEGNLais7mmuZXvr/+WN02Rz+4eYdHXRxeFyc2tmLde
         8r/Q8CSm7fZlZLr1GnB3Ufha6VvmV1AStjuvD1u6DPaJOeQrJHhuyNVltVRi4EEbOwrh
         yo5+I5+lqqgagtyXwqX3BVmz5lfabVZk3bLT41U4+BndTv6k3T0uaGykc31V7GIdioHw
         BtBXwPLIxiQYDakVJFn2inrLRSXfeMl3cpGmLihcjud7Z9oAYbnGAiAnRZOSkNumhTcX
         Qe/A==
X-Forwarded-Encrypted: i=1; AKwUvBw/AnL31OizmqHFe5xuRAMTTMlUaaUE+hLGx6r5m+bysABHZzGHoTvXcD/sCuiX0g9LzY8rCq/vf3EyTA==@vger.kernel.org
X-Gm-Message-State: AFuF++mgvG4eS+XFhIZytka4l9eu40hBzxDz1Yj014AQvU9ld/BdxlDB
	H1IPTTl0RlmyQOFmwotGYLmGqfiE2VcsAeS6WByAU5jsn0YvAnuK56/ZCV4ZVnPQ06DDOE9tgwh
	d+scltzDAQpnQJa72x4hx1blU7w0ssBKP/RCoxXfdGPMsJRNfRRkx4iB2VUfcNOi1Mw==
X-Gm-Gg: AYBFou31jfcmN+CpCjKMQ71hhOKHxXOOC5x9zIxV8qOrfcjRipg4cAI8gAEr+PXWMbe
	DsCHaPqbkoITaFlyqvnuvzXvkJRKIkiv54isgr8aFcZOzcPVXFyWh0vyicMzcp2ERsdFnK0h4CD
	bGqLPwp/2cemhz/ikXkBQ5UxevfQeNjGTy2rzKvcio3JHwmy4rUyvKLEYPAR9vxf5mSaH/Ds7jP
	F+GIMMt2A8gMHtKzxnZcqUu4grOmg3iRG1gj/NhOhpS5pFqUXLqMaydqL6EiyDp1uN+tJg0wdvr
	2tFJnlOB5x4ObQkntV4Hr4hFhRLLusCmQMWlHaJQE0piX7xmibT19A2LUnARmKVfu8yKMuXIIE4
	oWCNdiquCqKx7jpzsuhvCIg==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794478385a.6.1788784069807;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr794473485a.6.1788784069191;
        Mon, 07 Sep 2026 05:27:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm467446066b.15.2026.09.07.05.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:27:48 -0700 (PDT)
Message-ID: <b4e0dbd4-f50b-4366-add5-e99cd4432aa8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:27:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9eadc6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qEK3ycSJ6RxWlfFwZCkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 58p534OwrFEVTaade1Vm_J9CpOjqemwk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfX4DmWCk3Ga5AD
 V7l/Eq6IljrG2qKU0177RNPHQXZB8QUfo3zTXfvkgbtEzKqQqRreHQYN/slUW8TcS2Yz4EXMbZ6
 u1F+iLqE2aNd6VZRSpXppmIhvonvg0s=
X-Proofpoint-GUID: 58p534OwrFEVTaade1Vm_J9CpOjqemwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOCBTYWx0ZWRfX/Ci01F+1gfg6
 hwaYPkjteeC34qWoUvg5Zme3Zl8mvcFFc0RHZT2kx+/TM5GfJL36KSKirqovgjHM2e24XJL5qOk
 Yi9asCE7oPYmowTxXqOfrXf6eBNYkJwktLf247pxQWDIuc0ifFNZ8l8h+ylvBDKoJuzckEcVUtJ
 EcBDmqprEZKWfFuLfOTXKy3sxEU8k5bGxXr3nZzSsapTNity9octfmI+K+WZviKcYNnVF8hCyRU
 WmF0S9I8Y8U88IvMVEjSW9+omDUVjRvy0h0QohwzweMyjZzTcsAmje3HQTdvKkvqyh/FHGbnybY
 Oodwlwvh4QFK9qylf/gJtWXx8QVnxPlVkQd7u7SqitnGXUW9sbT5yf/9f32m+Ie1lUH08agklNT
 Fig5t9BKBElvnSNT3VDJf8U9//g5bokUPfIWr+FQGBKJHnYHhosFkUMH8c+iY68FYoemwnCIwgd
 ZnJOH8fVlTUY03eH+kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070138

On 9/4/26 12:02 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. Primary MI2S connects to an ES8316 codec for headset playback
> and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.

[...]

> +&i2c0 {
> +	status = "okay";

This should have an explicitly set `clock-frequency`

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
