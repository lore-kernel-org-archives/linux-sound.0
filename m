Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763619;
	b=EreaNEwlRpqJmBKoqlCAKNwETyE1+6vXmcnaicc9Ge5hDnK1GkoityJ/hPvgILBIM5L0
	 NUqotIAaLZEDq+dZ0pxyx3zH/Cb+DuxVHzOJVE1LjV7Nu/mwz8/mozhm18B8qnB2fBF23
	 Dd7I0Mnay/djz9kWvV6DjZYcp8kcyLQF5NPGhAWMsb27zNMDJt0DfsSo/U616FGksCw3P
	 pWr2ZJcMGCBsIyerxRdDI2a3i7lvhtYD1W1I/a5nq23CoqFF40yYVs09/siAiZiN08bG7
	 q/OkzusOUeGzyBKCrg+5mE5sKFcbm5xxDWGSgvIo+Z/tmoTVFSXf6EkXtrikebO/grg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
	b=3c0AdrN6VD6RC9KaYKqKl9znW4kS7U/Iu7BQpZhkhmaiEtZaYkLMv74yx9gM/V4zpC2U
	 lR2sgBNJT4/VFosgOrb+dR7NfpYCZ691Ci9lniwSeZ+3wzDck27hU4dfWE9XPMx3YGdXG
	 EhPZsQAszuppgm1khk4PedPaIL1TEcEyfAb7sYykbzcKDAd/obVWTgvvlR5z+PANSB6wR
	 SfScLv++5ZxGaIftx+P4RfnPg/50Hh9HC+uTxy5EdLcvyKuYyaYfhTr0vFS7c7u99L7pp
	 JEbaiRGrJKRShFVwHLUtghldPLQ7+aHEBrOrxbIuQnYmDZE2BNWVrPKHVDczCyWoT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVJeocg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CB606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 03:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6CB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVJeocg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJ2h3460091
	for <linux-sound@vger.kernel.org>; Wed, 4 Nov 2026 03:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YF52oMGRHzOis719Z3U08BM5
	RBvVjbos10Dfo+I2YNc=; b=KUygXPWhK6QnV5ZwcUPETjrzTSjHwxoMXP9Kdqte
	Mlmr0ySPdmLTdGPAoyqtwWSI7MwlU44AxV3oLIFMipUhxjJd8sKQ3SKyZYg8dZTR
	i4gTkVJs4zrEYEnXf1kKTrKXGDnaBV+0h7LeobW3KvTkoMNKi+oBzLcVpA+xcYAA
	gerZy/mtTYSr8tARK/0YlE1HzLe3aTmKG8Nqv+oABa/cGkh0ObAASpvkE2alADOU
	8gAG7W5zAQI+MjF9uYg5nrokWN7gS2ftNz/Dj4Bx2ciXtB3OK08/yqt6mtBXoveM
	E4CmpDBCfUjVd6QZHb0wu5j923k/HFPxYwcqNgD3kiuukg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bu378-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 03:40:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so320374eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 19:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793763612; x=1794368412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=BwVJeocg9DruIQVdMVCbTmwp5OLxQ+0AHJsntu/B/0667AOd+A4MK5bK6KihagH7eL
         K5VHMPckfbNScyLKVHZLJdl4WyBGbxUS6/r6yXNzA7MUG7N7jrYRsm53DyO7zBORzfWA
         OHSqtpwtfJ4FE9NZbxAfEPKVVHfrULJLvoKjqvvksY6blBofKA4U1Y+49S7d5VfAq4M6
         vNRP04tKFf4IYSwPSk9+mtNabhV/AO7Nv3vtdw2V6MClvOIpA6/KMFFSpbpFp+9LHO2n
         cXCv4boNL2xSj9nJmnI6scmWCuQKBIgb+rRgmiPmWPU6PNTg6ZuuEiDPz6zAW7hhjtDh
         6y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763612; x=1794368412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=EZPw2mENd4BmI0NRMuSg63u6gUsC4Bq4g9qUamCSKtuQcIajnIFM6rQlGWFJhG3Cde
         OQvkqkTA5hMQDRxCwq80u/HHf9BE6k2vn7VgdFVDpW8JtbxEUbCe1oaBcTKspxi4goNF
         6l3kQPeNCa5zSGUu4FElANpxceIja+enNYKWzkVoDK03x8S8/tYmp5Tz0sjkdweOP/zX
         hvPd6q8IqxzqeKAl+fpQOoE6s6ZpaIbjDWxz032h7C9FAgmxIIg7w1VXw+qoTW9FG1DD
         3CHPj0sbfcc1qi9cfaAvfF6pC9h/C5iDeJf7nyXaUqd61inywttGJuAxOdn1MU3/i/QW
         Sfcw==
X-Forwarded-Encrypted: i=1; AKwUvBxCTXWFej0K4V1a9BcoG7mDEHRlBHuMDUnQaS3IlYtvRDwVkLLtipoZPDwylgVA22xmPX7DaNIQI0pA/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8v4fcKiIInFiC0bRjObD7wbNrQeGeQ9+tLpYH8fMKsnKoawTHH
	StbfSN/Cw/KtcnzNNJ45JoEFtwuZIYZ83dm+N8PuRO9CTVbfrM7077WtWTc8dECKwm1ATZZzTjx
	euTIQ0ar2oe2QNG/z5CXeGUkqX2y3FIQ/ht3pE3tMdoXOK7OofbEg+GvKLwVq79foi+CG/xp+yM
	H9
X-Gm-Gg: AYBFou3F+oSczP1G/1tCrjIeTJlSWuvWS2uumC4oHbBDDJU8uiHUTfyOLOyUAwrIuJk
	7wexwW8IG1pJbzi0SjumP9P+ywR2G3OvBQaWM88dg4NpDu65KGp6VlDF1P+DcpHgDCiXQIZ+C4w
	hEGufWcLe5OsY2RT1R6agDQvbg7ngyDtyIHWTuqoeT91YUe/LcN8uHgG8iaRAoxJOVferOnLNqP
	1Fdn6V5UoHRfK+GWudQcpL7Qp3wR/8adQd6KTyL6dY9ujBL0INvW8nqklkDEp9fWzs/1+RBIOd1
	y2P4PZgYtqiIf9pqf/PUiOv0j/TVFQraV8Ot6wFhUD6jlD4fzsNtccy60rvxwX1JfjIdshw9/5g
	wkZFrBby6tcO7Ni2z9R+wiU+bYCUio3WNaaT1oWXE9jq6HKYuiC20hrzbp/iJn30URePrgaffUS
	lTMrFG5TKAnxaR/g==
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041225eec.6.1793763612430;
        Tue, 03 Nov 2026 19:40:12 -0800 (PST)
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041190eec.6.1793763611882;
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a5621sm3160585eec.6.2026.11.03.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Date: Wed, 4 Nov 2026 11:40:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM
 formats
Message-ID: <auqpFdkMkevMrAcy@QCOM-aGQu4IUr3Y>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfX5gq7QNW5VIlE
 0QYnZOKwxAbkFbncNvF7vhXYSYbGzTWcusm/x2zWQFybLCOcDMphk/iISiHOOS/3ZJYLHT3Jg8Z
 /HVEZtxhD954m274ZsB5G1MGL/7D87M=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeaa91d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yYJQ81hfqoN3XqicPgYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kd2wRCr35s0FGNq4bOtZXlgxIilHxihZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfX9EhWy2rCSYTT
 2jh09V+epkiLx2h8t3kT04HYL8ELICApCj9RisUNhBQyMxHeJPVVbE/1TKlHDX4Igmdcb7H5t3V
 c1n80WfFl/Y1uiLOohj3nfJGhOgIw9xhs8Omv6OC/Xzm4Xm3PhnwrcvntI/EBeeoJ5BmF3sBnV2
 SuwzF9plQq8Q5QsffCoEhG0WxZQT+ZvB6uJEJvYzmlNSKUGSlI+m918PgaU4D1g7EYxnWS1xa2m
 NOnyLVNBsi7DpKDSIZKOKUMLwd8ziyB1zQwJu70MrGWi8zOgIUSqUoxywKaz5+eMU6JdTimh/Ky
 qgpjpM0hyrMJRRSxsH/Rw+87gP84ndUkthD21YbK7Br+ueS0XYI5jotQiAh3AhR82U63Rflt5Th
 6kr9bNHpKaU+rqEzxIvqZMAKMsQssmewDV/UXjD3Ill4i1RBtgtdLLW5spKgzNhJKrR31iPBclQ
 ICOTKjprYySGMbC8sEQ==
X-Proofpoint-GUID: kd2wRCr35s0FGNq4bOtZXlgxIilHxihZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040014

On Wed, Oct 28, 2026 at 10:47:20AM +0800, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
> 
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

On Nord Ride board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
