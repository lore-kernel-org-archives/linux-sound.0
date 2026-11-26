Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718309;
	b=nRdWUENHA4E33c/jLR+QYwkLHgTZUBukrW674F37/UCqdPFyQawthqiMl33WvWzb08hB
	 WOUAE34ER8l90/vIQOzfh+rlvkVo86kLspf8UT4aXtOdZVZV1rYbGYAbXzcgkUnerFfpJ
	 6qYhVq6BnbEl5Y6wrw+yWckjgDfNxPEdZUepoYy7nhbDS3Eag1DZ1Gc1HqM+NfDraEpH5
	 qrcEMgccp6sXFNaW2MCQ/OJmsEeRqlQIJry8mmireHa4Iwsplnu9YbXKyV6YshO2wdwxv
	 kI5quCUCvpYofumDXlMmzb77BEZNYXWn4bIsM8s4JtHe3dZNoS6/vq0SpT7RWCQkpFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
	b=Aci6cUlRJps1siyIlgxXFxeWD034Sdk/wLBfUhCdVcwRtW0b2pvOZRMa8S9XfpXmI/R1
	 qcVUB6RNZIGBxe2DxRPKuN9TrRs7vAOno6UhIwmclB5s86XduXKd1xuPro8mET0kvx/Rk
	 s3eBEGhmi/2yIg4fe3tmmBMYtGNxEkP5OZSaLZ/7L9/THXe6eMizVmUnogAfEDdrDXeo9
	 4evKU5Tg+PWC+zTHFaN8u6ugys/PpTsPlqQR3qo9orCJgcdiKY2PeMHvumqxe4u2qJ5FR
	 tX+oqb4Q5oJ5eNSwJ7V+ubNsxJSATZvZvKMfs66ZsKj3GO3JGCjWwZbci3kppcycUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05B60A260F
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD05B60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGbxCG595613
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4cGi2mqS1eP
	+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=; b=kuKqrbZPirNfBCfa3QKN6gTP4op
	6Zxyk82dv5sDJdlZuOh4mP2Wg1EwwkQ1J6in2wE5fVMaAJM5wbBtVnk1t4cZ6PVv
	d+nczlGzEUj+FG8zV2GKyS7RxlT5VOPt/ZVPxRdAIpwA8YVVbetWJ3Aa/Me2EumR
	/bKRdt2ZtcgKb+YMYX3KqQ21b3nxG7NjY7c/psBtz1kYe/UJF9+du8AND6yorb99
	Cyr922awU32Xy3jVCI1LDOqNU72RlfIzCzZazFgLoMTUxV6FNFVRpdWHaob1Bf0H
	qh7MT9GSsgJmFfSxFSiD+x2pSPYxg8tnj668KIEaqfEmxb9PCudep1cd9iQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90c0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c5caceee8so121119511cf.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718307; x=1796323107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=RCIPHABeYjvdTYSx+RUvTx/9Xn/zZnbpDUQHo+qhN+Z+TPuS21OX0nj9djx3JDYWOd
         RpU+GLjSaLLLWRbFHM4oVVl1xx90hsBfc7MX35YSE98vYHrhHGHl7nHTJaJblUUXdvk4
         QkbNTtnFa2wtKZ8Zgi9APjzn6TJZ9O1HFluglv2/BuPyfi6xU0NLealpjDCBWHiTC4iV
         o3Cngm2v9xUQujTQZYk6wO6M0tfYm0ywsVLcg7jCc4tTZqtkceJzc5hsKA2Xh56ZpSA1
         UcZcS5O3sZ1nWK4HylgR/TU5AQ1jSHtT1Jt41C/sF0r+t89u9ri+bGqsmlZxnwKkjIZC
         EMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718307; x=1796323107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=vzTLS5OoIW+1We+MPlaxz+vq9JfnPS49HWzsHi5Y+BFXKMN00NetvqfscxbuZINGk3
         yxIp2JZw0pqwjrC7dX8Rr8bW78L9KaNA0hMyQY1rrh5tg57DOksyvqhp9HOEA1wVZReg
         kvPlECV8P/Y5n0DU8C1KR4r3l/YRmN6/bWrOxEWRw6VlSt/LCNiRTtsUJZzHe0AF4b0E
         LEceYNxsO2Hj4GPEJ/tiw35ElxoxVuSaN+/gfDnZObZPslHE/YAPYW5/fZCoZjesCMPH
         lTsCz3F+0RpKKqrrDVRmyB0uxc/3M9HnjTjbpbzto28eZx8lKkuqsqWF/Xm9mVYcTvmU
         K7ng==
X-Forwarded-Encrypted: i=1; AL+hErEo7DZ5iEThx5mBNTizVcFd081nOvXVgzaYBwzzQVHKgaloepqf5ZfavFb9GP5rrSs2YpbpSJCG+wNYjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bA3cz+dqnc2MOXMzve2CJO3JJX9AynIoucBR6wA51wyG6ypWV
	OZNTUArL7E6NeSO3fyE8lmEKE9pPlhY/nbdrPZTnem1R0LseEB2eOfgscFNCf5zUxh6OyAB7Epn
	xCm82RrOETak2anwbLA++UlZ7YELSiBYXU8xz0v+geKXY1yHTF24+csLB9HOzIWy00g==
X-Gm-Gg: AZFdTZcQTiHQ7vIbddXgCJYOjUlDL+d21EfUe7qD+KAJbnpsQ2u4wd66B3RiSXMAkvH
	DPm3cMeU0uQLSq9RdwR8dyfwdRpLZHv55+/ytmzSxY0PC3EAqE0LAqhdNLouMrxVDHkqfS734xx
	hb7X34d05s2XbFVQ5ZtIqBn42/DFGUpvdlNogo4l77ligY1lMxY+hZsagULaOH6qBIUMDAGcqAJ
	UeK02QFSeg9efiQISCD3nIaU5C02gOxpfrgT7oUYqwhxtzS0rltTAJLtfAVisVrOIGs+eAejNpQ
	7H8Id13MVWqwkKdBx6BlsbNgqi6TlIkUPylvAZMf94ga2N5Ze4rx8Sgsb4ePvMcX8aJC7xxtgLA
	j5AeD0ROJSkhFwyIs0HzF5FbTZ0KcTVgsOFb4uTmoWt8YcgRtVCSuWwuEJMDLfpRj
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793962985a.73.1795718307191;
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793959185a.73.1795718306758;
        Thu, 26 Nov 2026 10:38:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:05 +0000
Message-ID: <20261126183806.172485-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wTny1JGaKJKPz2oNFpy7jWT33133og1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXyOVNb1mbSfeg
 BeaBCapZNeYFqfHuWysrBRPlQ62tX5syeJhcN54Q5dkrSSn/Gvpr/luObDfbOQugGt4/lP/Em7K
 pkUiLzyHrzmLvIYYZOVETUx6U+UPYxlwlIkZlm8Ui2O9bQcUNyvTLa2x/PY8cRaYmEFg3KihunD
 s90g8Chk3YRImbUCTPPaddalH4c82JFdf6gYtZt09/TPWFuDOqHyIUv9rgNnzgDDvLru7pukwWm
 lAxYTp6LJNK0uHisnOJUdAQh7WMYhFVPU/q9uGU9Kgr8CCmvxuT6FrBx0VPKeTKPQq7U7cihiv7
 PIqePHbVotiLy+usCpLsostun5vF3VGhmU60z1D4lK9Ltfea1VwD/Q7NZu4Of/dvN8A+3skOoc/
 X4rNJ15NZTfHoL/RbBd2SeKCdc/2wjBxUbsTS2sAGXQ6jMsfsmM3Y5Td1kXiKr1xOO3opLBr5eO
 yddJAtYrshQtp6ieBuQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b087ca4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX8omHrL8oFDRD
 bnQEr0QCj3ujOHFHCsj2E/305yu7t53WJQByAQdI6B2vWfSNLcvCbLPm8haGFPGIMZQWkBgyy3g
 aog8tK0XtPQAqLwUK8CuABffRqi90DE=
X-Proofpoint-GUID: wTny1JGaKJKPz2oNFpy7jWT33133og1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index ca035f10dc6c..70efda9ba2b2 100644
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

