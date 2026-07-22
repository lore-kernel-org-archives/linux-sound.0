Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2474028F2
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707242; cv=none; b=gGtmAk4AGjA4YeOzjrKUn/4gxfNGolgDwPoz3caRDoUcRSc/fTJqxsSES7UpoD+2XHwNocmEHgIyEbxIxOuKJUC4wo1cPWVb+d57VpvYeVIE0tVKMDBFrYF1i9G4HqwiLVDQxdVkvrUjsJ6so3Np6aZNsrHPMUCGM6gRIIvKsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707242; c=relaxed/simple;
	bh=4VpytwC09Qov53LruegfplaYigW5Psmc3PClQcDO/1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4F6r/v4O2coQ/1tVvobhaTB+PLeP/fMq1/o+P5eNEAfPVHfF+cCdjUHZHOx0SFgVOd6WTZe2q5WUY75YsWkpLoyFIeOLYbphyR72RUKVOTpbnUo0ZF1fGln7ON/DcJm2loBwIhbBIV7mR/GvAeJUnmEu6X63RGo/unLB1S2WRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j31v4J41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j70Jzdw8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j31v4J41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j70Jzdw8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ZbE3662150
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=; b=j31v4J41YDqoQvLH
	2pvpaHGCExy4IvSS7DUY7C83r4mlw7tGQ2LgdpDVfDQ4Ko9wXkqfCAoRyT9vdUAW
	FVPVC2uFH0/AetlfXaaIUt+s9FM8+z0tsjCat/LI7fv0QVExZExYW9+LwGMdYwTM
	QhjjvDyFCDF738PnuSln/o5IYBfb7+52S1n2hLOTvsQkvAyKKClWhbI+1tulT6em
	rZ5khgbD3NZUdwIwROUi5BJlxql8OeICAvN0jXi7If0h/WdbL7b572YJ/X9QZeXf
	kCxtBuivs7a1LCnqtdB7Eais/w3RTe96aYMT69M5EBRPzsTHiF1kaGrGrCWHKabV
	aGK8eA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2x10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:00:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51caa0b48ccso21929221cf.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 01:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784707239; x=1785312039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=;
        b=j70Jzdw8aXfU7vVa4NguhLqXEqYlr2ETog9vciVCZuaFmY0dCEH4F51AbaV9lceKAf
         FyhOKhsKhKmC7n+olYTEt8EM45f9MXqhE8bMkNavMImTh2e8kuFplM4Dyf1PsPUBqppI
         keYhmxnaFCfgi1rm60rP822pfj1Anlnwa4u8FjhbSWuUOE8ZgWMUNP3xdZgaJ+FNVvdf
         TRLqPUf8SViswpUpsVMWKTVnXbeil2jqqJ5Gtmu5p2bi298tP+LtblmVQ028aucpd4tw
         Cebjq5xfZXie2iYWs3WhzGrVR5/U9Hyw4Y3DiitB9AEA0HpVO9rNGZFeTl12h0nswyRe
         Epxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707239; x=1785312039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=;
        b=mCMGXe8apGgmBn38ogtzqsmtSFhbaP4YS6jdLaXZtsUUDw6Wa8ho3QrTcnZPCQ4hnA
         A5L6sN0i02B/OV9ezBqEdA1A4zzR4xR6ljuJcUF5eJTqYkR+gDaFqqxVADm0ImZVs7ov
         7QZvMcSbrtIGe1dq1uV0T6yqS1LHeBJ1C/4q47Bjd8foyo2hm36JVRJvHdLN1szg5wgJ
         ElE7z3osisajA5k3N3GVQuBp/O7mL6SaO25H+qfRnQEChlkC2UspcROdrMogPQS1dffG
         6DxD89eFc+2sTGnAX0hNOay1GU/HFbl8NVQ7mAbsucWEqF3rgEw7+hnG60xN3f4Iygdi
         2aKw==
X-Forwarded-Encrypted: i=1; AHgh+RqDkT8ckdmL6oBdpHGlmCHRVD6Mydu9Iah0n7W0BcOK53efXG8N1Iz+U+5RxE1dm5YOKts4O3/8pFpqTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzamfyUrPZXFg6JgmgsFqOktmIErDd9IVyCnVv+29ZaUOwYc6V9
	q1xzrcrbhDDzUrYdDgum1Y6CnmDLXvwo4REQ/BRja8uAOZHXkRdaEGNSmgGnIlXhvEt9ZVgLbHo
	RnohO6OcuPd0ZbcNpahhp5vOl45C1CF/evm5STe7bGDbTVyc0EcsZB4eBgL4VCS3fpA==
X-Gm-Gg: AR+sD11FAoCTP1ho0rUp+D9m08q7QDWvkjaSt+AEA9tClsmR9FWVI1usKvzn/T43SgH
	OVsKtLsm+MM5qKRd2HTda7FkliNpPptIAWw9vW0rKafM2D2Hoyx/LyEwyaK1UDzpsY6SkbVaFR+
	KzJtFx83/n1stS6myXfhIctCq8PK3HuKoEPsCzRnJ2Uuw+aExuB0YKlLOwazsM3zaj9L3gOTk8u
	X4/LVqsy7bhPio5UBbJk7DlNlHwB70R9qX8LkI/SB5+JM/jN6cXcQLp536ZuPRUlB7sayalQ1p0
	PMol3VCONYqiQh3i9jwHoJ+O88qQLcVLusvVzmDTNDE9AeoxjYLNHzpkWmnnofDVcxsK3375STc
	8qtB8P2KL3k9vJke9Vg2S645X
X-Received: by 2002:a05:622a:841b:10b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-526756d33d1mr39223631cf.11.1784707238792;
        Wed, 22 Jul 2026 01:00:38 -0700 (PDT)
X-Received: by 2002:a05:622a:841b:10b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-526756d33d1mr39223311cf.11.1784707238338;
        Wed, 22 Jul 2026 01:00:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac7eacsm66595066b.17.2026.07.22.01.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:00:37 -0700 (PDT)
Message-ID: <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:00:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GqlJ0zBjgn-X2wkrw70VFVLULZlCC2hd
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a6078a7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=54rlfCshIiuqjZLbhqIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: GqlJ0zBjgn-X2wkrw70VFVLULZlCC2hd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MyBTYWx0ZWRfX0JVISf2FxVGa
 D6BLVlN43/P7IaUXPSfczamoUVfOyubHM1/+kp31Y3JHlSFoEWtAEjrbothR3bwwS/hgTpti8br
 q4fuklZtab3PdFzIgAeZz/Y5quhxngeF2qZAM/dzDt63TDK+ozkJKaj0yty1MhmEWY1ZJJku7G+
 N+cM0IpGsqvVeuaWMlol/fR2VB1RLLvOlvkE4MlsZa8NKmcKAchBPRWbntYJnHtgdZlM2k1tPFo
 tAZeIWarnLI2+b7jQLZ3Ov27Q/IODY/1C3ybz0Q8ASXLTgNBTbpJwVadgJTQD1/UbDXLXd/XyEa
 IQLVPjgs9WYkRWL399FfKHq2P2IfnLhxsa4fLYoz34s6tb7+d1zg2iFyVFd2rxFH2I9aPeQuPWY
 Pku/ORFPH+vRV4vXZMwLKeg8Mf5KvUKJqBklvSjS2RbxlRwSJLQk3kucy0EXHJ8y9+Ugt5Y9bEU
 BtQtk16wO5ba5yMBKDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MyBTYWx0ZWRfXy4du0CgPVFYq
 PIt/ZC1xzJRQpUa8ePJzS1Ipv71z1B8cLv5HpB1uJpdAlpeIcb/fAEDtw8Bh/5En7LtatpVYFpO
 Huf16N9CWxEDdPSSXU6UZ3OfpCqmqiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220073

On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> The Storm board machine driver targets Google's IPQ806x-based Storm
> reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> has no upstream device tree, no active users and has seen no functional
> changes in years, so the driver is dead weight.
> 
> Remove the driver together with its Kconfig entry and Makefile rule.
> 
> Assisted-by: Claude:claude-opus-4-8

Using AI to `git rm` is definitely tokenmaxxing!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
