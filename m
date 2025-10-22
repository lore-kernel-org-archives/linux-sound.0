Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5D2E8DE8
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113230; cv=none; b=jpI+QcVfmWxxAcvfbKI9f2HDvKqI0ZoCcQMt3nJ+4kA6r+15Q/uoK5g3bh5C0khlz0tOKbl+iOJWyALnL+rFBxisjNPcMRoMwl5hoeFFDm29iQ7h7f/sHqJK0ZbNSu6VdVQaqeesjSNRyYbd2S8CZk+UZe4e1rnpjPWPsyy8g7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113230; c=relaxed/simple;
	bh=mzm8zjzGXa3bcj2hI1nuVqjf+8xVLhv71Tv/OMlTJC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ozr3+x2Zky4P8af5D8DMeudaJk92/AG0SdFTWOqWNcBfdkID05bMXolyYlbxlfctxv8USV26+mUN69JRXsDnkjTObB9a9bsCWBlhGd4uApibJb+WWdAVDUiX2RCTERQQUHB+kwd1H4QmS2l9iXGXmIl8bCq+0zm1GVYodv2lsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=goBYNmik; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="goBYNmik"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3853797f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113226; x=1761718026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=goBYNmikQGygkSpVuRz8dAbPiRYC9TRrEh6KpIqKiosrggp/7509WAj+m/jvF33bNL
         gDPuuo89pq3QiZrWIvUFi5tN9SW7JDiZ7IP2Bv2T7XZzdfuqk1+vdpnHYfxbBRMIvnnw
         itdjjURPMwYBzSk2yAQR+/pJ7mInVMlUg6xWpaKO/Vo3LXcc4vP9TPtA91xt2OpF+2tM
         2pyDEq2eUJZp83oEF47C2lLf2lLaRzNjONDwsj6hrdLxetd6WYCwaJcMAefe/taQP+y5
         KCbfgx6rCmeJwAxQjpjRdiRwGXsidrJLstjFxibrR1lUssZefDU1cMRkK+xAwOHeIyjI
         fy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113226; x=1761718026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=KkD7g/UQquI44vnedQ18v8P9QVTsrXqP3K9mnN7rPUlHhj6beIOcXkMUfypkNsfet2
         yRVpbQ1G7sp8hyslQvYN2/12apyUM++tYDTTlUZwdPXl2MyiM4dAmptohd+cF0CHS7qb
         AVpkQm5jcmM8857sXH1vqDHc2J8/WcCuKRcU9pmnfj57tAJWeQjkqVaKsdGhX7Z3z5LJ
         AY2AWMAdrymjqKgkwAZGKU8KlwztNEVa2XqpHPfvrjWwtTa12BdHmjlc20SP66A4gIwc
         C03/4VSTi7dCPLDOLpwJ/fWIoj2rtZWY++0w0EmocJ52wrC3jrkcXTina3Tei5t6QUCi
         mESQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZcdy6kegTQwVUK3Nkvtgtn66cx0dqahKU1KEtlGWpME6/bt1lJZl/2nGRhccEEf5VDtk/SXHXHVuGMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjUwsvLEYMZeS3sXQ5H53QpY3qiB6kzTiZknxcJaaqt2CSK31
	B/XkcRFsGLfU2qQF6ttI6EoSF2ruqz1Aotzrg5kKFA9dC3f1w7BVVCe62LuZgSQnFiM=
X-Gm-Gg: ASbGncup8c0dMhvlyD8NLYOtIddWO1sI+hK1361lQTGiwaJ2KPSBO/49XwlbFAXcBch
	1yaQoQZHbquz/wvUAKFtHYBC4eWK9R+VC6Ntjf8/sExHcVdyI47Uehois15mUQ5IB0bsH8ZYRal
	LgG9s7Vx0wDzi1C0u4ddh28e8dOsKtIkjiTeCYtwOdlYF/7kj6zYNY7Rx1csRuFw309Gvo8Bk8V
	tbOXElffMN8vbNCTWvMFq1qs7I+ptpqexDd3Xyd+Uw2qiWUw7DPjKibCHgXyvbLJGWCqufziR14
	Ha8Gp0cK3DTgpNEAbQrYfKwiQ9chqkevTr0Tieo4lghY6l2ZYWaMCvVHVJFMbRXI58x2MtVX/LX
	MCXYF43XTwdJB/K7N97UnfY/+wAOIiruBIOgKXiTagEwEdxVrv0S24FPllVWpxbRww0ZpHo5i6+
	cAytBuZNk9mJlx6lYt
X-Google-Smtp-Source: AGHT+IFMMvPFqbCgXFrKUM10p7J2tPmq2z1/eAW/zj9g6TRaqGihpOwAHdCmyorfaFbNXlUU5ZMJLg==
X-Received: by 2002:a05:6000:400a:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42704d146c1mr11064085f8f.4.1761113225910;
        Tue, 21 Oct 2025 23:07:05 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:41 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: qcm2290: add APR and its services
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-1-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

Add APR (asynchronous packet router) node and its associated services
required to enable audio on QRB2210 RB1 board.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de2462ce91896fd84644413fa46ac047..7303aff33814f256a2ea09a71a640db466370eff 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -17,6 +17,8 @@
 #include <dt-bindings/interconnect/qcom,qcm2290.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2077,6 +2079,76 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.47.3

