Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38863385BE
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107931; cv=none; b=q6ogywR+uib8G6iEGKLqZEfpfZNenz3YjEJcTImCwUi3zWg1RS03MpFNaikEpFnSvFM2B8eiV5zVo8tDrtIPbQXpDeIRng7TBmYs/8i0MY3lCzEKDS60L8z1gV04RWLvveDupFNkHpkAR1lHdDfwNxhQ0CU8GI6806hWUXPxTrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107931; c=relaxed/simple;
	bh=wcHg6QyrrbvIhAvroaLDmY3X7Y/69J6Dr/9egWVA68Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAL15EgEMqAVXvxZityXlmym4Qof/+I2FXFSuoCVbLiLX8ewAaQvGLEVXEzx+HL9Q1jDiJ0eiE2vaLmm9bngv/5149gBXuARgXeYfd7J/SClrizI8X9rMc1VDBwrueYmdH4XSh2T7FK7kTfA1D/TMp71j1WTmN3zhFDWVocaoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+uAJn+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7EP5YFt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+uAJn+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7EP5YFt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HioZ5495393
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 19:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ4/br+RH95
	hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=; b=U+uAJn+XBGdMb+GnChTd4WXzIGt
	21mHhuEBOT3UPMVRFSnaUfgff0p/MLIjrIDZBWyr2ioHNXcJIJuNHwRCxza8nzx2
	o9BU3TUQivd3BsDI+F/Xt1HhgcFBA46i6EG9Y/VKlHlq0xDKl1Q5EPjAF08z1PnI
	N8t0srPzLC3Kd6GWPYmf/TCHQ/ySQ0/hUoM0qzlNv/jaaMZt/hRDr70A5UNnlQ7Y
	sCLDAvCv6zIhx6R3hl2Yx7uA5YiLPndDBfBUeutebe8Oyr3UvI/DqN5c2OwMqCtk
	o63F+mp7gBY0t3VC+xOOXXf2vjJKujUIMvoVs+xyURl5hGazRpjC8TarFyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytm4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 19:45:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380c178acfbso801384a91.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107928; x=1783712728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=a7EP5YFtiaKli5qOLsgn1owZgFRhZrikhfZESoTxvxI4HHx8g78VBBPv+0aO/T/C8Q
         XGm+3aOCLzRw0tDVWy48YnlppmG2E+8XDon/k2o3ksVfMd6K7knhYexMatvbPWpNm6/U
         pM67rIDV8WQ5F4wr4eBsUzp7jbMl4U73LKD3RSZeBStAfV8HCSXhr1EpdH3XdUV2VY3V
         EjKFP9w77LAHQ+iWJHArb+4DCmDw7XZnXs4CBevag4t/kDDq1ljrrGkMpdaysyYdKnjZ
         s6ODlr+COr920XSLC9MjmhGM5UZK4R5bd/WYKhA2D2CdpnyI3KqJBWAnNAk8OR7tL2nF
         ZsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107928; x=1783712728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=L1CLJEjtqCJ51+MnKB+QbiF2vEPjE3a2DSw1X4+I210u9ECgBsEmVT4MtysfTYxAdA
         Er+dIEwtzGiCfQG5Gm2rUORaIQhnBfwU3cAdwJRWISITWL6X2Lix2w+dYw4SmKuBMz0a
         vLgo/8aX4Sg0AcI22Qc/aXB2kYKRNBidRhqddyUHSV7IkJka7FdtvSgUJt1cD/kG7zCm
         QTtPj84v1PmHWCpLKc6gupSyI23uNUgTcPMDMeFiMdiTP5qd04H/JYZln77yjwOnmPYO
         4+u8e6q6OgPZWn4NSsa8UMVys8NAB1yYbLQQ0TnufjEYQufCiAe4gdHtUyJzqvraxtGf
         u8Mg==
X-Forwarded-Encrypted: i=1; AHgh+Rre7FxuTLAJE+nVaVcx+ryTk1e+zuXQO6dFj5J2P8Hj1EowsqHgvgTRMqdPj5QyakHB4byDTkWG8SeltA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgjkLuK9MWZ3t/v1msi5f4myWj9O7joj/ZuOo1EMGylLkGmhe
	iN44rjF8Zkvk4Sw90/Ea4R5APauUhea/Vg2B2fRUXtcPwM0dAGGU/uA4Vg5+mZ0GEB+NXg7luva
	m+bXLbry3SAbVf4hfSVlsFGQKfjLoO49a4VsACNtsRakO5w5Ov95D8hfQrYe9hP0hQQ==
X-Gm-Gg: AfdE7cmEdPSe2RT8EWhTDfKdjv1HJNI8a+Ebg2Svd78kzKSWeknVEVTgQkODlbeGYQs
	rVMtog4AMfThexYC1L3SCxwGwkDew0i8vzp4yz0B4sB6CJHRzjm+dcyQX7L7JEvZHw2CjmRbfMj
	bRvdqXTl1RpLnu4std8VUc9AxPaklLWfi7YaWQt/2TCc2Ao1UyLVAuD2DDfng3EBizW3KkJcOK1
	+DpBxQOuEd83biQ57ZtP8CRjdKINf3zglxi5rILXvmQt8eag8EsxQ54PgO0OZvHaNiSPSn5zwoX
	m2+YnPLU57xsqDu+vR0CkcowHpRyXXdZWDnukHcBoiQZkBqX9MDutC+lToldrdSBbiXjj56HqKk
	nF7LPOaMdmKDOj5cigosc24Idx3CHAWLJnpnrYw==
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636928a91.30.1783107927719;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636834a91.30.1783107927089;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:26 -0700 (PDT)
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
Subject: [PATCH 15/42] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:28 +0530
Message-ID: <20260703193855.110619-16-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2Vcb2OHxqlfP
 oP5N4bqTYXrX4J/wjYePFxqlGw0d7JehackDQ2e8bU+ybY56krcGGUl6VjcE1L2M+bx5zVmXc4p
 aB/VgmUeXxMk7+QvcjEXcRk/fDm95Zz4rVntOmY0Rt4ST60yFxFCm7vGU8phxKoZpjnXucVTUiQ
 4MxqvWQ9yeCtdz7t20cXyZsk7eybAtefPBTs9ySRiaiCP2n3C5/DNxvYsi0NnaXb9LY7t2Y61u8
 N1xBvaY1lM9qE43nCCQSBfey2838pbUi1GBtPiwJhE7SRa5Kwfm8H1EdWrNtVbq+moRopdDZdo7
 Qv+NrzS9Bx6wMrHn8PveQjQ+HKDsR3F/yaKxkflaEckixEDoHwBCZhOZOb++Q/H+fuaxrRtzhFR
 iKGl8AMaTExuvVE3Uzv9aKE21CFi5zUQaYZmJhWOPtWe2zJomQFveooMEcXLtLLU6psF4jBCdQO
 DHNNB0fUr+n7/tvL7ww==
X-Proofpoint-GUID: tyeZNOUu7PfjAAyQ9LZq8z399CLXCWOV
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a481158 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8sfNmL5Et35J21XlSqYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tyeZNOUu7PfjAAyQ9LZq8z399CLXCWOV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX4V8wbTYG5RUl
 haW7A86lf1sJ9e1eIh5NI4lVzP30Q+XFGgpJma3Z+pX33YIudeRVzGAt6tj+gOoXDnf/XlKtjil
 /DmGlkTsKA/ShlhXG2XE4frx/p1LQ5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.53.0

