Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229C3BB57
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629642; cv=none; b=fPrNrPyFnanmCbkJQCd5zgQA5Bu7dVKBB3LN8rXAwXPZPY+6PHKUwi2+mMInWLALOB/hBnKeUG9gW96/ASqM4S+RDJS2q1abNbAUgrNYiyfBLG2GygX5CdlzCyMiKSSwme3oLlhu22oBVL5DwDMTijYixKG+TVO+lE5noyaXXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629642; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfLhP1nlafgOMMxx8RExpVUo3O1zdvaTdGNRjiyduqpF+fSSD8tiItxU4GDktDoUTUilI3epcGWpi6pl3Vil0KO9zmDxD03OfTe1VrACHE/Q6eRk+7vKbrci8XOJKl4jjttnuI5P5CCGEyUNyZVrO8IM3uU0pbOJTyl7gRm+Jh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agljdLx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9ZLpth8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agljdLx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9ZLpth8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D51UV2275166
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=agljdLx+cxPzcUVzBVOIsLql/em
	iy9AQWlyf8q5bORCFczmpdX2CI1Q9ANGflc5qYghtqlEgDmotcdMfnzE33B8TPre
	2spOcRL3RHhwIensSpLIYLiF3x2ZbNrX6pguhjq2FaC/nfJZu4RY2Rdtous9snss
	WqMqnq9eOXijcpYQEmQAXbPF3wBo/VgwoBgaQAcHLTCRWB1C29u62VT+CyXO+m9v
	3KvnASUuvlz3NhwyIL0THlWhL4W4kAuXXdSbg5jin7DW5BemET+RwQj0JneZp+U7
	EnMtP9X9YlOsF51vUjeA8Ld1NKKBbMuQHpAiXVm3vYk7vndVY5dqksEL2bw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msw5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso4258101385a.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629639; x=1773234439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=R9ZLpth8GfpwQgYgphlGuWzPDoDYG7LCK1+THUH4b1HV7mnROcuWNbdg0+csexuyLX
         wO2PQ6UHUGZtmzGTPnCGmF351EfsM/DFTSU78W2M3nBw6BLTXx0ajUlNK+bcnSieXc5F
         owkGn8hxN2JC123TXbZ7K4Fh/LOOU/wyaIJfqNZGQbmGF/r+FKmuJd3rkymJLStu6ouF
         P24tKwVXAKfKbfIP9TWyyLEWDJuTfrgPdlq+5qPJoxr1SURCXTtJbOPO5mE5j7ssQSs0
         yvTheK4LvsRYTaY7WcJcABUPjOXH+YONSVgIpYmwS0eRxZr4Yh1LXTocWd1ZLtC2r5mh
         X2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629639; x=1773234439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=qfmAKFFWNJR68IyOCXdJ8Dfe2Sokk4oq4c9IGgvDywJzS5zlu3fFNK7Wr5c05j0Jwq
         Tc+O//qBtRRrdyVM+cwLCfYhXFXAh+o/C8v+U2SuStMfiRY2iv1iRIL5JE0ewL5ub0wD
         d3zVRPJNBVEomdRkESiHtTJUdc+Tz5jAUmoq78c9Qpk4ox6VuGKnz5dCeibx9zgwXlQm
         IJRcRn5HN6MZk6Qou888TEylqjZWTXWBRVQm/y/PhXvdYA3fq/wdhToL5BrnBdK7IfBm
         8zfVhRUxlMoTkPxLyi65zeM69Ng8luuHVtw4c7OxmjnamzE0US3BTMfLIrr+xqHQNmNK
         Ju5w==
X-Forwarded-Encrypted: i=1; AJvYcCXPfKMNCb68+hBzwS6UwxiHNatW3Z9oDk1/Y7yj2FNwuO7KnVGTEOp98KtQLaxOTClu1tYPUZo1iqOwBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4F/VY1YbZS11KlmQoi1OPLOs5TjxukOYGo2yzm9L+aXkDCEe
	BzX5RIH11ypuHtmGT+JZDYriWZfoCJKJaXT1ZRZ1aog7a0T2ePh+5vKkfPwiB/hvTlTvMMH5oRp
	iAFT2DwsO35dpBYMx51pOWn3vMCn4st1WFi45ko9bnFvhWjaccT8h3h/Lih8jw8rMbw==
X-Gm-Gg: ATEYQzxuaYwpuO3UYSp3d8GT0kxZ0wsrSGAS/4tTQckiW92OMrRMJSnehjJpMN5wanA
	f4EJOap8JNet/UcSc8l8buJRfA9cwvO+Zbou6OJcdxlcrgFMicDyXUZ/X/5tco65/BQd+uoEQKY
	Qxz0rZnGWDLJC2/nKDU/0Xy4OZ7VJFyib2yV239PK8qh57qTV/zpYiBhg5Tw/cpANQp2hzeQ0jE
	Qw29bQBodbLDOirmN/5eaafjjarUeAKGigRTIVtSuBA6sdLLFMdE0smtHHfbWo0rlIj1JoNeLgH
	Eaeu0jtoJ2SFaVmIWdjgH7/3dV+q/Ee9S93CcnhSs64h0a7GpyoffUVUA608t3NoAHsAHGfhlaM
	tg/EePjxTUHJL+FvcHJ1DVY8EkOV4UHbAp/EYjwZq0XRyk7KxSRftsUI=
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr229277285a.41.1772629639553;
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr229272285a.41.1772629639060;
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 02/14] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Wed,  4 Mar 2026 13:07:00 +0000
Message-ID: <20260304130712.222246-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iQfn1TVUVfGB_nmTsQ9I71RCFDz1rCWl
X-Proofpoint-GUID: iQfn1TVUVfGB_nmTsQ9I71RCFDz1rCWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX5bQIajA++sCT
 GZjqpT/Dd3/pCHuDyBSzqhSnp/8JBwV/uyWnOonZYsiu5A9KXFTCL0Ha43ZRPRXkJdgnbKoMkAj
 LpHwP1L0UYgcfourpgmxPq4F4FZyd4Ms34pgKVzenqA85NjAIfKHB+QGhcF0m4vzUNrBhUoNwI3
 JSamqlgEGLI/qNIHpzsznKxR4LbwGOEzlcDxrZ+l3rxnnxUbulGyDccq3gREtQWYU/gXNznDfiz
 8zz36sSKWhtMqdnitQkt6wOfMXJPKgncMncY/z0Zs/UuQxmbISHsK2oJe73dNeAU0XUytsjmP2Q
 /GB6wTdo9zfDJXhBySZT8yo0Ofc+ErnmAmVL32jOJAOvnq06/lOvpC+27KGdNZy0PZLBm0NqTp3
 /DDaGtbDwUcIqHnQcLwkezmrdKQRC9nvOFZWBY5Xn5UTAKhQOBxKbnG/Im2l9TJ+OSuJ8i++xsE
 +FCHs1IMA+hDyBcTzdA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a82e88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4c662be52e0..ebd5e3ac0366 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3

