Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1252B382F21
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305541; cv=none; b=MsyGV51j0K1tz4bjIvTF4Mp3Z6LN+0CAZOU3O9al8Gq2cFONAupPSt6/FW0MEGPTbuB/sytfluQ2p7Cjz5i9qCKEEgr8+D8GMNiwZepae/O2oP8HntIIb8w9DkwrvKPn7sM1t23dnNF8PIjRmDwg2eWu71GfaXOpfd3HR2k34u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305541; c=relaxed/simple;
	bh=sxyYbj3zxGyfRpI3tYXCbVwGVDNatdwD9Ux1a88/YYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAW1QMQ744xddU4h63o6PF+Hn3z+Gxbs2y6fdUmVTOSPC6qRAVF9f9Xqml3HVsuZZJgoevMzW8XaOMeyJ9POsAohNGoKcijj4dIvpGsohjZai27s/BbcknJimRwSM7TVKhpRKoNGr7QqBBUHD2eMpOSmZe3wqjcT6uFv8xaRWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lV8xFN9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YptF6tRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV8xFN9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YptF6tRk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXaI362509
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oI+beZBCKKS
	Zpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=; b=lV8xFN9/TBAjLhYgdfMNI+bKSB2
	QMU9jSC21p0V9CmIVqHuf0fkwMeDgVooN5ACBDkl+867BOWlYh/bGQSxzYBZrGbH
	e4XGmxE5bWCcYF4FzFU7hGEtzbDDH/PdudpOfCKV1jsceQJKMmwurSm73Bgze7jN
	y5eLOQ2vznshyrfLbfnDjinmXWZdetHrnsCHiBKXrpb27L3L7KeMhDotKj21XQG/
	EHb7deJuyqdes2uGIueJgmpSrLRdrm3N5/9DfbacG1YYExHUTy1pNVqdcZ+GIjeE
	JCY3JWlLtG6HcrgmCMeJpcQ7ijfZq1JMDRxz7IWKaLh2VGwYjGVnEgmFgeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32eam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:38:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so177358911cf.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305538; x=1774910338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=YptF6tRk4dyRhrmBB8GcwfQ8kiVJmaOE5WiMBTUpLdX6o7cCpo0bqWLdzNZxWCzuG2
         u7JRgo5vucy2id+c+QITl5OHNjSCqMe7hEDCglBq/8GR9W3Oau77mDtv7XCxL9jYXBJ4
         M4fjUtCeE53PsH9QtlEldelbpEBG1Le5DxQfGb8UA2sU1DMFKl/praM14Hz08iswNPU5
         DQ99FpcwG+5p5wQEGM61ApOotgPCWGRuwq6rvS4TT1ROPUknar1GDKfiYXd5H57Ge1P8
         cRkvSJfOw/P5YRzQV8bEV1Ag3qmnCxoiSll8u9P+sFhVzWusMggJ1lRvB5Jagxg0UUps
         j7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305538; x=1774910338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=KoYkS2QPr4EKNehiQcFdCBWodow03dWfVJ39PbhCAD7uAI6cYDTr+CyhLz7bt4vCAO
         k3AAgckHCMoBDKDMm3FgQLBVhB68BJiL3PNELiBpM7zbD+h6eke79b9ducjqSDBX8ZHf
         Q3s52COBxmip29dwuePegSQ1XsE8QU1AWr4zZG+A5FV+90+VWQQNYSYPPw4U7i423Bv/
         FijKxGB7sWTt9eBzoNAHfX8dnUpcGvb0nxrQ8JPunKsDm0lyGt8Q0wWd7BC9JAN4oUmv
         nKr8287rrKQXqOH6swhiiWlNQaID/RjlM7j4j0ipY5uSQRHSGhEIjPKli1UWI9qi4GQb
         NZHw==
X-Forwarded-Encrypted: i=1; AJvYcCV8HIfJDlHd3vv0Z04fKI0K4WkPGG5vR+KzDyQb6xur70NuZ8kdUDcZp46fPa/VZOwGMbTH96zctzCKuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynRjXEq/ujX7+sulKZiSVBFpjOBdPS8EATN+kNLUSNYK7hQLdf
	dAwbAJu5j+HlWP3BCx4LfdkiHHF0UmDZGDBUPGZD4s8beCU0+KD8BkOGSeEVfNYOmTzU8khzcX/
	uA9SqtaT+P45uKA3Htz3TVPfR4UvaOGsaHcqcNxrEUixE6BosNs8h2vxLEt0zwaG6RQ==
X-Gm-Gg: ATEYQzx7H0dxD4OWVpwuXgguOmkbGG+tCvBiWaGA5o0CNcQYAfN6Bh/qgubK4ndqP2m
	8TOYdkax/HLiBqWvUfpkg+G0NWAGeAPINXblsGwudhWEhRJT5ux4in/BmkAIcvfZrbGgerDUARQ
	u54ANhhCF0b9ebVXW0Qpy6Hl907ZVgRFnByJwgJll+FgL99poWCj3G+Hg8aoLTgkugqS5x705+L
	qfWOeD6yxaoQS/H9LkBe1EnNA8C986hr3q4+67bB0dBg+DFDZY7xjOugbeRu1i5aVLeHFTEsDkl
	Gm03DvKRRgN7yPlnDuR/bIuX12dga/Xx22cMlbec9nrx0/0ueCX7E216SXrViyd9I3vASDqtMSi
	om5L1ir4yYRIVy/L2lLpTOpW+krbJZk91GNqpSlZCNjy5U+GAedH550A=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116997191cf.11.1774305538449;
        Mon, 23 Mar 2026 15:38:58 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116996401cf.11.1774305537179;
        Mon, 23 Mar 2026 15:38:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
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
Subject: [PATCH v7 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 23 Mar 2026 22:38:34 +0000
Message-ID: <20260323223845.2126142-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c102 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX012ml9IorN6z
 uc9nhJMY817PdYBghTuZ7S+P67X5nTjMKCBtecUmvEIO+PDovHH74HxpdfkMBPr50XxQab1WTfr
 xUOwXmDIJGIg9Qe1nQN/m+NhNFtKOJdGqPmAynGzBls9rwA+8UMeHQzf5bhg8GXKXDUHr+UOLRV
 ymNjN30AiizWU88iHMv1Nee6EetR094G2rJtcbC2S2ZbMSY75ycT2k638V8XSN6CajcMkybYUJb
 An3pXEWk2+3BAgtQI2nhSZl6fiub+Mu0HDDkMd+dUNaRLr6JTGwumUPvVkpg8ROhC/Lf+q2D95h
 Gtnc0P6+cZMovJ93LFOt32aeTEKN9FuD20xy4SKQusmCpS84DnVqb9j+osTId3gtJF/jkB0ebc2
 7Oj08sPmI+ou8Ttja8qAuHDbKmUcGvldHx9S2wP3h3KuggymxsaaQTNKEy6Kbw4wGxxpPq5JfbE
 1X4yDTKH9/9Zg3tmfaA==
X-Proofpoint-GUID: S3W2tXwnz3eGhJMVyh3f1SqEv-tJxtup
X-Proofpoint-ORIG-GUID: S3W2tXwnz3eGhJMVyh3f1SqEv-tJxtup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

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

