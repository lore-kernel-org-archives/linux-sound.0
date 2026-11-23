Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455758;
	b=BcSnJQUq0H24AVVqubNqyrqThJOBDGy5rYk4sd68FcHNs8Y3AHgewZ75nJiBtPtf87DM
	 T4L6QIiAauDIqBQKJCKHKDUTttKfEnE09f1tTZArUNU3bcuw1MXpA7oun/gLCKRqZOejf
	 EVVHykDmzQpyod44qWqLi4AJYoXunGK3+ri6Nf82q4kqXKkWtL0F/Rnqi/OP7+D3Z5HHO
	 tEiQ7mBZEMUSd083mJh9ueAgiuf99xM6dL70zaF4aCpHri56F6IG6fpCm6z4XLeK+Bz2D
	 NlwAUfN+B+sMLNpP9D9QwsSThcs0/VA+Z8bmtzPKHkjoXjbvRjlSppRWL0JscJBUK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
	b=g84M3YPtF72OUnhK9WMw6vW+26jyxjL23y3HUo9Kx8hMvm/5/3QICveN5/6Q0HttViG6
	 O/g8la/S/S1h0zNCVas3Ir3pRX7iptygMN1d2gc8E3u+VYFLM2kIozUcr7s5VOLP+Yazr
	 67Sgm4nfP0rFofi+ewy6jTt2C5I6mR/mNP2bsBsht83X/20yXfZvCPz3pflHWU1pdaXtB
	 EB9cGdR9MGhffHLVjVT3f9i7dSGiDBLT2ux5pF/hBfN8e93/uuKVmQ0tNNxI6vyjS1mSK
	 PXwWhr6NNe+sjnE5JFuML3TqHlHiW0SYPhC/ZvHjTf06Kd2sWkfC6YrY3oWY1D5HtdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8UhHcfP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKq3uA4z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B60606A333
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B60606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8UhHcfP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKq3uA4z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGuI62486557
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=; b=H8UhHcfP5snrnlu6
	IDzJWEkY70MtOBqbSg1CCjdIAd7fiLaAdD9K5ckQk06NVI4RchodtCMAt3Oyng1Z
	uWElkVQW76hWmgnwkYQnYLnEbJKLe2vCdsOO+RiA5Ovt/YiyJB9JKgKip6eytamJ
	7mkE3YGVo0AvV5v1ZxI5cFai66Ebngp/ifAynHWAzF24ET6dv6twLhSLvlwa/5uu
	Ke2lMsJnXn4wMtdTgpHkvtEnanAEVu1uZh93acpUqeYV0KrBCgPiniz8/dRLbzgD
	Fn5oClkrxpBqxEkDF9r1BJFLLl7Zj10aHPf6ExGuzX/oaChXhI8scQdKemvJmDUx
	4UElJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02nm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:42:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso52857585a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795455755; x=1796060555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
        b=dKq3uA4zHwehrbrm+pi6IlngEGQ5JmPiqQQAEkX3z0asFkmNJFWjIVMefpRY4oFjal
         JYvP1xvX2eUf7TDvPRX1+lBssTC8LbfWey9/xJK52lCaF8v2Hp+vJ6+XCTK1D0GY+H/B
         x77nyrhWVz2sW9GdEqhrdaAkqfzC7zRbxkh5HxDH3ZYv/KGRr5qG2zmYaSOyTqG+T7bc
         wO7f4CzQl8I2Ss5SbhTaX+xJlNpNdiLEM2xJnDGwKc5/hh5rai0kHwxexfludDM+KrXJ
         4U15k0/amNIblfUS7V/PqOBi6PJ1BA0cxoLnD4yu3zvT3W2EMXEDn9ctSh0fIoJJnEXR
         W6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455755; x=1796060555;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
        b=O0/vo7wmqRci5zs5LQXGENS3az/HO/MsmtB3dB4QFyRcGsCWBuUIUldM8PhDYWUFsw
         cA45wOkFgeyFoAzZs7OhdxYtxBs4zd2RUJJB6gfS1IemxQVZokFSwP1MZZ3QDR02diEx
         JH94atABw1XLuWOpLq/ogEgyyOvD8/tlZ7DXH9Y93JyoRiWVFRkWHd3PGWedYg0fCo8r
         28/HTVUbwF9aq1v8qE8rRlpgbXRQzNLczBSYOzD0snxGIJTP3CRN2jM4HXrnF7Gzzgsz
         ZDpd/j5Qh+sXT3Bsm2eh5QHvn4OUWHTjRy8mL8tBRe+tbsDL97K9mEypS4TS2u2oxUSN
         oYaA==
X-Forwarded-Encrypted: i=1; AL+hErEloXALDTREVUTN0xyvZcGebIcHJEsQiAwP5KUcB9Hh+wvnT+BJ45DisNWYPJ6gljnL6nEiJF+EhqUHwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CgqfHbIYLkYFbaWwcercJnXCesDldo4M3cNkHUKgd+mK7ghM+
	ICNyjukgccfz+C64ECGcaH/jdkbUlxgjuH2xUbLXiKopQM6Jht991s44emqsTvFUzYtP5jVkyWj
	vSG/EEPMML52nQJMxyzSgvkN/58U2jq+QvCYy48kN7JhzA2iboOp7V/Wj05A5U0XVMA==
X-Gm-Gg: AZFdTZcke53YOFCyN0M39S6VmJjVu6hLVmQ2+O37AQRvC4CI7PZE+q7eSav6t1MnHWB
	ii7X/XzBYlRN2cPB6E0SKBl9ZOah1hmyFVdAF9mUAKr1w+WkRptqAB7cX6S1TAm419RhrRhcZI0
	U0IeTPLrgGXH1bHVtbKfzcik5ykIZ9deHwTjFXlFVGes2LIUm21hpd4Fzeriqmfswf2zc5WsLZx
	3HS6badHrvtTDCrHM0+zlt3VhD+QgfAn+Xl+RqmtymPmza780KxRSW9tlkvkqyOCYZGa8pLxeMZ
	MBbcmAXojmFchX5EKwtWHmq5yd7E7WGDNhb3YwwCYNe52kN+U5ieYBEDjzBHTcjthHDOtThMuXN
	OQbB9GuzVxPyI42zh2O/6l5yxTL76MBXUCWxchUf+Th1oGxAzvkT6Fz2VeKmc1M0xpDAKLz37pB
	isGA==
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr1937653985a.74.1795455755367;
        Mon, 23 Nov 2026 09:42:35 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr1937649685a.74.1795455754714;
        Mon, 23 Nov 2026 09:42:34 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm571943555e9.14.2026.11.23.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:42:33 -0800 (PST)
Message-ID: <90f6a16a-2d50-4453-bb3e-b4c60f4d2d82@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:33 +0000
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
Subject: Re: [PATCH] ASoC: SDCA: Combine width_find_mask() and get_word_mask()
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MCBTYWx0ZWRfX36tFGkdDC+QX
 0T5eUY1fhAv2G7xoZzoQ2jCA6oj8u1qicnBefuDeQVQ+PtM9aJ6/TNA4npYsPaX/BsjR85+IHT3
 FYRPYQDj6ywzna1bAo4PeWvc+pjGFDaS+Qn63cBI67BKs40WRpCZ+HR8wq9RWJ8iqcZkFcR3zF2
 o1x9Kv7+wJ6cPCJW7X4e2mIWlqwm6Hs+e6m8svTZuF6h04MDuhn91mnRYxokcj/c3me9D3DYHJv
 WvxCjOf9rPb5c9oeCNJpQHyEor3XfLxB3OnpZzgFF472i5nSmBX+h2pCImza8ALlpovmiTf1f9i
 1NyUzEtoHY5CZw0BFaQ8yH7AAbXcTURL2kfuPN5BCPQKD5bMmbq+0aYbmTTdtMGoJb8IVbV+aV/
 Ag6wldvmtWtHkrfN4+sTWJf3ea8aQ0k43u9ijDq3SkRbICKthF8Ge/1yQRcft3r5mjJHDsot5M2
 ey4v27T8vtWO4jJ/f9w==
X-Proofpoint-ORIG-GUID: 9PWya2HV7CZY2KdcS3SH1FCVlKFO6udU
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b047b0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=eLmm6ZdPJpfIBFh7QgUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9PWya2HV7CZY2KdcS3SH1FCVlKFO6udU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MCBTYWx0ZWRfX4vX6RNc4QceO
 i0C1CqbwkNJv3vRWfbX1rPudmazqHVjSN6RBP1hSwKx8Ja+dpTWLZWg1jJZO85A2b/vh46pZOmm
 mhGEpgdLlNUW7WgphykFxLzo1DSJjz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230070

On 11/23/26 11:52 AM, Charles Keepax wrote:
> Both of these functions take a bit width and return the ALSA mask
> bits for that width. Remove get_word_mask() and use width_find_mask()
> in all cases.
> 
> As part of this the function is expanded with a few additional
> formats. The big endian versions are added to the mask, for
> the original dai driver users of width_find_mask() these would
> be added by the ASoC core, however that isn't true when used for
> ALSA constraint users of get_word_mask(). The 3LE versions are also
> added as the memory size shouldn't be a factor once on the SoundWire
> bus. Finally, support for the unsigned formats is removed relative
> to get_word_mask(), these are not commonly used and the SoundWire
> specification has no obvious mechanism to indicate if they are
> supported. So better these are only added once a user comes forward.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
Tested on Snapdragon T14s Gen7.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/sdca/sdca_asoc.c | 56 ++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
> 
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index aaa84156f20a8..d58be660ced7f 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -1214,19 +1214,28 @@ static u64 width_find_mask(unsigned int bits)
>  {
>  	switch (bits) {
>  	case 0:
> -		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
> -		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
> -		       SNDRV_PCM_FMTBIT_S32_LE;
> +		return SNDRV_PCM_FMTBIT_S8 |
> +		       SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +		       SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE |
> +		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
> +		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |
> +		       SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |
> +		       SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
>  	case 8:
>  		return SNDRV_PCM_FMTBIT_S8;
>  	case 16:
> -		return SNDRV_PCM_FMTBIT_S16_LE;
> +		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE;
> +	case 18:
> +		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE;
>  	case 20:
> -		return SNDRV_PCM_FMTBIT_S20_LE;
> +		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
> +		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE;
>  	case 24:
> -		return SNDRV_PCM_FMTBIT_S24_LE;
> +		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE;
>  	case 32:
> -		return SNDRV_PCM_FMTBIT_S32_LE;
> +		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
>  	default:
>  		return 0;
>  	}
> @@ -1510,35 +1519,6 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
>  	return 0;
>  }
>  
> -static u64 get_word_mask(unsigned int width)
> -{
> -	switch (width) {
> -	case 8:
> -		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
> -	case 16:
> -		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> -		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
> -	case 18:
> -		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
> -		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
> -	case 20:
> -		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
> -		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
> -		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
> -		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
> -	case 24:
> -		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> -		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
> -		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
> -		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
> -	case 32:
> -		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
> -		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
> -	default:
> -		return 0;
> -	}
> -}
> -
>  static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  			  struct snd_pcm_substream *substream,
>  			  u64 *word_mask, unsigned int *ch_mask)
> @@ -1564,7 +1544,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  
>  		if (prop[i].num_words) {
>  			for (j = 0; j < prop[i].num_words; j++)
> -				*word_mask |= get_word_mask(prop[i].words[j]);
> +				*word_mask |= width_find_mask(prop[i].words[j]);
>  		} else {
>  			unsigned int max = prop[i].max_word;
>  
> @@ -1572,7 +1552,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  				max = 32;
>  
>  			for (j = MAX(1, prop[i].min_word); j <= max; j++)
> -				*word_mask |= get_word_mask(j);
> +				*word_mask |= width_find_mask(j);
>  		}
>  
>  		/* Only handle the number of channels for constraints. */

