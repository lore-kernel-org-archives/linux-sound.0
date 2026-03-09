Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6F36493E
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039113; cv=none; b=MSjyLEnarprNcSteybur9L5Gjj5VIr5UKexviNPBuvb4R2u+GtS3gLpAy4O26bXor7L9XPNoSBM/4vmnDcxWy3YizGqiKIrm24vAONc14BtLJt6FUG30s3kZiQbIgO0eL7oMA31iDAWpzqVEfBYrTLnT+/a7wnjS2vitpheI38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039113; c=relaxed/simple;
	bh=Q0wXZHoOMoTB+T690k57Jhsb7Luaf4VYpMrf8ZeVddo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Azem/wycxOJ3DDzBEe+E1dmNxiTqvQG5mVw07gYx04RQOOFhERLClrWp5D7Lh68iz1eZzzx7YzCmzWqvLDbdad2M6pnMS+S10jg/HBAfBd5PPODzmGRP4f8PxJBQkZ9f7TDP6eF/6mjcY/2i9pv+mIaezyBqQK0PBIV+fdfsyDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoJ5xzgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKVwrhK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoJ5xzgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKVwrhK+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628KVZNG2720700
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7gKUJDT6xhi
	+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=; b=DoJ5xzgARXDOCmbOBlyn/WqNXtI
	9V1JHaflc/i2CQ+jXgNhBQ8dQpFq4DTWGEOfg8RGpjC8hFlx3HTDITBCAqA1yDT1
	aI7GDhs7LqcYE3kA1UY6PO7KAch3PDgg6+2Ji6roMXobJNZyHBxPkDSFKxkBw4/s
	ZqsxfonH8KHh/BA5xfN/edQRbo5r+zgRnMhGpdV+5NTUolxdbdcz3Asr9ARz4DYO
	AZiyu0azcS54A580ip2LXswqY3w+2v9B5OS8iFluJjrhXsJqa3WW7cxDyjxpMka7
	L0oSDx/3yNGF9afcRiNzHfVWNRNfdG0s3N3srTiuI9AXB84RyHjVviuJByA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxv802-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fa82ebb9so487966226d6.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039109; x=1773643909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gKUJDT6xhi+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=;
        b=VKVwrhK+MbxVr6hIDcDyVxpRAIfvoZvKB+ztWYDJsytyfX9BF8jPlbgy7yvH1jFcFy
         wkG2bAkZKEOIpe0sg05WPvlPa6xo6ghN82fHCkO44k/KOSIIImRt2LxnHADyF1rQ5B8a
         FDrWKBt1SlI+ToJfwEq2qj1PVdWA7LF18c2JLRyZyOz8CdPOUYjO8DFMfgoWgwcqqua0
         0j7iWuy/c1vtR8MP5zCiHciNX/6SsYU28Sao1wYJ6w85Yu13qeREjPSb7V733NOLvdQJ
         27nNlTs4uEt10GAPV0vO+8cHjlCkMfoLZcKgleH/3+tUS/ebppPAafoVkTWC/Ttc/l7J
         O6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039109; x=1773643909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gKUJDT6xhi+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=;
        b=cltaQ2Vo3YYiQGhqgss7kusvsgtTbUlA1f0GZa7U6oe/2nHflulEt9S16L31+WYzys
         ZaX8witFjK0Cy2Q5nYJVH1Iq1CouK6AShl2kLTKzQcuSxsCfPNXN2/D5gxevkR4lTd2v
         nUxWm1F1pghtJQ7lohzuW0eprFRN1j7hkKiBQ6j9ZlyP2xkEPMu82n33ByYODXQEXtcK
         ry2UAunzE4G7sI6fIY4p+fgW1TsddE/bb9m+MpOamze3bXvbXbw9UxzERvjBINFkeB+i
         F4V8jHyrhg0s8IVEQ6Nx3gwKQ9mLEWuG8w4z12w4wDzqq2jmLkNpJDhfYZijDkHaxfGV
         wAmw==
X-Forwarded-Encrypted: i=1; AJvYcCWi70PaNPAeA4keWTfmciQAMWaNAJxZkY0rrxY/CU7hyLCW+0SNYmIvFF/0rlJOvPMQRdkPOGFh5aNbyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAIrgZ1JxqHVm66eXO1WHCk3jYHr+GJO8DRFe4W7nX0F/A2yj
	cHDa0UxD+kxeEIYhHgMe34IlwdS36BGfn/Np1yoo7I3GXkJrkzT0emdRgfwJRuQqHDugswMtCKq
	dAf4xMpNNx9M10FfC3KV21W7MiTObki0Mln+26YQKFQNEKdt58QiDXHk4d8tLRTNn2w==
X-Gm-Gg: ATEYQzyqy59QfXf1+GjlCiqyYb8LheuJnyocTfEFDMs8r0Cta8WQLhGdSoqHgsdm/X7
	1esmqs5dAjSFyakLk3VB0MhX5TDzteswBK4trfzehrcAxHSDhNZi5BbTGmU9vK+J1u4VZmzBN/e
	WA4ckGJ7cpJfx/lblhCL/wsIrF6c4D7KdcJbQOfYhg+A5ngmlqzgs731LSCpsvfAKOqrIyHQtVi
	GrraJoJLZprRCKD2FeaT/n/uqHcSZ4Z7XNR97DSZ3rRYmaX01uPRVgwKvVtusQk68T3HOE4y8NG
	AOT0Vf3rrgzYqwVFvZ/iKmX6bucYCK9oeHCcyd0lPll01XMyL4LszVczZchhUpb/nH8FYALARQk
	FihflhMBYB+iqBaZE6f+Rs9kNLrc6R9TW54OpD8zFhWDyXr+RzyKa/oY=
X-Received: by 2002:a05:620a:468a:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cd6d36dc9dmr1387562485a.26.1773039109388;
        Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cd6d36dc9dmr1387560285a.26.1773039108933;
        Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon,  9 Mar 2026 06:51:30 +0000
Message-ID: <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX4uJZb7SzmBO9
 NXxXhcQnqjtatRFhm8XVlU6cV8gwIqwAnhl6pev0LhVkBtl7B0HpufnAgHb+6TsbcjN0ZPFveE8
 7gyMkMRffzIXei0OGP4TSWDXg3LYYVRB4mvc0klE/rwtquvuhc1CGJmofWnXTak7dRszTY+vzes
 6rJ/JDxgJnlnRw/guxS2qXiteabmlcFnOcBGwtxwgt2xsjELjsaRb+9DeTA2pSlu8Z/QrMjfdiL
 kj1s93ebz186CJCT+e5S7oiFEHicX41QgHLXgx8tLTshLHre6AxL6Gxj/d83Ul5WfNgMYyv2ecY
 H2rWD8KFGhk4g00m6kvXlfv1mz+s+mJXjLyeTB1Y3YIMjkzdzstw1nKCyD/9n8kwHeQRvWgQYb6
 E6/UxxpMmVHXavqt95lzO2JeIWv0i78rn3eSd6a8tPGudRjfmJ+PQ20f7WZv6sqFrcYzUQZl8dj
 tvMIoCtfNlnWxKvuvQQ==
X-Proofpoint-ORIG-GUID: 5Xn_VfuGRU_Qxi3zuvktQhOcao6oRCRM
X-Proofpoint-GUID: 5Xn_VfuGRU_Qxi3zuvktQhOcao6oRCRM
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae6e05 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

