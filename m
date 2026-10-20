Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476893;
	b=dHF1CieieQV9bKNDP45/wnmAYybllPiBHSTViPltLM0uOvleWbtzCA3eD0DDvLD2esiS
	 H4AZFqf7FJLaytPspDab5VyvZSHp07NYk2yXtsyKPwSSHQx4w2BhWOfCyw8hAe6gQFyR3
	 WQDaWEvL73ozRq0+TvZF7cH3TTL7T38+J1oxvfoxWYSR62pS84qmGizroCD9Bhi+WRWWB
	 H48laH+c1UAjhsG1diBpR8L/T9AXqhren5ZaHJ61BVDmbuEyhh3RuSs6TXErEik2lsmJ0
	 vlAO7YtVJWtkLSX+4XiTUGdPoeAYmlFxN4yq11rfteY4mIuu/KsdHgbBuPUZSK9pAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
	b=Qf9KzQdEKvHwf4azlrHSvVv8b50ulLCDSCCxMQ5CFXbCijtM0syFRhAsTHfQ/eNkLKGU
	 mf2Ilwk+KY7PtARGJID9Q5DziZjiym2B8g+l32UsmfOXSzFo9fwY+zO9KiyreA86leFvi
	 RXEz+g0S61oaFYY91VnNKvElrY6b9ltiRtywaW5AnGruWusoC5IqgqpYxxEsuY4Guu2vp
	 whCX78yT+fJxHQXTdZCq3/xmFtKeE0gA0L7T5/zpxGwlFmyD6Qx7LpGYV/lrlrJjQs5jx
	 InqRIWuGBA8nnBOWfNX0ZgTlVhyuIi1Y9UMZl+kSMejI0kWBovYHYd2n1sceY5sekaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5226606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5226606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tEol3305467
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=; b=K5O2Qj8qb6BT9++k
	UOJo+dkca2Ppn9kklkvRAEawszaE/2n+i32Rh7MM6//bqjvM3NSrblCLmul6G2nV
	6poTzZuDq1P7LTZn5BJ+sWkK/lllH9M4Qw5pe5ZauGUTi5vZfNZhhcj7jPxx8dd5
	vs77lD91TUY6KeJbEexYLNPZ8onlwLzmFiq7nh+NpBKAGGIkeH3G4yWDWH3gdID0
	GwISto8IC1QN8E+Jh8cLhL3S+jwrYt8nUgEUYnShFbGjFzL5WFp9RlOgz/bZz5PH
	m/+WXWxLbFSkX7kH2mhjKkQNsTsfKn9EwueM6MqfZCpiEp4E08n2zm4glhwWWDAn
	sSmsfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss3ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:14:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso983155585a.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476891; x=1793081691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=HFelRwvQs/xAl1VdRuJlTlIMDqJY1USgZwrG3zzf9auw6PLJ3IosZoUwUUkshBLYhC
         855MzEf0j2BTDftlWlbV4qTCgDZ/ilMbRaMZr7DbRFEqoPUm6nUbJIm5AjsS1IRCEL8Q
         gleH6S0GuvWJuBtr3PYi9E3T6R0SRBtWyVQWuCcJ2HFqgMi2dVs4v2+dJYiS8GpIJjGn
         Llt04IR9q/qs8E2rcK4Zsl127qqRMBw2Bli7YVWmajJ0/7NOQzaopaDJ8AbvBAIJLuXn
         EWSpWi6J6ESWCJGeliLKZyQVD1TwAXb6ZYrxFNLKe2nl3IbB+z1SgNJyHT6pAPxRXweC
         +lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476891; x=1793081691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=pQweP+FDDDZjLR/E4LvyHPbJa2hQBg386M63x0+LY+sDnvbeMScT41thMCYvIwECtc
         92TjEbhV7c+0oLHY7E3RUSyC+JSjzzgRcgWev7q4Q0q8Zm9YbAxZunOh3gkJHWRQkWO0
         eVjvmF2fgyonasJRBol2R7aLXdfga0dt7fjOtDRECarLBGl6UvYFl99dq76099jivIih
         pW8eeoXS47hcY4Y03I+aZoNheEuAt1WyCkiukYNJm/fGXItR4ZaTxH9xgXMp1fjGAThw
         AuoLY1Q8yy1+YsGuwtr4dcY0L6tDnsbAJQdRGxB4dnTN8VjjoJXBAULYj0nobJ/LV7JD
         3nmg==
X-Forwarded-Encrypted: i=1; AKwUvBy9x+t2sGHasRZXpCiOhM4az5CactVExql0VLHY9rb56Rcpa0XhGvMotyYi9FE39SDvr5Y3/iVIcaMuZw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLELbuwHxstDmZNeFiK6c1qauQDFoNUI4bqGRlgRZ/pXEvRPhyL
	slweOxJTC+7grf0yy83z7FcT+FtkLgTBrcswAlSS8vDnSf8r+box0/DEpvUuOK9h0nx1SnqihSq
	/z5XH3TIOoEx57rqSaoe0lVLNv1ofWsqn+rf6e8idl3Z0jz41xC25DeQcpawPSnJNc7m9VqK+iQ
	==
X-Gm-Gg: AYBFou2T91GI5SwTinLrEBf9tauEYWTo8gTC/TcCMqJUP1nYs9WaGw0tpD/cM63Hz+b
	Ev43P2rRdTC1uMo7puVVL7fj9WoyDr2zU5ckGptjtc4THJrk5SiH1szg8NkMakfPkpfLipjvisd
	MV5PBvM0a6IIP8RPmn88LgJj2XuY9KnO4LZnwDeIEO86g8kzPLrEKNm7AytPe1uBFTc5IfV4SDE
	JhYu/5F+1+SuV9OeAKdyQr9tOwOMCJh0wFNmyEmdJbWZwysGJ6ZGijD+UW54vV6S7Q3GPiZ6MMz
	y6rpzLVhPEEa5s1ISqE87A3az4LgEkvM8xO4HtpLWfkHL2wvE7eDswmW6/fQKr7PQVIFfewqJBw
	DaIJVTWODYtf3uLUksi6s+ZARW646moP/G0PTG1n5kuFVvkGN/0ZI1Vym
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567051685a.25.1792476891165;
        Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567050285a.25.1792476890705;
        Mon, 19 Oct 2026 23:14:50 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm41347755e9.6.2026.10.19.23.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:49 -0700 (PDT)
Message-ID: <22163445-115a-4c41-991e-de5daf5df03b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:14:47 +0200
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
Subject: Re: [PATCH] ASoC: qcom: q6apm: Fix the wait for
 SHARED_MEM_UNMAP_REGIONS
To: redducc <sushmit718@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019161805.2427-1-sushmit718@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX9ni0f5e93Jz+
 RkNU/ke9tJ8BBozc43aL+deV4aq3gmMAAdMgkcZXtkU+tfC71Qdhy3TOlFYGVfoxVjnlWSKMSaK
 18I9LrjMziSwFX6hS4BZn5pmEK4XENUhEUQ0Kdgww7CxfIyXf8aAWz8ab4ajAHHrQOhgfYIZ9St
 0X/6UKfwxVfY8DhaYoRCPGi+ftNOMorvP0BlqSxSTwH5oCwvfl9c9YtikG+vvcQR8GTwWEtk44c
 15b4txnQyLdUbS4vgm5JF+knuoPcXRKQPvRFX/H2DHpNHCWr8J4KIa5i+rskG3xBgrfFu8Gybtj
 d6G8goigD4pba9DgvqqKkBx2aR6iHtUBO4ZJskufecVEyOtQQezi5BFaBDTqXd57WGjpObaeAUK
 T2WY0dIRmpEWHgpl9Q4rfxujGUY31ZbtlYEpC3ZwEfvtD0v1dhxUOliW+hbV60L+SMpCpVoDJSh
 +NV7sTyy8KQn4Kk7ASw==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad706db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=I-3ohRW-80EDcGXojW4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ES18cVEhHbLS4v8D-8mIWOzhrGogjM1c
X-Proofpoint-ORIG-GUID: ES18cVEhHbLS4v8D-8mIWOzhrGogjM1c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfXz/03GqIq26NF
 0N+1dFFMlVn+amcXy8JdcDq8oMar3W8bdJWQOdwUCl/7/hcI3+JTpbA59WnF+nOlppSzXF3LBhi
 fbfHDGU1sJpygBexsBabyquKNPHmsd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 19/10/2026 18:18, redducc wrote:
> The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
> GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
> GPR_BASIC_RSP_RESULT, as the result opcode, but
> audioreach_send_cmd_sync() waits for the result opcode to match the
> command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
> so every unmap blocks for the full 5 s timeout and logs
> "CMD timeout".
> 
> Store the opcode of the command being acknowledged, as the other
> GPR_BASIC_RSP_RESULT cases already do.
> 
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Please use real and known identity. See submitting patches document.

> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index b6b1ef6833b3..379b15b7e503 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  			wake_up(&apm->wait);
>  			break;
>  		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
> -			apm->result.opcode = hdr->opcode;
> +			apm->result.opcode = result->opcode;
>  			apm->result.status = 0;
>  			rsp = data->payload;
>  
> 
> base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
> prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
> prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
> prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
> prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202

Why are you fixing patches in flight? Why can't you just give review there?


Best regards,
Krzysztof
