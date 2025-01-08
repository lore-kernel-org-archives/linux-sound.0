Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3B80604;
	Wed,  8 Jan 2025 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356295; cv=none; b=TQDu4BsDzOYgvxzOJRlf6Jx4kvhd4iN3qNIp1xn128jCqXxix1LMkcKbUe2y3uO1L3Wgy3Z0SITa3z0WaMMGJlxLASQsLB6qpD7vjsGbWT2ppQ5rn/1A6L0jX9hsCXDAp//8ion6OqhFKkGq79CTAXuB5gFLUiU30tDfo0lzFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356295; c=relaxed/simple;
	bh=K8BKEsPwZfVtQ1cYfoZqbIL5ZMAioRFKM4YuvfrG6Oc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2TY9yV0oZEKsR1KlbMzlSyGEj/pnPpk4YgDxC3Jwyb6L+2+GYHyKqHQt9e8P2yf5IqHr+qG29+JXu+OmC28EXJpfamiGkRmYcPGqcSdbqKBk1OewCu7oDk0kqbOaIfm4tHJuQgaz5PV3W9r8Ph7HCcABp1Pb7zLzb0HM8koJ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eCkRzKDH; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eCkRzKDH"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GBctD015647;
	Wed, 8 Jan 2025 18:11:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1xH1hRPovKqSjZCOM05XbpqMkFeQvHRRRSV7ye98WJk=; b=eCkRzKDHQmTSkL6x
	tjXQKiNII+Xdy8dmUwDd7miDNlaSkgryxhkARMPA5Ch7uxR8FP1SKqlZC8IkQ2vi
	jFjTjf5Enjb0bav3/TqFbFhZlb/7oMaJiEhlaRlMwWpywcqKzJ3p/co8FDDEqSbr
	stv9/NXo/RzGnt8Xmtt3PxL/laq2DGuwF51UbcbT7cWUlRKNpJdGbe31PAUkmFJz
	8CTvKXidy/w/ce8T4wIHKDEmTmHpQZHYTm6O+V6wdDjndCpwWhiUH/HexX1a226k
	BDQ+5hHOLxZJuiQRJQOdoPsWHpBLfmuWmcXUE8LThXURYMyfhORJkFEtQwDpAPgk
	Im7ayA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441vnw06vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 18:11:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F081C40070;
	Wed,  8 Jan 2025 18:10:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D41CC28EFA3;
	Wed,  8 Jan 2025 18:04:09 +0100 (CET)
Received: from localhost (10.252.9.41) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 18:04:09 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] ASoC: hdmi-codec: allow to refine formats actually supported
Date: Wed, 8 Jan 2025 18:03:55 +0100
Message-ID: <20250108170356.413063-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108170356.413063-1-olivier.moysan@foss.st.com>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Currently the hdmi-codec driver registers all the formats that are
allowed on the I2S bus. Add i2s_formats field to codec data, to allow
the hdmi codec client to refine the list of the audio I2S formats
actually supported.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 include/sound/hdmi-codec.h    | 1 +
 sound/soc/codecs/hdmi-codec.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f..a65da989dab1 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -122,6 +122,7 @@ struct hdmi_codec_ops {
 /* HDMI codec initalization data */
 struct hdmi_codec_pdata {
 	const struct hdmi_codec_ops *ops;
+	u64 i2s_formats;
 	uint i2s:1;
 	uint no_i2s_playback:1;
 	uint no_i2s_capture:1;
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f..3f9dfdbc693e 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -1077,6 +1077,10 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	if (hcd->i2s) {
 		daidrv[i] = hdmi_i2s_dai;
 		daidrv[i].playback.channels_max = hcd->max_i2s_channels;
+		if (hcd->i2s_formats) {
+			daidrv[i].playback.formats = hcd->i2s_formats;
+			daidrv[i].capture.formats = hcd->i2s_formats;
+		}
 		if (hcd->no_i2s_playback)
 			memset(&daidrv[i].playback, 0,
 			       sizeof(daidrv[i].playback));
-- 
2.25.1

