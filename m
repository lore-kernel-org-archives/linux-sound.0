Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD533C1B7
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870084; cv=none; b=ujAufA0RVuQGeSLPN7j1KV2J792WPSa1hhvJRsmzcBwD3Nh/b6KLvPYmfzfcNUaPcd7kececAJm7JOif5fUnXWTKejfoYcCO8tSrSEWfG1lvJBUhfUD7Thsbjv9YAmYR/eP0tTVr4A8Qrvi8GxlG4krSiTNE7NCpBvABCosyn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870084; c=relaxed/simple;
	bh=D974qErk+eSVxHSJ/kOz4RqeA8U4H6OLfYkanxY/E0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGo4Ua8T3sUI9IGg2esPlCAoHxEv45IM+kMV3xnjvOtB9jQKlAu3lekwsUADc2M9GxWCdGoY4UEd6GA8mtq6Vm0MTOaZtvex9yrq6YsZhoRGkpcEUupFVZtx9A3UYH74Hido+pHwl00U6XSc/drjfjGeSCTbiBpanYdZ4k48s2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5w2WyfZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPb/iLC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5w2WyfZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPb/iLC3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRn0i1641598
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UxOF72ZgTD7
	tt4flWCIeDBHXEX4DVKcDbCAoRgYqJlk=; b=E5w2WyfZPUGpfO/3ef28JwgbvGP
	mNMyMsHpfSZOoI/EYyOggTRnwKFTq7hTwxWF9azVe1SsiKGGiTOEsw2ItVwQjG+j
	4Wo/McvzGRVyMAwulQBJW1s4LvanvSULobCdRa/OGXC1wFAcWRlLhxZVz4lLvxb6
	bYZWC3gxF85+vokzFfT9GKdv1TippnJQ5LO9cyJSkoro4SOEQKbDEIBonTeVDWpV
	7zMRKBSUnlHlaOl4AM9fAFq2kbyLiqW7vK2WjRo2teOCrguomkcu99TQ4xIrHK7/
	AvA+Sf8Zc762bSs4U+8/qWzKVm+jOMxIcVpdb2ikGpkg3eP6UUWV300oepw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rb3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so671815685a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870082; x=1772474882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxOF72ZgTD7tt4flWCIeDBHXEX4DVKcDbCAoRgYqJlk=;
        b=EPb/iLC3GrkG13fUTnaglhFuw9M4IX23hD5t0B00dkUaS4qbKPJGbgHWBwCzf/6R+R
         yi0a1LajgckrVagCPn0v/uPZbSdNiUUnjjsUuyxquk79w3ENX0I/9rvCaIV06Seds3LS
         rH7Yg1i0dlpl7gZkhQC+VpiS6b3L2BkGOxM2CRuSVR+/xL/a2zE5uUy3j6jyCOK2UH4V
         dQQhO4yu3vDUEai9+KYJkOKYcmTA7vDZVyrb6NpP398QXe1Z1Zc0fnGGhrHNEkbOvBAp
         QgIA4qyqTj2Mzo130Leucw870RirH+HLxQCcXqrZsPPCaq01E/Z3DYJgO9Sm/ykEXlji
         k7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870082; x=1772474882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxOF72ZgTD7tt4flWCIeDBHXEX4DVKcDbCAoRgYqJlk=;
        b=nnzs2GITGIiTD8p7+uzLZsF3swAp89VTIgNn6QcOi/4hAIUronNstpQN59/Bk33NKV
         I6mYja7HgRDtqHcXxOx0qp5sUi1GXB+/C4jtWRk6CxJjE6VP5ieyy5Nu//8masRg2ic6
         Ce9ApiXuQeQU1vif/hPDjDG03sPkKaX6RnV1c9h4hmJvQzqgaXJwn6CPpAYh5uQdGA+U
         fw8noJRMrb6tQLgsHLbuxOhLocmHVGeHV6jqyak7fiAkA/SWL0DQmTllKjQzJ26JorPQ
         /tzY1vc31QEgxGGD9rcd+0eRnXzqpCF/sXyMppjjXN/U7qwLTPRJPzGOxZveDtatr9p8
         k9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqwIVBXVmz/F6oGMgoQs08W6B3tpPTzMR1Dmk9DruiPxmDOOypm/1rzjaj00HAW56RBY5xLqSMRTlvKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8jK0HN9Wzk7V4ogzp17gV8jArY2pzABxxDywQ464qhjUZ+0z8
	/a88mWfiY/yEAWrBYOZ5dxMM/Dq8RncrRLuLNVJYAyP0Iv9zfwnfnYWkfvJRi6nPnbldw1M47iL
	8NeqYbk+6jR2HR6NJCVfvH5i/5n/upEYhge1PHXOt3JzQta2N6ud0cN227VEp4MAKMw==
X-Gm-Gg: AZuq6aLz9eCEa8BzU/EAJjX3AVaukyUnhjStZXHbbxJ0aVl22FlSVnKpvb5v1+C3C8z
	/dYQBiqloOi711qHARbBrcAHmJfRdpvu1QAia5t02aBMVH13gaXKkTMd8Cxao1arwnxZdy79feF
	3fAUWR/Es578AX826g3Heg3a3CwHBmzRL4cd9auL9MRgIBQpCiOZAURHXW6woDo+O1oE36oSKYM
	LvFAG/Dt/G85O/OpIFhDHgPeAs05bZE1DuhZ8KvJ1kZYUZO1NhlBSmfXcWctA0d6oLy3o5f+Lmq
	PPtYO8HGK9t+9ou84J402IaeJ3zu8eIyqynZHD7JIuv9oYJUrSjLwLxW2lyXfSl4XgqbNaKV9bP
	ENKF3FVlTAaUMCoovhTG9KfdIf6rBBfDi629hiQYhANVFNR2vXKhO/BY=
X-Received: by 2002:a05:620a:4016:b0:890:2e24:a543 with SMTP id af79cd13be357-8cb8ca07cb6mr1259244985a.34.1771870081492;
        Mon, 23 Feb 2026 10:08:01 -0800 (PST)
X-Received: by 2002:a05:620a:4016:b0:890:2e24:a543 with SMTP id af79cd13be357-8cb8ca07cb6mr1259236385a.34.1771870080953;
        Mon, 23 Feb 2026 10:08:00 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 05/14] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 23 Feb 2026 18:07:31 +0000
Message-ID: <20260223180740.444311-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JyxyNucY5rY0E9olcopNyH7ERRxUtlAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfXxh2WLE2Nf5DJ
 OwYYKuErXjSOQtCJdBGE8XodSpiYK/ldzMeFsx54oUaTdiPBFgL26CDp2dnymBG6cR+Kl0fWkHP
 bnAPx0FBWxrTBhJQqHCNADaKmF3AojDd90W9FyIPODh2bFQkykllMV+Wrsy2n6d9u14hjJINMXA
 Zp5lHdZnH8vwIF+bfmS8PBkdAEB8CL7zPga2N4kJUVrj3aBqcLPUYAKgpljuzOs2rgCep6DJgai
 Q5scTI9Lv5U5ST5EBVXS4Un/F64ZpqQJZaCB6B2ViSadlck4ysMw6iocMeUhFpPHbbjJxjLLXl9
 wVTHE5FtSuxgAwuPt60doVZPenN5wwqHSss1OGlHpXHpDpUjdeksEq/FmoTQdcTushWSHTD7WSL
 Oa7DSVL3xhHKM7DMfmQe8eyCN29dYICMkvZt3JecNbT7S8z4B7NmpCfeRRUhAg4O7qxGYWLi/nd
 i0OxcYd0O3YHYEK0Zaw==
X-Proofpoint-GUID: JyxyNucY5rY0E9olcopNyH7ERRxUtlAg
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c9782 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

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
index aaeeadded7aa..87e4474d680a 100644
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
index be8b205d42c4..4d2fa6a5e065 100644
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

