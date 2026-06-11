Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7C33F360
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177411; cv=none; b=ucs5YB9Qwyyi07N4iunfmukuuOxEW2svXcVnFaH54DQeLVYzmcqTTalVxiujBxw2+OfK/89XmxqkXAQdWIAt1EqCcUvzbHUb80FSWFstQx1uAcgTiQfoTswvGSC8H+7MI5tY8n2c6YrZ6IVeiCtBuxa+RYHt4EguODrTiS+VZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177411; c=relaxed/simple;
	bh=DFBGBI+Fb4TWrbyw8ZhZzKweTDZK+wYo6QnsOwCN+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sspkUBsWBuSV/hM/pZgp8cFB0FHhp79qn7ba1LcGIGWfi9/WxUyL1W/JJOUI+6TKSw+IKtqNuFaMuM1bSNL1Iid0kRiNayJnDeBZLaaDzatan7tj/VjJm7Aea7HVTB6gdr8rkuZMzKoQWrk+195S4THSm7h3UOKqVJBwuNkIUEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDW/fS+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFG1qcpS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDW/fS+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFG1qcpS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA110W299664
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VwDoNWR3cgc
	GYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=; b=KDW/fS+C5icZv8KjpUzm/iddFJQ
	VHXCmCrIXb2+5myqa/5XfktpZoaAtWKEiIbPq1Bdm0nTg9X3IZNL+uxMR0U0HX/U
	SWckIWBn6P+iEz6sLAe3XcueGqjRRBAX0/pV1qTCuiLsocAzX11m3v37yLucE3gD
	kjsxtFAyFCe6bJ6FmYcdvEWuT8FHSBMPcY4nz5F4RQyC5iJPWHo0EtczrEJItII/
	iHLsa4EjHqLeHMWO5IMm7EXTj2pGvwlmcBXq+d24reEibbwDH7NQINfHm6bI+UP5
	pmlc8oMGDB9Aj7dLkPx0qhUj2SxfFAtzYusR1/DdJGSzrlJJy6qEeQ34QRg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7034fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842208d5b0eso5874097b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177408; x=1781782208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=dFG1qcpS2cEjoCqwMn9uTxRkc2plmV88JCeQaV27/Ek32UARQnq0w/zPTRexbJ8VNe
         NZy52SUrG/nK664SY+avM64cuy+Kvn53Erte5OlYqY8wbYlw6PkVGWUqKv9XeURoc2VL
         JQJrf0zb9itWmBWC2F8JkE7QE58/xwAh9a+O3l6beyd65f0cJojmf4YM7m8+dVB8OURx
         cd1nV499qhkwq6GYXRJUn6zOQX3Uu5YHQHiCvvIRNHKAA7rwZbq+YcAjpK+NXEZe96ZH
         Y96PKTJPCiixfZH6f8jERemEsI6l2LzaiNkVwTp0EKsG/CFEdz5vObpiRbBe5zp7R82Y
         W+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177408; x=1781782208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=j9t4xqJc/Nwag+WITKz2QaLjiET0X0d5Kih/POxGAOORPp2LKVAJ4ni+EapAw+kO8j
         JAbsDC/VmV7bMbKGe0q3GGQ3eFdNYdrKqcKXi2rYt7FQQrCUBWQGqP6GI0LUGL6xq84e
         dwOACMpQ5emCWlb/wGV0mZBKjb7Etu1q8nE35vwKlh3tAL5WzXiKN5lGKGMwRZ1k3BvG
         PmxciKhh8vu2s0KPFz8X66VDXeTr3iZpectx2XXNt0KT1ai7gG3Ehp6SElaW9nRhuDuE
         Ga4AA0LbXuY27OT35dvVbPD0L3+3DmYs24IL7o6yrPaO1BMqr4XiZiFHDfVwAXfjrDp0
         FvCA==
X-Gm-Message-State: AOJu0YyOZW2s8X+mkzwhToMNC71gj3W86Caea0e5TSY4ozZVD+2qaOcO
	mn5XX/4wN0yyw45aEUlLdmGfD5IqVmcR4lJqgazFe24stwDaQlyrF5CqahjK5s6Lb/lzauUaAVX
	NhdmumcCztpDvQjACjSqLhMRaFrSyYxx2l0gSfrQBqlVq7kmQrfIkF/o0poDMF3mKEw==
X-Gm-Gg: Acq92OEbL7PwLeYW7SxG6k9+oP8Oe10ZkiW2qVhM8ejikucehaoWaJKOU+5TCmi3rZR
	DZWMyDpFJxWQHMvx/IBU74jD52bkNCAjkdfTDvbjD9TQ/4BrsoAlfyl+hvsJAeSQ4TCjllVF4D9
	KxL/aJcAc9yDmF5bPXpBsfe5eeABDcyoQ8pQqMLYsLUqcyLkHhJsgh7oCLhZgE5yFjraOdQndP1
	pnYZgyGr/2EjLnYVXTNdNKKPgjtvh7bfxubIHnKwjrrS0u0QMUmqP5uV1AlI+rggmaFJPR9PTs/
	+T01CyXBE6a2B129uBQATMOqDBsSRHPy2PPTlC2zFMT3Su9kOFijBcI1CAja3B4TJrf7sCwj3Ep
	YW58Q1P8IE3C/6yvtvuJ7N4QPFPk8dlVSP2BhYe95pg5f8LaqcQsp3z5vvaOf
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2718010b3a.33.1781177407361;
        Thu, 11 Jun 2026 04:30:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2717963b3a.33.1781177406887;
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
Date: Thu, 11 Jun 2026 16:59:45 +0530
Message-Id: <20260611112946.954172-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4B8NoU5gkttNnTX0DMYgzvBc7kOOuYPL
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9c40 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IO9S6bmGf6N6HOI-BKEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX4Fk+f4i3hWux
 vYrRljahQRGDvaXUN719TRXKwphxDOCTxp6uedlUhpJC2mcG1Arma4m9RUh6FRncxHS5898rvZy
 6dBvUFhE0nP6NrLsh//fJ75s2ET4Jh3Ay7+JkKCj8DWKaboARbsaLxec/BO5BcgDLtapX7ND/S0
 oOflxBVPzqR6cbqw7FqXbVKSqD3dQ5iu3DE0+m2knVlb3kBiDAlowWV0DBGcDg8FijqJzaCVkM/
 nxq3duw6VsKIXLaqdhoKI4CtWyv3gIyPmKH862Zidl1K6DdS1xGaaF+cPpXYw/TzwGoVhGns6p7
 kT9uZBcWb3EXb+/7kgK1QRqShVJArnF6tWA5THCbDmM4962DE+97RlEYyM+R9y255jPGUhY7ZMD
 nxb+m+KGZDSrdKTWeZFIHJW+JQhOZPiyjuKtBwf55rIQZ5oNMOT4SeWOrp2XTuu2doeeVv5D5ab
 ufQMpkQAnWNX3iXePJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX2VznJEOrrHHD
 XtoZXodJymHF6EHliSM6HdAzkecELsqIFv7w3aijzcwRI2WxZoMt9181X0Jsg8x3mmhtAjni/sm
 64nMNgddnuRJYZi3FssAsrdjvjoK87s=
X-Proofpoint-ORIG-GUID: 4B8NoU5gkttNnTX0DMYgzvBc7kOOuYPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b..c5c7284bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -45,6 +45,9 @@ properties:
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
-- 
2.34.1
