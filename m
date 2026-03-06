Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780E39021F
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799732; cv=none; b=cavgp33rhD/N8j+MCBujMSvp0iugIUOIq1eZPwTfxIrdPqz44h8XHKdWEkYc6PRM6t05YWCf1hYdQmVnqYgoADn86D/YpXI91HnGbmdN9cE+4jihJJ+Yx5j1xPR0ShgrzZd/Og7xK2jDSMTB1P5sO5Kelds34+MMh/BaNqyKivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799732; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fy0cjR4DRkHaX8Cckr2KZ+cuGjlF8BrS3qhzKjQ6goN85sNMv8vD9L67rOx7JIT7I8aPVO8OFRQmND5KoXCvlapvP2dVk0Si0DoleURcZJw4YHTYSNhxt7kqDqX1vsgBGm0F9qz9fAf5qnQLPSivjI135/+JTJNN0/sjs0JUBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P76SvNFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb27lQig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P76SvNFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb27lQig"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbJeC4151054
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=P76SvNFsuij9ZEa/4BmQF7denLn
	q/n5YvrZcQ1DypSC4YOtgDhpsUHc8TahtJwm7ZU+p1RJ5Xv6mWgj84yZLydire8w
	EU06roC5QanSFtAuyb4L2vylyBZeyqWquhqFoc0XxyQC5fhRv/OYWbq6xzvMPzU7
	JDs60aY9DbUBeXKL1fdN12E+LAC3J3gVlXmcftvVQ2oLdQgpASV/YwHovTDKVg/w
	FlrLvM3chwmL14COPULPre9rOjzu9JyY0ogDBdDRXKCvgJUftYtK4ebtSbR1Y87T
	3R7LsnnV/uDNj1uTh+ZOcNQi9pEy4b7+b1mmyQm+MD3xn9Q8yjbZdsnGs5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25u4ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so4656482685a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799725; x=1773404525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=Pb27lQigYpwr0mDY5+7fEaXdEjundDGN1KOL6Fl4GAqfVytZcSztXEdX3uxKhi0a2w
         1bi3ffXweX60nM/wGEX0kV3fh0uaOXOsTWHbHgvvKXQBMx6Pl9p/kNMQjwgpXvXpm4eS
         r7NkjbxzOLiW/qDl4jTqRnv944PJVBc/AsP2H/9LMIJbg7HsTfMV799FKVwd/HH/VKdz
         A+fhnXTBmjeuo/RGGseV7VRsLF/FexEGzX5H6wrY8yJc/J9tj3OMWtpvS9rMYY6o/kuo
         wrM9xAvbbhK+iRw6WM4R9uvBUpopX70wfS9hlqvTR88IMyVdufw2YPtHgapNTwpKG+vH
         /4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799725; x=1773404525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=hryQPBR+S+VCPogx+bZsXwlMMjfI3qIeNH351U9JSOmoaDgShBq65zSisNZUo3l8Sk
         8WYfkF3LXumCLbCjywdalpdUPIanZv8jRq/XtM9hl/u4LSYgPpLH/N2tXTmAhksZSXYx
         QGIkJyNBewHq3SGHZ5N2rAS3oaquadsN0ch6/AstYdMdGL2TIXIG4EllMdRyAwsUpzEO
         mH9RHx8Rw9gKpLyykgTvh5HOUcVebu7IQBdeugdCWLqzCNz2HiyiNEyJckP4vAEMonqG
         w+wUJNI1k3tEz+ouMvoZrhjl1UqHndX3mAnxKdTA0uHs6o1SP005xUUyI5TL4tUaFWQ4
         SfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqGwStej02CWNUV/bGe5P1UwZluyCQCwA7BKsjEKB+ZVqKp3XTH+asbau3WzsI22nVFyLObyZmUl0+IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7cL1QgfHtigbfXgd9yFljwwhT0/+I9eagiVmN/PjFr3ifQI9
	qacSfoUGiv7o1cSn/u5mv6OlBBX+AXOuWrTOwhbQ7+1ogAL1WIygDQ+B+FtrxZBnZyMXPDlTHHA
	bU1/yBBQ0BhnKKLjHf55EnDAnD3amxXk0wl3SNbq9tIfvCJPiq3nws57tBxnwC8uOiA==
X-Gm-Gg: ATEYQzx+BO3m26VPCkWsZ8wigGUlC+76J7VqYtxImageb8ARP8vmCxqU0zWNvgk1e9C
	cRJdIZdu8gQOlfSE87PK2VCpZ94HruMHJ40+CB5Hk10RUKU7NzZrC+6M3y8BquxNOgloZel7V7t
	aL12fCJX7q4w3YjS54O6NQUWTwppjbRVy81Ad82aQF4wFgGcqgC3O3cw+JNWYmAO17V9UyNQRjc
	Rjrya82gV2s+73qEbFte2d5KrI933vB1H4GnVmYoEUlbKRI+hApzgxVpfOd0pRzsMg2XfEE0O6x
	rNbRyEm2y8enbZ0o3IL/w0wXF1UouRytvUR2/Yjk3KL1uyEdmFOCLcQZAbm7SJTDj5LX/FOw1p0
	lWei4+rILayoZ9Ae+7zymNcmYQH4IzB+nh+r4U5RHZr0cn6hqmbiuhEU=
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr205931585a.52.1772799725014;
        Fri, 06 Mar 2026 04:22:05 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr205927985a.52.1772799724551;
        Fri, 06 Mar 2026 04:22:04 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:03 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Fri,  6 Mar 2026 12:21:06 +0000
Message-ID: <20260306122115.509705-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DvFbFWeZ4bwD0jIq-ufUWWdAZ5JftN8j
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aac6ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXwn1e9V40jXrG
 qPkpv+v9R/aUzroNylC3CzIZEeb8Y1FEvS54MvvVMQxMCMjm3mzfZfO8yeQSwCXHqZW3cDqevWo
 TfsVzSJYZq+zpdnWR5HxJXrqVno1OEg8hgGHvGICA+lyNav6MJIi7dmUs465EwBhFxcR6QK/E7H
 Lv8FdR7BjjNtepvA3Wyqy1ICNpJgKEm4uK8FhzedHbTj0T6ML6Nd7g/nmZHeU+igNXGw/Xpv2HD
 bvXWxZfL29DpeqIMcwNAx6fH4DjnMC4ndnLgCYgUVohfrI96MhtYJhuTE/ZH3++1YK/z64Pox0R
 yHhgGLnvn/J8jZWGOACGZTsiYW+Ih7QaFma0oHbq9yZ30iZaDByi2mY3yocJpU4mdl+lf4AN+1S
 tQHng6tmyKbLqXJHjGtbr7mr7gRBVyxzJox7h9Nz6Bjm55jMxrLLJthaEM0ZVLZEmfH7CvinKe0
 L6WEq7LprpoAMFSPMkg==
X-Proofpoint-GUID: DvFbFWeZ4bwD0jIq-ufUWWdAZ5JftN8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f1332b..f68d4b4974f3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

