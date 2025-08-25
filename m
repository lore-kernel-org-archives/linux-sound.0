Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB62C0F84
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116782; cv=none; b=hX7glWYU/xAak1TibcuCrb6rwjF471zTzUrhF1McgCujsH3+VE9Rf0iBDDgadRg2ZLgtPkRtPuV6O5OheOgBY+lIWYJWT1DetjiA1BGbtS5ZUiQRNIITBmS/YzqHuJQHAmZQQpI6zT4JN4BcAZ6I56XO5jnaITBTOjVZPiEtIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116782; c=relaxed/simple;
	bh=qETacxdD+xOMesgXMU0txWNaZ5hKWFtVQbpaLYum4Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDAlj/K/OXK20c5CrCjdTiyy8P2f1pGZA9EyGhrY1gMKmiU4ks1FT8RZnqcjvnpK+9BZbOT+/s737EPr5gEnjxafamvJBZIyEPAsqndDd6QBZbFB37hKyar2CCPoJGLiWrvRZQNM8iU8pBk4PFeOJrh4Lkn3GYX7hrRyL4Im7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HX0CBdcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HX0CBdcN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8kGMW026845
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M94yiXXN3v2
	OeJTyDLo3KsFMQqNubljS5iZCkUwPSZ8=; b=HX0CBdcNMAbP5YdkvBxw06GNjHs
	dXwFKQKsnZrIvxTZbcsiK1KYW90sEKivlKgJFD+6g+kydNSH/pv1RvvPiu5lwB/X
	ug9ZFCKox4qmhIk7HytzYQncH0GmsuIe7Fg+w0NXw8UWKIcp5V0N/A05Fxz9bTP5
	C1WgmsLC6wIa9EAFyaz4t8sIGIUSbeYF99s5/Wvg0co5WOXC1Tiln9vrArZpojqv
	SJohIZ3/ppYgqky5n0jZgvqLMLnKKw9MSaeYau+zvhcmfWhb9XQSm9rnrnrFs/tG
	RUcuoAsX0+LAX/iv4TfsVtrsKQWXg61JF6S3lQwrMo2urbSluQdvCf8CrmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thvpbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10ab0062aso102922411cf.1
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 03:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116779; x=1756721579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M94yiXXN3v2OeJTyDLo3KsFMQqNubljS5iZCkUwPSZ8=;
        b=HvAc/vAOZdJTrgU2LS3feiBCgWcK5cAIePjv8E3Js/YNbEK7RPQWvxn+wXx7TBPe+E
         OjHmWyzdc5I9iWqhgoeCpmxyVSWnl/7mgYUqhM6E1meoqX+yDt5tuhnZCVlaxCwHOOmT
         ZloX3kfxpc3dT7GdiUMbOeBhHRv9xpmoKbUCsvRnNYHAw/MzXlocS3g4KT8f6R4aqgBy
         N3TgstQirDfEPd6vsG9zgYE9zkJaVDZCnRP7El77q7uFj8tpu9MqiS2E4GmnM/QQEqPz
         bt3mDwkSq6MfxKoFe0rCehBVNtnXGsB/1PVJ3K9HOxfr7QPifTvz/FIXkVXiUI1vNTzn
         XCag==
X-Forwarded-Encrypted: i=1; AJvYcCUDKrS3AkIm59BzU0Q/z0y0cW+DpcjyF03I7fzl17hUcQUKznLkHXFIpd7mGO3ca4CyvkDwb2wJYAmFBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8jm6E/eCzjmYVkP8BVeqQEVTGDbjmVQBnlkMJXQhmiR9/G1+c
	1cHtDanp6kGQoM98s4PcHWXiLFnwAz3WasaggMy0qw6lY2E/hZCFCLYzehHAjgdkup8bvEd5wZ7
	3LO+m1YXfrdZsIxBww1LupbGsVp898dBb2MN6Yq5g4gBdrEXj+Es65SEL/in7kh4U1g==
X-Gm-Gg: ASbGncug8FkKarsKCD34lZXcb5zzJ+cx0XIX34ryIKR38ioqtUBwXL+S6nLilOqbhuu
	vuI4/IzzLtJhwNtrnp2nOSKPxfGy3YLsq6w7veR2hIuK93ajQ0CrRWGfxjMf1eC6YnJQPjZ6OvO
	AggWVW9m/cmPNjnCPBOSaOU5CsuhRnFTM84iXGNtFGU7GZQIJVb20nJkbmbWPqrANQqY8AwMlJK
	UUh7KXtNO3ejYYSrX1sLFMZA+ldfJnsb5hipQQ7BWHKSMHU1DkjNiOwG/78qeei306DxXyvpuJ5
	D8TkzHeimoLqhF3UaU0a9Z+55budeWY4fnfw3sVo9QH5zddD8U+Ifw==
X-Received: by 2002:a05:622a:4188:b0:4b2:d25d:2f15 with SMTP id d75a77b69052e-4b2d25d317amr35725501cf.20.1756116778637;
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2cGVPeIFuXbrWm4z0GxzF/KpOCtFW5IwJGn5xkGyqjVJJolW8huuGhTudz9wm/LFSsEywjw==
X-Received: by 2002:a05:622a:4188:b0:4b2:d25d:2f15 with SMTP id d75a77b69052e-4b2d25d317amr35725231cf.20.1756116778089;
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, Stable@vger.kernel.org
Subject: [PATCH 1/3] ASoC: qcom: audioreach: fix potential null pointer dereference
Date: Mon, 25 Aug 2025 11:12:45 +0100
Message-ID: <20250825101247.152619-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX9cM1fkv8yis1
 U0ENcwDiyEepMWxSqB/D1sxQ4D0KRGCFRZ+IPi8TCf+lC5djoWGUHHS1+KDAxD+R09vftWLTd88
 xtRunM1rgfdfuWhQSBYpBEJlQhJFksOEFK3aDmZpNkaJZD0bhECEAtxHkQIwqlFghKbumA8PGKz
 zbp4y2FoyWup9NfgMSrWiD8IqVClP1Z4A4eu6Z7HjcEI8hlnu1wGtawhXOPm1al+FvzsadUQ85O
 O03s2UM/KjugvhT4SJLDPOyuQGZJaXolLW6Aqd55bX/VjMaGsaP9ejtQNCPWdr7LdjebBhvc7yT
 6XWJ1D1ixzeWMMPkB1eWfxSclRvye190a4JGRNxP+00hFEl3lALDVlTCa3w9Pt6en2kFEEzxl8s
 deiCDHgG
X-Proofpoint-ORIG-GUID: zvLI5L1JuKI1_agRU76OvuvZ2hBVqvmX
X-Proofpoint-GUID: zvLI5L1JuKI1_agRU76OvuvZ2hBVqvmX
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac372c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6m3MDpN89X3R0uDixRgA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

It is possible that the topology parsing function
audioreach_widget_load_module_common() could return NULL or an error
pointer. Add missing NULL check so that we do not dereference it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: <Stable@vger.kernel.org>
Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index ec51fabd98cb..c2226ed5164f 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -607,8 +607,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 		return PTR_ERR(cont);
 
 	mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
-	if (IS_ERR(mod))
-		return PTR_ERR(mod);
+	if (IS_ERR_OR_NULL(mod))
+		return mod ? PTR_ERR(mod) : -ENODEV;
 
 	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
 
-- 
2.50.0

