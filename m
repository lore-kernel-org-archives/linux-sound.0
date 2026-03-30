Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222C3AD505
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858906; cv=none; b=ADWSTVuZV4VwI1LBW3GOBv/Uy1omXYsFPTkLVgJjKABPeQOAeGYQMS68mhp14mN55LwvvBYO+1KjswSmZvouJr8KM8YTPuRgmn5TxY6aQ4Twv0ysQVLSimAERF9Xikb+9rxUcJaiahET8TuDQvlzZSuU1SezeobFVl24Trr1WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858906; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRVCPe5W0lHoIopE3KdTyHMWQykluQpc0erdEZFxuZXBd5tORnx1CWIcFH5DB431mWLG2+u+rENWOpvqgyv281Z7CNa0ix10YHur2LGknKGi6fMAzhk+R40YW+xnrkj7uQjcLL1BCCAhUlSWBThvxXSG3BHZNTqgv6Xxhv6U3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm6gpN3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKQJJmQE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm6gpN3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKQJJmQE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U41uUq581550
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=Hm6gpN3uVmzLfqZbkE992WozLU6
	KTlx3d0Ta/UswVXL2uMYfrFOxDSjGPefz9hhlPz4WmUpSxZqCr5v4Sh3ikhA47R5
	cEppGu7D75F/sE6jQ81Y/l18NdFsR2wsSVuh8iQVrkLLvQEUYSiAjjaEjV/59d1t
	nqrMhUpBQr/6Gk17tfIjYHLk+M+bGpBAM37Vq7hjc9rMaNya4pMiTZmEALRMbcVi
	/hLeBmhvlX9F/pPFQwHLjv4kXb7kZZ8ZJXyhM/kRd2NdRHzOB0w1i+9T8Z8Cszl4
	kPWK+XBAEStBTam8vDUtdkoV9ShoAOUv1/kiZNTccacI6K3sJty9HkKL7sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so52944001cf.1
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858903; x=1775463703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=ZKQJJmQEm3GAgJJHVW4ZkDp/RYowwV1iWJ7XFrMViFnBHDm0DSCBOkhisrsT56pVE+
         qnTgupqcbXbyNssBjgy65sR2wv1nHIocux+QfAlqxRKTqHWhVaykTqdGJpg8ZSTlnQpH
         RpP6SNASkjUzRWmlKrdEXfE+j3DK12EyhcttDeSMsoTlri6/e71L57C7ReagTq5w8cpl
         m8kCExOKiQM+0aC/o7gejVY/Bkf4AuzMWiGgK97kjRmBU/59+/vqRr2T6hnmriXuI8sC
         TJqH+FFPhoQL2jkY9N5nuyxsy1HvC23D9nePcSUvrM6K6DLGGCcmR0oi7sGegdDuNXbv
         xy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858903; x=1775463703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=qziewx20WMZ7DS3cJFjQVpIF4mcnrQLNRq0jP1ecetmvIsIYL4Cdes86OeNE/p/QJY
         K0TBBte6ZavhMxVxjMOttegMdwsBg3IjWbp4/ZZXKf4Y2f4NWqfZmawj+x0BniTX8Tap
         zmPbZRx24N/ucS1k3dCLHg/LjufsKuOk/HO8gLwZw90JSj0cqss+8qWHr108jpAz2asN
         cVzNEDis4/x0lAZobaLd80qoTU6td7dBkcTl5A2PZY4vkTByA+JiLQsBCYFU7oIg+iVx
         JHa8I44uwPJgwuZiBAoI996fTqIGUbft2/QMTBEXA6f263DxSWxEa9Pb6ihrh6gd4+tv
         XUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKWnZnWYXqJDwOL+2sxfoP58UIVV8mTY539/dkt6M9MHoB24fiWmVG1nKtkz+/CjiIZX/fNDlNWIPFsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBN4uH6OmjC59fXMOqULwaFfyk+5X4eNEpu6pB2yb3IWpxPrX9
	BD1/eaiYTncftC6XMiRqLCRdFZD2TccVcpDs6C0XQOBAxx9kCEqQqprEynybl/F7kGwByy1/SnV
	bt+DJb5KElUJQ1JCh2UzTnANm8fXKNa9bgYW9TNxLAiPlGVCCj8UeaxKIeboh9rbdLA==
X-Gm-Gg: ATEYQzyGqx4YYzsi3+zov1ubZZcTuhtqxN8Lw80r7/AbWitlqt8joxl70t+fNA+GgOS
	lIw5Ff+2Tz1HAaGvQCowawZwUR8+jp3GIrfuG5GPZZVfBuMRw0lacPgQDRyVM0aLzsqaVRXqPK0
	nvRpvr/1mlT5ao5rMgy9tn+nr2nFB5JzdniQcxMtFagXyIvzDxsy07iq/HzdsRjHwnA++QNp2gp
	HrG3eGpspcGWuVQJbP7JziU1GAK2BCNXrraaOpBbyKZN3roOiHxZYXd+yHQe6f7sV7GiwyY2Vji
	pNZUIQK/TpUXW+G2dDegsV1G7njz9QDKjd9Yt6EdoJO+zQskwZtb2uMaLbJ3r8R9HmARMDsp5nz
	9AjWf2wlKzvuWKHX/LMJdZ6BeR0j1ejM96EOlPpMReI9gk6OkxtYVnQo=
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614671cf.29.1774858903218;
        Mon, 30 Mar 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614371cf.29.1774858902706;
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 30 Mar 2026 08:20:57 +0000
Message-ID: <20260330082105.278055-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mba1P2Ep9KwJvmwc_Hybms8_s_apGUmU
X-Proofpoint-GUID: mba1P2Ep9KwJvmwc_Hybms8_s_apGUmU
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca3298 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX2eqVMi6HplW/
 Nwq6RmnCZ+1L7ug4OVp0HwlhD4nQqJ+Qot4o6eE9+zAgfcMEUVMBxEyRKvgm5Uct1EwsKdul0yM
 5v422NNqwSm7DKdmwJLfkPlZh8u+BIUtSHl0+wux02jvAXROvw7tzK6HkMfiKpMU/sAmff3lgJE
 asGnqW/FZWveP01k1gamdzykj4K0vWmwZk5wkCpa0IXx6MI/bEcFBQLnhEr3pwi1KtM7mx9QZs+
 4zlLBks/QTkMSXkfZs2cM8eLMGR141H3bJQy61iCBu2z1SSYUnzzcGsvmBhZLVcPjK9bnQNYrnp
 pBTACzjw1Tw65UIcXtd81CRY6bCMZiLiQBXuKNv+IT5C+451GAeucXCef03xqZkyhLKxLC9TOsf
 ubzlCAoJTk6Lzn53BLkZfNmtrvXNA6m9yZ7BEyKwOsWxx0ptdWr+YNN7VgRCRTec92Yg2qN3YA/
 MhH2BwmRTmLFjMPnuLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2dc525c8be42..5751e80b3b92 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3

