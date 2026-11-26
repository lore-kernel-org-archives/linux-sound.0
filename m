Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718301;
	b=bKQ4fPgXAzIQia/LCm5OmnY65UJpi9qqxEd+Za3hNfKl3kFiIRVVCN1aFKY6rtlyJlzg
	 ECQlXjf6Z7asPqBi/VuffrrxEqUw6mv6QvaPJFJwY7WSsLBJoE04NTCqeSQlB+lvrkeTh
	 Qxz/IiazXWk+YMiyvdumfY+NCrmbMqtlTuCSr1neuLAWJB1Uf7MjYUQl0u7qxYhCdPCYp
	 pm9Gp1gU3u7kVM2O9ykOHpIPVtnZd7haQ2c20NrxH2VqHS9kz/DMFaVntVzIRPfgep2qT
	 PYeXp2u9F+zsT9XatHjaoy/alxcufSJwhKjmit7YE3uKVjx3Rfz/IQGJtXj/kC5DF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
	b=MjTdjNDmT7YmwIqgIQWRpiY/vhuOikwLPzwc63GuY/UNaadmuXMQLX6VhYwCZ+QL/hLQ
	 5b0g5R5Gtojj5LDH4PzWVgLuTeoYpU8v/DbZwh4eP2bSNAluSp6ZWHcBfIbzyUht30uhk
	 QzYdQ2wcNrRKlcxWC4f4fxlQGa6IcvJpQQChynY0lUt92aaWrZBCieo8ghfKs2MOXyamv
	 721jUULIEQG6hdiJeQvh+Hg21llvfvUj93Zg0Dlz2QX+i8bMT9Oqecft4W5RRkS8tvIYi
	 iPkib6lgPbu2b64ZaqfbGk/EYNSAAGUPtGOHcDqmSHabn4RXrxZrZ+S4HHBrVGpjGSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxSpMd7x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QC7L4/Xz";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5AE606A6A3
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5AE606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxSpMd7x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QC7L4/Xz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGcE1w596877
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SHsUn0aTWWB
	o0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=; b=gxSpMd7xOOUubdQAcfiHFP7z1J/
	325j/+8oYEF1W84hFYpkybUL6bkBtNxo5ebc8xo7QZDR19HHpv2oMx2uWAaDWQlS
	1YuoEhbJeSIarpZdeJC4Nh1me3esj7g+PoKjaxJFxZ7Bi3++CDKMc09BaWlAG1FU
	ikdl6dhIkDdeEaf0WNxrsgGQxLpF0UOno3YMUj5laDViWIMuRx1yKHhRKSP9xtL4
	DFJIdfQFmVE+DHV973UlGAwaZjn0TH2P3UUz9Yf+bOX0gGHM0loFImU8Ks0B30l8
	HM6WYf085Fx8a0/60+RVgwywmdm9InEdtUADHKdL9/+3fSSmG1r1JgpGSBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90c09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55db3f05536so40617721cf.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718299; x=1796323099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
        b=QC7L4/XzNv6IXStfLEPsvNNDmCeJOk6lmdJcJ+5WT8tanVNzfz5ZNXrFQPoppTfA8e
         hX3qRVYl8/7In1zpNlRxyohlIB9IDO7/QwkhGtgfHGj/BYpLZHdqzTGRHkyqqP7coBJC
         ewq86sN4+8H4MOauqpkcaJIoNPAM5BuxmzIYiePYtiOMBkhRyWh+FUPPd5E57XJH6Y5a
         H/aiJ+iZWb6kz1JYVBbkmxEeycUvxPVMyTwAUAzZRcOtpVKSV3epdFGQsTwqDxAyI9tH
         dvpl09dRckD5czW2WDsXacFh0VhVZ2KLVwESqknffNUKnRt04hVJyaSDFWQMUYw+AMCt
         2gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718299; x=1796323099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHsUn0aTWWBo0eohtK1PRk4fIWyn3LhpNOhDPiOgl7I=;
        b=Fd7LGFldwjE3xGetIx9NRdDhlmlQvEybNPkoY74xBphzcu37BePOPq31D4OL0PaXjX
         V3mC1WMF5fvrnqFO4fx3cLtex61UWW3T0+5PTJB6Q3BnoPwM8gXbSqcuBPJyRAZdYAZv
         K5zphf3xEzRmBjudDJ2XLNj0kGbcnucymO2GbBxkxVZiIrtxbF7b2ALq34bqSoHp6JIX
         HY18bQgHqgyAz/P/h1nZ7s893Bs6hqJ+vsFuhJMeJlmpsfk5AtugBbUEHqPuSUBpyXPs
         ZVmu+o5a1vyT5R5dM8Q7Egg0wULlJ8VBJWil8kjhe4/DVyRgehS+sDXqDLHIo8xVMAM9
         ao2g==
X-Forwarded-Encrypted: i=1; AL+hErHwK++/t5XNKx3FGI6K5W2fGZLJ9MtDXhrItQVXQDidBg8zu8ONQuxDUrAec0y3GnYBwu8ncis+Fk8yIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XnsYLJzOThbz+7tHahRLGQ7p4EJOSSleb2AwpEpAkKsxdrB1i
	Jbdf6y1fGxUI0RAN17VifVZVGPffupj+WGlvYpiuws3iHFcCKyE/+yXUA1n5d1qrWRuwGE3XuPo
	VjIIDK8eWf4nSDBGvVsXlmFTxEJPiWE7Hrn6pIAkASECAdzYLmMhAszHLEW0t4aetqqU5z9021A
	==
X-Gm-Gg: AZFdTZc58MEzEoQDUYayw2y8qz2d7TsUgT1w6tuQ/3Ee3UQmB+LjuCoMtM2waj5PZ2F
	lIDH3v8eufE8ZXFeAa5hLW045TXhdMBVCyVSQ3gihcVPJ2HlT4L2m9lturW2TaFoEwiJo5MFvQe
	V4jf4hAUt57OWhV9XGL7zO7Lqrlr5gaya+XKljd+EJeX9zurKCaGoszzUvMjVnuriOWxqv8eQrg
	cSb+atzlttAiqwT3MAvqiboBEWCt+8aLlYCvszpKbt0UJtpvtQ5lqjohHnCRCmOl9jZczuQvQOy
	gpOFNqB+q/BcbNc43GurIcgoGSKV0J0hO17130O+InIWRU1FT4hSSy6EDafFrA0S5UR/2zXuqeV
	o8Xc06k7wR+kvL8IVjdUV/pRKQCXv5xKUSyZxTbxJkrL3LOvICqXnW6ZIgMF42J2F
X-Received: by 2002:a05:620a:f04:b0:949:a71b:ec68 with SMTP id af79cd13be357-949ba823b7bmr3934217585a.3.1795718299505;
        Thu, 26 Nov 2026 10:38:19 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:a71b:ec68 with SMTP id af79cd13be357-949ba823b7bmr3934214185a.3.1795718299104;
        Thu, 26 Nov 2026 10:38:19 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
Date: Thu, 26 Nov 2026 18:38:00 +0000
Message-ID: <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: cBJI8BpgwiOk_kX946JNHmY4avtQ-W0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX12rRFrhnD9cV
 zdvGcFDt1sla28AYlGETYmG8Dc5Nyo91jx6iiEYut5RlaT6ADYhna6pdLC2UF3aHkL9YXz8Ke4m
 l1NYFpaOSeMMcNZaKqg7HLwhOEUDf8FtbawtliRCa/HmTvngNfyiWD74j4gwioJ7MbBam+sYnKv
 zI5zQfT6/4BHq/ViY11CFoBsG1xULJQQ9l2n8PVE1pEDST7sBf62QWfmJW+XkE5gnUvkz5HauyO
 Mo8wN7s3SoY/S2N+AWgtZnn4JheJZ/tCLIYCpOtO3PrHp7Xxw2QWlUw6rdEa71EeTx89ivS5K9T
 Cq43np2vAsivFsRbTSr8kYvD5M0PXVDPCgZqBPI1hoD93yOY3gzn0bAuMMfg/bLT8vJRwa8B9zW
 RkyV6cBitf66IwoDOq2Tpekg2Pc3YA9dxQrh42EbxbpsWxQT1rD1d91uOIIC9++pr0Je49eLl7O
 G1LM47uIXNFxFbHXBtw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b087c9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uy-xvz6Cr5JHlQA9vFwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX0Zu6EfgWne+o
 Ex30CDgF9REfqcnPVQAi0OHC63KDPkdo9f1tS40q+hU65WlxYIimqj0LpFpeAvQHLDFPRExSGsg
 Ln6nqTq0YEKWfyI99bwOMW0nEhun7Zo=
X-Proofpoint-GUID: cBJI8BpgwiOk_kX946JNHmY4avtQ-W0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Add the LPASS pieces needed to bring up analog audio on Glymur:
lpass_rxmacro and lpass_txmacro codec nodes, lpass_audiocc and
lpasscc clock controllers for the SoundWire RX/TX CGCR resets, and
the swr1 (RX) and swr2 (TX) SoundWire controllers (disabled by
default).  The swr2 port-shaping arrays describe the WCD9378 slave
topology shared by all Glymur-based laptops.  Boards enable swr1/swr2
and wire the WCD9378 codec on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..e3bba14bf36c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
 #include <dt-bindings/clock/qcom,glymur-videocc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_rxmacro: codec@6a70000 {
+			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0 0x06a70000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@6a80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x06a80000 0 0x10000>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		lpass_txmacro: codec@6a90000 {
+			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0 0x06a90000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@6a94000 {
+			compatible = "qcom,glymur-lpassaudiocc";
+			reg = <0 0x06a94000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lpasscc: clock-controller@7680000 {
+			compatible = "qcom,glymur-lpasscc";
+			reg = <0 0x07680000 0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		swr0: soundwire@6c80000 {
 			compatible = "qcom,soundwire-v3.1.0";
 			reg = <0x0 0x06c80000 0x0 0x10000>;
@@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0 0x07630000 0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-ch-mask =		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 0x03 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_tlmm: pinctrl@7760000 {
 			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
 			reg = <0x0 0x07760000 0x0 0x20000>;
-- 
2.53.0

