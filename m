Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822A28689B
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100234; cv=none; b=bBkQUtOGUBZs9FLngisT6SGciE/PnSopk2bZcT/tgYTrqp2HF0bQr2yKJUZgjzYEYmYEQzoObNMOV6qtxMaG7bRUl7re2ApyaB6flCBOrFuCG/da9jkc9P/tUg3uvs0nNKi81ge4cBgn3Dy+8wSFHRGonO6oCvBtip0j3P0RjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100234; c=relaxed/simple;
	bh=2I18mxmMPuansctcCshuBD3YLdIUGz4SaCX8PGHGUaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5qWSPkDTVHanKAnGBK50TOkCXjCGMH4nWjqpLFBOStucADC7GBUAd+lFoxNiuWDBhhJ65l6lR9NP589yIYX/OObLT6bfWA44nzjAEVLb5fVJ3IyCKxG/ttJKNt4PKQ3Yx3nzNHolKOOywsgR3VlWCO/AFxEGrq9D0KC5dtFefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQgsSFbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJKcfg93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQgsSFbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJKcfg93"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBi10859338
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 23:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=; b=IQgsSFbn0KFUnTb1
	KDrlCb6DNjAXoPA8Nwvhml10EY3QiGV6sjcWdNcnFvTJTrnhRVGJDtbhXabxBPnO
	BFpeIJL2HBaHQH7kQciQbJgYijhb3lehwUQC0cKolzAqoof+fVPKpuoHYKhB9Hgl
	BuQBFoeu9Hd+OfySMjSvJpeHu8TWZsotLGbmQdkOPDDb3/sqO2JBA9vS5polGetk
	fL4zv4ya9KZWdQVnq0gUkDwX3qHUozGvBXji0UFEYja0gt+AGzmuTNPejNDJohox
	OT/YvTyzG3CdAs6InKcMXboMSg94ba5A1lPk9z5x7jvLPjgpl2gEd4edPd7aC87I
	eaYn/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsrk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 23:50:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so13730667eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773100231; x=1773705031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=;
        b=QJKcfg935m/3Nxo0nrkVWf1wFx+6WjRc0faLfN6gDu0pWYrIGzFdxyrSunaFY4wBth
         F56hhXo7ElHyNQPepk9vsnUSpvprTClpa9OJkjrxht7VpUVa5617pzxXDZeoCnRlOnmY
         K/rVfM2JTF+9rFXlnafn5vGNkB5gRsGX53jvgOYcjKGvN4p416bbLHcM6lt6+tvWIIZE
         0+Hdnkk479ke9piJE8aCEaq/hreM3K5pcdPMzTicj25hLTYfNsEa2+F+pwrSEsLgc0jN
         AHesOUpvbmzubSnXrkzPO5vP0fSHKc9vZe7P8z16sPBa+Za9k6updXjJlIo1TQrbUBa4
         vjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100231; x=1773705031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=;
        b=TiNjS9SI1ioApbOPLL8i+XIlWRkqOtPVAioEP5ttBbP+uWn6C5ZLiEE3dKkIXdORGp
         fqqRwstGd6bxY3B3TCb7GuX6SS7btfu5Cdlm9cS7mk+w1q9yl6qajZmAvgQyzLQ5U608
         +6WbY9Mr5181TbExmnoqhWomqZEamVGhuCw2slPfOCz25/p22t98du5sAkFKBwVQdd/V
         Nvvj/vLkPzDHnM0ni5PJMQ63E5bHpksw0B0N2hxDRSmniDuGcOoVQ1ROB6fOX4FSl33T
         Cbnsh5eEclwW3/hH+B04kYtW9tYnXYWO7gUtvOlypscMMxYpmvxYRq4PHaZIj/0FdIkH
         VZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOwH/Z50GH1uvdj8tC/BzJBNqOo54K9XAOZgQkIoAgz0ODY2i5yLY2BwUWt8/lhzztLhN5RmYhT0WuNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtxAgkgtxTWywtQMOfpUA5p2Xjrc0/WMkQchglcK3TCXjzNLt
	kDPpd0J0hRpZAlIn4z15X0L4l/0v7whv6qajwbN0zi8rbVGwZh4FKJqdgcil37pXu8ihZcPz/uo
	rEBasDv576DjNqruFIhfXDjMsI5b6Lyb0YAka5Eq/ENGAS98kWY2syUAuDOcXnTBp1g==
X-Gm-Gg: ATEYQzwknSGQSVsJUw9cHrT0zLJSsm5mMViZvowF5XCeFB+pHoYHU/5UBwhPdDtIau2
	IOfjD8v+MqwgJ4jFE7spHVgnn/MArtDslaRQCmaokSmME3EkJgSt4V3J+FmUKf8kn+vzidKnCSc
	NHEAWuhQUN34E70sPKHBBIYf90+bG0hjTvCtte2LBx/AUJvlnaTwYwiyXUb1Udi2/5ssahp2rnh
	rB9AnieD+l1bAGKC0WUMpR5rjW9LLVRpQCw/RamEUWHZKOjLO/4TLb2R99/2L7GnkzfwUcW98sU
	47yD+t3qymTpxth3JR+lTFy3ggpBq2q8mLJZjOGAFSgfq8JgdjlKvPr5sO52xrHNqLwWONjXOLa
	C0ykKPKBOhquJZ5toGN1O+/ZUrkCv4h+m63E3h7STVMhi8vhiH2WVZzjuJQpNi3NLyM9jhkNjgJ
	rLLFwS+rmdCSi0ow==
X-Received: by 2002:a05:7022:629f:b0:128:cf80:deea with SMTP id a92af1059eb24-128cf80e01fmr3402102c88.1.1773100230948;
        Mon, 09 Mar 2026 16:50:30 -0700 (PDT)
X-Received: by 2002:a05:7022:629f:b0:128:cf80:deea with SMTP id a92af1059eb24-128cf80e01fmr3402088c88.1.1773100230365;
        Mon, 09 Mar 2026 16:50:30 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128dc848cbcsm3108879c88.7.2026.03.09.16.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:50:29 -0700 (PDT)
Message-ID: <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 16:50:25 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
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
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af5cc8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=20KFwNOVAAAA:8
 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=GmBS2Oju3p3q64JsNm8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMCBTYWx0ZWRfX+6EglxsqrrWT
 gWVHuWAhJZT9VvCRLcnip4S3gvpsDaMzfyDkNsHGSD5V0sTu/5ORzAWRxMNW3JhiEYpwV/m6QjK
 r+qbB5ycNxBNWNs/90rHk7wkJoMH0Wfv9OEAs17xEYq1GWTE9Oprw4ece3E7eDzqppcBjozHypQ
 hJmnSzDE5zyLGyqDsDfBB+Jnj0+EjyQR4iSCtfnpALMUqGnfRftQkB/IaPPsbFRbDLov0e37Tdo
 daNWx0ouXkJtcVYWPA8ivwJks2tpdWZCChI9HuQ7OabL+nHBj8Y10XbQzr1eSiBklHL39v4JqHf
 O2AnccHMeSuNSTQK5EA/5aTuFhqB9rEu8c1VYam8M42+MATD3ssMIteZqcutL7JbzoanuFAWrTP
 yPexrF3NBW33WqaHBmVZCy57EseECh4ijoFN7FBES5+K5RVfVyzwyg7njInULqgiCaZRNs8hK8i
 2twdls4wRhWs+TkNnFg==
X-Proofpoint-GUID: ub08KOErhU36iedbS5uFTP4d-d2ZsCE6
X-Proofpoint-ORIG-GUID: ub08KOErhU36iedbS5uFTP4d-d2ZsCE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090210

On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.
> 
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Jeff Johnson <jjohnson@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: ath10k@lists.infradead.org
> Cc: ath11k@lists.infradead.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> ---
> Daniel Lezcano (8):
>   soc: qcom: qmi: Enumerate the service IDs of QMI
>   net: ipa: Use the unified QMI service ID instead of defining it
>     locally
>   net: drivers: wireless: ath: Use the unified QMI service ID instead of
>     defining it locally

prefix for wireless drivers is simply wifi: <driver>:
so s/net: drivers: wireless:/wifi:/

>   remoteproc: qcom: Use the unified QMI service ID instead of defining
>     it locally
>   slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
>     defining it locally
>   soc: qcom: pdr: Use the unified QMI service ID instead of defining it
>     locally
>   ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
>     defining it locally
>   samples: qmi: Use the unified QMI service ID instead of defining it
>     locally
> 
>  drivers/net/ipa/ipa_qmi.c                      |  6 ++----
>  drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
>  drivers/remoteproc/qcom_sysmon.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
>  drivers/soc/qcom/pdr_interface.c               |  4 ++--
>  drivers/soc/qcom/pdr_internal.h                |  3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
>  include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
>  samples/qmi/qmi_sample_client.c                |  2 +-
>  sound/usb/qcom/qc_audio_offload.c              |  2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -

You are touching a lot of subsystems with a single series.
How do you plan on having these land?
Do you have a maintainer who will take all of these through their tree?

>  16 files changed, 25 insertions(+), 23 deletions(-)
> 

