Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD7392C35
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799742; cv=none; b=ahkifXU3aUrG2qPN4HaYm8WVor7Nkr5fAabMOs7bn2Dv1qzSf+/WWP0o9zILiB9wIePBpyuqpyf2CfPvf+N355uf8T21wmNdl7no3pgpavNNsbBP77SslSNsXvAB1TJ5uPZLIiRK89F7uwEr0pSEj6pUabPALWiJ2EqJKHcDqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799742; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oE8yevTAjVl9pgmA2qzi2ky23UwkHzkHXlDg9EXKo/L+uGuEoHDkd11/MxImuaUg2EwDSeed+T554Q2ZPQNUlStZG4gmDmNL80OxLEEj2RkMpViLR0XovGeEE1L8vt3cK2a5zmXLFCspawjn/lzxcYl4ae7/FZsd7qIKzLRPu5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6j9A4S8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJlvksrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6j9A4S8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJlvksrG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbG6U2022714
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=X6j9A4S8/ZYYxhKpevuaYEVz6GE
	GPd9JoHZsrekQm5J4PH9iFEv5JF/ohDFNmRX2xtD5z8Zf5Y2cDCxi29PEKTrHFbP
	tXiLi1eBcDDLsX0up2XNwtDi/sufdJU1Fp8BuksbhICeq51Qer6oPdASr46Q8N4p
	uumAY+UKtBau70RlPnvDdYoljBdJcHW8mMbMDI+crz/lpjWMeJalZM+gVNH1pvAL
	76z2mmuvpYyzQFDJ1vqRg6WniOgpCO4IO5ZZV0S6dZgyQ8YtG1yamEqn55Rad+9D
	On139bWonIdCI3NGmEz2aMloyWxco3/ZfShMU7EVfYo1Qi8IhISOWUvXPEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6b3m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso1506798585a.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799733; x=1773404533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=YJlvksrGiaP0nVmTxP7ctRR2Pyzdq85j00iQe9Ex2dr+u0JFQhwOL6t0VoQc3bc4Xo
         mX+B/ZlVu64WXb6EGuVGAyp0Bnwg4S0ZTg/Z8NiZ3gVlmGngg7HavzrHoBSCHbXbjw38
         bkPE71b+wYsTUdc6znwOqJRMxLId/ZdZ0lKTeRPbxBjS8RuZE0MOXhqxLoINEgZ6BayT
         UrVMjJmdU/rcOCVmExoAg00thxJLUsla+6e7ia0bhsB8sSve2JkrEyx3MqXzvmQqoxog
         Q6hjlaRBIIgHzx1w6pPSf+XrDDyfYVDSWMbZSP2oz3wqZS78YvfBxwvTN4HlcbZ+domm
         eAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799733; x=1773404533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=EykfMpxnDLvE0kAxddsB9MPTMQxWmu69IOmu/jm06RTsTLDQwzRVm90Eagu5XCFt8i
         reB0TFAwGgftSECHvdg57D1Hn0Kxorh2EmObgmreLQpUr78ONYzLAdsaKAIVziLl3RYH
         jzlvQNKcfLrf1omgXdqw6cxb/onBLfW9CdWgqEMzqEsHXk4PiVIgIJLA6lmykBa61QNI
         13Vo3RN46cM2iQo0lc2wenPTBx3/YoNAWgyp8NgwqT9kEMUGkRS/usghMSy0A7Qqpb11
         GEtQ8fLwHjm29MTkc9HICvm5SZKHf0/1FBbBw6kLkGAn80OnuR2f/7uUqpMaJVu6p+Lb
         x9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWfSkmRDUft3SPwWSOlffYjxkZXLjqVK2lnuS2TP6MRyNVh1JQv64om8az9VFrI0dtPnidklyu8u4ydiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSfyxWLEmBtiTNtV+Tgp7Y6Yc0N+I2hazFhoFGG5v/unkmnhl
	N5hsai7N+Ajya/Darql/EHfRyF+TRUgvXeYZMCEMyMSLGBQYUl33NxyCbusB0uLu6AJeo6L2uMR
	ngNxucS1wfWuvIpptZNjroP+P0ya7IBG35q5B4qn6Q8Bm0NhnrlpjpXrT+Xz58MnVcA==
X-Gm-Gg: ATEYQzzzInx3meamaEs6cg5gJJq9FspHa3Ly9rNYuoIO+SEZctdNOIa0YkUOUuRrpjg
	6/+bJfDg0IyezmCd+DFCsSjvPiNCLuSMO6CbxoJwulx8s8+6j11H0tGcd/4hqUxtLWMB86Qv3TK
	G1TEXCpq7iIgI0ltPz/f0CUpoCO4aEPCALczsA0edZ+ubP1cTPTd6DYi6oCBiiv6pkHRnmquKgl
	jywNI1IIYytqhlfUI7B+pT147A2hSVHEwdtcjX8g3ETTV82ystPwMsCV0Mo5EO5HO1mb/65kf6v
	kNMrgrUdEY6KImCvW3egbbV4RDEIgIDXPsLwzz5+MOypsVDU+lrAnEDylOIamVXAakNfAW8O1za
	QHk6Um4WydItXTg2iSvz8jimrYESYenWEy3jTBBqxFh5sj+Osx1UbjRE=
X-Received: by 2002:a05:620a:408e:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cd6d43d5eemr233444385a.30.1772799733226;
        Fri, 06 Mar 2026 04:22:13 -0800 (PST)
X-Received: by 2002:a05:620a:408e:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cd6d43d5eemr233440085a.30.1772799732770;
        Fri, 06 Mar 2026 04:22:12 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:12 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Fri,  6 Mar 2026 12:21:12 +0000
Message-ID: <20260306122115.509705-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zmDyS0h56OAWIq7iL97j3Ek6nWVkz-LN
X-Proofpoint-ORIG-GUID: zmDyS0h56OAWIq7iL97j3Ek6nWVkz-LN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX27gKRdrbbm+T
 kKoDXsXcliuaxNyaLD/nf3pTauDmdO6V97AcU/A2yEOGpZr3NfilzkG/LyYWIrUaXbdhfZGOK/k
 RryyzpZdpyzT/IZ7mvccXBsan84ZTyddl5XZQPPV8yolgGf4I55olB2h4SuVP6fxtKusPfrUAyh
 jfbogzHdDbZJYwixBcshnkdUk4EjJBVsjTijSqtkDr/3ygouQrW2IBwBLGec+EqVn0wruULUA7F
 S5W9L83M0IcMPcoh4V1GB8P6V6uqfrw3h6PlLQZwcCHsREQgngt93BgolzfbsTGU0jICc3quA0h
 kU+lxkuSZkvAZKv7UAvASxSfZG8d1ibsa9zkbrVCdyIzIe8DwRUhE93IkNrjRiQgMkLGDHyu5ct
 Mn6VAHc+EPEBvsqc4ugrnIalp50CSRn/qXR80mNuwceew10fkVqWCNbWNd3a7pgYHdcPk3S+dLX
 lPvLiIb5EBTZU1qMAVQ==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aac6f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f68d4b4974f3..472b2114c81e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

