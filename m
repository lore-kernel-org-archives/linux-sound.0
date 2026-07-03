Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C433291F
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108175; cv=none; b=E30Hisol3nkOxsUsDKCacxDMN7UQPOUKIUGzTFvCf4KkRexdLVuKxcGMRqJh52D/mjijHv+MNkEZlYuACzl56bYe5JXAJmLMuFOMhmNHwFaYROhNUXGkx6gXVTIAHXINr2p3+D/BYVxReXPqeRpFP6iWMDENBoarHhYnntH9Ng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108175; c=relaxed/simple;
	bh=eQtv/edX+xJWP4nfWPbGJgulIu/9hpaaWMAhwvHp1dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJ8EBIqlyzOWxqFbslwjhrZB7flMuDfV1y7bmBqBhii+xX5YvKtTQHngbe3cX3dzb+1bLBkqu1fZjgvG+mY5/6JLbVvR4ZRcVuxJK3w8Ge8hIKNGV6f1PPn2Gl/nBowWtSHcKM3+/3eCNt9ZHP/JOXRukHv/pJ73vcJqI541EUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VajOTEl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J75N1IMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VajOTEl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J75N1IMP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HibfW545676
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bLJLzW0Ww/O
	JpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=; b=VajOTEl2TqBXAzf2tW1fvyDEAof
	9pqqcBlSU62EYwWLpDFmE6KAFEoz5uiKJuh+GfK7Z/gEmbv6rL7owtce51KVrHWS
	JDymszVAl+JjH8r7PIxzJLHMEkSnc7yjmsPmk7pAahjhtd2M4qefochsF+rT/gVG
	ymuReay3qNZujq/djOXQyHwF++lReEZxvq9V8nIMVjysMUzobb2Tl/pAeuyAvNHP
	OVlKy+p/dk8e+WhhAZf3UxXXfkFHQmzYjl8bGzPEXc6vmdf9bd8GGxa8EwgR3/Sa
	Uj0HGeKXNOzg2T4bRw+GMMXPNRHWYI07wNNJ5EUOGHg+gXB1H0cEWmzY9rQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 19:49:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso763909a12.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108171; x=1783712971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=J75N1IMPKsWNMOLsbRAG36Nk5/Z5W8FOK6dtBC343H28vm/fVo4IwnTzGhWE/Nt98b
         Sn1SAv+bCKwXJTStfFgsC0QX4SWViOY775tUMZq8fUszYN+Ac1nY9IdpJyPnWQxkWS+b
         yg7A1YKTUUN8R2wuIqIQxBTqDvb6K4PizFTeWceMyWrGehVsPbc0AmaJANCJhKFbIwfQ
         4qSFNjpxZIoAA4fZ9kgGF0kNAlq7ilnRKQo6Y88DhRV7Qa/04QJmi404Acqyni57AU7Z
         SVfI+QJoMJU+j01o5AG6MkYgKyqJX0YUjJ//ElNp4sMjUcE8pre+pjHrbycVlgJXSODs
         cUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108171; x=1783712971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=dc1Ui4vJQElCMeE/CdmNz3wtNg+i0hSat3rfwMxjEEIoEsyw+v3B1DNorIlWc30+r/
         +goVn1uP5OO+7VfBwuqWiSKtW0T3nFqGjqz0ZuJOB6GIwqLi0aOuP2dmmhwjDUDHrt7c
         J9gxrvPm/0J++C3I89lVbbLMNgCm+xEyBMKLOEVfC/zrRiZbQmADjfKnySyuAZt7Bp4t
         LTaLpIbPP82m8ZDUtKbziEtQk3ikBY2YM3r7TI7+tmO5suI8dD0xN6bdhlWe6EjPhTml
         yHPacPWJtiGHDEkrdD2B7BPKf9RmqzVR4tkU/Ba5eHcQx8WciPknEWsjgcy6equ7uhz7
         DmSg==
X-Forwarded-Encrypted: i=1; AFNElJ8UBnFeFvascVjyCXodi75DPp1qOwc2tjV2p/yZND1Sn8nuky4j1jw2lrF17yJo6qSs8Bw+pg+pXS5Ztg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxorHzW69COSex6qWJHVANmDNHoC3MJO723Lgf8bmrCE47IXRQ3
	t9Y4ehleQnps0Va7ilQhoYYrUgU3LZVA6q4hB5mp89jXo/J6VyQmNEDJhNrmyZRmakRqZzKAfuu
	hI5fvuuJjbSnyEW/QF6ZDTpDb9JH3D7LobupupKe4+Yhb8kTfNm5m4/MJVUhtV3IFaA==
X-Gm-Gg: AfdE7cndS+CmLWa7O0oTBJOx7z/WkCgw+qDsidNFRCNxgUrXB3YywZBF4LEXUnjcsCX
	4iJeiD2hujvWwOPWcQFokXrgYM2De4vaIl2VpPvptwDj+AUwrgIE0wIQGsB1qwGA3CdoHAvelBm
	FCFXXkv66AZWml4liSIlsGP1OwzNmT2oqpJq15hEBVfvLjeMuBPxuyKOSekPYDdppX6QWhQjD4o
	sPlDnxrBypDL/5r2R99g8hFW+k762N3n8rWXOL2qu8uwzCNzEOkxoP3RwrSXWjAjuJZh4QnIBBL
	wsp3QjHwNB0A2fznlzZJxBZCiFlnM3Yf8J2B8BEPfeUgLww7O8jU9GW4KevfrI+u40DqfEK0EH4
	IYGWOdsI/e7Q+fXjspZMVEOFMIzfW6xNOJmL3KQ==
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761401637.12.1783108171085;
        Fri, 03 Jul 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761349637.12.1783108170517;
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
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
Subject: [PATCH 25/42] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:38 +0530
Message-ID: <20260703193855.110619-26-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX7ohl0gHaxU5p
 ppKtfE+FK87GVUk1QzicM4dF0hyULBAAjVoaRP4/srvrT3qinqXPs0eXffsmRVy66JO+GJ9E7wq
 TgQVRUylRp9g9B8oDLmJOGJzV84iW4fZMTFrXs4RXHiUaAfoSK/fpWQ1PcGVgQfyl84v7Jcm+7y
 Yozs8ZRBhXNuqPQ8n+wG94HXiqX0pzA/teLd6DD0G4JbugAfWJN1xxthwFl6LKW++3V89Cu0Czx
 r8vvSllWCGsUPSh61+wJ8DkVocfLdNIPHwvYTFR1pEhtSsvHz2WgnOrXsSz/1j+iDhxCmSQHog7
 CH8IYa3KEggeM14uZM+UMv+4IZeBwV1c8lJQ67K1FWLHE0Rgp4byhBOvPgK6YahxBHnHTIr7gDA
 yLLg+b5hlU/9vW5yRIIoGLNPYpmoxquRsU1RABzufSLS0dn8ZgUY5v+h34cr3ahnFeTCWK8/nIk
 7u6A/2M45m3dQUEgGqg==
X-Proofpoint-ORIG-GUID: CskuiU6ZdIV8IiW0jrVaq_w6VJHqBvbj
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a48124c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cg4emjn-6EWHYnEhqz4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX735/vjaM8+t2
 +MYy3FCF3OoknIATNt9pRdDiwhEO7y1kxIXB4BTOIN0eAjymaNgHhABZCtW0LvCeihcCy6I5H8n
 3rPZCx9LVaz4wN+4MIMRy2yWdy/2FKw=
X-Proofpoint-GUID: CskuiU6ZdIV8IiW0jrVaq_w6VJHqBvbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.53.0

