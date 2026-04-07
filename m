Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1C36F42E;
	Tue,  7 Apr 2026 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575255; cv=none; b=VQaTkx1R9XR1BDG+JD6wRGIFwrcmXHQOxHKSgcuRj2SRdqdjmtvKxFa1W3SU3sdgZULOUeonpA5GzGY1RBHP3Fbswn+oWN/KLQGtlwN9Dl2AWKrquyXqSBayFrZQDinQkqrNgDcBGlRz4sjJEMOVmNYs70r3LMYAkUb6GI6aYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575255; c=relaxed/simple;
	bh=zleSGZ/ZalpF9Xul7Z4BSESbmx+1FSepdfsf6IbZogc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUYXtt5g6T+dagcVR2nSm9UF2iiWlPBXPVxtxU3tVsXRwFS8xWPWUw4ReAJV9TvQgbp79Ql3TUl5MqMilGFtMCu3+f4OexWMkJBHj7og+BhOO51ajhUKH6uWneUmiTi/Vi8xpEhPfVetJa9JAeJ+IPnqtoyGzJ7iQ9tWrJIIe7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575237t597c16db
X-QQ-Originating-IP: aYtE5w9jmSe3AJHmf5aVWYyi0CDvI75O/fOa8EA9QQ8=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8059686087203392051
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:20:01 +0800
Subject: [PATCH 09/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Align
 reserved-memory with latest firmware map
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2892; i=sophon@radxa.com;
 h=from:subject:message-id; bh=zleSGZ/ZalpF9Xul7Z4BSESbmx+1FSepdfsf6IbZogc=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZamTZ3eHBeU2CzQLBD9MPykltLkkm6NG58fvdm/d
 vNCU6sJHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACby9RvD/+iAlV4BIhxhnzlm
 JEv3h/3f8ZKFVfNslWqD9udNd3QiOBkZTr/+HitVsC9JpdhglZYP6630I6aO//gPftDP7z/35Fc
 gHwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M21ph8MgUKJrG0PuygVjJ5ugSLtupyI9W2Sy9Did1gcQP+ITqcUFUEIt
	jyUdAEiuIbuahgmWaCaczBnSWH7S/1dCih5LJ9OED8lP+qDjiN1vJ3nBOHDfm1rmRNDHkNG
	lGnOV/o2Djsaf8WNfTx9pRMMb6pQQryL0BOwvM3z0gGIrl99Mfq6tdZx64nt/+un3z307b9
	x2QtSa8J1gio0bP/CXzwbZJh42CODhcPtMhYEnRGrCK2wshlE7e2hefA31k1UTbOu70b0Ds
	Zi5NqOzlI1FGjUvMa228490fErgsnNgFM+H2+1n5Rv147/vwoYYSdFNLOzkrHuavJ8GNHe7
	KQQXa4ST9ALycEd9OOvHkzdJExdfJ6Q+xMjgVXaEnEDde1vP9c1ixW0YHuweuPdzzZKg3Ua
	89NhsPEtdC17pPlXcXSg4WB9M9xhsBdUQqG8J8aHUCjxSktj1uivt3+/nOlJm4HVi7Tqc8F
	ZYmVPw5Rw2wFvrxzlHobrK8xkTKmwaltGuX98htXyHV3ArZ2mbIBAnyoV0yC2PJhrNK64hd
	Ekt3UjVJ2n0aNIzPpqqQ8903zMPu146WvSiN9dp3DIentJHZuxNjX8GBwvymXQoX4M06jpE
	s2cQWVQ3iaXg5sPeCuKvZpiHjohj5u3nKqydXl543ULW3Ofcc5JfKk3qCsAS6mcru1FSHIV
	exFU7fgMb5dfwtk3Zwx03aCb8t5lsaSElNh5F7ccHemdXgn3lKw7vluOqri/YJxjxn2VrPr
	T4NNiBfdU3sQXANP/77keZX/5/l5N5VI44xvQrr6Eko2DtXqPVv7ONM9zbZeZs6AGep1/Z9
	/i4kzZBrqE/ci5cRDdWgk91fO6aWZAiEYV+4FFT1x2Lw227dgqmj2KoNi7YWuo4TZVP9Fpm
	tDZCi8q38i/Waz75xfQq8dzleIGSo1xZZxr9BaoHsFcCEZqtFEIgMCHj0P043jp2f+RPAGa
	J7XfIBRNa9Y2XY4MRDuiUMSzdY094eavJOO/Roma0iYVaHGIiKXCIFZfkanRHjAczW0vaDH
	gWfovrHnYKw1ZRU5v6y2tYcysaTu+RotWV8oOkcV9otkCaD0Aa0skemqzl+1pJvh+LqGDjj
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The current board DTS no longer matches the reserved-memory carveouts
used by the latest official Dragon Q6A firmware. Update the memory map
to keep the DTS in sync with firmware expectations.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 43 +++++++++-------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index fe3f60f8ed5a..5679f38de5b3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -22,7 +22,9 @@
 #include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &adsp_mem;
+/delete-node/ &adsp_rpc_remote_heap_mem;
 /delete-node/ &cdsp_mem;
+/delete-node/ &gpu_zap_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
@@ -33,7 +35,6 @@
 /delete-node/ &wlan_ce_mem;
 /delete-node/ &wlan_fw_mem;
 /delete-node/ &wpss_mem;
-/delete-node/ &xbl_mem;
 
 / {
 	model = "Radxa Dragon Q6A";
@@ -193,43 +194,33 @@ user-led {
 	};
 
 	reserved-memory {
-		xbl_mem: xbl@80700000 {
-			reg = <0x0 0x80700000 0x0 0x100000>;
+		lpass_ml_mem: lpass-ml@81800000 {
+			reg = <0x0 0x81800000 0x0 0xf00000>;
 			no-map;
 		};
 
-		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
-			reg = <0x0 0x81800000 0x0 0x1e00000>;
+		cdsp_secure_heap_mem: cdsp-secure-heap@82700000 {
+			reg = <0x0 0x82700000 0x0 0x10000>;
 			no-map;
 		};
 
-		camera_mem: camera@84300000 {
-			reg = <0x0 0x84300000 0x0 0x500000>;
+		adsp_mem: adsp@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0x2800000>;
 			no-map;
 		};
 
-		adsp_mem: adsp@84800000 {
-			reg = <0x0 0x84800000 0x0 0x2800000>;
+		cdsp_mem: cdsp@8e000000 {
+			reg = <0x0 0x8e000000 0x0 0x1e00000>;
 			no-map;
 		};
 
-		cdsp_mem: cdsp@87000000 {
-			reg = <0x0 0x87000000 0x0 0x1e00000>;
+		video_mem: video@8fe00000 {
+			reg = <0x0 0x8fe00000 0x0 0x500000>;
 			no-map;
 		};
 
-		video_mem: video@88e00000 {
-			reg = <0x0 0x88e00000 0x0 0x700000>;
-			no-map;
-		};
-
-		cvp_mem: cvp@89500000 {
-			reg = <0x0 0x89500000 0x0 0x500000>;
-			no-map;
-		};
-
-		gpu_microcode_mem: gpu-microcode@89a00000 {
-			reg = <0x0 0x89a00000 0x0 0x2000>;
+		gpu_zap_mem: zap@90300000 {
+			reg = <0x0 0x90300000 0x0 0x5000>;
 			no-map;
 		};
 
@@ -249,12 +240,12 @@ qtee_mem: qtee@c1300000 {
 		};
 
 		trusted_apps_mem: trusted-apps@c1800000 {
-			reg = <0x0 0xc1800000 0x0 0x1c00000>;
+			reg = <0x0 0xc1800000 0x0 0x2200000>;
 			no-map;
 		};
 
-		debug_vm_mem: debug-vm@d0600000 {
-			reg = <0x0 0xd0600000 0x0 0x100000>;
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
+			reg = <0x0 0xc6500000 0x0 0x800000>;
 			no-map;
 		};
 	};

-- 
2.53.0

