Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215603E9F7F
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524961; cv=none; b=gf5yTSNIClpjpZD7v5/MIYE/CRXAb3dHNZeGwbayh6x3W1mcgHMcEpX9acOFtTBhJ/iXBjtKUcftHtIDDpJQpuGxqNO5YqxrH0J6430X7YTQIXXiBYfi3IjHgN2AVkegqvTJiTdii2Iylxg2/+4VT1HRVbbNfpT+1XBJL7VqP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524961; c=relaxed/simple;
	bh=V6ehlQa9ayCL8rKi7VK8KBiRrnMyybzMPfmXdw+OW+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgF33Jzx+thKVbZ14g14y0Bal7sZboe8RiyDUPJGa7QYR8jNiBQzv54423GlZS4jXfDdrDiQ/YG7DbS2F6O4Dy7qIFMOgL4fb8YMdmDZGUmLgYbn4gigqUdG2AVCeUMUmJtL+pyX7iJ7GWdcYFmo5lQi6Xn7jIeC/hz9CV0gy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXp0jmzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dm1bRVAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXp0jmzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dm1bRVAe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7MmJI3069875
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 11:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptE
	ogwy1kX8=; b=AXp0jmzEReCh6Y7hMk/XLf/JiLMeuWfvOAjGt1u5d5XfxiGzqd5
	YwOx2q/o+V/nXdl/cbYD6KvsWkkQnZDK3zbXyD/IMCBOyoVCp10L4eu3K0lsYBJu
	FXk4ikt5plMZV0z/4MpykXiuNy5spV8p6ukChBzpY7A1xih8FAGGD+amq9cQnyPH
	50BxqOcAR7hBVlGjeYdzFDCQ1WVTx2oCCgk2ZdOwH4xgzlcivyJ/YN4TQcDUhvdi
	U9qlJ2prREI14X+GqPnqfgZBYkOuh6beLRdI1w5q3LIppZc6tsSYRgRPcqW7h8S6
	BMUe2KELpJf5REqmpZ0wj1/wVE6oE2Sp7mw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn2bg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 11:35:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so204375b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774524954; x=1775129754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptEogwy1kX8=;
        b=dm1bRVAe8vmJslkuoZG526GRkGKxj2VX2Hoti2V5/7SX0Amy7m2mIas3QVAWj3GNAy
         aCM/62bWI308zntZmduqtHv1zOe6l2qgzH+I1La8I7uSI35wDe6Pg7Apw8eamN5RyaGo
         IjvrBQmQzZGox+0msnQT229/wP1/OXnTdq2JDhcc5KepIgZmsNqvYTq54e8NXQgHy9FX
         naFmzVMs85UVGWVa/CewqA2LW1J2zO2za3WIKSwduyq3FVtSTVfb5IIVYK9HQwVKIJIT
         lAi+/uXNAQZ+YkDV7w2SffC+dklyCNoH/RW/AG5bpjT7yamRCwPPW3U2nIHJenuzo90W
         PoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524954; x=1775129754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptEogwy1kX8=;
        b=QWQ66M5JGQlG4ThZcjeoupcK4/St0iW5F4FWXK0th0LwTZ4fTMM+a4kcFolFMU2TNr
         1h2GrEQAZHBg85MjHbGlsNUwlcYrOOeVWfnnx5m1+bh60Uj5kAgEm4/naWTDN0Beji4L
         WAxVeSLurVT2nLcywgS/zANEfIo/i5i75yyFIoOJun5rrtpO7Id8iBrqkrUEbvmC5r/s
         CXqRzkNhPugotSVsMfGs5fDWQ7v8/IYz+6Eu5CwRqhT7otoUFr++TVQwRfYSk3cKZXLj
         l1O2irgBwl8rj1/j6mybxjHah33B5or7qfA7coMAZWCqCUWGmgk2DrUtJMYg5+9E5xHv
         rwiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/u9ALiwIG1wUzwPpvCFDYRGR5pD4YraVBxtxrz+AQAtQNAQV41RVjU7yRXJ7Zz6VqeNTdYHjh6D2tjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwziBjef1skhookd6TNTRulmOHl/c5ABV7VTeijLUaT0K/lxxHi
	FR0n5nd9bYmJzVUSJpkS+LzNc2B4NDXk66mAVw4HKBV0BkxiEYvhqfE+0r2We/tGvTn7cmhleB5
	aHCcMdEalUDNmsb30SyxFbGXFca4Wo9CWpe2gUG5wb5VcgMvRAYGoDlw+8BhGQRTmgQ==
X-Gm-Gg: ATEYQzzs04jbbvd87BKu8YzGZVtVw1od7x4nvv3sypkmHix8KMAOFgFGzdS86f6dg2o
	Jvf6yR4ScRnXedYmaBzF+xvujoBCJYLhOYnTce8UYlVEzVTR4hjWBL5NDiPI6qml1ImVg2TGYir
	dEmUi0a//h/ao8Im8W0HXkwI+XOqpf+H5vgZTsLZmcib5uUE4uS8Rv8Qyf0ZZQZKDu5ngDzsS18
	9MJ6InrUbTv8rVFCIiIKXav4vlqypgAZsA6bEcJiagynkeVi8AQUcbgVjrGHhz4C9hVPfIXHzwV
	0G2Ao/fHAUnJuJdPBwjCK3/I2M016faiM3VnaqHKcf2H3RCLckDVPWFvrfPuo3OF+BK2Vz1i1wO
	wODWeBV1pE1rYoLSFRl1OsWaAPtoNmB1V4ZXJXQq16XSldM1JpjQ=
X-Received: by 2002:a05:6a00:2ea6:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c6dd34f8dmr6892615b3a.0.1774524954475;
        Thu, 26 Mar 2026 04:35:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea6:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c6dd34f8dmr6892574b3a.0.1774524953812;
        Thu, 26 Mar 2026 04:35:53 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7cf78d9esm2213782b3a.0.2026.03.26.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:35:53 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2] ASoC: qcom: audioreach: explicitly enable speaker protection modules
Date: Thu, 26 Mar 2026 17:05:31 +0530
Message-Id: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c51a1b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7ID5sDieJ04PZcVNw4YA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: e2hAVxnhfWSjxyE3KqHF1UQDzHrATDu7
X-Proofpoint-GUID: e2hAVxnhfWSjxyE3KqHF1UQDzHrATDu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfXwfuAvLKGF+QV
 wP/WA0OupYYJDICddE2FtF9cfPiGQ3FakGhKc1ABnqugaiwa4Hu00dFtnGfEbfze3XdQJO0PQAd
 kgU7IJdvAzbcv0szb8Q6SXp3IfuO24xBRo/gs/JtxpxdgVqEyMCvCMkX3xi1QZiBb08ShcxQcTR
 QG5c+eK2AHG5xXfHTp+/Qf8R2i1287zHtgf+Ol8llVGGJL5HL9PrIePxoTMFVuIllMRLMSAAkPt
 fok4AJ2snC0pz5WsmJ+fY1419FACcqi2j1a82J0NpMEVz/CPi5PJNiXv1iiLGrlpXFl2hRtbDye
 fPbmJPz1bTaEAc4iORcrJ24mXXsEzgy7r3PVwYJertrjJixJvB/wkVkOOUWEXHAWmMOs6/OMhdP
 Kh+OjJYNnrUct8p5kj9ZhO2eTDxOuNMPimFXHflJiFe8BwK3ebWGBVXgc3fRTu06iI+XddbebeL
 RKnT/muxJ7bsYJNerTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260080

Speaker protection and VI feedback modules are disabled by default.
Explicitly enable them when configuring speaker protection.

Fixes: 3e43a8c033c3 ("ASoC: qcom: audioreach: Add support for VI Sense module")
Fixes: 0db76f5b2235 ("ASoC: qcom: audioreach: Add support for Speaker Protection module")
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
Changes in v2:
        - Added fixes tag suggested by Dmitry.
        - Link to v1: https://lore.kernel.org/all/20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com/
---
 sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..ff8cd55b0d89 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1365,9 +1365,14 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
 		break;
 
 	default:
-- 
2.34.1

