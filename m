Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1579494812
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397441; cv=none; b=VgTPkmTxEAB2pG8tzDOgdWCPA7lYiFa+NnLnsekSw0HH6tt0WBK90ZHUCpIy5otEaewSBlOgN8A5Fd21hZStNimiPifrDlLAmM4bx3mNNmRckzppkKlpPkZyksqJr08N/XptnXhtRlZlu0uCOlgjCDIMASj0+t7Eg5pkIpq0WI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397441; c=relaxed/simple;
	bh=PXcKyMYS/hHOX3NpHkRuJUCALN8b1o+BCk5pkYZdySw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzGOeR0WKfOeNikP6GfY+YW6InI267e7MVuPmqxgzDhWG8hq4V364i8UWni9NB2i6AJDdcnR34+tgUMk4eiAxL5SYtnejvvRChAHivqp+YIESIIiOfnGEmrhpyqBXDUq24bbceb7XNlh4ax1r7BU6ErTqKtStF9vF2InqJRZsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niKjqwWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JERt7PA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niKjqwWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JERt7PA2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7kjIQ2669156
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=; b=niKjqwWuCwAXffN2
	7YbIdKbJbU1OS7827Pcs2ERD5CpnK3+fUj2AvBoG6oEa/ODyNd005e7rs8qnyZeD
	X8J73Pq1zOChfUXJgUP6/+UkLO7vo/BU93LYHqzDEMdAJafVaakfVUw9tFKHC8m6
	wlbZdVs/UCDe9QoBQnkcL4syPu6tlBQJWwlV47ObRynzyqZ29Oid/X09a/GBd7sL
	uBJ9/TXFn6eUgoYFjg94IH+FLqIeyuB+J6Khaaz5jlN4qZHkcM/OCwKSDqKm6RlV
	9HwUYNB7aLwjjbOolCs42OXmyc3KRFY25kfXXmGlJzD8oeJAq4PaTT3J7RESdIaZ
	8JPXjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48g2vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso537191885a.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792397438; x=1793002238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=JERt7PA2GX4rkZEoUrWEEOdCMtFjkwsh5Znt8lYTYaD+lHFZSVxuP5CfbWtrzyJ2Qr
         9X2C8sBRn2Chc3ABuV7XFuNWySTh7q/74NbamJplzKLjOMBVJ6sS1jNDeFwIwqtXnPDY
         /ogFGESD9G80wiMMAmBI4jccSBrGGxaFRveHgu59eQ3WX7M6A2g8l9xsvagbf29Gabm1
         +AwLYEjaq3arb8pmmdZQudQEhRDN6A+48d6yPqSFeD4solS+xFLPRGVu6gRwD1JL91LN
         ENNv9C/7bgz/gomFMh8AMZ1lAmgDppPFQYFAFGhrUEv/yJuUzjMrkSiqJD0iXaP8OkR1
         ceYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397438; x=1793002238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=2vQ5mMWox6EV1+klxaiE3lueklQPR55cuKVRlgd5rEEGHc2bd3rQPbNMR5yS0Eb/hC
         xRIrnyWPRLYg6fTrCfqbg4ZPZRl2fmt6OcuWZLJ95B4l1IXjtCCO3fvNkNiLyVg1heP8
         vRblFjLWNbH1y17k12ytRzEN1MMGQGtIw3MONzYrDLroPqScp6huFLlz5i638y/j0W/6
         lIqaVUKKkgCNPOFEm+OYvlnxPmboiGCccw7f4hHCVkZ+vUlU5CMqZxYWHaP38+k8pOuV
         sfCFAHnQ/CT/2zZVQOiQ2VCDa7aRtsf1oJzXNjck4nkD457tlLBf1ORBgz53JK5nXIUT
         gyjQ==
X-Forwarded-Encrypted: i=1; AKwUvByWTOaEBruXrzs3bWkRkXzraYBCcYRHDzfOxT0AaPnis1cs7SNJZR6rSIkHbJRT/NqkOGNWNrcWrwem6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYL41n1yTihLfjPDIVst5fsiUao1vUx+6Z46JLe/+rN6Go7JcTS9
	a6aYE6wT3omqSb0CQ3yX5Xg4LsMS83BYuBRn2sj61karPJWq5jhG3zPYPuZJ/EVxKw6MUdUIdug
	AvN6W4NcKjbchWGSQRNgAzzUIMcQdk9RGeZ+4PsAaIiGHprZvuk/htjGU8cFbym0IGMYPutdGzQ
	==
X-Gm-Gg: AYBFou1GkZUgOzGqNZBECayDlkgspTMTGMUT0sNUnEYPuKpfs3gZNI+3Va6Xdi7RAoD
	huN4mPYGY4Pb6/L54p1UWLadvw3hNuVd2s6jHDAuqnNFlyTwGZ2mAD46AHSTUE4mmAm/iiBmY6a
	22wwt1mMBNPgL1cVcuysPnUU6DUMnwwWfavIFPoxUYkT5tVtTOA1VH/b8wlEI2kEJLut97bIDzV
	TJ9QvQ942aqtaewkQe7OMbQnwL6MsmkweU8qgnnyIQ0lQfdTWeFoFuP5lU2xcPzvfnXBQdaGtAa
	cJkEXAIgbN+3ti8PjFP4f71S54aFMHZCT3pFhZ+k1W2oVPv03Q0WZFs03BtVLw2hWeDA9bvur93
	/cDQtULPQqIJLrZag4dZB8a4eRA==
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677760485a.24.1792397437669;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677758885a.24.1792397437220;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm22045504f8f.48.2026.10.19.01.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:10:36 -0700 (PDT)
Message-ID: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:10:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion
 check
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfX0h5xO3WKY3Ba
 EewMHCSpbbNtX2lPI5qC6BtZ8jPCE4iYTMzZxAMdqBmnhHS4m5eZcxlVqZYSbgAUVRpQkCRQaZq
 J5YLaTB0o1eAHy4TrDkJ9EbaV7RK545gaOHD/jVTua8Xk1IF8bhkwKw6NnEblqE4deAo0MlrrOF
 VdtAQM1LFBokwb3rNz7bA9XoEsSmaRH+MGvDM1lM6M3Mfl7fu/ecgbRNV0l59Y6IDFvqoXuwjLX
 b0z9iJg4ClaeyBm2urLe4a14YCk+UbQz5njZvjun2VMULu2e/dPZyW1nxkfgds7X6+PUsV9TzZ1
 9B1MVC0cs8UKosU/vGTKzePCbFyxs5+IsBlFlvATkVmH2+6ihlnWAf1HNGU6QBi/D95kLhGRzsw
 FsvxVzpUe63Y8ypHIL3uEwKfrIikWO3lekxe19AUSO8XBx11nE+NQk8JCiL5CzEhOfYGs+Do90D
 UrnK7HNAGC/roga9QKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfX8nDIIijFA9gp
 5I9xJpDgRNr5AogEgPaTaUtlcyEAscyoRB7ozjCf24emF41lGPEcGYEU0iAVpdDSDSjnUKXq65C
 QCGt6JKg3BEFUiN79BSYHQUcSGEI1KI=
X-Proofpoint-ORIG-GUID: umVFUmdrpxv5vqJnLqrOIjh6wejNZ9Nn
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5d07e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s6-JtZVsz5dYZhUdyjIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: umVFUmdrpxv5vqJnLqrOIjh6wejNZ9Nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032



On 10/12/26 11:17 AM, Christopher Obbard wrote:
> Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> port_mask reserved. Valid port numbers therefore range from 1 to
> maxport.
> 
> Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> stream_alloc_ports") changed the port exhaustion check from
> pn > maxport to pn >= maxport which rejects the last valid port.
> 
> On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> to swr2, which has 8 ports. Each amplifier uses one port for playback
> and another for voltage and current sensing. The right amplifier's
> VISENSE port is mapped to master port 8, which is rejected by the new
> check.
> 
> Since all ports in a SoundWire stream are allocated together during
> hw_params, this causes the stream to fail with:
> 
>     qcom-soundwire 3250000.soundwire: All ports busy
> 
> The codec DMA backend then returns -EBUSY, preventing speaker playback.
> Disabling VISENSE works around the issue but also disables speaker
> protection.
This comment is incorrect, we do not have speaker protection enabled on
any of the devices.
> 
> The original fix addressed an exhaustion check that could never
> trigger because find_first_zero_bit() returns maxport when all
> searched bits are set. Include the reserved bit 0 in the search so
> exhaustion returns maxport + 1 and restore the pn > maxport check.
> 
> Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
Cc Stable and Reported-by missing

> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10efad..b4ce96792fa94 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  				if (m_port)
>  					pn = m_port;
>  				else
> -					pn = find_first_zero_bit(port_mask, maxport);
> +					pn = find_first_zero_bit(port_mask, maxport + 1);
thanks for adding this case, rb3gen2 should not hit this anyway.
>  
> -				if (pn >= maxport) {
> +				if (pn > maxport) {
>  					dev_err(ctrl->dev, "All ports busy\n");
>  					return -EBUSY;
>  				}
> 

Once those are fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> base-commit: 2e9eff8847a46530ab937696f340b9d5bea2e4ef
> change-id: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e
> 
> Best regards,
> --  
> Christopher Obbard
> 

