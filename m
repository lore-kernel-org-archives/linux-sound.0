Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74511238159
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771103; cv=none; b=OdbBkw7hXo6F39Man+BsnxOye2RR8vPDJPjwKFIaDFmD5fZCN+bR4VQWrIcfQqNqL65Ru8zKRMlDsZGn9WUvE/6bp2Alg6kCpCwTCPTkpiZERPmt9CKhdHa6B9CIGJdy840PjkR1EpHBj0ZzNwIk0Sxj5w4QVt+yhHJlsKsc8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771103; c=relaxed/simple;
	bh=kpQewPT27LCxmK3BcXRt28vnIP/phwLcr8/bOcNvFZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWo81awng6lIK7YaSHidAW/uoeE2hikHRy0Ek6Gm4CrOg4VgGD3THlgI6S0u1enD7m4CrNLCIfX0SN1OZflygs7bSi08YZ6PbCEvEVW3TTffKBV3ndfJSwt+MBWJ6ye09kKMNuL9TsKZOALA+yLRuTBzhVEJ4Ra35SDbDyYex0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPBypW4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+e6+jMl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPBypW4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+e6+jMl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3Bg0hv385374
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 14:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CA7jMdzI1nNMGvb+6/Ia0FN6QSfBylQMKjwtc+3Wic=; b=TPBypW4wTTsyfW5h
	gTMSWGwaY9olALo7BoBRjOFa1kG3HzlKAChnUpInGKdfL3cRa9cZPkS7BLwOau/y
	51OefbsjVi9zrvt74orYdeuqhbJ95nN0Q0AyAt7omlzHINBEmpJWx6ggwdSinjY5
	/jf0a5kaMGkYW20YR23nDKv2fN0eVTXWO8x4eSup9dx35/BVVhpub8B/iVuBkL99
	rP8j0r6ljH4/q0sPDhX1f36WFILzPozfnMqEcKrhD/+OY5bZjSgwgsLHgeoQBkPk
	v0DN84sKEpTepn92VIz8jGGynnG4f8d/MipfJjsx09OWxQ0q1qTBA87phFzehYOi
	L0aWQA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db372q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 14:11:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b26ece522so3341150e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764771100; x=1765375900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CA7jMdzI1nNMGvb+6/Ia0FN6QSfBylQMKjwtc+3Wic=;
        b=Y+e6+jMlovQgZ9ZsCi7fCCyRqu+xseLESQ2dO2LgFY6g84/zhRLYPs/te+XFyij2bK
         osYHz6Isyvu4A2DSF3XSRpxwwXVklGg/M223cqnsaQVdxDbTTqXNTLGNE5pmHpJIFrUP
         1odXv/+g6zQqSvJMdjVySMGktt8FtTnks/uSIpfClVuEggio0SjhL5yHjEUdBTIr1jZN
         byY3dT8prV970ka+1UNpinribqmH/F4bGqTRul3kfb7tUmTUJM8AHM9DbWmpsUONFXjP
         QJ97jBLk8FRbyVvu8GAmGmr/wHAGYreDjqaCOR3fmBBlEznsWcJIkeeS79MyRiIzaTjP
         mPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771100; x=1765375900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CA7jMdzI1nNMGvb+6/Ia0FN6QSfBylQMKjwtc+3Wic=;
        b=AAQx/ybN55uqlPkyTeESiGNjExGnhdJRuEPPHGFqbNU0aGG6kG9ahAy6l+wFEAPqb8
         vCGZDZM9nAC7+q/xFX4Z1BF/b01OpknRC89df3+aXtQfIZRVnf9rw7rK2k1DETKVCzr/
         xqoJl9W97YpwUjqCrzBctDhHmlmQFUZ2hWMmn2QSK/WbEcU1lMJ/kgaP5/2ebHZxtFx5
         93SzUuy3dO4BOAlbMEKVEjNGy5QmhQv6nyXPqdFKt6ZBqAUiZDNm89SYaNPuC++bUCiM
         /Y6s7+132GAqbTJvX1G0FjCF93qJKWTGEE+7u6EpOUOg1B44DER9pwKAdmlsKw3Zu3o3
         TzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2k5qiM1mRltvoDSFhjEZepZ/1OMw19+uO2qzfvdUCuVqGvI2U7Azr78M861YBk3u6ee0uUVvfUFZ9SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHIoR2go3pK2rJrqcKij1+zvRd44oXCcuhJLk8GkyR/Teh1yMq
	RSn1d7aBf8T28EBg5ud3cPBR6Wi4grJrzpnKoB71PidlZ9AfMp5xcCFwacDnkxiIvJN121q1Vqz
	fKtYp7MbsPiA7DQWptrRifNaAnMSbWHB9biKOJeHXBaAmmzUu6+MSeY39AWdjJVPjEg==
X-Gm-Gg: ASbGncu2IQsso5iDK2ASu+CYD5RDBSqi6pz+Z8olPNR7BcrNQ4quvnLH0w8ioXAyYPt
	QKu4zdEyq+W3sgGdWYyKRfIlGeCh4E/U9iwOkVkCIwf11npPR1Z4TkE4NQocAZZ5HIBdqwAQDOR
	qXGwQEc4LlS1EyJhHzR4MtIaEGNqfRTzA0db0edvwISirjPDHXkbntQcSEo/E35hNrWvT7iaCWT
	EhYXElYmVAXHmWpJOxVGZf8UsO4nHkcH1b9ABqT4dq8chEZHtOosM8VHbUikjPc2ZQMXDKLNgix
	czbkqCADQKCZc+t49tUlmWFgo25R/x2mglatQ8wwv0pb3bCThYevAyYcIOTHBATXUAFWaoCTCU0
	pwTWTniMIhCOg47fpm5L6MCNCjkNE1i7L3HRa
X-Received: by 2002:a05:6122:2527:b0:55b:9c1c:acd4 with SMTP id 71dfb90a1353d-55e5bf99e0dmr612013e0c.15.1764771100196;
        Wed, 03 Dec 2025 06:11:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHqdEDCfGK1nQRIsrDry3OvPUThGRGPM9LhGWEoLa8yHbLT6MN0gyztz2dCDY+sA/+EPTOgw==
X-Received: by 2002:a05:6122:2527:b0:55b:9c1c:acd4 with SMTP id 71dfb90a1353d-55e5bf99e0dmr611950e0c.15.1764771099374;
        Wed, 03 Dec 2025 06:11:39 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30b8sm39835869f8f.7.2025.12.03.06.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 06:11:38 -0800 (PST)
Message-ID: <1533a073-6605-4995-bad1-c35ff367aa60@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 14:11:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoc: qcom: q6afe: fix bad guard conversion
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203105542.24765-1-johan@kernel.org>
 <20251203105542.24765-2-johan@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251203105542.24765-2-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EQe5hrPiA0NmaFrrhsET3w9UhvnE4H0U
X-Proofpoint-GUID: EQe5hrPiA0NmaFrrhsET3w9UhvnE4H0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMyBTYWx0ZWRfX6mYuoW02t51E
 Hf5pDYMHbyvs2L7LzmlsUin7AldQYEg0khNldjgZaXOev+hztnak9QV4BOJx3vTA31hzMEonR40
 lgERvouYBx7mDFC/su7FPYWHzOR4sbf0wCUKyGI7cLjPgCHTWLtTk5dB4TAbmlhHohVD/zLlxDQ
 xEh6AHO/NUrIbPog9ARcP3QytG+TXix1eE0YIKHLD7+hiq2GxFFS7yldsXcE4UrwEmCWuX2OxzR
 ODdRETs74/1lFPC9Vj/soJNAJ7P8VWCOwoYabXC9j/kbjv5L1bPENcipxGmTaaJMoZKuNyCuiln
 qwSx5iTC2lN909SWfqG4eQh2jmQhKGSNeBMU30lQtVIxgFxEU+P3gA9PoF74RAZSr+oWqF/RzAr
 z2v2A8LippX45nImMTTeFGdiTK8zPQ==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=6930451d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=ItoHvyxzBKEImdxN3jQA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030113

On 12/3/25 10:55 AM, Johan Hovold wrote:
> A recent spinlock guard conversion used the wrong guard so that
> interrupts are no longer disabled while holding the port list lock.
> 
> Based on a cursory look this appears to be safe currently, but it could
> cause a deadlock if one of these helpers are ever called in interrupt
> context.
> 
> Fixes: 4b1edbb028fb ("ASoC: qcom: q6afe: Use guard() for spin locks")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Thanks Johan, That is true, I missed the irqsave variant .


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini>  sound/soc/qcom/qdsp6/q6afe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 980851a12976..0b01fc9e13a7 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -947,7 +947,7 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
>  	struct q6afe_port *p;
>  	struct q6afe_port *ret = NULL;
>  
> -	guard(spinlock)(&afe->port_list_lock);
> +	guard(spinlock_irqsave)(&afe->port_list_lock);
>  	list_for_each_entry(p, &afe->port_list, node)
>  		if (p->token == token) {
>  			ret = p;
> @@ -1807,7 +1807,7 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
>  	port->cfg_type = cfg_type;
>  	kref_init(&port->refcount);
>  
> -	guard(spinlock)(&afe->port_list_lock);
> +	guard(spinlock_irqsave)(&afe->port_list_lock);
>  	list_add_tail(&port->node, &afe->port_list);
>  
>  	return port;

