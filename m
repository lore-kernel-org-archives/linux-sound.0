Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441B31B810
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 05:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864139; cv=none; b=BDu5NYgG9IDxQMDBQE+Cz+KtubWHO31byay7jDDDRpoCKTrEqsz6zT5uZrcGULNeQDIrU7f+UdhZPzk5Xc/ev9tqrJjDGI5MGr0/6v8zlusbV2dFg6/1V+2KwL2P1dTuEy4P5m8Z4yNYiQg1mdUcnzLkEfnoEfPnWQ+HKrnEPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864139; c=relaxed/simple;
	bh=FcmUXUqwY50Hy2iJ/OWPVRZpes9f4U+aKevdmpp3QWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6ONKtfeOcknlCexV2K7uu9Bcfw2w2HzIWk8yuJ2H+izBCf401e7ctWzRR+ckzxDKSBljzZfWR3OLd3GsJnHm2p+x4pVytxjkFaKlkBTEbSzaB2GlOmB83M/wvaLkjFzQFE377Wr691wmWaf3HhmESwR/tMVrkN4u2JygD+QnBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpWvMmw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDluTBjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpWvMmw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDluTBjC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG211Y41131493
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 05:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=; b=gpWvMmw61flFTDYa
	sb8MCq4/B0ybI3XYRFxrtIHAO3RT7bRx/onz9RfrJSKVYP681xqHIjO70bN1Q6Zi
	bL+0qlPEfMjJJLxitGgevE+3Owu3oFllVfbfiq3k86OLUDF2v6NTSGaMC/yNqbbw
	N2N/XNPBx1ywZaLfRE77IymWERiiYdKx1afLYZG3fAdlVxk4Xjg8KqcjpucKIkPo
	YpGXcV2XNSVSB1jZDAs3IDlny/tlgA6SC/yYG+biSnnPD5H9MsctdtVIUmQC73WL
	/GI2+EiAP0Bvw0+txLTekb54IXfKfuL+GSkMGBxurQKAIVSupEzLGTd9VDuM/I2q
	MXxH3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p3uacwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 05:48:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eff973c491so96636431cf.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 21:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765864128; x=1766468928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=;
        b=ZDluTBjClebgPou3aW27N+f+ew4rZ2ed/nSylLbWIjIFL1+2wTk7XdJkzZewZRGh9f
         eEVG52bSRvqvkBp/wWhI9RA3NKj6ye6fgQXPM2LNcbQTrT7m+CCXUPL7HOQBOi2psvgS
         2DMrt2NQ6bSmde4PwvxwTpCWSTE+T4h0II6VXcA0xOibI9TcjF/00DzEYvhfviG9G8X/
         fB2bIRIwTmB0tsWP4dsDcHCcTDnECnwFjRUTKtLI4x1wOMzmpQeGrI2T+RFck9bzHKfU
         ix2uNxJFlkmx1XlsF30o5/ZPVpV8xMxXuvn1JoSAZvjliYt5XHA64GuNSEjDaEcudm5y
         wDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765864128; x=1766468928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dgRg7+lylSThVvRyr3vmwzyI3Yjx1mKAez1lMkqZik=;
        b=F0CjXRiNxfGKnv5b6ZFDklephjxMlhjzoJ5wulzrrDHx7SkOKHh3x77TvQCyjeuFjO
         kGCTrrMsl7gi4e8gX7nxOcTVF8dQvaJUD0YmLWXpeDrcYzd60fG79ntSul5PSmLcN2uU
         WYbJhasyoykZ52BJkaIH8+l/0x547iXPEvytr0aXxaq69NtoBN/G24PSTI+qs5xiOotp
         zezptxCDd6QHpPtKBEz0LQfPQYdv4l1jGJtwxx8sUVUar9MyRsvn6OqTIc73gw3KzvIf
         w7nWJu/+HteodVVYwL705Bg0LLRHi5swJabSZFxZBJSLijgzIU3giqI3Dt5AxoYUtq4M
         TQLA==
X-Gm-Message-State: AOJu0YxNUAXCcjI3YjQdGFh3SlGcHHdCi+R0kDP1QvfGdrVa4Y+QUC6l
	TjYB2gMfi2mN6129ldtbjK4SZGTyLUCG20dKJht/9u3wtLvr2SMK4SqJfDfhZWKakt3jdGWw3Im
	TAIb9Nmei2CFgWYH+cfWhP2GnsyldjM8hMbMf+KuTq49b0jAVMAPeSukFAEggnM8+oQ==
X-Gm-Gg: AY/fxX5ejrE9SEjX0rzho03CEkQPSWMInAysH6FyeataO6mXKcXMGD3rGtnMmB2HJIT
	KfLEWTnHROp6NejgtsnF1JScrYp49uo59g3GqTtYyP/vHMV1RH2oU7MyiZEWTSqyLCLhBW5htG+
	SV60vfsD90vSy280zwQPkuzCG+AcqtY7s3HwXf3kXyfm2gRLrPmMd/tpAeHaHFx9ohMml+b0zVm
	jrWp+Z9/tX/dEs6ZJyflWv5Xkw1ApmuaVlT/S+UO7d1K3YANUxWFOOR16MfLXNvWDgtvXA/ciAI
	s2ZebnPTNd5Bxse+0apY8RUMB0z9WkJgtxMbxAR0JNPNpzcEkALsOiYaz0tBe4C6Wb9fzLAeL71
	OyiSFoVC00L5+k1QxRvD/GAyi1DSkzCSuuXuW
X-Received: by 2002:ac8:7f4c:0:b0:4f0:2305:89d6 with SMTP id d75a77b69052e-4f1d06255afmr202809071cf.80.1765864127879;
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXxmE5ATyDKU7eIG5Eip4bJ3Gifs/dx1Uk+JAzgABa3IqwDFWQAJMkWoNdLgnqHrkhrBqSZA==
X-Received: by 2002:ac8:7f4c:0:b0:4f0:2305:89d6 with SMTP id d75a77b69052e-4f1d06255afmr202808911cf.80.1765864127464;
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fa7d19fasm13360092f8f.30.2025.12.15.21.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 21:48:47 -0800 (PST)
Message-ID: <fb7ea0ab-d75a-4716-93dc-08545fdb1677@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 05:48:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next] (new?) audio issues on Qualcomm sm8550
To: Alexey Klimov <alexey.klimov@linaro.org>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
References: <DEVENUXSAUMM.1DMQ7M0ASXSDV@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DEVENUXSAUMM.1DMQ7M0ASXSDV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0NSBTYWx0ZWRfX9AbcNLiOYBhL
 S7DK2AgZJq0jZgZvGD1lCx0U9cRqCibE8iqMfCl89zcWPV+Xl2obTS+GI5U7BI6mohmUgsEt/MT
 JZtA3RzYbEOMXhaHcR8l9yY3DYldH4Z/zKimJ0xysrag5An2kDQnZDX+oo9aKGQqkWHAfSrCqzT
 p01UW4qOLrP792WgzA16but8gTYZdxV5nlT7Fn8ZAU3OUFrprDJw0W5VsaYwirWBPTVsWX+QAvL
 lj5LTLY0Zg+rzfYSQpUZOS6nvAuhWsW0Y90vtocnMQPVTsOkM+A9YB9l4XxhO2PYmTZDmSmJIci
 YWMlqZsGdta4UGdSFa84mum6Dtp4UYstEQ/+lX4xDGo/h/9093IirgE4RK//gc/yCB4dYPUxB5p
 +R4tCoFCFSeQu7apfJ648rR6Ig2QWQ==
X-Authority-Analysis: v=2.4 cv=Q/TfIo2a c=1 sm=1 tr=0 ts=6940f2c0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OLL_FvSJAAAA:8 a=p4JCkcoLdCBRvWdrFTIA:9
 a=QEXdDO2ut3YA:10 a=E0o1KwfEpQ8A:10 a=ET_4v3hgxWgA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: 2gZTp9PoWCfTvb2mhGXok3PujZkX3mGZ
X-Proofpoint-ORIG-GUID: 2gZTp9PoWCfTvb2mhGXok3PujZkX3mGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160045

Thanks Alexey for reporting this

On 12/11/25 1:01 PM, Alexey Klimov wrote:
> Hi all,
> 
> I am reporting new errors here because I soon lose access to some devices.
> Please let me know what is the proper way to report this if this is not the right
> thing to do.
> 
> I've started to see new errors on sm8550-qrd for a while now with recent linux-nexts:
> (also reproduced with today's next-20251211)
> 
>  qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)
I think we discussed this briefly in this thread
https://www.spinics.net/lists/devicetree/msg837844.html

This is very much the expected behavior. There is a bug in the dt entry
of 6d30000.soundwire controller, which missed dout port in frame shaping
data.



>  wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>  wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 (ops wcd_sdw_component_ops [snd_soc_wcd_common])
>  wsa_macro 6b00000.codec: using zero-initialized flat cache, this may cause unexpected behavior
>  snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
>  va_macro 6d44000.codec: supply vdd-micb not found, using dummy regulator
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
>  wcd938x_codec audio-codec: Impedance detect ramp error, c1=0, x1=0x0
> 
> I also think that changing volume via 'WSA_RX{0,1} Digital Volume' no longer works. It used to work before.
> Impedance ramp error seems to occur occasionaly, I don't think this one is critical.

this is interesting, I can try to reproduce that.

--srini>
> Best regards,
> Alexey
> 

