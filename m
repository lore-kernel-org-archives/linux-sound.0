Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C344AF68C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378524; cv=none; b=EJRTw31P25kav0T3qZ/7mz/DPj2QKBLHVZrqToKU2TfY7J7AmlY8aDJRhr0YO6UjUiiTM9SlNkk5xNT5kOQ9qvnPdSZ4wep51X/wHQFRQfgZZ7utRNs0oc0IJZXPVeJfVyvJ5gF0MKM9QzVKVjpab7/bO4tRPvuKxA27NQqHTjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378524; c=relaxed/simple;
	bh=mV8wJOcvTvuJxHQRGgDhBEXdcKnu0/1DbCT89c/dmhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPKX7Uh5ri4bXXH1w1pEoVrgTbFfCJ67bT8IViVj7vNJ5WdP2kAFQ/KdmzIyRqacb/dwxbiP/U7xVKj++p8bRsca7shfqReQOL+IXl40NJ+92a150tCQ0bpig3f2tsgqNt189T0hWAbwSJ9E2kieBC70xgv9vsUL4S/enPgB154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex/mGCBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGRmThM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex/mGCBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGRmThM8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hrqs42106751
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0wX0NGvpX+
	d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=ex/mGCBuQfGUfQ+I3WEvpht4tCf
	6cIPSR21rccSUNeLu9q5onnBeFdg8CG584sGjhoGdssDNxKtLgGQsO3zH3x/hH+U
	6nlBflB1cSTk+1qOicUF3KKKy7voDaY9jgycGYoEYImIn991GMZDHTpQg8761iuV
	GsqR54r9J87D4CivoNelQPGhJmbk/FsWODF4fWn88Jibbpqt0Hj9TBQaGYdQ9a/7
	yMFEBEkTSP4hN6bsQeQS3MQ/enzes0QL0yD+cjarQuSpus+loQpD724LqefxuzhJ
	Ih+0a3dCckghwKcSveSRhAA6+u8Pmszj44iQtybr+grBgcJ4t8cFP1JtWFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsbmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so25199995ad.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378505; x=1788983305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=YGRmThM8wzOh7dDBCd2ZDusIbBD0tXK0dxIrloT7gDp+B9iD2ogq2C8y2xPTkq6diW
         4ktFSxqrnfgTpl7Y8028eMkkCkkIfFPOMDrELrrsp0ditrQch+wYMYC4sAVuvRZ3AMmU
         qXh10leYVjeSmBeKqacHRVK1LYobiH3XX50u1D/vgPpkEYDoXdrFSa6niMqHTbphWv3R
         KyKCjYIoA9j8QBwtrxfWShmporteYEo6QyXdxl986E3RxIMXqCFKmRmySiQ249K91Cza
         6R1PIyAx1GkHbfB0Lwo90+gKUknjmD1B0vVTsRlFTiT/Db3HwQA/3RewnIidISW54o7b
         Wwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378505; x=1788983305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=orF9ToBosWNuC9qQV7/UJu4rMtRvLjI42UgsWVvXGTVyTf+ZxvMGwNuxtyoqewky8y
         H13sNy6oAmutyEEfe/byl6wIqZp9GFqq26XyIDNpHqF6WG9znHdwjwk6Ut/q6gEWQfJj
         o0pZQvGSOwONb0AxQM7lDFNa/0ykCBZ6Uh48y74TH53w894gTY42La380TjRrjMxfPzg
         MfaH5z5RysMCRq55i6q1GezURPJBVIaiqlWiJpg+7hnJdkzC0019d1Fx1y/FnMkLNNqI
         reGnH3+jBJt51Q3XJjD91pUizcfs74rfkJm4RUrSVLpsSnW2G5C4z4I6pnX/rsEahnuZ
         mhyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi5x2q7/6psUIoo0mQsXYLnZiBba12ZfmKSwOzWz5EyyxfLZ0KUaBUTWZjC6dWrgYTswlqdjmdsZkXug==@vger.kernel.org
X-Gm-Message-State: AFuF++lZ5dXDNJyEye+fU9VtGytjOtdLsThwm5w/MlPQLz1ZTWlbG6LY
	TW78joZcZ2JHj5bOVumzGcwJM+GLtwUR5L4cn0Y1lRVcXoii+Iox4JOkj+GvZhPTwK6tlMhN05i
	lep13C4Xw3aIkHf6aS/0gF0T+OS+L/c+rV8uYNQKRKTO4AKnxq7YTZE1EkgwQxtp8Pw==
X-Gm-Gg: AYBFou2GfZqWxqNTWCjU92hihl2xGeKWFGIqquA2R8dttgjChKmkq7BbFeXgoVLRUr9
	ekPH6HjcwNnDLmpIyyKMXp/JyHjfD4igUhReWgyNGbxQ2ym2oprtLyHMGQNKnHQATesbUtpnDbV
	oVhc+jJnn4HKr5bjG0UCgow/KrV+PujXoWKBVyVF4XVog7aZFQlMvnSXPCrq+1wjGqoBesOCXnZ
	+xM5IKQMQ9kzufhw3a5ZGh19IgLsEizGxN+zrsybkFtMrAQCCjH7zuUjD8QvWxp+3BOFqCuPFo7
	m0PEeyMqIkSnV5c/XFaulWj88Qum7U8NbwixaOMq56YQbwnqL+1K6tVlAOpCfoIdoYyLCCt2m6A
	NnBTtlDCMYmksTdn3Hco2m3x304c=
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103553255ad.20.1788378505328;
        Wed, 02 Sep 2026 12:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103552775ad.20.1788378504916;
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
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
Subject: [PATCH v2 8/12] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:08 +0530
Message-ID: <20260902194712.2003414-9-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987d8a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=n3t7IOQx-iCxt-lDHrwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 4OzmkDV-8Gk9TmBDPrCIQI9Nk7pB0bNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX+g9yKVAd0Xrw
 3UuTadrpnhRnZAdcCH1EygqGekzpntFpeGK2SmY5ZtmzfIqdDyFEhErOdYzAaQLPQfThN0iwalh
 smq2nWKNmOaIJ3ZB9zEvmtnxX9wNTJ6WoCrWYF1fEghR7hLfRTjPgOwU6xcnjG5lmOE+4vK+vas
 MeYyOoy3NRbWpmZ1ViRV4NyVKZ0F71iQHHhybIhrii2yNhP2m9I6i0xo06JqkHl0Pq4XycaZhb/
 VRGFmRGKekpcxEDDNpsVxleTDrnvYwCvByRUCeqNrR2v74FAnjTJ06mp1Hic18y5LXxp+IEw47b
 +CvljoGosA1NOZImS3RVpcDeGSDLqcXw15/qxd1C11Prsz4S5VRVmbu7P5pQGrU20IcJP/vwEPm
 zpL6DgtHJJRXsVn9o/IfRomPwfDesX00mJ+EG5bVXpYs3IqJJezAW3gKDpktPzpBjUB41Bc9N3X
 nr9XhGgvdXZ7p9Dkhyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX15paf8ktpelS
 iXPpecJZxoOFu2s8E78ChdlnpvMdyUiDoSnhyiPO4BcUYV9/ozEdgn4VbIpbYg2NEg6YsLxQY7r
 edjz5x2wMxUqEWVX2kNvX62YO+CGERU=
X-Proofpoint-ORIG-GUID: 4OzmkDV-8Gk9TmBDPrCIQI9Nk7pB0bNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.55.0

