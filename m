Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C063934CFCE
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778377; cv=none; b=OCPBzXXRdweLwIWCmmZlhoBgxQvLPI0QvXU/CDKb4B4aJFNGXfIVk3P4HAXp9NbcWSsOygTga28BW1p6mzpBcO3mambLqpPyw9grQgVoKQ5NuQ2YVcJhTlyWrQMZ1PuxncnG10L52yYaMfp8q1VHMSodJWMGP8LBwkRALYnRm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778377; c=relaxed/simple;
	bh=CFs9nogDiUYq094w6i3gT/g8YZVXrFSS/b0YNrG1Nmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WR9giqvhEympzkMxwaSiMW8HVEmHdtjkBot6AeV2PYP6GAiTiiF1kAlVEw1UvumoCl2oyfqaIAZA3HeenEZp/gSncwh88jelnDu3eNgScIvAFgofu+cb6MrvwhOeFYUvL+TtFuXy6poan7hccxVKwDaNoKIKHdo0PO3W1BQBDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iS1g7fyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVC9BNUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iS1g7fyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVC9BNUY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3E5Dw11902052
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 16:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G6KIoivXxRAWlPLqTtmH+u
	XtfCfWVRW7CtlL+onLNYg=; b=iS1g7fyHii5pqW7ObK2U5RuFhCoPueI5ITEajr
	2Q6Sg3OMzuu1i/88dZtlq76EKVN7QIDawZax8vYDieidLKkpkN7W5/iYvjtBZOOu
	GNPWUYW+SvEisOcXpb6z1WALBAMM7bI+osxeBsi5/pm8xJgfAiFsXb4GlI5oB3oL
	p9ulOKgg5npggpxBENyhuLYZmGbuDdoaVZG3ROliS14A/xaSg5x0kNEUD3aOdNCi
	nNw8uf7hDLsfY3ynxcFbRw4GLlcTmyzGTMuvVFA7/jL0ylWIFHQ69Uwwfr6TK+qB
	dfB0AmDzIbT69v3ARpkJYPGurMS0Lm6jtX4kAdEvjiBctJrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atgx3hk2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 16:12:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2dbf4d6a4so1587823485a.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764778368; x=1765383168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6KIoivXxRAWlPLqTtmH+uXtfCfWVRW7CtlL+onLNYg=;
        b=gVC9BNUYooOormPb7Hq/ywVi8Brol43DokVDwvgJrQnn6G7dj/eAmadJKcs5EWH3cs
         d9GacWarQNNrolz48/966gvU2lfnYjbbd7gXTUNuPJA2BzHWB8bwjULq3oEa7zA5TX0q
         m5vAKjh6iXdVv3nnBR9ugqoOm7/PRS99pxq5knmH212C9UQu/kdMF86xc30xmBe1a3R0
         ZU7sz0HcWQRxEPhvSW1BkMQpFk1xbHb3HAYEfjZUDQ3ZF+UBkt3qBOiqgCjyJVj2G9d3
         uTxca2GUqQvJslhT5vg53kD2HW89936WE7zGPuDaQktY2q6kHOCd+hh+MpNEtac1jnxo
         VZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778368; x=1765383168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6KIoivXxRAWlPLqTtmH+uXtfCfWVRW7CtlL+onLNYg=;
        b=uyBiqH6edMhs6v50kHRAqeVMKugGwk+O+P78HuUi1iQGL3tY9XM4aObfOMbw2cxVj0
         dpR/QZpR7PGBKHV38T44u/vxCxSqNmI/BabA4CcHTrWJ/hJgbaY73D4x0OWming6zQS6
         HHvwE98blaQSatSmMKP2tXmJv1F1z1cjsFZZTQABHvcSpNjfRPBonJ7iQXp81n86FTJg
         EeYkj1H29Ks135r/ZoY9me3PEpbdZ3I42XN1ByY3/Q9eMmLqHzQHXng86vIMRzo8Gy7F
         uAVyH0SktE1ARPOwnzGa9Erpu9bslMDOCeIk07w/o5JfypkN0aqihxn6mH8GQD+zBBLY
         qSJg==
X-Gm-Message-State: AOJu0Yx0f4ND08QdnAteGjfM0E4XoDaNWnd3R62djSb6QUU72w8Gp/M4
	S5oUdcGCwwdTDS7WaN5jPl7gNPi9075+xmFL6mu1h8fn9tS7iPdbMAdgEr5bkZA+irCl4QAbAin
	6JjSR1sYMcgku2QN93tJJ1CpeCQBldcI94lRm7zA04yrWjC1n/UMhThmMwr6eY+9jQw==
X-Gm-Gg: ASbGncs5RxPGUCXEBp0hfOqIKuIV51SF4SOP6KgPvMv6wTIGYjtAMVPpt0rQ87OhnZ3
	Lkvw1LFccHzsAQxqxSBOXEbubxdRJLxQj5K7pUyozdHPXEO5ZAY/Amlpd4SYAYPp5x1365k92FX
	n9J+DLplWKLcHLgdoKP4W4J7VcKNMo5/q5tQZgcGkevZCGzMDvy39GfqoAZ1QRNy9kAuZ8lF32N
	1tk1qiEXe2EopIqE01ZFv5p2ESJFhgXKGT4QFdgy2HUwot0J6w4Jd/w3GNBZLY7HkJxlvX/oxyB
	NtZKUuIPvJPIykSKZBunr+qH04lhUw1fw7sMdfcn4/rF4XCtNtDFUwSWT0zGI60CHXuAL/3AE0z
	wwOEO3t8v5+gqwz04WTze/HreZ9TtFfyH/Q==
X-Received: by 2002:a05:620a:44d5:b0:8b2:5af3:7fe7 with SMTP id af79cd13be357-8b5e64c8332mr394956985a.44.1764778368331;
        Wed, 03 Dec 2025 08:12:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbNV/GysHiheG2HfaSI1EKANatBfPEkXatRLgL9tZ8Sz6zOVwDBzMU46MS1fBHbd4UrTl/vQ==
X-Received: by 2002:a05:620a:44d5:b0:8b2:5af3:7fe7 with SMTP id af79cd13be357-8b5e64c8332mr394951085a.44.1764778367847;
        Wed, 03 Dec 2025 08:12:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b021cd2sm23688295e9.1.2025.12.03.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:12:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: amd/sdw: Fix confusing cleanup.h
Date: Wed, 03 Dec 2025 17:12:37 +0100
Message-Id: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVhMGkC/x3NSwqFMAxA0a1Ixi9QKyq6FXmD0kQNSCqtPxD3b
 nF4JvfekDgKJ+iLGyIfkiRoRvkrwM9OJ0ahbLDG1qU1FboUPJ4x6IR+Yaf7ijP6oJvozoQNV2R
 bMl1LI+TIGnmU6xsM/+d5AWMYbExwAAAA
X-Change-ID: 20251203-asoc-wrong-cleanup-h-continued-6e3d27d097df
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CFs9nogDiUYq094w6i3gT/g8YZVXrFSS/b0YNrG1Nmg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMGF6ZQsxk4oUmNGDRtvJLVQWjheSSyA2HhvxK
 Z+5IDwqbhmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBhegAKCRDBN2bmhouD
 16T8D/0RwFihULBjEbwMY/icg73h9JHDdYZIKVLp14TZBIiuyWg8WEE5bh26lI0zjrFyARgGj0d
 ory8xAOCJyn79wLVWWtNvcnC+z49gZBOGten4tT0cD2Ghl5YxjpYW2Pg/0eG6/x0yl251JhD42/
 zqtKVFpuLmZbMl2gPrRtL/g5G9kZ2G9Er6EtkoxSwn6pAC29RkOOdrvT5wIvJTVY6bzFAyzGzBH
 y20E0LtFPyEnTeZKmHmf8effochEMTobJlakwNmaxj/Exl5CMrhq1d+TtMMzU/+OBudtHiT2qax
 lQyXCiQyZrYsdhCMjJnGipfypMSP0Mnct3i4a+R7OpRQuDENYxBuEZqJQLWU6oUByem0o+I1OB3
 59TznkaEUhvpmnQvsjSXryKOT/s8wRmqFoFGU/LO8OEaljtLEyPTKUEV2L9Zqpw7uf47WnB1qL4
 wSRVGVx+lyXiIHG8udMh8N6RZ09jSvIRZYgLJnHO0xyr30pmmQu55ERIekfVrOSeNexU2SiLoMN
 zYCAbhCvK/FZt/eb0wcOmZRrupjJZnCsxpE94ie2W8pm32koC3Wm49q3adp+3quE5hChV1r61A5
 EySNn60U/pFrK0gAkkrcjFBlZDJu2yBFSUeyjamS+LrxONA6SDHmXuDC7Bfs7gOUA7kMkRZBsWL
 bZuliEGY/cj+W9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyOCBTYWx0ZWRfX2sm9BQpQrCHq
 36sXajujDsejs4uCjCUcMF9HDAdmZeM5yZ2swJ+krfkq+kkJUZ7LDiA/8cofpN/AqYRVAoPOH4j
 38+Xx4+0q7fXprzH47xNsDP9qFLV0+k8EKK/vAVhSf+zmI//EYNdq5U/nd69JDvFmYmG+5xxNYu
 jlhJ5ECy8V2mjIKMS1fimfKGZwi/4Th0Qc5HwJewEQuTra/EXvWMe4dftc0GGojfuhWAvTqcx3M
 wc6FKt6HJiPJLhssL5/8xM/RiuiA32Hrc4WrlKFj8Wwnat053ximHQG2JlPsnlJsCwhCQ9lOuJp
 T81YguZKxLdqUZ4vpaa0mQzo5mu8t7nsDlzujrAcn8BgkAf7T9iGHA0jzDaTxmMkaPvwIrbf9c5
 ccDdf4wZG8GBPNGHpBD6XNIsVCY3bw==
X-Proofpoint-GUID: 5FYfWgqPhwRd61bYKsVQR2HhOcQYl9K1
X-Proofpoint-ORIG-GUID: 5FYfWgqPhwRd61bYKsVQR2HhOcQYl9K1
X-Authority-Analysis: v=2.4 cv=R/QO2NRX c=1 sm=1 tr=0 ts=69306180 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VkhAbB7tAEgPHYBqybsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030128

cleanup.h coding style asks to avoid having constructors with redundant
values (= NULL). On purpose, because it is just not making the code
simpler. The constructor should be meaningful not just NULL.

If you do not agree in declaration-in-place-of-use (fair!), then do not
use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
before.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      ASoC: amd: acp-sdw-legacy: Fix confusing cleanup.h syntax
      ASoC: amd: acp-sdw-sof: Fix confusing cleanup.h syntax
      ASoC: SDCA: functions: Fix confusing cleanup.h syntax

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  8 ++++----
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  8 ++++----
 sound/soc/sdca/sdca_functions.c         | 28 ++++++++++++++--------------
 3 files changed, 22 insertions(+), 22 deletions(-)
---
base-commit: 32ed136b4e871f08398f342aa92feffed020839b
change-id: 20251203-asoc-wrong-cleanup-h-continued-6e3d27d097df

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

