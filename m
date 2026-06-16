Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA5386578
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640904; cv=none; b=Y2D3ipwQTX4CnQ/6Pbw3HRIjyLLyeAQMP536edXo5KDnSue6XIYVDHvMfgRnT4+dDIc0VgVZno8nm5N9KlBSwMqB+QuHTmFrWx3YX+GXY5BfRg1VzXUapF2WLM/EPcAf1aDoq5Z4r3Gclgk040FljSDskBYfMsxqOqaAH6tFxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640904; c=relaxed/simple;
	bh=mPmaD4IFVUIu+HVzzg//Q2MgUjywNjd818HGA2EhJos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYRLm9V+RF2vBu1ZPCPi6DNMGF3YdjEJ9GC5Y2pEnsTZL4OYlOyksHvPmho1vK6Sx7pNgbhXP7m+ca9xW9TKZ4yfVyjLLR9YEbtfW3RW1Ngz6/UcF18Akb986Q144PMMBZi1PZYT3Fp9kAJk7HijxgGzMS9PWRrnRtEk+/63IFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv+IAM/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJuUCJhE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv+IAM/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJuUCJhE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIQ2VO4015966
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tZzr6OI7+ha
	3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=; b=Zv+IAM/7C2t0SXWNeQL3375XUbb
	gZAOeK5Y6GrwpBz0fXjLt52AK2JhUbhU/P4FLb8KlYt8QxHs6keOxeZFPWBbiQzb
	LhrwzoMQLNz032jeIcD9qXKsOHh9SdmE2rz3aocal4lY9q4q/yMgdhdu54HYosVk
	I/egw8NdgKl+82sJ6E/UhYY3I0+pOMMOjp3xrFopOcS/m6d5tN8yu41TS3Qx9vxN
	ggsvjNhTNcm5CRGbh15mFqP/+IB++j6gktSofX+O5ywTo3LOI6beEH/uU/2zMEqr
	tX3UN4+o0YjrOZFteVadn8Y5gdNfyajqnz1tazd/apmKjcCEGIp+h4KPP9g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253kh4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so8212325ad.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640901; x=1782245701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=FJuUCJhEhHy4+XjCwGgwgYV4AaZQ/rxl0VRKHw3yzAQx17nyKMWpOjdHVfJpK4rrhA
         Rt7jqkwZBm36tapbpjnfJMTHl2bn0lDtRP4BYSUEnxckno2lMpLLBMcv9k0e9GXzH185
         Glh4t79C3IrDTGDAZhiuUiHOMUiLdwOAfajpaze8Iwml7ZJkFmK+kTVVehyZ9ImtLgSS
         LrvKpChB7G7tN3wHMVef1/5zs2pzE2Ebe78759wJnkF8BL97BGUIDOIVsn7YaYisnJQo
         juQen7b2XKEAmnXxAYJ44beXta+Mq5Q/BSWWTxi7YhZJ+sbH9HMxKBahftUO91lIwV1O
         5g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640901; x=1782245701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=KTbpjcRjrM41iRS4a4NaJx28mTXyOZt0/W3LM6vx09YD7JMBA+91bJOTPHcqlC1I5b
         1bUYiQvrkQbNukh8Q6/3UxzHRt4wxHGLXA2fi24UVRYMrIT7I6G/x+r4kIDS90sucF79
         SzEET6jsMuFZ8QgPvcfvVRALhRLkApTsztPm2T6FSnfjfWVz8w773GoN4RbfQRYgKkhN
         R5uRqaY/nrvDds+0PCws/+iDhsvlUy7BkQNeGq42ZZoyngEbMwlWinM5s81leHmN9ieT
         pOf5WitMB6DLzGwjMiGtixDYQZo9Q7TLqthydpmNSxa3jP55uM6JIyu/ARMgDfqKOMn2
         2dKQ==
X-Gm-Message-State: AOJu0YztUs2IsRjY1AxYbVHKGri1prT41dyERkLY2vYA72yFN2Ot5lFY
	hqlAYhe29oISmqeb1qqzgk19eNxeD/376ogabnFszsaVASESlWwet1xe05HzQ/E16aqbQEyREMc
	GK09GXGxcv6T+EouZVC35mCOt5Swcgy91l6CjBn38WvWuXu3ePlOYbWzfWn01aQa+vg==
X-Gm-Gg: AfdE7cmIRaIcfk4agkGlWtG3Ju7mmUARZMYGoh179XMxzeeKObQTp/5Ua37VDkn/5Kg
	0sstIesreL5ezPVhB78X3vaKwuo59x5udkfWXf23q/Zgm+HEEFx2icZmoYEIxcCLrgdFNHpQaGr
	xwYgeMCjHPcd8/nFZj5eosHdZyFbZJ+nig6AfTOAHzOoEHb/gS5eD74NyAkSWsczvjCR+qxFKus
	WUjykQvU1We4WBa7mBUOtAWdS7MAydNE9Sc3qwiwDT+P5MLfFTmguc1z5Kg/RhR80y4VzfZvIoM
	wwyE3maMOUiCk1AoywDQWZeTR8AiwRpfv9jhgZ0H/76/bC55njfCmPwqHxkzhfTpBDsIWkzf+wX
	VqxlO8yxqSo0ryWLgrAuFZiLw3y+QabXYmKCvQcgWmIdSHixulyRN3hYYfA==
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4623105ad.29.1781640901323;
        Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4622895ad.29.1781640900899;
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
Date: Wed, 17 Jun 2026 01:43:10 +0530
Message-Id: <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NYHjdatzC3KVHm0d9-rhU0IxGscGM1cy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXymB6DRHLwjY7
 8StJz7At3BjgoUw0h+KcYCyazrWxCMbAtdQg8TmkIPiI4zjxdhU1/hwpk6iVW7i+tl6009pIRkR
 WSjaQsRVm12kQ0De3rebdeL+5DmxS4k=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a31aec5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SuvoWwvw_XIP34NGM4IA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXzQZOfAiFQuz5
 1NOKikVwrBHRr9R18y26pWMjz9n6PD6azAstee1IJPTGbR3bU033ArcBQzUcqrk1RFReCUT6s2G
 YQZOZI3f+hBGbeMsFTWhpQr7BpxWJxejKKLvsRhI+JMTdu+VaODKZRhQj7ASn0x80ZoOFwTu5D6
 xdtrXYWUjdkfJCB2X9clb23qoK4bWEEkr/tK4V3LtxK1Cq4qd/SCq0hhSQnmJ5ZlTb1+bjvdsX6
 dTds+RXHFgWy2IQC2DUkvTSrOIRRNf6l3EZ2j4++6TBjsVYkjGG1rs7baDQSFYIgC22+b9H9UmA
 m0gIJROGy/i0BlEs3wceOKBxsNleSukQrYwFnjdbP5YzcoAuMm1hc9e6HVnUPonPMeN034gckSY
 1iocSAPo7sQzG0T2UMH+KWk2G6nJVlWVf9DvWhaCcK2x6fKbqizAGn3788Q6GQ+Op79iTtm+LTH
 F+b4up3fgDzwkUmi2gA==
X-Proofpoint-ORIG-GUID: NYHjdatzC3KVHm0d9-rhU0IxGscGM1cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e58c87fc8cb0..3df09cfd17a4 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -15,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1851,6 +1854,42 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1

