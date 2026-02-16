Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE291D5AD4
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252344; cv=none; b=QJr/yhxeOMJPEq8KMGViK/qtMio3xh6SL654GIpIUtWCwfxtUj6EAcrJaVwSNnVnyCmFRe6yloG1BM6QrsjgN/frK0rveGxUg7ryjTcoW/U68JUtzADKqISFtxgjxBTx5p5yqZtT/ZToc3NtjGIumUwW7eZYzkmmKRS5sh76VFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252344; c=relaxed/simple;
	bh=7ILzGh/toqjngrTqFZyOGHhGMctwIJ3F0SYJfRRZqM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSVcJxcanlUP4iRZlA9B06U1rOf+cSBpkEwSKisL45uLjMXev76NTQMPJtrBduyTWxCeROM4Vtq+vxlnicq6/Tse3v+zrdOS05mxIK/pJw6oQNOUE9bQLbFBnDMneYvOxswUoY64f2NswBlvBCNJI03U236j99iXQ7PyvE8gBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqVQTaga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHI4/CIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqVQTaga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHI4/CIt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAWgWf2431215
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=; b=KqVQTagaXK52vZza
	yjKG+vsJipeSt45oIginBde75+8P98iWfohSdNNA05XOXIVLIxrxH1Nu3zgD0gd7
	TPSBi2Eqd9M9IZ/fxm4fnRf6S+NY2yb0j32Nvbq3hXobPAVKJgaRo/Wzd5f5FiPz
	vL9tDk6eBRegAtIFfBTtOSBduyN53aZEFftqutHVRsLsCSExRGN8p7tOpkVJIsom
	OH00dKAxRPMtXFr+Fb1GxP67Br5N7UjP7T/Tbv3QeoHGieaUnWyqNbEna3kbA1Tv
	lUKQgfwcGtJkv7hyfW9Bw1qZdW4Rd9FznNm89481ugO57Ojvdn3eoBzWm3PL7vNE
	q1rhLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe64qve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:32:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954937be97so25162546d6.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771252342; x=1771857142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=;
        b=ZHI4/CItB0scXYhiiWGJcS90IEJLnOfmOqYW9+v4Wbhbq7PsBsfj/9yZtAYj6L/no9
         qdummBDK7yl6XjmbIC/h8pO0kuFWY4Trl+EGp6DaXxAjY6hatWYVCzKyf/obHGljCd5z
         iA3wxVYUIEjS6+LC9Yfzkbob1FqHwD8OpRHYJwsncif7t184zdPBaLuaOHiqRGxuxp1b
         K7K1vn+kZ5y/NThLPqcGOTsizYx6TVHS1srl8hklowQ+5lWMsZdGkaqWZ8q4FVSalKsN
         HDdgyd9RBAsx3rR7DDeK57NSnWetff9BE6LzZ7aYAkyf9wK4F1XNXu5eK8w1vVWTKO1E
         bmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252342; x=1771857142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQv61Msy8BxuXhXgP+XdM18S+/m/V9yLtC21yQ/Fo8w=;
        b=KexSDPcd1QzmGaNgQuM+v8+17iFdoaxHETOr4/fgFI3lwd05z6iFOdX/JGjpVxyrDm
         X3jga1/kNM097/RcK5TVKwfnpyaBBmB9IF8krM5hpHcfAtlzAlanmiiS9Nom3zExJfCM
         ZXH/mkApcBj6TCod/7ZIwN4+TZ5laozZWaPFrZa7XoJHugb0bYiKoNQAJcUBsT+NguzL
         kM7jhmoNp+RcAXyki6rltvOyeKrxsMB2X+kTaG1GSW4nWF+hfAHxDN/gdvdnM9oATUGb
         AJfszY8XsvzWoo+weKgfjeCoYiVz73Omw4lT4pP/TGgd6zdSmitgT8F+ZmJEAEWJCVIN
         /Wdw==
X-Forwarded-Encrypted: i=1; AJvYcCUYytN66hYzhCwAJX4zWlQHdcfKsVytR6WESQ81f7uJU67S5FyfxP3yXT7sh/WjLJtrXJyko+CHTp6QcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgJKjG9+r4Au+yNLl0FNwKqC5ziufrlZoXvf3u8lqowd8LMhV
	nZ+bcQiELHv/iKmIh6mjg64LGImCpt1BMMg4cB9wvEeMAOiT5tG+ufnpTp/Vlw6HdV3v5iq5SxT
	QzILHc6UbUbzmnxQRKaDx0hAonmynJx0fqHdQMnZcantcvI3IpDXS2172xXZJUUWO3Q==
X-Gm-Gg: AZuq6aLsbFUWVMChzgvl+bRsdryEk1KJCDlVgS/ytbJK+pkmAeBvUyXxhN1nGBJBZI6
	RbhR5B2l4Z/TF2sZbXg6ATlFSVRzWpc7JHTI3CEpxzgQjqCv+NBsTC0dKF07LsgFAJ2CXsAENJA
	CQ/MzPgOFVXKo4/UsQu50f3dFHFN40bSVunAFozuTibsq/lCJyKw+CM8GJv0hnpbedJwPUpbS/a
	nYvrUjPThsM5uJm1hH2Hab/9HCMVupjN+2joUPOSQNlSgPTRgGVpZdNx8QZlJsleeyAoqyMfd9M
	lq+KxEbolctR9gkMpISpF7dDkAco7+gmXqPO97eTW0nWh7VI11EX7qHteRmOxuKrS12mhiIIuMS
	ufKDCO/Av4H3LInkfj7ZVhCn5IYBU7knlkHM3qUNQ9sZ6HNchvoCdOY1UqK55dmungj+We6mYx+
	ilIak=
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr122425696d6.6.1771252342124;
        Mon, 16 Feb 2026 06:32:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr122425226d6.6.1771252341644;
        Mon, 16 Feb 2026 06:32:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385965sm262304766b.15.2026.02.16.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 06:32:21 -0800 (PST)
Message-ID: <54c5fbd4-df01-412b-9586-645a2a018902@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
 <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69932a76 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=OuZLqq7tAAAA:8 a=Yc6E1KeIVK-B4mHnDT0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: z5SZuBoYnXBJcah_Nneu2kZTtgnoiUiV
X-Proofpoint-ORIG-GUID: z5SZuBoYnXBJcah_Nneu2kZTtgnoiUiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNCBTYWx0ZWRfX0Cq8MbHh7YpK
 W5Z82NsIVPvbe4oXHAu4RI63f9AFbcNwWLn2myQjccwnD9PYMdyQOuoU4yS4W+WKjJIqc91Iady
 BZWts/bbC+vl1CfvbEcROlrB1Bk19y9C2A5fJKKdlxQp5TLzQVhPZnS0MWSH65FckVrXrGVPnqH
 BIJ4JFS7gbRCe2tWMIxnARl5i1B3SXG9CB9oqxuDvbCX8BuPvNiKmo30tJCKUTnGn2zh8sv+gai
 SjrgynoqD19V7ii31dlUl9kI4RCM1ISlSLgs3ZpziMw73Yilfws5hdzom24xs59yIK6gROxSMvv
 6t7teL4Xuibh8BD2PvqKttBwDcrNu0T7SNRzqBmIWm8rkT4FLzfqGmHZV1lLs0drLBYNv0Lpyhb
 62L1zu4jlbCeVQa7mVZh1+5FwWnWhxeosnWW3XOcl8/jbVhsGuoJl+UCwtqJMS98A1BH+PV/u+r
 XEwNRS0GjhSNROQV2nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160124

On 2/16/26 2:57 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
>> On 2/14/26 4:38 AM, Richard Acayan wrote:
>>> On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
>>>> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
>>>>>
>>>>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>>>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>
>>>>>>>> Add compatibles for sdm660-internal based soundcards.
>>>>>>> Why is it called "internal"?
>>>>>> Yeah... I am pretty sure there is no such sound card. You cannot have
>>>>>> sound card internal to the soc, because you need the external components
>>>>>> like codecs.
>>>>>
>>>>> It comes mainly from downstream driver name [1].
>>>>>
>>>>> Downstream also mentions it as int_codec [2].
>>>>>
>>>>> There's also an sdm660-external sndcard [3].
>>>>
>>>> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
>>>> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
>>>> optionally WSA881x".
>>>
>>> Interesting you left out WCD9335 (codename tasha), is it never used in
>>> production on SDM660?
>>
>> I don't know.
> 
> msm-4.4 lists WCD8335 in sdm660-audio.dtsi. I'd assume that's the
> standard codec. On the development kits side, IFC6560 uses PM660L, while
> Open-Q 660 uSOM uses WCD9335.

FWIW I think the SDM630 Sony phones use pm660l+wsa881x

Konrad
