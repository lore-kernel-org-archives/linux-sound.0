Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841383;
	b=Rspu+MqEMuie1igLR4SwHStT7w7YMRspQP989Yrwm4SHtWwkCIMW3rQYrpC1y1o04TKZ
	 DQMSkOUcO1+vl0s/+clV9qa9iXrL8u8o+W10Yah5aqX5OBnMo1KqfFWp9pLnM0GhPxNy1
	 gPkcytlqKxntKr1NwJbjGb7899IQql554fFOZMReoORqML7EOhaKxcchQfjcPhlQEAz+c
	 5gDrH8iTUwsBRc6I3+NX3+LkrFdA5RMqOnio9xXFUZg9c6ohGv7r0L0fM+hu8aQEaMkrs
	 oYshCWpdEKLYaxCuKXk0XPckzBXdMm3g5OOvLkub9TeGZ0+XClxbfGlX67ctwzOJtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841383;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
	b=XqFTKl2yVs43KWFljNAKBSSHkkTGaVK/1y/ZTAyjclCetQGimltcbGClQXhLUhnpuKra
	 gaIiaY21eWVEJag7Yc4CayzCWE7PRVGf2o8CBF71KijyREHQNaRKRb70BZ+3T+vEqv0lc
	 nTlORHKPN9kllh8WbVcpgc41K/HKuQ84Uw28L3XIjQGnr0MYKNGHMIkjNhabajUor4S7W
	 hSVQ6tAJDizmS20CLmWDO47YBQyQ0e83DpA+AcCUZ/g4KXQemf2V5akd9a/Pk9/YXq8jD
	 NfnL13Xi97am6R2n6pABDwlpT1GXmUw7+5ESlthDRCSpGxYD0HDiwhiYPY0VxEurf3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OVnm77cq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z1Xv/A6m";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A184606A896
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A184606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OVnm77cq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1Xv/A6m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrwa83360855
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=; b=OVnm77cqlCpQa4To
	Czg3abajcfeq1gCQUWHDADFjfqqzUn014DUNaUOwZF1/HdRU4pu6aO+nxCZemKxT
	u7a5Gp60nHPbqrk1IDcFSCAwD+AFMt+d2eSZTtfsfl8/qsuyxsVyAiEOSMBiTJLO
	QxMwairgeEcbitLDyeOvUMD66+2O4na+M93uqQxsY6OA/h8rgy3wb7rdzf9rzsVv
	EuVFJQscoZQbGsdahYorEq320cKe4a2VTEDqHeAWQe3DEnVsN7fh0hl9AXYlU793
	xxy/4DiLVY2U7UZNk+K16QKxIVbiUY9lQQEBQm3QZeZj3RcQfi78fbwWHV/Kuiax
	LqihJw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f80n36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 15:03:01 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd2f2229so4049157e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841380; x=1795446180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
        b=Z1Xv/A6mmrVWCDP9QG38fM8IfsbGeUyK0qLIKf/5EpLGm6xQ/15NXecCfYBpq1h952
         fEHoOJLQUMyGrj/f3gcccIQZ07uEdK0WhGdPsppAGjT8G5MzQrN750y8qSDH2dHrSPQ/
         GkaE0SWfIwheS2eQuspw10R8CTUGELeZcV3BoQGm6sF/EHb68Qqnmh7U6kFl6IDHDFik
         W7E7e8baPK2hQ4RdcpyAadGH9IwVcn0dFLN13AgGROzcbRKhxD5HaFcVp83AX3hSz4L2
         ha72v1RsVmVw5o16Y2Ll29hqsvC1bqD6mrB15aRw6QAsPTKVemmRZwCTvYFyXM7+G6Se
         3e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841380; x=1795446180;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY05mpA78Ns4BposrXRbEOK84uZR3De7JAwwkAwDybY=;
        b=BHuYYN4n1Ea1PsJrAHGLWlTSvPlzj5XhwIlSnnfoIbpuO7Vvkw+k4Vcq5v78f4bC3U
         KoKVrrksPNubWTyoWRgq4duVp2vBtwMPj3VuSk5iYTKMEVWLjw5Et1KBH0ydPJOUwCAI
         b0qEfalQ09iQrQkDL1Q7i/mGLZodk7d7yEHt57t1yIettMxN/3CTk1Kysy7pPxHWWPKv
         xfdEq/KDYFOAAjcK9/mcyMKs3kXQWONLlXD4SiFsRTO/96TRJzj4Zc2J3PBbat4XxA/I
         04b+gcgWXt1Y0aW44WuQUbz4tKU8t1iy1GUGtRQSWlp4k7hZkVKCbCwK2Wi60YnESsIU
         sWGA==
X-Forwarded-Encrypted: i=1; AL+hErFdxR32M+mOc7mpkkGlHGXRkytIwTuFP9uDvuwIQLj6rTX7dZLijdesBgv3fF7FE2LlNkPFdNMMlIMs9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UnPigntMvNmRX7NW8GIDpYd+kkNiozlK+2xQiGih6vmRVcNXC
	n/npmB8s0XR3416UxQTWi6gfL76Y310wQQt8mm3j8zjcLS0oimaZtm0qtKdGD16kuEr2WMUzBVO
	qlNyDpV3FVYq7L/fDbn5xqKzQ4K79jO6AvKmu0d3HAtfzHrQpfirGiGnQ1q7F21Hxog==
X-Gm-Gg: AYBFou3ONM2VTQzLQNiHA/tz4XGD1ft59mEqx/yFSchfSN6t7+VW8mUvhBRNSbOPjyV
	+mBm6+I3DSYSZ8VmvcH7gbWOJEDObyUXhqbuqJGe4aQ0xkSU8Mv/zrPTvL0o+GqyEU3fJQMBOsd
	NgzDcQFwxMPs6k+Cl4Oo8P8P07qHi+doIQ6G2A1eAnSr3yD9hKaqXnE8Xd425QkiWjVJkeF7fJj
	p1nBSk+OfMtYpM4CM1YSaxLDdRo5yMhu5uvmev9Kn3k42lXKHcPpTMwCUSTrBWFiPzcbJWK6QO8
	xpJ9AXdqaN9wG96kWU7VXFUUENfrwktmMOc50vHGG6NSosnoOr3DiBc8V5g6JN/j/TP+Kl7C728
	Qlju6CVn5wMa3DtyprKthp+isrq5nrYzzvLcNxaLPr++tnyVL7q11gpGZUkZrs5SkZauHGs3NsX
	DW
X-Received: by 2002:a05:6122:8b10:b0:5d1:dd67:3a02 with SMTP id 71dfb90a1353d-5ee34a9887fmr4067830e0c.10.1794841380407;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
X-Received: by 2002:a05:6122:8b10:b0:5d1:dd67:3a02 with SMTP id 71dfb90a1353d-5ee34a9887fmr4067806e0c.10.1794841379860;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from [172.20.97.26] ([195.50.164.66])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm23067266f8f.49.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
Message-ID: <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:02:56 +0000
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
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
To: Demeter Barna <me@fromdisposition.org>
Cc: Michael McAllister <me@michaelmcallister.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
 <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXwc0PmOk6W76j
 tK3ljnFLiVQJsvRkTZD0uycj8hNB/aQuQESqLCMRSBSPCvmu8BlS8ebN5Uv/591zlApSowa1Z0Q
 C9v1PeQlrq+LG4iBaqPuIqq6Xdn3y/0OlLa08WwhDy5svHxo7A89po8XEOD9Srzx0T0bsNFiSjd
 kLG0dPFQxT3eOaXhZFTRy2WnXPX1Wxhf/MJWdVmjF6iCZjcncr86UO6+Edg86G8QhNsmWnmyS4o
 CExiq00ct5J7zjcQn1DFHeanhFASCIK7ZpG96Be41AC9ck56/fExVt3a/TKNkBCbTx09aawhUrG
 WlJlCkpiJKUObVLquGcpkcOPRPrRO9eIWVkseBVfXKgF8i/isTNYJvi3NW0/Z318isNUHO4smkW
 iXjc7UvqUQtfsGOjb+4YUE3kOKb2UJbZe5kQkDx1iYYoIA+wgy6UcATn8xfRbuRX+gJsr0BamUZ
 e8k7HEgzAYY822c0GVQ==
X-Proofpoint-GUID: Pfv_vIb6vf4xuryLmXTvY_9BkY4WYHMT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXztMGSBNusVTP
 BmvhWtNkT0ZIzBtGfdUfYqkHvQLsa9bgTmO5WhR84dljV1Bq944S6YjIL6h4bi7dfi3XPupb0Pk
 ENJ9ls1cyI6gpfTDQlaxzXDT4ra0u9Y=
X-Proofpoint-ORIG-GUID: Pfv_vIb6vf4xuryLmXTvY_9BkY4WYHMT
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb1b25 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2tCa4HL4c9j_gEVsqMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

On 11/16/26 9:20 AM, Demeter Barna wrote:
> On 2026-11-15 13:12, Srinivas Kandagatla wrote:
>> Can you please try this change and see if it helps. I have not tested
>> this myself as am travelling atm.
> 
> Hi Srinivas,
> 
> Thanks, I gave it a go on SM8350.
> 
> The DSP takes the V4 blocks without complaining, but nothing changes for
> me: S24_LE playback is still 48 dB down, same as without the patch. I
> played a 440 Hz tone and recorded it with the DMICs:
> 
>                                     without    with
>   S16_LE                            -25 dBFS   -25 dBFS
>   S24_LE (bits 23:0)                -73 dBFS   -73 dBFS
>   S24_LE, shifted into bits 31:8    -25 dBFS   -25 dBFS
> 
> Capture is the same story, the samples still come back in bits 31:8.
> 
> Michael's v2 does work here, for what it's worth: S32_LE playback comes
> out at -25 dBFS like S16_LE, and S32_LE capture records the tone at the
> same level as S16_LE.
> 
> So it looks like this DSP just ignores mode 23. Maybe that depends on
> the firmware version, but with the firmware this device ships it doesn't
> work. If you have another way to fix this in mind, I'm happy to test it.
Thanks Demeter,

If its easy, Could you try:

---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c
b/sound/soc/qcom/qdsp6/q6asm-dai.c
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -286,7 +286,7 @@ static int q6asm_dai_prepare(struct
snd_soc_component *component,
 	 */
 	if (prtd->bits_per_sample == 24) {
 		word_size = 32;
-		mode = 23;
+		mode = 0;	/* DEFAULT_QF: Q31 / MSB-aligned (bits 31:8) */
 	} else {
 		word_size = prtd->bits_per_sample;
 		mode = 0;
--
2.45.0


