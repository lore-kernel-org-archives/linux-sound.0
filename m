Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73A325715
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964776; cv=none; b=UacDDgeE69MLUbc7MofOD0fLgcRiduIT4SY+1b8GQYR0ZEFQ8kSq3Mea2Vvk8PIl9O4PZlvJSZGVKKnkpSoo4d2aYidyWjvzn0dxk28ss5MWDnv83k31qLuzZ9Z0cx0XH1f2m4iGPfOymM3IgypQRUQnEQAPdqWLni//Bo7BigA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964776; c=relaxed/simple;
	bh=C5jTB6u/iPGWZJLucmw+nDd7E0P12QEw8yvsWTZHFhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyNTOLAvtWYkZPfu52U9D94Fb2bM380c3DuRcc3SoHcEOtm6M97iiAQ3ffZVnp0d1oML8lviXeb1Giir9ETz0cKgoigf6oZq4HeyB+iHB7CBry/W2lQP8Tdv2gwWxgGLNzwu63Eh88KfNUJ7Q1nXCcbqagbbhLwe0nmK3BWjWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIiKTInG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=He5g5nwh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIiKTInG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="He5g5nwh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0pN1871449
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFf
	A9lCDs+8=; b=NIiKTInGKKsqcFP2ZcQ0DP3P04nar/fMHChkR/WFEAin1WQmb8J
	BtkswnmneGVJtIhRTQQlgdrBiyTDcDxPGXKCkvNTRTWp9UaGslGC0QxyuNeASsnT
	5Ry8aeRscS2RVda7zK0TT+EZ3Up/o64IPjh+X7h5q8El7MqtBI45NWfcCt/DFEdn
	ytSOXPLUIArsQSRPyZoxdJrFr3E1P/lWZasxZcjgmI0ZdOzwMBeKcoUyRJCpRQJr
	JplFls+Y0+f/xZOekCGEYpzyB7C8JlCIXNR7PWsQHLkNhFYsIRvpuqHJ4VMFrdoO
	N5SjAElfhFEnfP8mJUgyoVtCJlDFqUPTI0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9ffs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso94424891cf.2
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 01:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964772; x=1766569572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFfA9lCDs+8=;
        b=He5g5nwhVIBPIk6mo8zvQNjqZR0/Llja2XvVjhsbLBOxHyR+5URN66AUsYID76aJGs
         ph82S1vIDCQKMpN8w6QSBEk2mlLxTBZgrd8iseExvyqC1nD0P7Ca+WU+fFJqBmk6YxU7
         d/6pKpBB5cKMxfSnZKyu6ywKa22GxmRTgeNtKFjXOxCcDInDSmaGfhx0cUNxNxdU9iLh
         7dKQJ79ZBBpsyuAFB8ufzE9wdBR8Nxr76inpWvBCfpiPfEbfwXf1GFeBW8TlF5r2GozJ
         VH2Ni6WnwqWez+GDiSp/ZxWSnoADEx6/kiTsL/U6j04i5QXXWvDgAewLpyF/TLuA5ek9
         Mu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964772; x=1766569572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFfA9lCDs+8=;
        b=Rq5v8jzZhRTJ90l+cGKW2T01vWcGrvd0um4qS9VTzJh8vcaeVdIgQEMxe/GJlXA8bV
         XxvAD6Uyt5kroQygVBqHD1MBUtZQ27SdxiYBpID3FLSqBdEf1Ty0ExFXXa9idaIPaDLy
         hlBSMPm3mkXslE8VlKVXgEiYeXhZAaUZQe9DnkpnUwspWuRX5KTA+/uw7iPNMObPpgWI
         Fb6rAQnthA4irqOKfcN/L3BbZ+gjH/wzs90I82ekhiREbF+h+VfyW5fkGDfYOCouqrK4
         yW3695wmDcTuEyQnaq4dkWHoSp4Q/pn/8NTgG5tMoGuQo0VElh/HgeDs0S3cyu8g7r+B
         VJxw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3rbDLtVou9u3nawlzhX84fIKJ3POCoyrcqz8ldVQWSXm0Aqbl6vCb9Xowz3knrUJHMjWA2US7CnovQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdrBbx0y1shNbu9hzQQCj2xE5nnEQxAzoojVkQx+Ek35TwAhi
	q6zsSq6Af1IuYy2rZriDnRgHwR0oNPqqP25f3JGjoFJCJZRl794iqtg9UV5BRh3E8EcShVnz0Wl
	8//AEYVRbGRQbrqUoCL/pIrBu7+UEfuqo35i/SuZ8hQvK5fWLupQfuHx9lFlbql8EVA==
X-Gm-Gg: AY/fxX5B8AHVH/R2oQWLQb69xEO6+4LK5LQbCWJUy0Y5YinIW3Jw44wDY4JyERNKNPS
	yEt3NL+8j9TjLGiAtaO5Z3BNFMFkEPf6xtxAfMoRTEWOVRhQ9EivQ5A1tx0hCtTnFE3yX2qiinj
	YJynY7jqz3JirtPxWCflJ0A70NbxZ3GQgMNUyMu1UcJzqeYq9kTZko7HIDV2tHXns3VnGLuskpM
	4n5r5gdZc4DhuzFPLdTb7MpbgR3xA3uclj2+IBwR4e94w9ReguWGgtbyB+4J4ReZgUH1KV1/dvJ
	di8e5XaboyfXA8oB8h2d5EZoS40HTYNKTIeFZU6JAla6uJuxMbxg281G7vwcNqwg+Nd+kQw0eMS
	rm4Tz7aokq/gnwAvr/lX/75VT
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr221694431cf.56.1765964772164;
        Wed, 17 Dec 2025 01:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7mhOzHEn4F2LlEoDp2/Tw+Waa0DTW1eqOT6mO3D1sgs9nqFNd6ZEKzScuc/IgUFQVWD79pQ==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr221694241cf.56.1765964771741;
        Wed, 17 Dec 2025 01:46:11 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffacd9192sm356502466b.70.2025.12.17.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:46:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Wed, 17 Dec 2025 10:46:03 +0100
Message-ID: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C5jTB6u/iPGWZJLucmw+nDd7E0P12QEw8yvsWTZHFhI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQnvaAWMb5eG9Sd7md5DdPVmByl7DMIulN+tdB
 sOTW+hh/iSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ72gAKCRDBN2bmhouD
 10JzD/4vLaQk22U2DlhGX6L8iERNM+L6wOX0X1QcCZYwxAyz+YXFLI/AOiyb/2imODMqpDKaSx9
 VoIKpmm7oT82ZVCCzsRI03Z/5TNo2L4XKZQli/dsZ9Xo3K2KxDs+fWqiOWjleBl4qoJMfO36aRW
 8Mk8a28SSOvY27D5+hb+ymvYxSThi4AmpkdWmYV9VhminCScXRf0qbhzKz7JCIPdPFRX5smui3j
 EqY4H2ThJ2/AgM+myqwAM1dQ5lKfbyHqIXcgs/R9HyWNWVnvUb8r9DAYsyc8sUKLYnxilhHr2la
 dNi0PHXgbyemxQPUxKOK3ZsCLyoK8bcg4Dp9YTRzcHeBX1VEuXESxU/Zk+eUAY7POz2jHjYsN/f
 CC/TEXWNjjp//D9Fuinlvvz/mvGwBpW678VmNH5qNp01O05emxNt8dKXjWHCeciFaXM/yHVAwo1
 6KhQL0Cx2vfykoOjWUXthxS/zC7kTPZHVLEexbA2seXXHxRvo1FOYq0LXTMV5Nnj+VspYbRTWR6
 qL6TAjNB9/uywIhF7jiUQKGASxh9OyzBl7Om4Bch6+ZbLknzdPyc0NmD4ODU5tDLSZsSbfnueDE
 p5UpV6nQ/ZvI3uTvFq4i3eiz6dn2oZ0tA0IvcoOAwEsWEj8Ypdoi2vGtZaz5zM4L0+eLdhvAl8Z GztxeUMbSEr9ovg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=69427be4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kRHUT8tQ9wNbg4cJUFQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NyBTYWx0ZWRfX3PiW4Ek++M0A
 VRFGmMNRde6T1o+GWLLtdovLHorrS7id3CYOfJBNSb72Z9wsrG7QJ/aOXQal6+IEEb4SOTpekjW
 ZYy2ncH5+i98+4NprIWNMT9L8VfJp3swHwiED/i1vCv4CxdaOTy8mPWM8GRDRStfQmlfWSftcBt
 mQmtaLT85i7HEfmuavl9iW2HDJJS2HTKfrRHtSunLNSv2Ryaq5q6081pzh+rd1BnVbcjze8Sk6/
 +giJ3MIxdtOKQkVBzxLidSexMAUMqqdWLk0OJjCJD2yHOGRLUkuLar0Y5WJOHoNbprTaAPAetnY
 LGIoAH4iKn2XV8gzWtkHZkncok4rb+dBA0F2va4htLCmI4jvyINIIO94re8jhK/ytkbHGEiu6WE
 7NJcdIQr33lBfj0TFFem0F0WOFqGgg==
X-Proofpoint-ORIG-GUID: hr8vAMb7gPKG8KHHUqy-GdNxZHSmfooT
X-Proofpoint-GUID: hr8vAMb7gPKG8KHHUqy-GdNxZHSmfooT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170077

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. Rebase so it can be properly applied

Changes in v3:
1. Add Rb tag.

Changes in v2:
1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
---
 sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f3fa0a5b4095..c32a5ee801e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1192,6 +1192,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static int audioreach_speaker_protection(struct q6apm_graph *graph,
+					 struct audioreach_module *module,
+					 uint32_t operation_mode)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
+					 operation_mode);
+}
+
+
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
 {
@@ -1241,6 +1250,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_GAPLESS:
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION:
+		rc = audioreach_speaker_protection(graph, module,
+						   PARAM_ID_SP_OP_MODE_NORMAL);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..19828b4accce 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 #define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
@@ -559,6 +560,17 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+/* Speaker Protection */
+#define PARAM_ID_SP_OP_MODE			0x080011e9
+#define PARAM_ID_SP_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
+#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_OP_MODE_VALIDATION		3
+
+struct param_id_sp_op_mode {
+	uint32_t operation_mode;
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.51.0

