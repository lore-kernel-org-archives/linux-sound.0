Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477608;
	b=3rDIkqhWmxxIc3pQRmlPHn2aHDL+rOlcSiMjyz0rrOreHpUZGjpmxrLXNU/7WKLK4/sx
	 UUtPr9rUzOJymxCp+oFw7s/T5ghmVCTsc1I9Iy2EIFcuUrVgZtesOPFzj0j9Wl0kp108s
	 8uy5SuUgKK9b+rytyMQQ8UTbuwmXJmrPJMrpxvsHj9HzNvS/mkKS/eKPfJoWr1Pp9VQBo
	 eRnS3qXWNDKtip4NR6W4DfBjT1j9WosX9n3ifCgYPdVplIWrcyxlOyZrsKoYdy+lzgM89
	 Ix9YxAt9cGn/aRClBL6Eyrbw8HLZ9j3jYRf5GlOU8TRyqvPnq2VtdQmm9Myma0dy4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
	b=n+6diS0O8Vj6Jm1OjkjEahOhRgoUlTlt+hKjZ+PpMtXRqajQfyPBV8rmLZwS5HpUWQKY
	 +Lk1vEGKMaDNtjLlYZ6t5DK7p0/FD5bdFeSG6ffoFONuTP/6tvZ3Wt20YKPqq065WatG1
	 S6s5xPtv3yED2zJE4nqJ6tu19QGQasRB7+5pkaRLDUIKb9ryuCuaIyuDIK+s0V2oKZ3K5
	 tJh9+fEnOoYal04yYfWBIwL0H4PXeYzd3MUv5/hmN6v+yhOfdMZc+eHwDNzpqzszNrCMt
	 AKhNGIZ1IRM4+FXVp+ubQxNl4ZN5z/f8bmiLeQ5sUqdV2uaVnPpk8ZWtImQS7xp2QQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7761606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7761606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6B00w814213
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=; b=jRnqObHsoEjKRncU
	IdotiXEOHxdM+OdqLnkMtzgi2MdhXJSopjGkmj/MlJXTGHYhWJYmHx5w+BNE6dTD
	Too967m1zhsmFEUWOQhaqjlgThDQoY6kKMsYi1O8E23Qe6qfhRAf09XaHVv29+yr
	pKIqZM1xFpZotkqbSdisfNm/39W1ojTkBCsxFnLEDdSovwDeMPSX9NrI+2tKw4Sp
	Oe51u2gqqHgSsNhaPDtLvz4mWGLwCzi0E5yAARplUOyNT/2M2oz5odbKKIxzVggG
	O6YEDJetjv3UV/bm0I5QgFSjad75IGablrqIplth7prNx3nhMvKD0iS82dJDNl9x
	gd2J0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n15x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:26:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so597802485a.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477606; x=1793082406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=PChaR9UT+V2tZ1ls4JuVB9mpTcvehTrRq5VqzA+Ojd9evOEIl5Hw/IJGaSVmHUUaIy
         9IaSihmVvsjAFmatGa+uirrMX0c3k42LIEQJx6h0oBjRsioznEiAgpP9T/hH9JaEgOsh
         QEwi6f4MC/Wc8bmfDb9tU6j8looEdexT8JyK69sBWbMT5HA/sDEdrah36GE0xQGwQAmy
         Hs5ld8yRgm6WHn0TYuaiKER7WdPD+/dSOSI7zv339feDxTE0+ADXs2h3+buNYm2oplsS
         o0vkHnHufdoxReKtnhhjwFC/+DUi+esrbwDRzaQBPf+gHezzxAddXoMRMH+2lLcdgJRM
         +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477606; x=1793082406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=bFTIqn2dM1BJ9xRJGGWB+qaf5aoEcMUx8L7Ql9jNeU3Tz/AYU5j1NkRYeTwB/x536C
         N8SVdbGPnxwAK7vW3oqSHKnwjvclLVZpNSeUuQMIRpOjn/BsKEGTQILes6lqxlbBvju8
         j7HvVfJANEB28CTfJ1oo6ofHXv2BJlZyTT2jG+IoJctrXxUfEHGcc5Ba9CCKI7lJMmHF
         6mbkUVeUaeXlWhfN36PerAacxc9/f/GV6KaGP5Zq3OzXFH24nIXoZJambH0eMftaQjye
         +NrzPnZjqz8oCa0u8ONUyd2rhwuo95Gske9D6D2yHIRJ/U9s9kmZcYOqa1X+tTvcpsP5
         aZew==
X-Forwarded-Encrypted: i=1; AKwUvBxBY1yq75G7y1AxPGsTm/wNuva30+RX6KC7w+Y6l3Eb97wjSCQK6w30vxq0vJXQOPJB4zCd2y3yerLoJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJteAq08KgPpVPt3VN5olUWBvChaF0UJa3j70RpwT+TaAq4+y+/
	CNi0FJMCuLRm2cr8oJVE+87wDLSI7QZNqeUfl2stf9fT9IqbIjgPL6oAq26wPNydRgOPWbPtWsJ
	/ahIYb38hcJ1XiZwNzENXzNjv8BG9A6gK32k+9n8WzJXQEfBeAAl++1ZPngkeWanlkA==
X-Gm-Gg: AYBFou00Hl0BsOe+u6VbxFq62P5E5tKHAixl2Eapc5X+NsRpKcLmuaezP+/L+IyGPP7
	jC8AG+DdT3orLKIG8VmADfS3QIAlWtkBMOniPb7OAE9dMSl+vFJl2N86ENyxNvMREE9czURBVBe
	PHJ+3NTa++T/AYg4ZffRRz4FHWLqlPprtWhHW7P6mlPAqC7vVL253iYeBXzSdJ62KpyFwApP+5t
	fkE5ZgMZyQshuIOvnnBUc1IRO6qDWwDfFc21Gt2boKavTapue5q6lCyocBFqC/DPjVo4a08zGrI
	gs59Pb7Tmrr7rgy8MUTIlyJN+u/oBXOPl9iNRif3iQghnOxrod/nxzVVlr1lJKw03AdSMObh7sk
	BR+XkqIx828GRkA038Epsx9Xzow==
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881920785a.23.1792477605863;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881918285a.23.1792477605265;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d6dd2a2sm4074666f8f.7.2026.10.19.23.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:26:44 -0700 (PDT)
Message-ID: <56af7a4c-2212-4397-bb96-d5ba524ae9da@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:26:43 +0100
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
Subject: Re: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LntOIyU80F5HmF_IQrhB_vqYwldaZhAM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX99+EW5wj3U7L
 zxlfqgkXKW5SJDtDuv/XIT0PJslyJFwbunck1Da9MwH43jRdDjBwRiu9xpKfODAFhUMd/j5yBp6
 RZNIwCPrst85qwcoHfE8cXN8G0agYqU=
X-Proofpoint-ORIG-GUID: LntOIyU80F5HmF_IQrhB_vqYwldaZhAM
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad709a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2d4p9qffbK6MGnQiVHYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX6qUwZsjUOzIw
 92/sENEmaR11fC8WB116fCM0r0N6pdXfnrUFx+TQKLvNnky7QL9b0p4cR5d5EsCldjGyyo+2YoX
 pEyohqxdVx++9f9tT+61d9HGTFuz/ZgIdVK5lzla9kRQCUf4NY1N22rRiuHs8sV7VmDdt+sU+3o
 zyiIBZKxht8mYvKEPVI3GA6lEcVFvn8ApSKtoyGsOVGHuc1ZJlCUZjgTgK5JZQUWQSxy0c/cT1A
 ApCnFmpOLjDjCf5grQFZaPc/4i8bXiZ7lY+xgdtelXdb4DekSJQRLonwg69FdZ9/ohQSk4udr99
 X9yTknAKw6DDkPo1k50VySWfqkhNXwvo/IgMVvX+LRJIJs4bvo0oTB7ZY2oDam06StJ/xa9T94N
 8Mn09G2R97IvZPb7X8nX+B3pPRgMeAOsDV2fs+KSbWXYII5miTDnp1/7+Vh2WRIrPimHRmJ3Hf6
 Rb1vmCGVE0P00MQqeDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/16/26 3:11 PM, Shawn Guo wrote:
> Since the early buffer mapping, q6apm maps a front-end's DSP buffers
> once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
> few problems, which show up when the sound card is unbound and bound
> again, e.g. by unbinding and binding any codec on the card:
> 
> - The card core removes the components before it frees the PCMs, so
>   the topology and its graph info are gone by the time pcm_free()
>   tries to unmap. The unmap is silently skipped, the DSP keeps the old
>   mapping, and the next bind fails to create the PCM:
> 
>     qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
>     snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22
> 
> - Once unmap is actually sent, every command stalls for five seconds,
>   because the response handler matches on the wrong opcode:
> 
>     qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode
> 
> - Unmapping the position buffer clears the circular buffer's handle
>   instead of its own.
> 
> Patch 1 fixes the unmap response handling, patch 2 makes the position
> buffer unmap clear its own handle, and patch 3 moves the unmap to the
> APM component's remove callback, before the topology is unloaded.
> Patches 1 and 2 go first so that patch 3 does not introduce the five
> second stalls.
> 
> Tested on Qualcomm Ride board by unbinding and binding the PCM1681
> codec.
> 
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Thanks for trying this case and fixing some of the issues.

Can you pl add Stable tag for these.

Other than than they look good to me.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Shawn Guo (3):
>   ASoC: qcom: q6apm: Fix unmap regions response handling
>   ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
>   ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
> 
>  sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 

