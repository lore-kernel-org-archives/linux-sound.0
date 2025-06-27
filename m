Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978A2E9EBD
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039500; cv=none; b=M5QMLm/32BgkS01SKzivWGcmXmA0QEYvblMQhNZ6QvzU97ZCxpXdH/0cDVpDQOY68i581OW+83E7mph/zJaRG1pFaNJH1LVNEiB8r+LNiTpg+peZ7HwAqJO7u5D+yzWETLEli4Lw9Q4w7c8EYoTPd05LtUNztHNzeiCrPLtJ01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039500; c=relaxed/simple;
	bh=kosxl35EfEgbTnzpOOdVO7IGdUHdh5M6/Ni0KGZQblQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5T72NBlCJrQ/LiN91uA1Tz6JTTfJhBbcO38F0sG8Ws/FKmmBEaSSCjqzYh1cVLwVH520n60cPs0VBvEHLcXIY1wDDkD/Pv0l+1PhKE/WUtvrCL8M6gF4glxfuBEJcbTvSLDJeISnAL4v03RAWYNuvmSx3X/rpnVSS6zv2mEi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxdfPwmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxdfPwmc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMXVl011364
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0/WQwutoxYF
	O60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=; b=TxdfPwmcnWw/3KBcJ/6KY8ZcXzh
	10IxG+WOLWpnKepIgEuk6sip9xJgq5nJiCblOAE2ADmArTm76cvyvAl2Ah8qqd4m
	f7ErYgCv2YGEWmheY4cParD9AEglwY386lfrSN3vI/cNzV0Z32bX0WjeasdbX44f
	62YbIra1AzJcuqYxBMsUGXYCYjZMNqcaDJemyxjUDWWILVZbyP7XxYO4tJa8BSQg
	zwfR4MBrrw3E7dLiiaBcT2yLONQZFk5YzFzXmlwy2e+LE70dliDR1cGlL8h/3R5s
	smFXxsV4T82+Q3b82VVk87ISN6EtOGShoEei+vlzFlezujoj+5oF17p5I7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgqa06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so389362385a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039497; x=1751644297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/WQwutoxYFO60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=;
        b=op71hu/Og6o7cHrzYsWLYV5HqGjnIwIJdQsNPHhZjaQ1Foc58qApUnD4qDe6TwSk+J
         E8wjyio4w9fD278G+IRaCidrp5b8uman0oNM2whI4sk6ZtPpEllWVO8Q0tm+hRS+I+R3
         /xuHoDont+8NJ5e+zucuIAdfVURxaN7S6KhuJvWJBTlKJ9e5JKJhV8zF3H7BmGkKWToz
         FXq2yFIkzKVRK67O6f8+pNPw26VvArNaeYZJ5lySbND96ALZ1q39TJYhxhSn8SlPg8Kj
         2WJAZ9VlJ4FOHKDAHWtvNKSXu2V5/cB+bH4pzrrd7xHA5b5/tBaMojfWUspKDla5tVn0
         XJVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5OBTBbm3toCDM0/2yTTWqKnW7Ji9yKywSz6ooVkJY/KTKYJh82DMfqVJUBIpPS4JFClWz477pLiA0tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2RN4vJNwjflWa3tdCKXtEqrZEOKfulSSGegi7pwxmgzaNCrAw
	Y3r9GZOPadjf8KyeO/7Ap8vNUvBxuBaEIMWskC5Bpq8jOKpd0qivJVuh4mGOff4tqgQswx8zmng
	j/Cn4ExLEYMZpED4dcFHzjlX0vISzSLQUtDRC8joo0jbsNttuFBM02TY1P4GCw/NxNA==
X-Gm-Gg: ASbGncuHknzTfIGvFiZui64gwqV8Rgq6lUoPbEaDsLBURrCZtBeH+8oSvAdrRzjKTOC
	pKP7+sE1X7DlMw6F6eZSQv5v2+ezZRKDXl4IXShkwiUhrLt6jOBtppO5VCtnT/b1qJGzFqaZvwJ
	vICFizGhh9aPHSXkYf6NQ3o2gU6Gh24MZImApRLiBXrnLRFJhmq6V9EQP/HQ6+zntqomvEnYgKt
	gqW9wyhlogX2KLmkKsaykiGcnbgfR53vNJfnRGEfLtMG9QlQWJ/Bo8kPeJJtd2hqNSmRK7r5dIg
	oMHA3Z5VrwX68DatQp4+JV8WQHZWhj2koC035uMgyojDRL+Uskucf60=
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345773885a.37.1751039497177;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfa8s9Y0FwOhSzbrQ5pjE93rOdbio/0YW5+sByFJBn5oLIzV0LRQoYDm5jLeIJKqi4k62MAw==
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345770085a.37.1751039496536;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri, 27 Jun 2025 16:51:00 +0100
Message-ID: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M-J8u2_Lxm1zKeUVub9FUSlPnXypIQwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX8PhLfbqbWfsl
 AnvnO8o9djBc8lT41MBhfr5zrJrgoWmMaSbdSRq+7FXoE53y7Vj6YS40FWKAZmvSo30MSrgQjN9
 Ru6RodVByFZ2lWsXf1UOWQdd+DcFkrmvA79E3MmWa/jaG2QsznZe1nl3J2V3WVZgWhqOp2uyNky
 rIR+SvYlcuRKiYsfQq2KozMmFTay21seYjTp+ZuH39vG6Az8NnzjkwphofYoXstkPWE4Vbt019Z
 C6a0MpnhBl8HsVqXarxvvkTXdc5Ns21WVG7eDRUNIA+nHH+6hWQCNndMkAKYtrd2omeE3qcQoJV
 tliStSnTXcSFEH7sTUWae0diTOOC+Cj7fHG0ZY7TSq/AE+SOTm0zMHME9v4EEWYuDOmOKqMelLD
 3BWtMWG0+D42YP7uDFULVN/WtQN2eRbJzN/oM8fR8PaXDVUnQWxlVX1fDYU9RYBzh0kaJ5iD
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ebe0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bs95RrtT4r1_5-ck8vEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: M-J8u2_Lxm1zKeUVub9FUSlPnXypIQwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=900 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/slave.c     | 6 ++++++
 include/linux/soundwire/sdw.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index d2d99555ec5a..3d4d00188c26 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 	return 0;
 }
 
+struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	return bus_find_device_by_of_node(&sdw_bus_type, np);
+}
+EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
+
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2362f621d94c..84d1a101b155 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -18,6 +18,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
 	return -EINVAL;
 }
 
+static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return NULL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0

