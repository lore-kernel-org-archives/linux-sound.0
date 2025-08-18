Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2432038A
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521467; cv=none; b=KBR/nfnzE7Wc9gUUkRqwioSSDe0KAfqcshRfzfzBnsbGLnugz2loGEMgiBTGakCxQXxtUNF9/9HWDQBFnw8Y2sZK3/3uoNVJnzXl6nDcq4755YCiXeqYeJS36ozjKAbJxPpNYg+LB16mZpYoY8I5bkPBu0BWBoSD/9LTHGWqBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521467; c=relaxed/simple;
	bh=06kAT+9DrliAjxRD7QFhFtzFqp9qtzZsrREwZHXF9Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3Uy8Oey0Rb0kf+Byvv+pgqo8XAg/Lkvt8icBl0cvOh76tbF5kZbmQNKLRK6b7Igdkm/LBb9qsIF8UqJmf7DNSLgd9UM+/Hzc1eXiylVWb0nTe58LfGAk6UgXPNCSG1+L4OSyq5PxCrhQ8Sv23iLE3a/ZTBI2LUXVMmRBc0WLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My1q/iSZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My1q/iSZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7rc33029297
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PlcrtGDGu73
	MEF4667+AotAmjGL1GbqsP/mPC9bHYeU=; b=My1q/iSZ0h7R1V3/B1w25B0bTwH
	bE/QQmbScQxfXO41caU6nU63cgk1aGK4M9p+8/wWNh7UZ1XDSjNIdjmO17yLP6z1
	YHFNC3tZVKJw+iXz9TWEaVCNEACSOaVvVl+0+RIkYJOUu0IcKrcA6FfwuPcwlX4x
	COMOM5jMq19yg4OqSibBbZEo7IDjtolLPSdGAYwE9xOOwYryQ3u7fIhZjlqYJUeW
	q51VG71Cv1AFDcCIL343sausMyjAycSmQL5/E4FiL0w3UFM4N6m36yP9Ql1QPAP7
	Za5pWyDP4+R6ZVeQFCFpAQ8ynP7ObKGqUqjrDirXFfOasLTFurNKnf/HdSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ucs04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dae248so89583336d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521464; x=1756126264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlcrtGDGu73MEF4667+AotAmjGL1GbqsP/mPC9bHYeU=;
        b=elzK5pJ7wIAwT/GpLCPu/Ndot5oaVjy1Y3ntDLSfn7qknKCACZOztgumTpYmY2KZEx
         d01rxDJfAdCBBrEG/lIHQZAnBHimCtzRUFcuVHQSZ0VLZox57ydsiEOh9qlHduj00BaX
         48PhLO6eTygs6i603fNN/0cBEh2ppcLp67YqpDDJkl40PD66NBsSjCez3J2cxBDbfqz/
         ETioDvfZmAzyKE5qTI6i68iFJq0x4wbRM/W1THgqn0qlbB8A0Pq8IqrXHiy5r9l8rPiq
         dU2kAm7f9kpDgjkzAGC4hEBZE/3/lIEJenSP51hpw2P/1FG4feVkRxotSOc5GoJ79AKu
         duQw==
X-Forwarded-Encrypted: i=1; AJvYcCXWvs+cxRxHdfsPAZjuCWVCpqxUDTFLkEjgTZeeylJtvWMVpdm29nFoayoQyHIkmTjTItqcb7GZmqBcwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQWAFpCJwuy97ubaTjwcJZ3yZzgW5BzYsOxEn3tA1yRfXCcTL
	H0o0N9snjsnCikpvhX9hC5d3/HWzrQKgkRSqKI8UGXRNyGOOqCuXKPthBeKCPeD98Mqr6CAR6Tv
	m7OL4vMvxEb3G217SLHFKdmbvj6JqTxuKwuPF9LI9OOkfRP//1H99RmykdBYQNlcDAmW9NTakiA
	==
X-Gm-Gg: ASbGncukbEZoDxNj5hUH3RRMYBPIlBFPmb3x5MIgv8mFGkwUlUxS0GGvNhA+2MBMXS9
	sDaeRK70FdO2DLtYUFKFIpKJjeM70p0y/E1nYvKsar1TU9jGGLT2V3JI/hzDh39JrMIWdGzL3/l
	o6Org3GrVU8/4colCKtJ1H1UgsfIITHfMnvEwmgRmG6IVyKyPEkdEg5tgG22p39dFT8mAbdMKrH
	CFskSwbSy/xuXLx+yw+Yw/FoxCqtFmLOJKO239XyCHeU14VABjvpxy5Xb7gn2JblTRuuhH71qo2
	gkTgUB+laNE9pXvkEb3YJ4plC/jyjldgZUUU8i25bC3Z5TuGYcRZ9Q==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr200097396d6.8.1755521463597;
        Mon, 18 Aug 2025 05:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYOz34pRV/ltjYsz0g4ZxkrzJ3SwXSzKHny2OsO5Kv+nDB7W2cT9y7QPPd0Q6h+ip7T7tdQ==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr200097056d6.8.1755521463076;
        Mon, 18 Aug 2025 05:51:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/6] ASoC: qcom: audioreach: add support for SMECNS module
Date: Mon, 18 Aug 2025 13:50:55 +0100
Message-ID: <20250818125055.1226708-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a321b8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: XVMZm17-_tTbBLk4FFSCwTeJtGkN9kCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXxF62neneo85V
 RYewPnYFL4V9DNjNr2Mb6m+wgUy46roFbGjoXDybVEm0W8uqFnAKOtddVG9Z/XqNp1Vg8uIjMk/
 BxEIAaGhTJPgWUqEM2irIxXdVdmdgdU0rSJWcM5MkUtwocAzi1bOp/6pETtVdB+ZFm+ar5bvUnz
 /MAPgvvxufi1ZZaMJWusKZ3JZRNUxTKeZZdR+chyPe1tgnhjjFBRmP9QGI9seK7Ihk1OOGCo+nM
 suaZhBd4MJqu1hmWf3lAx+4Bh728s+ioTclv3jUkrPF6t/3TVJ8vO7xqHkfRotHYlRdxKR/xaB2
 1SKzcH9HSh4AuSHvkOt6+AcxEMzIbl/ULm0+TccB8vpCNojd/RfaaOQNkzgL1enHHFJ6Re1+mxq
 QDR9tmLd
X-Proofpoint-GUID: XVMZm17-_tTbBLk4FFSCwTeJtGkN9kCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb9..f4c53e84b4dc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -811,6 +811,30 @@ static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
 					 EARLY_EOS_DELAY_MS);
 }
 
+static int audioreach_set_module_config(struct q6apm_graph *graph,
+					struct audioreach_module *module,
+					struct audioreach_module_config *cfg)
+{
+	int payload_size = module->data->size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	memcpy(p, module->data->data, payload_size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1247,6 +1271,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		rc = audioreach_display_port_set_media_format(graph, module, cfg);
 		break;
+	case  MODULE_ID_SMECNS_V2:
+		rc = audioreach_set_module_config(graph, module, cfg);
+		break;
 	case MODULE_ID_I2S_SOURCE:
 	case MODULE_ID_I2S_SINK:
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e4babf9a44ff..790fba96e34d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
-- 
2.50.0

