Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87493E315F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798071; cv=none; b=LsH8kd1Cvpq+b1wcrSnfsWMF1rWy8cyUO+u2WsDWdd4RY/RR7HWKfD/igitx01nmxKaTd0eps94wITl0VAvoFdcQCrf7k9Bxc0+yE6yjcNudVdjOQcio99owamSWE7fe+tdBKE3ix9p7+DJly+irVwBVTE2l4Vmr8t6qOyJu4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798071; c=relaxed/simple;
	bh=rx8AxAOChCv1a1eKaXFa3qJAaLTL/cK5UWcPpj36J7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuOs2bO0Q9jtqfR5LBiMiieg+NTrkcac913zeb6MlMMj54Ta2PXN4+5G3Rb7E37CrAzihzzkU7/Gg4oCnIO4wd3cz57vY5Wvi6ssjEf+NaWfUd8cpm09XcWU/ZLwCeAExa1jNwb5WBW2ry+28oR4fwbbDVdALDwSh6ZImcbHcnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxx7A6dZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc5n+P7t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxx7A6dZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc5n+P7t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DkZP3567628
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=; b=Lxx7A6dZbpy/G+Ob
	s19182Khe73cKtgoJUQNeADtyrlbvKXmE0JHktRlCE/MkmDZZCDI8IvAQJBjjID/
	mEBI0ouAFiEXQJWpbaOdAWdPiXTEEL6vIqqEfFMfSVAmSWUz7E89G1czjcg2jDk3
	XjIHIEzbbU+T2SGvbqiwsoNkab/P/cZEZPc1g9CJHDsVlIayF/QDNowyuMAZ7twJ
	jePCEnrRvKEriaLYPMolUUnunEiWMSU5siODPVtJ+er1x67af3660Qo9gR9V8F2m
	HThWzdXfXtGobE8TGi9jiO6t0rfchxMOjuCdGvlkFdHfiN8W0M4lq7bWG2/NSyUG
	mb5Sqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520049-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-901fdbfc3abso973306d6.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798068; x=1785402868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=Xc5n+P7t4rnNHQR/ARqYiBy3vNn4dKiMu4a+UH8UOe0OkSW8jJH7FXfadctfLs+2rF
         oB6jq+FgfNlNyVNo/LiSABBTwKwKRW+BpfIQx54ujMkIw/5J+GaOtYdDWr/9I8Bl6vjV
         hVbhH2kYn4k7bOHwLfG1jrmMQSGpnYkyig/uIaIya+pw4SS8592pGp51oXb+ZlIM+C35
         g+cWDqaITKWpmGI5h1gCNyfPTLpH12ZmMFarN7TSjU504mY3+xTOEL3b8Mfywp/pnJmJ
         vPgAdQ2BJFltM4ziYQEJATfKZ/HBBXG1MLPFyD7l0A4vc+Z2Df8f1FQzqqMiHL6BfsKI
         r/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798068; x=1785402868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=e79ikGGJk7fq8M+/klt8stpgro72NAxwWQhfZ6060qryRWXa1BG92kmBDrTLNyuPVj
         5u1VH7eOHNlvVvOuI4xbb0VzQIM6crwkpeiJFhDs0iQVfihI1iXcwOxSlC2Y/16YQtIb
         uMLgw3VJ/wuYZ8ByXo5vabUjp4jeaQmjWIBmbjKlLrRe/YcLtLod76NX+KndZT/f3O/D
         dhE6ld4ffpRaoyILcL9DbNgF5IDKnNv1BYHsq9u7qe4y9aNhvWQcjki9bmA5eKz6acl4
         8Ln513blW1px3ELWlwBj3JQaUaN0F7ODCJjTcMYiAcx9Hus7s0ZYY9RBdOtLwkSXOWvH
         9xGw==
X-Forwarded-Encrypted: i=1; AHgh+RpQTG6h2ESAXgfeSZ8Nz9onchAnZFD+o4uf+WUEmzmBopPKRE1poJW6SGuCteLR0DfLtUWuo6Ih0Eh5ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz051PanpoQA3w1dGAv9EDbtByE537XKXvCjKp2x+hQWt3IHbNw
	S1fO9CWjeiKvZ+GiQ6oHuL+Cf3oBNhLqPnYc4Wpwsk8kqhqjYZ8QRzVBM0tM+nYwFtox7HW7e3E
	tBmPY7UZWT7LTl6YLAAZDMvV2Lvyei5i2ifmYIrSSAFS6MP16GaLUwzEuujisUEcLmg==
X-Gm-Gg: AR+sD104n69oBOsRU6+S36jGcnNYzYOE6SC1Wu4Bd5BLJHdwnF3mY6Bbqsfs5BlS7ha
	45hO6cJSJ+g9rYQpOcGhrKGIp/mBxbi9PFL0B7oT6drHNsEbaxqdoBBiH0F/ZsCPjsqURY3sjQ7
	WMuJE4vv146aL0uXkfpgDNHXMgq040+HwcPtbUN0wW9EpP60nEPPhPnMcUqRhuTi/CsZxbfOsRL
	5TeJUAMsN19yM+A3u6E1c5Cp4Xq+f+2vkt1DYX+F6/MttwUeDRPz7bZfC47vS290DaclOTig3Sm
	Fj53RD2shpY7DbQbbku8D8EaxdNyy0v0MisuE3gR7moC5fdgeoJJrGDSqnt7aSN/biJMEwHDw20
	/nmu/tyKSPSFzXZiGTr1eBmzF
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143601cf.1.1784798067620;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143371cf.1.1784798067197;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm31670366b.31.2026.07.23.02.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:14:26 -0700 (PDT)
Message-ID: <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61db74 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gASrDC7fFa5pDp3QmhQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfX90OTZ5vY+Iv3
 SIPNcep9o5FdRqNElUzp7bKrtxKjHdSbVd/izm+QxYS/31qo+ML50yDVJXI6juHBulwqwHeIt24
 ulFdGcK908cEVM0QEKpBp1FtOPPe3XU=
X-Proofpoint-GUID: tq9Z4tUZKxuiArOTBJF6_DJEM7y8h6Jw
X-Proofpoint-ORIG-GUID: tq9Z4tUZKxuiArOTBJF6_DJEM7y8h6Jw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfX4XHBGpZcqgwX
 7fu356H3JnG8HPqLUmTWPEF+DNGbdU7BrDqJcb9zzACVNOfCz9HOThmlvBKiLW2jaCKMUxea4l6
 mVevqaiAzfdeLGyprjrVPIfUha+R43eaH3H+XBvzLr2N6ph9+H1zLpEdtJHJUwH2EqzeCOiOwag
 Y+WjIUG9D7tZ05gPnQivyXE6M9EVPmjp/rRy9Z2zhgbQ3rO6u8Ys9KjAe1eOLwZtdF72XK9ssK3
 rtNcnkzqktqYf+dvMGnOiVbDol9zDVmP27KSsdZX6yfCcKGnoWvglZCASxkFFHdUc9ob4RHOJIl
 4Jrh6W7Z55WmqxNSkOol/nNfFECoMepdRYyZCwT2V2LSfWCnuDFzMc1aL0Tuq4zkSzZMrbEf0o4
 +J2ZJ4LHKeDrcwQYMonkkdiUqKTiwUgifN4Z1lbao3QtVFsXYq6tTx0oD+TaxgtFz7LONSSLzVt
 0P+ScNTbckiW30S2G8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230091

On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
> driven by the wcd9378-sdca codec driver for headphone playback, headset
> mic capture and jack detection via the SimpleJack SDCA function type.
> 
> WCD9378 codec can be wired up in 2 different modes.
> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
> each of which has dedicated control and data lines.
> "compute mode" on compute platforms such as Glymur is enumerated as
> single standard MIPI SDCA class device.

Does this require a different hardware wiring, or is that just a
difference for the driver? If the latter, can we choose whichever
mode we want (i.e. use compute mode on the Fairphone or use mobile
mode on a laptop, depending on what the OS supports)?

Konrad
