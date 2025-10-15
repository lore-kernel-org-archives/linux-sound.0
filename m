Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2B2264BD
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534299; cv=none; b=aLc7vUb1i2NF4WPtLrdQvmwiqGPjt0OSR+CYD+x6CPUsIxMQQ05eD/5dap24y01070bq7Wr8VDp9NEGTqzOzSTtuSZnEsP6VxHM0Un7EC+FExZM4zYoqO/nB5L5tcqwBIkGha6uu3XCZS0ppuUbBMwio/F7WClca+nD7ViMs5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534299; c=relaxed/simple;
	bh=gw6jOBRXvp96kuxuVwkfEFK7rpHtMnm9kKwZNmCz2N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSG1okHKizRuvuKkFlTjKDQLgyBijjMpltvfSHu26lSk5PCVZPGEdeJpz7Gvv28QsHKE+DqX6Vd2xMIzQRNIqzfL+DCZLgdV1WNntkDRT4WgUbdPKHyxqn8kPhYtirmMqFK9sUvu9tKtVXlx5pjdHEBsjoAi1W3NHgb9cMlt+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azpZgUyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azpZgUyh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAjtH8014780
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C9C2sc2A6OP
	brM7m6MIVjYsiz10pmNe9evy2xuv6tEM=; b=azpZgUyhP+hcg5yBdlxmqdcyX3x
	ompOsmYcvwietzbHAu0Or419FspEZmUtfJFlV8XGPbj3FetpE4mLgVZKh0zB6wa3
	FtqOEtOnibt0R2Zw32NCD/P/rTXz8nEKwzVQkMkzpHr9KMGrPBgnZjcvNoXOltXq
	IiFlEGz6GOiRTI6ygSYeIZzTIYRNYCMD8+ncPN/m3g8/xnWO7GL0MjNfpbi1Ijf3
	/sxOkYzfAFv18ZO22zcfeygpw2FuYX/MoBAfXX8xwVsH+3+Y4s3vepMNL+wN7fE5
	sFYjDXpuOFghaJeNcfW25VB5qkqnaRAvhP7XV2E/n+w5G6SB5tFlFZtKI+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj4hbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88375756116so1386785a.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534294; x=1761139094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9C2sc2A6OPbrM7m6MIVjYsiz10pmNe9evy2xuv6tEM=;
        b=dZxP4C8/ClPEqKBni5A0s3bAQco+EfovhS/jlkjERsEib/n0OaTtiXt28vzYz6SSsg
         RO5sDPMB0m3cUPno9kQlCFXb4AmPM5ol/E3NWsXNh19XKugsXJqiIah5qRoB8qI2rRrN
         YfKimgqcSIBYknEOFqnqSel0vTnLw81Eypb1LlgqbfEpYtlCXllTStBlnkDomff5KHa+
         GEZeigPLVLxwqiG1jKH3jfg1QMO3waihezIoFf3PlPIEzZ8VkYMOjZxnnBpyfyB75zOj
         t5LFgc3WHdGqFtcHsXl3Ij9DqrGdoB4BZxTJPQl+L5oJS/6hb63grW3ZjNocOTf925/T
         rAjw==
X-Forwarded-Encrypted: i=1; AJvYcCWhCVzBLVWzqU+420551GRkGC7Y8MJoMRqWBzXY3FlV1NHDbTQO/AXaUrZivohjXJ/mUtNGR+F2gsp5aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1wOkhxOE1vRnO7tPOmtCcQ4dj8nJIGKaOlTBGmLRypfk38ig
	/cSusmI0vYYd8a7Lmh5vuI54FupNXIG+fTf2MmtesDG4KkHvuzMstp4SEn6+QKtqqCBfGDE7nYx
	kkbN1siMUeBTF0AX0/glYqxIliTx+bdnTstH0KxUbC0eRnQOCrhP4Ux/biQatwsmGBQ==
X-Gm-Gg: ASbGncs260yviSSb/5BE2NW355VNo0sN2+ifKWMrQQUi5V+xE8LPYpFU0IaqmJMHiN3
	bvRtMb4C6akgdMW21MsYEQj2ywvB2m7D3nsmu094nfG1ctNBvmB/9B0iJFBitREx1Pgajxx/zPD
	7Rn9wKGGpNwimIADnO1/Fwfa31XzsOCFHLGyrzRCFB1EhFRY5xmAVLHoZailROEtgxyZ0V7qPz7
	mvNW6AnewSWGcTWUvg94c2puwzwZAFHysvkVKzsFel1rJFj8Wm7LDCi2rVI+ThPKEBKD2dbjC+s
	mjnwsDVVnTx+3GIaKQVSVX1ls7AryxwRMzZClZcol+7G7yYIp6fJew==
X-Received: by 2002:a05:622a:18a9:b0:4e8:8c91:1d0b with SMTP id d75a77b69052e-4e88c9129c8mr11072161cf.61.1760534294188;
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0CMlu9MhDFwvPcSu58T/hp5Z9HiQvZdCOtofLyrFvYZAEP6D+IxtDxCV4LRU3c7gZPSgu+g==
X-Received: by 2002:a05:622a:18a9:b0:4e8:8c91:1d0b with SMTP id d75a77b69052e-4e88c9129c8mr11071621cf.61.1760534293674;
        Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
Date: Wed, 15 Oct 2025 14:17:37 +0100
Message-ID: <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6h7EiTrmZmH8
 tUl4yRMJkPpkKLNfZIx37GAAH6puZDEoiVNtYsJNJhHSGKg4Jb20cRC2WQui822nW8Tue3U1+OW
 NCFIdl4SRvFmjjTnhhO4zthNoIEgUbAHUlVZs1qpYhsAFFGr2zC42YqwEBSMo6Od2WvOi9gi/Fh
 gB+DfLTm4aHag3w9N6DXikJJNxSR/oCkx5R/I4GFz+Qa22rKv6Iyb2l/baon3dyjLpTLd8HHzrF
 IaJW/kJINiWZX47Wl909dPdjVY7eFe7lzblsDRr5XE4WnQCHguzRQ7TBushghi29hCkwJKF8Goj
 BoXbYQTpX0dqZJ/bXU0Lh0q7KWYeMgHtbt18yCVTA1m441uipPuccAeI5r9gDX8f17CqEg6snfa
 bjSHrJrS2lHyp1ebVdtU8ptoMRRLVA==
X-Proofpoint-ORIG-GUID: cqb5NXMdYFAZ5wiV9fk6iLDSnmetUKcW
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef9f17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Xpi1c-eeJLz4SkQ0e-MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cqb5NXMdYFAZ5wiV9fk6iLDSnmetUKcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Currently we are performing an extra layer of calculation on the hw_ptr,
which is always prone to errors.
Move this to common dsp layer for better accuracy.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 371389c8fa7a..643ca944b1b5 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/module.h>
+#include <linux/atomic.h>
 #include <linux/soc/qcom/apr.h>
 #include <linux/device.h>
 #include <linux/of_platform.h>
@@ -248,6 +249,7 @@ struct audio_port_data {
 	uint32_t num_periods;
 	uint32_t dsp_buf;
 	uint32_t mem_map_handle;
+	atomic_t hw_ptr;
 };
 
 struct q6asm {
@@ -598,6 +600,14 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	return ac;
 }
 
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir)
+{
+	struct audio_port_data *data = &ac->port[dir];
+
+	return (int)atomic_read(&data->hw_ptr);
+}
+EXPORT_SYMBOL_GPL(q6asm_get_hw_pointer);
+
 static int32_t q6asm_stream_callback(struct apr_device *adev,
 				     struct apr_resp_pkt *data,
 				     int session_id)
@@ -703,6 +713,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 			spin_unlock_irqrestore(&ac->lock, flags);
+			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
 	case ASM_DATA_EVENT_READ_DONE_V2:
@@ -721,6 +732,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			}
 
 			phys = port->buf[hdr->token].phys;
+			atomic_set(&port->hw_ptr, hdr->token + 1);
 
 			if (upper_32_bits(phys) != done->buf_addr_msw ||
 			    lower_32_bits(phys) != done->buf_addr_lsw) {
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 519e1b3a3f7c..6fafda5bd849 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -148,4 +148,5 @@ int q6asm_map_memory_regions(unsigned int dir,
 			     phys_addr_t phys,
 			     size_t period_sz, unsigned int periods);
 int q6asm_unmap_memory_regions(unsigned int dir, struct audio_client *ac);
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir);
 #endif /* __Q6_ASM_H__ */
-- 
2.51.0

