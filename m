Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF530C60E
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215169; cv=none; b=UtpTmcaUnzlrvBhO/iADB9JK4PHpNTDvHRz0xFUl22M4KjAYsIRg/fj9REsvexEwqHogAVS9DTjOr09miOyDJfUeoznZSxA4lWuoMbvIo8iBV4iRT5JxiuL5xpht/xacihaSJf19ORoPbuQO0szew2tawONRxGe6R5XJNwGENVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215169; c=relaxed/simple;
	bh=0eLCFL8V6+g5aAvq4dDgsIASiuIJt+qI3LKNCvOALz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu0Fo7i3y3Zv3UnsdwezmvMNPMFzZqwjLhOI5bEqKyp3pCpgqZ08m1N2WVUdrZMpAWjRlXNZRaRQ7OVklebyUV8VrBVMo6PldIQpDk7aJsPRUgdepejn32RZTOY2AGnKZgVWhW6jlx8SI45uRQpoWxIY86c/UZUgSmPwn0XjH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opCjfWSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opCjfWSk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6njN1007434
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PERB36M8V8P
	bxoKI1dQPG3pXRrOqc3fmNLU93lba5Ww=; b=opCjfWSkrLd9OfhPAvpo/z8tFne
	o7cTwGLk4jcNHqNABAJhTBQf6MX3/NT+Mw8EOrauEJSnJkX2UEcLWXJUhHtAN2I1
	rfR6FyBvBfVKXJAIStHSLL+FJFY5dtJSY3YH34duNmnt7yJV6sgKTdt+CH/hGYjH
	DrJUfvyubR9m230AWIN8Fd1gKxabWpqIWkA4HedVTsoSwcNVwAAmdo+FucGCabS+
	VDqrvm42M33SnAX3/NT3OQzMcKQ+2ZpPgtDo8LYtHitSYKYUbpOlfjzDjk1zdm4A
	gArn5cuiIYPUyFb6lYEuUPjYgMLVZFArJv3liYoBAhTgukZ5c28KgS44OAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344839m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8bb155690so8465691cf.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215165; x=1761819965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PERB36M8V8PbxoKI1dQPG3pXRrOqc3fmNLU93lba5Ww=;
        b=DjlB8+aXZ8wNenWAq5s85Hg37S6sryjKmjONGdlDUeEJGd2i41mGA11PRIfHFrhTTM
         Wp66GeQTqsJ1vkJ8lBOWCBOZPiY13HaqJ7RN3X0u00wmo1sHW4LhPGUCya3H9R4avSHt
         7j94nLc2moOAN9MlxasYHqHR8R7UTVlUIeZsckhkgSDKg4CyVchu5a1s3BZCHLzR51PE
         Q4XaOa15hiOIYtDwN3pz66pY42vNkOqN+JvI/TiFmoVk2MAq0cLGIoBNuRuf9gORCi70
         T0ufVV0IV4sk8h1PVqGKQ/PzeVnSSIhgy3M5luS9xKbMu2IMLPCGmq10HqvY869SqShZ
         KZnw==
X-Forwarded-Encrypted: i=1; AJvYcCVJSxBahpB6z2HZRXVNR0AJI4IlgDvjNPCrwy5wu6O9Shsy60UBE8WAUnaFwLGiKgkw5dTGmEmRpqfOsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYx9ha8M12BqnAwPx9XN7NpQqqJqvQPGH+YL6TGeZgtc1o7WU9
	41WlE7wW5MqyrKbhud5tI3HnbEtiwrlV6RN6ssPk+VlHa5KFh26EQFOt0FZ2O8DvICTyqr5O8BT
	080SlD/DpMoLVcYHUnZrNHRwqZNQ6LFQLcFPvhlLysQAgZdJmyBiJGdGPiV4niIN15g==
X-Gm-Gg: ASbGncsMxEwzAJgG+xLW1RpVzA6/aubDDAEFBejbsymRbwpvzdt5oFfsu3mKLbuHn76
	9oc67deqpagLus2kEzLZmX5KfI40vJ33QPpmgJqYHjg5d1Lik1zVwlI5bVKIVo9QtuwL3qVnew/
	bcfz9f96BTxADHu9AARsXZzOigjpLcqG5Iy08/l4GmG0X+eqOVGf4TbkMmMHByfkAnlgtliBYBd
	e5bFe1bVyl3gMpRrkD90YvI1phQGHho3RyUt1+WCDHlcs5EAkMk/uZiyZRPslrTF2a2D/4FD7tq
	iZGLri/ViCP76t/U1S/ICmMhIqLgNtsYBuDKUfYk3RkS/yiQfcQuNoly2gofaVPUTQLrhsmoCpa
	WAEyz6UgCXEds
X-Received: by 2002:a05:622a:343:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4e89d208482mr276254151cf.9.1761215164729;
        Thu, 23 Oct 2025 03:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn5c8+iIAXzjyMz4gZOYSOyXoRyeSphaR9Vzxq59ZuEp7n5WLDJ/muqEKidQjFCzQUmKv27g==
X-Received: by 2002:a05:622a:343:b0:4c7:130f:72ef with SMTP id d75a77b69052e-4e89d208482mr276253891cf.9.1761215164223;
        Thu, 23 Oct 2025 03:26:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 07/20] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
Date: Thu, 23 Oct 2025 11:24:31 +0100
Message-ID: <20251023102444.88158-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uXc6e8yCoeLBVqRBQUdm-SSvv_hsP7Ju
X-Proofpoint-ORIG-GUID: uXc6e8yCoeLBVqRBQUdm-SSvv_hsP7Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX1Iib+/SNtoQ7
 8DSMrtOHDnDunlszdR/ocWnOvl7BlOJH7oqJ2teVoyeS0u4FFa5qxd2Ro54xsz1fFfqZdbRIPAK
 S/tu0QRG1csnc7G1sC5zhD4ML8thafsHikcUUz9WUs5NeuleSZ+7jHqpNPAFjDACnYMPQFcTogp
 o7MmMk8lKt5JEgrlt/Cp0wdMnxA2iobnAfnXNadcr404oztv11h0r6vRAFcAP77fN5lWWt16pos
 XiCEURctXH8V3k0QuPbTou9o1WT+v79uJdp87F/KoBDJ27VXJnnFErke1NWuBo3WbqGz/7ANmWz
 VhL2j7cxEqCdq3cB5DCs/SItv4IFwVL4Gi5PCnoZXj4l1iegsXj5eaC+ho6AFcde2p4/hw1fTgb
 izUEfr0TnPOlc8mua5NuhdUH6xFUvA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa02be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Xpi1c-eeJLz4SkQ0e-MA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Currently q6asm-dai is performing an extra layer of calculation on the hw_ptr,
which is always prone to errors and redundant.

q6asm already has tokens to indentify the pointer pointers which an be
used to get the hw_ptr and this is more accurate then doing the
artificial calculation at upper layers.

Add helper function q6asm_get_hw_pointer() to get this hw_ptr.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 4c3315d4e27d..1478948f9fe2 100644
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

