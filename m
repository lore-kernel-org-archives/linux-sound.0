Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B417C3CB2FD
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181261; cv=none; b=XifPkddjkg5l1mVW+N5u67PtzeC24Et4o8s7w+5Gaqw71xiUWEylEDz1gtGOOJuaIAVzyZO2WX5Y2KUgN/3E1Kne7Oj5juGWJES1RdZcv0/pqexVd2Erbpo8zv9dVRyvW2vjDMzaWGZZDBYJ4pltpWcvQSUVK8Kq8prljct7ndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181261; c=relaxed/simple;
	bh=bZFCmikbhjibr37QyYsw1BYnrmuWJX2eRfQcgt38jzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H29b853wSymth7iBBMWRSdSvajiBKecZtIJE0v3JPK8lCVnx3yHXGoaxxegF8ZfvB09NmL95oefpMiFRNLDrJI+wgDTS4W4eVaohdgJMCGwXADfAU1s3VYDEzdWs3FIjgSnNfwG5X8hx74s/TqTgkaZMKM9elsuu1t4pVDKC61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahf0l9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BESC2Wq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahf0l9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BESC2Wq0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTsBh3665865
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=; b=nahf0l9FZwqO/OFE
	YtKXTqp3WUrfiS6yFO7MwJoQSV+O8vg1FEkNYZZoJiPrc6kIb1vYwu0fGqql/9Wf
	IdZG6Q0qROLFo5bTn4CZ0hoIpWHDMRbv20dueCA+U3VZb1nYN41lsPsa6u2hLRkL
	9GyOXAuRRBThbUCYjDLLZkFBFUtfYnE1SJ47+6g5ghMJzElhqvrUBOt1dnMVP0C1
	Fn+bK6artLcmN0agK4NsXccxSNZnUb/DlWNOhEUFOGLkEp3T/0UIw4Bs/F9ak4e2
	vAKX2XYofATsoLY07hkk7bqM20PyfqJMwAKA9dDsNOgcL49OiUOOBIgv3LgOmL+1
	FA+vyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasvmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso9547605ad.2
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181251; x=1790786051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=BESC2Wq0iW/1Mp94ToovqSiBdTSZqtuYRHI9Q8+JxQUCZBzIxHnXcLiqf9w99e3l+h
         O1fEz+mcYxsvvZBQvylcHi/dBDAOmDSKK43fcvBXxK4R/gtNqCC8fHmi2GYqphEQBFci
         56lTfLoVZyb+0nNo1WawSbIuzecm9y84AmCn6XEVg3iWC9kzIt9VZk7dtS0sVTXRI8Z7
         LRPj5ARQX7pSQXRwPp68MccaaMWRVh0d1jbZQBepfrqDVsr9fc+x45SZYW0A7GA4nkhh
         LYICSW1rj897VA7P79Tu/hEO8D+2yAiNH0AgHVdecZKh3gYxzzLsRSpe+R2NShnh58O4
         +M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181251; x=1790786051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=Rzkw29BP5ZFUPg51ljjvihYG2+dElXsPjTK6sk0AZe2uXU5qifFkMz1jXBWeNBDMdo
         +HxBjl4UDF5qbVCj4DbWKHHHwMBGo4mJaG36PD7GVcuG2eex5qgdtsQ8CaqxlTEvvSFx
         InaGb58tNH8q6CNeckE2di7WKY0Zsyaby+pMpKApvfWtDWNDmkX0wbe6FW0scWH8S4oB
         AfjfSAChpv2TR1CcmMU4QOPEZPoO4oWwyxexfzTTNyqKAdRSsfgFnU8Esz/oeQAv4ch+
         GsTiZmfYsEKI6Gh8EM7KyuOftplcIkQ+6xufKq6Zt/MHI+ZbHbA4EKj1Qa4rEWyMxvXm
         l4mw==
X-Forwarded-Encrypted: i=1; AKwUvBwkI71b1EIv7Igtv6oucA2/hQD7sK5iUPwIJAAZRwAnVcgo9Vdu+qsNOXHWlHthArPGaPo8fDz/Q8lY9A==@vger.kernel.org
X-Gm-Message-State: AFuF++mYDB0cwQqdfjkyZAQwv8KGKXHBeg65fcL9cv4qWUC/ACFDLy9B
	HmqAC3pP6CM8iNVzvwttoH3dxg0Yb4iMGwVVgwcfKR0vFiQBlTQlQ81GruIIhLK7RHEytIB8YEn
	b9A7b5uw6prfbvJareiJ9iv6GLQ4gLK9kKQUxz/aVkxcywlqOXhltaW11/ZncceNIFQ==
X-Gm-Gg: AYBFou2JE90OCe2F/F+lrcWNwSpZs19HfXbsYgEm+f+eyyoRF2xvfOoJ0HQ8ca+IFJe
	icPqskz7K32vqYQNwZycvVlvSDoa4Q/VMKPU/M4DKW5CEcjdKUzxaFGb4CuPyDFCEPN3kTf+6T8
	eym38AuCyl5k1w0vczJl8OG02BRqTrJ6l82pP9ty3tCT8Ca/BkpT6Pb2vrgThUnvqGWB/lOZzJo
	TSCVMAE+Kr9eVLmYRYyXetCKVbEsTwDmcv8aeBlv+yLBYyLyPb1tmSoRquCF7OkuyCcyF3UgDWD
	5shg6UQeNMsIwZqpoziIWHrlNilHrXtzH2U0K7eSIQ5pb1oRk6Gp7OUf0TTxVGVTlzjbIkL+uhP
	WQsUGsS9i7jTMRfwC8SShcLEf274=
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747625ad.34.1790181251350;
        Wed, 23 Sep 2026 09:34:11 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747375ad.34.1790181250803;
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:40 +0530
Subject: [PATCH v6 3/4] ASoC: dt-bindings: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX0cSQ6P2kz+a4
 lfIUjV1Okaw+/ij8faQrdhSg8V4ElZamubWj82Mtv/TjT0JFRpzlQI2KqSyTLn1P3hSnCnQJZFL
 kJmSTM/VWhjPUc9ehi8RsRTGyNINCrodJrrbv+tri4eh2QhqWnppKToYW/nSD/f+QRTJWLHwJdY
 VBAAU7aQTqT7R6SC+7KBilXrGVrvm8bMxHWHg8i8M+3Eb/kuKIEghZ0sgWEnD9Z9PDCfx72fZCD
 ulsCD5LVgKyihKll1K8oXHIdZffRPZDZ3KDX3NYod3iSV1XWulqKl3GoknM8Avs2eTNZKRbAvTP
 NVxMwe0QFrxwhMDAKbNTv+a+MDF1VaTKqC2O1+YSR8diMxMTFHGewSlVvzx3jjYweU64RITqoBS
 EtlaP2hUsmffdffFXWsV++LQ3mv9kYfYQ77dmV8tFyVu1m8XSoeJeujhVoENOwsb69qgOAtcIJJ
 FtkzjwW0oFefANBUSng==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3ff84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d-o4ErlZh7ezHBmBfcwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GELZrNtVv7QjYyZyrMAGa3cuiMQoBqV7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX/hnbHVcSYGP7
 bDj6N8yJtdhmpkmviFQEDiKI8Lj0w5yM93DAF/ZalE7PeihA6TyQFB/8B8eLApwJYbZ7kbDpgXG
 ED5DOA6cmMuQ6Aklq2kCPGxsjFRUTSU=
X-Proofpoint-ORIG-GUID: GELZrNtVv7QjYyZyrMAGa3cuiMQoBqV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add a memory-region property (1-2 entries) for the control-path and
data-path carveouts, and require q6apm-dais nodes to describe exactly
one access path: iommus for SMMU-backed systems or memory-region for
mDSP systems. Remove iommus from the common required list since mDSP
platforms have neither IOMMU nor VMID DT properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml       | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..c1f9fc9eab64 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - memory-region
 
 additionalProperties: false
 

-- 
2.34.1

