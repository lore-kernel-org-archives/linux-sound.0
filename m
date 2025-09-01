Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020E42050
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756245; cv=none; b=lLijagWze72rrHVympnki18qL/KlvWjfLg8K+gQp2woNWgJ4x8zAXJOdfl5c9vKLMvs4ze7plPLh7HlnegEUoT7rDCp7tyWWG+dq4eaXCWJKW+9JDXqibj76Q64oqq4pfOQAN2d2C9VkVoHExwXCJ+cqj62zxrmREokAb/Y6dyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756245; c=relaxed/simple;
	bh=K9dT3P4cNGVclh9ZLKH6/pAmPhFcGE5GIr90ZQ1Ay3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nO56x/bk2UpIME7/s8xg6f+K272pCq8WSPPdUk4OTJePSWbRhZWnsazytSK0XoYWlKSN6ouUtJPKPkTwSdWLtbRZPUOjQA5XY/QjWVbQYauMUAVM35RkvVfl4+xwzXt0kgvmGLzFw8+BUVNSiWe1AklgK9BT2reb2jgrKhkCiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNi9Q9F+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNi9Q9F+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B45qp007081
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZYZhkYWY3P
	hyDI6yRMFY6/iMZaM5cm3CUgvdVWFgs0=; b=GNi9Q9F+br0bgEBbcvvcudpwI03
	Th4pzfWza7xwfz/InzqMH0HGD3NzuKpLoQzCryW7S5ZPawRESuFEfLxfgHyL3l4n
	eqZkqAi36nNBXjTlQtEgGkOgVvrkTXuoUUqXvhUcrc6gf+/zXFNQkAaA/OcHjWrP
	nBFH39w2n2jHLXWZjJfqkj4zElV3A+egDTniLlrz8ggAYvGsTQcJsbziyTKqu2tn
	+sKUogw64J64D/bkDisEqaV/i3PfyAKTMux4wtabx1New+zEanfclCRScR8qXZig
	C9cNaUW1wzzYpRyaD3uelQDi3moWhjeJ3X1xfdqwRIyN3G3OakCN/ZHnazg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8whxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2f9e8dca6so103875731cf.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756242; x=1757361042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZYZhkYWY3PhyDI6yRMFY6/iMZaM5cm3CUgvdVWFgs0=;
        b=b/QKKB7xMjHlQ8jwWdk9BfjaLgX+nq0GXtNFxsz2DtOZESoHAExd6aA/ZDonsr4K4q
         Yk3dUj38VDbLF3+aOJ/Q8Zyfa/Wuj+KITLDuQG17+y4S/IIFAAyV2JdagXWNw+H2V0ln
         dcyxvkUdVVclfJi8X5ib+YwmDi20mJvYTNOVZU/HQnt0wExwxtiZWwJ7eUMqXEjx4qxR
         6jy+BEyqFB46iTMQwzYhFzktlvHTdGkckRLK/WVncCprE3deu6br2CvQuJivMs6Ko3dh
         4IHz3sgH2hxGJUUgR8T2V+hvyHHQivcRyRXCIT+dDlxiRm5OjtpbtEeKQi3MMfxPPXKu
         zgqg==
X-Forwarded-Encrypted: i=1; AJvYcCWuFv43VoxjZlRRNxJKJkYpPANDDK0HVdlXXqWqnhznhsGJ0hqIcKipp6xvmggkRyHffyzOj9uGDwUx9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHolgN6sWQPKx6OYj4LMXPmqaje3v0GOuNiJE/q0BVAPAUW+rd
	YAko829f7p1m6JbQgjYHT+OBV7gLmIND8w4v035YclH11HM7Z0c+z2gUhqCDSG80ddxI2KmUAuq
	dZ/x2XQck6CLOtC5ywZLVs7qM3AFpVQdgU5OajMCxpqzlMeRKbGW2ZfSanyJSWWAcbzwKoD/ntg
	==
X-Gm-Gg: ASbGncvHfUn98eabVUynmx/BhpWEFZ8s/6bfUzQIeGV6fk1AlR9MGzz9AunyYPS5cb8
	A2fI1BP3u98m0URERwIlGBuWjn/y7IWehCDEnD2Z71bA53pVmdQQG+IADXEc1prievcvA3XY5AP
	jVdYfEEFzd7zh4OqV+HHgpnJxeBSqDd6R7WBnemQTzfKOvWDxZ40rgsaxa4hG+vfhUVgelvSR2J
	so4TtS5G2uTCQjTX6I+/v3FBzWS+kTReFUZ7P03E7wusiEV2/A8gDhVxbXk5nxoGhoIGU9ca1WI
	JB+Bq6f6LSU4eM49CsSpAO2jTANi8rDccRbT+ZwSOAQUyGZsJObr8w==
X-Received: by 2002:ac8:5ccf:0:b0:4b3:45d2:190c with SMTP id d75a77b69052e-4b345d21f5amr6627981cf.24.1756756241853;
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg6e5dCNjKIORo/d6nONnGIE0eMigxf1K77Q5IjgAIV0Ef4xNH5Q+y1VZ5OQlXqkJvKs9ggg==
X-Received: by 2002:ac8:5ccf:0:b0:4b3:45d2:190c with SMTP id d75a77b69052e-4b345d21f5amr6627581cf.24.1756756241360;
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] of: base: Add of_property_read_u8_index
Date: Mon,  1 Sep 2025 20:50:31 +0100
Message-ID: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XelwNfpOeOm5EYltPiEhqH00AETHvFtM
X-Proofpoint-ORIG-GUID: XelwNfpOeOm5EYltPiEhqH00AETHvFtM
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b5f913 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2j9JfWHKICIk
 69AspJiZIiENQ7aq/zpvBwivXo/F1v58KpuGLC1+Wg91embspVnth8Q3ejL50ydzvFZhjRPgFcG
 8Zoxvq0gQxzsB20EgDv5TxSSA8VueGucPmsQZk/RmFd1jVn91bNYPNbzSN4/FyZ3OwphcMBF5yF
 nnVaP6rbX1AjQbTVugebitVjcguuciGJWxt7maoJA2zZgTQhjVyiw8tZE6oZdjJssFJzi4eAcH8
 zMF3QjaOaBKjR9IdyG3oubp3bdUrzN0RzWwBW2GIFESCIZO7Ih2RkBh9kRK0ktdDhNFg/hu1lnP
 8GDAaKjBZJjLPiCYpstYuk2PoMaf+wLBXIAjnw/4Tjaz5qhcEBVtzEia4aHCZvSDwXYwxpfK1iM
 pJ0I4fiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

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
index a62154aeda1b..9f921d01a125 100644
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
 
+static inlinen int of_property_read_u8_index(const struct device_node *np,
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

