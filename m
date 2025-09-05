Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C0362988
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087095; cv=none; b=LkvGOVAOLLjSO1zKP9FSG+1qfqwX0O0KfRN3+EAhF/wVMZ3hnuwYLN5AhwxWqmZkhHHX0osiyINRRlI9XJQ75qGcwCrqy1bKmb1au1xa5Nv9fKE2+/klrYnnxffnPAm3vh1J2HOso0SxdH1OIh7QNDt8/na8eKc9TFzaLkkWwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087095; c=relaxed/simple;
	bh=/U9W3w4dsWi5IE5LjHFEmTpr8qAztaXo6eOJbgusxX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCrRYGBkFffykN9dSwv9YxtUPu4ppv/kE1wwJopRSnHW8czH2ZUmsusN0XeX0l/vNCvVrYUn1IHoli90VDYb/Viura7lAjrbBEAD9Z35w78AJHCKtil1f+RSsmYmTzqukt+xQ0MPUrrh+wlI3BJ7jdn+8uPUuNSjvW1WQjwAlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjY//Ajo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjY//Ajo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857aeWM008316
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LsCJ17/WHR/
	P2iA3/0CFtxLbSANoJEOEN/h40JqWb6g=; b=HjY//Ajor+K/hp0gZpYsBs/g62J
	JpYUd55yBAjbWpkzmDjo/ddA67RvUOh/egBlasYdSAqFfRVzMh1eLQ5dGP1Mdk2e
	EMaqi+g+hUYlqXqYNSR4UFeLoVsdE5LLdTR0Voh3MMHgTo/J8U40ZlwjSceaA5j5
	tsAp+IX8wyGGRQq7udkjHPrT76FFSRtDYZwh58DA7mt0Sy88A0cNFf5joSnb5YoW
	hFg9B90uG6m8q1P5tsUCaNPQK2xwbHkGy20yoJujTpCrm7KFhXjumoia0nvpEHHg
	SBI9RCX8dtZvjMx/vx11kVpRLa8kamYtCCNGmeTivvQpdFvEFUdwxVH4ujg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjujca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f112dafeso12543251cf.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087092; x=1757691892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsCJ17/WHR/P2iA3/0CFtxLbSANoJEOEN/h40JqWb6g=;
        b=Hp7anR7yD7ql7nayZz/+CAq7/JYssa6lIcLOO2ClCMOQUefcYglb8cKrPMoag8wMsn
         ErI9a3tL3lyX3hdWYaiKfDDL+HcZNwjKppAY26VHKFeTHaeRFsQ50X6APmksEOhbDmJs
         +CLR/vrFmBKCLY9EW/nDK3jKWY3sdZ0HUuSVcmyIWIut1iR7RxCD4nch0XOISVninYBO
         T2QMxlDVX29iU6t6yRRZEGng86sOwC3IrFL/A7ZsHaoPiCIAJCHQSlVk/iICR9BSZ5ee
         LOdIDzoDgcEMvA32efeJ00l/Xynb9faly3hNxF0ewkFQxOLy2N/MZ+nv4ICsK1ihqZ1h
         Xmrg==
X-Forwarded-Encrypted: i=1; AJvYcCXx3XrmMoDJ5N63YR7qZHxlN4FBOScd4Rt7IMyl1bYhhLxpeY/VjxEYMLUXwF+s0iyT6f134cIOzMyP+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKQrJYYpR6WVwSQnKGU2tKWcgZLWam42SdMxvEh6RLTOtRMyA
	K7lMUmRvLLxcsHCUF19w65Bar8xPQ3ZbSNzHxHBPZ7d9WjwQHG92cKKM8N8b3v8V6a+VInhmdWk
	ys7OITOmBUKdVEek4Gf0joi7Q3BeDZhI8hIAw/OEv7CIf2TKGRzA8G+qe+DKlbDE8aw==
X-Gm-Gg: ASbGncu2rrU2bTvnnsj56JbhX+1jpvfK/8YY6Lafi75NomQGHfTUvgrUJkVDsv0SpIq
	/aSsavfujichjJWMcRdSZDMLZtVlG7fflyBhAzrccDqG2laXDVQ7f6C8QAWSy5HDQPAfnB5z+89
	YJF5B4PWAsuv1Nc4KzKdM7eTzj6ndryys5u8qIFJF2LY7KAZui12QMiYWg41Ghxyan68exm7xTk
	q6GIQJfRcphJvcL7bAp8N9KVNjw3ZzQt+5aUZ19CUWKYJxkd2aulcfSK03j0NGZ+4RmZc7py7Kb
	cHLB8HFZXH6fiSfeuWlT527ZHVd3otKrao3VQLoMLADW9RqzPTVbDg==
X-Received: by 2002:a05:622a:1f0a:b0:4b0:7d41:df7a with SMTP id d75a77b69052e-4b31db65fa6mr319517451cf.56.1757087091505;
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdhep6GikAkazf0l6t8i2x3f5Z70bfCZ3Bnt13gdUl0CJAAIC5jV9yr7/tdMQ8sW4u617haQ==
X-Received: by 2002:a05:622a:1f0a:b0:4b0:7d41:df7a with SMTP id d75a77b69052e-4b31db65fa6mr319517011cf.56.1757087090929;
        Fri, 05 Sep 2025 08:44:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 11/12] ASoC: codecs: wcd938x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:29 +0100
Message-ID: <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb0574 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: X2BpTwHRW85Gazop4deieNkmqfX09Lut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX0Pc8QKXnc38M
 FZTspK9kdJfQW/Fb0Whf0MG36BasQU8V5SuQgmwcMdVCuUqZ/LlU+PwuQl1Dpxo49/wi5sFlstO
 6vk4SCmDX/40/9XblKDlFy7SOU94hTeqhLmqKgcaIxnh4hbN562dsy/ctdBKTy0xmsrzZ5XVEIJ
 wy3j8nPRBLDf7EeSCZ3VgBqoBPlxVDO6jnYtJzx8jtUeZ6BOVSjxbCwwGGgzxrzbrzXNBgnTBJA
 GZHeFAaOAnvBf9dLleJ25yLSFKFlAh8nt8tV0xYqXkpDI7FnAv3LdxmPE0SVS1YUITPMmzVhSEZ
 8lVu9tI3Y0ZrSpziKveLnKX7+VfpDrJfaQDzkMaXeqRXd2VP3M6Pmy8WcT8pKGDfoul9RErZNKG
 JYnARpDx
X-Proofpoint-ORIG-GUID: X2BpTwHRW85Gazop4deieNkmqfX09Lut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e495f98972f1..e1a4783b984c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3389,7 +3389,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0

