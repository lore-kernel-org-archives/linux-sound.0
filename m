Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C8266EE9
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108318; cv=none; b=Fy44bkfwK2itT9IxlLx9xxtF5i7XMT0sJAVxk/najf6PwJYaWuOk3D8yX8xYcy3z0bgnd+tZGdVkiuijcJ9S7VT2PYhmRCWBtwUZEVXrRpGyRsmGibm82P9w19N3f/vfNbHEoE9SxOb7wVGCvomWPogx/2NyGcWbfRzDfF6eL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108318; c=relaxed/simple;
	bh=P6V+rSsIeUgHst/mR/aTyqKVXN7nAonIlaO9qhlGbAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jevgLY74JDc0p0tIomUMc5/R0GgTnZKFdKfSb50ned4XoupAASr1FXcSo11UyFjZLbt4zeJmwo/IPFiBD9RuvACIPc7HGJag74eQFNzD3ak0XyT4L6JEv8zRcS6XOwWLCVhhcvgAKXDH0uF5GSxXy724NpZFUo00Ug5D+3eGAds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4XMHAOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvR2sIfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4XMHAOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvR2sIfc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiLIx678021
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 19:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nHoVcIBC9Om
	7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=; b=P4XMHAOoopK+3YamHsJ9mNVAnVc
	ZII9wz0TAH7PLCyGcOHvNPpe8XqRldk+i0My8em5m7NaR8fYEJMOA3TfSO8ebA86
	s1C8rZsx8cpBhmJSifxukuS1eKlnfw+M1GLANC0R6+tDz5sYbHWGfxB1LVE1f45L
	xMO37pCP2ni/j5AxFJWw8vc4pcSLunUSTHMcLNxg1I15ui2AmJ21o0TJBFA3UWLV
	lTNZ09fpqb0hbZNpYHD/mo9UDNSTDfuQ5h3AQpsxCxERdufwt/nWIhySK57UZnCt
	tUZyrGZXbXmF93l53ApgGRVQD9imB0kb5eDmjI0T7vcrptivu9KwnL9SLaw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32kgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 19:51:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso846040a12.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108316; x=1783713116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=PvR2sIfcLHFgjRSTZvELeBiV69n0ulqAJaX7aACUlt3B6ljoCXNl2wxh8ietkxzBy2
         SltzeKm8vyCiSFDc9ohxX+UpTTUQ65eutPSTHpGvqtwQErtkDchMe+RaywgwFxY9pKuW
         PI5htiAch7HRQL7dxjxvvCHs02mmw6XulorJmIEjyPn/YAtpSOLpQEqhK5y28yMzH/vz
         3D9L3n702ekREQmNLRGfWVMY8uzeYei4TdUiJd7Jj3B6HUF+Z/2vJYYc+wBsGrnsK/7W
         rLJQqXSj+F0/FToaMHl2vF6N5mwYRKNIMgg0wiFVWY8JWS2wHgceXFBZikGvHAYioccr
         3jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108316; x=1783713116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=MYA0K9kKBGHYCSF4MFNQ+31T2PEIFAe2xHZEHdui1RImjCXhL0eB0cYeFh3s5QZl6N
         y44mC+Qz2kKRktPOUP6arQ9ZzuyauYy3XErG2jNdkOfyqNbZ5+o/OqcBzFVNe0QKrjTM
         prh4K7H7FJRhDFiksYRSaEkPOKAZzn58iu0NA4mAppyQET8klCynsGxSUtPUJuXRVV2T
         X37zDv5gQFi2/Dj0LDjlHDS2NyPxSNfNE4H8dYkzmVpnsgp8xBD8st9QW35TY5P/5DT9
         J4CHtWbuSvrIKM9HDYl1bB7X0KSR24N/CwqHUlWKvgOUkQjK4wCHXCTBHXGf5is/XLvH
         XFeg==
X-Forwarded-Encrypted: i=1; AFNElJ8w8ZoZorL7g97ouGh4wnl7Dtuhpl4con80xMI3h73Oun/phPWDhyTwivNSsUA5HQ3hWDz8LgOcJUhK/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn7fdGEjS2JNVyCaTzzX0vNpCzRqvcF62uFzga+3uciMto1YMj
	imQn/16DlwQAWhcgXz0B5GhHXCFsazChDwqlMiBt0p3gbAWr6f7Y76vMX5JYWNqWcCVVPvtSm1r
	OHR4d4bETj2G9/FiU3NsO5SJ01aQcN3l6+jd88xkLXRuK6MsXZmcFcjj/s65Xsv4GLQ==
X-Gm-Gg: AfdE7cmWqcLudgvOmaE+ZkgptUs1+vXZU9ec9Cj4eP4qdcgrVHDJ90PciZMyl9DLHpx
	cm6500wrPxImpk4TwO3miL928ifoz/ZhTxLmW45iDWEzodVivOsEuDc9xGM7ImFft2lXR0t00Zw
	cg9JT3RuOmP+opZHT8u2iNA3oo5vD5kG1ihLuoSy9EVf7hXnQYir/1KZ7jt5wo8msfdn+mSxzBS
	4qjeolTrBZUHIdrbjZe4X1KhAHQpPshr9+08pPr+f1x4e4ttw5lVSj/emRt4Ym1XwZmQ+YVB0g0
	y/bE7gn638kCiEdYPR76gW18mRUUo7nieQGDZ0UcAAXePH0iPf/Iie3AJJ08YIE2rR4fb9GwKca
	cB3m3YRu5oBz73Q2rLZ5tbMfW+PJ3UvDFOBJFHg==
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr767083637.54.1783108315196;
        Fri, 03 Jul 2026 12:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr766979637.54.1783108314658;
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 31/42] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:44 +0530
Message-ID: <20260703193855.110619-32-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: RBkGFqAavjuAsnzZm4AHBWk29b2vMIDo
X-Proofpoint-ORIG-GUID: RBkGFqAavjuAsnzZm4AHBWk29b2vMIDo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1bgQhRcGk8kZ
 yfj2Js2eWs+nhQ1rkx2D3bc+XyQT0aRoqWp6RukDDLbb6f5H2JOtO+hxkSPFxxL7YG3L/dKrHhh
 lHr+BZrG1zeO5blqVDFl0CC56sOJ7Qc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX0zOXlOZIZJwE
 i1U4rxyuiCI7f7pp3zbMhAL4kbH9sqsnUaP8i1zG9PwLURJfDhZ5uZSHGmDLMk1HAARaiAjPgS+
 p8wr5UbqvHIGKzfGoFw/uksseONR30W2helnPDjmjSz8ZW6H79/xxB+3/4EUhgcDGmkeImw3R+2
 gn8q40//3t+ImThaz4aHdrpPT15JROqp8MxqVdN9WoANbC/wgtRsqvKkoMbi5dgyhs/BgW21DlY
 U5pTtnwS9gjkZVLibPyVl2zEEWf3HTib1vTN6EfObHWl+q5Mv0XAEpxjpM+tP00M9x9UKeNyPTs
 uEKHmJ1UBkBkYhxcC0hbW0/4xKtoWopmgvN14MrfYtJOoJ/RIRoGvYlwLcV7pN186GEExXw3XNQ
 s0QFaO4ODio1Gfo1MxKM3VUO8jTlf+oQZgj2rfU/XhURG0VV+ubYthC3lh1IYgcnNoTGmdIWj6+
 VXFYZ7zPqvhnO3FsjMg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4812dc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iqpFDo2SwQq5gjaSpEAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.53.0

