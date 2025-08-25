Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAA2DCC01
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116785; cv=none; b=gSImHhBxHkKKhh8oCK57XkssHf2BDauJUmGeh2PG5Uc8zPoXo+GHAB+H9HxXmfuHVN20SeYjIpg/V+y+pqM8GEvwGlX0gjzYXdIqXpRfC0bsLRKoiBN6tXubc2F+stuN9RsbRW4uK9wLie24G7dLb40+yLsU0sSLcktJQLPDzio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116785; c=relaxed/simple;
	bh=FcknmGm+9WiIX6l8pOQPi9nRhprVfJbtqLcJynflUEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFtJ2bCGZkkVm/ijr5HM4nr0I+W1F+qehn3BiwA/sKWDwCX5qnXhaR9ds7T1R+IonTNHT/9xa3gRb8Qv95Q/bS2IBV02WvgtGNPgiQF6TuW2ygAwJRyYzinM7kwcL6yAl37dS4GtRaRVv8ZdcvUFUl5Tx9VfqXpOivn6w3LD/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZIikFne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZIikFne"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8EB5n014346
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=70Cd69PzEsB
	YLosF81sclPZtndOuxMvCiDYzgDLZxnw=; b=WZIikFneb69cFXmAqt1KNINOjUk
	koB1wjgz6xzbJxl65tMfytRWpG5pZmD5T5sDNHijhRYrgN2Q+GOwUr8aeFCP1M4X
	u1qpHRhgbarz26xIdRPn/vg7GCNm6AbW3/QQpnDemXZI5ynZdHG7KDun4X3J/jRG
	LAHYni0BLmoaj+BF7XZGWp9zNjRIl6lueLyrBqucpLWfTFvvC4+aH4vLPSgzsN12
	IQpVWjDHZqkYaNXccZRamFfwgExTb994y4sg7Vcahq7UBr0d68sPRL3uXUN9QOSt
	fH58gnSQ5LVUtrSkh0B00hd0xRndxEJb94ZbH9bru1J18Xn5wwMTNhqb1ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thvpbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109bccebaso124568331cf.2
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 03:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116782; x=1756721582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70Cd69PzEsBYLosF81sclPZtndOuxMvCiDYzgDLZxnw=;
        b=d15ADT29BNfCa01/ivlhmQa4b6+F5VAKy9oAA00aC994bkxPGVvX6Lk1J/gdt3j7Zl
         79HF2WYjIElEmojDQvzUZq1BR6FCwNnYKDloL5AVZ//XC06buWv45RnmrjgM/g5+tV3V
         R0Q+HbzVSHeW7813rInMluyGV74VyR7OISrEKge/U5IYgKY4328kt8vwm0te2CdwlbMg
         SXgDfCUYaQwlhEsH0Ery/Fzs91Dh+vhf0U00CL6ftv6Mr8pIKqjBEfRxR/XFcFim4xBH
         ToOKDT6tw4b18ERmQyGHIs75x65hjpcPyNUmH6Z+aJuiCBvMiRzZo6+ZdU2BNrLJk5jn
         dLZA==
X-Forwarded-Encrypted: i=1; AJvYcCUQNtGXJ7VZBeIgMLFNigRw90y10I1u6ttDnAgNF2VXT6mJA6OM8hDPLLlQfRqEjB4q5q7AWWmRWT+o/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFX7lVj1xIN1iMMDB525zWNtCTth4PFtzAYRPLWa0bkJVnSHLE
	pys+Zvi9mv6ZrbKtn6ZFhvY3s27A12b0hMb7B8+o2DFuNYUtT1ludFg8lDrYQZuJagBKIlyJ0ni
	SLNTU+l1+pe1wJIL16NyhuoFKAujrYNfNdszwN513JyzN+0LWnIJgFJkD+YAPfz3biQ==
X-Gm-Gg: ASbGnct6KKGCw+JF6tp7tbWeNbuwp3NdbyYZQ5m4jn9THlTgzVPa3LXVr1NfDro+WbO
	pZl8jMBolkKwUBP4Ys+dDvjxw+BpxW5iM6uv+Jb5h5f+8Wg+GBncaSPGcE1tvNn+aOHNptj+vqV
	qcf9pGDbCGB+ylmcwPwPfvRuwSsowTMGB7zi/C+UfkJmBHw6zVmX1k23xgnIO0FW3CIlJE4Nt2/
	ecl7dKiMyk0jWkxtXKSmlNJybimeuVKxShaP1hTToraqwlkjXb+fTe3UKEJx9HAVoaVfFmFMTor
	ZSNxlH8OPd3anmNsiCXVDyYZiX3+keT/O6xbAF26Su/g4fjfrWo5eg==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr124162231cf.46.1756116781744;
        Mon, 25 Aug 2025 03:13:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQRWrfm0H/XKlro+Vf5EWtN7Tv7phUWtVwKFsMpl7Jna8Co3ls3l7ua2pKZf+Phx1OGRlsw==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr124161981cf.46.1756116781115;
        Mon, 25 Aug 2025 03:13:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] ASoC: qcom: audioreach: convert to cpu endainess type before accessing
Date: Mon, 25 Aug 2025 11:12:47 +0100
Message-ID: <20250825101247.152619-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX4/APv1MYBGny
 2R15oLw4pjcSAoZvkXKg8qw18AFP9BXMM3hkPK+GABfkSO462xmMOfqL0jJPu7kjCW7NChQJTmH
 A3UfMvWL1zpO1gPzD5mscWgyd9cVPW4unNxcdmZHR3fFGBSo300+Chq8S9FgwypCKrLYchsMTkA
 6AZSqBpbFd0upntYNT+s9Fa+8dRyn/5jCsJe+9jTcsMp52trGIPIKFKUNqWnUx+uYZHpp/k+r1i
 7hjLOZDvtlPcBl4i/2SQQkDfsiFt11mTjYfeuW+fM/cKVvIyU76M7Y65NcAB/Qe4xKQIkMS5K6B
 PvS7wqLeTjOqgJTfZS5Jiy+yEtIr8YkO9DcqjFGvD6LwC55tEzyaIaKl3bqJOhVe7bZN5GEnWnN
 Vu2DAneo
X-Proofpoint-ORIG-GUID: MntL2q_1k9AiWAtUESA8rSz1GPcYPe5J
X-Proofpoint-GUID: MntL2q_1k9AiWAtUESA8rSz1GPcYPe5J
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac372f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=OR_sDe2PA-1rWwznPDAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

Looks like some of the members of module config are accessed directly
without converting their endainess to cpu type.

Fix this by using le32_to_cpu() where required.

Fixes: da9881d00153 ("ASoC: qcom: audioreach: add support for SMECNS module")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230830.Rkp7HHbG-lkp@intel.com
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..bbfd51db8797 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -815,7 +815,7 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 					struct audioreach_module *module,
 					struct audioreach_module_config *cfg)
 {
-	int payload_size = module->data->size;
+	int payload_size = le32_to_cpu(module->data->size);
 	struct gpr_pkt *pkt;
 	int rc;
 	void *p;
-- 
2.50.0

