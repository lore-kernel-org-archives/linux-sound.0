Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38D347FE9
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911314; cv=none; b=gL9WZRhY1GJfUs9WlvGsJNMaKnD5aH0LbaDTwhefOJuQsBvK4ARqrN568YfGZIgTLu3omJKU7tm41nO8VQ3e2ljHyOInhilSiUk+YXocSmoKQRa1wRRs9HAVtqKV9NUa90qtYPKZWpAYTENDWbXaPvAx9k5NN6RGMCnX0rfMNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911314; c=relaxed/simple;
	bh=1z/FSnj3ZUgyWqaLRX5fY7Les2o4JmWnSmIDwUcEQN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcXN8dbG04m+YneVaHFN3+169pFtjmTUi/3gVVYelORy9ztjLUUdpkh3f148l9b7oCPdn5tAZLs57OXqFqo9xH7/EIeGwWjKTRgFC+D0uN5bT7I9KsU4OFzJ2ATjzyD0I2h0rae3qN2xo3oVYa2vzbLBqbsrISPZgIFjAQDsCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUo+zSp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9pAhcod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUo+zSp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9pAhcod"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jdI62471732
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pWjm3r9JBLg
	yWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=; b=LUo+zSp70Cu/KiSHtG2Den5fseV
	BlZWcKOR9SLf5tW/oardmbA+AgKX4QQAOhJwxG0GQZgrW3/mVJrV1T77OwFvnOx3
	65vQkb1pPs/1HnmTE/HpE96oo6LyQL2iq32/rS+cqZiwFxZRasCbriHy/9/lZyhh
	fbT9ZexMsJNYuR7RS4L2gwCuWCaDCIfmnzojoamhuJcsw45xOHvLxkgQW0R0+nSr
	4jhabXNP2RBaMvYQoDvbvk//t1qICpG5v4KiTPyYO7C7rsP+KWwQy2RcAlA33qJ8
	ouTBVOVysTLILhE1eQrBjPp34IVUqrsj11z5ReeYA9mm6dCbruSk2f9tc4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4trv0aam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e884663b25so55288971cf.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911311; x=1762516111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=N9pAhcodQDwmUFNNhEKcUkHmKbJ8tpuT1fCm8NT3bXBBw0T4tiWkXQpU1Lba9ItNOd
         IFGew+oa2TMIJKbyfIhX7wUG3mjdizpBN7jbhcUQMkk/oGAaqxvitiNCA9D/wmrSG/h9
         Eals3xKdj4C+axxJJoSt84s2KiHaJ2D8z4dM5DnFCKOxP3WkktLTsO83OrmwEQf7sbgM
         poFyen7ZEWmS6zorzgswGnPdPlraeC2ZcXYZN6GYGqaPgXeGorIz1Uw+L6bkk3Mz+FOU
         iJEeaxz8lQWQboStbZiWOLQuld2wQxFNz3z6LtbhvKXMsGlNnRtQKSkKz4OY/zGlifBc
         2yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911311; x=1762516111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=dbj2l0TpckVe8NQTtxTMxaEKQaWppWvnSei8EzQrztnK9ddY0sqQOUfr5/9/OiZuCZ
         q+5VTgi3+YaaVDjULIk7lIeyubjC+8M3toQUmBxYY5H8xf27xCyBaVZhW9yC7EUPRUyy
         MH3x7nwsWbFziykOZt8yQR00I1yxeDhuLR2G6ytxgfWMPgXgFXNhaYQIHPosXazRzzSb
         OFjpu8DZ6U7ycPcJoh0SbcVpx2jiVQil5QGdC/PFPSOgl+gSCwCqOJT6t8e8ua3oXmSV
         lwfi7q3OIzJM1rvee3aSHhiLTVhJw0cWIrh/teHX9M2bTOB5G6QswQ9HgiFjtLoqUaHt
         PA1w==
X-Forwarded-Encrypted: i=1; AJvYcCXci4lcb+1UiFvFw6DIzmHHpE4HRuiuykq8qCS56cE3gf/K8pzAhuwImXErx6eBLafEkAHgvkV9JsjUFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjyvzk8XC4OCKDBsG8ryYCyZky3RoAWU+2uTqOZ7CPbn3hNbLz
	YCAbLeXSHMRur1eVzJP9Rk3BfOcub2C0Dp4rnQ6eIYaCqpeDvgdZRSjDHOZ1UnBZwFW9IIfkssu
	Opmi0TFlVg9EYsIO0W701wwHotsABFnjpl0fYsFYmmhPLUeyyOOtb5s/LbQfpRK6EwQ==
X-Gm-Gg: ASbGncv81ES+yFOqLd7uoltMwBn39n3NxToOHE8J6c6BQjCNHBeN1WV+abyrlH9aCwt
	H16ov2IiLSSX7qxqS8/VPB3HGMZY2IKC3Irocw2cLFlh1ziAk0qu+4ANWpiNe8i1jhnmuvZaaJq
	SeBbYa2HkkJalITocSUcu5gLhWgCSeipSJOAmqcdSgNsuWRDXxmMlzZabG0IukuGkiobnXhI+H/
	zezHKMN6ofcAMiVJJ82zdIQIK32xuTHFkpWtNKZvdm+haqWCuS6uQcYkiLaE6vZpbp0EyZODqEa
	twhD4GKaVrldiUqlElJ7UH5dzvI27vVFhox3Wzo5HiNZvrhNFd2oywovxTaRXa5wCrGmKB9/XU1
	czhUC4tpkkvz4
X-Received: by 2002:ac8:7f46:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4ed30d5c037mr32900521cf.6.1761911311324;
        Fri, 31 Oct 2025 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1PW4aUXjWsnBLAunnktPoZEmZj62hrfAxwz0VwIb8pmFGBAHF6H9IebLcOFRhJ9pXXvAaxA==
X-Received: by 2002:ac8:7f46:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4ed30d5c037mr32900011cf.6.1761911310708;
        Fri, 31 Oct 2025 04:48:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
Date: Fri, 31 Oct 2025 11:47:50 +0000
Message-ID: <20251031114752.572270-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nnt2rwP5uLy5110gvRMz9_vDDWWaAMLg
X-Proofpoint-GUID: Nnt2rwP5uLy5110gvRMz9_vDDWWaAMLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX5e8HZ2N4aM0g
 0ERgniQ+Q62JDzbVufvczRGT8MamBQNXPyLo3eT9W2/PLroX9gJfUCcVn4VgdgOFw3pAUT1hXG0
 gNoneLkfn0q+M4sLXM+X1yPqnGmFcWntInG7135k5e7XIuzNhDerQvGLAwvMIKCoo7BTF4nqsx4
 ACubJf9490PjMROj5v5C359extFqvVKBT2FpaOrHA5xQyZociiT8haRBS4sj6cFvsVUIbI9G755
 gARhFtwZ5WzaBozMDnYDdRDIE33xFBm86YblD9oKQJwTkCODmJO7PS/kyWNicoc+cpMb/vHtCub
 p+AxPx0tVEUaQPL+KZufNoiVVfkN0fy8k+QU3cSyyJSz/KqW3TnJ50h7MDoND0qy7ULixVd/8ms
 +eTbmc9Y+bFQuqnJ0VF8DLbzhT+esA==
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=6904a210 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q4DFcrmTo4ZQpOTRNT8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
VA macro codec. This SoC does not provide macro clock so reflect that in
the bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index d3851a67401e..5c42b2b323ee 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
@@ -99,6 +100,21 @@ allOf:
               - const: mclk
               - const: macro
               - const: dcodec
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm6115-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: dcodec
+            - const: npl
   - if:
       properties:
         compatible:
-- 
2.51.0

