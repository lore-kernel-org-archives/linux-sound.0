Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8413314A4
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420425; cv=none; b=eb5v0j19gudNFdUNKkpHQkKowP08RHquOFXEdWfBo3xvctvLpDJ+C9r+nNavwR8MZWFitbXCnIwSxmliZVx1z2e02QXSUqclRKUaqENRyyFtGov5RKMTF+/PnlQOwF8NpUavk78XU3w11+tW2cyRYPG+TOGZ/06rIE5OxAfxxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420425; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0rKtDODsF6nG+NAcfeuQtYxSMQx8NFm0P6/r6yNaq+r8rYwNaEQOwXM6Vv+jhgpL7FjYDuFk5pTrxNjaHSkzYHDfd3IMqgwcmmD3EnJaXIQNCdGmKy6W/scCf4LXbHbRPm7TfpIjqfNdxxYrdvmZ1pfpPL0iwKRUJMKPp0uwuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFM/HQRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFM/HQRW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lah8020203
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=VFM/HQRWMGJdywAHGJTpi37ZUr9
	6meXcoZgtWvYwi5ck7swsNxf3AZaVugO3EHoFlgoGv/iM+DOWME9hCPZRXSg2gl9
	O1hDLDNxGw2WrTh5oRZUtL3TCAkyOd5ZfNLGjjyVidyDEpIDvzBzkriKOQxK5IL9
	rsSoYGuel9Y+UpRJ6DGJGDNNiSTj6szr08lHgIVSybEjdf8jd9bSou+T+w7lDprB
	sda2DiMeYnfnQzhV0Xczt01kzbqLH8LT3eH3yXKYhcWIW0IXz2QT0HX1V7WPyfLs
	GUJPLwC8I7qIjnAGkVc8p8qxRHIP+jSuImfFy0/ShOxc/4Vfc7fjA7cm1dg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc246gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b345aff439so153855201cf.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420422; x=1758025222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=VvpHaRnw5DoXxlE+FyvoML59v2u4S0BWMwcScR4mBpp66vXn3NnXdjFWxdGnIgmMyZ
         Ro3W7BLt80uzPTngRZpfOg3LpyBgexPZO5z051w8ByTmZD2StxzUBBRjlBteMLS3cy5W
         NHlp8J9Dj/VxsKYaXhkRmvp3lXcWbGsEWjiqOUi6LDyu5pmJle4EDpxCM/OgaECyHi9i
         YxpFg/HP6CC8rw/SIBBXkl4U3D9XTJLe3dsRjURb2Y+PTcEsoZykzWzAz2zn+fvn4fXQ
         wNfgFFLxNUw6XeU7IrkYmdGkXOcLAH98VaEtJ0TTZWYMYOXLaVjV5yKWbYilCAXIQEju
         e2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2KvFMjagh5DBVu3noJeCScqPdBLRPGvOMc3pE5qfA9w1FR6Exc4uA4xzAWgkP4xvLbuUx7FLjDVyQQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVqsK0fjVHtq7wTsHRfeAZPi3OwJ87jNq2vN0SMMoCiWA0AUW
	S2r/6Y/ajUIj4ci3yuXd0gvTrWxOWPjQtC2oT5FYOY3+IBYgDlcXuUmSMYJSyo9Womoh3mwHogf
	aWkHQ44fJ05ljtjQO0I5i6dP6Iky/zOvSVFoX5oqAnrkju1Jbuk7OiMGmk6/Ytzjnxg==
X-Gm-Gg: ASbGncsAlAob/tcKPjeh/x2brZFERNRawQwQitWGGl0Xs9cnKddFVauLQGnM0zoEY5W
	XpeEo6/Zu78zDCOqqPxnBSGuRslENzJEFES9XEgWYdn4u22rSRmG17nr29ga5RKFAZ03ekveJNy
	w9UbQHU5qOX4Sv8bkm1KULpIpt7XfXHI7O+3lD5oA5YV/OgsUGxWXKyLZKUKvBHb7t6V73/38RE
	TseeVM+vksz2Hzxd1BOxd3vrJG7/sQ8M+tJYhDjzx+P33tXhCQe6o6zdOIu9Y+/oOSg8RNTHUR+
	7lkIzSOaeRx/Q0hIUctFtYo1ROTqhAra74jP/VmsRPjlSxp+FxIhlg==
X-Received: by 2002:a05:622a:1207:b0:4b5:e344:2238 with SMTP id d75a77b69052e-4b5f84854a5mr122850961cf.66.1757420420930;
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoY0xoETxBaCFi7Ptq14Jrth0iFyOEnu4PH9NM0c/GGJJIt5VqKgJPg30ywYGkxPCWm/D3w==
X-Received: by 2002:a05:622a:1207:b0:4b5:e344:2238 with SMTP id d75a77b69052e-4b5f84854a5mr122850571cf.66.1757420420197;
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 03/13] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Tue,  9 Sep 2025 13:19:44 +0100
Message-ID: <20250909121954.225833-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c01b87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BrEWd98EV99UFbr1HRLLpJO62THWDle4
X-Proofpoint-GUID: BrEWd98EV99UFbr1HRLLpJO62THWDle4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX/r9dfqFuu97a
 DDcSZRcBIU+xcK8QG/ekdQDbb1JKX1nDn/uV6uKzZPWVS1RH3J5sNifR+nWgebvrTYonfVncCCM
 iK50gwu2WnXjRzRuGVBzdnYh4Aj7fxLTrYvyTSnOMLo0iMJ9VsGroZNcEachw0zVi331U6dkfZB
 LFnc9JEE9k4gEWhjwo/dFN0rh10sbV3Tbhyp8NiyCJCjwHtAaw7tzCsA4rfAZor8obHVHr0SM4s
 dK1cd3TsK/9SK4bfzfx07TzW7dpsplBmn09Co6aew+C83/maaN73aZMD0BRX5vZgv0mEcKZRhB6
 d0zA+dwWa6sZFHcn6CtcsLbS9/OGzMeqWYYY0nrdC7oTKbQ0V8q5IfnsGQJRd6J6CQk1Kkfjifm
 qZjYa8In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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

