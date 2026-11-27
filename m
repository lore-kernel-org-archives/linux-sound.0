Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794945;
	b=VLd0oD3/DGgBMztIcBNRppcC6W+HU2rT0aAXyXHToAdjGusfIR3PspxCItrd0JU+usPz
	 yAxoM4wGxKofofdkF84CDmKCCrL+angULE5NuLhdw0cE55u5OTIAa4Pz4alTx5cpngGlr
	 OVvJLwQVbLZHM7o9M03fzU8SD5yii+XR0aAk7y4FcJT25aLf+YcCbob6urNZLOFp8IVL6
	 WBdmCaZmVW6ZBiOJqntMzzNLpXneTw5WHgd+AErfW8eWAfvs2h1c++fcYcjf7LsDnNbw/
	 NQY0kFuVJ6irVYpIiK2Gy8QZgq2THm4mXrRDI6IAqX3Q7MFU+/7oRFTZuTw5xYMkC/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
	b=ZSlzqgCZJhGLJl+qp9/+VWO5Jr9etCCr3xm0wNQ+X23JYhrmBd55iaO5CirXDIPTczFR
	 gbVAoLQ7ZEe33rP54PwfeMJxqwiDMEC0InyYjt9VeaBr18wX+/XjjP2+qZGv11EATkecB
	 FsDUxlOWSoosN+US1FszN5av5NX23nsd1uho3XKUr/EJz9+f5okqG3FMDUZwQmikxEAKD
	 SKHoJPZ7akAAzANnoyzK2BFbN+wrlZrpUHyWrnBeGy6InP+pO6BaEYjNwbhnSQmNvwO6Z
	 imbvYb8kS55Gam9MFvYNevEDCHXo3+T8WNSY5dg9QrWOXeWsAwqTIk3BfZCCVjvzElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08791606A685
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08791606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp9fr706536
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9nbCdb+Wkcs
	s33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=; b=l75Q4gj3xPtQT6qzP1aWYxQQZz+
	HMqeTl1UvdzXGp13Y3jS95txfQbIsskxTt46zbh+S5OP+g1MsCj+GR593ZbEhk48
	2KN5+kqpgTPelcEWdyiDcLHdw3nvOewFOpryhoGyifCbH9+t/DAwhpH8NSR/jQ7a
	uTZHwHkw/kQdLafjmjZFM9v7VXTDpBzrAjHTTiPPbde53nebF3s2RV+A6LId/EJe
	jtxbQo1KWT/NZ2my+f+JqUHSzh1e+cJlROabOFcekuS0f8G8yLUkYyOE7KPNbl/V
	bFgExzddoN8Y/7pEL/tBHjJLfbCaJog8L/KHTSTGCuRNB1TDl0zfS23Jbgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t4ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211d51dcefso148655806d6.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794942; x=1796399742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=K8dAAePzvBVvSMjqRtQIBBSWERR7aNAiZ/yi0iNEEv9o9wafR02hPxRg+3noQfXdXf
         3lM8OHv9QYAcLU+jS7J4VQO4k1loHDQ07NfoSSJAM1HMO2KiGpPIBI1tYHm/dAW9ebQI
         Ro3zPUQcXzGlZsggNDJj0Mp09kV7sH/QDD66z8YfI4WHYBoqTYRg0iZAAsmlGJqJb1Gm
         C+ojV0VU6krxLWpQ6O1vT11WdfTn/Ho3UuF4GM4Wyx7tZh6aVesr3AFFAMsyZPhtGWkT
         V1Q9/R/j6E9w22+8VpouZoDOhs7LykgSg2NezALsHqvoI5C7P173zOsEc085oRV1/Tde
         B/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794942; x=1796399742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=OFLD809IbjUKkm+eGOqv8ZyvR4Sh3K+cG7GuvDU2sFsqaQ4AsCZMnFqsuGragd7m6b
         6sYw9OcB3nKyFM/NVAU86nyOD2qNJ7l7VygpJAeVxk4gjgob9rnfx2VOzdQXMZBUe7Pt
         v2Mn+eKa/nOsRMYbYui8n8zhuSDUp78vDlaqF2nsd09B7fjuynLlQ9+NwcZ2ouqmiwYz
         v8IbbwOKxvKToGOuQZ5GjpRwW3bAQdJAaux7nMYi/byILSj6Dk++VTbeUQ88YxOjfxj8
         CCA+gHOL3qhGlIOBJ7qeR9gMBWIxpzCOCPyi+OFoRPEkKYMbpJE3REVpxP7zdHVDl+nz
         ggqA==
X-Forwarded-Encrypted: i=1; AL+hErH59ENu0QpYefen1ttELLVA4u0nUK9KUUxw5isZPYhLgzFA6qjhQpYYrWOnPTmkucplK2dzthtUQfu9tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5tKbIAz92TJfOGJkVJ0NR498QXXcQ3tQeYQSKsbjsbjwqHEve
	df7jIIpLRBPDqXa28BBHnThj8fFQi86XC7VdCCuqIJ9S0RIoeGKihvcqL7RSwklahpIbG60fER4
	nfnv3mZaE737XnoQuob1Ji/5MFyY4+otUANYCMqbE2AGRV6HlHtBJzylPbpZI/IX89acdpl2jfw
	==
X-Gm-Gg: AZFdTZeRKk25CiDYaZOck/47NkydiYZuCTYgccNe84xowDLL/d3nHHQrvC3H7sOxcIg
	PSAoWzzYkoDQLDbO9lIzTdFoMxmhCTZ3fWebkj9r1KmUgIyGnuD60rHpe996alcoeH0N+eelTME
	CwXbHi5SDpMZJs9RiccsD68qYXwQHTxRG+CAwK384UjnVcdU9IyLElw9TsQ386OD923ceX6C7aa
	RfQkXnjlxw86jBBE2MUUZt6kxFi3ILCfpbY20yoz0RabdlMId8XEWAi8U9ez53W4TqpEq7c/cTs
	Qag46yxctZuviNlmLc5CiCc7SwEA2v/VQJw71DViKiqv6UgvHSsPROzjWypRTZ4fod6DyKWGk6a
	/kmqLc9nKCyNbZWpPAKs3E5c+cVcG28GuclkXGtLDbV4XNfR/iSe2VTC72x0ytoZ6
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440884085a.78.1795794942418;
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440879785a.78.1795794941976;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:19 +0000
Message-ID: <20261127155520.358909-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Pp5miH1UiWW4-5HcSskIB3dC7nmqCOJV
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09a7ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX+N5geTF1VD0s
 12xlq3pFh3e+/9LizYiRxckH41Mtve9iGGWepYDXF4Uzn2see5zINPIMmPcZJlRr8w5Yx+kFVoF
 dZD0Yyb07S4YNZTEcQIB8zmLG4B63Rc=
X-Proofpoint-GUID: Pp5miH1UiWW4-5HcSskIB3dC7nmqCOJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwPq2ZAcIZ3R9
 WyING8JqlOGBaNZm2IwestGH/zvZVvFnvkppA+V8TJ44SBUOVZnHTPgJAxc82HUNP+MHY5fx1Gj
 +oFB7BBwovPNtu47+j5PfyKISXJPwlGZCrZp2vDZx1gCw/XVvBVZ7om57qMUsYMhYCZVoomJJst
 /XfFYdZMKfqp7dbiKCdIZU2ndFsuTHl/TvwCmXKOBy9QeFOLMAD88DrSUP47OLp9H2FXhIB3331
 X89PWN49qh6YYzOyrF6RY+akyWeqyrycOrlscDRyv6tC2A97Ftg9zS5SuO3N8hRm4QfOtcr3QP2
 gURtS48G/owEFSiBGJn7Vtx1fdy/oa+FrpTxDjSdr4ohvMYc86ksRMv36TmPqHOQ1K4atji6L6y
 2cIo32UdD+UCY/XxWByhyBey6ZWgws40pchqYHYApUSh4M44nDnE4/AEiU5akGT+Y0JbfAlSPSC
 NpzsQccQtHZkSf1VMOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 3922d3eebdf9..64740ee1e3f9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
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
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

