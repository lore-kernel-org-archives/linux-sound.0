Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED6646EC6B
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057456; cv=none; b=b0VKTRPasW+1WR4wWOiZYRTp+sjPFJnOTlHxXfkvXIFsfLyr4Sjysv/FSc/15V7fbhBshj4z7rAXzJ9+/usFmgmptBSMBuNeKT+eTm1kyHeBRUBbq4MLfvdEActw0fRKOy7iCkbYcN+IGIWrGHyYLJnQK7EJQLjqLpTSjiqWeSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057456; c=relaxed/simple;
	bh=9UJP0+UnLhNHthhnuhnSoK+fMhRJRgf6rxK9n9XSqLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvU8U31iHF/Itcs6DQcb2k9S/deeeLgpzAf4rkaARW/DDT5+XAB5qRpeZxi2/WjxRvUujXWJ7jlBaodEDrP9CbQ7dC7nVcwgoE5R6ltIsJtXliYqoFYv3TOIvicWByyZEe/pPEB2B9rlhQWgFrqW+Xiw+MAhhkGYkRxx0svrRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5HJDyHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5QMnbsh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5HJDyHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5QMnbsh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWjG1544848
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=; b=V5HJDyHM1Q9khnxu
	N1nhPlxx5Q9glIy0voaF65Gt+8Ww/mZ9MCYR9hUybrpVlfQBbtw1cudIFAddnOiU
	Zq6eiOgAe2/UDQ8dVmskJSsZmb5zfNr02UdiANc6CtzWhTlrvAoWCne6HIJZCT0P
	Yp8Beg93Zmyp3flBJOkw9BDu/eWWR2gDPilxAILg6jkXSEiBOhmhsd1cDjf1lg9Y
	QW7xaCRkN2aGGko0z/3VAv9/cE6thBAjzhu+4r/yo813dPdLFLjUOSA4/zRssbRV
	6Dou7itgtNGogf7IVnzfxTI2bf37K1IA2Gmk0jtEhb2b9NWd0PvH+sE5eic7VBNF
	8Et9oQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2ph5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 12:50:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so118468885a.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787057448; x=1787662248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=;
        b=A5QMnbshqwe4hkQ6pIzCuH75oFh4+RlgWQ7OkYU4IvFuoDhZ8FAjcJIYdD7CTvS80E
         bhscWnWkhVhmUYBR7CFlrVbJKU4Hx2MM3jD4DViiVcUbDV9dfHvHwtshK5iW8VXNyrJ+
         jLjh17miUL0nqxbDlybDxmMJCqru5518yYSvBll4ul4ujQ6XEn5dcSQpYD+oa/XAK8/m
         daBRNGlkGyRn8fkjv429ZGP2aOCNMUnnhk13QN8duIQqIMzoDN09VmwFFMB+0Sr/GFi/
         QKTJDODHsjxqMRmiTl/ow0M4NzKRsEAyDXwolX1BLbg4VS3/Ts+olETFe57XuKsYky01
         oUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057448; x=1787662248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=;
        b=LAUp+4zNAVvPMqO8V1moZPlzAcIu75axNP1x9KifPEbtbb563aT2kXAUBbdqeqx74i
         e7KhG2P8sT2zhzV6JG5D3eU+zuG72eV0VfzNINstW53WpEWNbFWfU5wgNadRKXUeE4AF
         6y5Ig/LLtACGC8Qv0osHNG4jDSXi+DVriATWuXIz4wbV0SeY1Iz6CWHXvTyAwEKbIST+
         5J/MbSraR1nP1nWku7SsgrCIpeYhx7aL0W6JjLEGserRFY1UPGW5Vx6klW7FZEC3gVbQ
         x+2A6SepWdYiqa4DEBrlOlf4zVF69pURsQ6lkqnBp5BGhZ5gh/tb+HZvsrzi57JrgaHN
         +EYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp71HNjGQ4l50s4FTRH2vT1tsSo7sOsF3Dc5JbaMfOugCuSg7KLZDxjPOFCyG9wrdbK+SRyhrYx8z1v7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEguxu+cCASwXJyoxnWr5ik8yTDYYU4Gos9OYdARzp1uBr0kGY
	h8jpfXr8CkMIkU/9umVRl/+T7HCxSYA+FCDaBIe5FgpEVMRohsdhF5YjGaImEKOGMvqdOtd0A4y
	LOomuD2FAb07+tqgGGpbBMOn4P/7bAj3wNelDviqNQGjZ0SgS44GfecQlzJgHnVtC/tItvd4ubg
	==
X-Gm-Gg: AR+sD121/zN6gdWAkIi5XTH+C18TRSZ3KRAa+n+z4efiGOQV/vXIdYmoS/xhxAJlXCk
	OOlz5jqd3OA2jLiEop6VmQhvX7LEqB/VAokuzJlrjWgAB8YJs9X8GtQrpOl/hxz5hscZss8g/UU
	+W5G2AOkC890jcIOZuCrv9VZ+ru2err9ozQKl1EbTveKipphaGSlaYcvYWXr/K5c3deaBZBPdWr
	b5/r5ZHB24mlIAggv1TONnqLdmJLQQsIInQ6hsXGiNbeF4G/VdN+DQ9nt7aYV6Ey3wcbjvXRG+8
	Zznvf3yBF7TU2fDb29C5RRC2H6pbQ9lVsezedVjC90m2wXK7hnwhHdsL1hscd6u2UJRiFnVbWHp
	ZiAHmZu5H/rH43x6O2/4/vdKr
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr243320001cf.3.1787057447625;
        Tue, 18 Aug 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr243319601cf.3.1787057447138;
        Tue, 18 Aug 2026 05:50:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm152538566b.50.2026.08.18.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:50:46 -0700 (PDT)
Message-ID: <84be0a35-b088-4ab2-9111-80809d6d2d53@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: match downstream DEF_ACT_CHAN
 encoding
To: casey@samaritansolutions.net, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260807-slimbus-def-act-chan-v1-1-fd542efb3d30@samaritansolutions.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-slimbus-def-act-chan-v1-1-fd542efb3d30@samaritansolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sWIOu6MxSaUQuAFQN55kQEbSmj_0qu0u
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a845528 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oRWL8vWFAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7S0yl7ldlo6rjceDY6AA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ZSzuMzu-C871e8vGMv2q:22
X-Proofpoint-GUID: sWIOu6MxSaUQuAFQN55kQEbSmj_0qu0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NCBTYWx0ZWRfX9mI1w/8/P3CR
 idQ4UlO0cEXRHvYd3ypjKw462aIvC5vpmUNE8ojEE4eYgksaoPqZytSDGAsAv722cNPfqKrEtpm
 HKkzqXYhwigTImpgc88wJQ1yJ6Z8n+dH0lz5xw+FpFraL8YkL5qOb6ac6xXRXS9hDtcKxdVsDtL
 JTpJ9HqSjL3qFOnSGKfTRhDGjKUyDrh6XJVOGB+12O03Hqrquvq8fSAghp38vrRxl/1ODImCzTU
 Uvw2u1ghQ5ACWSABJ9y3Oup2St9MBCGZ0fBTmRSDk556WXIOMM+UrberJ/EiWJL78oRhb2UVnuh
 jKsEtKAVU/edEZX8rngMLAqTzaAoXDfejMYk7YqbXy2Tzm+uVi7QRYJTm0qrqT5Sp8KrwwB/w+T
 UX0OtiRWBI/khLHnVPE220hRP4QGQUnRZjRH2LE4ONzb2WCcv2elPlLjfIriZc27PkJJ7VChO4g
 +Kv9sswUfoDx5CUU7mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NCBTYWx0ZWRfXxrLsamRdDH+Q
 SFSj8Ww/HRJvMlZaNow4TnGaz0dn0w/cMco5zykGwyUJbctFGceMmKcHsW5nBtVU5s5AsCisIv8
 6Xg6aXQBdaYW6KZgPt/ouRmr/j2V6aM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180094

On 8/8/26 2:35 AM, Casey Tunturi via B4 Relay wrote:
> From: Casey Tunturi <casey@samaritansolutions.net>
> 
> During my investigations, and some rather incessant cross-checking of
> blueline's SLIMbus path, I found that Qualcomm's downstream driver
> packs the first DEF_ACT_CHAN byte differently from mainline. Bits [7:5]
> hold the data format; bits [4:0] hold the five-bit client number.
> 
> I changed ours to match. It made no immediate difference on my own
> hardware: blueline's current values produce 0x0f either way. The
> downstream layout is correct and should help devices that use upper
> logical-address bits or a non-zero data format.
> 
> Fixes: 52490169cddf ("slimbus: ngd: add stream support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Casey Tunturi <casey@samaritansolutions.net>
> ---

The semantics match, I don't know what side effects that may uncover

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
