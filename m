Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718311;
	b=rFgd7MU1KmS8I9uAZLyjTwmRf+tRabHjrXcRaAkUs1VMQlIvklABNbA9ghQ4Z2QV51fL
	 O0N0hjYwoPmlWSSxVIAX5PGLqQeuOmD6kAxrWWKiMIWtdR0RFmGq4gsaZuamkVHIVwc1H
	 NYemqbiRw1g3jIWBrREwtXJsMc6a7+a/zXA0epwrKoBOdFR/q9ZzDIF/hzS+QefYra3Lr
	 6PouIOVlW8kpJeHKfV5hokiN9yVUHvmEfPy76K1gWX8jrBa4DgrgwU/PiCU3wRwt3vd52
	 dJXvFhHIKOH2TkGz8L88C1JoZuWMASGnBXGjHS9l6on1wfy3kY/HDmJ96djC+7aWc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
	b=B3ulV2e9E6+OfanRKQ5FRIhELJBkytRrLqof6wHt/u11amLK7YzlUfoXCoWShotmHmJD
	 N2jLCiN10GOzp4cv2CzEcjDWLEKUh7K//pp/CbL1pug3/fFeVGEI3rW4HBF9FVumGZhmb
	 DrRIw/sZK6iUvJODWKReKnmEKroCQlszbyVyEth7rYpdLNssSZc0L8h7wjydkB+75i+oB
	 PEbjQodTq6xooMBjML//Qek6clzvhC0AGE4yHqfjIU2FOPWgF2wTheFxRn6v+MYVIe+Tn
	 pPJx7sJQ816veLn9p+6urjINMgfmpL7+7xlPQwU82Y/oh0azCMqBFcS/ZhNDsHV08TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5060A2637
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B5060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFupLH3751371
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjJP/yVn5Zo
	3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=; b=pmLM9QxprgnHqvs1HYhjmUu4WiD
	p4LNs5nPNpj+SQHK9NtdgTLQOu3BKdFpqJpO6dw1mHsh+5DVDHENEWhdVhNhhnwp
	j+xe2Ypp7LGldnqPoJryS+X5w3hez2lP3z6dMRpPb23MboRGF3V+PeDKk6ZFH1BO
	A13twpH9ecuCJrKZpzuEt93AU8Vqb8zIRk2k6Ujox9nH6NkBcWS7jYnia95AMo7S
	Rbf4affIblFzyKdoSFfMTnOIi+2Dksvu/KVi0ApZ08ph88Kc24wlKvyvmNUN7lSC
	jSaRZoohE6vyt/DVhDh33TFIw1UqzJQpYGDzm+BkJg/XcytBLGaM2eOCy8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662scaf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131b4eso417614485a.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718308; x=1796323108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=Vg3UNItwB54bDE/elz1MkD3Ca1BjCbdI6D5KknQ7Dc3OpYGn44FwsFfzn0/0ZhS+8Y
         yA7nQR7v/DE8CGiwpbT5tNZtVdUGFWtdtXe25kjYXDeydCpAfLrsn4ywfxuw/7o9g04L
         xC2C2OYSysnoQOj/4L023nW2dxdCzvj5igW6ZbxkuegOtgHT3sQMjK9RL5Q2dyI3HtP2
         YwhhlaiNMueeaC9D6PqdztJSzhKZPKk95+TKF/PI0ru+rB/H+mUAn8b4wCA+HagMyeH+
         rpUYILmymXYRSQswvLN+P6+H7ehDeyAP7sh+hOE59+lkFbcxUW9afNtFgZCxRqoMV/1Z
         kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718308; x=1796323108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=VIIGwvqE9g8xNe1sCvX43afLQZcI5QPbb+uixGETvJhr1LrslXURNPJm7Ief/irMF0
         ckXLUmxLVwK+6UrCXDr0NceYK1ORPt4JdpssgkwTJXECOrLKU9EFFno0B7thzXAyQ1Pn
         sf/y6gSVtMKf9mTATYlbZ6l1+f9FbvvGaRrcURZs1ixQ+9tDuHKZOmDykJePSVupgau8
         /3Xy1f2aqxVyJbUDtWoZgorjX7k7SC010znmVGZgC9OihSLycIARFHLrsThYwL4N35fn
         o9EbXBkf0FZxt3W95yhYSY0hb1aMnDL9mtZQ0Fx61kFfyHE9MRC7MwRNhiVx0GneuVGE
         7LTA==
X-Forwarded-Encrypted: i=1; AL+hErEngyRYbS+T1s3tBEgPYNxSnMVvIENilceKAaPkUnIuycFJbL+yQIJPoYdq5yHTmDPUdssmpVRF70HFow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S1TL3EfpXQinM1AIJQpW8coW+Hf6mxCKUre39vyAThGkRH8Uh
	iyr7h0HDKQhsqcyePtUYaaPZVsHzkW2Mq4SeU6ht12XtDeRCvwI3PXtQpsfKMi2y4/bCxSHOqar
	JRx7NKep1MOzdYVdZzV4DZlEqyIUGs3O6+fmnvIL5BQ99dfGpaU6gdInXADSF1miezw==
X-Gm-Gg: AZFdTZe5tLhBR7wmEIH/DtH9DdiLWc17vesmM27abkHMSoZOxP2KPhqG7mD4r6t54PE
	DnqmnzYuMmJZ1lZk70ZR4lyZlvLSVLekiIyzWaunzoYKHb+nSUXWnN8C4/Co9v9Z8zlO3lF0NW4
	hQt9bZXjwpV0bkQQtUPqfr+ewc4Yd31qYU/5zdREXQdjA12qdQAhmrp+MKfQnt3hM3CSCg8rz6e
	BQRCNQQURFSlxZsgzmVRDdqrhbVt+c4nTs+6iRGEcHsUzeDRwKXtDwoJpzkZs4k28yY55AQ9h6w
	7f8+vuwgq3ER/pFneahla2jAFii7Yuyyxawgm8nJyIFha3WtrOzhH6qjV057IqcDQp08XRlpwgC
	YI2fPhJqvaN3HcaJWjrC4LTuHvXZYyMCB1J+Ovgq+s1gN2N37MjkWtJudJ36Xkzr8
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683553585a.31.1795718308455;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683549385a.31.1795718308034;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Thu, 26 Nov 2026 18:38:06 +0000
Message-ID: <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b087ca5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: iEwfL-TXiNSrbu54-tO3Wr6BkEHmbPff
X-Proofpoint-ORIG-GUID: iEwfL-TXiNSrbu54-tO3Wr6BkEHmbPff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4qEkKDrSGxv0
 pB6oy3aOa/J9tK+d1qv4GB6BtezqXIMZaX/x2RieRKTdFybYlcgf41Fr10/UMtadI8WYYiOhiiv
 cB5SjTPJx1daE9hIpbhSQGMvri2cYZItCNYVd0FDzH5Hkli6NCys1C6yE39kU5kci/cLjs0r2Xs
 Jf4yB887WamUvDqvum59fum1uKHUG9WK9/Oq8rmL9cGScclvW9c613Offk1rWLleu/WAtpW6ZkI
 T5lftnR75dwJPXTzvjYpnXxVmPmUyza9mi7Zy4mr6poiWxqlD4r6OamyiHz5KkuiuAnHkyOfOlp
 HiTALc7HToltbWgW+hcBwVn2oWy3pM7u5DzluX8gGTE0BmiERML5XjP1p3KSrBw5gui8M8GZGEP
 cvLZIezGCwOfngwmCDJJD62RSgxsF6a/sCQ4eNCQPNO7JCkKOTnTzra8Pd8joliAsEsSP+ZGI6g
 3KXOuLnmGxg5AjBE9DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXz5o3HybMV4Z6
 Pmdgn1+0Gn5IjFfZQtZJFvNOtjjWJUUW8/TSOymNKFCTcvzsfC+NZWX2WHIKpD5WleHgoZXXzdF
 oxSe/6PfOATOKgppUnfUreZPjGT1w5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

