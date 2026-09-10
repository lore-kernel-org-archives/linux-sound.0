Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEC3C1F45
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021258; cv=none; b=Y3o4ilIUEYEWhMiRdoVjzBVZ4zHAsSMT9hwGM11ck+KO9sb6U4HXXQtuWJ30hapsQujZaBf+9nYF+W4NJlQO6zLR4Qo84D7f5LL+EKKMdcSHuepXjQe3VhL3oghn18PlZpcP9HiKjhIbXRlzTpCVRKEu304EKzVuOrNhhW0o/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021258; c=relaxed/simple;
	bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adQQaj7qwJf6oNDMMINhOzG76SflOfiUFT6cSGAFALr1/sczyXhYUHXpyh65o3UJNSVtKMMRRg1tT2mKrb9DuNcnGpFL/Qh0orTkwHVYK7DRwQ0WWaf0WH2ip8u/b1DK2e80O/134dma5SfyFAmblf/sSKAZ7NiN6t8ZckUlWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpzQDxH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcH1l+6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpzQDxH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcH1l+6Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GdvF162273
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=; b=PpzQDxH0bFF9MsNl
	nw3mNLrPUly0WAGf7d2b14yov9KywWsCEyuq7DS9bF8nfNRkzD72ec1Ci21ElUbG
	9cXPTrxaGRrJeqgwKeXp7DrIZExH9lOoWAUAhhzMLxhHPMvfGEhfHWHqkzf0SUAt
	s8cp3xSB8sLHfwE8fYFJnytBQAZugr//+QBtglusZ7Z6xWlb74WDf6SsVdSwUq43
	GUbBWDFnidIWnpo/UuJ7N/0458mrHwK/yN380XlVyzLEz0imjOmu5VmBhy92ifeS
	7GU0M0qQVTeoEAEMDfS2fGwd7vI+GVorvGwNhgW6nL09fZwlzZtzenRow+9m2q6z
	4bkaog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2eh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so105023595ad.3
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021251; x=1789626051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=IcH1l+6Zl6Gf7pbrHzxm/NT0egkGmDGTrGHbiVEiGQYh+hBZArme28/lpFpli72ANL
         KnWMqlad9UJ5UZOoLu1CNZLHG3VSkLPgyJ1BamC9+/Pq/ZvXrNlrTwHBVA3ZSw1iVtxt
         MATtwLUOl0ODfW4pRixpgP/n8S0CRtv+IEJ8XzZiggHyNfAsrI2noqF7GakAw2SsUohi
         1PXy3ysm6JE9fCV4zDkt7GVCgbrAot1JmnmcAWSCosfI3oXNWDkDL0fd4rcjcAPlBdNu
         82DcgiFUk49EVHuMASiTQHlJWsZkb9q6w1FgFp5NDQFClPYiDW4KH+VtHl1M4lxpd7eW
         KnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021251; x=1789626051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=Z/jYLP8LUUdES+v+7+oTYL8pmH/T0D98paYSS9dVcONeCK4fR3HIYubebSbZLeCUzr
         gB89WrFawxYKryiHQhGewzOpglL1c4iN4Zg7NCyCDNzUPc1Is4CEy+rCO923358T1VZ3
         8rwJCAi/q111Uu5ptspLO1Gz8SyCUqBf1oT+2b62wwn2t4dzT4PTQ609O9erT5EodIAX
         U8cRqWXsYDozPXoStEyh+rk7P/ZZoMWgZjaBeYtPcoNRqaACqrQwOb4f9LhG2ehbRhkx
         OaZK6ZMgGWqgImEEbT830P9dHoV2kZjC1MUgs0phcBjf/QbtJ3m4u3RuJezjKmcV2tb6
         Ks/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQHdD/C9lqiFFFB4ybUcjohL7/nm9UALaJ7JtCvyP0Q04T2qt9DwLA5B9p0pOnEnCFDRCD6J+KIVCRkg==@vger.kernel.org
X-Gm-Message-State: AFuF++mEcZAvnS8h+habHCcpnhu3NEmUXFg2qBUlYvrt/NLylb4uPcG9
	N3SF56q1RYwsusNm/DKbELz4ExI0EFu4J90BZP15OZz412ZXO0Ejrv4uHPSx+mvVlxdYFQt1Ryq
	jfK5TYLTW9y42SOwagFyamivHA1VV4Wt7lUB+arOttNh0QzEDHlbr81SJO5zDAdAQvw==
X-Gm-Gg: AYBFou3tgtgTWvr6kj7sxpQODPgK2K8IzmLKY8nzmyBL6UsTQw9S0UMqw44TTFtC1la
	gaZYGNNSyM/xhX4AZQf0ihwy1SDWYim88WUkeHT5FUey6Ov84tLI9j2oa3IfIK0DJKHCu/YkESw
	jvJHncyuuE+3dIbROUMTY5GOEsWtd1wzWd45u0u0KmLpWQbbEnPVZM1fZUmF+Cs97yOzwG4VHwz
	Xmy/kqDYiFhOi829xBW2lJljXQU+xYijpZva7C4CAqakwYS9Dg1ocboiarn5yXpaS0sQR+oJ39k
	ChcnU0jjlOAGPyGWvAgND+GL7VUW5Dp+tuhWU+gyr2LCA4EAiaOybJzkYRl3w99ZayvTOJnnopC
	xzn2wFNly9rSsTj+1x4Ro2/TWX7z5Qp3DVRJd
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352995615ad.19.1789021251543;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352994935ad.19.1789021251041;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:50:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: soundwire: qcom: add
 qcom,shikra-soundwire compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=1210;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
 b=0xilDjFBxsdVGeNOVdonbjktJDRXI1p8o8P87zKqhQ3BL1MRfRpqIcESAoPrXomaLwLXuTaqj
 HHLDsgWuXmeAjuSP2dci8Pza+Rqzo7LdtekQgCeJepulA7RSH0m9moL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa24c44 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rFUVSjzCmDUomrWsWBIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: inRAcCY9x14JfMKzWVnSkRrs1DQ0gpNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXww2Bltf/nSDG
 GfLr5OS0RRjYmA+f2NhfJ3dV8fsMGYcJb/6rDrbFRh8BJ8h/uJuWsUIWuqeh9PrecAYSetI0MYW
 bueoDED/da83h8ELSq/TG662dPnoXSJVpZMXnuK4/UeLhmsq0tkU0MdFJdXLX6MUlQTWEyQH3yk
 eBVAs3YguQYwjbxRZT0uaxFI0AQffD5er8n6meEsVt/H9wLYwguzXav2PsoaeJhkqewe7YnSNxN
 mb6d1i2ufy9L4hhYzrmAXDEDP200717xhrHbFw2EmbfAvpOJ8QlyovmsuhcYrqvNgr0Arh9EzNR
 cRcReN0r92IvhbtnPYm+xKuH6LK0Oy5dZQ+tFzmdd9gncG+UK740HxU5nOV12So77mcH4yE4d56
 pZuHFcCDeNd3KLOeH3dK40ooKaSDYAb7wSE3871t1jz01U7K9o73ntfXeXw2QmlKptyQlFfpCF5
 IYhBaDLtMTMk3Hz07Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX+sU7aZF8qytA
 kAb4pNNSEcfLscjdZsJWR7mVuGau/zIFcUwY0BQZeiYyAehwGZ2kTNhKrl4+FU+znuVuUALlUxC
 ChkJq0USaQMTMx/YNOG1aEVbWFH/YqI=
X-Proofpoint-ORIG-GUID: inRAcCY9x14JfMKzWVnSkRrs1DQ0gpNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100064

Add qcom,shikra-soundwire as a standalone compatible for the Shikra SoC
SoundWire controller.

On Shikra SoC, the SoundWire controller is assigned to an Execution
Environment (EE), which determines which banked register window must be
used for interrupt, FIFO, and status register access on SoundWire v2.0
and later hardware.

Add a dedicated qcom,shikra-soundwire compatible so the driver can select
the correct register layout for Shikra at probe time.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa2..81532cf69 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,shikra-soundwire
           - qcom,soundwire-v1.3.0
           - qcom,soundwire-v1.5.0
           - qcom,soundwire-v1.5.1

-- 
2.34.1

