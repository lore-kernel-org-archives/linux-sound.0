Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8937F8A5
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771014; cv=none; b=nvqLXVbL5Nv0i47TBiS2Jf6XIo3akVrQep96qw3smdAEbAAJXlt3wuSQbJTCvJAHMWO5JaC7Wk0NLq8GDsx92DVR4SPCO7v9LrnR4FoK16PZQqEzf5YakipOxkiZFHLorW3TacNHNmOACKm1rkdaXQfcuJmQNOTTva2Wr2j/Ryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771014; c=relaxed/simple;
	bh=Rq23IoFWX7EQxMTl5scB6h6+QW6hgRVV775/hf53rnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PW3GBes7cNPCUOKBcCPshppidK1UgbVapo7I7mZy/vqgNJeWp8NdIBXJMbZaoEpxQITeiWUr2KD079YuxQxUcSq/Mf0x72JWmn0zQN88vOnD4rCNeF/nvNMOcJNROakWmDPQJojTDQAS14bQPzGRREQVKDAN2RHGkHpbwdd21lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbxDlzbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNblhxo8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbxDlzbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNblhxo8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDxWXk2907348
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dwz1filTydJcwYvqR1ElYizbYgP9i0LAkXF
	SGd7oFr4=; b=YbxDlzbFctvA+5fmPjWGzxaNppBZ0GvZCNA4nwsTLcuTaFES21r
	Nj5MrV86xYWbEZm4mKLYkZ01wsNXRDmPG7XMh2C6PPelT4RvNUB9J7msVDoyrZuO
	luJXkP7gB7nVu7R1yqtyV0CbhAS3ywohQEzmm0ODn3JDeinyMXhq6s9Gm3KNPXiE
	o3zbCft7mor3EquyeCB+2ryyjYh0TlZVv/4R3Kqb2BwLp8HhT29fQmtywyCMdf7Z
	YVUXwBU2m+O7V10s9uir0vde2MHKvXBcBpHp+HSxZjN+YTFQZg0EsTClCoOBf4jg
	pnHcA6xaNOFNux1KKJILTkgvkNCRgtA4OvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxjem7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 18:10:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so3809116485a.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773771011; x=1774375811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwz1filTydJcwYvqR1ElYizbYgP9i0LAkXFSGd7oFr4=;
        b=aNblhxo84Y39pUllAt/HYwxL+awI2DKAitDcl9NpXeeYORZ2d0JohYwX30Lh66CLx8
         LNfFi5Loy920mUuSQnUjy3FMi4qblbqbo8q08T5kHbmoYn+jCTv/pBCFEhadg1sxcJ2u
         34x5DIx6YY8dRbI/jZAP2l9uXtwgHHHw+sRZ6kIWFpZqvl8/UIw30idjkX7/hhZGXIWf
         kp1wCUsnd5IoxWcQliQr13FB6naAAA9TXVhWcpxabaDEXrEh8gEBA7D7XeXYr20w3wt/
         SCnX55EVZTfCUuQ8bkASq9tKRIJmIlcew0/wCyYxIqUnq5QdTqtnDaqxW+4rkaok38Pa
         fljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773771011; x=1774375811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwz1filTydJcwYvqR1ElYizbYgP9i0LAkXFSGd7oFr4=;
        b=HWzVtNvICz3/74j6ujlZNguxWDhBRkNPJDCxSTFPapUlnBrk1sZzHEEgk3i0YmyTMG
         qlNJD5gW255Vhc9lyNZK8nkAt1qHQ7ZvSL5+zIotiEo/XKk0p9Fd98l8p1KGkcIm45e3
         yVm/L63OqfyG3wDGsRm9Vsjbq0swrKtO72qCZ5NoLa3SbJ4+9HtAtQsPvPMoyxliLeaj
         ZCMIJCLevIVei8pKu0ojaUITsGuilmSWUL/AzjW1rCr4teBcdHtnhUF4oFaTENRuhsx5
         TV/yLGmk/NEcWCVoXtfVeScsTBEF+b7cGBRCfkLMSWbcH6Fqi0u6bGFiIbwf7Xix1h8S
         CYTw==
X-Forwarded-Encrypted: i=1; AJvYcCV3S8IG60xuuWvlcbffdQYmZuTnRhuInBGjjUCH3SINxaWWnpHZZVQzM4G5NO2H839lIwcUIKgTS0zEFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDL2VebQkxU+d8mLXhnAP8QIpAJp58+GpaEa8jHq9sqGSpC/OI
	KKTSd6wq0xik+Zb36/VBBxJQwyHRYYC+s9wnE6OHzRXZJen790hZp2TmVTw+R5/TfBcUF9liX3s
	4y8gwqWnKmJsgOsMGd2D15V8IVz1vYi3FLxYXEJ6dHPb/QUe+HDz0MvJ0cuXTXYG92g==
X-Gm-Gg: ATEYQzyODExS1Vfr5RqWy3cbSUYIvSjmLX0TWhg2E7d3IDIe3TgJWEjlbYYbMjDfFry
	7EHPmXJZHR5xNThWz7J7wZ+URfnjmhBlvEYDGS3z2/UxzcyxOO3lhJRDh4pJnEhmFMyxoJNGqm6
	ZZzPbknHKHUpr3b6VPyZMMhMTcToHJPa7a/EopPNVoPUepIoQRmoAaVrYt/mw2HcXNg+dzKYQg/
	A0KBakoHYESls8O8zaJufPJcDnxmdaAgsWijkI/vWSlpn6WUBL/SsvXbgtgDqGzBNvMW/IZl+4e
	KC3p8inAmARsUaD7RP85NEXtNTeAjI7KzySTawWmochmWpoO9+yIFek+DyTBgcieD0oVn5S1cQz
	LzedK+OsftOMu0a4BVfEwXusf3qwWp8rzm0j78Tfs99CqLXkiuA==
X-Received: by 2002:a05:620a:1a17:b0:8cd:c597:baaa with SMTP id af79cd13be357-8cfad1ff305mr78461785a.15.1773771010787;
        Tue, 17 Mar 2026 11:10:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8cd:c597:baaa with SMTP id af79cd13be357-8cfad1ff305mr78452085a.15.1773771009913;
        Tue, 17 Mar 2026 11:10:09 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm70339255e9.10.2026.03.17.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:10:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: perex@perex.cz
Cc: Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Wesley Cheng <quic_wcheng@quicinc.com>,
        Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
        linux-sound@vger.kernel.org (open list:SOUND),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: usb-audio: qcom: Fix the license marking
Date: Tue, 17 Mar 2026 19:09:38 +0100
Message-ID: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x_4paCcccmXy1FwEyPIWoL7GNAd4a6QW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1OSBTYWx0ZWRfX5XYVrLfkzfR7
 esTFoWmXKGRcjHj1dRpmGxNzSSEQROCvzO9g1MHplPMI9nmr+IU/2UAJcQ5TtEeEMhcflB1UOf7
 Ms0RDrS0BOYjBsonpZMB8yds9AMfMEX3/HM35XhuW0ljFIesxuF062R19ri2YvdZ8YVhhwRHJXg
 Z/hJ/4+eZPXISWdjuwCKzK/Hv2IARZ5+IC4uYcSgq539Ja2llKKhfNuMYcVS6TyvLeOqkzNGoKl
 bbzRuWbY5AG1MwTEsTb/Od0Ssd/wNtS18onBpR6FMy1+MIbq8yurfKemLeun3ej2+XDtXYt7iri
 EvUfs1Ir3nVEKiRDGdOaRzmi1wKgr0yXmS7zrU/DfXZQCGYt9Jz9ghG2hfp4PWUobW4DkAS7Weq
 o3G2489l7qyWPsMIdYdqX5IQ37NDvOnqL5wtIUEqMUvkSMkcnr0QLcD8XKXcHFWfDZKlLsZT+XI
 Jb8IwCnj9u5voL3nYEA==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b99904 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=PqXUtTvMmDZuLlqGZzkA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: x_4paCcccmXy1FwEyPIWoL7GNAd4a6QW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170159

The Copyright for Qualcomm changed its format and replaces the old
Qualcomm Innovative Center by Qualcomm Technology Inc.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index bc4e1bdacaa8..121d08fd60fa 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/auxiliary_bus.h>
-- 
2.43.0

