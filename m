Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B12F260C
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994710; cv=none; b=ky9oDFn4iCay+0zYAp/jCQL5k9x1OYhDWPiI2LYNGOMDg0PLPEK7ssKDGYPZfPZk5eCls5Jy2LYW4ZDLPNMpCBHOLVT2NbyT2I+m/mmOD6AKGJ0ph+EcZR+zS3PTW8BelrjPOnbIUil8lEgAnSK9P3LQzmyYFgfTTjYvq1udAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994710; c=relaxed/simple;
	bh=JIyAc8HzCFIctpaTaYCtShxqBl5dQxTPCA8RyRIQEs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb980bQTuQTrzdULo8DZ+gzFQfliV1h2iw+qmUMpmWg0q1AExx1pKy5tk1siMBCXt0Uf5FU4EVxK7uh6lEzK4TxiVIiOs2STCaiN/Rypf24bORfxzjkJMBjotfydTqQoLuKH/fSxMK8qh3/tc881AwpZxMHhYrK1EBSN9XOgsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbs2VywY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYwKajLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbs2VywY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYwKajLc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SGqSs33545351
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jYL+Urw2JHq
	HhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=; b=kbs2VywYzanl0V4veyQlgkKDouG
	D1BawuHqwYgQAPBbwsNxQo8vy1m+Pfb9eXlUaYTO+VmlpjAudfsQvbMYEIJqIV0T
	g/O1tHAxzzSFy+kHtWubAPTGWEhBmar/byXarA+ULtiPQ1huMY1HuUSAP3Z5sbhK
	ogtYEWKo3/PP2EnVdk43x4sZiDB5UeU5JaRAUdbzBd/1GPpbIpS0qqwcXBpRHm0u
	AT3ijRV+ykxjqME6LXt1nK2iQnyfvh75lnyGALruaThjU14QeRfMYLPWdzABDmNS
	lSX6b/rMJ+9AbE69Oph74qE5bofZQbkd+JFIYwcy96NmPGuGwSpzBROIttg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3v969-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d58f74b0so79697201cf.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994708; x=1780599508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYL+Urw2JHqHhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=;
        b=KYwKajLcbO6coM1hcCfJ4L1jmVXLIEJs1Qf/isnQYNWE6Lu2IiuwuMHErBiDmiRSNe
         rhe/BYz5lKfZhIWefOlSLQnCprbuGLwYnnm/6C9YumGiMUR9QshM++Nh5RPA5raP8AXD
         od1KVZDx6ALzUhDGDx0TM4h9yyK9hoz1n+loL7LlFemd5gXahF9N4oGmmFaMTWzm0rf+
         o8DKxHQcy98mGBP92nioacw5B+eGsViB20C2GKqhsAPmPD55hKvEb0XW6+EQ+f6JzG39
         DdAp5NmEbezHoEViySmSCeTVbiE/oZJZDEDNX5i4ZxtjFhy5bPZoOWMXmRXXdH/uF0cg
         /kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994708; x=1780599508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYL+Urw2JHqHhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=;
        b=U94Z7Vgfa1GlAtUWBeUVS+cL4oaVxgxzhq26UQzu+zhAUC8c1S6aWFoUt0Y9HzmhY6
         ETDKqsSbS1p0EY2mwyzAE2j/YA/rPQ66dOPAIBS+4JrUqEZSIVBiRttVZVZ12HPbk/v6
         fLgylsAu8IaYlF/rDWbu1SO7TKFlFBe0CEjS+rmAUPakK2wLfKJ3v7pToOzPN/FSAdc9
         iNX/Spcn8gQy3qEk6vRdJYKwojmgYr/R0Xj7UYFZLbXNQbKNjll+TVJD/zqile5hJZ0a
         BXV+SQ24TZu+sO7v5vRHChC1xZXQRBtvLyalVStkXBNRQeq/XvcRQ82++9Y36v/X1hpy
         stIA==
X-Forwarded-Encrypted: i=1; AFNElJ8EmKp7MWU4aTEoN/5tnBdX1h8tnSQIANgaKs9rlDeRD6w7TLcXspXttVioBYuiu5xk71XpQef628ayoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWGbffZom/1kGm7HecGL526EB16afhpTVLNLpzLp8snquJaYo
	unNkAzN6o6nAuBjZRTJg5XboHKh0/2xbPhzU9uRG2av4KJSGe+EsJKzVH2gB8TvrOCZsiffR3+2
	E80wsoGtFNDGaLNdTIm26rCR5J51Fz6e+lsriEmvMxT0TQ12D006La5Lt0x0Av36gcQ==
X-Gm-Gg: Acq92OGhHvlCDnFj6oU9Z9il1RCD+OiezNF2DbTInT0vnnbpiuY1ZAWaTnDJR7eJS68
	wtyEGxfWus5KlaFC50Jo014erIQcOrM/YuYaZ+IwhdsEFZeYjxvjyIlP4zwdFfQ2vesTpPWwXMz
	oEj3y3HfYLG/x+bGeThv0UjVaraobwcdwscjBZeQrQL4i023fnntD1tb5LmRjEK0i2vdRqIbrg+
	VvilQ+F/rnoQu8LQPIuTnPUlDM8+gQSlqYehOQGo8+2tDQHqX7GV9trNZKYIqGX0lH7PPm463tP
	o4Hnq34Bi3s9GRwMVXJaeliMCCEKsaDATRW6m7yQ/0wHBIT0QoRL2HPaFnG2VnKJtPvm3BYlC9m
	Fbp/cZ3B2fF78JWCd6+z6aZluc/ooIUD5XF+u5D7uJk87+IxflkTJlT5az6TvSJO+1WGmtg==
X-Received: by 2002:a05:622a:40c4:b0:50f:b904:457 with SMTP id d75a77b69052e-5172cbd6423mr1002051cf.25.1779994707572;
        Thu, 28 May 2026 11:58:27 -0700 (PDT)
X-Received: by 2002:a05:622a:40c4:b0:50f:b904:457 with SMTP id d75a77b69052e-5172cbd6423mr1001741cf.25.1779994707084;
        Thu, 28 May 2026 11:58:27 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/6] ASoC: qcom: q6apm: return error code to consumers on failures
Date: Thu, 28 May 2026 19:58:01 +0100
Message-ID: <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jyyqhin4dkPEcOJmhGyk_BmC-zc562bm
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a189054 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Kj_hsjq-VXR9WAeqRSUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jyyqhin4dkPEcOJmhGyk_BmC-zc562bm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX1SR2uLU6A3zQ
 N7rwU67iV4IymCplaBT09lOJz2BFz0mL3L0lIXOaE6AUjxPniPRH2hXGCfer1uGWyVLOR6CCmXn
 k69Um5SV5i/k/3NwYDZVncWbAq2LC01kIfOtxuY5i1596K0DH2MKj5QOUWYwxV37GVR5HS9JcHo
 smBlAv/WiDdnBvZ475oJJ0WOl7TpxufQ7Easzso8/F80NhG38PsEuCRrZA2l/enA11p0AZQqneH
 e05nXzzqVMnPVyOeJzeDrVna1fE9+NbkL61rVkR5Gha/5U+UDDasyYYXb+TAG4iFQ8a5Gir+ucf
 HzYp2MzrK2RYHuJJ9/XCwfbzF0cFhy97/mrN/eCJi5dBO1BIW/FtcPiFlRb5m4V/y/vca05qaVp
 WYhi6TEstZi+2DUiHxfwnBp+kTQPbc1I3yU9HHctgOfLBasNwC9Fih/vRp4w2GmPkGQG4XO7Taj
 XGe80fnDtevjgOYsnmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191

Return errors from audioreach_set_media_format() to ensure callers are
notified when media format setup fails.

This could hide failures while programming media format parameters for
individual modules and allow graph setup to continue with incomplete
configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2ab378fb5032..2cebeb767cd6 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -194,10 +194,7 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 	if (!module)
 		return -ENODEV;
 
-	audioreach_set_media_format(graph, module, cfg);
-
-	return 0;
-
+	return audioreach_set_media_format(graph, module, cfg);
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
@@ -399,6 +396,7 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 	struct audioreach_sub_graph *sgs;
 	struct audioreach_container *container;
 	struct audioreach_module *module;
+	int ret;
 
 	list_for_each_entry(sgs, &info->sg_list, node) {
 		list_for_each_entry(container, &sgs->container_list, node) {
@@ -407,7 +405,9 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP))
 					continue;
 
-				audioreach_set_media_format(graph, module, cfg);
+				ret = audioreach_set_media_format(graph, module, cfg);
+				if (ret)
+					return ret;
 			}
 		}
 	}
-- 
2.53.0

