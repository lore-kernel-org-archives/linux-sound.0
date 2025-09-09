Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C232C31A
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420425; cv=none; b=XfIb7W5GQqaV5va0CtQdHm8drmmU7/6KWY+169Igmu7NqSoYhRBTknSgwKQ4tfzjTZeF7gKC23Ji+m/IwV2rfZPdZIA1G/b0ZluzoeOHVVldwUQBkujXLm4GU5jW1EjHLxGEgLNgSgBc5N7TyobwR/06BxKIYTgqAzbA0cSdRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420425; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJZ3gqQe4yrcPhcWCvT/BP01oL73LwSjvdDvByBttwlXqKMtnsSmDeU6Fxo/vTaJTi8QESh1RaC80gdfKXLG2NICQizIjA+C6cgC8ni4rcqZH2LdcMUBsvY4ikRsuOS0thTm3au0xrrri/2/WuSke0XX1FWMbwrhHDv/vX72Fak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMBoPEsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMBoPEsm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LT6o031521
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=cMBoPEsmAFFrrm0sbsp0/N3EoPw
	2IvyyE3aYjSUDBhI3GlJB5IgMm/62fZv46xxXSUIC5FWQYwraH5j0HBlAXwl1oNN
	oJdw1SeWElzNxO7PQ3U4mRFhz2e6QTHiP3/qjDdEghLwiMNO6tPIfBCQTpBiRD7P
	jKQF8u2PGh/a3glyvl6E0dgAVYbI5XFSmewIEwlHwmL5b724IdHlueolVsJI1KzQ
	HvViujHBx3ehab5Dmqj653pTdRrKtT5OkrdCFwMiNEgJC81RBnyeJSOrcW6+xJnz
	BQtEOBtfx/Bihg/4GHe4un3jCiRS1K94o+vmkigX6ulSrU5XBxfl/B44n6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws890u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3aac677e1so50665361cf.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420422; x=1758025222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=cw+SMD2DsAU3uslK0GsDzTGFYNwFgywfbqMweHoGqNsJuZwR+U4hzZjj9Ufux2KAWx
         lYCNSQxVeAXHv4S001QcUf7Vu1ZQWMNtq2KSgYzxhQoHk8FiD7r+rlUS9yzSzhODWN9b
         Dt4RqWfJkI0/mK67+XnNTMlmexdJzP/TMDgqY/dQNTMG/aUR1EMOfdVCCXrhQJt375aH
         K0ATYsD6HGjZbDP/QgtPOAlaD1qqOOVHlVuR7mXCh5haV+ocxOhvyz4i3LqWRZcswDxW
         Wd2u5msLZgb3htcnlsZm6mYw6+yB7+iIzItM/2V5lG4XFcokYCwhCQ3XLckUQtl6BLfW
         W7bw==
X-Forwarded-Encrypted: i=1; AJvYcCVPNAN1f51qqVioR9a7UewnLWISW228JhlJXTB+Ih8Q29KRa0v5OG7YepTiGj7ftb9Oo4AVjJM0OSNriA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzocch4tPSkgTJwuHUe2VAh8ZolJdhQrRE1tuq0M6/CRshupZAF
	ZTzPcwG+TMmUz1AYchu1rSftAmcI6EgG84JAN+/kUaPNZ4nLjkA8lc7mPwrvQ4JDAY4GXoRopua
	XlvUxcjoifx9HGJF1O1wLvxHJB0cuTiBZxeMMh3OAfPSi+geSoWhpP5Urgt95mqH8aA==
X-Gm-Gg: ASbGncuHbNOcRBWem4XILHh5uS/+JXFcOLyqMUSRfAEv6ma+ZwDlJfBQb+/HCbKs8HR
	exarXsQSeGrIpiy5fkC6jP9EKK0pGxE5Tun/Ebel/x/CV2WLH8OhXYCSkxOfXuqLVDT+6wZJGup
	A/Odj3PU8r/XNpnFTls1o+06oNmKYzESAQ2O1dUBSRfl3ge5WTM78L4cPJOariCit/SzUcCBbuY
	TCyQc0fwGKaEEGNgknRNbWwJ5oMP5HUiLxC4gsXcJuwdMRGiKFOMSyU+wg+qaXThkvJuwCdNRPJ
	oDZcfhtGRFijOmwpGeLuBND0eMxA1V/Osmaxl5FcNhzIpYBQsp8ajQ==
X-Received: by 2002:ad4:5f4e:0:b0:70d:fcaf:e76d with SMTP id 6a1803df08f44-73940035b50mr145175586d6.31.1757420421770;
        Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr8d1koaoi/dwZkFJYZO1phqDXAgj+fx4Vh5IgV9S1JEkZsTrG8xXVKjuxZnSjq6DxTm+Z9g==
X-Received: by 2002:ad4:5f4e:0:b0:70d:fcaf:e76d with SMTP id 6a1803df08f44-73940035b50mr145175126d6.31.1757420421222;
        Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 04/13] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Tue,  9 Sep 2025 13:19:45 +0100
Message-ID: <20250909121954.225833-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DZ9ZX6VenCvxrYCxMKOJ5vnqwTMdi9vW
X-Proofpoint-GUID: DZ9ZX6VenCvxrYCxMKOJ5vnqwTMdi9vW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0fmrdqc/c5dc
 D6LiG20u7DXyT1+yZa1zy2iUjD47+7Jqb4zfC4tvZx+5cCpJ0RVpMKRGtPPVVpWwL18/mBHZfSZ
 m963v1uRr+n+lnGLuhzYXZopjiCqEfZSANp2W20KfpBif4V2Tf8hk9TJDXMRlx0bFMXIl1oJoQ9
 lv+a6J720ZMBj2AhwRUaoHUG0EDQk6KUk15i4wj4mDGzh6IFgjWnHkQyI0iN06eLDwyEALVvq64
 AOJbzwiCcyeBUhiMgVhAWORF07Tf9ks5m8A3JN2MBPuelap1cLR0NN4CMJuzC0wHmxo/9L6DbD1
 4Peew9wmnS/5z2sUwDgfBcWec4MR8sofveM9YovqgAjPPlRwZstr+PFQoKnYnp5HYvmF6NJQU/W
 lc/TLdYk
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c01b87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
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
2.50.0

