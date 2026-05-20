Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF32773EE
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292208; cv=none; b=LPPIdSIgdcY/A7SfBTlGnlwZj+sRsGq/pHFR1RNVKyDyg8sQtZJa7VL9TB2Bb8Pp4X2J0ZS+MyfmZybglxF1Iw7AKp/mpEXn9IUqnph/NoK0TO3h0U/YQmOShOqmqhkHT2GlmTKvpCsSkIVZ+uZo8CEJea/0gJKNGTG1mYGEi3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292208; c=relaxed/simple;
	bh=xZz3wj+cUF31WgUrrJBgTwIzFgvo2Bm8BwV4hJ/sEsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OpMqhAFDnjqAcOlWdYgf9lGiuhywfWTJtrjY9bQf0poB/4j+C6L2O5i/Dm3Hh/fAsVSQ05j545uqZ9MFiAjI5T4BoQsA6NJvj+JaQ/ZT/nz7X2ydDEilGR4/C8tPyijGPRGEWetHmWjQTa01QIoUO1+IrpkQm/D8ZJjJMcdvBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ua8Izd1g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKkSgAuQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ua8Izd1g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKkSgAuQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFekh963945
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c
	0ys0ZYB8=; b=Ua8Izd1gpLKgn5yT3Bp1v8iYrgBNZF+Z/qME/JHhtgBVbD+a+2F
	rCwJOd0poMpHQmal8bncpFwVtH4+hDda0zZLK0maAxgUsAWHdSLeUzhk50GDnCtt
	ewSG5JopZ51NrLEsx5H9WjoWvBtAGsJQUziNXC8qqubMbrc/KRkn71w1Qqc+PdTY
	pIQ+rMHDvoNCIJz6/sps2NffdAvdLLfJ9aY6dLfj1dhklpROIRwn+RyrhI3sM96m
	bUkBbeocfBNuut/ynYWOIbMKkEHDaIHUXQRVMdVCVL5X/0JBDfyipvv7qiwivZHP
	K/cyG34mKBe9TmAddjouR4le22ueWVeDVZg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0d5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:06 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso9487397241.0
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292206; x=1779897006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=fKkSgAuQsLbApClzNIho+TB5wVrr93Rmv2jOW5CpjXTDVhgNQ9NkAyFoKd5CYj6A2d
         CYRnEz5h92JFXjkZ+lT9ABAgMUZSFwv5iV0auuKkC+X/vpMLWs/ceE8v687pJspFiUJd
         Ooiau53Awr+C2zu3TvIfWu2zapO8QKD8McYfiX3UufnhbFyh+yQjz5Q8lFvpdRrnu+mu
         FxBPbzf6RNhWzmTcKCUZQCT/vr3tkZAZL0oxx8AyMCh5XRFAyPTZcVOQTr4mxEKtt1Dn
         1t8D7KHSHzlunvlHLAT+GP2BihdIBftwTi1WmkofI1zTnHhpI3faJWqz8SvW7HOLXh6m
         8xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292206; x=1779897006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=IQo7SoxBaWfBVYx/x7mhdCeRvPTkMDeTxSs1edUPx3T+ddwF+gtjnGua0oUNAPgdWn
         ZT6DEOB1L2W/x04PCwPzczGSi8RyY10Szwqq2ekqwLYemWiTM/beBjGCx9JeZXyZ7Wft
         VybBHRHjecQXuostCvbSokvTAzNO4SDH18sRbpYYQ5iED5qykVflyAHq6uz3fwYKoQN3
         LCQwbTSC1jMG2qQ+rLEOwe0Dd/z59aj+68eZ6ElaXSILsXgLRH5x+5UZPeKnK3bXamoz
         C3PP1Oj+GCBpq7rs3mbGwwh2mSqQnmDIUash4CcmAprTbe6OpTGn7iJ0wfrnVCtfZRz/
         PXhg==
X-Forwarded-Encrypted: i=1; AFNElJ9ikhpyr07++ZTtLilKOKS3wA1Fija2qA/lKhyvorFfacRkqw4MuKCQRbDYfzL58FythJIe2WwbxSSomg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4hDWQDncerGBW1WJyt534ut2MfR6PkZrH56QgwMORp2jZnpB
	9VW9N2JTw6lcRvzsiu6OFuDdCHTO+YB3F3KCOQ51osj3jxQE1MamCYRjKdnI5GVzRikxNLnyhMA
	Cg5yNTOtTepIqGqR7RUK4IsUHHlX701fY13AzzFPJpshlImvZEpGqays8y9CQRqWkgQ==
X-Gm-Gg: Acq92OEFFNDU9KE1dXGnITvuTwBTCRr+0WzeWGBR355dXV6PmntzSD2FPhaWAmMIMol
	FCNmC5AOnqnhNm2BgM59XwYZlM01Wi/iIk7v5OlZ/kDdLDoEOI0Noi24HcX+KegQbXd3YjrmcaT
	TZBgPh+L0CDlPCLH2gzL0/qto81J+WJlbl+9yZF15/gQlv/0mDKnbn5DHk3e7X6FqzIU+LhVgXr
	9Fpd75t/3wWERl1YxgCm04IymKm8WjubHIjc8WB9q6bfeSXfguUcxH2GAt1s6s7+wR9EzgiWHW5
	WmY18QNoRGOgw/CpW5NXgFOGaFsyV5nAcypUMmLpKZdP1U1TJSU+VSqpBlcNM7ZJSPh+n+RwOip
	rW/tp2xNgL14U+0VuWuA0iBBy0jYRj5uua3Y0+FIN70ioN0TvsDH4Q/s=
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617432137.28.1779292205723;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617409137.28.1779292205212;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 15:50:00 +0000
Message-ID: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dd82e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=PN1NiZu9CLyR3tTXQRMA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfXwAX0yyY8kcHH
 VXm/PbHuGXN8GGO+ArZ41Q8gcHILZZbZy0zCdxKxtOyf3v0sKCarD0N+Z6T3jxZX7aAWggUdvmf
 lSdSc2ZWhLNMtTD41FOBr6UMFiGlZktWlkCx0bsKcCOQlnP8420Il/QFRdkSU6/T/jk6XLxg33X
 WweqUDjdd0PCtgbC+ILjmUSgIyDwka68jVN5+pz5JBwUV9wBdBlW47y2ksRccrT9FtwhX6GNkun
 gt3JL7BF4G2OiAsMjNPj3lP/OUBMwNzqAqHa5qMuww7uf6xGPyhPQSXNHdwS++NYr2xlD9XjHSh
 FW76hg3aeHj+FHvTs4jS6s9PK9ejGthaM4pVGqbRGk8bemRKTQST7x8LbFr8tR+OaD3uqO+F8wX
 ua9PS+q4e3BTmAH54MN8KD+4TgAKt3+dezY62QP5Lkzur/oTzAnqAs/MIsjbOKmPVoiGnE5Z+pw
 SDNdoiYAf/FZeptExEw==
X-Proofpoint-GUID: vVGnoPR9alsdUom_ToXVsYJ5oA7hasQx
X-Proofpoint-ORIG-GUID: vVGnoPR9alsdUom_ToXVsYJ5oA7hasQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Changes since v1:
	- reordered patches for build failure fixes.
	- fixed typo on mt8173 patch.

Srinivas Kandagatla (2):
  ASoC: mt8173-max98090: use standard callback to set jack
  ASoC: codecs: max98090: use component set_jack callback

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.47.3

