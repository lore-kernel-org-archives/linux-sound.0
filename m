Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DF35DA4A
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729903; cv=none; b=HhE1e5ykEuFswxNPiF78ZddlbcpbNN1X0otqhaLLVNLl+yOCVMbEWhdvUSwIBe72wPcJ2did77TqIHvATOPZQgSN6Qy5LGgiRxAxDwh7OGGHzJ1US78GMTi9M4hoRI+aDZGSQV2Sjy6nJ79q8i6UWZBIE2yq8HC8qCPV+IxS16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729903; c=relaxed/simple;
	bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T8db3dtLwVOLnGEbqMK347BObHwKuJ6V3y/H9UYol/g+QNsQCxuWWK01iv5i772VtoumG43k+755uuxumrQWdczQPvov30CR4w8Sx47n8VvtkR+eHF4e8TKkZDmGdJclTaC5lCqFpnUl0+M8GUyNss30TUMermiaOnT2Oxb128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SirqkLFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4dbV6xV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SirqkLFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4dbV6xV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWR2W765286
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=; b=SirqkLFtXIR9Iowe
	BH3jtpl9RT+bK6ccXAMAMnhbPJAEotABisW6Ab9FUmeakqqMPa7LCsrY1qlGJp3P
	XSuYPa6qqkN3Wqtuct41Ts2scfzMXCwEexz4BY0tGhkysCtywkHX4Y7YX8YGfZWJ
	bEA8GrvoGXriY0G61xScGc8k3OToMIvkc+o1KmEhhNUX5jpJHmPX5W3e/+mUUxLC
	Uf2mFdGj49jYlYGnibWBRJ3IiVepLLR1cI25QDHViz2UbGz4gsm0uqLVAIexwPUZ
	3om5ho0J8ObUB00vjzNV3SGiTYLpkiQPuCWkFoeadZYR+qEpkiDo8TrupuirSreV
	9JWcRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2sbng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso306591955ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729899; x=1785334699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=G4dbV6xVN5nhRL88fkkJRHAUDC+nYr735IzD2CwI4j+uADMh3VBIH0qI5xi5lodtLa
         m/q5JE/tQhz7SYO5sH9jJde4tnNakpk4T3XY+EknCah4uYMST/nOLoKSQLaEwvUJwuN9
         DHXm254zUTWim2jIHO5No1m+6Ryhcx9/SAuUbmpOtS9FOe1ZakRQReQ/fjfhGOsttlZY
         6bS6wE2BRG76+Gt8AhBdQiIVlWzdKAkd0SjSrzzpz1QyDb9gL7d0rAP1UJzSlnM2d0tM
         NInq3Zkb8HJ+F7FsaRtAS8sv1KvMtjVIuM2hUMULpZ6+XWGWZHyaP4ZzSuiBmnoXqLTZ
         FZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729899; x=1785334699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=rNwokMV9aTZ0WBV+jJEe7Bydpqf8XMe0EZNbZOIIBuoc94uAywyUQKlgda6rfgDVJN
         Bqb9hpEx5/QgX3rperpIVXPrfdYqK56v42C0s1uC+10ScGSXiIX2xAnErkh3bz++YXhO
         aTJ4zimcu07sOH5XV2qIDEi1nMZCNrR9IHV2HU81efmVQkZ/RYl21GiRh6Dy/OyIzYx2
         8U8vF26XxAvRBtlufORjRDSZdRTu1SHXamA8kONEUeZ3eXAlu2U4ncRLn4eGGBg2TVC9
         IWsc3F58/77vx7ut9ePxdFaO/+Cn7cLdpvCHTGN5UDmOHNpCQcqrCptx7RBlLUl3ZTKc
         Fp0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1nO/5L2EImeifHks1v0XbihzzFPP1QLgCyWxlU1o6zTODYV5eeGmfXtuJby33jkYNzkG6dCNrzOLJmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQ3RiFWuCiPs4cXefIM9W405J2urN4xVCecOp3vlqgVGhHV3b
	YzYV/zFYo16etgVDeeoJflRKOZitd51Na+qN33vGPrjqdEciiuz3uDO97+xQxHElRybg80Ejvdr
	2BYQQHvoJ0+qu6/DeqN3hm0zoHryMaQAaj3fEfbs332dNKMH5DwVhHU0FnV5+Yf0z/w==
X-Gm-Gg: AR+sD13UC8s0bGNPS7Tmj1jL7XZYxJkqOmnoJodV5S6h8qNXy5MxcVuqp8svQBgRc9f
	Y6j872S2i+4lVh14gN0kbqca2RhJqYgXmliCJVtjCQdwSxqPaglHu/KUrWfwnhHmnhN+jPuoBqg
	IwQ/97OYjxW+5e0bPIKQ9fAhoJd3NcNBbWmOo7VhGPEY+tnAib5yMAv9JIzDtL5cQkG2tLABoLL
	byyTVmIxAERARrCJ3Gs4OLMl+Nwdx3kSgXxZyHtKLlHIlMRc+QHiCAK2K7MpeYiShR1XIPD0PU3
	T2noqrnXKQ+f038nh7/uxgtRUqPjCpOjW+vKLmvnaW6s1d/aNdS1E0dP8h9HgPp4c5uAwFWYQ9J
	XvMds1bRMsqIpmCE20Q==
X-Received: by 2002:a05:6a20:3886:b0:3c3:b628:6d17 with SMTP id adf61e73a8af0-3c3b62871a1mr16436342637.25.1784729899210;
        Wed, 22 Jul 2026 07:18:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:3886:b0:3c3:b628:6d17 with SMTP id adf61e73a8af0-3c3b62871a1mr16436307637.25.1784729898704;
        Wed, 22 Jul 2026 07:18:18 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm10768990eec.4.2026.07.22.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:18 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi heartbeatpulse clock
Date: Wed, 22 Jul 2026 19:48:11 +0530
Message-Id: <20260722141812.596004-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com> <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXwv196kUtIKc/
 TgHNFSuqQTKGvXMtkH5BCVXZBcxzJmkZcajiByGDjMxzUU/6SeVmt6P6Z0vIcTKQo8zE1CE3zm4
 wlv6hKzlh9QbAu+OYvZHVV8ywtELkGh2QfjaEz5PC0+KHStS1WzRIy8xtVnGyJpeZt1O6wSieoh
 8Cb5bRIsXpZb5dolR7AlH58oxmB1CSFBsZrh7KX2X9DKoteAx2fmDt7MSRhph1N7Q8scVJcqCjH
 8fuE3+t9KgRjqNLEIVpqNFOZEO7vjjYF+MHAn/vI/hBT2fsSp4XjME7qrz/B23HTqjTo88CaHbr
 VeSIrp3fZ6pO9wPSpkc4PyB8EUQS8R7a8bQKMwodEK0T/pcQ8vqggoRS1WwIKd4lZqQuH2IFHoE
 3kJmIi7ooSPebfPaVbTaxOuiYapnkW87x7v5BbEn+NCZqx458kwACE7AafW3IV4Cx7tINg/PdZr
 3weUbU6XVd3nj9OTa9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX3lS/U/Y2M8cC
 9utrgzVT1jX+gllk42vh5axuQRfJ/PdcVVDhw3HNRCiR5z47Zd12u6X4bbpWSeWxpeaBGMvMa+P
 wgiTd19ybtY7efkXQ11X7dLIDeZ7fko=
X-Proofpoint-GUID: IDnIBgN9WKZGCylmXcmapJ7Tg8WkwzIZ
X-Proofpoint-ORIG-GUID: IDnIBgN9WKZGCylmXcmapJ7Tg8WkwzIZ
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60d12c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_lnWTncF0BVR8YGM9z8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:01:15AM +0200, Krzysztof Kozlowski wrote:
> Put this as first entry, trying to keep alphanumerical sort.

Ack, will update in next revision.

> Anyway, where is any user of this? Please carefully read submitting
> patches (both documents) since this breaks its rules.

Thanks, Will remove in next version, as there is no in-tree user yet.

Thanks,
Sarath
