Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110063;
	b=ir1EVa3Ft9mhCCFtPt0n3q9mawJARAf7c70ISS2zxSHIgHjaLG2s+YrxYn35wjGqIF5j
	 /11C99pkmA/n5x9LUMwjib1pPh/5e4wEJDK3gnLQgnSTdL63Kmmj2ClFc4qbjWw6BZ/ZG
	 YW0n2S8AVdAvG1LdSxc+CrVYloeGJoMmaMnBwnIkovhLWPUn5Lr9JVQa6JIjzY9dcbpbZ
	 qEw0AZuTrB8RpxHEVmhXPzQBjRu4d4Yz2R3jpP4AEFf/yu9CtUYLn/0zJIn4AU5Gqyauz
	 9ubojuK4liekxcLZXsXhFYW6XQ56q7KxeA6dQVQC2WOc4TJwlDnz5Jrt2nYGTOPz/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
	b=R6dlTjr62O66lkxRKoy3b5K7pqC2jf7QcwtlTxqjkfeQjfe9pfjtGTgLuW73h4uotvvX
	 VK1Zw722wZ7iKLh7XJLLQYic0O/a7KXPoWx4a2r/U0cicYHDhN+q7ELekgpYJm/KKNh/8
	 HTcM1s7hpc8wybmpbCq8c1I+Aqoppwy0Ta3Mf15Qpo9dZuTuz0gmQ17x8aH3SN1Bz8CBR
	 IVKlI0Se9o0OCvrtK37bQNXvMfzwF+psC7/SVjO9PWEUmIvuO4T64Un665SF/Ililmp9J
	 PGk60AQ6yEsQusSE8w9A+wp83k+aMQYvJ7e5l8KhBPuLBcgoJJVGBMMWcyCzjfFCLHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4ZetSjL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27D606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E27D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVF9F3tT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4ZetSjL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoZM21850905
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=; b=IVF9F3tT/2br9RF1
	ZDyeHCfQJQIAIImSKnbZjsKOzAo1fRhW/2s1P3jOVGnxtA78SSC6zOjDyaZddOMH
	uq3QJ8dGhxtnEc4Rv6aCpzowDm31YjC4/I188yC/M1CiEwqRnRZQ9vmd+CfuRT0k
	cWK+xQKXR8RBXF+mF9Y62C1etpqiOPLCUczIl295fkhI5ztW1cnv+B4hatHWZ1j7
	p+wE9R7zca5fHbp1iCsOpsTPbPZO6lHP5T/aiSr4GcKal6SmY9zULsUw/JjDizQF
	wb6G3NEno1rAnPykaFSv92N1PqSq0EOkPvfrzAhx/1O0rOX7G/T7JfxIttdaLAbI
	v010bA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbyqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:07:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so673456185a.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110062; x=1793714862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=g4ZetSjL10e3k0psISk7JXT5DSnTiTgGdyNjw+Widq89urTCYXutlQDuTvaHz4Qj8K
         usTQysinUsn+Ah/JeZe9iaZvs7lattL7urH3iVGkLGCRUiaHvmueDWxv4e2tng0TJxV2
         ja7FflNeyxHDSSBxojstBHNkCUqy/A8m+hzDxcK39xHC7l6wRky2kCqG2tSn3kqUIMwN
         02cEie2j+IK9Z7PT5HBP6Ozryfd/NLu1NCc4k6+wXETAYXC1uJ4oABskE3+EPo63FeKh
         ZR0czinAXkoCZkCAn129gjnSTXVHBaQIdk8Fds3xp9cTIcLTkGjQfgiqLOlu8J2s8wzn
         CczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110062; x=1793714862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEg1nya0PcPpSx0ic092fxlis9YBlwbf8B18X6+8KOM=;
        b=hSJonl6YCHn/SgPD/xBiOM1EY/jBeAaMaR+9D++1QWdHmBrhZxXnv798xJDcH5WnB5
         nly0oGBC9+CGG7JF5aXMXbjTg0GrIP6VibmTBt55ZwgVE5kos+98zNCXUvm+g/xi57oW
         VPycUULMCBk4TFfP+l+qtCXcVVRjiRzSUuNI48WX7ad4QDY6PqVu4v5UfcjDpw4z0AMh
         H9iOLznjt3laLhY3cOgapHNSphIttHbCiQ78uA7/6zF+se2ZSL672eYpjX0/pmJcR5qP
         1PlmM4CekuOIAp2saR8ElEsWBTC42160efBVMkK1e//s5asRCkTCpMR28OL2iwP5NnYu
         Y8ZA==
X-Gm-Message-State: AFq9FYL6/I8LsxdXgbiggwGK4TpwE1hxij91TsqbX9ujE8JP6Z0eTvs4
	tgwJcQ9rxSts9wCE4Iw/9GkQTB4Nee4DcMXMkvxW0ilj6qRYAdpp9Va2USg1PDuxjUPtQH0sX+c
	nWc/lBTUh04UmjZGogDEmERJ77/nJZoxFCw0oE+4T92BDOqgdZH7oEaNaxi4WFsonvg==
X-Gm-Gg: AYBFou3y2ElXjU0NdPyHdER3D802wPx7ibkZ+WxhxQNFXAoWCJx+Kw2d7T4RYQDAPTE
	v493sGgnT6c2PdmOQRTRToXmPtBvtEsK+xgrdkt86+0zh+lmnBaHWKQce9n5e7Ng+agPf1fUJ6n
	AIhqdfqLYwkAuXXY7klmIKks6tOLZ91+r6xBkz9LrAM8eOeUfU9CDjfo2hN/dXC5bTy+cy7VSyJ
	cDK41qzbxnrAI+Mu4T+VfNGk7GozyDAyfBmMknr009SRw/8b5OJgkXGG+5/r4P8xSiv8TRrSfpc
	x4EmPDp32wocCQlxvnkmQX2iKwHWxt9VFcpWyC41+OqcPFlYfhwNlTXMC1hLdivcJN1IuEErFuE
	PPVlmrsKRyy0Ev2JW7qvzQPftmw==
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657774685a.43.1793110061431;
        Tue, 27 Oct 2026 07:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:43a4:a47e with SMTP id af79cd13be357-940ef8db9ffmr1657767985a.43.1793110060943;
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b49642026esm96803a12.22.2026.10.27.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:07:40 -0700 (PDT)
Message-ID: <b7fc002c-4c01-43c4-b404-a9599a938fb4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:07:39 +0000
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
Subject: Re: [PATCH] ASoC: qcom: storm: Fix of_node_put leak on error path
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX4Y9V2/KAsqm+
 XSqBfL6QIEakTCyq7cf+/KAd8QZ1Isb/RBDRZFp1Cu/VSDBzH+bbPsrWdArlyB1s5pL2zg4S+4H
 sHkI9VbZWVfd4jKFCOWz8fsrkqHPwzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXzaczRn64nvZB
 gcI1NXOfxwMiVw5RZo1ADGd6pxtguPHjV0ZxNTfyB6PWQ1R2HR11H7MzmvohX+b3upjDo8PGU9b
 AjnnSd5BzDk7Nu1+kFZE+PEQdKtwGBdWPF/nL6fuKQh8qM6kEs7Wj73IkVEeWi10kp0GoPMHEHe
 URsh/yQvs3BXKpru2CkuGUG+OkhTOQsMQPwnnB+QU5KPhXiQFXtw4L0VHzpDtzbbMe62REo5N5e
 4uyrbwtlgO/kV9ITobz1koGTHiaWNTfVsto5V6k3zfNlLzxIqTd4ZYedtFxkl+8cDwIjzSyQ7hF
 /9TjTG37+vLCnpwqPPLRK7JIx5yBnAdMkVjjsq7l9SbxmWXEzmPO0J9SwkMzC49PsTBaXfD7fOi
 yAQckd6a8+YPAT7T80DO/Ugtpxut9dhwwlE8+q819I7O1+pHHQzahAgLgZA7J54dn9eZ/YxzZz8
 v0XRnUURae3OPzYhIXg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0b02e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=qifAAX_Yg6spbNOiTWIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: x8dnXQkGB0iW80bfw-fF6omvNh2VCZlk
X-Proofpoint-GUID: x8dnXQkGB0iW80bfw-fF6omvNh2VCZlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270056

On 10/25/26 8:16 AM, Tang Bin wrote:
> In storm_parse_of(), if the codec phandle is not found, the function
> returns -EINVAL without releasing the CPU phandle that was obtained
> earlier via of_parse_phandle(). Since storm_dai_link is a static struct,
> the leaked reference persists. On a probe retry, the CPU of_node would
> be overwritten by a new of_parse_phandle() call, losing the reference
> to the previous one.
> 
> Fix this by calling of_node_put(dai_link->cpus->of_node) before
> returning -EINVAL when the codec phandle is not found.
> 
> Fixes: 79119c798649 ("ASoC: qcom: Add Storm machine driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---


Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini


>  sound/soc/qcom/storm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
> index 6b42fbfd2..6a42876ce 100644
> --- a/sound/soc/qcom/storm.c
> +++ b/sound/soc/qcom/storm.c
> @@ -79,6 +79,7 @@ static int storm_parse_of(struct device *dev)
>  	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(dev, "error getting codec phandle\n");
> +		of_node_put(dai_link->cpus->of_node);
>  		return -EINVAL;
>  	}
>  

