Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9E30BB89
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215164; cv=none; b=mXwwikEpgFTz/P9ao+t/LCeclesZsAlTYyBKItLfBlRbUchshse4UP9g1AV60vS03KYfqcDPSLfNBSkM7i03LUapa0wyFtkiqKMGegauIJACcfGRUSZ3tbzyxK8APpYwJKO5Dk9uCh/YVFvHYnbSdOW8lCqTH3IH5/mDfGmHPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215164; c=relaxed/simple;
	bh=n/QDHw1ITWRby7vrBcC4hapXZgt2KFZCOKf4tNRyaaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBgXe5v+XlTje+FMpBTnjZo9I/mwsFe8zC5sqrEEkJOP7MvDAgBxpFh/XlPJlXcC1Bz+/uiuP/ugjx3/QxvituExlLnK1LB2Ad8VpesRqr0koXxS6QSYkjtHk0TqRgCFUZhR4InujsKFxUPXGFoHxMB9w6rQQlnMVQ5iTNQ2PrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofp7nl/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofp7nl/H"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N76TcO017033
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jdyJtjan7SM
	H7wF51lvA8fxlxpPM+Q5el4ttALOfDg8=; b=ofp7nl/HBaXVLLvPU82S4U87eL6
	Gy9EvPxlr17buAKxBAYQcnWxylx1Kg++K7y8RtBRTKCk3MLstr16HdN1ARN6pVcd
	6RVXfXm0xPTCQGj/nALSmHn8Vhp9cjATvCuE6O0M0LXy+3TANJXVZWyvk18fC5yu
	DhnYPYKaIAXV4/YnAwL8b6PB0V4AKOQ8yxiNIrZbx1H4i4d1x4bL6mJYAmwgQa1A
	AfRV9HT8L7HoB1n3vE8Xr9iyfd+zhOYMtpboYGP+zNQ5WbHanUx0Qz8MYHuqnRCS
	+PnTudC3dlP+T7wAtvywk02KPHYcSn0Nvbasoqgqc+MFqSidEGwvkV9z9jA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdmuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a9ec4746so35628421cf.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215160; x=1761819960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdyJtjan7SMH7wF51lvA8fxlxpPM+Q5el4ttALOfDg8=;
        b=nv3G/vikBcA5g4zHMdgE7Minz9FeZAga/lk0sxW/6cTUXK86JLw6bSdRkrVJj+6XWq
         ZrzHqvY/UufZFqYHRSGvgoDQ6OgT2j80ISE0xydzAvsrS4PQ/ygwrbybET5KBVV12T+Y
         F6YRci7YRKfR4HvafwpiFoFkFvYO4SrFV6r39Ut1NGfia/r9PoOkpFQQQO7R0gfkBm5Z
         Dg+WFtnmqiGH2r9jYzsbUaHB+tsjM1n4LvPq4sjJpjL6BSQgd2K+Su4uUDvHsKIlpUlh
         BoI2SSbwt3NITZIwKVNdHXMBiWHOH/6soSsWbnU2zJAgYlNsljZCwuKgB79THqfZcuiD
         ii+w==
X-Forwarded-Encrypted: i=1; AJvYcCWFAQW82ed/9iN1EN1l6SS3hb5YDc/3ntJxyATf9PRPxM9VzW/eV1DI1twrbof1/WuOIdikCJy+xkF5YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyrcT+gxD7KvTNh4n/HiBhy0MrO8R0OLrJdBjrNBixxeGvq6Ki
	05cLnjITyqAfq4dhNnU4Sn7K4NtVN2e2sHYXVkyU2BUVJvJ3pcALlAwWDmFMYZVTJgSUJDPLA0H
	0lQyyevfb0s7O00PK6WGXn3yMgiKRvrs4qh8S8LlAQUfaSbSypw2APg7Pz6UAIJYzLw==
X-Gm-Gg: ASbGnctL/LRe9kLz83OqZGhUfIpZlnEqyQ1dIXuLayuqpmBhTAvpbpN2M8zKQPa2ySn
	aIgj4dXcHJxyQP0LK/zqU4GHravGr4p53ot9dPoqOPEiYfLq/HUEVBi54W2JSt913AkxYMBNeAB
	1lw000u2DLP9A3ODIhyuY98ZjF2Y3suzPm8YTUjcXGvMYeFTyrARdjCNt63J42IG3y+XSenIHk9
	qDnVHyl2I/v9SV0Up+tZKNKKD2kY6b5COELLLYnvoh1BmYqWXuM60PXWS+XbB4NTG/T6i0PGn8u
	Tj9B05AU9EooMuPA59bpmKsIu876EmASOi+/MiozrGkq0rXIbZteXLe8uSo5phH+g6dtAUeDRL2
	CmvhTa6qSWySP
X-Received: by 2002:a05:622a:1827:b0:4e8:b8f7:299d with SMTP id d75a77b69052e-4e8b8f72eaamr207458321cf.68.1761215160551;
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD7wLSA44400aNfpBlMqCLaACZqamHhHypYbkYfQM4rxcD3dsHflxyufF1YmFN6YdHQzG4bA==
X-Received: by 2002:a05:622a:1827:b0:4e8:b8f7:299d with SMTP id d75a77b69052e-4e8b8f72eaamr207458091cf.68.1761215160076;
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 04/20] ASoC: qcom: q6asm-dai: perform correct state check before closing
Date: Thu, 23 Oct 2025 11:24:28 +0100
Message-ID: <20251023102444.88158-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX217yyB/I9JjY
 //9SG7sGeohkYKnemXClvAYK8W3nOtXNv794Vbg/nryL2olOZOS0+T08TMWEe3/wpjl4VjduE0K
 LpOmJBztVy6lPMn8KAZlF3eKsmJ6nxZYB/RdV7DL5vwp7l3SPLCgKnSp/qefULQE9CZnt6hUlxw
 xweu3Ewj6WfuH/mO0rkSpN5RXT74OEu6kiVQ59PGWaEKleGLgMJjMT2ZKe5ao23XW60NVIqqOZ5
 edjSxZX/VCg1X/YR8iqiWGNOexBjiArejZiLJt4G+V1CgwQ2aW135L/xEu/WwZN5tQhxy6aF5Wf
 N1ZpPDF1vKzCQCsBalEqf7fPGquHODKT89LHpTwFvO5dcaKDa5jCbmmeoCCl8kzKsc8eA9SGHMd
 cjaGjoay/QDr4Qr/ff155x2KsCsBng==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa02b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=MOmvoJmQv4oe-d1MVI8A:9 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hnyCUkDtR35NOvVu2Cbf7x-ENy4liydm
X-Proofpoint-ORIG-GUID: hnyCUkDtR35NOvVu2Cbf7x-ENy4liydm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Do not stop a q6asm stream if its not started, this can result in
unnecessary dsp command which will timeout anyway something like below:

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: CMD 10bcd timeout

Fix this by correctly checking the state.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index e8129510a734..0eae8c6e42b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -233,13 +233,14 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
-	if (prtd->state) {
+	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
 		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
 		q6routing_stream_close(soc_prtd->dai_link->id,
 					 substream->stream);
+		prtd->state = Q6ASM_STREAM_STOPPED;
 	}
 
 	ret = q6asm_map_memory_regions(substream->stream, prtd->audio_client,
-- 
2.51.0

