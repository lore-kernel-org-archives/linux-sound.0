Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0E3BFAFC
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619882; cv=none; b=kM3EIEn619m+TH0yY3hmzD04lDnG6VPb1FoWINLCVe4/03VnjXYErEBeNiDYapN88fE7sK5Mm05SB/PkjMRGrLPYJ0fPcLhPTfN58ItWT3ACroE1/Trt/3KMfMR4QvBxe1NNOH9d3uvonuRy6phUn3SIj+AVjoW74RDws0ZAQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619882; c=relaxed/simple;
	bh=Tk08geCKF7VtsNMNSSkHEJwE8HUGWbsjpMIXHsbhvt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXlyJEFEoDfCStQ/liBP+rD8oQYk2pceThLpQz7z9Y7sHlxtnzLc4hHxGtEUdtAwkFfh8s+Z0+MnDbkJV25IqGSeifwh+jVj/XDGlYWT1njkHUbQjLPnnHIpQSvTEwJ02OLMsMbeHoHTq0uoqo0SFI0KIv4FwAadifrrJXxqYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSADTz9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzGcrGT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSADTz9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzGcrGT0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GNWBgs3597308
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=; b=SSADTz9HFgznN2hK
	2viHJc/rexSB4V1xKTos4Mze2ffYWLmZ+EM8Og0GlJ8dMD8XA74aMr+AqTwwPcG0
	9Vx6D4X876sju6+tj8HiqoXrZLINhPkaCCgv+lViDt9W7LMWv1kjyGgnxVXXG2TR
	/fHpJhSZqq182xtuLzzsTY2vNt+CLfOS+Vhv7jo/pafFL9deqTGZSEEaXRCMcY+t
	1sjXGbb5HFGdRxWLHyTy+JgviI7D6aEqRX5h/oBMpviTr2tbd7GDjxWlGundHMoW
	y85VpOWeWlTDtzbUQVsfCE6J9tPvwqog2fudxapEuo6VY/tOLl8wjPwLgxvPCs2N
	TCIFhQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayaprt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:37:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so382090a12.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619878; x=1790224678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=;
        b=fzGcrGT08O+BQXhXUunQe9kICwGsZYrjUVCaWOl7AYio89H7yfDZnECIpfZzXSWebH
         QdEMqeFpbV2BdrvVVUOM1svUEDWgHEeAh3zLG3P/V1NlXPQ7dyhn53UDRZDy5KAQJymv
         DuNR5dnEBKK5yWrvTQgA11XCP76PzLCDHSVhHrI66XmWJnOM5nwiB1slAID/+x0WBZVz
         i/T6iOZP5ILPpySj2G0Vh/tYzAETmh3SXSC3q3IqrNXuK6f35wwvHPl888vYZIL/YihX
         8a0pbTUOXG05VrTW4uwqREmenMVD+kczkuIIsFE09QDKj4mDknrhtlthZtkHwWKuR17L
         NIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619878; x=1790224678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=;
        b=v9fwd9FsRtw8Emt8VXX22swEY4OpZpOyUqH/DWoIelhWhUq11+Ux5vNIE1tyUADMlz
         EBsq/ujHsK0iaMN2lUCPyfw2B2Yo6LyzNcVfKGKJzleVk+veaIi8UQI6t5XllmNq4fua
         aYn+5FuP33UGOVW5c/89YuwpLW0kcVX4Y4eU3a8UAoxbsq6oE+wAZgdixW6sVUE+cZJf
         OXlPegB5FLlHRCWlM3yM1Ng+XissqsqHk50j51BwgScXO5jgtHim+de3FeUH5VYqPlKB
         l4RF3So/VlioiN99k84kdHI5XMia42swE8j9E/SFiDWGYfKqui1Yh+ipb9CFcGYRS3g/
         Jq9Q==
X-Forwarded-Encrypted: i=1; AKwUvByMKVclreTKXssLhpQdA40hw2dZKtjQ8kjNb7hn6ZH96R87em3g+G+aoi4T+9j+pj9/Y13zH4D/jWZyHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kHLEtSFhXMnfQSFjTpCki3q255MtfR42Nk4gS1mvhN+KKqyHda
	Ty50ceyg/Ja5QmvC4msjegTd+dRpQy8O8AhbZj62lj7Eohju5O5sy5f4kEoti3d02+UrMtjbDxJ
	M7VWVdX9yflIax6xoV9YqNx8qytU+mwDDs7kFlBLrAcuho+TAax+caazdJXqzHy1UZg==
X-Gm-Gg: AYBFou3aI43llEs+ltRyOhJ0uA6te5mQPvad8jmVUqgzARSM+rXJo91wiYmF1vyXsY3
	i0Pt+OS5IPz3/tK40A/XHziHuOfamHaZLe9m8vvKnFZoIxMpItw/CxDEjhLLEnZQ3W9RQK/+3mi
	49Y8HSq/droadA7dpXC4utzby8EDDW/ni5q5cgIUTsvPVafyQjBhzhj2GxlzRECf/VxFbpqSeVG
	JSKwqek/ypKdGm3v+WqOh+S7vleAn3+XQ+g8D2gyS28g2V3PFhTv5i5oN/0sx0W/fiUPJJYqQNz
	/quVMuzx4wNKTo43dySxVbggoK7Ry9DWTQkMzpTKhAdLYDhHkRYX0pPWrr5MfHweMPj+BlkWXBG
	jJoFIdVUTT8yqpXyO9yaGGCfV+leiczJH9e/Q
X-Received: by 2002:a05:6a20:7484:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd5f45e96dmr12907840637.7.1789619878386;
        Wed, 16 Sep 2026 21:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7484:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd5f45e96dmr12907782637.7.1789619877941;
        Wed, 16 Sep 2026 21:37:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:37:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:30 +0530
Subject: [PATCH v3 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK
 channel for shikra
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-1-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=977;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Tk08geCKF7VtsNMNSSkHEJwE8HUGWbsjpMIXHsbhvt8=;
 b=oNG8s0hbg7Oaxu8CBQisHLoqD6+rJnKGNIlACMBG6qHf2IZEwlQjURX9niMlMPY4GqY8ePbJK
 te5azw7D62HBounyvFdqT9+Vz3U9kX9V8adwjte1IpquowcEhcQk02d
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX2Rd9WZroijXq
 4P8LX5Pr4M1MecVlbgmYtSLnQ+V8roaa+mWrM47DB09V9z1ECOEr45DxrTo8nVBUbLH9ryfjX3u
 k7oCarizTBf2hrcTevwvMs6EtJyc/HlnN13/8+8nTLXoZ2oZT7Gbsuok6uZ4DM/b2+vEpYFIkWl
 +MWvpBs9CWzCj/O7Uydb183VncO1DLcc1VbpYuDIuiWLiyrvveb8EwS8j2RKoahUUFQoRsjIMh/
 b+AQBFQLbrmZxxU0fXnpe9D3Gvawe/pgHWY3YTYk7RKRTmmWmtJabdNWAoEzgcWYfAW51WW6p+9
 9rjHtPGlOoHS/0scWgyslYQEi0P0jfwQMcH0ZB23p0/7PoUMV1H9AmXE0u0wpsGvHZ17n+Vt+cm
 +xGAPwQ/v7zlGbBPpGVUodhcwX7jqqAC7iab7eYhbJvn/Sa4rOOxByw1gS0VMeRlZRqEfpcGczg
 yH1M1McoDMq+3FH/3mQ==
X-Proofpoint-GUID: yiHsY06gmKOAYeaIVveoWOxC-MdFBwck
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab6ea7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HnBwLnbP2RCvDO8bWWEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: yiHsY06gmKOAYeaIVveoWOxC-MdFBwck
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX5XdQExrQhVdt
 yzPNu2vFqVB9YQu1YIGFFrCbRTx9SerkChclZqkZotUNDP2MEQGVDg00H4lb0hXgyZ+053wedob
 7JQJUdAF7bCMaVuo3v1j/54dm4hMk/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170056

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:

-- 
2.34.1

