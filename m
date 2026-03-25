Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABA13CEBBC
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438599; cv=none; b=N/JnFlzMGsqUNkhQz9Bn1wEIIbcvdVxN2mA0egw5QzL3zOol0TF13av3+66b93RZjbxBOO5lka2sajgytW8UeRDbWr9u6/y6s8jFRC7TJDe9mLTMmS+kPN7Y4eV0q2ls/wKYKF1mAGCEqRSVaO+0lUt9Mxgz1h7F1Mq6QQ3HMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438599; c=relaxed/simple;
	bh=z+8i3GYxmPysMPaCb7ZxvnZe2fGGVA4EZxOB9hfujIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkCE6J78zR4yNXhy8T2wUFFXSvsT0Bx19XMOKH8BIS3ORG3Mntk5LYGDphdaydL6cJW7EoCZIha/QWGKTeR8KbH+CQjUey2a+L6Mf50tzhe6yBtKjtIXimrS191y9pU+jGppPv6TXuiva4xvAjEJhf18i8MMilK/pVV1/Dv8Z2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fivO+lZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdL4ybDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fivO+lZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdL4ybDU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBH5Ew1024313
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=; b=fivO+lZtWQ3iroMH
	Czs7q6AyDLwyV0ZJVVbIywxPWiA1c/F2Qz8tVdRekRFKX7Wd+NIXGwRMteFbPAF9
	WwSuQ5BhHBw4jylxharxZ1bG49i19d8B+YWeaFFRWljBEpzt8Iw8DHT2WhtEOZz5
	KQBOYkd/5iX5ru5qfDl8Cm0kxZvVCcXCyZ6ohF8zyY291GFiHV33/Upw1k3MinE8
	LDXh5MAaxgVxACL9P2u/D9Ao5KBFM+PtG1WWOqSmDKeEoA/ZhqY/mAcmV7+hzCGZ
	Lc6o3Dn0ukUqC1vYudr2TUB9sCdZhIG//CaGKnFlyt2t6WQ2/tBXWEwukHeF7E1Z
	MgqTaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvv7p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso320019041cf.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438595; x=1775043395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=LdL4ybDU46khP4GsIkNocBsQRMD7pC53oQJPIjfvQwG8U1+sdIBlvqPU4Ncce8WBZH
         U2MXjGn86Xm6zij8/sWoVIUBUAQIaTv6SQM9TCFazwt44xP/hsnIKKbtfgQOliQe5C7H
         POSHhWd0h0UPHe+ucQghZtcRiYtpOg3d403sy/q2leWgQELsBPJmS1e4Yh+/aYhCXx+Y
         mnD56WrbF86anLy9kcIe5UwkSv/os9LyoMAN0QGbbP05fUroJi/nHw3rgvrW4IO4vLTx
         TOmqtmitwM4nrML09EKL0Egl2Y1ee0EqxzTOyE2qqqgBwS6d9HwuOawqASc/FXkWYkbh
         Ex5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438595; x=1775043395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=gZxmxjLYCXokDj83q6NoQYqixMf5F/tac8pUuxcmH8Z2QrCoAaTW+2BSqP09bKjJU/
         aTJC7e4D9lQrNmbPlJFG8hzBntHyprY1QbIxsKm2+ujTdywhP2Ja1Ip/WQhC5TEfeNB/
         xAbKP+O6DVVnL3oK/5mg4VFykxXXUp5ofvi30pLUBwNcmXchabKf+gRn/Bq5aM2FSD2C
         Gja3ESSxkntiWJYO5mVHkBFEvctZO2HYorSYOMhsJoZsMastDO3wt0FyFJ8yL0xqlb+D
         Qu1Zfs63iYMPlXgVf84pjpSS1MkAp/RzntQ7LAlJQsFals3F/0brmFgigAZHIu2/eEwo
         fviQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv2Gp2lauIdelj64+yDDsQXG2+JD1cm0hIH4Ojvsa+RoChSQofZNog/ztBR/Rp+jzpu8dX25OD9SbeXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIPAm8bkn2v7L47BqAZWOByNm1GQDBn+TfbSBOQ1ZfoGerxL6
	5ghC+rRs18B/BE2YYSBsorBBHCaFoKjg6QJ+7kEF2dSuHyvVV/MVRXI2PtcrDo69vLLgvltuiKD
	r+mNiv5hEtFtcgOrcKHhR2wpV0NTFQC+imyXkJEqcP6NTBGXrFF5m6lRV+jFR2FMF+g==
X-Gm-Gg: ATEYQzyWUgfuEnI+w3m+iu7jc/GyeORdIUFEgEL5EZdmqysReFIszxwQEs8Qqft22BY
	4lb3tYFCbN7CmpflmlJfeAiQB/yAyLe4xVBGF/zFr5V2u58XYB19k0eaYVS9536qI7MFsMJiOKN
	wZG89gd1eJ3Tjfsl4DKTVTIOum94L8UGZPMrkjvvIuPytq/OtYJW2I998WbGRqjnMZxF1XylbTD
	+N1mMegGvq/N2RCJFb6H8tyrjAMp5q9smqQU3jj2sGRQeaaym0dwrFxsvZO7nhHqPBur7K2POq7
	rnC6yzN/zSNKaXpr+AfHEM0g5CqlKW17Z13Vte6oCwGgBu2XQX2PzluVmHzcXl3aqOye9YewLFc
	VGMdtV7VGrbBeUBv/3nb1IYMOjQ9sd/6Nd0uQCOx/3d5rN90H
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306621cf.63.1774438595526;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306041cf.63.1774438595091;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-487172f909asm25777975e9.6.2026.03.25.04.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:36:34 -0700 (PDT)
Message-ID: <544debd5-bb7c-4b89-8641-eb63a107155b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:36:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration
 to unmanaged version
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
 <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfXzqJ6mEIfHv0X
 LDsekV/gH81A6Y6Xa7yjGvfiiDpglQHfT4Vnn9vUuNjdmOITE2D/iNe6DYA1HN+usQWX/v1EwRQ
 oqe+s+ke+Tv3WRtb+iZtfarlqAzolBCNFXQg8RmRkQ1DTjIog0hzvX8/9oWOHmde69GnhE11SAE
 VzD+FosMnKIfTw1lpLYAQL3SiDl302Cs82mPpE0mvKkrElXW6aaNYv/e7UDY1GYYdqvjdaB1kps
 s7LAlJxZM8cCIwbEj38+Lq1kL5O1DSdTAyGiGLe38gWVfMGJrEI8UbXHkwyoCzxg4yrgXm8QSRj
 kXrUGCfwbRNsQHU+BV9r8hPV86zy+xOqfQNtRIb76RbhArwnOt38zKRGE9A7u6A2QmhXvFfjyfY
 JXK47kE2XizQpF4UtGaGIKcl7La6kOak1b6b7Dj0Krt9TjSv4FcnNkB6s2ackJWh0ujHzjDGL9b
 9RpCbNWBtdzvSXlpYcw==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3c8c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3rt7OP6hf4PjYIihl4UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qjX0HGXWu9An1vNzkrvJhf_8Uu6zhuxg
X-Proofpoint-GUID: qjX0HGXWu9An1vNzkrvJhf_8Uu6zhuxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082



On 3/24/26 6:04 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:33PM +0000, Srinivas Kandagatla wrote:
> 
>> --- a/sound/soc/qcom/qdsp6/q6apm.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm.c
>> @@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
>>  
>>  	q6apm_get_apm_state(apm);
>>  
>> -	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>> +	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>>  	if (ret < 0) {
>>  		dev_err(dev, "failed to register q6apm: %d\n", ret);
>>  		return ret;
>> @@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
>>  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>>  }
> 
> Given that of_platform_populate() can fail we now need unwinding for the
Yes, will fix that in next spin.
--srini
> component registration here with the removal of devm_


