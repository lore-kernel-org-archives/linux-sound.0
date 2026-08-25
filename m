Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018EE32C94A
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683246; cv=none; b=hBL060ai2tE5FRt3JfFkfGhBYpw1DZ8lo5F68WXwYHksxDb8UFcfb0oOEk16h5CNn5dLGT7XijWzhyI99IN0rDGOdapU1lmdb1io/krYNwjimTSSaX0eVc/Mlhr3PhALS2zRAAXJS6JahiUkeEDp/dQmpDRMvoTYnKSFdbeZO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683246; c=relaxed/simple;
	bh=VpLeI1weNXJ08CxiM0YnVaXdUGET0/3JYvolTB/ZhUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNje3YK5lfnEoJ788g8EgbsX7ba5Q+K4+3mUQYZWvuPK/fbTQMLemIPaZXE1IPulRDbc7oJjyTFGgkZ6tszJr0gxaFAjhGug/51XloOJB2XWutgSng30vF4EHxq7bjk8YzGVwRzX2S9IjCl68LnCcJLJn3Y2DMel+4Znajo6Pao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phC+XQzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHV18eAe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phC+XQzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHV18eAe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdJEk2645877
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=; b=phC+XQzSRufiFNX5
	dB6OaknIe/kBPCkutk1Eoosyoq4769J7pwJj8GWQXuLZn+rtcX1fBaNuXICyfwb1
	OTFOUOMui63ZijSg5IWYsrdzukITA4veGZT+hXEj5v2Y0ebmQ3I5hwg7TiJDNGyB
	z+alAFHkblpS5qEI+pZII1kG47F9tVG6lDPqcg/srWxyJ6NT0revKmPnLP0w8ic6
	uJzcvIuwzxUo28D8zw4QsSROyFW6BGbhzVgkdIGCyGnssZJW6V2IJ9yEKBteWF9W
	xTXy+tTn42S9hdO5gQ8lK5mkZ+MBlFxUC20HqHU9vR8Gh/skpHyRXwSBibx2D6uQ
	8BdyMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bku9h30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so2046995ad.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 11:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683243; x=1788288043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=;
        b=MHV18eAeabV/YueXllzYawqgKWovJ8aSyJ4oxr0W68lUwqwCZXk2jPn7e35BrazJZe
         DDHT7XusqxfVwxMXPlVP+wzL8LBDcEOGfL2hjD590XMM+15xHIMNwJqHhk2FRPcrmHRe
         qBGEAPs2xw3/ZRZtr1qQpkJbMZnK3zqrRWboPA0+5Bb2/2qDZCug5R+KDTVCMdIyT7ZT
         sz5wG6BBZzFMDLIMqKhjIdYyjPLctrn58p0PBkmF47W2dCaFiGqSD7F3QfO61pEvci/1
         PGkw/n14ipvBzLe40QoyZe3QhvvvNq8i8gc8P1tzBH4dktazAgdadwWqaJjTdZAq4lv2
         cTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683243; x=1788288043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=;
        b=FGEBJgBLdqKTMLv1RIMBNk+aONJBa9fIe0TvfI48sfnKXwn9kHT8+ovNGZBYrl/veD
         gD+ZHIENkg3ZR9D76Ywd/URLKSWg6NGj0j+BqzA8yJnW1G8XvCa9gzwWtSBtS8GZUeop
         tenaavNHc+NqbUWX4t8cron7YwsqCp5jg6apdqmDVj6UWW9MhQWphxbqMPj6+CBynWKN
         9YgoKuM7QHZH4EZKffYkNE8ersRQl/VuQhTP1gHTZSFrJGxl+NYNQvSaAeThvI6BOOe5
         dH5iGdOabnTWr8N0g+PFk7m5rFjkNgJvSAtFKSgAA7Ob9xKJOScfecI4N7AlnMZxyKmw
         /szA==
X-Gm-Message-State: AFuF++kHznrWu1QCOf4P5Dd9ur6J4SF7lPuRYNquL++AhYlU4owDsv5s
	d7oYbLpJ75a1vuMqrdVMGOr9eWvJC3xy6EfAccxTRx/1ifxO5GaWZMeqOwKOPefp5j+Vovm1Cej
	reTo79fh6iw6MGpURCx+WsiQnlMjU5l97iK/ewZg/wny2Ms2YV5gCB/UoX9eIKYzMTg==
X-Gm-Gg: AR+sD11rMH64OnS784gyIoq4ri6N9zhFuLNOEHAbbckgQAFjSSQq8x7PxkPTnbWmXgf
	wU8RewPWpKPJbQBr5zmacNajZqO771Mx/PoEIGbdLD7Btn+5QnWeJusYxc0oBogPpXGApT7q/3r
	L9K2qwhRi86IXhbPZcgPtBSAzyAi2DKx4Jfq/Bf2CS+hrWcIQ6/EJDko1E4UdNk8cigYMFEOB5z
	nED3odEFetWJAZJJXkeXqVXmgB3Kvey1dMC8ksGk1mHY8eEwrFu037RMGkW03rYaSwhfcC81SJ7
	c4SA5KFvGyUx3tTRhYdovwYgmEiWkvyZa47Si8RRBHfGnPq+vUxjEh9k8GNzo3lUPZvhTgSr2de
	0lVScaIVLkq4h7fm4lCguh+d4+Yci
X-Received: by 2002:a17:902:d54e:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d707aa4b9dmr6005435ad.5.1787683241653;
        Tue, 25 Aug 2026 11:40:41 -0700 (PDT)
X-Received: by 2002:a17:902:d54e:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d707aa4b9dmr6003815ad.5.1787683240972;
        Tue, 25 Aug 2026 11:40:40 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm256117eec.8.2026.08.25.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:40:40 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:10:12 +0530
Subject: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: nHhachQg9gazjKELHoGjWOfZMEsS3MA1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX61C7pNNRkX2d
 iRLOyGDbNHr+WOOjYnw/nEc1ePkGt2M5afsZU7g86SQyO/3W5Vt/J/Bz535l77kBCvkVSMavCJA
 BFVOUxxV8apAmudlRH4OpE8B8EQh9R0=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8de1ab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=v26nnA4qrlwCZKXH8T8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nHhachQg9gazjKELHoGjWOfZMEsS3MA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX9FP1mfhflEsc
 9zI4htqx8I73npHMKsTXp0pZ/TaqVgYKNiWIrvbvBw4eDB97H8xZBo0dyNV9ZXI8laC5Lvb/hvH
 v6IHSWL9P2+oEpLclutPt9hTqv7yTXl62H8YF8xdjWzA75+ykGkQo+OGHOsI4W1rBkygPAr8Q+x
 EnOExtf3Kmlicz2cM2jOcGn/UCC82zh9HYC26HPM9YKWYPgGmmZRhHMaAerBaq4JM3EGcQgfXja
 PwyJ9okSPwFQQ3JPnZdb7QqptWeFqMZrHInb4ytkbm15ygZx9hRMvr9w2C3zlXqa0IabIBpmu8W
 4F+R/HSatb9BdHmL9taPH/jEc7r6Z2EBGza+Gmehyww8udNDPwkVPUiwyLFBicZuXJx2qingLdf
 XvvtB0/wARdIKXeBXfCPcPKQCayu0ypBI1K05CsC+/TMn8JZqbBQqC0rrMuxClKsKWGBCeRn0rY
 oI3fxHns6aYOtm/zmxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250158

The APM DAIs expose PCM buffers that the backing DSP must be able to
reach. On existing targets the DSP runs in a stage-1 context and the
buffers are described to the SMMU via the iommus property.

On platforms such as Qualcomm Shikra, where audio is served by the modem
DSP (mDSP) rather than the ADSP, the DSP runs in a stage-2 protected
context and cannot use the SMMU. The buffers are reachable only after
hypervisor (SCM) memory assignment to the fixed set of consumer Virtual
Machine IDs (VMIDs) that own that protected context. Describe those
consumers with a new qcom,vmids property.

The two access models are mutually exclusive: a node carries either
iommus (stage-1/SMMU) or qcom,vmids (stage-2/SCM), expressed with a
oneOf constraint. iommus is therefore no longer unconditionally required.
SCM assignment replaces the buffer's current owners with the supplied
destination set, so the driver always adds HLOS to that set itself to
retain host access; HLOS must not be listed in qcom,vmids.

When qcom,vmids is present the PCM buffers must reside in reserved-memory
carveouts that are SCM-assigned to the consumer VMIDs. Add an optional
memory-region property listing those carveouts. The first entry is the
control-path buffer and subsequent entries are data-path buffers.
memory-region is only meaningful alongside qcom,vmids, enforced via
dependentRequired.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  | 72 +++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..d9a6bc4a14f2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -10,7 +10,15 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APM DAIs in DSP
+  This binding describes the Qualcomm APM DAIs in DSP.
+
+  The DSP that runs the APM must be able to reach the PCM buffers. On
+  existing targets the DSP runs in a stage-1 context and the buffers are
+  described to the SMMU via iommus. On targets whose APM DSP runs in a
+  stage-2 protected context that cannot use the SMMU, the buffers are
+  reachable only after hypervisor (SCM) memory assignment to the fixed
+  set of consumer VMIDs that own that protected context, described by
+  qcom,vmids. The two access models are mutually exclusive.
 
 properties:
   compatible:
@@ -20,9 +28,42 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    description:
+      Reserved-memory carveouts (shared-dma-pool, no-map) that hold the
+      PCM buffers and must be SCM-assigned to the VMIDs in qcom,vmids.
+      The first entry is the control-path buffer; the second entry is
+      the data-path buffer. Only used together with qcom,vmids.
+    minItems: 1
+    maxItems: 2
+
+  qcom,vmids:
+    description:
+      Virtual Machine IDs (VMIDs) of the processors that consume the PCM
+      buffers and therefore must be granted access through SCM memory
+      assignment. Required on targets whose APM DSP runs in a stage-2
+      protected context and cannot use the SMMU; mutually exclusive with
+      iommus. SCM assignment replaces the buffer's current owners with the
+      supplied set, so the driver always adds HLOS to the destination list
+      itself to retain host access; HLOS must not be listed here. All
+      listed VMIDs and HLOS receive read-write access.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    uniqueItems: true
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - qcom,vmids
+
+dependentRequired:
+  memory-region:
+    - qcom,vmids
 
 additionalProperties: false
 
@@ -32,3 +73,30 @@ examples:
         compatible = "qcom,q6apm-dais";
         iommus = <&apps_smmu 0x1801 0x0>;
     };
+  - |
+    #include <dt-bindings/firmware/qcom,scm.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        audio_heap_mem: audio-heap@a1000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0xa1000000 0x0 0x100000>;
+            no-map;
+        };
+
+        audio_mdsp_carveout_mem: audio-carveout@a1100000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0xa1100000 0x0 0x400000>;
+            no-map;
+        };
+    };
+
+    dais {
+        compatible = "qcom,q6apm-dais";
+        /* index 0: control path, index 1: data path */
+        memory-region = <&audio_heap_mem>, <&audio_mdsp_carveout_mem>;
+        qcom,vmids = <QCOM_SCM_VMID_LPASS QCOM_SCM_VMID_MSS_MSA>;
+    };

-- 
2.34.1

