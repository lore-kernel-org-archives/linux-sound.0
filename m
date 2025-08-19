Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31123BD17
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597728; cv=none; b=Qwy+FXxX1+ZXF+LWAAVIFwHQnnZf+mKY2vM6Ve7peZzH3zYHH1HGrAr3zKa+0m2NBxGjWDBux95pbC39L/gQUhKdi0luH8htcklkdTHTNm6DvRrUYKPj9LHUEQ2u58oCdacBPC0TSWXrKw72QlxqsXufY9ZpMNaC8y/xEb7yQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597728; c=relaxed/simple;
	bh=mQUBUhTJIkEVd17LK62zreRv2cywfgL18mzSnA6eK8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYpVFOGN9zFSo7+NgT96/vp8ldeqrvCLP88HQMpiUR/hs4bp/hdozhErL2NvOupu/Fgp4jui1fX8ywm7TvTW2VG4oOWfP7CaLL7znUtIIlcOGKOkdTH8LwHHLt10Lf1eK6eGM6FKU0N46N8L7jzjpKh8vZDWF9XE6JnAhOy9plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2fpEWDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2fpEWDz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ne5018342
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyLYEil3TgY
	GIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=; b=H2fpEWDzCMGPpdzHOA+QGz7T/Cl
	gujKUvvQjXE43GZnfZwqcEByV0fU0MQwmmrcBDjFKInUlI4DwFRCDKHFV5qEL8LR
	yDjzVlQXpC6YtIoahF9Y57Iy+WVGO2GAljNKF0yZ6QNM++X1MkrcymcYlsgvUio2
	BTvrb75ZIsX+Sexdu66Ak8tC3GZ1oa9rcWSnuVEr4ZFJgJWG5ox2qY1zbnmy4vdA
	sLPmFvQv1KSc7VfOfmey+qInSswYWE7e5/6qi5uZqd36rZhiEbKFrOCE3o731XdR
	+VX7nWQD6rsQqK67JEpedjuPFpux8ms6IhSPR+AJMw74iKHjzmMsaROsB7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah01fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so118386596d6.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597725; x=1756202525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyLYEil3TgYGIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=;
        b=Ox5oWbcm7sJlqnE76V9i71O6xR+POGoFNjeOJhuM6LJmd6cvB3Z7a/PBXUwrvtbxnR
         ZHegguRwukpq2j9nJLLmtqWcCBGC3BWGhLRw1NXfA9QhKxH5YwtDcjc4CjAxYGvdWoo0
         g2GR1BXcaRbVdqi8LbFMD0veYsp7lBE+dUXBCjaDTY+P9CQIslj8GH3esdbmc+LwD6K4
         6w0sUjv/Oh5m5mbzZu34c4HQFzLz9ob2AT5hESbrShRawmc/iCdjdyeiIonC9xk7tmLj
         isD/ywDJ21pphx9Lu6vmVMEVqViimXhzY01sn278865Cow+I98NZtoZA8ebVfc/LfW21
         VYqw==
X-Forwarded-Encrypted: i=1; AJvYcCU+cU65EPcGdoZEUDpn1xA2h/+n7QgXUO5tqYbp+Ukxz9j8zC2vnc80IyNanwVvQ0NskB8o4q/TnmL+rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvgwDB8ZAeH0gGYp+12PDSlkqguebEFLrjmElyfOTVxH+Q7G0
	LQy56W0HiLyWp7cegucv6ioCUO7yA3V3WHJZmutHHBNz8BTLXRGPUpbmlk+bN2L6MkLR4O9NTev
	BcvBk5G82iz4J13J4bPQ9JKyWeywq4tyQW2jzjGxh72m0daSMEARwSKhYTFqnDegWllxw211rWg
	==
X-Gm-Gg: ASbGncv7j3aen7oeLS1BD2DANCAP0oB5KBjcrXra4azNPwAh3yjm8Wnq7sszDZY6Z7s
	hqdcYzLSuDfdrKJw1pQhUnF1CYedTkMZsYowxBcBPoCJQAGNHiySQGYSyhTHmzvquEtvstEECKq
	PF9D+wo0Zzm78SLXGBNl7fgoooFAyrOVFCmAa0HhBL+2G+HUy+D1xnsETcQBO02uTFfJyeeIUMw
	Xe0vt1o6alNWnmnMtNi+11YoXNxyg+e5+SCrXzb7JTtBoHHuI0j1q2PF5LCLQTQ48HPm4XocsFc
	zB5nvuXnuMsB9n71RB6GT69X0UXmuYeJVKf6l7abGvCl1cKYp7NYoQ==
X-Received: by 2002:a05:6214:2a4b:b0:709:e4bd:e3c7 with SMTP id 6a1803df08f44-70c35c7f293mr20655076d6.50.1755597725017;
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlef5fvYHbEQw5uwMBXPbV5Fx40atId1n2DDJ0PYdtFl7HGNhvHUTYV91uOxgGjKr9W2eTfg==
X-Received: by 2002:a05:6214:2a4b:b0:709:e4bd:e3c7 with SMTP id 6a1803df08f44-70c35c7f293mr20654606d6.50.1755597724513;
        Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Tue, 19 Aug 2025 11:01:49 +0100
Message-ID: <20250819100151.1294047-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a44b9e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PERrCGAOZG5BPduG6IAFIWRK74RRCCld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX9yD1caNC1oMl
 cRt6Eo4FZxzXzoAKtEdw+VqGF1C/ssLM9Z8OU/vcEua6d2blnC/xCWEZQKlD9x0dR6iZfIaoSMN
 Mw0YZ9k/AThBscQCg+5kG63Z6EV3sQF0Du8n+79t9qL9wb8er6P+StoKt13+k4et/l8sVKuAEh5
 ylWAkU6DETAQBuMw7u+TFAZjgMv+xRwCz/gMtk8GlE0xPzV+/utyinu8dWdkdzyP1ITgi6IiCF8
 b+ED6TOeHfOVurLZvyD6SG5yoq+kaYjf3xClgWutNclWH8lWFfHjXXfyihDUSTT3lV6LQEiWQEx
 WSGxKWWnWTiyNtBDDmfh3W+Ho/SyFl/RqiWxLTkbXOYJWpLnzt4cqmLZjhXIPFlNadyAM8g2nRu
 xLIXicu8
X-Proofpoint-GUID: PERrCGAOZG5BPduG6IAFIWRK74RRCCld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0

