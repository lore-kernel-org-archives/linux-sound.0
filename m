Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426838C40B
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280450; cv=none; b=Zbi3mrUx3s/SbIGEz/dG5LUL8Pn1y9MTMunJPZ+TUN06O5yzWq+OospdWKjbLpBnbMcAROWuiv82zwXSV/KQXFtS9W9pCICQ4vV0XYOtvOK2WkHpz4DljpHFZ3f2rqDeGw1fCJL7Svv0v0IJhYW1CergQEhj26URF56cHlogchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280450; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt1xoRvIuEolM8r6kAsPvZo10czg1F5+MDLjz084dUUKbnhqIoi50pH3iHyaZ/7awpU41AAXIWlpdLsOFFQ0JfBnpFlGB4rqWgDhNev8TygvMu9PYad30z8vP63LmHO10lOxxUvGWdAPY2xiYxFiPpZxjKpnWdAq30Kv2JMqm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKDe1OP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc/WGFTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKDe1OP2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhl102271493
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so3719790a12.2
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=gKDe1OP2VeZBHb29Tyhk0spYB0JmIjlaM0WTmBM1yBJQhBOf9aEAfK2exn1LVOPmEW
         t4kJI5JbWvo7DnSp0hgIRl4RWIqkD9+3U5qVshADpK4OTBL9FHpl2bQOdUEXUgeyPqdr
         8kPKsWQfcJxQQOftnOh2eJtuGQQ31071Y2jn62GkaOy1+vlsou3sABX4caEqGuvHzOKW
         ns2kVtK4ktPvEWHke6Rx7gSE/FRUcNMXW9zs8/1IZh4kAyQ7Pu6TNfQpy3Hq/ARbyQqK
         EmfE87yx1Oi4kvZWhENXHgShyz/hVyxit+9LLPZMP5iWFa9ik3Bh5lE/KP9OAvYmxxsT
         xdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=F1zMzliBGkFNLwLDA+qdIViqZisEa76pmtnPAYA73P8PD4LfJbLSKbxTC3LsdjbVTt
         hz9T3FUpm+/voS+mI9C58hu8R4Y27M9YUF5gjH1MWANAJTbiPwQKRI4J5TipYlDrg+pn
         FkqRldpMqmB5x02HpdQFsy8YgqkqNAjMzHW1f2gIEQ/mmH4ap6BHHES0aNEUeVuCTTwg
         456Tj5Hk07YzY/K9XFzYLJFk3WRPm1XwuM2Aj30gLr8d1lIAwNUjxlj37qtMh/wgJT5t
         T3KvfZfk5fYy1t1VOJTvQYD/wvdMvY4ntclEhoKv1ZCQGc/cODB0DtcnZgsXg6I7pMVr
         vE+A==
X-Forwarded-Encrypted: i=1; AHgh+RoIrLT6EVQHoYMjMHMsJw9B1bLZASlzFoGfym9It5IthrMVWJVsww7/cICnqfSIdThW3lSG+zq0qB28lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8niAW12jSy7+M/DqRyCLpNtiH7nCCNzY/XmraqbjeTIHLzRs/
	ZHYKXY+p6k5ItBfZ4lZUpNucj5NfdQgf/y9+iIYcLBvpfDo5g9zfdMt7LVxolK9oWKr2fzvMz7Z
	KLGe8osxYqCruUvAjmOk6QuU4wMiTMaU7OCbn3Vq8NW8Ej9+DKCxBRhC3IsFLUMPRVA==
X-Gm-Gg: AfdE7ckZwfCYV+ghk7xpXwdxYwdnY2bd1ezSbID9A3mBrfgMlnpNDq/rx5x/sgfKwwK
	9g1WcQMiu4ynDfeiIEqzF1u0VDfrTyqtaOSYvG0R/uYQcLHygM79Mp+Muuv+62WtXaERzedyOl3
	U4KReRpRx/Ow/fgoKKdh2vP39sP0ZhFW/tgJJegB3hHh6FdSl8m6FS4Bmagliug94SM6ZVLpj7E
	P+OjpT66xKNyjGL5vfIDhWDe4aAjKQgf1JbTog4izeqAh5q4cB+fO37PQPjsUBTtPEJV/9SfC4M
	x5h+SCgfZ9GPGXZ1ONmJzHCkh+37OgFdwE2tdrgJvR4ladsPrVSR/LzCwq3jL2/TyvBKmSzgwjz
	OAxW5GXX/iqTHYa8kiYtxjH//t+CSpu8FnV1LkA==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049930637.60.1783280445924;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzQqV9UC5BWzb
 detX2DkVbwIDmW/86aW7ezRfhwQAuzQPgYyw4nbP8wj6+FOrk5i/OByXCmvPIyp/R6F2fuRr62b
 3pwQXbjqKJcNvH1rYpOzpkDGoYRbpuQ=
X-Proofpoint-ORIG-GUID: JOIskNvRdt0Hrlh8B7KHJvyN7QIMdoMg
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0GqocQfnAWr7
 BRDibyuAo2BF3Bnl7v0hWz3ahrwLXsoveufbi8XRaP6GhCT1bcROknfVEStcO34+JrdFLkDY+JK
 lxQLho2gCGF+ZGR/0RJ11N00ovl6iPnDTOmEG61oinvLSbVSOUPwWZFQS0FHKi/MzbL5r55ev7z
 eRa5ygt6cTYVwKWaTSbBHDVluHu+8YF2DM5ULjstCBHHiAgXtcTj0Z7xf5j3IE3JzCHXiLx5vYM
 LdbCswrnBM/t5S9ByndX5BMmcsAETvL/o44736xGNhH813/WaZ+JOLeVEvj7fv5a5LIICza6JQi
 WEMpyNpsFpcncroVPeB9DL8AQ9/4XUle3PeFGazMAd3xJ1ejgDGd409Xg4MKmNmXJrYtVXIay49
 PDg9I9tiWL6EZCGvxrt+VNtESIrtaM53HRSBgKChHBjhcQVOu5+PB+CN7KK5ivgPuU31L6U6+O1
 SXZqpMXsxOQ696CDKgQ==
X-Proofpoint-GUID: JOIskNvRdt0Hrlh8B7KHJvyN7QIMdoMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

