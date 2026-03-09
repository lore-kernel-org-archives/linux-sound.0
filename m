Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313DF353EF3
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039118; cv=none; b=TiNcRHtI2AiCQHdjQrTBFCmgydz8epH1RhHr6xejEYbJjwAYDAM+Nklc5Ef/QXOcnETzEC68JZH5uaEq0+ImJdWCuMCsguL0bTDvDGObV9yfyps+nGG2SFKl6iiq8SMdopBkqaLqU1LW8nj9aoVddSByTwscSSlJS2gbqI9DSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039118; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRsG6eYeGnrwMIbKmZ6T8J/9w4372z8wdLUM57PwfiMn46tsygx9cYfn0lwz1PJdueLADVZhT5JipMIywu103z4J+dbv4RZGplGFaP7NuNmvUJC5LUx51xH/spu/vpEQ6YsVqy2GKrae0gTT13WFzNQMNU1Ow2cghBdnwx09SBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mip+dyYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqZDGnib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mip+dyYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqZDGnib"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N0haT2661747
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=Mip+dyYrfP6k57L77mLOfimZZA+
	8Vs9P4O2J8G/5HAaihReWYlnb+3pPr4Me0+Cnm8twNACJgatK0SGH6UnSooAFc4D
	Hx3P5NzBD0Z2PyeXc5VwStbwwWAXFvJVMdvJ2VzwdYZTnNYTI5IUXroOPSLJHBEr
	bJ0HOC7FSoE9EwW3C2aSvZo2xq48coRE95U9Pim1RdCkLbovcAFR7vUUdvdHvaiz
	jYvKpygL44yL1ee402ofLVf8nKIwfudPmP2lazmyMMLHRuE9Kiycd7H3HH5gnRgH
	zLqwhV7N8ptmM9b3mFu8cNr5aeR0BOgIx1zwhtoMC12OsnB2mQulwikKQrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpmgc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so646609985a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039116; x=1773643916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=PqZDGnibcShOo2/L8bcLzqyIifiuEJMRJk13ETrecbWuuS2vIPh9JihxrqyQCcnIfD
         qNgAhzG8lb4h6zDFXwHHfWS8M377jAYyfGWOF5Ifq7ehnby5Mqd5O9HoOXGx4fLcJM9N
         oiRqYeEMEfIEcuipz3ToLiH3q/zs5vTXtf65zNZrSx+zOJSbPxyUhxjyBSFL1p9akEzF
         hJmQSrmBMw3b//ZJpRUbiska1oI67svZ1sNXYD0KR3bOrC0lPEKkuRa48P0l6OJWc6+o
         WmkyZ7WwWeegn4vd5SiHvCvQJcaSrIbTJ1QIDl/6d7/+a24HohXYQkGAHqal9SqV53Ec
         +RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039116; x=1773643916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=vAiWd5n4MrBhchpMQjelGCVvRRxoEbourX8aeSu8BWd924vEJpCZRQd29nneqXQWSX
         PPv02LE1kC2iX4r89LK+I/aXKzMcW1yhFEphebaKHGQuZdT7NabhABq7t76i77ge/d/7
         fDHmLucxl8qYNOyXWAlTbKTjg0KXvjiRUd5AIuxftOktbz0flvINpmRIARyYhDtm4Nhh
         oTPnap+KuOnIdOSVaL3BMU9LHDgeoCkm5aCFuMeyA7pzDkGPdyvhGlckknus7c+4Wdo4
         e6y8r2+AbveUChoeoHDwVvOVUvDoQZqlZHWKHhnk1OmFNnX/HCLBLiUcfq/uR8tplJk6
         wFYA==
X-Forwarded-Encrypted: i=1; AJvYcCUQsIagc36SBwebR5JzUm05vVwdiLBSnqhfm1ZnPMiRN8KCO1cI5+3v6RX1aqxXObkt2jf3Dxdo3SUyGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzogplXTBrAvlTqk0V5/p2vqhXYvRHYsfDPM23gR8kXDT9GMAfS
	VRZM3qxssYg3NYwGJ/KZ+Lv1AfDIBm93AwVkcOc/Ym8wMfuw4LLFdyQR4ResKv55TWqFUDKIfgk
	TYmG0EvCOnFBSNYBeWeUMHKlkktHjzFbZwgVbgRI68rt9mSk0uRzi3i6avDY1CmXcWw==
X-Gm-Gg: ATEYQzwIKs2ZBCOC00Ze9APK/odEN0DTslo0MopB8yYM/mPSBqDD+TIX/vxrGpXv+AD
	ru0d6En1fH7Uv8jx1R6yBRFlZdEcg8lRWQVKoJwFPUD5rzoo8NkupXXz6BZuP93GHhHuDzbtuyU
	SWES5Fdujr0A0lgav2e5OLOJRAdkGif1DUmz0XT8/hlZbax7dulv9o3fQRI+RlcnfSnFiOAw+JR
	QqiruyrP+6eoYo1nI5cMWDC8chQV17+AkgEJXQI9xR5DygWHmwELIjinM04CtMyQTrJJPYOIMfn
	tTNbNsVGMhPeYx/oslG9NUXsW20dESUl4FD4a5XqCtcPqlUExHvt7Ie7T7+SbLHpS148E2myOMM
	den+nUvAJ8G+zA3Z9WEOmnPvVDkqYL6jO/0MN33Bdk50mygn1Xp1z4/M=
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr572510385a.67.1773039115791;
        Sun, 08 Mar 2026 23:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr572509285a.67.1773039115331;
        Sun, 08 Mar 2026 23:51:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon,  9 Mar 2026 06:51:34 +0000
Message-ID: <20260309065137.949053-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX8Wvifb/cQHn7
 XPR3gBkd97gYhAikACsbWcEdYWosT5mfjJdVPad3n4panblam8ijD5FlIzhQsDvl01bu7KHTj42
 Ttd6B/zJM5ShSz8Cz6avOwdNsuNMZG6l+YPZ9IoWH1mV7zkxH1B/kqvyODsOtUGYjWYZWWFvfng
 62WPmWc3OLtRGNoaQHcwcDD04xRTL9ubmXiQGSHUA+UG06WqH1bJmhrFGOvrjEwdmuNcVbiH5g1
 vZFuvA5F5g7a/Gk/EhlR4O6EubcxVfCcT/o4OQzx/hnz+8eBoCk1sVI5Y9xCMhODU0IkT4nLpo1
 Dg9t5p+xgAexI50M6HzATwQLzi18s4snDLr5fK7Y5vuQmddxoWeFbhoknF7nZBFM+4ol2Rk3hlf
 aGl6ZoJYR2hZR6St3E2j35FXf1j2+MN6kKAJeRnSxDHOKcUAWcdEBP/NJYwB2q21IjkQ3BKP8yY
 KEYJMmCUXtYD5fg7Jxg==
X-Proofpoint-ORIG-GUID: 7wr5lTfqkdefU_FCwOhFrXiDc1MghasX
X-Proofpoint-GUID: 7wr5lTfqkdefU_FCwOhFrXiDc1MghasX
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae6e0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061

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

