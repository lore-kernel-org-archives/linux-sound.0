Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44E4AD4B0
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378504; cv=none; b=Q6aOFFbRz15yaG6qEZfyQ517MpmZp7CDRdln+5V5e9XvOcgvFQfOjHMSSbroxn60WxVJb+l3vr8MF4D1Vy29um5cFr+IKWeJnrLqnXT+7/cukopX9ifC8bSaILrDgQsuh1sl9OtqBbmlY+dcOz8LeUq6dJNWCqzaumlRosNkAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378504; c=relaxed/simple;
	bh=AMMm7hRsydGhyrdkXG61mNze853XUub81eosJE+URdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9kwm84jWWVnfthH+h3IMCW8Rv0IOSiVkVe95/odg4QrMc8VkbHd4PofmKAJZ9HR/DnPy9GX3Kq7tWzYFN8Jj8XK6cFiL0Ghl5nECe/VbIIxFFKRTspp/Qwezrh9onpLPlmLCiDAfYXsAyZSqEYVPRUW5ro6jkGPsgJfy4u1+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9MRTSDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSUlSNeH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9MRTSDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSUlSNeH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqvPH1650608
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSI8nDh7SJ+
	4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=; b=f9MRTSDk3pl+Xm8LGcfZuQKkl63
	lF4WIoD4QuA5qHY2ReiJ3flaKBMFAM+uThec/wSWQz9etrgHEP6tcXEs7EIYFTBh
	dQ0XAExdAxSd0Duruih1RZkw2j8DFjKxqFwwSB/cg41jyekNlPgLBHRMSXLzVv6a
	qNB0MqF3nOAPv1KcMcAkOq6XyOs70W0/W2uWqLOA8jspbraRPopQBI0uAcsSQFNO
	DB9YR19g4ijdhghltd9v2NaGxrrP+gFRElnvS9D5ZrytBDsHs0sEYPx2B9JO8LLr
	rw936RaWCRxEbXgs9M4S+MMXlRqiYXM2BfyV/TQjHL7rBfQ0B0+MzlcUSfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4snhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2344359a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378491; x=1788983291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=WSUlSNeH7wroo6HrrqNZgp6DyjGBKUp7NCsotsxNvTpfjSaG06UMvNDEam/xpyZ1N/
         w96kvNPdZKqOPmUlbyvMCFYV/tq3CMpH5HuM1Fp49I5AYFq6K5JFf+Q6Hk3JpKObsrkD
         t6NuhW02YLTlhORhm1RZI2qhNIt/fZDo3YloU9UHC/9AxBNNru793u8ebjCuQCXZWPbr
         JoEWscNdxX5yOGvT1NDlbe57jhu/hqMWMrqbdaVFTY9dNhnXOhTZyu6d2TesvNZ5qZ/O
         pK6l99IXcXff8ZlyidgeH+Ja0eqAqajZa49vZE3zGPFOvL18Y4aW+8wxiaOZ2kdtP6RS
         3xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378491; x=1788983291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSI8nDh7SJ+4QQ9G9zlzAVvvvqBaMGbeQbdznI0RCeo=;
        b=W1Uo6BHRSgPOcfNVqOiJvf7dSQLdskze67gGm2Kwx9FwKOiyCup4BzFFyqCwQmHvIK
         WHz5F+HdslRyHB+iEOZV14PveUTGF02ok3pnwdkjQLEJqiIxtyfB3DyjsYwjIw3WGuBU
         izV/4uVr/xob8gNEcSnYyjo7jDxCp8dEZz5gCV05G93yIPLFAzIsXSTNaqj6F+k1H5A+
         78ZQw3DhWj9ntPc3hAtJY4Fhjhm+zbFjxz9zmA7KCS6VB92o9OnNHX0JKqtcJaQmnOuc
         kP/8WzhaCBqcOYFx9pXKWD/B7tBd9EKhcBDwijME5DuTVRG93GC+7N65pfZLAbxOoaQ7
         XVpw==
X-Forwarded-Encrypted: i=1; AKwUvBxFm8YAPc6bFjWe0eJKWQIqz+z+tJYd+bxJqsFm8BOhV++2EWvYSQW3jF0bP16qjtrw2cgl2ITrfMz1Fw==@vger.kernel.org
X-Gm-Message-State: AFuF++l1bBnpZ0uDh14En3oToz1TPJC9KCvnokcp9cC56Zcnda3oMLGH
	NvpJBs4HqVdS0scWhJ3eap26WpOWSfBOxAw0KlhHgLw5wMw2G2XNsDql25HA8BBBr5Juo7/pb+t
	Xek2Ncbq29D/HP2XUxwfhPF4+SoJ7lOhe2R06Jf4i4ZjIYe75v95+DDPHPi3iJoW2pw==
X-Gm-Gg: AYBFou04iv9mjnF3SCaHS5Ru3etCQAIAibAplzjVpIB45K2mo1IiSiP3wShxunoJFiu
	EwAN4h1Q+qqBB2cZJ2LBsKpJOz6pOvX8oTV4ynTmGqokSbEih2kc3+rWX1cq7qpDvfd62yd8tMF
	E2DtG/G9eud8VXWzZzX9vvc7W+eG8/TVfPsMQ1Tf1jqbhgfmcDLAmzgXEulVajPiTfuSy7fJB8D
	urNjtX6oEApD9A025m+oJcZU88S11kWO0nifjoOzWH96U2fD1FRXSaxKfuqcfPc9YYqpJHnQVLO
	wrIuPZN4hBnj3J+jN3oocuds2zRCCIdHDge+B1+zT0SxlyOROXZQRe8gRbDhbuZpqYZsYb0EyE9
	cfZfyJ4xcwakWwSNFXe8WBULHGoo=
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442682a91.25.1788378490481;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr9442629a91.25.1788378490006;
        Wed, 02 Sep 2026 12:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:09 -0700 (PDT)
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
Subject: [PATCH v2 6/12] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:06 +0530
Message-ID: <20260902194712.2003414-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3s/SZ/fj81Tm
 8fBfH/NnZJB82gXIgVxiNw4MZA/N7Ya7l66b08fmAC6NxGv0izGm6d0Zp8R70NUIzuAgxtRicJ0
 m+nBu5dXjcTdBSbnSS2grKenoMKI87aOdF2AaRDu/Bv7nDpCeAXMWJG5jIy64ClWq4bqlic+1m+
 uEXBKG5kkNhXBa+kbh9vJJpErMhStSuzNWmR4hCCgZNlrG58BaUv/m/Mx7pmktsmwhYGzLGTI0I
 bo3hqz9bvhIoozwdfMjXM+IkXyjNjSzVKL2UvV0qhrXfjoaCAtfueatLWm6GAXirdtqAqjZTfsy
 3A+UXIQeWAb4i3gwKyN+C6PTuhC+abD57TFr+ctuYZ8YcDszVIYkwjCct4RSHuWqGXex5qyF4ij
 huWJjWnms/EDV56WSkJ+r3kHWRZnzmbg8rsWvwehjo8xmFxnSU40E/MZnkn8Nfvis8+nOMfvuxp
 HSvyKj24JRqplRGC18w==
X-Proofpoint-ORIG-GUID: VAGTh8XmSoZoKAUo_y8930zcmH_gBq6o
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987d7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VAGTh8XmSoZoKAUo_y8930zcmH_gBq6o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXwclwc0vDA2Fy
 6coqFwfbxq3HkLVv8CbCpvew/ibnMwXbY4BcokuCTJuZnd8eFBRk3hOiUUWUgNpxwVDN101iAH4
 zsCkL7gesMVK4JQK6yWv+3B76YYJq2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0

