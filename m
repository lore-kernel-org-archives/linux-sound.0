Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069103921EC
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931554; cv=none; b=W0Tf/bASsTWGPZ7ymHuj0ZBiSNkmhxiPJCPHopBS0TdAK7df1gMlc8jzQIWj9cAF089I86uVPkmRQpq1nsMPhf9w51jA+QCwKUhIhw8q7YnDhvfZXCteszlq6I7YBAhWghJG9uDUFRcC342T8EyfDvkqENwyJYOUZgdpy4GPZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931554; c=relaxed/simple;
	bh=azyjWX9qq1aZN+xF8XDJCutJ/ZDvQfovLJoN85Gn2Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEzLF/ZAn8VtR3N35uJDSjRVZ8chmi2VA3T5V3DlrWNYe+7WB4JfGHB+15AzkB4rb43D8IxvmuTPJwwf/c9dT7V91hQoLSrolZi8JEVGDx5Kl/AlnnhWdSgdM/A7T9sB+5hV1wbk8BBuuU5wAxPcE1NNL+ICxtL53AMCRXI5EuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iriWx+zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmBZPvoL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iriWx+zs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmBZPvoL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmotT1692161
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 18:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=; b=iriWx+zsmazoscfq
	txSE+x7HhfB6MCKvm4Z9Q8OoJIz5EQEotW9Mkp/zHp1oSyh9qrx7q0uy0cjvbPnB
	VCzhOI+PTjEqT+qJgvnzIjhJcwC+WHvRU+DfZsMtEJkDKIVp7jTXP1x5gFssan17
	KsuYjb1Yssev6LysTKKltQVwYCGehbsJHo8tfvso3dZMBDTWsihnxIT9YhbBgPSG
	RDy13F6jed9QDJZ6vd0SX/3DWDdtWQ0ZTQttRlVbYLgJv6L5ExdLgxh/Utnj8wrP
	BQrxxVsPx3W6AxTJDKs0x6q9vR2D4BwdPfMbnEq21ndRrJvUE7PbJRS8xOUKJoCV
	Nh0lbQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tk50d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 18:45:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so1209013a91.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931551; x=1783536351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=gmBZPvoLtpVf/QiTLK/dPPq8kW9vKHoc8rS29uEGsdRxEWi9DQ3c3Nx92mncMx818n
         gdA0xo6W/WlpYjalhKsszCLv4dzxRX74gphXsOEF1wZJArB3B6kGD80LjkytHh04Xg42
         AYSHkcHkKkw6G0k4cXJo4o//LL2Gc28pZ4COkiyyEx5zgp/b8/OdB95hU6lNE9veAWdJ
         drAVqabVO0DZPHJB26pxkeHY65qwAa0W+v5ih5K0mN5U/CIker8h/NVVipHu4uNbNIwX
         8GvcBbOPzgmkoNzegk+oIOqzK+unTEsZsAoxhkk0w0BipgbYedphUdaILpCQNLqqf/jj
         NYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931551; x=1783536351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=RzXQg74r97Qd/jLYLcjOrQghE9fOX8Q8dhuJYVK8HmWeQg9nKmNdh8FLWzx5SC1i72
         ChUeSFo5EojtRBoVV5DqlHgiwT2mvxnwxm0AUwrxpM/ai0VnOIYJlHaWllM+bOAlr/KG
         OxfxFk/d4pFcmje67gu3Q9Hdkf5Dze61ijd6flzoQwagpa9Brb7tVBduBEnwO4o55psI
         /NvuocDy0OyLwMp16O760MomlGOvMPVVfdHsZOkukVGH9IatFgUYQAgnjKoy7zUKpP/W
         QBZ3Ivyg5J4+zOp8qR9FWwgcCkmKPOymy18ITIIyijAlHEfJbteg7w9nc7+liYfsH0fi
         OQNQ==
X-Gm-Message-State: AOJu0YwQcr0DR62uhgT42aCCCDWMNsdopVK6fMMpUliMebnkcIQj7C4P
	rsomqlIlS1gfyJifpFKhU0TAn3Hsk8QW6nhe3NK6VvjFIstjOmyxE59t4fvRWz+F3HnUKQ1kKsH
	uOH4IZuoDsXIKeVHMyLUfWT6Tf+1X2oRT2QwazvB0QcLDXHNIdnBuF3xj5FLgB0j4pm0fFLn6Qw
	==
X-Gm-Gg: AfdE7ck4k6PDE7hg7gB4JKbVglIcY4ds+3eHEYa3EOAhBVnxJWSB/EemSqcTqDtftU6
	9Gnum1K4X3LnuwhhOr5KPi56MHouwC/3COSiZlw0IAp4UBU4Nj4NpnWaG2Eqw9Wtny9f8YqUxvO
	mMakIgztftaQlzAhUoFR4YtJD93rjMFhPkctlXy2JD7JfY0VmUFV0fu6eYG1wYJf9bQXwc84ESL
	yn6pRTPOIE9y+Lj3RCJ2WC5hX1mnkXdZXGCWxWRb7+XeABBS7jqU8hqCRYBORWiEz4WvrIAF+G1
	6F1dK5AGFvooGPMOGkK9ypxoKFIMe+86+eO70P58I4iTtGPn4t1xKGI6mA690fAP3cmybYjIEtF
	fzh/XxuCaTOTBDPdDmY52UISBCDoR/Qt6O3cI0ok=
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr2942990a91.13.1782931551096;
        Wed, 01 Jul 2026 11:45:51 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr2942952a91.13.1782931550605;
        Wed, 01 Jul 2026 11:45:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:14:59 +0530
Subject: [PATCH v8 3/3] ASoC: codecs: lpass-wsa-macro: Use
 devm_clk_hw_register() for MCLK output
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-3-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 0eRhxDAmDoqs9cWnpWn1-p0dGswUt9iN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXxnnc+9M7FYh7
 vK01nR1GJdap4frnw29uyfwU2HcChUWn1vdzRj6PVREyNteki0nO+NR7hDg52FYI9bRrLOnWc8c
 yh68eI9fKz6FS1aIbS9v2Kqp+8lE9Os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX4y8rGtrk0I7s
 jT5I82mumzYwbQJ0lhq2h9ioAYZct8QVk3rlHDuL9W083w1IGt8ldoXZQ+CsSdJj8Nk7pymyuVi
 a3hUeDMyf1ege2aUHwI9pPPiczr8k6v65T4mNqkyaqzupDxdex7UwZpkydYuYT+q0XtwSUGOGf/
 Lcz/Y6pq2LuedzxmonZ9KvPx3vVVkc+QwF96I039hdS3CwbJqfvUgAfAQq8qQP3mQyVZgXDNQRO
 d24bX5VdshJCxqEx20QSpLXddgVilUC7rvxnvwBI46Dr5XUNCDHXmmgnabKkBgWeGb4wwhnMb3w
 XxHPBThIt3BsRcr3WeLZ3TCA2EQo8y4eqlwvD7+bJ14eBB+WeQ0DVZ/u+L2TgLW2nl1XNCKNyTj
 fY+8qtjlrI0/6ADAGVMxdjsIOztX4c2hg6AZN/sx/5qBC7JPltPrkcYeAasOaV9rcLDRyfNPrnb
 fdQOGKVoPys+ZGUCFMQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a45605f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3zrE_5izju647JJH3MQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 0eRhxDAmDoqs9cWnpWn1-p0dGswUt9iN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 718564ee381e..f511816aa4a0 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 

-- 
2.34.1

