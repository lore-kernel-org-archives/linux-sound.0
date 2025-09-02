Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922C2D239A
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821661; cv=none; b=ojUV1GVWoGYJ7EWitUfQyVgRDsBnkQUf6FRmFAbiISQRgzXrw7KkZiNArSN1lYDIuXQaeP9GTsTht/mtPbzt5WIYUuDTILoSPG7Yxnqb1jO3ddtaDhRGeWw8/7TVGX9Z6W3frfb6yUaQVJbcoz51KetKNy4nzdOPjYthDLSqcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821661; c=relaxed/simple;
	bh=Erpj/ouDd89cAEWDr0McVn7qsX1VY6xCR02OGCP1IRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuZLlAvbtPc219knu1KwMUq3vDp0LkYWhDDb+ksj7yryZnrRCMOK0IS9KpKFjJkDU7GwsccHc6ud1okIjIcZocr3CQEIokQctYyzijqmi+/sOIOCcwL7VY36CGi9o4wtnEGt3UrjrS4XoMXv+npF3VPzh2ltxRM3MZPvpkGb8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCMtip+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCMtip+k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AoRmj015031
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WzGhnqCbKpL
	vbZMIa75k5x8iAR9+F9/qdnVgwvY1TNM=; b=mCMtip+kQ1QOc9QDMwKOg/Mtb+0
	R2Hy7zIJe7WivVsJZjpXagIpRupYao2OxC8Lf3VHq8bPw0GtJ3J7iIxvBCuYOu4E
	Km/SHhDf5Osuk2v+5diQJ75Ms1jNBPV+zIfjp5Y7bGwqlv6Dfl2pSPvuEMVyzCqj
	EPPk/+GIvSFmdGaQIUdCwnxRqZIGqadEREg8LWVly3SfS0BPjXBS7c5nYZ6QQnRC
	FYYr+dyaMTsiXvvhdgfacuh+WSq+RPQ8no64QbHSkku4tswbmc4SBwHnkoqLvfm8
	mIXa5BHlLNnixgkI7FDkGCH2aQGPjziGUwZe+nUD4MLvcehaHoQy3P1W1kA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw001fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:00:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-50f890ddef8so482096137.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821658; x=1757426458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzGhnqCbKpLvbZMIa75k5x8iAR9+F9/qdnVgwvY1TNM=;
        b=hQP6IEN6nLtrfT90NaVvlA+WnFzEz8JjUi9ibKX3P6TI7717JuDB//vLeqSwK7EFC1
         mmy/IcNA8LWpJh7hq2H2dRoj5tJ8EvhiL+0cnZHQeR9d4nt7OsW+hvSrULcwQeiFYCeQ
         BXBVRSsj4bRR2sBVQJasTTEZQbb5UCAgopeT1HMIqXKVP1SRQJo/dwLs0FGMKoe8XFor
         /IIPyDxj5qvxqdOyybr/E4PLJ9RErkbtn3YLTbGt7VddgwJLLbXlyvUXkTIXuU3075YH
         1c1k9TKwnzGNWuxxNaDRFdka2gIckV6graqRNDJYEfTI6rM2z0YXrCHReJffCdA62mmp
         fqPg==
X-Forwarded-Encrypted: i=1; AJvYcCUsuGEMN3BpcSSiKE7y6oQ9ahn0632R2wPyXciS8zUHVoAXcfZ984aIrOf77idRKrhZQjfyCind1N5j0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzJvOngC9laUhbQoMDPoZsON7ULkzOI/65KX2u7IKL1zGlrVf
	ZF/sdJa9DqOpffYS33ugJ/WKpTAOYd1qGD0fgUydCg481Pigs8s08GCh3+sdrmrPKRKMXCGBsIJ
	VPZJFbNP6vMEE5aXLcsqqfjrWz212vx1j0htFI3isb1Oo8LoqHtBm06hgQjISjd4BLQ==
X-Gm-Gg: ASbGncu7EP2WTv8thdWi7Txes2dJ3177ZqXAGE6q9TEYH6sD9INfqY8vX1nfVYDtYV9
	HmaE3rvXems+IyOqJ0jhj57sYFQ/27s8Alg5S8EJqg6pY4mmHoRPuAqL+cnkWjSPzyUdz4dImdQ
	9cw/BVmfF/i+RqfGoQDD1Cp2TKPMPT16vwgnmGx4oIpGJF5SIUg8v0SzHqazxaYfTuE7zCmATCH
	q1t/eCCpCIqzjxauKZwM7jkWzDA2JyAPhSCTAVFI1tGdeMu/rkyAyuKGOBbiUwoowEK4N8yK5A1
	70x41QWRvxACjTbPOYcaV38i9RxpgyoWs0b/lvuVGbsUfWiA/TQ7vQ==
X-Received: by 2002:a05:6102:8017:b0:522:194f:fcd7 with SMTP id ada2fe7eead31-52b1a06be68mr3884651137.15.1756821657161;
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/U4dPnlcOQB4TWwCsU2ajC9mEnPbFZd6rjcAkR2eVla8SO3be+Dd93cVapqglSYKgRBmE0w==
X-Received: by 2002:a05:6102:8017:b0:522:194f:fcd7 with SMTP id ada2fe7eead31-52b1a06be68mr3884529137.15.1756821656042;
        Tue, 02 Sep 2025 07:00:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/6] ASoC: qcom: x1e80100: set card driver name from match data
Date: Tue,  2 Sep 2025 15:00:39 +0100
Message-ID: <20250902140044.54508-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UbiGZDkH0VjPE8LN0RhAbN04ONlEFFrN
X-Proofpoint-ORIG-GUID: UbiGZDkH0VjPE8LN0RhAbN04ONlEFFrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX1y7csyh2KYi1
 lqd16SUNoCu4ng8mJilv0/xjbiNggKf+3NfdQTwBG2Yc3W/FU3L0PhzvHzkb4X7iI1yVgoXnUHK
 QwGtySZGpldaTWqUNrOM8UJ3jY7zDXHjbUP35I7NEsfgpPl3tLWQsxFJ4w6xDrAb6gFsJDDbOeP
 9gxgHkpyhUZnZukaIv2QFiebSB9PBx8K1Vn4WmDR5IMUJueyospa3RAEXx4nvQDQyZ4v9fqJviB
 Iir3jM607BqmUka3ItPf+P00/ZumIU8RjQd2uMvkmUpeWHlYn1XmHdyTA8RXjf2ouvoJ73x5Upl
 28qLZzN2ilg9YwTtbDg6im7P8adGF6nA0jhANvkDI6bNzjs9sFCVhs8JnSZp4d28QEN5L95B4NL
 OgWi9Hgm
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6f89a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8PtRD21WSkYcRLTV-pYA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 8eb57fc12f0d..322010d54af6 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -210,14 +210,14 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = "x1e80100";
+	card->driver_name = of_device_get_match_data(dev);
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_x1e80100_dt_match[] = {
-	{ .compatible = "qcom,x1e80100-sndcard", },
+	{ .compatible = "qcom,x1e80100-sndcard", .data = "x1e80100" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
-- 
2.50.0

