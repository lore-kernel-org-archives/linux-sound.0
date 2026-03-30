Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BA3ACA7A
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858903; cv=none; b=eMFpGZrlJiJCGiBVFa5dlsj7DCocsFpnZB42g06PU9M7VdDmPcKr2j12NdRCNa5wao+VkAkF+QsGeFc9fI0xeps1cHlUlaLFoGQGeucIiWLQ+KER9zie/PmLzE3Id26wk4DXCnAOUVEr8sss6sDRwm7G3Y7oNGJOQCVXuI1baZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858903; c=relaxed/simple;
	bh=Y2gMg9r9rY5Id6C816eYq1RewX5CB2zXG/L5mc3pjP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikBs3NBNsbYEvbBroes7Iw8WRVazLVyZtV1QUgjRQk8wpZM+ZcT3wGmR6/+Ue5LIw3gIlhwe2TtjJ2cyvLFNRNm3Sz7vJ+DRsn6uEZEulAwLx0skQ4FY5c4EsExBw5x+uDuX3KM3+HnfajF6YdyOzNeRy597uJ5GVBcBih9QqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jzn6VMyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnIZJKFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jzn6VMyD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnIZJKFN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3nN1m3931907
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7B75lNNFNuA
	Ypi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=; b=Jzn6VMyD/t72QhmbJmpDDhXFs48
	Yh5GEsd+nAQ4nhJGc6i1wIlee03pm2x7L/BlTw4SPEDFdlmAdB2T5QsmFYccbL9v
	O1Zw4jG6vCr5GAZJqkx/OLjOel1RF3ZZQNwlKY469bh6twYAP4cguBXHoD0ZOKBV
	86eoPuQd11CioifkD7zgu1MqOTXHYNNEVTFuUjd1/0YOiku3gaxu4mkHS9KtcG5c
	YKenPo5iBglxk/SRkJAmDLEb8/jhHoyTqoLIRpXDUw5T9IHGNgpvzU/PxFb+pw9C
	PD1wbskWyea6glHxsz+U31iHECwwpxaF6xPCVXgAKjhGiccnTf2RHGlkUuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pddh0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2cbe7223so139843241cf.2
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858900; x=1775463700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=NnIZJKFN2UK1MgoNG1UBIhSWAiBvBiutW3sohhdWihKdA1uEcjAufvjQhTA9j6Y95K
         1LKd4ruHNqytfQHa+4OdMyxxAD3kcR+ljUe1mI4yIfiFsC1gjSPCgaqnwEDZBKn6kjwn
         DogMssGEMjO4Rpn/KkePvOxeNmHjvzFP+/yI7CuRJQvIwsgDNY7YY5CnIYC/GDkYS63d
         JE8y+GAg3BgWSU3F44QwfYjhEBdzYv4Sxa1Vo3vsRo01G+TQYYdh6v3D3pHTiCiozQ+d
         R3PvvhzMxGoguLbsJsSYqyjp5SKZGhn2WdavGZadP/AzqDzEDy8CDV6qQfeCPTqr01IJ
         U7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858900; x=1775463700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=hLTxyzQUIY8cqPXMwD1pkfEQxb2XK3oLatg3pp9A3GepjP2MRyPZf0iziH4H4p+r5k
         cfpzPthgEfR9p/XKnl/v+q+ElDODlFnBuj3zN/WqbF2o7nW5A6gVSfiK+yBf4YlLyQuF
         oBXR4Qf7d4wrR5zDx3+1zyqmt+GGJyJPU2Ff2la8Orjnktiq2u5J0rx4A/IBBHFkQPsO
         bKQ/vkqvKssGxhFwqtOc0tyGbY4tDWQ5xqEuBt+NJlkYlqGkkBT2uuFXBZZSdvE7mx+W
         dZXwE97Kk9jvjgM7HG4kKx1vw66V0XBo+gW8rp1Tj6lwY0tUelcsR8gQ99r+NUxHmRkw
         HXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjTjAL2YNYly5WVHcAdzJpRXb5Vn32Ar2UubYsVGx9wJLEPPL3+HdvPgVoT+4ol3XNVPgWhfNK1kCPJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94ueyQn+e+axs5LjY41evt07L+bnsR9s94nf7SW2OVKO9qjLg
	EEahU21s1pnLKFOaVpSShjgqUUC1p7W/tRm/PyPrqKLTb1K4uXJW4Gqv5RCvOGZw0R78Ppr36EO
	PwqoLSheVejpCAb3NnjqAk8GWLCdk3NJ2jw+YIJ6rAAyVKJpXBqFRcXCqd/bQ/z/fwg==
X-Gm-Gg: ATEYQzwB40fyU1FdyJ2pS5FO1JMIcV6kGhk2n/r9nhQLPJtohuiLLtvA1qjomq9blRm
	XAm8FDZVzsOYJ2yb4rOk8skSqkxXc9r0zHe6jmaPR4vLUFRPUJzJb4/58GiLB9D4Lj/8Pw6Q5NH
	zIK5+OSmQQDZCQV5/3d0cueH1QTCo7EdfN5Y0mrVcaAZruqNWOaFY3IdE1GBRHFzTNAmRkbMZdP
	PgBoUs4PgSa8ufU5mxif2JuHWr8USoh+pKUDWSwCEoZJ14eTKSMcO1aN6T8e90bBjuLayceX34E
	J87D1VybbacOi7vbpvRoSXwzSPHL5h5hKMrEjKW8sXM5R6mcEE9iHNCA2uAN3zoIZHHBXsa6BhO
	4HvXOCfr3FPZMtlp0zznUxZMcKdPgrGrfCcUjgRphaKksddftgIV2f/w=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155380281cf.17.1774858900196;
        Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155379951cf.17.1774858899803;
        Mon, 30 Mar 2026 01:21:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 30 Mar 2026 08:20:55 +0000
Message-ID: <20260330082105.278055-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q-xCpGomqxe1YIaSDgFxlsHAurR8MnAi
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca3295 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5HTw2GpdgXbBP0wXRk4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Q-xCpGomqxe1YIaSDgFxlsHAurR8MnAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXzsbyncri5HQr
 Ca0O8QkI8rPG1M+WdmRgDBdQDY5NxswUtNCLQu9fPY0tI0M+1m9nZL3Mpii4GagHY5ssS4zFcf7
 UIv/MzzNcEvPDRzJESDTAdWDXzz2A9ccHcmLXt2Py0+OCPVlIQhPT0HFhikKSSgTQALEquuhfwT
 6yXdF6OXtxveNCWrVnl1dgwwFMYPxhAtcStCyqjBCo2jVM29JuzWm3Ij+hI/RBGaY6r56UtuTgD
 /0RqxofbTdRf5pag12wXOLYvlBVG/8hDL438oc6oxGk7QTtlEBUlsvpJbxBiK7mUFOJDYobLmbW
 gksurtTAkYlQ7sh2FZPyEpxBtlGssyAm7XnAu+8A6Fj0ZJZsVB+O6osqqW7/dlQmcIKiO7o5Riz
 X0yxSnjK6H5QdYywlE6jI8tfKgDx0SOBij+K78Bm5d1D0RBqxG0IzaWsLuRPJ7uP7idgWtSyMnK
 BggNnUZ5WIwrFR3Nm6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Cc: <Stable@vger.kernel.org>
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

