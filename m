Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A11302150
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087082; cv=none; b=mZOZajVzpORFlfxkJtsfZWaovV0iAH7JM0HyfdmITrMQCQDsOVWga4keL8TElNodaot6yMxDso+HE7moL6qDusQeFub/n830xc9tfm272vugZzsNCaUo1kF5p7tv2NuXlK3/jetTdXBaGyTfWvcmMPRZoDmgU7bCa7u3C7BZ+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087082; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScH9TKZQ5vAXofviV47ygsujVkVraGzrOAT7SGeNgfVQzpUOwPJnqOVh1IBUd2z8AU8VN8fOGGJ60leoPat1ZL//t+IScZp1hoILd38S/4OdpLnmxJ9vBvgFdrfHghP32z1obKH9ELmhl36aq513/1tTnUwEqMYHcqqWFR7bweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv8zdK9a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv8zdK9a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585792N8008152
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=Vv8zdK9avO0Ifm+uuve/qJ56e7R
	NmudbvEYiA1ytla4nPHVQw6SCsmv6Nsf/f9O+n5iXsQRtVEEupgM1pGbP8kJtbTi
	BVUEaAnWafn7ibu79IWvKiQHi+FyuGjAfAdKyDhQkPJXhLQKejwGeTVO6Pc314EB
	nm6piuQFIRikG2adf9PCf9hbKuiys4yzMWamOAIkPODkvU00nLX4WCivVcextCvu
	lw0F1+z82YJS9FK4W9qU2ZA5asgDpi0zJOSAziQHUJq2qhdBjbZYTYq2wLEX9lQn
	ZyngY90dHkJdO+p5NlX2c4jvjSNZiMZy5qzMJSyoHbeJjraaWUDsfBv6fdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjujb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b548745115so54533391cf.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087079; x=1757691879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=cW3NpImR62k+yAT2AMEaCkSHRxbG0gSuEcycXvaJowPLmrVlKtlAOXXjyxYTVdSr5S
         newR50eb2CcvGAafcWLtmNuWpQXzAxSirldt/ElnvyHtQz0Uk+tdn4CQ/L0wz6IEyRsm
         f9Xa3RjIUXhuRfi4l0ctXMpapY14wbi/+JGDm6RSe3kPQXSDVbIXLP9iRJnXJBhVmDGC
         6ekm1K1sHy0MzDKphiLMQ30ZfLuPYuwabBwr2bFWxhgXPxgwn1hQCwCPETk13WDxJSd4
         2QDO8f9Cq6vFTiejlwSOu68nxy8Em4wp1K9455RlEKvTQ30U3fHOcONu7Bns/L8PzAH2
         88bA==
X-Forwarded-Encrypted: i=1; AJvYcCXtF4MsfIB/ijyshg6oJpZ9nJc2AxOHGO7xZXFPVpvbOMEhDztIFmgpkIerl+2IWzaVZxgsZH1GCFD8hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRUT7NTczhKcAD/lJ0zYMQgbI3Du9rzBn3EFQnVTVRuXyrDV1d
	Fbvbt/7MpIYgvjf5h9/ikwxdjqbnDXZV78iJ0Wf0C5h0y3T+uJIEAmsMnhxIDBKN2kBDqV9kd2f
	cMZ3EdMzIpQmN9KDgzKKB7sGy1ecTGMuQAfEgvTC0JFBgKtR+Wq8sDNnpKjVDlsbfAiD1KEEIIQ
	==
X-Gm-Gg: ASbGncvm32vevf21Uzu2OBWteoMu8CaPtX9X+EKq/dQXC2lP4sJydsMYfTH10qTlWmQ
	VafBZo90/51qMmZdBgHXggbbYCQjSHuB22gyigpG5OIzLbHPLXM5zpPeB67xDdpVMYtXK1WnRn8
	nOmlrbv/uT94X1gfOQdqsFbVmmIKTL6LLZpQU42UyFjxXgOns8rB8pUH5s5//qcI9HTx/rcy0Ly
	ECHcEM1NLZPBN51DJgzHJxcgXXFWkUzSu5o+M5HsQUGaY8vOi124Le1W9XSyK+6wwwJRR0rm9S/
	iPSqrw5a64/R94bzC/iGmFPTsibZ435arcEzeoJSD/Styp5ffnc0KA==
X-Received: by 2002:ac8:5814:0:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b5e7cd601cmr40993021cf.4.1757087079037;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIAh7hGtTrk3JjGWpjyCU0bakKbexV7o3uoUq3SmrVpektwo8ogXEHDmPA2fIURe83QX7mQ==
X-Received: by 2002:ac8:5814:0:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b5e7cd601cmr40992681cf.4.1757087078395;
        Fri, 05 Sep 2025 08:44:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 02/12] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri,  5 Sep 2025 16:44:20 +0100
Message-ID: <20250905154430.12268-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb0568 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JEETSphPRXOmkxggWS8qY4NqtpvHnLjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX7uPtQWZN8MWk
 5O10pY2JhX1Eu/7ZBRFzqgfNlq/IxLZiBVodJeBbROjdjs8w8KgKtbZv/6HdehGLAO3sN4IyIgQ
 l4zEd8DSeC5hh4wWpLngRnq0/Jtl2mUhzBZxyaIivLK89vIEvUM1YE/avzbH1Z0zEZzjHHPFaPH
 yUwY3yTar2B8/1o47mSlp29SHMyrf6LN6CXeI2wR9xqPFs83cwfYFBU84/nf5+qzJMCyCbnu7sw
 6O5SePtUDCfDL73Lz2sMts6/SGAI8Cp2DSKIpcpFWxbUGeU4rGfUVttODRPbeOb6XnAfdKwjm6+
 ORyg+w5MW8vXeJF0Y2+QuX0g3hiGXIOvguYuB92S/9fEFvDn8VvzUJHoDY5MgVSulM0e8emhPgI
 UFPLi9Kt
X-Proofpoint-ORIG-GUID: JEETSphPRXOmkxggWS8qY4NqtpvHnLjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

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

