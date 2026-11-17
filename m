Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928310;
	b=CtkqLV2Jz4b9LVjQhpKywln5tfYbg+z/zmUYoS+jGa4LHoQEGhj319qS2YAIovw0wh63
	 Tq0MOoMKblxWolT+W3djnfu/I860ngVa5+1zfa4aFIQvgzzGkzAtWbj8ac+y3ksO6G5N+
	 PkPSOCt2nnVO72wNQjeHn7fG2dgTau/97MVJ5bvyzXSH9A/A486gEt+NZZrnM/Xq8SzRc
	 0IojiLtWQR0D5pi6/JavY+WZQgzFrWAHC4ocMFgFfgVcgKtrNEwWr4JJkYQXZC3Ui3Jsf
	 urKd7eyoi/rqcIxxqpq9F+pQ4Vp4C8is7I3H8YeO1VeAkJsA4VpWtCnAJ1vKnkjO8uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
	b=wh697H5QlpU3YHf3jU7ZcYUhe+1IH2NrsThivK9lvepTQ+NtyCloJ+IjrDPX0pLf0IOf
	 tzyaV34ymHm/XcvVwpZK8GA8bwgM+Gu48m5iFyog+EZQR7uL9T7oyjWxQJ8mnWqsZrd50
	 TD0ZXYC0Db5iuT9usc4g9VJ0hP+UPlv/EK/A6a0fVzob0bNBl9DatNnajV84zpgTy8Ot2
	 C9yuZ3JO2gja1iyd6Xd7mWOZIK6B4pAwxLv7LFDRpriBQOZeKehL2/5iRbaAhT5794e/M
	 0fO1G2aG0ypAiHzY9QFFqbDZLN4+NHOdq1vz/dBz3GFPcn+g/amIHagRSDZno4MxKjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvjYZQit;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXxXuRNC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FE606A32C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvjYZQit;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXxXuRNC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0r7H1457413
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=; b=LvjYZQitAUsfFsf4
	fAtooDTrDGJioWzyr2+fA+DwOxZeBWz6+E4OJ6x9/LRON/pluJAvOFyxGAwjFh30
	SHYozf3+bysDM66WyZUlPrES2tT8wnhFCOp1qL2mXiuNjl+s3GMbLTk1bxKvevgs
	vh3dNzp06WZlL+tbl9eo2H5nW+i2/K+dW9aNsuMheN6muoVzVzmxABSU1E498QV2
	2XFVkGvxICXWI8d3dNkhXhwFiQnxKCM7rf+jwa2BZytLFsrHn3JBcQRDJRcFWs2C
	3p1cK8P8Y+x3RakH8WWiqYbOGCFO9Fz1NwjEK++Xe7ll9HH9cgAhSy0wFfEiS4ia
	wgrcUA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc814su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 15:11:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ede72654f3so767368e0c.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794928308; x=1795533108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
        b=DXxXuRNC3FB7NY9JAvfO0kBGEr+rLwhtxvW3XPRvKXcHHmx53Cp7PrakZM0uKPeuIc
         GyaRJ9MBKFmEnr9fro21kXpTE21Ls16VQhOtTNtP4AdN0mjQeLn9PdK8CXz6mQGldJp9
         8C1Lpa/12tVO58wmxHuEZmfusquzyWqShs7Wzk8jOzdSmS8Zdm4LhOcpJbSUg2GongbN
         r/vXuqCfVZv5OG9cKxWXVPlHKav2vj/jnO7aAqGPNShv7V/hRNgWxORwXSgHQecepjY/
         qxOqEHpLMAKb+7XDuGLVzmEHRTzZq+Z8YPWIOzL9ldpwdVqvu1NgWIYfuddxx4Vn8EGH
         umaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928308; x=1795533108;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
        b=z4UofMyESaJ3wXsmDPpLyGl2rVZJF0/YRXDc0aIhcIrfULOMrGfN7hn3osc/ps9ITh
         JdnUryO9SQPhVJ+v1GEFZxI1yFNT/0Br3rCa4VN4A2BJqL9HfUtakpxKZZfbv8gRZR09
         4th84FIj9t934L2gKzh+MGzGKe5xoQN40E/mk08vPnDHF/znrj14i25F6DriuglN3cos
         pCRlie9qHH0cR9571ETG+T5VlHsdlMAHQah2WzoEwwux4Xp/xk/x2fWwr1nQk4Vik7sE
         rneKBN60CrawCe/MAzKTCH2JoRdN0F0KSWsBNJrtymJjrrTeScZjrWXLNL1xD9BWYK7X
         WEbA==
X-Gm-Message-State: APuU4Z/LtwiKqQYMrMnPEW0W8BTzxBhxF13oGPobq7C9Zq6mjqaY+wQk
	GdtA1lH5qJBbpbP7O13LrWa2UXFIXYx2suHfG6k/b+ZPq79vBMzsOtokyLkBARTDAv0Ykch8Mgv
	Sj+BO8b8nIIQbQPEP7idRRE7wAN4ocI3ouqHrPXAOtvW1OWwz4aBISxYhUxZ/HgZd7g==
X-Gm-Gg: AYBFou2kYScnogaH/lWokQiFEOC5PMb6xggdEAnxFwah+CLg53eJvqJKl8Edrqtr+N+
	13jtJhewHg63b2pCe0jfEJV6uZgrxpn+5wGbZwbZ2jhyMHzCGCJvLg4lEgdG+izQlG22h9XVI8T
	U5sLN1AsLYr08CfJTJnZSe9qf+AA0NCyPWzOIsJpwe8A9ZpJ22rcibznjSA7HMJcyJB7aZnqRyJ
	Iwkjw/m2DPw0Z+EGUkytkkab7U7pOoGLLPMffGBT0LzmsGI3IuiWOdsgBwUtE+NckjRWIsveH0F
	n2dOWs1ajmWjACrkua/mfRAmhNkfCjwL0CwN7v3CR7B5AMAAe9OcP/gOcDVFGKv6WlcQ2c223rq
	JcUJUstlpRAKF2QvXdu/CHYNmSRR0MPLMkSdwMYdap8OwOAy4RhFhLtxc+IBRW9Jaasakcwixf7
	w=
X-Received: by 2002:a05:6123:404a:b0:5ee:b3:a43d with SMTP id 71dfb90a1353d-5ee5b8023acmr633966e0c.21.1794928307646;
        Tue, 17 Nov 2026 07:11:47 -0800 (PST)
X-Received: by 2002:a05:6123:404a:b0:5ee:b3:a43d with SMTP id 71dfb90a1353d-5ee5b8023acmr633917e0c.21.1794928306764;
        Tue, 17 Nov 2026 07:11:46 -0800 (PST)
Received: from [172.20.2.50] ([195.50.164.66])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5c171264f64sm4169498e87.0.2026.11.17.07.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:11:45 -0800 (PST)
Message-ID: <23d3e257-284f-484e-b7e1-b597208b8fe6@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:11:44 +0000
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
Subject: Re: [PATCH v2 2/2] ASoC: qcom: audioreach: only disconnect the route
 a mixer control owns
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261116-q6apm-fixes-v2-0-ea89fb43316a@proton.me>
 <20261116-q6apm-fixes-v2-2-ea89fb43316a@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116-q6apm-fixes-v2-2-ea89fb43316a@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc6eb4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JUj6TmFbuaZIJ1gx_BAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX72tx39eWrRgs
 e04hoRynlfs2VPSMristYPjDtnjRxRyH231aWS/VJpyVTAvuG+llVWqOM1/K1PsaPJMtwxZiOS0
 EaJ7bU6eWnO0CdwP/JvRBC5SSb5LaAY=
X-Proofpoint-GUID: KFsTRDVpQf8H06QV0cgT0g7yTbsJAByF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfXxiJ9PojkBsU2
 ePLuL21TO79wNzEQqXdlwv3uSHYzhHVw0GwulD7vHk9YPYG3iG8h9F1+ViNKbfWKDsxNTHigJsL
 hXMBTH5pmw7768KX/L4OOV16AtGdDGUnoo7OVtTSXcWAJJpH7YjS2Aj5e/ABTsf/OqpG74Fa7ae
 FuBE++SD6HwaVv6hfNGYGoQjMwaZgFCTJG5sdvPAnaDxCKZU5sv92xn0biMs3glTmQt1yV/oQcN
 sauO0NtiHogTZec+ntZDbSnxnCskAjhvbeh6EtEKdJFu7NOYCD9RonHkwaFMwU2b8MxX47F+VMq
 BJvGztLEIvautPkUXu+YjZ16MN3b6z1+3ib0vGlxpOFyzAYcbaL9dcscXNzz0/eQVKlfa4AT/ga
 ZpRoYLEnT9j/xcytD9BgFVVjzzKdDnPGjYFnPCke92Vp4udt7wztr3CSmsMlCRGJfGYECfHQ5HV
 CkBXy7hzzYYwEFmKPXA==
X-Proofpoint-ORIG-GUID: KFsTRDVpQf8H06QV0cgT0g7yTbsJAByF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060

On 11/16/26 8:16 PM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> Each AudioReach virtual mixer route control ("<BE> Audio Mixer <FE>")
> connects a front-end stream graph to a back-end device graph by storing
> the source module in the device graph's audioreach_graph_info. Writing 0
> to any of these controls clears that link unconditionally, even when the
> device graph is connected to a different front end.
> 
> When two front ends can feed the same back end the result therefore
> depends on write order. On QCS6490 (Radxa Dragon Q6A):
> 
>  - alsactl restore writes 'DISPLAY_PORT_RX_0 Audio Mixer MultiMedia2' = 1
>    and then 'DISPLAY_PORT_RX_0 Audio Mixer MultiMedia1' = 0, which leaves
>    DisplayPort disconnected although the saved state has it connected;
>  - the UCM HDMI enable sequence writes
>    'RX_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' = 0, which disconnects
>    MultiMedia1 from the headphones. A PCM started on MultiMedia1 after
>    that never advances (hw_ptr stays at 0).
> 
> Make audioreach_connect_sub_graphs() only clear the link when it belongs
> to the control being cleared, using the same test as
> audioreach_is_vmixer_connected() does for get(). The DAPM mixer state is
> still updated for every write, so DAPM keeps tracking each route control
> as before.
> 
> Fixes: e4977b91cff8 ("ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/qcom/qdsp6/topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 612d8f03e6e9..aa2ab2b058d0 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1240,7 +1240,9 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
>  		info->dst_mod_inst_id = m2->module_instance_id;
>  		info->dst_mod_ip_port_id = 2;
>  
> -	} else {
> +	} else if (info->src_mod_inst_id == m1->module_instance_id &&
> +		   info->dst_mod_inst_id == m2->module_instance_id) {
> +		/* only drop the link this control made, not another FE's */
>  		info->src_mod_inst_id = 0;
>  		info->src_mod_op_port_id = 0;
>  		info->dst_mod_inst_id = 0;
> 

