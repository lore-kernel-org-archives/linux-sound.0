Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF6370D6B
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629654; cv=none; b=p+5L/o+AMBYZyw6ZiyfNMSkW+YgeWunK/1BYiYGbm0pB0+44LWW8OF/P1fOIAIJ4svivDy8frm6wU1gTfSQdVIDftsh6ItHwGBDYhVymEZ33q0McKa7dGTZqRoUxGvIlt2/80rsvJGzd1VlmEN8wDsqhjtT8VLlPGfHKHwbEBOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629654; c=relaxed/simple;
	bh=iafQmWDeFIqwxoTztlKqMCFwj+DaAdYsFKAlvo4MX7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCI2OQgogZisYQc6pB9Xh2G7frtJZ133TbaH8VFnSJIrYOU7uNsHU45v5psykBOHDrvMqTRrhav8v9yuFd1onWNKdPj4euatZe8FOoQrUgfUtFLdVE7Yseu06mmc1EBPYUFxO5kY609rfqea1aQ9RKiKgPnuLfnBTZiEfFi2L7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOlRJTNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FafwtGyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOlRJTNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FafwtGyV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CEFxw1073670
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lh8JDFjF3Cp
	/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=; b=XOlRJTNoBfXKSla9ZelgkxoX0U4
	u+6LcnOCzSs5aA8pblScN0139MWEeEPVdC+d/qI+i1cSDV2U+eNgxkrNWQN+HFTm
	dK3Fp0+7IZTbnu7FXiCCvO1LgskMHxprmq8/64urTd4BBigHGjhQjhuLYM6Fmxbk
	mUGqW062nmoMcjPqGCNspLJUmpusNtOdoZN1XnvmarLKutGR08kZ1T7/RmwJjH2x
	IB1unL7slbIY5pzlhzYjmJUYJtIXDf4L7vxhiYUQJov5b57hbRcQ0DX8AymHO+/Y
	fBms++3VBaaO+Tu7rCBCwgLhlakuoq8LGsIyNVn2iGCeN5x+pV3pyTBzPjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfhr9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so1009857185a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629651; x=1773234451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=FafwtGyVF/666/G+0lNMwDaOmskgQqPYvNJUR6qjZy1uo9UBDXWZtqJ8iWWGUZu+IR
         T6PHOGHcFhVyT0tmuRbgdYe7DAuxbGuMZOOQC4wYQ5wR5+cmJyNZ3QAJ3S93P/I1WLGT
         nyoeUwb+CiT/+37F+QSIxXb4pdnKQdIn2UUdl0s0ldRRYR0bqR1Kn2Dd1FKPy2VUebid
         a0yJKpdvTfz3B7IqSC03o7LjkOzQOWhtz7vR5MYWIWqJ4yqlRom7h9GMd7YLf0oZ6mFj
         p4TSlfjdueUiZ6UlW0LNtsQ6gtWr4LjGstNBrvr1ZGsUm8SHV0s/t+gFs53mEJ1POoi/
         l3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629651; x=1773234451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh8JDFjF3Cp/56/LC7QnjRtBGIXDKJonxwqRjjyCPMo=;
        b=ZrZaVGyCBySHgPkpPCxAo2CH1vMCLrbzJVQFALxDJGyEfxNJHqvgKkZrqmyieSqtSz
         mP5E6d2g+qiPI0le6XLVgg1FHNsPghsPQ2T2FzsbJLhj5oLOlruyVQHxjMbm/S1XvwP7
         efZxVy8boc8eIF7DbHxflJ7FB4N2IEq6ekJpfv4TckTHWQGQjMc2+mb/J7TV60Ku6oq0
         imTLITKlWc7jd5K5IFfX5J3NZ+F++W0OC0ifHPZHGWbK31Kh6aT9U2USrVBbdBAVa1T1
         QTsw4WVhhupB3qEks+GIwzt46b9iap+qlynK/0pDrYzwPc1vcjkimZkQF5K8DCmAR2MM
         TG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFux4RxnEc8HHFPbe3gV8zGiD+4gEmcvN3wExCTp46nkJWTdRqyuS+MwT1PfYwV/IqhC/6bJ6QvmP0Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWA+2tAKvrA0FwaTnUOn6CkkmiLmdwScwkAS9KiZIr+/u1tJoP
	TwAqboKxgrbdytI5/ijLY1NDRLNoNqgjv4c2Uv1pmC6y2hi70QJebgtFLDcfxhfxHUE204vxmGa
	jDogK9EvOeLB28PqI0zL2v0VjApNUc88XjXsxgwTRRAitinWgWECYU2g0GT7CmYmY+w==
X-Gm-Gg: ATEYQzziqeZFIiwZ2DZnjfNZhC9sUlx5NoqKUGbUXhxovMsn4t80Z8Kzoshro0ShT1+
	z2p3zbu7YQp7SZ7/ZUhnrwopl4aEZRRomhVZnfxeFhxDmTZBiWiBx2K4zKj//r+j4yMl3/0bic4
	PThuZutGSSVBQXc4qEyCTmknNIRFGcJnhNvXX69p7KjO8b/rwZyk17TNRFaTKP8oPr9zfKVXEzT
	hqS3g1LmLadEvs2yUjGDYKi/AUe+h766Q3iq6+l6NrkfFE5Wzb5ex6r95N2btxoxscuXx6w0LM4
	MmCOMUsb3HqC4g3Q8RpCxM61JnBeBQgTR7g7C9YSrvry4pfC+xohGugawvjdxFbFYwgWpJRotsu
	Jw4hC68lp6NcguCu/WV1xquMwnrU0dX3Z8gBxgvx66mllxYHZqPEY7zo=
X-Received: by 2002:a05:620a:4155:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cd5af80326mr235749285a.41.1772629650948;
        Wed, 04 Mar 2026 05:07:30 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cd5af80326mr235743185a.41.1772629650444;
        Wed, 04 Mar 2026 05:07:30 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Wed,  4 Mar 2026 13:07:09 +0000
Message-ID: <20260304130712.222246-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AeeN2DxlH6tLgq_dXaEaK1V6JkSXleZQ
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a82e93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX4QxleV8SkAA7
 5ZYTo8TJGo1+kU6nytiu8Cs4zqip+c59xbHTuvf5RqQwQNL8q/ns1Who+LFEHHiqFYzGc25KVpW
 hVH/qqSmyQxRJQ+qJj7V7anQodhp0kp6rl2adtfiDLbq2ObZSy2APZZUgO95/wfil2yL6Y5519p
 UqulBiaNaircRRxH7TTCeg0JFs3OAXijYoJUpAfrB8qCeu30fvuCE8DjoeggN5qHm//kp8fDIkE
 m/aD3I3BdXPnKF+Tq9d/YSqu8Wk0PnJxnIvSB71w6iu7AyHY8qWkANuIjP+bDvUQVJGmizHMzBa
 QQJgpMlZbw9zp/4yKjQFsteZLdZpph3ROCS2Fm8dvRQmWGJtb5gIpTTJQoJ1VoAlBQYGNoI1bdH
 BJGea6NPMwauJWm5WTDZu1FVdq7VaYuIWI9ZBT1itQenC+Obit1sSmjAM8fiu6aiaV1DPjQ3QrI
 306YjP7G9mD5S8iN79w==
X-Proofpoint-GUID: AeeN2DxlH6tLgq_dXaEaK1V6JkSXleZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f68d4b4974f3..472b2114c81e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

