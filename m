Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372935;
	b=Ke7AyKcB6iJWiT4YMqF1XPJqqLEHDzB9JY6fsu6Fm3VDbCXZU0fuEU1MJOL/Qnl5hGGt
	 7GaluKSNfQFAH6x2gR7OFu+ZFns0idAqR5dIuc/WE4wne3NaCmk3QvTLQYLUVKV30Qr9T
	 Q3hK8JaTkByZRDbn8sTGiYhr9Zn49xkxtU4vm+/5VNssNLFoKds54z9Yhc0GywbYDT325
	 w/7ODcQnUTry7jpixYkRKrIicUU1DvkJe0prEjUYNnhcfLJdyuw6KKP+CCV1QAI0tKQrU
	 oUSSFc7p8oncRDAThCDgWojB9fUJGeH0BW5W/ALf9h4BJ/ibUiotVst9Q0lrIuaKNfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o5os1BY6EKnH92TRX8J0TIMZQ0IhbACk1WzDd1+ASqM=;
	b=VVKIsnz8PADO9qSQxSsbEVeoQCixm/KEykjaepxGfD8ez/CHvO3PFeEJYmOeST10U5sh
	 oTgoJGOFZr4v/apDqagS12A7JTggCEt69o3cFbejPRcpxXNCr+NX0Exm/6eUCf5tcS0bR
	 NS+/EhymQolBKuR1CitkR4OqcSDmuI6itSDj+7LuuTOBOt4BRGg4MosZQztAZxOsbBK4/
	 Qtk6Lz0JuXT1KCv/SUYVdffY8JlZqm2KNfRFWb0BbTD3r/TY5c3Lpx2rnc49agZBRr6pK
	 6cwutT9kXCsjL8ymkFo086BAM8eyYrGoCEEKT1L+TvgyCtsBWK+MdLHIRcE6cPoZ1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KZKaRaL4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHE9yu1c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224D606A330
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A224D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KZKaRaL4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHE9yu1c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUqcW412082
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5os1BY6EKnH92TRX8J0TIMZQ0IhbACk1WzDd1+ASqM=; b=KZKaRaL4LFLbAI65
	ZEX2ipuu6sVJT7wO7ZuO8vRrwLkk1ypbL0Rv2/U/5vy+QYBNJCZm9ytm1E32zgvh
	S6QGEUQlxLUfS0L72jvf6Vi9HPa+tpikAj9/uBqglapNBheHrCK3RZgGS9FJIzGu
	0vB0ojc3zRhprzezXyA63hHFD0calTwrvyPA3+8ljswcqUs9jIkds4gEqfZkuclY
	7hEqiUJGYHKblx4sWqNjQCBwQl1tTNuhtToIW20mMsmcgITRuCAuL42cef41Y/q9
	HT6cI29BjAAZnKRLBz/WbVF6kg2vHCxmXNt52S7rakBkCUnV6VNRaDLhriopkdEC
	OH7TIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m34p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2980397eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372933; x=1795977733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5os1BY6EKnH92TRX8J0TIMZQ0IhbACk1WzDd1+ASqM=;
        b=NHE9yu1cBCMHwgDDNSbPmX3plqtgaiNIpq6o9+Xbfdw08T29qpIE17MjJQi4qnH4xw
         7n+RxKvMsAnMIQ/kb7WpICyWWv6eVfwgBZtP3PVptKZQYL7ixZ6b4v8Z8w3u3vjIVCAk
         NsyvgBwYZNcAy1MVa9tiaS8lfb6IfA/jgiZk+C+kWnVS1DV3aOKC7tPDnchvjUdBF7bK
         bnJWZhzcZcXDZhQ4+YClu/gR+0+qOVvFF0kGThfk4uHF6QCkMz5PqdIWzG0fCmzaScAP
         aDaylumGrX1S6gj3YEdVlKcxrLGvwLLG/BPYZ0l1WwM+g1zIA+9rwgkp7IT/Sk5GD/Ft
         MOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372933; x=1795977733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5os1BY6EKnH92TRX8J0TIMZQ0IhbACk1WzDd1+ASqM=;
        b=X3VbHeLwdJVSRw0OYGnKYGI+9VVHv4TB7FAU88sRFhnaD0kHx3oQm1IjehA1n7YUHu
         a2MZBa2rFVp0m9vaUNZ0F/k8pwyF1hXhlncC2FaXpVCweL+dGpbklcyrhZTn5WHtgXdX
         rxitJCJ1oMqxf6gNfCe5welITte6XGd7avQaHd2ql5krknWtvEf07qBE7J0VLPVfrT2M
         CL4gu/C6cqoWzxfu0wPcrR0aIwT20TC/rRfAOQ4bt5wYROXQWe1D51Ka/zxWkKV3a7cQ
         YXaIn0mJRirPrRV6oVXerVyWPXzXoCXZPmWuXYcH5+8WyyU+nizfNGDKlV/JB5MCSwoy
         MSBw==
X-Forwarded-Encrypted: i=1; AL+hErHaMbE5U/2xyeMjdQMKMOXMF5MefL3lcaTNojdQ2NXclU9wbjIu8ArRVDj1WReXPs2ExDJAezmhVcVa+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yyUJi8a0GD/EkrajW9XKU9LwzTX8NpWLgMYoCcqHFkdQai/7w
	BD8/UI1V7blwdBCxC8DQdkTTjtUEbG5Fp0IHJrWI8oGy53jKPPORtHecuWwbnzOSEVxllI+nA+v
	1ma97zBt7qgGjh2/hYF0UXXy4h+b3mdDreOVImfWtAKlbc3jJF6Tij/NN2V/jxFURQQ==
X-Gm-Gg: AZFdTZfaj7phJtjjyiUd4J5DU1siEfPy/Xs7vIAjSZfMwlx/QRmsvREivH9w8v0YhhO
	WiNhqKbCZwdDk7F+7dCYpuy5c0DvANt82CpzFZNjKqd7VsU8QtjpRNUViaOwWYBQN3x0B5nUh7z
	yvYhC4QSy1Pe367z+/O6ct05TzbLxNG65ARd9Uc/QxvErU24kHZEspELgObXNSjn+qymJmWCTGe
	Yd0zivA0nVimKQ2/XYdDAYNJxPNRy5W2TFGzikplNXd3EFajuuOyzhGcqkrLkdXtc7jc2BJr+AZ
	zajSY+lERjTDrVfkKMryW4t7oJNRduMlLaPyjNH49o4EzrBkMLtYUHHki0uFlEk2tSLCEsfsxxL
	SRcvAlBPrWqjZtAy//Hk74+bvNHeeSIF8vlRFPX+13A2vuz/AnMHQNgIK+hJaeyebfAnprvnPyU
	Rare10igzDvA==
X-Received: by 2002:a05:693c:864b:10b0:377:1ad4:1947 with SMTP id 5a478bee46e88-3856f14d3c8mr11496342eec.6.1795372932296;
        Sun, 22 Nov 2026 10:42:12 -0800 (PST)
X-Received: by 2002:a05:693c:864b:10b0:377:1ad4:1947 with SMTP id 5a478bee46e88-3856f14d3c8mr11496320eec.6.1795372931717;
        Sun, 22 Nov 2026 10:42:11 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:11 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:34 +0530
Subject: [PATCH v7 4/9] ASoC: qcom: lpass-va-macro: Add shikra compatible
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
Message-Id: <20261123-add_shikra_support-v7-4-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=15954;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=5T/ShTsdj6zwic+0/OnC1evuFpad5Q7qhnSd2x6Cw+E=;
 b=m83nnlZwCybmZuhVKsyqhDR20I1w6ieM7ZDZ5YTKV0M+BEQi9/hL9Ct+kswQBQVVDDVoctUb0
 pkM3aKIrWsiDjBW5H279sJv12QNcBxlwY1rsTRidm+N7Cq04UVBaERB
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: Vdgwg21I2crII6MhjT6pIcOp905kzEGu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX4UnwwdcAwxfo
 MMsI+4OfRgO6o9k6bcPwLNFcJ5xKpAXh/pBPX/fbZXyrehSfgY6PE+dnVFT2o/XXSXiJfIUZknV
 t1I2zwciAlz+BffZvJGedXkUMNF0mxk=
X-Proofpoint-ORIG-GUID: Vdgwg21I2crII6MhjT6pIcOp905kzEGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX5yFQlM1slTp3
 pE5BNSoVEo9rOO4VOxw5b5i6ixNzJ6lvqoBGbOwBKFsuPYqYTSpWX97uImDwRRrpsWkLy14l4jd
 fpYIwzzqbErg1HZ8oRHzIoizBVHvJQLxcP5rBhFRc/ZkwMUCI/Q7x7duor9xA6HHfGZQEvuaXCB
 gu2ItsXW+fzpU2T/xefe9KJVFaCw/2/5p1mNW/G0DURD67SIOQay+IZ3voPnljddjpTBmaqvmyY
 WfzqBhu3PErtFtSG+6hZmMw+vFdASCiest6obKItiUTom4C4YwWj3nxbMnbg1rYsQYbK1NuNQms
 9XMQyvVNhX0ZUXm84umD5Ff0Rli3yKLVnBlQc09lfGrxuHegtKIJ7sAs/GZRShCfe0BxqwnoLfr
 qlBwCJB0yHpVFOAky8GUH2uGN9HoWapB7/FenuR6NkVrFV621eiT8yFRBHNt5POCBLD5y6NDIgT
 /gPMlsigKwLgsmZfIqg==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b033785 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h1ge19E7uGdfSa27wvMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.0 implementation.

LPASS codec v4.0 extends the VA macro with four adaptive filter (ADPT)
blocks at 0x0800..0x09a4 and for shikra FS counter to be bypassed
before it is enabled.

Add the new registers as a separate reg_default array, used by a v4.0
specific regmap config.

The register layout has to be chosen before the regmap exists, i.e.
before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
probe then cross checks it against the version reported by the hardware.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 276 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 270 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index af8308eacb0b..240100638744 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -25,6 +25,7 @@
 #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
 #define CDC_VA_FS_COUNTER_CLR			BIT(1)
+#define CDC_VA_FS_CNT_BYPASS			BIT(7)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
 #define CDC_VA_SWR_RESET_MASK		BIT(1)
 #define CDC_VA_SWR_RESET_ENABLE		BIT(1)
@@ -155,7 +156,54 @@
 #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
 #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
 
+/* LPASS codec v4.0 adaptive filter (ADPT) blocks */
+#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
+#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(6, 0)
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
+#define VA_4_0_MAX_OFFSET			0x09a4
 
 #define VA_MACRO_NUM_DECIMATORS 4
 #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
@@ -209,7 +257,8 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
-
+	bool fs_cnt_bypass;
+	bool has_adpt;
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
@@ -235,7 +284,10 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	bool fs_cnt_bypass;
+	bool has_adpt;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
 static const struct va_macro_data sm8250_va_data = {
@@ -396,6 +448,127 @@ static const struct reg_default va_defaults[] = {
 	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
 };
 
+static const struct reg_default va_4_0_defaults[] = {
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
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG1, 0x00},
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
@@ -469,6 +642,46 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
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
 
@@ -502,6 +715,28 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct regmap_config va_4_0_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = va_4_0_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_4_0_defaults),
+	.max_register = VA_4_0_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static const struct va_macro_data shikra_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+	.fs_cnt_bypass = true,
+	.has_adpt = true,
+	.regmap_config = &va_4_0_regmap_config,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -514,6 +749,11 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (va->fs_cnt_bypass)
+			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					CDC_VA_FS_CNT_BYPASS);
+
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -542,7 +782,13 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
+		/*
+		 * Sync the decimator input muxes again to restore registers
+		 * skipped by no_sync_defaults when they hold reset values.
+		 */
+		regcache_sync_region(regmap, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
+				     CDC_VA_INP_MUX_ADC_MUX3_CFG1);
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -788,6 +1034,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -802,6 +1049,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -811,6 +1059,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
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
@@ -1565,6 +1817,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		default:
 			break;
 		}
+	} else if (maj == 4) {
+		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
+		default:
+			break;
+		}
 	}
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
@@ -1595,6 +1855,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
+	data = of_device_get_match_data(dev);
 
 	va->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(va->macro))
@@ -1631,17 +1892,19 @@ static int va_macro_probe(struct platform_device *pdev)
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
+	va->fs_cnt_bypass = data->fs_cnt_bypass;
+	va->has_adpt = data->has_adpt;
 
 	/* mclk rate */
 	ret = clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
@@ -1793,6 +2056,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);

-- 
2.34.1

