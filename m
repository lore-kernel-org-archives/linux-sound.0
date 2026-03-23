Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977F361667
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 23:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307883; cv=none; b=XHuhvRMZBu2JacRCI9zjXAjJXjhACA5RD69FYfWZ6Pcxj5hUkbitN76T96uUnlh7jGbM9nCA1QJp3K5lAaGiRU/ZZEo5nX3ngSL1GbjrQI5np/JY2stZsZvxoSsCKWmb7JFe2D2zMRJ5klJHmb5qL1XDoIXIErgAchSJaA86URo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307883; c=relaxed/simple;
	bh=AyY2hIjDZSFWCXLUqukGSX8OjxFTqekOyePOX3n/en0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqva7Us8eSXD2WFquaYGkxp0jZySm25UR2Xrh3e5nIGu+h1Z3Q9CN7RTIbcalaNSoUb/hSYpkG2VKVGgQj+dE23KKN77/KilLMkKwbertFORwdO00wIa71+8yaYLbG0J9jeN4rC0zRZ5ghAJvLHNYvE+yCzRsLQVrgaiiOI+3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbIcTg2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmjG4ucl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbIcTg2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmjG4ucl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqjgc3934869
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 23:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L5JF/OFCjycRKwxHlQnaKEqRuOkw7e8QXGy
	WvKIOmXw=; b=ZbIcTg2wC8gfT3Njs7Rx+upxE3sqFI3qCeE+W972ysdOTQOPwUV
	h4tlmpqopNjRcuPG58unf6gtv5IiOfIIPKNoVsKfSufzh/3Sl0d6Wdl1z3KncGn9
	kpuq2mtVVL+T7aGS2DgVmqMlGx6z2oKOIQsb0ak3HzCVqKBKZMRWiR1SXIEoGP0h
	fZkfLKtGlM2jC3DsLPh1orQvS/WaT8Vvlh6tFzbJktC71FVsX/L4kxzYlEEvk2b6
	qoFfJkc6PkPaGdtyA6AvMR/iFf7yyF7tec7DM0mihWgGNo3RxC5Q0VHw+LjTzu7D
	zfkq8k0CNWlSUCaeKdhuu0kJL9Lj8C2XIdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hpt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 23:18:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso241175361cf.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307880; x=1774912680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5JF/OFCjycRKwxHlQnaKEqRuOkw7e8QXGyWvKIOmXw=;
        b=SmjG4uclCXOruv0aweW3zkUNV4fOfmuLLcu8U2C8Mh4vNZ0WYYFLY0oTOR698BDYqA
         xHNyY1izdvF0nkNOXZ88/usu3xmh3i72qRQ8mppVP4mmUqDisLye1qHkgcU55xh+j+B4
         ERd9u+W5KnqnyvxfIznR8GNTtju8ueL813Z6hUZCEs23Obj/E5rZsgU6M08v01OohRwD
         7a+RDfCZecrGccnqJsYxXYm+1pWCmoLCOkZwu9MusFWiiIBTSkwnoI2zm6vKgq97go9T
         lTAoXNR8T3h/7BDXjihFvYIy5gr/a9ITvHvDcGetLxjdO9Uzy/z0S3QtF5j6CmzYDW9I
         x/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307880; x=1774912680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5JF/OFCjycRKwxHlQnaKEqRuOkw7e8QXGyWvKIOmXw=;
        b=Y1/54T1Dt8Sq8gkrxQ2U42YptikMeeBpwkwaji8+yDp+DLIokoFwLx/RyXUY4dByUP
         MweilSD3GcNiWTeFRHICiyfBmdPZ1G1w2cx19acACUKUlbTe0QT31V8MhRQyKK1RzlbC
         QcXAglfjyk3/Sf/T9a7fb0rLxeF/UBTBD10wbNOVJ3KlHqS9rmu+TI1U7SGL3/GxS+ri
         66qcw+uQhLGUSJ+6R1FExMIZMJ4f4fJnDLKFD6N2queIcwnV8s9ITmm/m7J5FPyfy3Yq
         0A4/OfHw9pNMxUqp0Yjy/EgJ3v6yVrCm5G/SI6NQTBEwZ9uaGMurUHonmHD6HC0PQmc/
         eCFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2pELKIUOtY7abNKUKZw/LFoDfngEepYvjqpRr+9uKpuivcGXzOVjThu/0/9s8jgzqCBkILyDqn91dOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaARWr22zIs3faSVPaxJwKqnx71RHPgMKxYqfvJL0g+Yf70Igf
	gg6S+ORUo+x/BdInxUcm7ngQeCdYJddI0DRu666Mya/bjrIWmmjbdofVIpqF11L8U/2tKx04UcH
	x+SRpCKiwT3mnoIzpwfYEeMvdC7WA3PjlKWAtuIrWJVWzh1f6sB2P3z/Ag0p1pnDpjw==
X-Gm-Gg: ATEYQzxARD29Y2yJZr1VLmXLkJgDENBSmVebm3mD7b/eCKptao45vRVRWSvV4ea9FK2
	kme4gbrxVeM9eFOMS21QvwyGxSHmndqgFr2ByG1BvMtNWD9pjwZTBNV2QcbPd6bJa+7AwiAAKA1
	PlafW14J3NpviDTWduQ2C8UEObnIP2ijqCNkHqzqMnQzPZ1eMvZhVLZcaN+IYY+mPV6delYMh3u
	tG2DjovIGfjwrvKQawbH/FmjDej3O1ajRwRkW3P0wiGE5BQvDgF7u6fYVoEgqrN4VVaoQ3IQews
	KggmNZNamaq+grf0yMohpvudIDMdL9flq1/Ad2W/7PlLH+GcnluukXKBMokii9f3sXhUxSIQnkC
	xaAM7d8o7g8Nj+ZK/SDk5UZ4kpuCgMRGQpAbYni3O6N2qH8+yVenJz6A=
X-Received: by 2002:ac8:5f84:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50b4b3c7e79mr148900521cf.10.1774307880117;
        Mon, 23 Mar 2026 16:18:00 -0700 (PDT)
X-Received: by 2002:ac8:5f84:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50b4b3c7e79mr148900221cf.10.1774307879648;
        Mon, 23 Mar 2026 16:17:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105d35fsm4131515e9.19.2026.03.23.16.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:17:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        david@ixit.cz,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
Subject: [PATCH] ASoC: codecs: wcd934x: fix typo in dt parsing
Date: Mon, 23 Mar 2026 23:17:48 +0000
Message-ID: <20260323231748.2217967-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1ca29 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=Gyz1a0GbE71Lk9qgVO0A:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MiBTYWx0ZWRfX4Q/qOAZm5obM
 B8aE+3PAMrjos/vvkJcpsZKoA6QBU8v8uuNsyEebxRJx+qt4jRfT7dIMiEEbtQCyPBgJyFJTk5k
 FS23baoQiOb0G1EH7sWmnsljdNpDo7k/kvv9DmWONlX/WdFEPuqnd9Rbif26xNoUZmKMTkpnBZ2
 auJKIFFPco4/vdsSqKCNsmWzGDcbPdJZMDhLpBubISl0wv3qRxXLhhUls2JFl0vi6aiP5K+Bs0a
 5Oj7jyrqjDMzzGpkfJsszM5PSKQcwXZk36lAgnaZyTjcZSHCxjZmYHugSt/gYHSlrLOwT9TfU5b
 B+KMhuJW8JcMmCrBQfSK4VCm/IERzNKf8lHHsY/SSRkKJchZ3xplQIgBoktUDjDaYmdzug5Hbes
 agG78xbstqUy242K/P7MuH9fF8kk9FXX1I50v4+0y2J/TkF7yZiV7Xpg4QXIuKsRnxGP4nMDHkx
 d3rYHjBA4F/Q/Pa2IVA==
X-Proofpoint-GUID: WXVQxM0UPLZphz58MHJ2fyAdYEXwcGTH
X-Proofpoint-ORIG-GUID: WXVQxM0UPLZphz58MHJ2fyAdYEXwcGTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230172

Looks like we ended up with a typo during device tree data parsing
as part of 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
codecs") patch.
 This will result in not parsing the device tree data and results in
zero mic bias values.

Fix this by calling wcd_dt_parse_micbias_info instead of
wcd_dt_parse_mbhc_data.

Fixes: 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd codecs")
Cc: <Stable@vger.kernel.org>
Reported-by: Joel Selvaraj <foss@joelselvaraj.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index c8db33f78a1b..bc41a1466c70 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2172,7 +2172,7 @@ static int wcd934x_init_dmic(struct snd_soc_component *comp)
 	u32 def_dmic_rate, dmic_clk_drv;
 	int ret;
 
-	ret = wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
+	ret = wcd_dt_parse_micbias_info(&wcd->common);
 	if (ret)
 		return ret;
 
-- 
2.47.3

