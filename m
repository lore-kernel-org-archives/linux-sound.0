Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40930214F
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965938; cv=none; b=X3UhrFb0XH2BwSB09i7qsIOmSvJ+NEQLVpxfZIriQOHpNoPpDMoA62G1T7/fzG9yozs2pTEPtFIXdKc0JDV+L0ptg2xA9bRjrFIMbEUWGY4nAtMcSay3daC/NkOmRh9GFQDMKtTbBPR6TpvU8xFVQlDvyBx39PnV6CpE7znTI8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965938; c=relaxed/simple;
	bh=2huT2+iKEw8tW47rMwo1a4P8i0CzNs73jkjQrrzOQro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ONmj5zKGaFZifo/1QQ39M/4sDGq5x4b66AA/sDe1DRo6TB14Amq+ibRsHzbURvGV3+wTZT8nHNh73Y5a1MTL/uNt2fVXr8WE5E5+TkKygLA1+ExnZruWeztyU4kmm+deuVFVYfm8iClcnZZA7lJfPVYj6k6GjXNiCbzqA5DZc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3Sf+jBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Sf+jBa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBssjL022434
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kE6h5t6yjbVzf8RgIauFFD6tv5vVHA/XW4w
	UEUKgjiM=; b=C3Sf+jBaQTW0W8BOFWc4iq7hp/Hc5lr3AiIxJE9LdF29MF9n4K2
	eBP2Ag2FPfpta8u0OVsxisBSZQyY1EDz2KHHgVXH3tCmZdPOh9JQkbvgz5quQkfp
	XfZcVkf4EzzacwuCHuEtnXu7R2pdeyJ9b6YLk3sbq2rzlD4GccH302rkL/S4qwPx
	hJihuXgl2GRKs/pCWhik81+rJc6+NotukxF8UH6p42b4H3k9sjdIhA30GQUzj/VR
	eo2VcQm8cm7DcwcF/RWJhHRft+rUqHM7Oiu7LYfsW4ffhT9F1VhAk60xhAJT7h5l
	EUKNXKZcsWRAiQlyX32Bv6Rz/QKDMyvTs5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdvufb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:12:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f3c733d98so1692168985a.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 06:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965935; x=1761570735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE6h5t6yjbVzf8RgIauFFD6tv5vVHA/XW4wUEUKgjiM=;
        b=tuWw+UPij3pBtH55OQBpyWk9JgECoSGGnFkSRbUdpieFDGAe5shMWWaqif2NWcPNNr
         SRZcGmWMbcwcW4wV3sdoqjsCH2xUeWQpQ0388TPRBgd5U4uf/i722l2Q3kXymXqGgEEW
         /QfGNqsNh7tqFsuOmn/w/dZ4ROfJk4OdsafFs1dDoVpZeZby6lM5k2anEaaVR7DMYjk+
         TPH1NftN5j8tcf2cILf6pWbUO1RzB54zFfnOH1D+LEhsuPCJdunDp4nLkST19s5VpiES
         lqkqfIqlItgChkPmFeq03N09ijxZVqSSERkxDzahlrWK6zvd9sy8Ypm7XviIdQOVTRW3
         2iZA==
X-Forwarded-Encrypted: i=1; AJvYcCXbAJrNbbs8Qt5rnRm4vBep9IFTKXbthKzs9UKslZITfJSz5J/UOh4VA3vKQW5DCGOZXCDUUy51oqzTZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2r/HYritKVxpggzmEJ5NdVDye3DF6DfGM/W55MUPrE5Q1IcxI
	qWvuyGsp/+we8559h0MLGwIfg9XLqFJThGSDzH9P0Kt4XZSuV2j0j5gwFapa1L9+siRNWuyD+TI
	KI9YbB147NhMzvPdTUo+uIHiL5mK4YXX67wvd3pcaKvp/S/iOR8UzMkSBRIMTatHvaQ==
X-Gm-Gg: ASbGncuYGwRO0PNp1BHWdozkbUEV3zjeFTIjKxhUn/9MbBvL4xUVLHb9wdiF4Bb7lHA
	/xKdYL73jnvNR9+krTZHJ1WOc/arwCF4XsYyu3qjZCzrlyKu76GFcyEVYd0CGFR0oRyVtXeNVzc
	yNMj6FQ6a3Q+92zydMOm9p6pCoTlGB8KXRMos/FgpQQcjBWycSAoZJtEHN9rKj6FuM3siSzXagI
	tys7oxWC/5Ev1tTXFi2Z1AGmuzSoFgJB7BzwWYXTJLXXPaYfKc244LStcoDkHBJALnQcxK5T0hE
	MxR5GeR3oa4+4G/S2BKuDSSOi+G3c109jk8h0hE84qb2LOupPGPzai3PtYGE1YJ9/Lon7YHK+hC
	VXzLVWWoUAjho
X-Received: by 2002:ac8:5f93:0:b0:4e4:9d63:4a9d with SMTP id d75a77b69052e-4e890fdf96bmr207133751cf.28.1760965934674;
        Mon, 20 Oct 2025 06:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsPnvRqWl9GSvk2rCHU8mAvynF5S+0f8ghhjGvT3zvjL0DQkU5H3U0yypMThGrIIFNl+39aA==
X-Received: by 2002:ac8:5f93:0:b0:4e4:9d63:4a9d with SMTP id d75a77b69052e-4e890fdf96bmr207132331cf.28.1760965932957;
        Mon, 20 Oct 2025 06:12:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm118165505e9.2.2025.10.20.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:12:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: qcom: sdw: fix memory leak
Date: Mon, 20 Oct 2025 14:12:06 +0100
Message-ID: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXw3eBH5hW4ZOZ
 85dcuwFTO1e451LR8yYtHTdyE+oqPYvImFWVppCMFdi1mgOfggS6MvG5BgbSfGy2Ko/TYwoTeLF
 Di40xlZaegRPEyb2zm3qpQHxfirxNwPs0fEvpw7V9aBU0i7TKN735MZwCUTloyvNyxsH0OXrNoX
 dJY/Z7S1G7KaujfmdSGeJdxV1/aVyK4ntjAZllOctX8HxSunX2UCnFIZVmrItyX9jxINuVnUtMy
 Y7jYNgWr4TLjBd4YsXteBJU+0K6vjfp9jadZRV5adQZk9pZ14Pm0cJK59l/OvugnY9HbD+OGpK6
 vIQVIbmv/7NZOgNftuILQ+hzTjrgdUJwYn68fef5cEc5/O6I/ow9jViYzyS1lgiAtWgdAyqwFlX
 Y7Dki1uu7a9q+tLtjSUaTeLuFuGUiw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f63530 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XtBXQYhzenM871KqHzxoThCpJOCA9ZCS
X-Proofpoint-ORIG-GUID: XtBXQYhzenM871KqHzxoThCpJOCA9ZCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

While testing for memoryleaks on T14s, it was found that the
struct sdw_stream_runtime was leaking very frequently.

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
    1. we never set snd_soc_dai_set_stream for non soundwire dai, which
       means there is no way that we can free this, resulting in memory leak
    2. startup and shutdown callbacks can be called without
       hw_params callback called. This combination results in memory leak
    because machine driver sruntime array pointer is only set in hw_params
    callback.
    

This patch series fix the issue, and while we are at it, it also remove
some redundant code from machine drivers.

Thanks,
Srini

Srinivas Kandagatla (2):
  ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
  ASoC: qcom: sdw: remove redundant code

 sound/soc/qcom/sc7280.c   |   2 +-
 sound/soc/qcom/sc8280xp.c |  33 +----------
 sound/soc/qcom/sdw.c      | 116 +++++++++++++++++++++-----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +----------
 sound/soc/qcom/x1e80100.c |  33 +----------
 6 files changed, 76 insertions(+), 148 deletions(-)

-- 
2.51.0

