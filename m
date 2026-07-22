Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3A45D5F5
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763764; cv=none; b=m8FSZXqqcCNP/C4yF5ITmUGXNeWJD9E5kdni1ttD2PQVwm+woH92T3HwOnpPlQ0LdA+Xi/GqrGb1ks8GHOPFoQZoTI+sFk1ddrHOxMTFAA5xYyUhTHopyueYiy2i0TYeuBmAVhnHwobyX4f8WA/XnPwTRPqxzvW22O+LtzI6ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763764; c=relaxed/simple;
	bh=7rkC2k0Lo1vXVJ45Hmq7MvKzcx0DEVOuMEPgR81TGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJcI9r/q5YBYmyyYs3zlq+m+47BaPSwF5zEI8RbVEUQsszINXQ7rD8Fw86ikNn7azNwD9aDGLRD6jaaI/RCfl3YCREsXlyVRNyppy7lOy2zrrRrwGOrdXazbaLAqInxR3B/e8AafUV3LcIRPPoFQlxQEcFKz3kPABosud+QeH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nv59NaIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnxWE2cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nv59NaIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnxWE2cb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnaHT2316204
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S9XQeQnGmad
	nUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=; b=nv59NaIpNut9agHnKuIk6yldifR
	+lL9Nur4YY0SjpyIAUGUriwDyXoeqrDvl6n88fzCojzc1+56bb2nYNP+uiIr6M/j
	rydnktn3uUbJ08tzhDwGZpAawcztDRUy/rAvIoTWL3rJYzhl5PtTNGsoR4oIJWcA
	YDkFRwFY6BfkJ48c4yc9tyLuug842Ege7FgE/KIIykB8baq3kLsDoRL0NUL0JAXb
	s7XYjr9GxSTw3DLmdA4j3Zt56P/fsyESM90mi/R6kfqCNcq+EULGh9bpYXhFlciu
	P6xEyBrPSePHpK0/3/9+Z5PxJW1r02tGnW1wUYKzepepuAlFvZTW/IeNPQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc0ft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso388021cf.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763760; x=1785368560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9XQeQnGmadnUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=;
        b=MnxWE2cbKjxcCF70RGxDhQHHNpA+XDemq9DB7tbBskDQKYfc7cbCG9ul1Mtr+tLMgq
         WfCwaZNNG/BiVTx3vYRLa7gCKguVu55bs6MIISbx09MFkmd38oPRMA6ZJfmZhdVyGLjs
         LHvWLdNlySPhHkQYLXeMSgpYBNWtM5ZPcLbeZE7AlY5EboRu3PvksGxrqW+S0F2aONqX
         QQAwKYyWJE32WDfWYj9T+sFSUNXkkvNSTDA6gxVxzsEUi1GBLPDn9IH/ioIcA9t9xQxZ
         ZnYz0k4zCmNTK0Q1ctlLInrHLpwARigfS5j/UlaPDuJlOVdSMlKd9JHxFNQNKHzRnZLh
         wfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763760; x=1785368560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9XQeQnGmadnUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=;
        b=n3U27w++FztOPUO0R6tBVtwvIxTdP9IrmYBF3oluz2UaI7mAY0zdOvqdyVplX8rXcc
         KRkI7AnILVSjtF1Nv5ZIXk4h7YSTsxz9wtwhkEvO5E+jWNOWL4Z6IAYXJxoiK81Dinku
         kZWJrFdRoh0uHBqcctSBwlbcBieJd/A/WL80mxx3i1ppXP+0tRfmpmlKLlVSVlQdUmNf
         PgHjKTSWtT0AVXbRVX5jSinOarRlya9DM8fvYH5XlV3Dc284sokRH4Rq326gXZ3jp24f
         NWvT9wyWStOL5pmuK+z3YZACDj4kB8QtflIptjPUqerD4yw2VR8PuMhO03hS0gnQhBxJ
         EBvw==
X-Forwarded-Encrypted: i=1; AHgh+RrORuCiP0bbIA5n7sdxWm5K3sNhUBdZwGW6h1IuH07uUgoYNEousN+MswM6PDrrNa/CqXgk2LwttdjUnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMy9Iof7u18nZLujbx5oBfBKYRRPJXMwTFbe1Y8oAmby65ziXN
	26d/yLHf84VgZ3aaw2zgTrDGF9VzeLID88L5+GgowUMVBOrqZnw04KkjRiY4XJGYoAAzUIcdc+F
	UQSimg7R3jcMHJzoDDYkc08ioQInxhMvqp0by5oHXOpaNg7Y7Xltj2k1DQEHhbdHYEg==
X-Gm-Gg: AR+sD10jjUx3HSd1G+pK6mjWEF4rxEmeZodDezoI82T6fdIYlYBJZGxOoHXTiI111UX
	YXBy8emkQqVvUGzcStDs2JlZ9D54UnQaGxOXIeU6SX9Chi1YnZ0Ar6pj0H9Ds6pTB9xxrywvPYT
	OGclsu7ebnxEu5puawmq/4Z+pZrSehlWFXJlNeabuZRu74WXdVawUfQFfJ/K3CjfRPfyMj/sN9D
	wo/jxBw72pZ5QGBEOxqQm5zJ0RrVPUZXL2JHSFC/J4lpzLfXjVCFrYv4NUz2RCsmThaH6FHJEVj
	vGl+6o/4oOefdxarpYYHDhjRzPc6Mh9tYF4NRhfirs4W7czCFJZCSl2GMnkrYuJCXfiA/zdw06J
	zFIvcTMqsMJ/C9g==
X-Received: by 2002:a05:622a:64d:b0:51a:8c97:938e with SMTP id d75a77b69052e-5283df680bamr6735081cf.69.1784763760280;
        Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
X-Received: by 2002:a05:622a:64d:b0:51a:8c97:938e with SMTP id d75a77b69052e-5283df680bamr6734631cf.69.1784763759798;
        Wed, 22 Jul 2026 16:42:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 6/8] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Thu, 23 Jul 2026 00:42:16 +0100
Message-ID: <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gHJwgGW9iPO-ned3YIFb91UQdHfI2jg1
X-Proofpoint-GUID: gHJwgGW9iPO-ned3YIFb91UQdHfI2jg1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX56uqMfWujvBb
 WI+56DS3Gh4IHFS+j4zKhQNbjy7FbA1WhKWpQVL3/ed27qn4t4+qkI5RyoMbkkPJBTIcI0at5U4
 VEeS14wTrDClKoV3Wq+BDmAFHYq6Esw=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a615570 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_VQL4OnVw18WlseRxScA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX4pfKeasZ+KSm
 Oys7v8K7iATyYMTa/oG1RflNdCSuxGmeZ/w7T2JUugsCFbmwttf6mbgUXuFLRLGINU1XOI4voap
 pO2Q6fvkgBVOlpkeSgOoy8kGzkbcA1ApNAcQYqltYGmzrdLRV/xoGkQ1PvPG8bJIBuQOM3FCSBg
 MRpLL3qOcCX1rfYoSU1I4z/LjUW2428qUBmljd4ZsOEiICADQcrrfC2WvvTFluNwko456lSsDch
 nNbU17SThEFN/mvNvoFCMRcTwShdQF0B3AuQehGHt567c8NZEoa3LiZ8cV6qB3vZssAw9ZHJ+SQ
 G2KruktDPszOsSoBKk4OTbeV12nWPxgCmzsvmncAHLT9VuqtlZN+hq9wlhcE1RZ22+GhRExsQdg
 K8ILvuMdhFFbzeGuJFNFSauHG6uoY8PA+4xVqV+ysaQCPwLfrbn9flY528NfMW2TNKhlVDZUyw7
 6lnvSiivSirVuT/3ynQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220233

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index b0fbe243d732..ed00bc1eeafa 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -436,6 +436,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -621,6 +622,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
-- 
2.53.0

