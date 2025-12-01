Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10630E0C6
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601960; cv=none; b=kgpKi+4gVVwGkIF9bmV4iIxJzQ+P7NJi55fR0+51yOfPpkG4kZdZHeGLegAitVqCJDTLdbdJxRYi5W344YPtPDYgfh+NiGAVENL5uWwrOJJunPfyLoN2mBecgZjyrDk/aFmE0vKbmu8R1q88VbhDhC3xXqOo59qO403XJob+MLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601960; c=relaxed/simple;
	bh=nOY0/y7styDnD1DLlbEZhSbI1ectNWmIqY63A4VdhqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzmdidw/X6ReM4g3bDXddLZ7ZdXV9eNwF53GN4ha+ZnMBiSnbq9UAfPZv15A52jbQnrI/cypc9atFmaWeBuBgFAW7QWnW8LsyIqycvo7kWn06QlkFJc+fglVuICimINkLGb2XF2X75jXK85U9dFIo3zhKDBAUc3QWdtTT3BBbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4fIZyuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsObMJKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4fIZyuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsObMJKi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1EJivZ3689158
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 15:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=; b=N4fIZyuojX0XPbBE
	99qrhenl/vgSuvEXYtbufahR71I2BA26mRSvP7oqae2jD1/c7zjFhYROPnqgIHR6
	z0qkEVcRmthxBQOndmNRWGqgkKIausqSMj2AoYp1yJzFf+9Hpi2MuzXncH2wBmt/
	sRlF1yF13CGn9MbEhuQn46hjUldN1GvgtwqEQ8y16rugP0Gmf0InxeQ46s3bIs71
	rLgyhYePrxkKsO8knvXyuMnAWzo9M/h2+Sa130Xux8WAAoh+fA4IDOvIJRkhTbDS
	NqkeEFgRygWV0RgD4ITrHWIKlU5tLvwFVcmw44FecvipXdL9b+WOl3m05ulJ3pkC
	YtXfxQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as6141g2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 15:12:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-63e08ae023cso6428425d50.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 07:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601956; x=1765206756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=;
        b=MsObMJKi5uwgN3+Cs8pzZm5GbXRE0oxD0Zonx/KRur4PkIScfGoKfLm6I6FIUwm10J
         1Bbh0J6asJv0RiNXrczVF8xZOeJzVvOJizsW3grnJAM06CMdgyis0zAbrVoKmXOwcbeG
         Pb+U6zUOp71xrasgAH1eoXDp7rLDYQ1WYRiTwweapXMEPqFtHtfoDLBJrK3CZq9t8Nrr
         mczEI0zk2OnJHLDaNHvQUyg0UI0pUMXTviIkYcC1c6KT2vhkagf/BPixFnSkmggclf6s
         8/MpafpxD2EuVnXd3+azARUEiiNCzlo2gAmtpAmx34dvMk9tiBhI/sW44Kqvzp9m3MKW
         pkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601956; x=1765206756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArX95p0olkqkaVsj5g0Z/zNtOL40uj04LFD5XFTRZSE=;
        b=sJP3JZy/lPqrkiHc5E6jeVHTHItTEi7W+WhSCUlvwKD7zIb53JCDHO33bsENOUKw4j
         j/o/Ek19oUGtJbJyW5fljMYQ7jF2GqaJxyqIMFgANJ/jHD1zjEGJbH3uZDhYjFCkPfgn
         Bl3heS5jx1ryuT7WrrG3cmV76rpdfYiS1gdb/zYi8mMQni5NGxGMRv0P6S92mILcUJU0
         9MuxK2M73jifKYr6Svlvr8fOUnrTXH6WYq4lHBYAcJFbeFovD3qcB3dPdHYN0T2ZXV34
         +9ia1ri3a5I9ROfk/ys6TGehtIgxjKx3CjIh+oGoJjmsULUrhlsWEWumy+TH1PHoK3Cl
         vzOw==
X-Gm-Message-State: AOJu0Ywac+vr00kPvgwUc+i1oJm6yUHrkdPeUZegirr0Y1J+FAjcXgnu
	v6ma6AQH/kaFbriAgsv9GpZhRbrKV96ZjC6kPDZcJvj9zFys8qXyGQ/WHpkOddgGU9ptmvY7jyq
	th8ZWLE5UmvmKXNoVkovXw/dHzK+O5dXDtNZXgJuwpxlqX8izu/8iCv4csY8svcDO+g==
X-Gm-Gg: ASbGncsKAaNL3DsBSWR9DT4eg8mD0rAVDRcsGf0rAy48Os1YCqDHBr0R168UjxVfGZP
	YpospR+zsMz8F4TfQN/ITvYbhp6+RhXZA4AHA1QF0rO7QrcK92mBeJvAqr7+IIydpTKOTu9y8Rn
	5qQTJFKqpaqsifWfIy+oe66ZJn+F+X+Lmc0tkPlMKmoCny0tosOBXpi6Yv9q/kgjldX58A8F/Y2
	ax5IY8aRJ13HiGrChF3llW6BxoOzaUA5k2KJoVhNG3OasId8WVYmmMw2jQ4N/vPIKkioQscP4ym
	pEtKuazmJvcJUfjc9pxfc+1/Xc/0t0EIItQWGbCyZ7o27IRYpIJ+pcaav3Yms7w6KE53G3v8KQ6
	aWoda5flGa7xOebiNcORM7bVZFvHys3ms6Flc
X-Received: by 2002:a05:690e:1c09:b0:63f:9fd6:94f5 with SMTP id 956f58d0204a3-642f8ddf5e1mr30696893d50.8.1764601956319;
        Mon, 01 Dec 2025 07:12:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRKs5cfkZNWtfP0LkauT9BabZg6EZ8ZhvUWxx4E0ElOqx46RgYc6C3MIrO9BkbG4xWa6dUXg==
X-Received: by 2002:a05:690e:1c09:b0:63f:9fd6:94f5 with SMTP id 956f58d0204a3-642f8ddf5e1mr30696855d50.8.1764601955775;
        Mon, 01 Dec 2025 07:12:35 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4790b0e21e8sm326622805e9.15.2025.12.01.07.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:12:34 -0800 (PST)
Message-ID: <a3437545-a06f-436b-8cfa-5970f9f53fb6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:12:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692db065 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5cJh8bmIhOOgMbKR4zwA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: h0uMmnKhXHPG0euPzrIQp_aBDdSqYc8C
X-Proofpoint-ORIG-GUID: h0uMmnKhXHPG0euPzrIQp_aBDdSqYc8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNCBTYWx0ZWRfXzVLEApBgoF0D
 R8FV3OXMBi8Ob1S9/5ygLX1q6Hmqzq8XxTLQP/2qpEDTJhHj6JQAF2ygp/HsLEVeVPCEUfqOqNB
 YXrx7SHGA3dGhrp+eFUoQxBX807b203wk2pDKwSK2BL69mjnLSwLgpzcVrOzp15mkf/RXeEK4gU
 /MOnf5bCgOHHz3CHDL415Q5HPXrMFFKWS1ExrZ1vU9GooqT7KWHMQLudhq99cS5F7AA/kZgQmLz
 loSTxYVJmnCuAmfV6KL8AOFBlUbFSXsaWvsoMLL2SNaQakSUVAGWzJPZKZelGM95GMsHUhglNeG
 6IuTdXjbyxH6XhWySpHTfnj6zFHOdLZJv+EHEjdDr5omXQo4uX6qLYKq9MjrV5IoQwLKiHslhYg
 p9qj3fMVPLCJywBUqxogCXVnqMFdOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010124



On 11/29/25 1:17 PM, Krzysztof Kozlowski wrote:
> Please, please stop ending cleanup.h patches for very simple code like:
> 
>   foo = kzalloc();
>   kfree(foo);
>   return;
> 
> ... *if you do not intend to read cleanup.h*. These changes are making
> simple code not necessarily simpler. But worse, if you do not read
> cleanup.h then you introduce actually undesired, error-prone and wrong
> style of having constructors with redundant values (= NULL).
> 
> This is actually worse code.
> 
> If you do not agree in declaration-in-place-of-use (fair!), then do not
> use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
> before.
> 
> This is second mixup I see recently around Qualcomm files.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (6):
>       ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
>       ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
>       ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
>       ASoC: qcom: Minor readability improve with new lines
> 

Thanks Krzysztof for fixing the confusing parts, I do agree with you.

there are alteast 100+ such instances in just sound/*


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/audioreach.c | 28 +++++++++++++++++-----------
>  sound/soc/qcom/qdsp6/q6adm.c      |  2 ++
>  sound/soc/qcom/qdsp6/q6afe.c      | 10 ++++++----
>  sound/soc/qcom/qdsp6/q6apm.c      |  9 ++++++---
>  sound/soc/qcom/qdsp6/q6asm.c      | 19 +++++++++++++++----
>  sound/soc/qcom/qdsp6/q6prm.c      | 16 ++++++++--------
>  6 files changed, 54 insertions(+), 30 deletions(-)
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55
> 
> Best regards,

