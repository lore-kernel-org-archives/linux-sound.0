Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3736A3A6B6C
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280493; cv=none; b=msY+/nlRthmW8fOdGcTkdwYkKbMH+EBLV+MScySLqMZ47jVgFBZ791/viht5DcwFA4nBn4BHLF5LhaViZtqOclkvkYJe5Bbwh+lOkAZBBASlVgEGZT7FzWINnZRmRVCDj2fjD9omO+17qWnV+L1/ZqxtZnlKB4KUJIk1YZxGLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280493; c=relaxed/simple;
	bh=ih+WmqIWK722niQ5u1H1E9UksjJJYkGhr2LClEew4jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivfzi5oop4Gqv9m+zJXkLix9AqI2ONAj292XtheawRYv9aBiDPmkb+Q/A+nuiR37on41uuSCAAMoY5O+T50R1Cpc27bXBDGD0YxLd1u4c0qY9r9ebT9Ilxyk3DQ2gsroMMpN+m7/vc/ZpiJv8nBgPrasjI5PEQGk1c6hGXO707A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEH8gBGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGUYJzWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEH8gBGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGUYJzWq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi5V42343696
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88d7a75507so3701886a12.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=ZGUYJzWqAxIXzMBhph0O6XZxQ2hb7H/KXvng0K9qR4w7d+q3Sv6K+L43GoWU+lC/eB
         zj6lXNOaefif9INP93rxsaXEdR0CjTrKZGapgon6K1xSO1x1etJ4wLJDdM7oKLYC6UTV
         NRA4nTW/+XQn8Szeb4LL6DdMhYo5n4f3YUhH1g0tSK55IgC0QZ2d/TW+BUga2bVWgSEA
         Qhegor/v/kr8DRMoTs6WRi6UxOrDObS923e3toV/e+RGNIb04oCCQKbCOU1ukU392DNe
         Z7aykGAkOON0r4zSU7b3Oha3Nd22etGk3JptUhC4oSp131Bfdcdkyb4mmUdDOJ2HTRDv
         Zu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=Q7gLG9sQeH+t30xZo9/Wky02WoUOp+dZiwpfYLNUAG3mJEhRPxlbmOhqkq3xAq7PGu
         b+eVDDenzYPDGzRoUv9w32Ek7usLcXZLCtqiJG73jxur7WmWRDtQhMBTvqtFswNhvEVu
         XKDdWN5ZgV0UiGnb8UDDvHMrjotrcA0MqvsUmfobxj+XE4FiUg3wGNH8QG+YMmqF33tm
         rfyJAFdtuubpsTYcybacib5w2/UFEPuhtFGSbxtZ5Y6vqaA7F/t4Z5IjJYaALNjP0b/m
         r9OHWa26q3L5j1ON7Tj4Cy0iu1SwXRSto7iW0N2i/jFTBgYT0CliE/PbnxhunTXBgMRW
         oD5A==
X-Forwarded-Encrypted: i=1; AHgh+RqheBzG7/f1mQLUUO/YGfzavU4eygB2zYvYc6rUEl72WkRtArMO1Pg2atRl3BG4w9nTpO72DRsCjVcRHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwctQ7PxqukRUUDvJHeJ/QWR27uZ1q3uJAyl9ZKIGSNcCzN4HEA
	3b9YCPFUTfwMmBe9LX7EtOTNZa3Go1rmObBVAwVqw/+aaHQrXb2AUZySFJ19W0kx42vBCqtV3H5
	+Quf/anukXLeovWbKSb8B33bP+aOXG3DZPv1mvv+4Q8ECDw5bP/l8UxRImAB8Ds0WjA==
X-Gm-Gg: AfdE7ckjapNWeq1Y7B0q7IjoBLvexOQ2EA7gFkADL1GLoYJDRKBDX4yvXlHOK79Szb/
	JT08M8Bko5KjFx7+/1ZEbSClkARtxtHTxJRJBCDSdYYDeHBhlE1bliJgQPHV4jdb5FXSRCmcEq+
	rs2GBLBFrbvNvYNK7C0dn44KgO023nqHEo15C+nJxOyxjl2paoAyppgXCzD1FBWmhOPJ1LPwFjI
	hcjdWQ1VReLDiCxHC6qKk7fMCLH31E3pWgYlmUTxaksH1WReUy/50z5ygwFAp0/7ZsWs/6DL/1g
	IJJR6WsLCZpKz+A9arTd+5/uG7oN3qq7MHC3NWDkI1hEr4SprYpFG/MaLo3B07tWj+aUsM1mTpn
	c+wqtxhfUVXjRC+0mxAS72HQBsMbHsqsNjDPW1A==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554477637.47.1783280490845;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
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
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6ozwQPZA0eqa
 lT22nK/6GX3yGNkNof5tuFbLWjk1ILOnv7tRDyrdpHNIXgMnZKJdhq5Z5ax8b1O5zgThrbOte6e
 YCFhpkIlz7loG7f08cGXLbuSh21G6PI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/2Bq+H7yA+LC
 hw+ZpY5JLJQ4yzgmTXnDJKlvU1qjvcwANduQEmXO7olYKgUnenxvE8eJaMtw9BV1c1lVsipsXbD
 TSuzcgONy9tMWY+4n9kRt72pu49Q5j9+aWt8DoPWel0eIpC16rEsVPjaX29F+z7vdv8I4gCt0/0
 Sr0c/MLmBYlPGmm226qsanlaY9bUM26yfxqvQEEOiWxZZaAfMVHQc5O9s0vUcLkjUPoj2jmc0G/
 oJobiYgB5nK/Y4Sn/BE2dLQpo7ZY/TXQZcf5yV5oy8GZZBOdY605RS7t9PmOmrWIdZYS676CuG2
 k/g7nhQl4r/w+DJpiLkv/CL1MUlZPCpKLT0hIdRPMn44nkysiIsF/uxQq7PwpXZBITlP2Ej/TH1
 GsfaC7VRnD+4qoiwPr4VFNzsNIXVqGqnZIEuJGf1BTgF3BmE/mRmFcH4VDu6cxp9KjihHeOruMA
 KMxK4g8VLnx8GxSIMpQ==
X-Proofpoint-GUID: JYBF4TSPkxAJZCTOnxuCepex-7aJiDNi
X-Proofpoint-ORIG-GUID: JYBF4TSPkxAJZCTOnxuCepex-7aJiDNi
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0

