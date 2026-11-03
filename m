Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717819;
	b=LOVYISpdk9XTin7VTaM5YzJF3A9p7vqrk0AfaWWYQQayM4/93hGW+tRv/R1NdFBgX9O0
	 FX9Jqh9dxQ1UdNaJJpcnKSo3GXU5Z0VblxkVkza05SobZj5oi4OKzV3j7Ud1nrLH8FYVv
	 D2XlC6Z4k53qkdL5c5kVVz/f5eGUh7llCJZbBAFHbJIc4EH4aDHTJvapm6Rn9/7wTkmTx
	 By6NC5MRR7+1d2KKPkSzIMrA8G7DcvwYn8TuO3CdGYQaOpq00tabcguz1+O+P2B8Ay9Uj
	 qzL1HKtp5KtMM/jr1fZUYtEzZz815Y71owrZ3W0Ajxk7+dyfGUYc/opVkteHMn/Bc7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
	b=5N2MdJRiZObJIT47Fcc5QzEo4SNH1qy2XUUbiXveabEeCHQtImFiBhK4OoEr+GSb6sMb
	 eAOLQ0fb/x7xrct/SvKZ9h4StbrCfo5HJAbqvHPgNv/TgBHpgMsPgBrvQJhg0+Fkp6eip
	 bEk6LtBCtrS7/vBemsdj7g3X21fVraaD9XCbA+J6u8Mf45urqYMWdKcuAHIQ4ZA9/yDSa
	 7ikbGKCRmRvo8DiDNYkjMG9lljyZtn1T+6Pdj2/oHTym+XUsqG7TA7G+L7N77J7QfillV
	 4qlWvhCevU0Sh3Lo5tuvufUd0dYA1AP6M8TdWPESyZ+lehjwC8MNHPawmXr2C+jFTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KZN0YW7/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F746082BC7
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F746082BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZN0YW7/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9uoO3079787
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 14:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CxRFMAsJ+VF
	JvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=; b=F7cpy9Tv7DXa07GrLaw6XePHHgF
	lr9TQbW18YHBYVnh2AFUK3o3FUKk7+AF3BWZmPfIMzjcf55Gh/B1hoMSQsX7IOM0
	PABuRBu5wNHS4JdtysvxjzT54w/5lW5+7kDE8k+qfM+zRjQ91PqnsAGUyoCProsS
	MqnckyTvN5US6YY9O9St5qDpqfoyMypLS5qZn0K/Vha4aX7k9eSacYF+JEsRfUAo
	mhuqyNcFYpE8Q74N1LfGfh5psh8B5Wb/nYuVp/HAc7VcFRlaiDrj/RVxMGtiSdxj
	tD6tq7MCFVcFrrhmVIIGFqDpGXnnVe+ojkEiM2W/p/85m5uabYn4DmeA2ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08749b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 14:56:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so159879585a.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 06:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717818; x=1794322618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=KZN0YW7/f+2Y96RS/pb0Zczi1DBZkMwnJ7PEsW3IByiLmcf+EC38QZ7R3qWgYbFv/h
         PuyGuGd6LoFsGsIn59FhPP3YfF/mpKg4lXbSigv7nsZqAkcEgk9iBb5qvj5mazIgGtm2
         Sr/PE46LEOCRVaRVjkahjQGcNXcEOucariX56dRxI4hEe6Cb4sQDkALquMBdmrI8ZHuQ
         +v0A38jDbI7md55hR01yOzKjDQK0coocQhHzSHUAdHF9wgHlgn1W2qaXT9WTu2+G58AD
         LimdtF4fuf8hWyI/g55SdGnim4R4Ac/NJuD7e3gFsiPGKnF6wf4gIhPCkW2V9dFpo1zX
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717818; x=1794322618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=Q65etkbC/eZNXRj3hm4hrMsWlVHKveOoRWwTddKcrKGHlXOhDjXB5a+1w8HSipqP4B
         94eS03oYRZ/aq4J7scFKcWxB2Y3Mdp38FMjGvcFGr1KCRhATdEjx4+grpninEpkj8NKN
         yTm/OCD2ygeExg4RWCOsHUuLRcUqvZXTfhhr0OYV6TXqJg8355cG0fSQjcgbPC07HOsZ
         Ty3t3KoG08qzm90W5WNDeAg3MOo0VapSG7YJwOyZ8fdoJuIV5C6ftG2ssQrgp1r3g9sf
         uOSVVOTwRbz75wJbjf63cWfGddN0zf787/tExv5i9PY65ROaV5YTgy2ueo75ZqtDIKBc
         +k6A==
X-Forwarded-Encrypted: i=1; AKwUvBwUqUgV+AA/UPspGljfHNL4cMpUr5lY85pAtYJ1niaKm+fFAIPxTx/k2RvdbVLEfI60JEEYTqoPMtVQKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFBI+bJgdW0V0jDqUePn+MgpRcDeJw01Gq8t5FVUuBpoXw8lK
	HR08ToxDOIUWlzThbXbD9QA1mt2AgQsG1tKSULbop5Xyh1BiesxQCuRTufmmukGjr2bOD+9Dnus
	FMYVtUEUEsePWoKXrBCsTHvYov328Mipx0Cj/za0a6KH9teVJSpdbu2UMdsffdUdCIQ==
X-Gm-Gg: AYBFou1pl11RHkwQRYGr8YO6lqujVtmPuDokw4FxHupiVQbEZ7RW2Tg08ILnbE7VYom
	NH4dRHGSMDrSWfi6vxJr/RlfcGJS+5mnbg0Ka9xRI+udqVPu8jdVoauxYLW7Z8GGgSkqJgvogI0
	HDRBTaApnnqSTnSVSwGQ+2lnkOAaZNc6N+lKEev4lxjxu0QB3Rj4zKpXvFGT+miMpyYVrc8lZ1M
	2NgB17j/NSyl5aDK2ySM79dGZfp0sStXmbjF/su3K+1XBP1fiqdN5DkoaBiafTB/WhR8l96B5mS
	ZFHZqFlm2NdtD0P4UhxFgOVueTvDvvoCpN6fM/9Bfs7MoFvgSJksKCWii62cmAbtmjn9CwzQ4cj
	LavdTP36uFTNBbPBk+goufQgCVnci5rnzDEMzlSGhEJBE73KzJgL9L9uP8+HmLg==
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433456085a.21.1793717817664;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433453285a.21.1793717817213;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error path of gpr_alloc_port()
Date: Tue,  3 Nov 2026 15:56:38 +0100
Message-ID: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=U4DKx8MMiCRhcURxj0s5MqGMwNt0kESinKP9ZIRoZRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYlmtozzSuoxt4g+Yf6h4QKEby6PWKuCSTiU
 M1iNwDveb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JQAKCRDBN2bmhouD
 19DyEACOlcNQpYZmE9m21aYxKuhM/A175nzFHKe4HnXyq4p+l6crVJ75W9HI0zhaRmZqciuGpFA
 V20iscomAfrOYRWUmKtrcRL/OusO5KF7dKsH968V8UvqromAv2eXV+gvS0MWawvwbMuAtdS9Mhd
 h2vbAJue3kKjt4XMGN14LLAO55BqENiDHcI3tM22Gc2XlzyRIbvdBd+9O5IFaQIbpEuwiGixGpM
 EN83+bblsAoHimmMLLoLgLxhCr/MbQ/Fdn5L2Idlvwmnq+9J0En9hdpg2UKf1E/Vmtl2SfIAcOi
 we3hobgdwVzLLgqrtWi9OHlI51dfIHO0WQZYZFbQewSHcZh1RhBRUPsfx1Kb/gHJ79fT2UEitMy
 H61MSv0P3NuzaEQZbZhfEAUHfthokjZJ7Dclpj3smthNjYesq9Oun1DRLLEguGFS+/Qkrsj5xvE
 ZxYMnPiTEQKXiu9NoS6M4jyQZUQl9UZ10gymoaK22F4TyWlGRPx/Q3orlsOc47G7URkVRhGsxOi
 H2Ru62FnxJdPYnnEQ6DIhLiUcpVipfOVL5Y79EubVy0HfPdN69EyC7DrMRiRkUKqNsPNsq0o2EM
 Qx+4FfIdbYunvzMvn+YMoVHPkyBppxnXgdm3vWDMqJqUWFxmE4CBXOLJxNS89t5WCKTou6wR+bP zyW642TPYGaKpqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX0wOCEJuYu4/4
 lgDZgAGibJkuAtJpiB5djsUfOQNPvXVaH+k9951aJ5hJH+UdMhuLPoJl0f5u5boZEPgxu/QVBHT
 UVOMDA3erT1gQB5codsEk91Lr/shk5Q=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9f63a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M4xG5xDUUUIxRXP9NZYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX6VlewXMIlC1t
 3IGqaMUvDsjSmVhxBmXHwwk+fF3qfZG+TcdNlXRrCXdLZuQSauKYzGBjpCLpWPvGq8Bu8CrQWJX
 mnhDZJT12f2S1UNzip/NI6qH3Dqw4FvVZizsMuTUYlW2JWHnQNNl7SOTsMRrhZ+EtwxJx+ANora
 orYG/rIao8Bhr4RQjCIAs3OxPtV45re7zglnwAqSYgRwOSq1quuEXlCG6juDmyxx1VdbSAM/sn+
 x2V/RaohObS0cR2up6FoUss9b7ndmyWZP2DOQI9PhA+Uk0dA3Yv3cSEOEzwN8iMiBimNhRyNGu8
 OEL//AX5RcA+JfaZpRIaMjdaESpXM5hLFdA6Lvp4JOV4HgoyztFex10n71GBByhOwmxSBtmsjmJ
 4QUb1W/Usc8d8LEas73+kB+GUC3mZGzHq7MRYV0vZfSarMejtVu5Bb6kNWSaZTAnWmWjASUU/wX
 XJPKwx2VzOYDw6GpQIQ==
X-Proofpoint-ORIG-GUID: YY2jK-uBz3hug3yUr9CUmzsrVHzXyEug
X-Proofpoint-GUID: YY2jK-uBz3hug3yUr9CUmzsrVHzXyEug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030059

Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
printing error message and freeing the local memory, because the
allocated memory is not published outside of this context.  Shorter
critical section makes system more responsive, although gain won't be
likely because it is only an error path.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 80056bd0686b..edddf473943c 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -117,9 +117,9 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
 			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
 	if (id < 0) {
+		spin_unlock(&pr->svcs_lock);
 		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
 		kfree(port);
-		spin_unlock(&pr->svcs_lock);
 		return ERR_PTR(id);
 	}
 
-- 
2.53.0

