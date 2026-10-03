Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295C4A3F0E
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050239; cv=none; b=IcgENQvOxUpCb3T1Wu3DH5nsvzfiVE5BsWkMTFR3T07650XpTM5mQuW/7nD0+kMPfHi2Y9GBxbZdizpb55RxUT7Xbp2mla6wE1cb/aGoifzc9pMaCAxMeaP7N1Tz8LbSWysEh58XfdLXQucL3QTFKdh1JiEgSv5ow1z+O1BRNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050239; c=relaxed/simple;
	bh=XYPrp03YsPRFnVbkOpI7YXJXRlmJBGJydjAXHlnkr5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyjOqxVUpmp+q1eB73L5mB6zczLADDXp5TvMViPV5QKSBX9D977f9i1SVUY7XNB1bEkHTn0GOAe3WeeJP0c2bMcSHI3YgAQWRWp64Ebadso6T0vZrfZkSe4jccf402+w07WXkNGWIIlNqyjTUq/S3cDVhrAVdNnZstmJcwBrQN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSqqYDSb; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSqqYDSb"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e56c287b3so49091085a.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050236; x=1791655036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVq6rfkxtcjpdXbuZ6PheQgKb1xnBkiyc9S5i2pZu10=;
        b=JSqqYDSbVGZbYNSwhLNum0lHALSJW8H0z0yJcJPDpvrkhKrQm2Hf2kNi8Bj4bFijZT
         slVjiLjsp4oNZtrZRicTDI49Y+xRLCzQFAhtbuAPtMN2bIU/x2TX6D1sFTyLjbqtTLDa
         TzPfSA0Z6rPLkvEt3MlKj/PH3lyA1cRCOE3akFSyKqa8mhWMT2rzlqHaJnVEn4+/U4W6
         h21D2QhRq/bTRanZE6FxWL3U1F3bwIAa7x0nEBbl49BtgzI0i0WvnQO3cVkGHaWr70iG
         h+MqNyAhDgo0EtSpBWdVlM8ZN1h3AgbjJ2VJcKwuI7V9naQgkorSMaqPv759svz0bPWa
         TE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050236; x=1791655036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVq6rfkxtcjpdXbuZ6PheQgKb1xnBkiyc9S5i2pZu10=;
        b=uvW6S+u24IJHZB5XFV2JliAxSm1fsLMbVLAuzqY+fFxHbFwphNF/ORYPgSgRsAes0y
         2sgtFG+gSPLMnI6Gwh0rVlsEI8opP0yyVSTNpToQaqN0hBkj6ANU0mO5Zp6uz+gbvwLL
         yQf+fC5uGUyhO7Et7Dd0WH5XniAXgToUI9GuC8/Gz7n0tSOhMpnIBolm7GuW6KwIM23s
         t7lxfyYMo2zSHW+BmyqG0GYlmL0EIIfz1qYLZ81lILMKPHwXfPxyLfcjZnYwNZu04l8L
         wN8WZCLbtezl5lBF3M68XKMnHwSuqi/RQOJ3FfmZEDZQOwHmfzk0r5Cg8M3lsPtUgeHM
         IoZA==
X-Forwarded-Encrypted: i=1; AKwUvBzRxqUhiPBnWgRD28JJjnMousv+RSzoZcdu094adUBns+yWBYblWMkRkQU42ZL+SPGMMryNAZ7aVgNI4g==@vger.kernel.org
X-Gm-Message-State: AFuF++nU2fBR4bM0/0TdAEI1eRRS90YdOZsn7/ZOdOevPP4wdJiwPcZk
	shfyNh4ZMKJzhLMOJucnzCvioYBlM2PxiiTH9JxX4J5B5kjZ/hBLcUEx
X-Gm-Gg: AYBFou10i9+gqRlDyF+qOh5OawPx1/kZ0FDagXqql4pYD5O2iOX4BMHC3O5ddegYnO9
	DXGx0Do7NEQG3c19ltBJRXMi6BcGRzrLW3+wxKl05TJ4uO4AxO5PY6+bpo1COu9o2Hl1YFTgq+H
	eOLHetfL2bzmVzbn6txYj5kwGWknkE+dlQSKnR7f+mcnwR62DgX3jjmbOtndRDvFRJBEUVhKMvQ
	9fy0GpNDuiF5MrM1XhMNxtjFXR5V93s+jZMid9qc+1O2Y1Hxizy+9Mt5fu2cvIYxltANILE7HXv
	c2P002km09EXhn+tFml7700SUHjx02WBnNzuJcPnJQoYVsDjfNvbZ3464AScHvRSUHalgzJHAvt
	6SR1tO9jdwQ/h6s1emwfjx7kU4xsjdzU5omIc1zIpypI4PXUnS5uUegUG0fsi3cWPHEGtKDKPA9
	KvrjRit5pFbg26sMmRHBuj5xwxgkYWhr5a4EkdKSJ1+v+/cv4wfLRGI4E3a++uFMLMhaHFgXHVv
	Q==
X-Received: by 2002:a05:620a:4555:b0:93a:1ca:f14a with SMTP id af79cd13be357-93e50f8120amr504480885a.17.1791050235920;
        Sat, 03 Oct 2026 10:57:15 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b1a108sm48714906d6.13.2026.10.03.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Date: Sat,  3 Oct 2026 13:56:55 -0400
Message-ID: <20261003175659.23536-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Audio DSP (Digital Signal Processor) is responsible for audio and
sensors on SDM670. Add this, along with the SMP2P nodes used to
communicate with it.

The sleep state is included to prevent the following crash:

    qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal

Otherwise, it is unused.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..038ef0f73ea9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -500,6 +501,34 @@ cluster_pd: power-domain-cluster {
 		};
 	};
 
+	smp2p-lpass {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smp2p_sleepstate: sleepstate {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -2111,6 +2140,19 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
@@ -2191,6 +2233,12 @@ gladiator_noc: interconnect@17900000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		apss_shared: mailbox@17990000 {
+			compatible = "qcom,sdm670-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0 0x17990000 0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@179c0000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
@@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
 			#freq-domain-cells = <1>;
 		};
 
+		adsp_pas: remoteproc@62400000 {
+			compatible = "qcom,sdm670-adsp-pas";
+			reg = <0 0x62400000 0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apss_shared 24>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					qcom,intents = <512 20>;
+
+					q6core: service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1806 0x0>;
+					};
+				};
+			};
+		};
+
 		lpi_tlmm: pinctrl@62b40000 {
 			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
 			reg = <0 0x62b40000 0 0x20000>;
-- 
2.56.0

