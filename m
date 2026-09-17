Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5637D3B5E08
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619888; cv=none; b=So2anydQKP43+xK7yBmnyfBGb0enO3a/gB20C1m/j6OUArehg10f2+r16xphV49D59cvaOgj4yVqBpiFvAeQqPpUrrufASY5+JFyNjqeGLgBca7MMMZ+mei3rgPPP3RWhY5P7zSSBVpewlKSN3qc1Rrsy6MnUI6Xe1Ln2F1yyeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619888; c=relaxed/simple;
	bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAWoUtrS/6C4IQYPf0P+1RwiSXRpizu5uIgI23G6pjwTI++FsLkHLYuVu/IY9te9Ne/2R+OWhLoAA3CasMjhKqvO5rgIjgBm6F3y3GBMrFtL6A9NuuFgAAjIMDz62mfTZ+aBKy+Nc+8u3dpjeFJOYRj5MM/udzEFv2Z9H9/w8ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmH0TeKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxyBoZvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmH0TeKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxyBoZvL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1hlk43559773
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=; b=RmH0TeKJEF0iQoRt
	1U8U3cEeO4DHOMR21ql5ckL+zMGciUkrgjhnChpsTj4MF+TynmXTlaFu4G1DjFMD
	/Ww/WEWFURw+x0wzmPvHz3fis3f397RTXh21KwVtHJg/IObXL2omy/PmKgmer4Gl
	/aLzaFtZZfQ91XqtPrt+NlL6pkiZ/GUDcEYymVPPbuQkDiJglzP6CjqnV6QJb7Bm
	A+LH6fDSAUWzoJxq8G7ktgB0d095T9hkuNsmI9zy8BZt1J6WPuhhM54sotOV1v8A
	Apd/MptyeCVGEDCSA7PVMwFUI1YNScNrUKjR1pbCGP2akRblk+HKnrtgUFxloPQW
	HSAxQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hacen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso774023a91.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619883; x=1790224683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=AxyBoZvLpBXZmxvkhsz6vKkqaQ6iLDNtJZbusAYYi/5dAqmi2/YOLnHpAROPijpgIh
         iHVkEkWcdvIyV4/mgIP0liusoOEG3BzxCipwtne0SxmiSgcQ/HQWKQKcVb6VSpSElgbo
         vFMAmRUHtZzc89fZzOXXSCA44gAfpwOcaNWcwTwPFY9VfAQd/8CV/md0eXC54/JSyipa
         5bF2jlxqrvHP/lTbxD49IJLHE/m2tiGkfNWG0ozybknCh8VlQPVcEYDf2jLFS1yseI2E
         zOhxyR9+l8MZGGmovvQ2AneUa1aCm/6G/n9Q+VZOjdw0IFviOIYOPolSavTZwFHmu/GC
         p7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619883; x=1790224683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=U1ke9bT+PBtvlPYBhN+oRoqMcA9e1j0G885JuKwgkTzy2lPkAyp47rideH9sSBA0QG
         QZvZ3KFujbaV6BPgdcxcTF1OCWN57QRPAT0tQpaxKHQ0LyXHfJZaYwQMtAn7JnN4dD87
         5aKRcerX8fVciOsnT6SmFN8YSSnvAB08Ah4+LRwOejDdq9/eh8RyXRVop9/aWBE2awcC
         NhwBCC1B50ZFKm03zQFOu6uK8up25JZzpgoT2TdfrfKXX9/Yok8dc41t8gOGbQ0QR7gX
         I42finmSqiVpZ2JJWtZvFZuxnZn2a0yBo0Oh3XDsawXfSSJz3gN+1/5Arp2h0rLu6vUj
         FCKw==
X-Forwarded-Encrypted: i=1; AKwUvBxkw+JvIj93eG0PAaRwwiYSKvwbqO9L1rAumgWSYv5lwkBwEChqfOM982d8CaaXM90h5ATjftctMyJrjw==@vger.kernel.org
X-Gm-Message-State: AFuF++lXF/+faJvXonRP7tNun8y7TH+NH1/LnHBlguQ3THnH8i4ni8Yl
	dx/E2/QwI/52UALigM4veiCrpnyQIyQh7B0Ey+qk1bw5hWGE5Ue01iUS+hSHXW6tsEyan4U448L
	/PjyhKmfDulE3cX5aEhi8OStYxmc1pFGvIWKZaNukL2gJe/IWbgqnFqzEC0LBeHq7XQ==
X-Gm-Gg: AYBFou1zIHMML93pPTRlllF9z+b5Zj2/b89auYpHS0bLTyYlBfL4qwGCzvq+TSDTZhs
	f6AfBumMNCC95nhY6eNuTSXnhWufZsZ1GrZ7VSYBliBuxvODr8P3y1VzgpkIC8lNYil5d46pqbD
	MwdpQ35JyCoMswCSho5Z20Bc3uvskKGwTu2Scev4AduaATxORzclQzZv99wq/FcisrQVp5n9Pnj
	q7si7XGdpdjrFLQufKf9qsi8kJbvKcC65rkVqGWVJU/WgazSzhM29UqsWZybyXIb3S4Ra/gowdC
	ZM0zkjlz9dipA4emqMIjPu9g40QpwhGL7UZtTSLtzPbPKtNeUbV1umvkgXmnafz/UJnJdnUpfOm
	xishWvZUYQ+TjvJ3wRYDdkEY/2YHU2cZF/r/W
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769807a91.8.1789619883150;
        Wed, 16 Sep 2026 21:38:03 -0700 (PDT)
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769751a91.8.1789619882684;
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:31 +0530
Subject: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
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
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=2379;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
 b=YxQWUHIo4h1Ru4RQSNZvHCSd0YTFU+F1PsqGLRnLkyNkdS3RzVJ8wh4/+Gw3XTPlbD3MfO4zB
 iNxleRF8mRFCZ9OeguyT3qUaDVI1xM2HBw8hnFQbhi7DJu/m0Y+GJls
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX+C4r1C41b6Rx
 +2h7qGvlstLndP6Zp+5K9cz20qVfCMijLCizH2ip666RGs2WAP09TqBTHzNoIVNI9bQd7Z+Dejk
 w7IyM7RTjVXzqmgSvRyIbqQM6Ug3TXV7z3N0/5aQga+NTHR0ZIrRwjiZEoRaOSR6shbZgPlR/r1
 EeH7kYCvIgbuC1aDUPasqnz+fK0rhdGvcsw/tahwS3FgiKNzlVyKj3AEkDO0BH+QFSrEHEIE83I
 yjVUXpvtSILJ1+oorKstW8wx0DFdTLjkKt/6do6U5/H+t/+nG/AD6eB48fCFeO8YlsGznWseHN3
 ekKO4u04XDj2oRltFtWNFz2zi+fmBgiM4Dg4uEM7XqRzda/i9bF2pie0Uwrsg08Z6yWC7n49y6l
 k4fRgNiJ/iI2FU5gemU8pHfEEoRNKl8IFP4CrwhsmdMr3+uN9tPpe5mnZa7Yt+Gce2y6s1LOsPu
 wdVWa281/l5EBz8XbIg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab6eac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SNQ4sQprfOKLKwPE6BEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IYRXFeH9lSWMqLeP7N-RlzvCRmXpq-rn
X-Proofpoint-ORIG-GUID: IYRXFeH9lSWMqLeP7N-RlzvCRmXpq-rn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX1tN67WqUytxL
 FBwki991LIUZihu7sp3L/M5H1/Gos4h47gnNGjKPc8nvZdszg7UKITHoI0xbHMb2NhutyzQGRT2
 XhZrmzFikGJN3OwfOo8pCEeFVL5KsDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 999b478e1640..7633d274e090 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3595,6 +3596,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;

-- 
2.34.1

