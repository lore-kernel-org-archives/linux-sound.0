Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968425;
	b=kfIwu3BoOjspW493EF7WHw/aHyYrUENxF0ef+vJPJ2QfNHJxxtn8YF2d+JZFEdn14hTC
	 AeBLk5AT7aXFoYBHKB0i+bLFhaLhlWuna/3M+zX0GDtEqc3ODdSpHkGs4GyUetTbZU0Kk
	 DUPrtqOEfwSp2tOrnwlzc+g1EZrDVG8DuGtF3DlfT30+gJs7EnfbdpEDizVCgsQMO/PR1
	 9RvuOgHn3PQiopdjX+XKC9pECHYokn6d1A4xU4Dmy3F+vIEa+nMz4KneiZlw4j/1Gw2mJ
	 8zzHrL1DSMcragBQ9X/LXuMjgvkdj2JiIPYqXtWSQWhGbUmPhoKVvng1TKNaXUfRyaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
	b=aDbe3dKMj6G2OROBGoSDKBu1DLbIkEY2/D2DsBx9I0nd49d60KsE/I/mcDKyLAotblfB
	 J2K3aThuHSRnfqXyQThKX9V7zNrDFXkXth0rXhZ9xGexcRQIbunG+7XrZ0vP+45hmFR5l
	 5758gVtNZ9/6zlr39HtdBWOO6nasHO4KV0Bukya95T5c+0FgPpAO2HK0m6hORVSRpaHFt
	 jY9XW7qUEGKknD/P/wSxa+KVOybRnnNDsbT+HjLWr7x7ybxDN/VqcL1Qv00eOPPyoRWwK
	 dLSX+N2HeCYQKF15eMahGavWDjM/Gm1nVPrqaxLaLH9HjJJhoOnpOeT9w3uHEID75rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KURNiPJF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elbEx8WG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD1606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDD1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KURNiPJF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elbEx8WG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APIEO3129483
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 12:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=; b=KURNiPJF1T4e9Jyr
	XsgNebTnPP9JDEfU1fvFUoNRAQay2ohZzRz60t3OOaxDNnrf6RN4skcaA3L7AtCB
	wA2wRLSqOwKaYDZaaaDlJLjE6vd40dhPlTqwfykANq/kCwf+8W6yqPpXqfZUvKVm
	qhbFXKkYyMQjqeScWUAa9vvXsCHISKBJrby6JOqoi3vCLMkwBrl1COChFOJfxDMX
	Do9rjA/SnK5WKzzi900GcoZhRRi3ToQ8fqS3f9x4rKI1zkf++CLvjiUlDYdOb2ZJ
	5z1aeGZVT7NQ39BwzBbUXvBxcLvl2vr67qxSAN/UBSje5GtYqDGJJN3lfrXg36TH
	7jjmzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9jqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:33:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1123640eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968424; x=1794573224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
        b=elbEx8WGKyb7DQwyAE2xuVlGxeTjEFfV6FufmHKioYv7+5VF0Gaeh9SbMzffE1iePp
         xdCuxKS6n1VMM6OIPJm4L5FVYJqCzoJJGWV01JfEBiKBydawYFrPu+nsFDPu/DVpFpgx
         7Fn1cHQbiWQDaaE0IKDcmLmqh+R6De6CfTa2xUoiQxsI3joTI7dcKM6WCPxNt1Txvuwv
         BOKlMWlglGbYzQKNqj1wiv2HP0NOGpS1q39BX4uMX+uyfjucouo6hii6VZFEQ+ltgKkr
         eeMaN944aYX4r+cZI9e4u7V2JlHFbtfj44DuHRvfeAjFlfNsqRWjunKR9P3psHJTUvzG
         KRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968424; x=1794573224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaTzFDos1He5u0Inl5fiMb3/qvjgsfEDWvcCeeW/87c=;
        b=Nejvgp6rMvTVXKlWBRUsHtlSiZYL9yLPnS9ZBS2G1fkl7aXrB7aiGmxkvZFrN4r9r1
         /EzBYLLWro/bKGFQqQFnWNOfjwf1SBMSn9+InNEp/yj/isNfcES7Vk2coQP7X542zgbL
         XVk5WIxvSrxGuyf/u2KiG7gYG/QoAu70JUXNmz+u0lMIJPu8DUtlA/SjVd3RBjJaKTde
         4Iviy79b7P0JdpXDEIMexZwILkhSZvRZP4vQ/gRGjwkb/ZJWzfXHH9aU31hPwdLfwvyl
         NIXqftSbhDn6b5pDUXb/wubKfl1SpBfSZZ7meXnI+cIQQUGJr48p71BHOPPrOMDvKXc1
         8Wiw==
X-Forwarded-Encrypted: i=1; AL+hErHgcD6PFHW5U0s81mz+txi8VWCDDAa9nvqw0MIyXhFzwD6f9wR0kmTpmIUwe5RqgIc9Cpe7Vg2PQG1gzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vZ3TYLGp2KMlG7T5AuurFyP0p0vKR9Ui8mG1rDZi0q8sL1pv1
	bnKY9ZVsad+OlR9CkgEopRfLOAMkYrdGSAmwh+UMGQYLuC73Kk1QVf8au9S/xdZ5jaHvIJCF1oV
	DRUTcQHoImOoAC/ghtRA3aS6kePXA2RgyfZGWngqryg9GSDO+Rc1JzBWxGTfltnvEDg==
X-Gm-Gg: AYBFou1dRVRggI08qZrKJVqbou8OL+ffIcdpLCi4K62Iwptn0Zs297PDYd7vnZTTJbA
	ZQX6DxK61ptR8W33iqwp/6uqjPZIoCylkjYNxZUMX7buJ/rvIRy9q09txYveesbxr5Cf7H1Y1YF
	gX+i3RAb4nmS3t/UZQqpeV4a3kr5J9uWJTLQGmB6YOfy9QkG96tXHeoPZBbRpBTpqhvsytXh1hV
	5xWNZRyAbfKV8G39kIOKOWKHC7wCfCJo1gc8jp6Rd+0eBbyrk9NqV68Satlmn869GdgGPkBBK7L
	CO1eL4ezlj/3Zf85Qt7m4ex3cTh/3vJFpKCQ0Iic55xsJiajkrd3aGCgI8s5EAlFxdOVAykiSZ0
	l9beteLXI3DB1wi6cNB5xY8JuWLvu2dXgB44RLleZdqzRWF5pyQDr+V5VQJ9iWwR1L9gUrRWDc1
	6e99kQ27RX
X-Received: by 2002:a05:7301:dd81:b0:36f:64e9:f1c4 with SMTP id 5a478bee46e88-36f7553bf78mr3084259eec.6.1793968423341;
        Fri, 06 Nov 2026 04:33:43 -0800 (PST)
X-Received: by 2002:a05:7301:dd81:b0:36f:64e9:f1c4 with SMTP id 5a478bee46e88-36f7553bf78mr3084205eec.6.1793968422619;
        Fri, 06 Nov 2026 04:33:42 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:41 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:03 +0530
Subject: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=16565;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=pMkevngB1TwXlQAj3SKqNRTOXHvnLKhwTY1TDrygCU4=;
 b=Ps3jOg6d+Zwt6yRrtwLk4wdtfhGP1eauH2hfW8YNChvHhYclXQem5Fe17AN0bsnIcu+YvoNT9
 vD9hBvwJ95QDaJZMrgtlGwM9FGvAyIC6UZP46vsFZedo06/yd2PzTeX
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: n9orpnqZ7h6IP1l7NqRZnKcvxosQoitt
X-Proofpoint-GUID: n9orpnqZ7h6IP1l7NqRZnKcvxosQoitt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXy757mIcSf2Kf
 upKmZ9iaxMUZdX5Tg5crS41d0XC0qBB21SOiKwYZom4JU+zhWImiRdNs24jwuz9rhBux2WezQaO
 DBRQcryfPZNjPsIpjfKU0IOrRBJxOM8=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedc928 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DfWgr_zdYjWxq2KhsJ0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0MruhzA9HHv4
 917oLLx6SwxPSuM0gcil5to9f+LPkZVrzisazfPkHau/jKRWiNVNFwr0EhhGpPTstfz+ZjP6KcH
 ikiw+ZSk44+TnerWGIuN85AUZpup+nXBT0cZIB5zkawVWaF0n4m3OTNUGRiFe/j/C0NcLTDE3N6
 rkgF8wpuCmwi12IVbJzo9f3x9vmWkyCxYTqde5cnQniMPmsrG2gD/xbh/kmaPh2+D/+u1msVCtI
 9Ur7qwWLd/IjiIHfzC2UcW4K6TghAJn46EUunNZjMmPp5NJRiKw3PwjGA6aTbQRq29ATfs9E+2b
 nDTG6NKhi2FUOJe6gsgXe4113D85JLTA8bmI1PgW7Est5eZNFwPbbrUYaJz6NOxxwIrBXiV6UwX
 m37s+tiIts+9iHYzih/WwHdQf1q07yttZFPAGTm0FEdhHKAk0DElvcwzJoeY32eUir1ViXky/Bg
 N2DU+3oh/v+umllFYIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.1 implementation.

LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
before it is enabled.

Add the new registers as a separate reg_default array, used by a v4.1
specific regmap config.

The register layout has to be chosen before the regmap exists, i.e.
before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
probe then cross checks it against the version reported by the hardware.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 276 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 269 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 03d6434a4a12..db395674312c 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -26,6 +26,7 @@
 #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
 #define CDC_VA_FS_COUNTER_CLR			BIT(1)
+#define CDC_VA_FS_CNT_BYPASS			BIT(7)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
 #define CDC_VA_SWR_RESET_MASK		BIT(1)
 #define CDC_VA_SWR_RESET_ENABLE		BIT(1)
@@ -156,7 +157,54 @@
 #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
 #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
 
+/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
+#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
+#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		0x0804
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		0x0808
+#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		0x080c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	0x0810
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	0x0814
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	0x0818
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	0x081c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	0x0820
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	0x0824
+
+#define CDC_VA_CDC_ADPT1_ADPT_CTRL		0x0880
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_0		0x0884
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_1		0x0888
+#define CDC_VA_CDC_ADPT1_DH_FSM_CTRL		0x088c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0	0x0890
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1	0x0894
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2	0x0898
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3	0x089c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4	0x08a0
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5	0x08a4
+
+#define CDC_VA_CDC_ADPT2_ADPT_CTRL		0x0900
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_0		0x0904
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_1		0x0908
+#define CDC_VA_CDC_ADPT2_DH_FSM_CTRL		0x090c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0	0x0910
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1	0x0914
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2	0x0918
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3	0x091c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4	0x0920
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5	0x0924
+
+#define CDC_VA_CDC_ADPT3_ADPT_CTRL		0x0980
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_0		0x0984
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_1		0x0988
+#define CDC_VA_CDC_ADPT3_DH_FSM_CTRL		0x098c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0	0x0990
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1	0x0994
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2	0x0998
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3	0x099c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4	0x09a0
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5	0x09a4
+
 #define VA_MAX_OFFSET				(0x07A8)
+#define VA_4_1_MAX_OFFSET			0x09a4
 
 #define VA_MACRO_NUM_DECIMATORS 4
 #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
@@ -210,7 +258,8 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
-
+	bool fs_cnt_bypass;
+	bool has_adpt;
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
@@ -237,6 +286,7 @@ struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
 static const struct va_macro_data sm8250_va_data = {
@@ -357,6 +407,119 @@ static const struct reg_default va_defaults[] = {
 	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
 };
 
+static const struct reg_default va_4_1_defaults[] = {
+	/* VA macro */
+	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
+	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
+	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
+	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
+	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
+	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
+	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
+	/* VA core */
+	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX0_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX0_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX0_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX0_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX0_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX0_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC7, 0x25},
+	{ CDC_VA_TX1_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX1_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX1_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX1_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX1_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX1_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX1_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX2_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX2_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX2_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX2_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX2_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX2_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX2_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX3_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX3_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX3_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX3_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX3_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX3_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
+	/* ADPT blocks */
+	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT1_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT1_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT2_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT2_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT3_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT3_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5, 0x01},
+};
+
 static bool va_is_rw_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -430,6 +593,46 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TX3_TX_PATH_SEC4:
 	case CDC_VA_TX3_TX_PATH_SEC5:
 	case CDC_VA_TX3_TX_PATH_SEC6:
+	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT0_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT1_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT2_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT3_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5:
 		return true;
 	}
 
@@ -463,6 +666,26 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct regmap_config va_4_1_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = va_4_1_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_4_1_defaults),
+	.max_register = VA_4_1_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static const struct va_macro_data shikra_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+	.regmap_config = &va_4_1_regmap_config,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -471,10 +694,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
 				   CDC_VA_MCLK_CONTROL_EN,
 				   CDC_VA_MCLK_CONTROL_EN);
-		/* clear the fs counter */
+
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (va->fs_cnt_bypass)
+			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					CDC_VA_FS_CNT_BYPASS);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -503,7 +730,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -749,6 +976,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -763,6 +991,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -772,6 +1001,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		/* Enable TX PGA Mute */
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (va->has_adpt)
+			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
+						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
+
 		/* Enable TX CLK */
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
@@ -1526,6 +1759,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		default:
 			break;
 		}
+	} else if (maj == 4) {
+		switch (min) {
+		case 1:
+			version = LPASS_CODEC_VERSION_4_1;
+			break;
+		default:
+			break;
+		}
 	}
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
@@ -1547,6 +1788,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	const struct va_macro_data *data;
 	struct va_macro *va;
 	void __iomem *base;
+	bool has_adpt_layout;
 	u32 sample_rate = 0;
 	int ret;
 	int rpm_ret;
@@ -1556,6 +1798,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
+	data = of_device_get_match_data(dev);
 
 	va->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(va->macro))
@@ -1592,15 +1835,15 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
+	dev_set_drvdata(dev, va);
+
+	va->regmap = devm_regmap_init_mmio(dev, base,
+					   data->regmap_config ?: &va_regmap_config);
 	if (IS_ERR(va->regmap)) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	dev_set_drvdata(dev, va);
-
-	data = of_device_get_match_data(dev);
 	va->has_swr_master = data->has_swr_master;
 	va->has_npl_clk = data->has_npl_clk;
 
@@ -1654,6 +1897,24 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_rpm_put;
 	}
 
+	va->fs_cnt_bypass = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+	va->has_adpt = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+
+	/*
+	 * The register layout comes from match data, as it has to be picked
+	 * before CDC_VA_TOP_CSR_CORE_ID_* can be read. Now that the codec
+	 * version is known, make sure the two agree, so that the ADPT blocks
+	 * are neither programmed outside the register window nor programmed
+	 * on a codec that does not implement them.
+	 */
+	has_adpt_layout = data->regmap_config == &va_4_1_regmap_config;
+	if (va->has_adpt != has_adpt_layout) {
+		dev_err(dev, "LPASS codec %s does not match the compatible\n",
+			lpass_macro_get_codec_version_string(lpass_macro_get_codec_version()));
+		ret = -EINVAL;
+		goto err_rpm_put;
+	}
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
@@ -1775,6 +2036,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);

-- 
2.34.1

