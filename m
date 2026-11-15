Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738397;
	b=iXjAMklOpsgb5ap3dHlf3GNxptQn6TT9Wtg585eK6hAflMPGmYwyL/+hjUWW0yfF/OGN
	 r07RaoH9een0iWPulkF+NCmpxlT1WMBrlGTzEIfl08mxEmCpwtzN4cv0iuIQ5dAR7jjl+
	 OOuJzfTd645Dz2ECFOjDk1CALC1sTy4sqV3DdiBGFADsQFN9wf/5+1d+D1y3eoRheiCpv
	 pAo0UOoIOnEzYJD/1YCwdYNbMRyQ2Rk+IVB/f4ZmY4c4Nbsc5dwnxfJtnjPnKMdILZIY8
	 4JKRQ38WU99B92k/1rM0FETEG8jwD0fMfRAIvM8jIKcNweLsB2SI/chXx8SyMSY+iNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
	b=bzyhfhndc2kBHkrAaVXPfKrxWjyOVDKYByNIvjLGGUiqM7rGTwviYKb6rnJpDj9c45yF
	 6VLnjAzsOV4AEtGIpDsJX1o+8UHIud311/XLAfpVmtDxQxQts7WYsghtyFi+g+g86G9em
	 YKR6JAV4ivr2eg53vQEsA93oSALdoxfAkggAmPJGNqhISCtQcWifx5aYyxKR9WuO2iExo
	 KBKryG4gg7KPm42ygPhTo+yHmjVGW3UTqvmga9dYLDU+VD57vyap/xMAUCkcP+PDxRRCf
	 48mtCZQoVn6Vglh5bparCA+NYHOGLWAO1P+OpPXFhzxaO914k2zZxvbXafb9UYh8MhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9F606A327
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C9F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w3qX535855
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=; b=IqoDqfmEfPlYsN+B
	QEw2OGiWzGO6Uo75ZYhHyuJ5NL11ec4jlA7Qe001Urb1gDLHLezi9dHFICd1qd3L
	ZyIBv/Wb2zJq5wvzTwZJszEeHuQwnP0YF82pwn+42eTIbpiVwMBmqzNePE6kw9va
	IVK2dM5DttPCPOrCJOiZqJ0mSu8NWC03tx2i1IrVhiQEEkZPUWJ4i63OSCZMfez4
	kcV3rjTlkthPsgP/7fOuFHE/My4nC9XAI5QB348KfzFEKKP8v0OeVKhUpZDITPjl
	KDEVJGGh9aN0ngz7aPnP3vtIRNg/hwkF7oRaH7weEYXIAAauGAvTwCN7uLi6ZAnV
	TpEw/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcaqaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131b4eso186950685a.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794738395; x=1795343195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=PURHWbpHKaBvXQW4MqaEOmHAHPg5gQlLrp+tgRZ6U7JKl0vjTIbGvTHpeyiIsgUDkg
         ofyQTrVSPAXRjsVtticUqSlyfCkJEBHR6FtbCYXzOjk1/kknlco5kSBqirh+Dp+dmMkN
         5XTk84nWzZ1DjYSsT6AR4giaYj+qY0IvngZJI1aXar85gjwCn8B+2IDO757gLeIuOOt3
         qT1mxIBu/UQhHLDyn1XFHTdRnaA/zD4jkk87OBIdmhR3alpJk4EPIXWvKV4h6rhvwv/1
         sd/ZIBPakNcbsHFgJZcGJAJoh/9/+gEXqR5jbWBsEiburK/6rSfbxFE06RwhNVxt7rns
         wtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738395; x=1795343195;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=rnx6oPiSmAmbnM2OzSO6vn92dwYp6LqQ3pVWmCN0Wf+im+j6VU78Ic8xPoRkhlSrsF
         F03dThV0j2fRs1fm1rDAU4Cv6a5IfDAfWZfatVseNwDilSbKvaD+PDOJxEvwojr1t67L
         xxY1g3DNs4vwj8LLW8k7eTN8uuatfetcI+xPdKzfSctCXwyhLpDt5fqLK0kiFZfFCRyB
         zkeosmp/BsLkOvXzs+EuXZhw8/ArBNqqxWQ6C/IKCeb0ufwfHwtIBYt1P/JjL+/EwH2v
         ugyd7B+3ELn2AEzAQSYISjuR0nlnyP5ZINjmPRE/EWw5AWXpLzrHCeCRy8Swda7Zh0IC
         n//A==
X-Gm-Message-State: APuU4Z/pIHWqogEVS7TuheEkK9UkD0owx8M5wi+ClfOA2BJN00xthRfd
	frSayf/r/0lJsPzhRygC1Lr0nw5a+0yx7jki/AAUaKMYzVWrwFMoLxO5VKYj90x9buElLQnRo0W
	20PX91MbvEVqDixWx2/6I4jCKJmk3tSO7y+8T2bJFfEGaYNfxKTA77lacifCxNTYqizJuYsh1RQ
	==
X-Gm-Gg: AYBFou2qS5l7VE/adlUPOvlh6W5rXooPKYzSlSVYnPTZAvW4BMNiGqKCpI3SUk/A6W4
	QRqxa4uR2BWK1RtFLpyFfcfjE6QDNqXaz7/lzxwxokSKYDypX58+lqDpK/5LBbrIg0kDbkcdMBw
	4d5uCHiWxqM1Wjw7oiNXIB4DFhX1bFE7SlFdl6+Sj1gQkHWKSQtZqs+0KCfVpqg6f/8oK6+EvXr
	tVpyT363P0diIfeTMxnTNrF3hJiUp9spAgRkQhrE5xNPzLe3uUJoRmhC2W4k0Sbyx2B//jyIbXx
	ijKgrN/nVvsWSBIgsx4XlZfMC/Rgfbt9i1IrLL7POmZ1jjxB404lASLUnSOLDNkkFFitEzSmyNA
	zMOrpw750Ao913xTht3iSG8LhVpmSAnreINAKMI3bOY3D52iSEQeWRS5DALloqNCm7NSMsjaVOV
	r24Id3myDJhAGn2bGhwQ==
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257649085a.39.1794738395272;
        Sun, 15 Nov 2026 02:26:35 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257647385a.39.1794738394911;
        Sun, 15 Nov 2026 02:26:34 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b236e0sm297753666b.20.2026.11.15.02.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:26:33 -0800 (PST)
Message-ID: <c97bfa2a-4f38-4a59-905f-a590dd018594@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:26:05 +0000
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
Subject: Re: [PATCH] ASoC: qcom: common: report line-out plugs on the
 Headphone Jack pin
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfX0mcvSb3K1gUe
 wKf+mzu6jr8bt4MSGHY/zffaQGAULKxpYf6qqSTQdiyENiDEPg4pqbGVaSaekKpOeDBQmaL4JoY
 C7p0u0wnkv1NCAET0TubTTsxNPqdEic=
X-Proofpoint-ORIG-GUID: dKpoEzEg3iUejUUnPj9GdKR3Tystauf1
X-Proofpoint-GUID: dKpoEzEg3iUejUUnPj9GdKR3Tystauf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfX8kwIM1XU6fcG
 z1ykdPgHg1J21eSBu3IaXMAB2HaLjpa2HZ6OEMeXFOZPHDhb1hCH6ltdqRdiOqrngUOrcO9etvk
 +nmHNecNEddGtvkHQ+V0O17HAu23ELZxTHcyF+rkT54XdCQ99pEie55YjQZ3BzFoYm+tRmMCRqa
 BC7ICq+vgo9LbcFjKebQWHl65YRArZdeRPqhNEy1s9k+lnmP8dbmz4vgeasbmoZHMBr0EF+q8S3
 Bcmfg6bro2HxvkGEDTNyWCqiMipcAI/KSPYbsnVccBfTATY9VY/Mm/K7WUiuT9WCGWLRS31f4uM
 GbDVtVAasfbeS7wKqyeJmX0QWdvNydzgF8crM8EywId6gcvyjISaEtNZTdbO0++WyCmiNCDg5nI
 jSFmmqUaw+4OA0c4gOn/c4ZDT/KGD0EX+mBv9ohx0wfjwX7GQd4yY/hPSeiPyhUcFvE0ySzLKDJ
 K0XVwKmZ7CN+1iQiUwg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af988dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KsNVwHy3fz-HUrcVWHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150041

On 11/13/26 9:45 PM, Ingo A. Kubbilun wrote:
> The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
> on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
> "Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
> control stayed off and userspace (UCM JackControl) never switched to
> the headphone output for those loads.
> 
> Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
> speakers measured at ~20 kOhm per channel were reported as LINEOUT only.
> 
> Developed with the help of an AI coding assistant (Anthropic Claude),
> which drafted the changes from the Windows ACPI tables, existing device
> trees and test logs; reviewed, built and tested on the device by the
> submitter.
> 
> Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
> ---
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/qcom/common.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 5dc954dc1cb2..af5cacddf67d 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
>  	},
>  	{
>  		.pin = "Headphone Jack",
> -		.mask = SND_JACK_HEADPHONE,
> +		/*
> +		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
> +		 * e.g. active speakers; treat them like headphones for routing.
> +		 */
> +		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
>  	},
>  };
>  

