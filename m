Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597921;
	b=QVYRxao/M2MZBTQxRv1J6x3UTRfY2/PGxJd1MhhM4MElzF26PJTyATM/ZInwguBOeEKR
	 Zyp3u13Mce0bf2uWSJHzepugJZERZ9gV7qyMn2o2/yWpLEhjk2fc4PZiOT19bK0JmGYYA
	 ualJVJtrpi3n1JRxXyDPsrfATsoVkriP/YxY9kviV9AIxVHiko0NR32hBDH4Pla3Ktwmi
	 fBcWDevFEuLgnsrh+lLydtmoONX/lDeVFIacmrMLlXH88mM0ZgFRGix/T8cA2p3kfKN/U
	 2cTeassAVP9zxD9VJw9MXr2Ut+vmxuJee8QNybJjzdDpPKNhtj4cInqnGcb3Y1ARrOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597921;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=gouNuXBJ/VJmH4mgiTD8Nh1fdWF8sXBHPydQFNSIqds=;
	b=d0ebo/e65JKhCdZ80wl9clXHB1IJgfzl5mXABt4/b8Ks9DFyWmpvqkBH56wrtj1X2v/2
	 G2TNhC03MX2A78BvImaGkiSq0aLsB9a8gcbdwbvyWnJCja4CJWD7ZgImH7kxR9yUw7pTV
	 nbJxtqIj3Brx+PQ7dksdi41hYNK9GmZxA6ygLO1TBMxkONC0y3DwfvEqBWhdbvGkjHsxo
	 wTsrpLQKMgJotHc0KppzrseYF99RtmHM5xK35LqUVGBKc9rzUGJYB3s3CLBsHu3enC6DN
	 IIeo/QCxskk9nvuV+A94E6ScZ4ciBiUf1/21tNSWY2jLsEnylyLPpPGMlEt8AlWAbSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h2g8lWBD;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8706606A326
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8706606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h2g8lWBD
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125091157euoutp01b86bc8b9ed0aa600985df921a1a88f1c~rPsr7k6yL1421314213euoutp01o
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:11:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125091157euoutp01b86bc8b9ed0aa600985df921a1a88f1c~rPsr7k6yL1421314213euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795597918;
	bh=gouNuXBJ/VJmH4mgiTD8Nh1fdWF8sXBHPydQFNSIqds=;
	h=From:To:Cc:Subject:Date:References:From;
	b=h2g8lWBDfQ8cCBjrkLIfA3TTO5sATZmuSXAcWdcZgmat0Y7E4tAXwIKKdwFE5YKCJ
	 MX9t1sT3ixMUsJ9EYuvAKwDV2TE9JlDjdkd3q3ocsgoe029hOKUWTM5/HRKnwM5S+W
	 WZ7U/SMYTqdq3/gzD9YKOiuLrsJDJUuEw71854LU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf~rPsrcgERO2882528825eucas1p2e;
	Wed, 25 Nov 2026 09:11:57 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125091157eusmtip29a72a29dbb07225364b002f3267a2fe9~rPsrF2y9T0318503185eusmtip2B;
	Wed, 25 Nov 2026 09:11:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Srinivas Kandagatla
	<srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
Subject: [PATCH] soundwire: qcom: skip DPn_BLOCK_CTRL_1 write for
 unconfigured ports
Date: Wed, 25 Nov 2026 10:11:49 +0100
Message-ID: <20261125091150.2145177-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
X-EPHeader: CA
X-CMS-RootMailID: 20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf
References: <CGME20261125091157eucas1p2f4324315c65e38343c488ea16ce3a2cf@eucas1p2.samsung.com>

Master port_params are filled in qcom_swrm_compute_params() only when
qcom,ports-word-length is provided in DT. Otherwise they stay zeroed,
but the SoundWire core still calls dpn_set_port_params(), so
qcom_swrm_port_params() writes 0xffffffff (bps - 1) to
SWRM_DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register
range. Since commit 55207a5b6959 ("soundwire: qcom: add multi-master
support") this also triggers the port_num sanity WARN in
qcom_swrm_port_target(), e.g. on RB5 (sm8250 WSA):

  WARNING: drivers/soundwire/qcom.c:1170 at qcom_swrm_port_target+0x68/0x78 [soundwire_qcom]
  Call trace:
   qcom_swrm_port_target+0x68/0x78 [soundwire_qcom] (P)
   sdw_program_params+0x374/0x774 [soundwire_bus]
   sdw_prepare_stream+0xfc/0x310 [soundwire_bus]
   qcom_snd_sdw_prepare+0x90/0xc28 [snd_soc_qcom_sdw]
   sm8250_snd_prepare+0x2c/0x38 [snd_soc_sm8250]

Skip programming when port params were not configured.

Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch has been developed with LLM assistance and have been tested
on the real Qualcomm RB5 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/soundwire/qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d74986a3dab3..613679be4b21 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1205,6 +1205,10 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
+	/* port_params are filled only when qcom,ports-word-length is given */
+	if (!p_params->num)
+		return 0;
+
 	return qcom_swrm_port_reg_write(ctrl, p_params->num,
 					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
 					p_params->bps - 1);
-- 
2.43.0

