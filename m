Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B42FC00A
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983411; cv=none; b=gfadf3DV0uURwBjMJ+Lh53FNhTlVnbFebgt9/5+rYOI8x4K8CwNWjjUg/qwJ/SDVkGJz+pT6Y9358fil8wXJUK4W2pAbPlua5I3fN8QGJYUF9HW+k/qRJT2WR0HAm4cELnfW5ahapYQEI3BneenOmWCabdJG4A25J2DhCp2r+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983411; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f28cbHeP+IENUALWoOr9cgjLbBIVlwglQ8l6AqTx+1NTcDcqxQz+6FiYnySjqcOcKXmGwOMKyEIg/SpJbvKCui+lh0kdVplgge12aVaMkcLyZqTQY6znFkyu46T0uFloikzXb15dcnTVOxvNwWZ7/FswMjO9P/sIK9ZSNAWDqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTatAGbY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTatAGbY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Z7013476
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=FTatAGbY3Z50wOqnOaNxgxBKGDx
	8WZwFlE2e3jBv3kAkbBZ9RUWRj4sZCB3wmhSkfVYbnsp2h3XstMa3AzLng+2+9w1
	jB75pqT50tFfAUFTMqw0BFxqF/L1oQ995AZfaStNCYTngCkhDUrvRdlTYQRs89jh
	zuW6YZxGrWIxP8hQ3gBBmCoDGw3WMTm169Wb6PCYBX+gZ3XV7EbWbvTjEHT2DFed
	S8fDajpAfMLtvkgeqtUTTEpUfOx3USpfxHQf8zHag34XWcM2ssXQJRnXkDnGD6Ry
	+PvTMPyRcmghNugU0smm1QKYkOVWQAqS8DIK51eQU3YVVHOPGU0ibFSl6sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyb474-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b335bd70b8so15847371cf.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983408; x=1757588208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=XN/SRZKEalPRnY5/Mt0R105FGqQHHgnrI+kilXtNS73sYWdq+Z7NIz32xcTlcvZjK+
         PShH41U4ENh9zn/gA6h3IMD2lQtKtOypBYy5lNVzKvY6Voo/NZWBC9ad2bQt56sSGDye
         nxYVzshZ6pK+oyvAda23N7gsMH+g8C6eHYXaYR73/Nry6gH/zO2tfR5d4PV9j5Cufvfh
         XCi2RafNmPk5myzJ/i5d1EnlLoZL6EMwRYISN5eKr15uCaR4iL/vUriGSRc+HQRMdqX2
         LN8TDVJtr1l/sKbia3kLNqwptX7zS8A6gihnWBzb5K7OS/iPIKDi84q5f2pmqi751P/r
         r73Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXTtIjL4HIPsWQ0vFVrx60fiyi9Qt/NfNPMpr1Jhxrr90uu4PJZ6Ok/sWUxv/74V44co/rbUlHgvrKVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxglGYm/WXV3xg8TZF7KcJb39anLRM3qfL4WG/+LXzFttDuk8GA
	2v5UNiHCRpjB72Ra1F8f0h44hFXqEgdkhWpfV5RavVeJhhLMsLqkwDIwJiSoDZ2KMBOGfhIXPku
	IFLgjYHTyZMxQrhZyfWQzHLmfshYTFYANF3uNz4H/yb/LXgv+3/sprOVDWFYOoDaFjw==
X-Gm-Gg: ASbGnctQw4RD1T1eF/2KP+H+KcD/VFhgqFH3f4Z6gfiDsmFpH7Cq5TeMvH8cWjo2zV/
	74v0xUg55wbBMVPOOWLpfIOj1lrbT7wfcf3e1PWStbDKcse4+dlD84fVpr4jO0Ieo8X85vrP+RL
	4nCxVtX8wUqMUa9z96TSvXROPPK142OJlIv/KiPFI/wstsHH6PTG9z6D6Q/XZMGVAEE6ch97tif
	mmSE43UyVPnCPzCqheGDJoyxDkRtxgO0FKIiC0kZcCinya2zSnKhCDNzKwsvKxkCn9rkOxru12k
	AwV1UClTRwztXU+Ml+TRzU7WsT+/zZ1jgWggXxn6IYDuZbRD7wXs7w==
X-Received: by 2002:ac8:5852:0:b0:4b4:8f35:c908 with SMTP id d75a77b69052e-4b48f35cb13mr55843931cf.55.1756983408464;
        Thu, 04 Sep 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMXspTwpY0S0bTLaJEpZgt7pNOpeSmQyZlUtp4ZrGY6tTLhs9q4+WmumIbVs00Nh4PBO5FNg==
X-Received: by 2002:ac8:5852:0:b0:4b4:8f35:c908 with SMTP id d75a77b69052e-4b48f35cb13mr55843691cf.55.1756983408029;
        Thu, 04 Sep 2025 03:56:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Thu,  4 Sep 2025 11:56:12 +0100
Message-ID: <20250904105616.39178-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b97071 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xWFww0t5dSH10jRANh8X8aOGUhFat7P4
X-Proofpoint-ORIG-GUID: xWFww0t5dSH10jRANh8X8aOGUhFat7P4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXyb3QP3mKkf0Y
 74EkaoHkN3Ds+onZJTkQ9qWkpmCmhZ4Uhz/le4vnFWRom3/Us25SbNpL8YAVfJf5AC09ZGg6zzP
 jfwWZzmdHzWbvqWBr5kbl/uR6vczLaqA9++o1S9DV9bxHvYfACE+8+ZE03maq2aJeIhgy40pfO4
 hK/GcqlQqFIfbo39l2BLpisO2DCfR7pjPdL4bvv2BtAYB/syE0spjabdxaw2MsQn6JMOWaCraXV
 EGKcb/htWecwsgOzxF7NPziBOAbQy23wUZdc9gZt0Y/nKOLRv3F86M7JCwJovMULCaunhC7GSyk
 Y1XRueKgWvyU87UP30W8HfrJXN1EF0vWRhnWn+H/4RYB5zw1FtjDn/y3R4vp5dXuE8YQKlmftw9
 csj5DCz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0

