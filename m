Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC437418B
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930419; cv=none; b=VZAP0NPgFndHFToJ+WwQvVMMpCaiQPZZbNATD/ajTyAogniD/e+Ayj+UFphs6gibezScm0qmTGRM7bUHjNAVaDF5ZD5SmpEfISv3p3SjEGUvDVLROxn69UYnuTtxS1mZInUo5uHl1DkF+ZbJqCGJxKae5jjU/dH5hFLlMP3armg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930419; c=relaxed/simple;
	bh=gv/hMc9jdlSB/rscIFbQEP/TqOb9j2QNFxeTSfCKR1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp689na9oJFST12FS+9kzZJ2wvUUYAQ42shZ0UxcrzdnTOknK+Y5tM7xQXINZfs8a/+VH1xc7+XiiE2kcLL1ErDCU7KMUGbAoi6n0HGRFVEAw/JjZCaILWk2W0tyrCRdI2FMiwf9TgydXX3qMyQSp9yjeTF6EcnBMLP1V/Bwljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QarXSthN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQY1xAGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QarXSthN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQY1xAGI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J746Xe1898948
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=QarXSthNOTFkFQkO
	al/Azz2zcOzljz5BjrIOubnbmfGGbJxmmQ6cd3iZzccgYCrqJkS037p8ei3Yw2FW
	fMzY7wYL+M5x2a7CvA7ibvc7ftLepU8jZ7dSDLW/7wr4j35FiC+FuakovAkA5bEm
	oGhBZx90FsY6NawlnD2SuBkSEDvQ96PcWAnwDx73MXSASpvIq5ZWduCJ2vU8umlO
	caIcH0KHhMuAYkUt63XzSI7fCMxfvrzce+sUtWLDPgdWVXG6MaJGGEkZZ+JBYqeT
	9j36iOmD17f1976Lp7w4hBhFRavlaBWubY2hiT8tzn47U08eYCOK0hBVP60sOrdU
	sPGUNw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgbqt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bc5678917so8225972eaf.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930411; x=1774535211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=GQY1xAGIZYBfMZ8HFqzjBWfRHLQbkLwgn6iJZtpnYTi2+wZvOUzUcGPPiCqlB3/dxf
         U/O/+h/PrHD9s8GAz38hwaetwHdBLy/f2bbHPGcjkgqyNUxz2BN6N1vGWT6sxq0uvpUT
         JYYhtiqnPk8Hgaaow8VEz4c4FvzW99+QFqWrBVEXmsorZ+NBy72CSu5p2kvJVBB4ayy9
         z2+sMrXs+Q/KqSskYyS7xUvK+7UpLdTilzFXEsmeF9wCFTKWls6/eye8yvaVppjsyUGD
         0zEvycxEe3bB8xdHyVM1LJPR/homONc/F4QHunP5SFmufkLRbrzD3xaf5ug/2F/GwAav
         zf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930411; x=1774535211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=i75lC3HckdlOonp1B5N2Qjpuu8v0WkaOICw92rhLy9IFnwtB+L1se+eT8WtfpNgkgx
         zgaQ1yw/ReCs1n3ImutQQEK8VD6m3wT1/BwSiZWnO0p1uPDztMPq9wGXr6CeBAuVvfOg
         LtqfQwAtBDL9fwE5jIma3Gwi20xaWmL7qTrUKOvhH0YtIvUpfTVM8r05PWKRBTS22rGu
         AmJXdCXqfvoMOXeAHIYfFCDNR4EXkWJCJ2G2JnfMK/rbFwomK8cUSEO62EpZMKyJTNEM
         0tRUiidvuntPsTQ7dyM99lkq46lZJZY9v1LqGxUWoT98x1IRMcf+Q8cnyp5d5e5k0XZ1
         +P2g==
X-Forwarded-Encrypted: i=1; AJvYcCUU+nj4mWcKSRczpoWhihbz1mBQTtaiQ5Pck+y71qyQH/Ilw7tssW+WOFDLTvqmLG/5BAB6yQhJXEzmgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBa0++eo7y/mswTgWZQTiTqntrBHobI8/BddJ9+Ipx4zEfSxT5
	rCZJt1pS6fb2eIMDF6WoXd1y4aP+YeTY05iN7+Ico+zve5EZ6Bro/rbRRFIMRggAJISPzc6FhmQ
	Nl1gK7EfBiqUylyAD6bDi6aEg9K+nL1pSfdqrGzcl3bnKJX5KeeWN8WU226SZHS2D2A==
X-Gm-Gg: ATEYQzzCkJAbipbIlRGSGid1zlny+1q3RbZJZ1uWGIVK3IT99gq/yYIUS3sf/swDZFK
	U4YsqEFNpy7LvN49L9vjLTe7K6zOSC2SRatDc2VVftAHe4KlEKtts0aYg9xd+UBb4X0sVDwM0dJ
	NHKNtnfc6HkNogqy85USX68zbKum+lSBHTP1fkzubzsVqb3WUmOIFUt1av6UUsShknPweGVuxxd
	MxQIOa5oJhN1tyOor8ShYvQYsdoMDYQRUcBeI5LYOTKR6+tHkTFNZQKjqz6jeHFUdt7u5yX36gY
	bm+u+yAvyh8pLEUxFQEi0TW7n6OGrVRF7pHnN0LsazINiuN6+9BwlpeMaXGyIYhy9srdV8VgZNk
	KHjqjSPu5sN1Z+83Flxt48Qg8jWfLPrMIhVLYdugZpzqEbbzPgA5TCQXl9B60DFSBrqyjyZsqdz
	hB+9Uyp3F7xs++Tw==
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746059eaf.6.1773930411231;
        Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746016eaf.6.1773930410817;
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2d14b63sm5729630fac.16.2026.03.19.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Message-ID: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfXzv/6hMlNACFV
 qZD4FetIS37KQu7kzzayV+8Z3AHjwKlyxmuTgi8wdOPDbFBdRYjnv4GQeJ8N31+n/56zkm5uewP
 /Xg8RXj8ayWMSO/jENFU9g1qp/wYAtw+ppuSyEAb37OTdJq+r26uYm0BUL/aPgJiQ4bi1tA9H3z
 zPlKdijOvn0yK+UhKmxEDtfq4a8MQiVP9h9jTlJrP7hid2jYD92J34T7TuBPACqK93n2HBlsr91
 6H5soxbLgKV+/BqVQ3T9N5m3JNTavzicsCvwurZt/w5fsK+sEB3arRQLLddDECKCY1Yyg/0qSPu
 wuWhv76wwFs39VSSFDQR3EMtSXY16jWTLB05rviUDc0zZm4E99pUjT2LJizlFiMVPJUlIg85JY2
 4bg95jX6BqDgUjkBxgXUXt8NCtdxiMl890+x7c5eZvUzxH6khHDMCeqAAep70hpW/HpKI109qqK
 Ffs4KRVmWXXSOJvxTZQ==
X-Proofpoint-ORIG-GUID: OWfj5ikK2GkMEVeoIsBn536nIbFY-XLI
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bc07ac cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yAZrW0GqhKXZdV71gCQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: OWfj5ikK2GkMEVeoIsBn536nIbFY-XLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190114

On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Bjorn,
Feel free to take this through your tree since I don't think it will conflict
with anything in mine and it will take time for the definition to propagate
back to my tree via the normal workflow (which I would prefer over merging the
immutable branch).

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


