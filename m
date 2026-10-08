Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77F455181
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457637; cv=none; b=IqKO/Zhgtd6MgmQtwAstYyfrV0Ms3EaGtr7a6bfVy5tpvg3+m23tE5TIqCMvgjGcQKj3074xzMZBftzZxBIlZtwQg9Wcht6BoqvtparHqQt7ok8Kl872gE2Yac/zF85QHGXjaR1vBX20rXflTNY28ondgy6yk/xdEhZl65INU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457637; c=relaxed/simple;
	bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmxQjAfK3WjlsYX8CC3K9AWvRN/lGflzxkJRtpYUmrMBWjCCyR23mnsYWvNhUHnChYy1G8Qdfp1JMOMSpl9v9+T2JGcX8qeUYIBXzCjNBzTcYNUMXXj25LR0KjUn+ylg80ccStHiASnkMxQtK6OFrOWmHcA23uv4uwjPTtrzRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGkCghhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsqOsK+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGkCghhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsqOsK+I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbnxK2509633
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=; b=ZGkCghhmuHBMmUdn
	8mQQo9JAJn/0AF9mWVPIwnilEPGMHPkV3SdpEtTDW4rPfZEg31GS5uwhPcMivbX4
	mpqXmWn6BKh5dv6xa2A92CAQ6J4XFmZXm+/EBfNIwA0lvOUUqTlRCc97VEc10lGW
	iRxTg74trzUcy6+L5A+hwP/r84dqTPM7M1v/MmsYWZRpn1Khy8DoWcgfRlD5FgEL
	rZ09OhvGTN2pkhyKuBSvDEh172OzXyLFbFHGaWUtSM2rUW/XcfwSybTz+h/R+hsb
	/Q5m6NEkemQOlBpFSUrznu02DcVG5xCQjAXgEmqZgzD289jmDso7qYFkKJJZ5CsM
	hzbLBw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jkah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:07:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-890a9a4e168so1893548b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457628; x=1792062428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=BsqOsK+I8WhCay3cpI3Abcq8NBBZibKcUEK7wtxbhhHty1RYy+fwIBGE5mNkg3pq2c
         r6zB3La8O4iws3K4tU/c8AlRPjP6TFWcaVYNkuPiieTrjYz6rZHsfyWZYKqqGvwTKs+g
         BWh0Ap6qYFq+aHoiMkdpabIjuC0JRC0rHuycFGMyqTV6TzmsX3Ta85XQMI5YSmxytrbh
         fsJw2FQ715XyZxf0dKB/sgOpXCoUunHK3ym0Hw9qzmnAUNS6+AGSG1u2xJj+wqe2P12j
         gwv6XcDldSj99NRw2By37sBGFe+gHF1JGufL77IcSdkbc3fTmLJwTcfjXrGgXzxSXAMh
         yNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457628; x=1792062428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=ZgQScvCL5So7zLsCOXguuQSuv/YTx7tjpBKY/1PsE0SXMAHBEYTefVXWK3H/4RLPPe
         sI0+hwk/mrGWWOmLp0lT/1Zqg7IaP4kcJYVfe0t04ffB19JMOcGa7uMJ6bnqs0zYQuab
         fJYGEQz2zk0XrA7+inUEpAom0nZHEMb5qDdh3rfWdrsXVdPjSqnPsQ2Emq09tbi9oXUa
         /nxBlzrIXorHxPs7Aa/XhEyjJhLzoeWIu6JoS5/6UF80zcQytOXp9bFM3CmqF1J7RiLU
         IP44cPXF6etzY8PQtbFL/JQ/HEuHlzEWJ7N/E+JYe1pE73R5ltJw0LQuafORxNv+0bAw
         uQ0A==
X-Forwarded-Encrypted: i=1; AKwUvBzVdrK0OcAnu9CaDpQrKcCAAMCFL7B6GN89HWFCFvow8+wfZ00ArQ0EtMe166VD30APMZKaNwEgu/8VFw==@vger.kernel.org
X-Gm-Message-State: AFuF++m9rC5nVbXQit4juADboNd3hTdDXiGZl3HBN/bJkta8s4fEsx6g
	9nJLCx/sLJTvvssjy91bUPWfiZHxM8jvYvkUZhmls0bQsvGaqgbO6zc9NUTiL4Ojsia13Q3rrUA
	V3GqEnURevsWlbZLlMODpUHYBzIiEaul9VznBRl0JzKS5KifSvbFpUiJcVdZFeTR3nw==
X-Gm-Gg: AYBFou079i+Z0Fldw+j9ILlgJwC/DbgY7wyhY4IQyhxy8O87W8n7Q1LYIwfTdh4GHc8
	BJ/udHLREz7IGUQaj4fIMJj3wpMt1o7wBdGL4eTGS06SjcT1COZk4sB4gY9/Aoe2BWuV0c6VjID
	gYXGl9Wv+Y9vJyfvMCyKKvhRx7tQG/C6L1O5DgCC3Nw2mDJ2i5GX5gP6ZaEcURNyICKS0HGz5KL
	iYxWd+8FWa+XKO4lhQQKW8dFEOhfrpBg/1MpgDYuQmkL47FVQHbIogso2j/VsH0j1MdGL8HIfYI
	CZHPd/M6SfwcWfq1+oxd8UjJB37OuU68JkOUmpIh8O+SwrcnKzse9VMWCPopvqrU8JHKQnSQHP5
	cs/+JEgUWOY1Ed/jhp9d3EwEuDMVJE2TH1iYY
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532929b3a.38.1791457628315;
        Thu, 08 Oct 2026 04:07:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532888b3a.38.1791457627847;
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:41 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-1-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=1193;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
 b=HHluHddjG71Xk1Tme0+QZga3U984Edo9m5MNNgaiBlVVxTl9AB2DyhXPWEeyW9xIDsKKwhXwl
 NlE1RwsWR3MDyFXSt6+386vvEjMbalKf03FGkMxC9CO7NoudGGraPIZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac7795d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX3t3kmxrvIzbw
 qg2S5YCzQOZE+MquESOwL5msEprRgsZZZUY+hWyiu+iGVUhdaRFrGqFk3x4A4wfRNhMUeyqRFoh
 Pm8edtNkq777Y4oeyrutIF46JiyqgwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX6p2F8d/I7L9b
 ck0HzQXlf8f65k/WaBNpJ+wie7uYvNBpW5GJoJq1oxsYeEwkdxdPVjdmHpkYS/pOGPmtIUSp9Gj
 ENylxyzbgv/kZgoEW4wkzq3OG0cX6toH+sOLI4pbw+q5oiL1fB+zTk5XUKCgT/wSOOXR6MuPtYR
 P0VZHYJatxpjuQt/nVMr1hittm6B0TeQz2EZIKsOQR9shSvIqqn0nEH95B58tIM2uJIznZP378d
 CKh9f1VCH0NGnR0hbC8ZuqETpvDE8eIREyKcahpKsZT7Uhn2/RN6PVydltcVJGkuEyoQbY4zCPO
 h1oN2P4Aj8+cBeTEbM/uEopdLrMbm5EnGd/lU14ZbevdGntwoEOJda7zeJvuAWpDzdKOyqPQ/4g
 xfwCF14HxqWY5IZo97q9E0kuVehhK46QrF8aWi1P5r22QW5vRRR1viu2x1vTVC2ASfp7iok0IQV
 +fR79R3M4ylqTcZBX0Q==
X-Proofpoint-ORIG-GUID: b7F9g8b6cCWMKvSQqH6YiXiSJQe3kTml
X-Proofpoint-GUID: b7F9g8b6cCWMKvSQqH6YiXiSJQe3kTml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a..1b3803518 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

