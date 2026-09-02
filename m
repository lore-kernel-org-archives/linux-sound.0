Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D94AD7F7
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378458; cv=none; b=nknDQQ+SllKPu2IKQ21M+vTQ9hAMQH6PpIUaaOma8g/AMBOqeUs9mzML8GDKDMQbIglhRTgRHq0CEma5eYWwA4+HWRjrV/HLIuuEa1DFOICH5eUForV1QYsELSzZM4/S6//Xj80A9v22pG06MOjTHxZ99PNqG12J0Odd7eirIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378458; c=relaxed/simple;
	bh=lR/kOg4JPDleieXCrH0ugn/9kc0/bV3ijWJfhYo8ipI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujGvlkFkO+ijSemHC8Ei9IYWsbnh/S5dEz+dXSdHyLze0CCG/TLHeDT3/d1pGOz+WSOfXfZRaC+eFJmUV4Kknj+/g17AoqsFRtdFM0I7xmp8WrVNSU3dPy2DHi4el7rr2QfWnVcgv0iaaA2meFf+sKtQJZhlgxLa9ynmI7Uwj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYKBCmKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBBi2+1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYKBCmKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBBi2+1b"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrGbW2976138
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aE
	nLgC5tuY=; b=fYKBCmKETr7hjhhElQ5bba4aeQ4CySO3kn9whRMrLELxcvgS3wZ
	TSiAe9qgWuenbUOZkYGD77ESL8ouruX/1nHHAu5DLzTSHzQ4itIpkTs3q3U/fyr1
	h1us0XQXNXIiaGy+VGJ+Kqbx+mdqi7kMHTg961EXjuRG7IS3cAjaIUmeDKXeaDOc
	0OFEXE0RinY4vkixwT/0CaNFS1uRG9U5Fr4jD0TJ98Wd2tWlY42E3VlcvWvxOrHw
	QktAgLkFUIjSVQaTNb02/6rTGonvIIAIA6vfcV+NPGFerUAITiYGt2xCeDUS3GRX
	zFQolpjTwPXCZ4x1RdoHfi3XCDrMQMiNzVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8mwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:47:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2872525a91.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378446; x=1788983246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=HBBi2+1bfGiZWlMWUIRFgrvcYzyuvZb4MJW31bkwdzxv0FqVudHAy+7Rvt+d2n87Iu
         Gw4oPW0GmuCclN89PknrdT/MjCYYMiOPIJUqMaGk/I16++BU3i0xy6jPpBm7BA1JfbeH
         I2F0tN2F4/lXsHdnkFxgPw7cOuBOsBRbasK+WKA8Iy3uiDFxyX+3v6Sf07g1atFtuoCZ
         ZonfbHX+sSjzVOB/R8ln+4YkIr54uySouJMvjvMV73gajtfgIuM0lROEejmbXgLb/+oM
         U3UbuMOoQjmN7f7YHxc0NKCrtenio012kykmjivCeRoPAm+T1ZvZP4m2yhNhM7/TY62x
         vAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378446; x=1788983246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=tZjwOdrQJS0CL9Mr2Q75f82lOwIX38TSrX7r5QT0P443w0XUBD+7Eo64pVWmMbX+3m
         Wb+4j/lEJqSf6yL4CQQhw8MDT763yLaYqMueKdXy4N//2IgNC8RzEwVJXK0BLBEzRwaf
         1zSH7yVv7kaLuoHiifALkjYgBXd2uocyhqnXcJW+XQdsOFBGh/+l57VrxWArbwo0nHHW
         2SV9cPfDjo/6n6HoClivx40Jwxk7gvAVmgNqDqR9IdPk7b2w0hwuvc6Ihr0cvKtvrCpc
         KeJfOTnWod8hoIWvusg8BdGzX0FNsgSR7QeLixXo4tG188D74QckbXCzFyHV/FdJqyRa
         B7ig==
X-Forwarded-Encrypted: i=1; AKwUvBzumWKZVtyFSshs9+prLnzKLbGhR3OkekF8nEtmTj/LF5GDFPb6rVUZGcP53Yp1Jm5wgoq+doeLeyj/5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mdDzE0tayO/viPvLiPaXqnBC1ek594Fnw2+YPH9Lfo7Zi2txmw
	3d5aHt4yX2vtyO+dPisocSoqZqW9e1dHkUk7ExxXUWc/E8idx7XqOf9ViA8yQfWeQ30Z82zCs6t
	rqXR/NOqFjRiV7BF9tAbXnKEUAJOS13lduMyJZT+cejFh/occ5jJmlHE8Wq0BH+1eEQ==
X-Gm-Gg: AYBFou0c8Axy9sGQcMXZ3mSIojiMfyI+OvK23eCjmXVPQpRG0AlYQPjSP73icl4WF+V
	zsnkUEdpRS27Oxm+H4gT3vDw9MZGHDgm4x4tVYv41RGZHAjIVuR11vblqiMoHId2CKtCSXDb4+K
	smSjuhfI0ErqnqhksclnMNPrC6RIMdDhjHXxTGN1d4k81EmhJaUniucCyIw62ItG2GhokZ0dV2R
	0gthDDn5mnWZ9fyoNCFB7PYbhttfZUyZlRP/84wK5JvpnFIIR+raJ6IhU1OcdSEDvPj1MOrl2D1
	z+NcROy6dOwNXAyOpAd3hqI7Mx+O+HrncIHZ6Ys9l1JiiHfQjaxp9Yavj8jastXxqMAUPwqii8t
	3zV9V80pN7MCcflOuMg5B/zPV3As=
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917515a91.10.1788378446089;
        Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917460a91.10.1788378445546;
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
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
Subject: [PATCH v2 0/12] ASoC: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:00 +0530
Message-ID: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987d4e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x_sJgRSeZ0M3cdfWgbwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXweeA4LHx5ckh
 NXSVDRtvIhblEkB3ppkz7Rk8072K0Yt1xrHWct8DfsoKoIYtPYLMvn4Iqp1t7UhWLZxGdzAvdVD
 7vc++oT+Velx6ERhzuynfyp1vI9Kf+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5A4FaDWCtjyI
 sijQg2yeNRdTIwftRK3r1stXyVuCc3w4ITdbWK0unQA/uVxzRg45h9TerSOjrd4VZEX7XgJTABX
 bO3ZaMn+IurNkAD0RAXezanK4twhbZ04Ki6UxKPff+9Sacy9QxtI3CAz0iur2KrTaOz0Y5d6pML
 XA9Ra4nHYNq7So7NcfpvOyz/ByY6XyKhuQaX736M19t/Mu/IsYf1ERF0kzH2K5mcEq9bb6BtJK2
 L7dXqkkbHxcqcGn1AUtbjDzM9w1Yc7eCp9OD4MpmGF0PrGYyLAY34W6oMcVVSQ+GQ69qVFERxi9
 Nr8dRcBS3WAdXB4+93n0SDfIkJ9cl8FSndmawG6KjN8th+K954s84OsQZtv7isYsZXbKKXDP8Ry
 8h/tL5sAlLy4PvrhfVcAVMmUExs/UvHElbk2jZ0ZpnyE4AHDJMIWU59NkZXxxrVk7U1gKoxkGci
 Vzrp8D7hTPEq0hEGbIw==
X-Proofpoint-GUID: dbUpPBXlj3tSAUxTh49j9xrlguqK95eV
X-Proofpoint-ORIG-GUID: dbUpPBXlj3tSAUxTh49j9xrlguqK95eV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Several ASoC drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. This pattern is fragile: any error path between the two that
skips the release leaks the reserved memory region for the lifetime of the
driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
ASoC drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried review tag.
 - Rebased it.

Mukesh Ojha (12):
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 sound/hda/controllers/cix-ipbloq.c         |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c             |  3 +--
 12 files changed, 12 insertions(+), 71 deletions(-)

--
2.34.1
