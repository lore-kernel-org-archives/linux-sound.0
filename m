Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1C331EBC
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107762; cv=none; b=gb/qYqi38zPcP/vpi9yXJZSQ2KOomQg+oV4KAXeQ+TNTVHgPh/0j8tN7DFkM8419aZ0aDC7vMIMyZN/PDbHyasKJOyHWPDBhw7mX7UZ+SkKomAma3oGRIzoW3sevQUez4HwXdIqm6hzyiKCRZ/yYNIn0cTRSSUtdARaMnZsd5B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107762; c=relaxed/simple;
	bh=HRbjhWrQ/b1BPdLECUGZ1vj1pvlPVpDo/p/rUJhwlC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD+sNeLLMVCsO4j6BDQgxFjGrVZJ4ZEnyFigyYIkXgUxzJHQq6zOEWeM5CAF9KxdJ0pGPbH43pqvYJM85GSsqvNQiTSd17sSGRj6u1mlx3yo8+nV6mMqUUjFQehDT3ipjUt3bUsScPAn0V0K3/MJhccNoaSZzTom67ZrkH4z3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKWf2GSY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTZ2JJuF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKWf2GSY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTZ2JJuF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hidoc685292
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 19:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BM7jtgPz5pu
	XtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=; b=jKWf2GSYBWt0WCeSTarF/ZyxiwK
	ySviO6bqYuR7hXocJXWdOzctBTkhr9x7EBJtne4ZOFmY2TQnOa/Gh839O06jG1Z7
	dooiFHxttTiabG9BCsQjg42O4/YG3Njl/KqjnIDTpKtWlrEa7Oz6uExs+CjZECUi
	xjJD6IMEajr2OkDLA3WKBxxOfzl0dQqBxjqVSPjOoU9RaH/p2EFT7u56Y4OH0mzN
	ZRdyYM3r4dJMbR3VmiLwRyPjjK7ZwaTZ5+BWp14AX1vqD6b0N/1+keNALbhSW6GJ
	73bXzhYTiDhE7iSf9SrCIj4lzRwnt5YUmTfWTl/y5PQ/BXjK1zfMPAEFh9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckes5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 19:42:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1428850a91.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107759; x=1783712559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=FTZ2JJuFX5O8xKaW8uvZoVjc7M+EqxImi+VabpN8xkg4iVTZqZDcjdBK/aqGlkgBVt
         9lWi1C+59I9cCOwEZD57z3eML9ewA6OH/m8FhRh3CSHGUa8HuOEUOeL0LY/bjzVozu0G
         C1NylKd+9EcnsvaV9UvIVPgtBomwe8x4IhTcp7QjhOiqqiyiOO2C2M0ZOPF751oBFJIp
         qYd8oMstV8x/wTvfcmJ7Et7XAQl56t9N27HeNeF0cpOYgRVMKh8wb3dvYv2gvrMBRzpx
         w7KEer3j7eEdfY4wjOai2Xcrjq+QrtbswY1defaabeE3KWHFuIwgR1OAip6ERTnt/vFQ
         My8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107759; x=1783712559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=o7fqUxSlIyJ4AbroUvTGPIEujrHKV6ZlS+Ts0IQo4OUdLBekEOhMR/CPaV/iMBXzIy
         c7RLp35ZR08qAsy+c9KSwPklxbJASXtQECNHvR3y/aK4bBTQukM0fwuc97khoRsAJFyb
         XftjSWylo8dR1BKu+3VbSxdkzC5Gn+KRgwCjOpzGjQdlgm3jKW1VvApsMjjLSI1eMCQm
         AKBwi/H8+P2WPcUPLptjyq/sw6WJ74MC9jm82T+tQmsI89AoYV5/8/sWT6Mo7oF5ajqI
         m2eWj3RwSLNBd153LVdszNqLEdh4w2Hj+3nOSgT4OhCbVrS5v5lcpe8gCHzD7veLzUVO
         V2ow==
X-Forwarded-Encrypted: i=1; AHgh+Rq0oxsiifonl2aiDRJaPk7pD8ibfAKctTpmk6cHJT9jn6CcjwXn+9VBe6hJxoSkSgIXzor3lDoiz8uKig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAQXELOa+5caAoxeZz2LONY+eF2F/xajmiFtx5gl6ou2bHbr3
	v5FvjbPDygfhTPz/euK+a+XUXq+kG9QtYmdBO2DJhbXdJCCLxvILEUh59hqfupBjNSH2KDEfdES
	q+PAT9rgBFCCrXL8dPaXLbeT8EC1frp/UMNNmJ+79IeIioAdA2s9Sd8DP9CZ2MgPGrw==
X-Gm-Gg: AfdE7clzXpozFT1e+jqAO8ZILQlrY/8KOeUPVAO35x3R8O6Ls4SfIzgzQ8MYBlT60Dk
	76NXX8OtHElVSGCMgrcTIY3PDj7Robu81fBRxieijKe3EdDWU42N6e/6TQg9gNTuOoXvMnt2xeI
	+CGLankgmctRSSNMXNIQEcrOKtDGsWq5PvH55YoKQivc4ITe1fo/YPKO5QFIHOwxvPTju7AT/nP
	M12WP5DnmBbxGVctmQd1iXcmPGbe/OEeOejeFeC7C4tSU2f6RGmetpuO4+Bc0On/LxL5mdRsOO0
	gBpoWNao5uxGDEbZbYiuHzWPmStvva8gFISYPfUZ8JWHJsXC94Z09iEbeKgoLKE2Jt2b+f3ngIG
	oK+1pC2LzCPoQ4yz22LFb5/BC6nRi7fQM7c6Hfg==
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703174a91.7.1783107758450;
        Fri, 03 Jul 2026 12:42:38 -0700 (PDT)
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703088a91.7.1783107757826;
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
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
Subject: [PATCH 08/42] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:21 +0530
Message-ID: <20260703193855.110619-9-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9hv-KP2IwXWpe1eXM6xRkxBy2whM4lcv
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4810af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9hv-KP2IwXWpe1eXM6xRkxBy2whM4lcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX3dPCEdjZSToS
 KNzOChxMLw0NLI3+6C27d312by9UStU9vzVBoOZfuKG2NKMTpNUyg6DdSj9MEPR+rhAvXW0B2Hm
 kScnpbsNiM2PD9bdTYFqp6HeusG6CLL7NroBDLfMfhJ3Anz4eHpwQB6RqNDGp0ZO2EIUPIyP8u7
 pMKzpUIasRcj4tZC2smUwJ66hINygIrhh0/LKNuvTjVqMGjKLZSPetv0vUEAefM+WPX8Rt2DMuB
 yyXk05JFlzDELpZNeVWFOfYhtFbjll+QghqdqqKXTQLTDik4QKK7oC2esYRI1AYLG7ljfMnXsJq
 T5FbW9OaP4HPKEUjxuRQbgkFXJcj/4xd9q4bxrOMJWy8c15/g9J1GYMfMhFeQKVvnY1SM6p39hP
 9Go2Io+eRjBbHxhypzPBZiRqhgPzy0bsfklgoJPgYY/3Fyu1jpALMKmXkJ8Xqd7jvAjpy66suBv
 bCvyubBtrG3ExV6iCWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX2nGVGCHIrd15
 FE4RJVMY/n2FKfU0vZgGLiUcqamq0WDUHHvPxAwQNeRugV/oKVumZzuuRe088tqMroSEC1F7/De
 ovzGlVlJkkUcFTb0J/Xlo9OtMjciRh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.53.0

