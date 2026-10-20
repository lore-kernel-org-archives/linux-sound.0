Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477737;
	b=theAchDG4QoelmXKzSgTKEF2WdbHfFe9cdodRb1p4LByYRKQDlvu1fIHkRT1VgproZAY
	 wAYerG7NVTkv7ptVm8Al/EtLko/N138XOJ349sMNfQbB4jhybyATy3dYKgxfkSZGw55CK
	 zyRH1H9VQh2QAzhe5eboIqzd9SiBOuLL9JEV+luevtM/V3ByVEGqZOKLmXcf1aIpilpGq
	 sZsYqyh8FZ8heoV4q95u6EykkQMeyxd6d63B3aDTXkp3j6ftgvZulqlpkEeNEMfGHsQ2A
	 LS5Qrb6wRgtnSIc9ma2RXJSGpioeId64PxCc3XyAo1AoEicuUBNKdI4KilGn1BfxJxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
	b=VdPyQ9VVFNA6NDNHKtumel3EYTuXHR0MnjOp6RvYJytcK7l8PO4OS8YwDH3xUQwaJIYd
	 oSsloqYc/cUiK+fsEdgi5yOXHWc9/yQP/borUGikbVIjneldzIoKw8azncPS44K59QTHO
	 Gh9vO9Mhr1tpNcRo3hZsE24w51m7ErA63MRJGkzbj117xBeCb2RJq+cfnNzW8XRLq/yRO
	 xbfEAj6xix22HIA07nescxv7ZtLDNzNHhzenRy1fGHbTuF11ZrKtkDFCdBKaC9qvrCPHB
	 fuIiBJT3pIoEvpV664515x8B0f3emDGNxi13wtbXjicF1A5AwKnJX+giXs5VD3kPB6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdX7H4VS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=boMd2yM1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76613606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76613606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdX7H4VS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=boMd2yM1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBi81254672
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=; b=HdX7H4VSz6pLF8gH
	JpPZacGT7sqCuPx9k/anR2BYBwdh7nfNZ3U2zbqsrekvOw6A3jP0YcLWLMSOhAl9
	W9sODGkcIV5twKlysosQIpvT2R4ki9JXWlWx/XYcWNMT4j8tQ21DXH8Ycq2shPzs
	8Actnb2ajBD5pBfMqKhB2NPfVgO6pcAvWX7zyEvaFi5paH/472OfQQGXdFpyVHV8
	u8KTemw5COVfhSzpAUikKdS5FfWfkR84u8UTrH6IkUGcbTX/frWDGHzFwWE2HX7J
	YHbO4Uq/5WKlx8v3GUtxMo9Z9AdzMkRrrdByup0dJsd+bpj13tkRjhHVrvM8I9fW
	8Wqv+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n95hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 06:28:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso692992285a.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477736; x=1793082536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
        b=boMd2yM1bvEE4WKB0fjuiiv6L+ofl3Ky8WMeOkCOKgF5Kzzz7zGKhrgSYK+w6CT4ZS
         J+WFpQb5Ip2p66nMsFoqQwzVwfktgYd75mb2z6IDnlWZn/IRNkCIhDjN2uSLdFc6RI7s
         oaHZa5Edn6UqN4UuvspvmhPlRijdV/a5Al5N2P3Liskeb/JPWgm1nUS7rvh42od+/88n
         /Ufr9ph7WaEqAnqhC28GZfuHUQGS+JX/sL/ygGV2FSqv/KoZi4TEtoNlK1oruo7VvdqX
         k3l4Sy8DU4uD86Vx0iAcksGwQ8Jox7MfJvMJ7Q9ljs/LWWmknmOAW/nEJcVH9mlKRkgD
         C5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477736; x=1793082536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
        b=11UmMV434Og3ZKTcxlYT1ebZBtfdlNBIfcWwNViqpWaPuE8JlqhfcwbhScw7Qb8ZLk
         NOwvsEwVTSxw98WYnQ7pODswUZKB+E/pQJDZK9EbYIIBQeBNfJmthvHhkydy5WTkAHcR
         dtw/+TNqzvbBSAhMqRydJ+MOpzOksPQYUqOFasAkYNgZw15saRtPsq0evO6j/GIhCSa+
         daJ8b+j/AIrrUCnSrHt0WEBtKXP7EHspGsZCeFPWT+prxB27nnTlRtb2UyRyaBPJAs5/
         8Ps48qMHlAMe/4sIts/JQtGZUCcOzbIknXSrnjOwD9FUM+xQFirJQg7viWlXrN1a0jFb
         25Yw==
X-Gm-Message-State: AFq9FYJcHevNXzEQNUSceL+XH22MEQEPqROuIxgO/cV9zGHyPcebLGyJ
	/P18d6ROkA46bXB8Het7MOcII22xuIm4nRq5loJcXftc5xTjZ6BWc0ENISwj9jmR7caLbjcKUnG
	/zVPjjcdMcTMaW22EmaftS+WrLiZuhQ2iC95/8pjZnGjuIJWhuKaOE9MigF1pLN++eQ==
X-Gm-Gg: AYBFou3pSSzDWo0F7Qt+D451JzR3HjaQdZzCVhyeKixYSvYITtzXiL/kakFw9KHq/wd
	qerpq2z5JHN1IWqi9FMQKDioWA6oMCXy2ksgbLQNeynwGMHVQfVcFzEZoXRXibs//QqJ+CKjQIV
	zcVLcunlVxH/a9yepCPpcqzD3Y98SZChFrqlKpJA88SGleI49h4aX7YQRDS+bw3+3ZPKPNO/3bu
	lEor/kaWRe7IPL4ov4WxQO+2fKK/KMjT2GL+292H0pqqSTcn/Fht3x6Y6iiv0Jg9BaJtBo3hOe8
	9+LjDDWekzUi0zPvTVFPH9msviFkxr16zD2v+PCvj8sIteNTJf9wNDadYl013zdhVct04BrWN99
	V5R143K7y1m7p5BntUcWlJMEE3g==
X-Received: by 2002:a05:620a:8014:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-93f4d4f0025mr166738785a.12.1792477735810;
        Mon, 19 Oct 2026 23:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-93f4d4f0025mr166737085a.12.1792477735360;
        Mon, 19 Oct 2026 23:28:55 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm4094816f8f.17.2026.10.19.23.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:28:54 -0700 (PDT)
Message-ID: <d92aa5bf-30cd-4843-9a4b-36e41e25a1be@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:28:53 +0100
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iA4wo_F045SwSSZ4j43thVrbM1ZtOB2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXz10YsyW6gK3g
 zhNsjgRUhIqd45yFn7xgODjJm46yT1MSVp7F0UbRRiwLT2nlcJEiMwN+qDowldqkgYPYgAGkMkR
 NrAhTx4jwltp9kGoz7QAp/EMYtudaBb1ORHfycVLfbMZlyELogAASjzZfRkavyHpUCyijFeFtiF
 vI6rtLOfeVr5Mles1c+YXfB4RWdmpTAk70lxQQ2EbXJlqB2Gg5qgoyxj05pNSB6sO/IdEoFpiIz
 2UZgL9VICQbf1KyO6f/uf1Ee72MOttFGNJOj/ay8FdyDCQPlxZkL8lmTmuqHfdXDhkGs5tgMdUq
 6t6jcUQecD02e3aJVda9bFDTRX30VHQUhH7bRl9UggTJsh019v52PzPyUft2nMbvwLeDCn/LhlY
 zUIotYwXmQ18xpqWLZlPk18oew3XrUl7kBSh6Xgmfa9bq4SepAXDtTdy+vGRGgMTenKk+Ad7ZZc
 ut7uek5hj+iDB8X3wpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX/jp6W63H2V0m
 OKR4/JXtEcx5GhmHMSOAs7z8PrSNW/PjWpQVlkwc6gyPf79hEMMKbUcQ3Xom5Z9e9xsjTmUZTWe
 AOKB6RP6YfmiD/M6wKqAtNpCdeuvJC8=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad70a28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MqWYEmV0nRCTjd50ys4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iA4wo_F045SwSSZ4j43thVrbM1ZtOB2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 5:18 PM, redducc wrote:
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

This issue is already addressed in
<20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>

--srini
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

