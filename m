Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FBE26C3BC
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756251; cv=none; b=P8ENIK05v7VLRf7Q5fZdgI+Qkl/QtPAwMvXd9xxiotjt2dytq1fVDr3akYd2SzTwEiLktq7uwZ8xz/oqzNcHk22yfWL9MGXe4xUx4eLEPlPLTVxUVEO+f3QgomImPsDlH2j1fIFKprS73Y9lLcErBccBdnjMYZNvnJcOlrh848I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756251; c=relaxed/simple;
	bh=2HBCvrefasfSLde/LtBz6m/Kud5gPwXS3AqdFSSSbuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yqf326jt0TyN6NhOEVV2Ao+SJ9YleXXnAshQ2/1oc+ignoJs0/xnXI1FujOQq5DDMBY2ozKmTL6DT/mqfHa10MYqgM9uIq7tgakOo4vu2jxG05sVtuo1ymFcVSxd/cp/SU6Sab8O0MYhlQuQEkX5rFBQ0op5MN6Lo+IpnC4o2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi9YLFKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fi9YLFKp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B48Dt007131
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DOwAoUlzuqa
	7hTeE48P2QvIO2GkY6Mj/VfyeQ7l9coc=; b=Fi9YLFKp+kFYSuomdzo3n5fGRLw
	vsG8mEIk2mA461kLh87eteALU+wUuV9kx9exquADIQY8Tc7w0+IhbBcdVYwB2FtG
	H3N38gdxwuXwu2ak7MGaMBCugqmYkwtDfpkQYK60vxbNzzD2XMRJibpmjmQWom0J
	69uX4QXA6Nqrlw+4Ao19iYF3lFpFr/fbp8DvgDNZGfMo1ruAfNBTOM5m0RtNLMU9
	6LsO9OhyT9FZVHNiML3b/dbYE/q1cWbJxHl8A7V/pWwQAz/P+j7YlxhZ/wQfd8+O
	SWY5QgflXMlGZxZsuTUcWs023zrN1VZ7JriVL2FbUjt7gLcK69IlNercujA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8whxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b311414656so98638571cf.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756247; x=1757361047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOwAoUlzuqa7hTeE48P2QvIO2GkY6Mj/VfyeQ7l9coc=;
        b=DBfi6Y7nkhspVzYFuSL3g49eR3TDPZ7A/vh3zxufSapQ81EdlejUGeGAEs1hEDGs87
         hABXq6zj31u1QlYrXNGUQWCCjySnRZaPjpmzuSol6CvZ680J6KA0gIF1wuWOKcD0C5eH
         x7BTGSxWV4J1mnfkkzbnpael3/y5kIAlALMt5MT1P7/iOLey7V4UaOz4zb6OPeWjSLRc
         ScHhr/W5ecNKv3DgyxN2CGCBz9Oo8hBUQ58C3ijffLfv/eJWRWNm50jHI8EtvQpLvLtC
         clNqEMVVKQwoiSi9lsumlS3YknRdIaQIR/yy+io1gHMMb1C6iVY/yJDLxntDlHggitBO
         cUNg==
X-Forwarded-Encrypted: i=1; AJvYcCVZpQEj+IVceAbCimtrQAVek6TrqoPQ3bYVSS1Nx+J/SA7Opus3xNX87ZrUidIFqzPCalubqsTiazzc0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVei/LXxUOU9aqW8cPd8k5QSoMrFDZZiSiX4L4bJehOjPO+SD
	HnQxr6arTbUbCD2aYgXOcYX/70XZ6pJNYFaYrBf8DmBGyuKcuFJoGIWu1f50ZnyylFzYPO81DGp
	uMloZD31k8mXxW9ztlAbqcdbG2KxybM+V66nT1KZmqsrh9NxgzWQbi0i5FJT8C7Apxg==
X-Gm-Gg: ASbGncvjW3d4W8+Hycu1LDy98F0821U6M9nJ9bVOtzPa1BwRWz+8/PVR3Nh9Q2np0P/
	6ldKQdG/IzQeDOgZRzLdJjbazwaXnqesY/b6viwClTQZqNI/19dT3O6jMiLhR9p4tDxCRA2LBNA
	D4OM/JAYjWww+13LLHuzqZH72RgY3JtREi6q+6AMpq6uE8an9gv5dTt9mHswbj0jQquhWJisGVD
	vpinpCKAcm6lXeeWLJBFHuyfzS2TI883NOfk+tG1RW3+psj6ZJI8IFIPJ5xWzaiTbrLJZQrz4/+
	sjRM0ikdycC0YRd3qpS9C7Tu/V/1RHCJowAnHcvgha23FIu9fISAWw==
X-Received: by 2002:a05:622a:1a0a:b0:4b0:61fa:19b5 with SMTP id d75a77b69052e-4b31d9f0bd4mr103979751cf.24.1756756246943;
        Mon, 01 Sep 2025 12:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8lcuLrPgwq9ga93n+Apj7m0TtKUqMmRocQnUzq1ECRFE6bweqLXtt8pEYlXV9Ca3WHx/wNQ==
X-Received: by 2002:a05:622a:1a0a:b0:4b0:61fa:19b5 with SMTP id d75a77b69052e-4b31d9f0bd4mr103979391cf.24.1756756246315;
        Mon, 01 Sep 2025 12:50:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Mon,  1 Sep 2025 20:50:36 +0100
Message-ID: <20250901195037.47156-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: RJTIOun_kmjPgJBafev7fWvEJirInjjx
X-Proofpoint-ORIG-GUID: RJTIOun_kmjPgJBafev7fWvEJirInjjx
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b5f918 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX7qeHm5UNwld1
 MFSCqMF99p+GUrvmo3znX58M5syJCEe5wKmTnFcCjnpSWpcx4EALd9u1IT+wZ8xEjJ5LvCe9X1K
 1jnZOuLqOJhM2T/DpDRhlhlX3cQa8SzwFMHAKAXeIsUoRbVaCLG+VySoetgohCNVzK+9VHnSGwA
 2nZo279yWfDMtiv2ZhGmAafMB/MGkvh3ZEMKPvva7DyeEc+lIrdrWsFEyGX/i8V9qidYF/UkJjj
 S9fJ3Lhp+FNAuKKA0nI0A6Nd6OOSudcrixDVD4Vlc8IRoal/O3CJ+5UlSYkqaYVvNSqJhCC9tl+
 cxEoUfr+DjINt1cMyS9dy+rEyzStDsniQmIk41G08gEF6RPh83b3+M9KIlNG3M/U8h2yMKLxnga
 VPQ/I97y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Add bindings for Soundwire controllers v3.1.0, which is available on
Qualcomm Glymur SoC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 7ea491f7e828..003023729fb8 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,soundwire-v1.6.0
           - qcom,soundwire-v1.7.0
           - qcom,soundwire-v2.0.0
+          - qcom,soundwire-v3.1.0
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
-- 
2.50.0

