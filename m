Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFC27E049
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629643; cv=none; b=YrkDxP+J5Py7YSBE60oIYov0Z5S6DuWMGfXjQGWapoVfgwxtVGi9Uc4fJ4BRxGVnWTJm8B4aOHxyOvRc2w9elmoTjdGFyaM4hXpR2GfylAG5/II4C2veR+FFGFvsYfk609BlEKxMKxRgP0H/DGMbkO976CHm6ryXQ38qRLrzl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629643; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S29a35x30GDpZqdvDuZ1vBtfoKrNfPwqLtVdy5u9wB2aPjoqiqA7cjX/S2FwjbNcN4QaiY+iBhHhMWdOn+hFyr4An6CEfkQ1lUDoUpxKlwVCnQBrxAth0WPeDMIyHvl+zhYM9DShvLYKabKPHZim1x/5OfKl4ZVVUTSYPFCUoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnuxjyGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZyH4uw7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnuxjyGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZyH4uw7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D0mNM1422295
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=JnuxjyGn0g8xI2Fhz/yc/us5pm5
	dQ1wXrsyOsZJiOhLb1UBZSyE8HP2SeUjDUV4tROqakBkBXIG8HzAaCR0yNKvy+Rn
	83GU+s13of1G0m7YuQCDKz1iR5C8D18Ekag0bUFPqOGBxiyzuie1oR8Mby3zJrq1
	s34xcFGScVL+ME4neSTUfy5hkxXRoyhCwVTOCjBva1dirb0va2Gfs/t+1pgebIge
	yHRwwy1vnFfPeiy2Km/u6nA9qbX9fJJHbJiATqItumoZtA5dXkqPutwj8SGE0VyH
	1RWZUu4B6+F1dup5Ix48PvHXW6WkgILxPe43ajEumCiOpnp06qq/5nn5g2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1fsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5345282285a.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629641; x=1773234441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=fZyH4uw7y2/4C0AjD5jSrEGt0dmxAE72+OlM/rfIlFNYNFmfvPxpyTUsdLwrV0AYU+
         xU60BrvztMAw6yegMGYn8vzSMusXgBQXrEbqytblJRxtwqFg3n68sH78CmmpKdTZxomh
         8dByMD9AYqo7ljp78H11/znSRj5LEbZ5o96fZ8ZbKoIYfRM1e9RkpsDM6osfdH388dwG
         qUGNnLxpF0du/OTtorme0VQbv3pOl532ttpTwNy6i7Dn55t13pBtREDPysc8OYO2yQQk
         vDTr4VzrLfU4mPmZW+AQqzAaeiIwsBaa7V8KWWYHZ5ZqBXGQr4A8dmalAb4Eyx4BvwqQ
         Zj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629641; x=1773234441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=aim4M1+DWJSmGMjccW8Yky9NE+4ulSYM4vRCQV97fCnzQhKuqoBfwaedT7n9p22+js
         SLcmrAUVsZ0OFTVdx+4xWK75pZ1aPAwhvMmsan5QAl0QisC/Q1GDQaO1jpUV7u6PVGkB
         28WcnccXmvlXYADkFnBmOLQd54GYrsks/IjuaE6Yki5Ia+ulItqK/bJf3UUgoNYOqezD
         56AwgWryImxBLBXSg09KF33iKY1ALjHaA7UiX9gnQ5JzmPi1jVtZznVKR5n16cJZgppu
         D+GUXirh9jNOjYzgcO2rgirA2Q+xcsTB0wVx8CXdqIWOWdYK1j/HUyeaS4edivELbYDe
         Xd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+b5Uh/1nVxUQmOUxhFAPoy/Ran+mY3/ypCAh2SgCF3tgaY5gisi/Gz211JtOldNrnmkczPukaIvJEaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAO3p4sMa/9bvbpcVAfYlYXeK4gO7IcE618VGNA/r0ketEnf8
	O76iui0EmPvatk/rG2WwnC3Ev8V2YBAspaXtlduCynT+2mNF/VpGKV1VlByycI96cDiDSNTqPzr
	CNxWAKJ2WPGYWSJh+KKG7KbK0ukh1OZsV7Ff2e6DLNJo+l9U1oXJH0pSx19cHjCpkiQ==
X-Gm-Gg: ATEYQzxyCbb473f25ior1ll4Ew/7A/+UrzsWyghS18rGxIvf//ljQVYwRK1ma0K4QDB
	nyv/Qcryi7UQYR7+BJOpao7n6ZPpzW3Rvq7Ozvap3XmmsQNKN5STLepABYlPoRdi/FejJyG+1Ne
	UeCtljrUTXtpP5YhOlN6lDgFRSkLnKXOyMOSSIi82fhYYm7W26RpDBhJ06dYY+/Adl5kLYW2uze
	W7rk9tKXwGxI8MndnFGul0uW2k5D+NEfyjQM1hrZDOxIvKCW0qMSr+15QuVS5Y4EI/qW7FooCiB
	L4Md+/ZKBlsByQHMUstfdF2W3GoVOHGaDljx21/PcU+EIdUkAXjmFogYFtb2hv3e59hvQATXwi4
	Q8YmGm2oDCbncF68aPfrAuONcBLZM4tLMvnLWkWNyyybEtb+1Q6iOIoE=
X-Received: by 2002:a05:620a:45a8:b0:8c6:c983:dddb with SMTP id af79cd13be357-8cd505e251fmr619597385a.0.1772629640877;
        Wed, 04 Mar 2026 05:07:20 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:8c6:c983:dddb with SMTP id af79cd13be357-8cd505e251fmr619592585a.0.1772629640326;
        Wed, 04 Mar 2026 05:07:20 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 03/14] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Wed,  4 Mar 2026 13:07:01 +0000
Message-ID: <20260304130712.222246-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EvfNxXPwHRDI_3VIgjkzcXDNHZlSGniM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX9Ta7W5DPjoE9
 5PYC/26Rp5etliTCiEMKfoEw8tXsn0U3mL09Ah6sT74tETnSHJ8iQ1nIs2SjgH9rlEVIjW3FeWa
 z9NLUaoZSXLLovZQq4Rpfo7x4nkp8Rb9WkpQTpwHAwMV8OtdEy4Y6BnEMtz3f6nqig3dz9q+QuL
 z8qrKoQUbKACg8mEvtr4eNcyf2uQIX4d7kpqrsu9Z22Uq8RHbGau+rGmuSaNJxSqJB2ZgfCoKIj
 BpPq132PvY6DmnnR4cutK2Uq2umE2mn40bN2ckZ8OYiR3ZOhfTKOFi+f1u7agGTGkSJ91K7C9DB
 o/ZAVVNXKN0xKO9W1Mpw8bLKeDgZpkfnM2vtK1zXUUMVO1G7VeZ6B2ytaDAyjaonQ4ShsgSKvsJ
 SjE42DKyzy70yLcBdujK77FIXCZfkONNEGBBfm16ZDH4tPhA+3adkZ1lh2WJGecGXd23IrCGDCn
 nHSvDZOe8vOhoDyIwTA==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a82e89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EvfNxXPwHRDI_3VIgjkzcXDNHZlSGniM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

