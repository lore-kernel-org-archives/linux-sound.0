Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EA3C3BEC
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018169; cv=none; b=VBYmoxX3T3IAdpbPgBQz5wS1B/3sMrMAnSUYK/L4UGV759+vvFz5WZA2pElzF0NchIF05nPrGU1aplfLNYYHTMLutFMCZbZQhC7SEiq5yIMf5aZiGjQWbpnbtiJZSc/HrjOMFqH79dzeuZyPBZRsYV2mVqlwzVfJRaGtkLaVlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018169; c=relaxed/simple;
	bh=sxyYbj3zxGyfRpI3tYXCbVwGVDNatdwD9Ux1a88/YYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4IUuIu3fAwFEeOHi+c75qKH+uvYFZ/4wDxLBmpeBuSfvAwYVUJxaBp6dqkVFfHetKw9YTAKkQN1Q/tB9T0ZvydWcRxYhq6wNWFpWj9NuOEv4rCiPvcLuni88SrJdeEQTA45P3N9S0MSWMJN/o8FN5cMmMwnQMKYlTMLSFrPOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQ+aaAc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyamLq/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQ+aaAc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyamLq/C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KER8I8331914
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oI+beZBCKKS
	Zpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=; b=FQ+aaAc7h9ZrQOKWPjwGC9xcefB
	kCYkN4qdJBd+zC/4XqZcJe/3yGsE9+MAmdz++r+Hu/oCU94b4FvCbfpUa+g3hgu/
	KXHo7v41tnb7lgLvv+5lmRO8bOA6c2NWN0AkvPXIZmYSBA5KkXMtx2UKqDFHCih/
	rcPqOfL8iL/GS4nuBDKNpp6kEBz3uwBfHwII0omAELAEB2fDbGG0zqhYKukq1mbZ
	jmunCSUB4AVNVPt+Y4nDpQUooznEhFKkAnro0RmbJ1c+7hAgJAe6sTEqUtPoRpHF
	ggh+FqLr6mvXuk95NVmtetkhP0he0TUre5CUIbvun+ZwUiKy5RLyMFZWYGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k083pb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso29351741cf.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018166; x=1774622966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=dyamLq/C3m2W7E1R9Cs4JwUDFKHIYrH+G/ZAhHRzPk8eHxCgZBQJHATQNXfu98/pHM
         1zBULLKIg/gtNAh16txqnNb8qg30tytNK+U3hmjbVZXzWwHpXpTPakytVvSfzihj93kt
         t1vcLT6/JUz/xqCCC+et/xghkssPshIhsyTBEqWaldUeL/YvUCtoCBMGYXUAmLf2JnWH
         LPiwcY89iM3zo1DW4VBiPbQfKJ/182ACMv6PgCN2j5Ni+Bn01EjSs6fdPQ+EEVxis2KF
         nItIGSf9Gk36FeSmyk7L3veVbRlQ9Xhr4Z69siXvfSLcbmKEEpYMGoWwv9rRhpdD60R6
         QqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018166; x=1774622966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=YwI3dbEVwZ/I3kUR0auWFta7vkPGVSUwKBogH4qJ8a3GNb41/Q1DaivbprypFsfRSF
         2qem9ibWcl2hWiZiW8vU+47lENTKlJ1tVBepmGUrXQhFy7zi9IjrBCar6uoi9qvOXXvm
         42CQDVYrU+ghh7pR/AlLhAh0avxGggYF0Jh6Jp2LbQUThhc6gjZWYSisUXtctGLIMlhq
         vfelabQnfdann4HQgWSnbieEk/hysWLMzciqFT47Pj4Y1fUAoRUrKp19Xf2JMGIzY3Hv
         CzAfGxdNSPIyi0zmoPvuLeG0jJqDd+uF+wgtb13KvH+yt+rQGVkyZragXbP32W17nKAr
         wQtw==
X-Forwarded-Encrypted: i=1; AJvYcCVtOPR4Hd8n2AUKrsr3XopAzjhdIHrK5huEQvAwuayJdzOomg7ZtmjCUQQocSqIesGdDP4W/qYxFbYeog==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpstq/9IxAXnXQQMDRXlLgTbzID2v8UzPl7/dpUwyF0kAxAINb
	2jio0PSas1+NzL9ZEuLS/8m66nfIUvlSYwABedf6FkByZYCO3wcU40tKAImvbXpsPWFPA7iTEc+
	Pcvo3I0f/mB/EXjgBn9aDSz3DR4dAJ/SJk9Fi5uPcuAL0EYoj2TUd0GLxEse+17qZMQ==
X-Gm-Gg: ATEYQzzkx1OC4waiFwq1zoOSBMMP5PkaoTRb2EDdl63yPm9D7Sx/lH52tc01nCs31s2
	y67n2bZSBQuOEcG3ULbP5hEljA/WB6h+f1CtLwGu1ll+X1kvPjeJAWDjKo6OgZ/Q0Gv/0yLoyVK
	F8Hgzo7BmjXvudV+TuCpPnHnyY06toyoZL7nGvt2fj8aueU7jpBhli81Ttjdqu7qx4GmZD+6ZGJ
	sdHYdN1BOt/X42aVpqeaRgK4mrkWp23+63hlQV/lqGeIA27lhLR8hPlZIv48RABHOSpqZQgi9B6
	mTy7qBp0EUw/2h/H/UvfHiRhTaAEJBDA20vY5khY+uEIHzyuAVTfjX0ZyfT3+jRccGBYKW71CDz
	9OIpflJTM/+oFLdkWdNVZEydRWszoAkFkEjXxmDmu7suq7euV9w2BwN8=
X-Received: by 2002:a05:622a:5c7:b0:50b:2096:494e with SMTP id d75a77b69052e-50b37473d55mr47732801cf.30.1774018166026;
        Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:50b:2096:494e with SMTP id d75a77b69052e-50b37473d55mr47732141cf.30.1774018165404;
        Fri, 20 Mar 2026 07:49:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Fri, 20 Mar 2026 14:49:07 +0000
Message-ID: <20260320144918.1685838-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd5e76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YQ7JadKhFxhjiRTFnVypjRN2nQU0EeOb
X-Proofpoint-GUID: YQ7JadKhFxhjiRTFnVypjRN2nQU0EeOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX1gWedRLeogV/
 rJL6cC4wROvGOezm9XqpFKMsFzbL0EB/2xVQFW3XP1l8p6YZkty6/tUGGgZYo0UTgwbAKW1BPkI
 KZFLyMmIPUZG5WaSAVZTq3bsWbehaBbJTKWnfYCsDLC+GtaAFgjE8tqfp/efdK+JMasyg7VjQ9j
 INKScXjAnZ01wRLZqZTwdQxLSX8nUhrDaMIr08JNKltVgKk+v0/s8eysxglTqVYZTvmHGBUp9Xn
 RtfcxBw0YQ9CtqzFwPC+qGrb4MHTPtIfTG7wBOkIFv2kb/EzB/C4w5llkjkFLuZMN6TI7OXyEAG
 2SxoqbFLWyRsXbrHBtk20zNkrqy3Up3OSrV+usjENwA4FQmNW030hZ5RQVPgjGnnnSzt/0I9St9
 ZQBhXig6EjJRepMN7zYogJXShaVt2x956wbv26oFoBhgu/7E5mzXvQfmRI8Alv/gMfLC9J888H5
 UwbYZfAUvMUC8QFlvSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

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
index fece0e3def23..1fbcbbf3123d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -753,7 +753,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3

