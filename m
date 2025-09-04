Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936E32EC0A5
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983409; cv=none; b=Kuw5E2Lhdd9FfIaU537VgzhTfQc/CJ7o71bsJezKhF9GvYo2ScB/coZQPXDXH5mBSh8jU5zGnBLnaqjPYvHELI1TpcoiNDF8tM0uocd3Lr+gidpntouqyHBPUarEfBYEzvg645+MLugod4WG1z3uAvHdO2cFY0GDMlwaCg3NPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983409; c=relaxed/simple;
	bh=6dzcJu5beHXFPE2ysDUwBwwBtBpB4yJJYn3tCF46Fow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwKkuY1ZeXAJuLwqZvRB6YSHGomv1z35CbpxW+W7AgZmrWcsaED7aht9xRLVOZwQ1kTWV5RgTeP2i4zgmSS+tV901Y0Cl6K5rDYtOi/12jJt3q2IYVjkvxGbUcHwwykTR9EVr5mktrhfbcJkE0ugZqgTH/ICMvQR5Xs+2PSgSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGLY5wks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGLY5wks"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X6ts013961
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B6VI6rYD+l1
	gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=; b=pGLY5wks0rpbFWhMhfWy8+K4MYV
	EXMP2eg57SyA94om775L3BkUc4FnSVmxlrjfD6xTnd3bS0ioeR+IB+UOQMdEAEgY
	kTE2cmWTjbxobF0FTKVNVCcq5t8AxH0dbFNOiwOkK63LbXs3N8V0xagMkAkEhMqp
	dLsFfvN0onfYsnE6CVh95KRiyft0FfKHWvDjMR6IQd57b49vWHcwKN48VGGx+vYx
	cuJN2UhJWd4etuQE2YxQGmDLwazkvdciFnROm7OcLfJhzwai0qEhZlStvWXNFejS
	TIZU8nlKdva5XTk7YrRncOkwGxgw1Ah+B+sOe4diHymTB0uCvtqK3SqqHlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7bxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b49666c8b8so17946371cf.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983405; x=1757588205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6VI6rYD+l1gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=;
        b=rMsGDeosXvlTGI5/sfGg4ry0ep6NxNxDoOKGU8uhmTChx+bM6ut2aea/LHTpOY40pV
         rOUQ6NeRV1oSGJR6BL2ssKpz2U38z8oLsK4GQY+VrGbVOFMOsn0g8Yds3U5FwZMYgCi5
         DULh/GLtNB54g9sBy7qK5zadiXLOdpNNZFGy3va9Ap8AMe+ULrcwmi/i7H7Ti8nUu1/H
         ATiCLZvagwSycQ5JM46M5PFeptSpSmv2+HXlwLlbYmxc5hD2jkxbKYA9d2R0IU+K2knu
         Vg9o6YnqXexFi+hHaDJAfC3UIA2cdtnqz+gI1wkgkY3JZWJPHMh3T98R1IPcbsvJQUO/
         ENqA==
X-Forwarded-Encrypted: i=1; AJvYcCUF38vee7WLX7CEQp8ioy3FHel08p26NeRNFDQAxX//rp7Q8OXmiv09C2BWMjfcClm0InEkNxxBBG0ymw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEfPspCV/5ohAKegGLwiNAb0xaYL/xzHMeiu1wB/7AVjAgfEU
	HJY8fMy0e5iv9dRaCOw14s7E6D2vvWixiTrC6tFBq7eVfItAv4Dd165cnLGC67byKMWAmiIQfoU
	xFlALO7qd+zpk/JiFVnflmCEN5KlyMeikqNkFHaSUsPM1/LLfvPwWmGa5v1UycWEUEA==
X-Gm-Gg: ASbGncsrqrXVD8CYSsZfH0gEyC2hBEqZHc9EO5EsrYAP4O2V2UVq+q7nwOv3U4liINO
	JxX0HXsl1d0qACcwGL7TO0UPv+ThsariD5A6b9ol4h7f4be/vH95qgs3jT044fTsfJGvV+LM4lK
	NXpsGolZEBiRl/w2m2kw4QWV8H7ETylvnfz3jKC+YeXEG59HNW6hnaC6xaag82BxLG8+uRgbM6r
	/X1/9kLMBQKKF0N5ljzs7JBIfvhGmKj1ivpzWCGPOQj2zmoZcb8Cxs/7HEiVuOZsWJJIKmw0VM2
	XP79DKLVTmac+2ld4JRiYVqIfIUtYUMgh/o8185R44OJHiwKSjDjAA==
X-Received: by 2002:a05:622a:4ccc:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b34b6def70mr106821111cf.32.1756983405221;
        Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeuvQIN33UNWZHR2JNqlGv2Ymka3KFXoG4mGjXaHF/nLj8DLUeHm4vu+6a1XjysVDhdguSUw==
X-Received: by 2002:a05:622a:4ccc:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b34b6def70mr106820901cf.32.1756983404715;
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/7] of: base: Add of_property_read_u8_index
Date: Thu,  4 Sep 2025 11:56:10 +0100
Message-ID: <20250904105616.39178-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX3zTBhzk8eZs6
 xD4KsU7jMFexsmd5Dbg8KrLkPfSbmHIAVp707BsSeWeFbB8jHx1eVjxtyvOcCeJ+PfaMLfpbGVk
 O5Ihp2OT5EEEBsqXCRngJlz8LaNfJXyPLGBxv5EZJx7KHeR3P1172xfAJjaB2w3UtBgnGMBtNPf
 udZpSYA10ffAmwlXJO26BZxies9KTpmIT61LsUp9Oo9GdD+VFteNwC6Te+raUIJCaGrgiryM+pV
 pgg2E/kGMfE/0QrzlPKh1QOzrajp971KP7+TF8Wfy4Q5lB9Bmok8vHSt8kORTT1JP1+gRHkvYL5
 +G+j3sDbV0SWbMeaX4dlfv/0a6Ut8rx4eeV1WgQQL4MLIen2s3XZEV9Tgxj4flzyk9QqYUvmlnY
 sV5EqSaQ
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9706e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QWVZDP1bIR4RR9rPlNkiiBkx2UtqykSD
X-Proofpoint-GUID: QWVZDP1bIR4RR9rPlNkiiBkx2UtqykSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

Add support for of_property_read_u8_index(), simillar to others
u16 and u32 variants. Having this helper makes the code more tidy in
isome cases, specially when we are parsing multiple of these into
data structures.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/of.h    |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..4e3524227720 100644
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
+	*out_value = val[index];
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

