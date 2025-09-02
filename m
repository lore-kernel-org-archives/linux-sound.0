Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B230DD35
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829556; cv=none; b=rTJtNa838iUjY5EoS6FdVJfag1ZBPMeATpVDju1yDgoRQcLwVyR5Pa2ReNAllfcLicovb0vI/drNy6ovQke0hlJShqokxyhV5DjiINrhjgNh4cJQGHRurJkYCpIdSigGucR87GznkzPdivDeT1Ev7A+EJzr661LRm1PJjXU0g5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829556; c=relaxed/simple;
	bh=nVcE8cWRXOB48T5NMOjigsTbnDdQssjbYl79J7cZkxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ff+8J1bK/xCCib6haHG/hn/exoh6e8jGSNBz50zEHoXJZBl3C+GgSCy92Rtrzg/gFarq9iS4IZxPEtkwXWYgluBo4VyS/CR5L14vc+sZmDGGLCD2bupaOo8sYNAWNHz+s62MDYHfi4iaCEatyj+VMH7nzYvt/0oitiKAc4BWlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElV5BDSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElV5BDSN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqB2L032190
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h2Gn3rEd3us
	JLYmFOFpxHWy5o4BbWHYKvNrDEsewIrE=; b=ElV5BDSNr0UmK/0N7CtPtFCI0FF
	T+KUD+RNwy568tpiTe3+eByVd9vmKPQncBxdGB1oE6iHtKfQApajizP53cIz97of
	frdjpq7pTYf9rolcQYGlexXtiSCvA9VS4uiBX+uWcBPMQeXJxJBU4Uv9x8tMLsra
	6O5bHEwkjn7Dhi81VS42pldwbjJ5ZHpdmuOt4jGRbM3m0nchMyCraIZGt/wA1BVX
	6z0mUDGnBS13MVmTPol7OFCz6UcrMbfP7eHePbBZBGy73MYLPEx11U2WUF2qRLbK
	KDQjA/lW4QguNEE99orAZXi81eSKWic8PnXGO7dzmmRSgENHJz26skA3hrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8re5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b339e7d107so34852371cf.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829552; x=1757434352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2Gn3rEd3usJLYmFOFpxHWy5o4BbWHYKvNrDEsewIrE=;
        b=iirTjNZNIMtavRlfrSFpNfCqboZ2UNPF2FOeJQ+i2ovffV6hgIM2m1hU8cGUo2dSZj
         9Jv6Wk6aF1Fp77T1pZeVefNiJURf04dcO2U0A2s4nKx6Td3kXwCNDnRxDUW+cqKepyis
         PLyp67JSjykB5ezUHmTy8rt3oCRWDuDOU5XQNvlQhh4+ItRmA8szDf631FdctID267cV
         p8J5GP6M+l98MsZwYotPX8BknpxPcQTKsTibzByfNIUxFW1rulmtSdujCqDUPrwzkFmq
         y7D/MbHsOKvZBH4DtXK/Xp/bAvp8k33SRUvdhq7YP9Kx3OIae59PnlLRvPrJFrys67VB
         Wn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk5xjmZPSq0kqrYKZZf2dieJbtT9nkoge8TgJ+q6z7br/LPAemQENoOCtroJONKbzEd+gdxMTWNMBPMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrGpO/l31Wcgwq1suoZeiLA3ekQpfN/4fWEbNwCdBVqlRUmNN
	sKivzvuYKQNydzQV2AcwZXjjIDiNc9+/mw2Dm52wl0DhmpZuIvCebdZFTD0hJc+W+b+rccti62z
	OIeC/1agnvshe9tBtDlbH6BufsNd3ieM/iVNVkxPzqhLm8ttnElxGKw4hIdXiVgG0JQ==
X-Gm-Gg: ASbGnctk3d69IWq3DJXLNf8Z1aRGJD4N2ZEZCyf4vLnsQjGfCULD3yiIp3DYLfF1/8i
	t7yELNP8NuCy+OiX8D5dTluOnbiwQFx3RAuexzqSElGiw7oU43vNcbW6K5ohAfmi53zG5quPngZ
	9TwfrRofScyJZmzNAo1I0nvQyxTeN1cEerJmxIZH2VhQwElLm8fsFFIqfVtz5+NsYhvT72LrAw+
	P+/+o+VaGYVGidHYuRgi9bC8PY4eB5OyX6IRabykpOwniojWlrbBMITTwg9dq7UunThMiXYYVZj
	nmungf3zBFYZInkej6c/nQPl7frRomtNZJOoFVBndPkKK7oS3BYWog==
X-Received: by 2002:a05:622a:5b09:b0:4b3:81b:c5ab with SMTP id d75a77b69052e-4b31dcd8859mr133724721cf.54.1756829552269;
        Tue, 02 Sep 2025 09:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGq2usZdYeCp2ppJqxGqoRr4BkZnJXxtOGXHJVqsgRbfjafw4ZUoIUXNQykrB6encxNvBvqg==
X-Received: by 2002:a05:622a:5b09:b0:4b3:81b:c5ab with SMTP id d75a77b69052e-4b31dcd8859mr133723911cf.54.1756829551677;
        Tue, 02 Sep 2025 09:12:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/7] of: base: Add of_property_read_u8_index
Date: Tue,  2 Sep 2025 17:11:50 +0100
Message-ID: <20250902161156.145521-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: imFVXkVytB3C0BepzR1DY37Q5M4unLri
X-Proofpoint-GUID: imFVXkVytB3C0BepzR1DY37Q5M4unLri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX8/MR0i15Zy4Y
 oVrETlo+qqSY4mmbHhlZf+qxpbh4ecej7H0Qw0i/04mKBE3DpE6PgNm8hOc67Rnx0AGZYpAVFII
 PsIiTlngN1LVcP6uGz6GqNgA4aLKTlRg5CA5m3CJr/kljYmpiCSsSd0YHlJkJ14VUmOgUBLEQft
 1qMRJ2TF9YzOiVeivYiRWrxG/8B0/ykNqrwIBI1i0ZtY90yR5+980CTBmXvpqWdop78OFEm8R5F
 x5+/b/+NjGrKJKWrWKTNkOPeN/jrOs8ceF97H823Rg3Y5fBhvQVRHRbzUMPtWaQEdtEr7bPV8dL
 w7cUjjh/sqEDNJE8VH3N8vuyPkJZwzXzTWSoF2iRUu2mq00Q+9hsSYjUhLS+hpqlzqEaYjFCZjT
 ROB8QwRm
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b71771 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Add support for of_property_read_u8_index(), simillar to others
u16 and u32 variants. Having this helper makes the code more tidy in
isome cases, specially when we are parsing multiple of these into
data structures.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/of.h    |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..a644b24d5b75 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -147,6 +147,39 @@ static void *of_find_property_value_of_size(const struct device_node *np,
 	return prop->value;
 }
 
+/**
+ * of_property_read_u8_index - Find and read a u8 from a multi-value property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @index:	index of the u8 in the list of values
+ * @out_value:	pointer to return value, modified only if no error.
+ *
+ * Search for a property in a device node and read nth 8-bit value from
+ * it.
+ *
+ * Return: 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_value is modified only if a valid u8 value can be decoded.
+ */
+int of_property_read_u8_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u8 *out_value)
+{
+	const u8 *val = of_find_property_value_of_size(np, propname,
+					((index + 1) * sizeof(*out_value)),
+					0, NULL);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	*out_value = *(val + index);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u8_index);
+
 /**
  * of_property_read_u16_index - Find and read a u16 from a multi-value property.
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..0c95e26c7191 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -316,6 +316,9 @@ extern struct property *of_find_property(const struct device_node *np,
 extern bool of_property_read_bool(const struct device_node *np, const char *propname);
 extern int of_property_count_elems_of_size(const struct device_node *np,
 				const char *propname, int elem_size);
+extern int of_property_read_u8_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u8 *out_value);
 extern int of_property_read_u16_index(const struct device_node *np,
 				       const char *propname,
 				       u32 index, u16 *out_value);
@@ -639,6 +642,12 @@ static inline int of_property_count_elems_of_size(const struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_property_read_u8_index(const struct device_node *np,
+			const char *propname, u32 index, u8 *out_value)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u16_index(const struct device_node *np,
 			const char *propname, u32 index, u16 *out_value)
 {
-- 
2.50.0

