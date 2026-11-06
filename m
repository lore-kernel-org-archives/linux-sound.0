Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968414;
	b=pSUkWdDUGJF3ECf2X3DrNeZ1k+9en0RZgJ9aIen6lRFlP+ykUsoBOx60lzKD61dhZZAM
	 If5EF/44Ds2mFs5jFauR/DTWnU/9o51EC0cRlpZEVRujVJUtpg2kjx9BYDQLQrO0wVhmO
	 znlXPeoISuSTA+2dV0D2rSPdyl4CY1wsX4Fm0J7kYO1XsiWNLOriJ4HA3utKgQd7JQsVw
	 8dBgT6tKAk0bZSFW5YNCtdXvXYfP85dZR/Ma+rgkUREx3S5rPwk4r8baCGJB3CuvApuui
	 OOy7ZQ8t5VxfS9Rs6XvTBVeJt/oKKlcHiKQO8AYQCKexi9nCR7NJY3hLueHP3s9ArmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
	b=JAohGEiqIqFY5xIQS7hgXYFxz9ba4C/DRTkpDXP8hoxOw7oKzaRO2llKRCNsswCYPbnB
	 Qf63slZ657HsTYGx7uqXZaNP9lf+O+v11LkIp4a2p1qTtIxroWnQayLVdyyBuBYDPW9Is
	 YqQR5lgi73kD3pOU7jJyw0bj3GFHzsWzeZCCoApXdvNHa0VGesSDNbVfeOTt2hJDNMAUA
	 UjT1ZCw21O4qkg5e05kKIUcReMS9ry5NEJXFi17UmZjy6fKf+kNJb/jzlroeWzZalVbrj
	 YweE3wzlHcuYT6KvdSpWTi/XEp2NOXWEwHJNbyhEvEEsMN1oxnLDBfuQv6fuS3U7kyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4A606A336
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F4A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APAou3645831
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=; b=SaiyfY6coeC0grlK
	2vMGzRo+xVKQuBZK80QW4+Ul9sxRE7y0fo7R18UdEiZ8+WTXWXCyRSDdTerYuoYB
	PkWF9LcdpEdsvDhCMprbEIurD61myC3jWJOi4D0FTTilH5NrIyFuNk/lUm4A3kcE
	+3W8X0+7mVlF8LSoIdfPuA4lhjnxb4LPWo9pripy7JQRUz4V1H7/sYOSJQdiikMg
	9UuxLg48NZbCaG7SZARobueBzi2yni0MgFH0xKk1GoJLBxPAJ/zlHkXzvxX5a/8E
	N6Exs+WSLMz0am8vfMGLDfCviF9H7xTL6eY2hBnRALtLHSvHb2P+JsMyqbMFU1VX
	+9FoMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:33:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso828768eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968412; x=1794573212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=ZtVk0OCQMD/EQeod2JxNj2FBHNqDPYXa+cfn+xP9PkKW6EGLE9Mi8ftV9T9HYQk8sY
         p0zxhDtB1z3wMB9tz0BhFbkQGWY1kysUIxw6z6eTyLfqTfSQj+98eepubHhXqDR+vDq7
         IDvVXUYrgdFY3bqQsSmdjnINvkte4loXRah2VQJoILsVP5AwmmNsJkWMB8h1T2zrefgz
         MBEI0hk1tJFav9MOWiPSeQ4vEurEYEfMXOniUGqq0uAECiZfz6ecfO26WHndfB9uvgjy
         fRqjXkLJNgy9nSbQa/8STaMvipErucoRL+bvbXFBA3PKfRz38M3shsNVeb9UKSdBQHw9
         72Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968412; x=1794573212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=F8TiuD6axK/F75LOJrjPMMVmwaYQfYPVmO5rleHriAiSxEOF1Ksfotni2VysbVSL6t
         lT+qs24duYQwo+ly7l0SM1mu5VAJsHI5w2fO32p+zQTuXqr40eXrzAWel1OjHOCJfajD
         FY+mwRG/svQIKzHMSXw/24djjRkP2pz0g0mj2WRsFchMI9s2DBf8HMrlAoVld1br2HP3
         3imCAbakxHQ6eZUc/DYbccZD/HKweD1/4paZ13L0ps+oUWgPhtBhVtxDJ/zPcwDeOHxH
         sVtoMD1OTN++OCqAMCksMlEa5TeJPxpHEgXDWaZu0135KoQl+5xlrGzdpZm3/RjX4cLE
         xTWw==
X-Forwarded-Encrypted: i=1; AL+hErE+69vvtU88TymtFW2/VLfpHLSST+170JCRLINeeugmqa3xY4673u0myUhD6ejnJSsm/9SWxnMGSQFd1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oMgdQxjyxw+nO/GTT2obCgQYK5Pns+VT12qZkQZWxP3OZnBNr
	G4WO3YD8KA5A8f6DdxVQxY5zcmLnPSlJfxHEqcn9FykRXBPUMolwBElxROERfaP9+sPa7hiTuOU
	uPVHgyAvHkMV+5VyXozEvx1Nqz2Kas0b6nHzIdCKqpLZnNZy5gam7TdtwWvEy0I5hng==
X-Gm-Gg: AYBFou3cgZZ7ntddGTPolI6FhzvmzTt/yxSzTEnCPpHjeTvkL+QMyEqcB2QEIyn5QVW
	fsQseXF0Zv8hdIDoRb+kJN91ZlF3uHEO19OIJ/LV64jG35ymsdTYWcQgtTGOxqETdGCvUWQfjAJ
	H3J/Y8MCDtuoTDu9Dc/VwZ0FsYm/VuMumWve8QxM2ENfSKsbx3vTvorXccUvctXBTIqYq9Xin7o
	gGSe5D2AkleuZJ+91rBQuM1HD9kML/IFZSjH4TP853nb7bLrVrpTZcTBCcTuSGUBmPow8GinoER
	9nyxAu7pUwRwQJmgjK3r5hYZgdgieqSE1xhm8KFMrhB92prhPwjRJZQVaWL6pQzrhJidPNmpNbe
	epxZ7LfdhI0D+a+JFcBElrYA1dGkj6qqokWOnCZSeH53TqK8vYP6MFEpwqHp3OgKTQRmWiwlOt9
	TmCThnBvKq
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940120eec.10.1793968412270;
        Fri, 06 Nov 2026 04:33:32 -0800 (PST)
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940078eec.10.1793968411733;
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:01 +0530
Subject: [PATCH v6 v6 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-2-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=1038;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=N+hLPxTgejZRAB42bRC6ExNtrEIYfRCVRfd5P/YRASU=;
 b=+YQw4Ncu42wXGT//Nl8iiC0J3w5HLLx8E0Sm3l1OcNUNdDoQ4nJd+Z9FRn0IIvnYETfqAgZ/5
 bZlKqEgro1XCnola6Eiz8L1SerpSFk32JOW1OeJb+zSwBRl1srGGoPN
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc91d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXxis1H+9rTbdF
 gvOw5jan6E9aUogvbaaPmVHOapMBsFSnXQLOk2dKS9vW4b5PtZWVn9ge6e1lTUOjIqbNifxcNZu
 6CN6sX4gY6bvQmsHCUNQTZJ+te1Qzhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXxvbC8OUIxoX5
 jLSTFC74uXeatnfAOAhmtUMqXW3VFgHTWb0DHNoNmdXF46FvCTUt4VaXEwQ+gd0NeWpxtxw654E
 wE+Hr03yb9kPNA1mQwUpwHAqEjILpdfKlVca3YWq4Kp2aRx+Kp5dsXrMgnKwlZ95YGWT3MJED+k
 gWwedSZej2kzTtNoqTZUKDRDRfYhN7o0552gecsgcRRUfoqifYpuTfVSUjoyZorcFntbgsfGtJ1
 aRiY7dS479Ux9UQOfWJdDFmWwmnLtjRd7+z5g4QFjCOrqY/1KYUwYz6/qpk4hqEXWwmfAIILeul
 tmAP2U86DVZsl3kLqRVfBS3MClo9fvigOs9EpssVQuEXnnr884yu+nUG30445P5TAL4aGWSiMgS
 EGoTo5RVudFn4QIumH8c80JgNfDOGTqFuvMYnnBSGLa6SK8L+QKinNFovbBhYeNAA3Qw+yuyxLM
 PEHkaO1IySbhfz3eVZw==
X-Proofpoint-GUID: cmn41xh1IBCOCl_tUbeJ3HuqBdpUh6HZ
X-Proofpoint-ORIG-GUID: cmn41xh1IBCOCl_tUbeJ3HuqBdpUh6HZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

