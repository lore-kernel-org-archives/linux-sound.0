Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718307;
	b=uw+ER2d+aF3G4e5DgFCi8p9dQSJ1xX2ldfL85w3P6FlZqYQJ3nJsEJ2YsaTRQsODJ2yd
	 AiILDWBNUjF3vaALTl4EGM+nZFIoTpp4OTYaxGJ/NNOnlX9N/YoAkVztmZlBVNYSqYZyr
	 B+KSSBlTvW0MCJZdUP0K+dsax78BFKZ9O+mmwHhplsuM9zyoAHslJ4+p/TZfcxdCR2+xo
	 ma6k8S2nIJs9OZQ/sFe0dHQBzY6JloiHtwvJnsGoYW++ACTuGLqSWLfsR+3uI0T7Wb8dA
	 YcX2dVCCR+zwao1fOc79kqjccD0MTT/pIH9Rmp9th658Lq3n22g34cgjfUd9VYtWe1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
	b=JsPqIzifvQDYP+RZwkELN5uPHGbkWMtJFhcfbUyf4bQPRp8603fdlfy57y1AUU25qY83
	 EJKX/96An8KzX2Qbr4Od3w9qypmRel68FN3fZwlUmeqXI4fmTOLpdfOTkNJAZQcrloMVl
	 24cl3ozciQVNIf+6pArITsJSxNBOMJKTd5dG2g0ZBgW5J9Pf+Y6tkeW/kXvsMhXPn0Wxx
	 frIDZtsAFMN4YrXi20FqUdLQnm82A5Vh8CS9NP5Yg72hPYmzIqAyeBn8ENgy7S20Z5A++
	 C/mTROufV+p/fkFlWdFqvKLk7YQ5qnLnqPhQWDxPf6B6YZ2igJ9MPYnQ+jkhNWge9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiAV9ePP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D07606A69B
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D07606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiAV9ePP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuBGh1847905
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nH9UtRA+iyb
	2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=; b=WW5cN8+2V2noCVEsOBkEE5TPXCh
	gTqFl2XcpTGncgwWJWlyGdcRs1G5/mmhUqkCaRlMFkj8pMJq/PLusOuMvxKdzgEm
	4zKw4r/5qo+qwYSDtDoskm3Vqe5tiIsRPQBxTZmV4whQizrAIQot8udq8kciREIH
	DEhwbTZJSYd+GEpYnCUX+kCAF1en799LPpx8B31lcAaRWtCteI3xAuD8mz07QUmb
	LUBfknojAU7TQrkAsMXj6SxX6DkBO47s+7QjHFjW/Hajcz5WNPvP7rOaHISku22+
	+8zVr60NUoK+R+fmSO0JQsq9jTJ2J/kAgaacdV3C1k9e0iFoOGtxJvprc2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tf5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1099658285a.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718305; x=1796323105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=JiAV9ePPBkVuJnLJU/i0dQLFehvSbMjSEOK+aPzzohQrobYxtC3JG5VVuBZ7hWkFOs
         E0+BI+pqpdF9sj1ZKCxWEGbqnfChdfd3WOnNHM9Yf0+fN6M2nAe7W89QEAGFoxGzLCuq
         5SQEzhp1/70vbIa2iB2HNt+Wry35sIjpkfKo43pH9IE3AOENpq8S29/hBH3IZFArnw/B
         VklGy3tmNCQZtFoGMiq7Jbz79de+IiFJvCGdj0waBOJtDu+1yUSxzaAp9xBEEQqNptHP
         zgQAQTK0afJH1+6s+9B7DS6xgwt2c4ACq9ghkMsgag4WPRZBQa1moFWkQqo5RTcCgBXG
         SN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718305; x=1796323105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=kgH5Wp4RQO3RtntbqZ/SNHEF7I8x3dyt3gZSNolS8yflvfIQcunOPGpozL5zEzEewM
         OGZjXW0m7XRx3OA03hNubu5d6tbejTtt9KTQsYDSAe14dxVFIfDmXfbZm0MqXLiGPvEb
         4YM+5JaL+Rtxzf/dD1tdacZ8BIRRue9ZyLKHHh1jgsWr0OBfBUMFVLN90ry8KLaQey4x
         LzdQHg3nDjubxnnHI9Xrsw8X2zussgKWtVCIJCcsBCQJq0ZBN7XiBS6JEOIfB3ZYI64F
         kNyUxYnChL4gSQmrwBtwebI8hmAJ3QrHm9kQ2IKafzIGJ+UAxN6jeMKNCdcgl+jPJfb7
         bG4A==
X-Forwarded-Encrypted: i=1; AL+hErHfRswi2mDGW+JoGnlG9wSCk1Iyq9ORsYvA/vfTWJrHsRJoYq9RyZ+uIpGxUYcza/xDybL9cMXGLLCwAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0uUuxpjIioCBxwHfxRUrichTZC75GE1bCsig9P1u5nqdfvNTa
	QJPtgUlOSe0ieGtbgfucpKrWHNyTDCVUTM62UGSAt1mPrVtErNhVeLqWQvMAPDCjH4YVV364XdY
	WUwaiL6soBKFSeZvb6MdtYePjWh1uXV/oY3PrQvi5oPB8mP1rLVOdjiO3VehgWboMkg==
X-Gm-Gg: AZFdTZfplrhy3bgmUyuTyrm2kDOxfoFqmEtiY3TcNAMXDePBxXJZJUnvGWV5ilO02U7
	525t4GQNTqAaOhZqLAKSbLNyVIOZuifZ5+CTvxV2dC1l7kmfaoUI5vuasfTspP42tAzTndnUH36
	lY0H42tPLs//f4rz0bFj/O40YfUDOGgEmxGJMW00YF9+l7CfXQpJLzeHycniTeTsP+2Q1BuC/Fa
	2BDJbAf9tyTM/68+yB6wsVCvcPBHqK6QtLpr/wJw5UcuEbMC3yZ470VTdoXs05QI9otjYzQo1b7
	5D2GSA6rcf1ENy87g7QrTJMYOduCmB+RWjI8K7wmOerAAT9zFKApsYtgne6G/YfCr6rCjG2oyVY
	7CmnYoysoKRZBtFYdTNkAs5IrSS1jQoMB0UjlonkYuwYmmPaEVLyBPX7ZJJFnESkL
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223073985a.21.1795718304581;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223069685a.21.1795718304127;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:03 +0000
Message-ID: <20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9z4FDVJU3H7K
 syf1OksFyrMNb1wsdgZNfrebrGOO5mRAmuG3T374tdC8iKIByNeNFAlCEp/2zzBa+0A02NgyKh2
 JAoy4UUlW8Y95cLsJoxhVEtIE5CCzHM=
X-Proofpoint-GUID: AhFSk_dVRQh4uLka6pl4RvD599hcUpkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4/A2hLMO4moO
 mFeF/OSQkIXdkVHIKxXYwVvVZAp38ROBCG+kbvTYfH1N0LQeDYgGMQMQ3XGEGG8KoJyQYEZv0xJ
 AMm4IkmGBW3h4rkxQuv+p8sQx5cxxh5cxY8lRcaxiieoGqY7pWFA9PyMmH82per1Jz9MkDdfrtH
 bfOmLyRYeM7ZaHEqLOswg7tZLw56TZJMw6if8rGOUUyHo1g653spB9kZCtv36zbSoH4CifP/3gc
 AyaYwpmcIZSG84E0pwvv7zZbr2qNesXx5fpBURgHePhEY8zO91nsaPNpPBh5HLFGT83Saqm4UU3
 u+RjK72f+Jdf1+lPJc+tEVfRlxZXmw+MhRdm9fOM30SpnX4HeMiSHiZGnOhQRo1He/4qWq4ygEo
 elfUVB5+Oh4vYDih1MGG1MHItrUd11FHWkkhxCgzhOt9Ai8Ihx3z1yeFJgw614Cnr45mqm/nhhe
 F8KpR+Y8D3ecnmhuKCQ==
X-Proofpoint-ORIG-GUID: AhFSk_dVRQh4uLka6pl4RvD599hcUpkF
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b087ca1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260073

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index be0a2cf10f54..5428c6a45ad0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

