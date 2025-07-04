Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359772D6400
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631163; cv=none; b=QvLaG2+Cl+Yl+kCupx5Gph0MONaKTu1V6sHGOswqAOE9PNjljSs+5oJju30oTCAHLS4aBF2XBtNjzbhyeudvHjL7ng9BMfdZVLkHc6i4L3JZwzNSzrc+FkgkmsYHAfF1YDHR3BZG7haGH4fGBDiPyAZ5i+nfbTxYqUzQ83/hJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631163; c=relaxed/simple;
	bh=RWcMcENuzadS5pKo+gf9BqH0aTezwUdBlEwlff9kRkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCwm4UthlBDMOcJ5RO4biQe2EeU0KthY2Xn74s3BttXL2X5jd9zgzniInH55w3eospg7fXPI//VqVnxPiy8gji2fXAVh/Uin9KdOL3LZjA9iazz1heS7KdCm8dm41oNB89mIYL2hnvi8Eq51ixgH/ZZeTQCQYioA/IlnYHd/Bnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vz94Nr3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vz94Nr3d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647wgcv000442
	for <linux-sound@vger.kernel.org>; Fri, 4 Jul 2025 12:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LR3fVYUOH7o
	ec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=; b=Vz94Nr3dXhZ1V0u1N7LN6CBomqh
	tKLc7oBFCZspB4OUD0OC5iWwTtd+Fxy4mEr4niwdvKy0wjx/03v0Vnv0aNvHdVsT
	hgmzK6LUZ8pEnLVl0+5L0vVtFjXvnqEUwhXoUkmjSw0j/KOysR77VE0JsbNpOyrm
	SRuneknDB8ZpcCkxcHHDod1Ypdvl3pk4BlB718HEgGWy/PZ1Syh+3StyLVL0yWx4
	lMaNB0uzF4m4DZcQiYGqH0gW9O6epq5kClgztOwUeY1IHkRQDR1RauzNCZkoCqHH
	WQ5KoZ7770HS2lBOu9QT9SYw2qXK7GZBvtUE7HU0/tDmqMUibPocwb9sujw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmkq7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 12:12:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399065d55so107457885a.1
        for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 05:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631160; x=1752235960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR3fVYUOH7oec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=;
        b=wiHrl9HWfN8e6pBxNKootuPqGyRgJgCJ0Vn/4ZnhptejVRgIP8np7wBWtHkNZ/hpxv
         4B/Rjy6qqEQ7LuxGh656RDmxZLSUod1Uq6ayNGt28v/xNGTpx2Lj1MNUBcKFJ9bu2/IF
         SWwVhsBas+7FH8Xm9CTeN4zTl92rpqfQpwfQDF+Yy2f25px4LPf6AceOT+xgUAcj6yOw
         SX3C7pbgAFox/RhXSHyWgrwLcfB6d4rvT9O2Qk/31/L1ymYudjyeI/CVnVbvGWeqOLHa
         ckH1bNx0XjHUYBM2GyuDuhmUCsb2EjF+LT8fM8JgkgMOaDsBKks0C804NtYAuIKN+uoX
         l7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoAQwIQekOjrL6iATBLpjv4KCje+G7GBd6hzy2Tg1Hkq2EHllAPZcEehJUtMENTXvDvLdRbIukiQavaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFqAORGQonFFXqe4gNyAO5cdbiHV+DrBApK7+uB5i06Z0MCvi
	WEV4uYcHLUaSbZfXD4wFiFAJIg36JiAjgORvY6YEmUPu5JI1ZtmRwFrhoA58bJ7vkkY5IkzJJMJ
	GFK8s65QwERmmjQA3EwrRUhJ4zOdXgqONaOebIoNiRGstEdT+VfZ8Y70sdhsz/93LUQ==
X-Gm-Gg: ASbGncsFERqGITtAt6tasYa9CFs7YvKCc6Kh1FLuL9sodoqIPXDYBNpC+cll5T2jDOu
	c+dAMtLQy+TN34p6fl5HRC42cYcn7KBcNd7/kN13ftrkw3vnWURQ6OZbxOul50w9EzgyywCmjHB
	ctY17dBqpsn9BiI0iiRkPmBsWmUEknwoQaW7dpIu18GyF3H85ifKVSYChou991kxKAXMk3Jtqyj
	RztUdhKqMl/7534X5x/ZCkDuU3eZx1dDj7uvBKvt+YI3uZpqK10hp6zEaEQ4XtOJ4dULLwQM1zm
	WXCSDG1OzJpQKcRsUAiuhKoyTIZvJr1PhsXZUdUclWojSVRu6uiBge8=
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297333185a.13.1751631160191;
        Fri, 04 Jul 2025 05:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzjkILAwypMIZUshaZVGJonIlhgRWDFAm9d5sNhdyHQ5r3X/FUqOT+lCNh7XuKnxet9HlSNA==
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297329385a.13.1751631159751;
        Fri, 04 Jul 2025 05:12:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri,  4 Jul 2025 13:12:16 +0100
Message-ID: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867c539 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5yJi6icZGLWWZlQ1xXuOMRZS0htMdB_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX+YllpBVOfX/V
 L0X5j79If1KrZonEXxwSi9G8kXfL8FMtJRcEHxeVTrN7/XNQoMM1qBgLXw916YMP+xWdAnj2Pz1
 Nf27oJ5WiHjB4W5v2hha9GVOid5xg8jT3lr/hvhxFEm8WjLRbjvX/2UosM9xsy/58IkYx6GJ935
 veWwMcZgqWkalKfpCpoYeB6ds39fihxHyUM2RkLDH93QRl3LNL2F4Fi7NfpthoWAh+GbgMR+cfU
 +rkcKw4wusz92ToTeFIZBu3bOgXoHQv99qXAGGYIhIi6VHHxarvNp2SYLIY1QmGYPU7QdlW4wkm
 HADBvmQi7c0ze5KvlttaUnLNPm9eljNS53ikyd6I9OiIMqFWa4pXLDcCoGa1xfE1tUmH52iyI9w
 1yUkyh7G6hfeUv1fiV2KT8x/4Ip5nEb6b7OklcINh7xlEJYxNe1O5re8uteEOrXeXcJBAi0n
X-Proofpoint-GUID: 5yJi6icZGLWWZlQ1xXuOMRZS0htMdB_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=838
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0

