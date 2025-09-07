Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37BD261B94
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244132; cv=none; b=n787XNs4h9SUaunc8gmwr1mHWGu6cmOM8fyJ/Hw3W6n7TRRT4uZ3Kibq0maj+xkJ6ib2QbTPTFBSXx+JXUOc47ubmTdNTqLaNirNF/IcjQRHoY+tGQcTRC0x17x6GWevleaehIUsJnK/M4mjq+e88SrbWAyvFS0mfwsqi2rXg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244132; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSZZkIp9JqPdpMGRFoQAhHohKdY0nETVdlD+rMup+pLSRWm8FRoPuvAUWRVB1SC+xs4eJTvQh65Pva94WKzSt3M3hNzkrm2yrefRAnZVRs6z6alQkhoxlBZzk3OOLclsYW4QqebTbdiKhC1Z5X9YIMsKTT7HFHnjJz/HJfKu7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxQjU3cx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxQjU3cx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879wqgd008658
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=mxQjU3cx8An1ObgxEPZzbocnk+9
	Oj3RVCNniYEa1ivUnPnPUffN38fbzLkxuYaAv0Y66lzdTKG13vBjq10yQxgj5NHR
	Zy5A4xrtsrGpyZUf0DlMJBBsyhdVnzTOkPGNHhBdcogpHRBW/vtM4y0PDtFtltj4
	26MGOF5u8VAyCkRrJ9kXOtGqa30OLPTWU5NmOjyCELzazATZkfFwQuKdhBJ1b8Rg
	4dEN1X/km4GBQOm6AkhsdgoxcxE9m9G0PWmhQwdb3rp0c6VpOndn7AEtgucmLfS9
	vKOjc3NhNL7UmjGGCD7vhC5GJzpvJa/B/Jdc66tu/nDT9vVSEKGvV1ywHXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0j165-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e972eso76861856d6.3
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244129; x=1757848929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=tc8Wrjj71Ekk9Mhj5T4skqiyssnfB/T3lXvRsgqakdXyIqZPiF+u1YYFOM1yrzyFmM
         mlv0jMin9J77yHr3QYhmXUHS/fVzQe47Qmt4n70ZP5mBTobS9zaAzZ/NVwrCMonRUl1V
         VXi1L3mccai0HSDsM7He4y9SbwE7cdYh1KtJMnwKFMtu+/zPGNge0X9IBvloCezXCyl+
         AOLt4JC8JdUVhv++ISobiO5sWndSqtmtVFMXcizk0u01i1BbQYkiqw6oYXFqcLnaNcU6
         FDU38UpfcdtfCvzuvTO5IVOKXO3KEYfzYPJf/QcZGLCMIKyitvF3nTm7mSVw1moekCQr
         VukQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp7OXoPuNUDh2YqOCKZw2f/bpx6caRc4cdejP+M8de3XcV8S0CZi7NJnGKLZFOec0i8SjSv/IA4InjZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrTs5nlZv4asv7MhvbgU8yCJfGiZ7o3Y2D5RqAvnD09Q5NMn8
	aYQJ5+ipj7laeBhEv/fanGNPjM1UItYls4RHar8m4bikYAvT7E00QxF7c512Kilv51n4cZ7kn9R
	mRsGfcGLo+5gOymEt0lSukHTfbPLDIF4zUSUvxnqYnHOMpcXNvtgKjo1NB/yzhYXr8g==
X-Gm-Gg: ASbGncvsgfWTRUXMS38ShWgxEGsK/e5P7XhCRIhUZvF0mvPfIWmG/b8aiIP4M3w4Noi
	r8LIhlBboS3EGaVFIAwtQ0qabmnctb88VCPiqkwbJYuJc85S/iAZQxEozIPKYxlxitWLbR0PgRN
	SDiTXueVGTSIV/pziJxZ48KC19szKqZc0B+fPJp8vWcgRGg8yNBQ6IeEfpxk7y7YIKfcA+4t2wq
	Ii5pauT7cUeq0UZy8uSGAch/+T+XHzOhXsithMSGAnZbvpEqZJGBzetggqmEPp1PoKqeVVyDniP
	DF/bsaz/R4pxG2K967eh7M83uzojKWawBTFdjcUSjoTMHiVenXgVPA==
X-Received: by 2002:a05:6214:130f:b0:714:91a:d51f with SMTP id 6a1803df08f44-739256bd593mr43052276d6.24.1757244128853;
        Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRpvo/Ktz++VChqT9BQI0Si6kH1RlxX9IjInFSxnzwqxbCy6DtJu9h6HVvqTLkMEe+8BXEuQ==
X-Received: by 2002:a05:6214:130f:b0:714:91a:d51f with SMTP id 6a1803df08f44-739256bd593mr43052066d6.24.1757244128341;
        Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 03/13] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Sun,  7 Sep 2025 12:21:50 +0100
Message-ID: <20250907112201.259405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WCarMFwtN3x592oe9QufKvP0_WnGYE3X
X-Proofpoint-GUID: WCarMFwtN3x592oe9QufKvP0_WnGYE3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX30iECVxPfzss
 SrDXtRz+RK5TN9ECXMCsuUKBX9yo/02wWvL+zPwRKOQQ5ZA8/5G49LSkeJWCT0gJDk42dI+6xj/
 FiCJnbxG0Y9QRoSuM5aOeDNRHWlGri535lqAKyBKsmI7tGThtdZtiVgkMyvIPzkmFqKsgwdjR/a
 QJ5ATEiKI9IB9jvEoEh2ksHScPgxc/kTawRvMBoVDyR7mqJ4ZiuIjXFiDU5mxdrvNTSc8z8oq0z
 tpftcPMY8522gFREBzw6neobBoT2UC4YQ2c833waSnxYTuLeBb1nSOpACs+grVXYNh7ZR9w8zYP
 //CMA4VxUDiVzowlNvvD5+VuWORsacMmIU+v7kXK6hZh22sJ/VO+2qWOEgDph2BG0F/xr7Y9N6r
 Dq5+f3bH
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bd6ae1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
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
index 0832776262ac..096213956d31 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -19,6 +19,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1086,6 +1087,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1119,6 +1122,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
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
2.50.0

