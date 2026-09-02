Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0A3B388C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378536; cv=none; b=WSMmOlb8uIUbGa5oNLEbkjcFZ48F4JGsI0Zdhaza3AnPjFpaZUBctDVCR2jRp5odMCPk20Xuexb773x8TsQ0D4eUvxFvZ6dij869ZHPsCpJWgmG8v2KlIoOdtE7pr/5y17KPiGFy5ecvofM0yA992b5DkI+YPOUaK2nUgfTpGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378536; c=relaxed/simple;
	bh=I/Oc1aiwmb8sWO94Gb5pznov41xAVJ2kLYVBE2Uv0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNqCjdwWcgvikQTBsGrKWnoRnrzJoO7uOuJzX4Tm2blKM03q0+6rkuLZuQ0mqpE3SMC4CAPduUz7I7c4MiEKsO9JPDqa9B1LSnbfSGISa/WBIrQHyw+UgXKDLdRZhtTx8DRALh+hGczYH85UZjEP10pudg/ThrYnUxfd26iu1cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1rc4QZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmCQ2CsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1rc4QZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmCQ2CsW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqlo62270336
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvdccM5K3gM
	HO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=d1rc4QZfbIpAUfa1/Cg076ioPXC
	9otIlrXV74HApsxHAcBY65egjvSUZJ/XP+wbHGPZwLWMXrC5yaKXnKjN2cFyoqav
	Sf4AXwMLW0O6E5sQw6/08LRTjVKzxOYQTqvoMfaZq64gpoXjwd34laxqaHWWOgAM
	LJ8h+PpWbylqr4FFwwAqXHdLtnkSGgXILjy3MW0mS4xSlwDjptnTky0IN6jPrhX0
	rQ4F+mI/oOFtQ0pid7mvmomP7JlWgZTvJlMdfqg0LOgUYZNRi6wG53KthQobriFg
	SVSMsN0azSxNW540JH546nB3BLb6X1E3zj26zSlu2ho81OngCUkVlvQ9mYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so392655a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378520; x=1788983320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=JmCQ2CsWahpK/SokfVTl5uZDixaZ3PotRct0LNmKI3PNNufKNsGerNNfuHgWaCl+JK
         TI9gzDKYduqMIq8bnF6Y0y5QCK/zK3giFmUhcrwYIGgjh6CoktdgOeIhq7FCj/mwhBxu
         rTl13ZMUbrsZVllSjv1eaZOGqeksdEXc9Nz5ftU2bCZEU4laTBhmeJK0mi9uYqVZuH6w
         w8z+LN7igVmyrYxIUklCH5hvnzPeXSgf6QBt63yIXwrYagNRX/WnkNWPi287IuyFz32Z
         ZjRxs+hdIyzug9KEOax1eA78ND4jSdsv7mUVwmNbLCr5CyJkQ5fRj42UnoRttXjJTLiv
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378520; x=1788983320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=qXH+f7Z/5xQ0cHVLKUkrLdIdwej/H7W8N2dzKy+FlBWQTWWPwQPvspQx9LQPUggSyB
         u4RF80O3K7CvaiW/JTo9CIVuxBToWDDRHIl2TdzW2ZDOs+4mplfyGgb7Ydyx75WI4Ajr
         fQRRgX6uLbWqox5ZLfWsFEcNP1/USppj8G8HmhgWtbFTmP27TNX2VBMFntEKPI9fDTyl
         yIBoVTFWpu84Bvbi4EtSlF4Z7VTtRLxC1G8zGP5kFo592udKbZ56l/ZYtBV0lQ+iDUDT
         3EY4Xh9QqMXcXfaa87ujEI9fFEuZ1jXRhq8loJWv9ZtZeaqr0uw4dgoW9MZL8nTkICl4
         zCvw==
X-Forwarded-Encrypted: i=1; AKwUvBx8otdmxoy5NoKVfGTyb/HBFolHx37cB6uUsTOkg3Pnwyj/D3Uw+I51dBepUBpXucwOxAFgRRTLDtDuYw==@vger.kernel.org
X-Gm-Message-State: AFuF++nLRvD9ZDDn2Uh+vBFixMcMlIkv7DIfxItoOkzp/7ZksdsNZPoM
	M1X+D9KhL18ww/msp2K0QaeN7Q7AImOZQqXwloeQWHtBCxQyCoHDX6sr3372AFOFEs0hkqp6wYB
	fneEL4VoDta5lmy9BsAWWtwOrm196KXoznYxPP5DlyZWhkSFlfhsIORXCJl7BXbCl2A==
X-Gm-Gg: AYBFou2YSJuzCUgyGbYyC8+hDRHuWdDFw6NepuLw4thklxKQzn8OmRlTNl7iEBIxkpr
	5g4+g/Q3veslx9euwvr+CdZppO4L6Hz2nCkx+tZyT6rNwzQ4VTDgzAYQC8+hXd+mtkyj4E4mUwZ
	PLbV04FMJIYarnIQvoA9TKNxsM5fBp3BQ7W7DX/hyS+QBiMfa5Z2dP2wpPKR3aCLVrzUVrM8yPP
	VgTRREE6X/mAmwmyZOGPoEAxtf3BLDPgQXlLYI5Lsai4qU1AtXJUogcnKuRLtaN4C0QzBlbhbRL
	w244X9WxqvP2nnhq9jIa74f+E6vxM03GZRvc7xQTDroYefqxBN2Zp20On/s3a3KtMvw6/w819eV
	UEr+jrvA1fLFv4YibiVe48y+xvf4=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560738a91.4.1788378520404;
        Wed, 02 Sep 2026 12:48:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560695a91.4.1788378519784;
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:10 +0530
Message-ID: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzQlAKrQkfKu7
 hQaJR7PDOG4NXs5aET3VNGiGbRGikPjQYpsVRjaW/GGhF3ucQzNdDVQPY8Y/ACNb8kG3XsUcocd
 mEjyPq05fWYgcChv/Zk8jThGk3dyRrI=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987d99 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: JavlusjTjI__ocUxmTmfD5It_EJscEsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwGr6aP4HWIP3
 S2WQnvXy3gS0Awlpzey11fPTI5kHf1a4Jabqj4h5nsj2/iRRx+oZaHU8wOqd7KjNNh1uHL7Bg0a
 BKxjmeLdGVOzMGjzGW4LyCE7SadPzDBPdo5NF2rVM9vfBOTDlbE0MgatJExr+ONqQ5EQER3M9d/
 b9z95+wyj4M7imAd0sqXuUQqxq670dmRsjQ3bc0ja6w0F8X0rmw6DbdOpnZP5wB3u/HnGWfnjfR
 J1j3FGo8oZyNBqGfAO1z7lMAtGx2afH0GmmAvSWM6g8kEyMNYUItyYUFBgKEtg5Y7ub/j5gyqF8
 iPErlH86RDYMBOETIWKFlXxsJcRGqI/WwIJ2DIbZCvSHOO8p7/EXiHTDU36eo3beWZqJs3VRiQ9
 nKd9TvQSMZnuXjlUUQckRUxjF4UtZfzdTDTFfPNZ804uBu5da7itONUdqUemr/zsjz7HAARrmVh
 HEXrSC4bVlfoCDwD8yg==
X-Proofpoint-ORIG-GUID: JavlusjTjI__ocUxmTmfD5It_EJscEsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0

