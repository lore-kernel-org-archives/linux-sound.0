Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8847CC9B
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577337; cv=none; b=t0f7Eu5M08ZkA+zFbjtrme0ubm2qGNKo/InHW2ChqlN3xqy1+qMVLa9LB7yaSRQ/Kx6aLGIHRSByJkC1fET0tdy7c0N2bzKS3z1dEL9vYWM1RBMEIO4Kv61s+2g1dh+t9LjAMzsVhjp3OYZx4CSaiNjwpoYJW6++LlUk/Jctpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577337; c=relaxed/simple;
	bh=thq9wo4DnffvLwfPbwYBFKtMetFuKw6slUjFLdQaF7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sQ0fKrmh+GmUEBf2iHQ9SsLc0OCjIsiifLhA0LzO9tFeB46aVns60UueyIe4+0x8ljE3TCNz4F26RSazMyF6fa0v3Kp9HB6nXeHOc0MfN8MlrFDS9gounURl0D9QR+0OEcmn+O96+rkUt32hCrd3QKgc7QH78FC30cM+CYIGo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvvLNtCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay0IC5Nv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvvLNtCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay0IC5Nv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BKPii011765
	for <linux-sound@vger.kernel.org>; Thu, 4 Jun 2026 12:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ny3IMUpPlVW
	GWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=; b=GvvLNtCqomW9SATf27g8vvmLvvq
	hXH9ygma/LchhFLGkXGJnCe/tdY53y2OkqTJJv9k6bAJLoM4Jcob4xzzNkKjOdnn
	6Vzw8jIsCOcrnSID43cazIDlA1hM9o4O6w2Kz8wY+yFvM2578ndv8TznLZYj8W2M
	ssf3xb/skpPIVqtZHLr1WwS1sD8CPcJ0XxPHp9LNiC8n6SfDzxOFl6QWc6o7zir4
	0Q3zofqVpwt9ogRaHurdmjnkbwjSX5vGrrwW0Ydf7+lNqA7nV8/GVUU9gc2VWkTA
	9OtRO9uX5BmNeWyY6z6btjAQeGPHJU7RUkdRYcz8UUPcOqY+sCmKHKXBhRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc0axh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 12:48:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so521648a12.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577332; x=1781182132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=ay0IC5Nvr8o9rp+8BvJP98d8U22a6k8cicP3PJoMAaHfDAuE/xPlmFJxZnF40c99jy
         gntjJeEPTTrgG1B7bQCyeBllhkxwmPUb5ewBV+MfWKpOy+erfL2lp08c8ARztpU0OJhW
         fWXqrEPB5HHrDMlhdFzeb8Fh9ihuir2q+QPXlqa6BeHAUWCOQcHIu4bUExRAhifFg+go
         XrvO9Bmz51pSkWRT5VBTeOkl1Q2j3YrxYdWKVC/vcsguog4XYBcVY4La8QnoWcwayvAl
         RzOJS+tz7p7ZUqbGMwtkwQ8ufEuF2WCLlo7pnVcmFwsnSfjXhCeXp2Uho5FEdNx34mfG
         DzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577332; x=1781182132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=d+yKqzJVLmsFlGoRXfV0DhGAwlv2mZiPI47rWGQHihRU2Ue3zA65LDvKfoehwgCwtt
         7sl0tEUe280maBZV9xSKirzRtyUNmo99hgCVTHIb7+xGFrYPG4wYUjg0BGt/pxO0pwQk
         uB60HGM+fhQo4wvuuB13J1wUKy1vTztTSZ5pHZPC8+fauhBx/zJjzNH2HqylSRF7wT+D
         bkENLCtFxx3X3SAiAAK1qhQbJ4BIjOeu6BioGq/QF87vvU8ANINgzGTKFKebspo4gj9A
         DxdvoYfhRYxn6jSi4vgKAAxR+EjYPJvUcOzzcppY3UxnZXa0suM4ktjOT5ikQq0dyRin
         HteA==
X-Gm-Message-State: AOJu0YxS/x3A1nCf0TT7D995QGp7taqA7uU9wWHgZDW2rZM6MbPoM2x7
	CrXWuJiyASY+M2IiNZe4blKyEuyKnO9yleNlGqMEItqz9fI00VN52HMSNrs99BO0WkgdVwfr0Wd
	0XWmkTTr30wI3TdIHoxtbAd6cvA4mynHUT4SFCM7OoxjVHAL3eht5teyYXgLEpZbxKw==
X-Gm-Gg: Acq92OF7xZjvE3fil4w8LfiM1bbpAH5O4pKP4OQdigOTxfHjrzQNTg9uMWbfOutdGrU
	9R85Cs2nrcGiGBULcecZpBwGfm2AKd2akwveZD0uvPI2LWICof29jtyiOg2RINGW/PH2RFYj25/
	NPjHGAPGTIgWhx/mNZ6VSJBgKzse5tzfEPqpD0OlpMFMahM6hVj4jZYhbxh9orW8mGODd7be05s
	KAmgYgRGAzGlBdv/nekDo7PjZkXmfb7Rxzc1hRuDh6AeTDgJv/cOkrkLdfEsnzTXgcNeSc+vOxK
	m7IQR0cO4LnWRqI1/gi2XK05V5fH45QzRjfuOd0ogrcQMTtqMXSkaqVhnEljozayboQxHd1j7JW
	dCp5suhjxev11plPLdXb8wDRTvV3Xo4I+CpSYh7sSJ/VUXiiTOgB94WLj9AjK
X-Received: by 2002:a05:6a21:50e:b0:3a8:1350:ba47 with SMTP id adf61e73a8af0-3b4977b58e6mr8944142637.47.1780577332191;
        Thu, 04 Jun 2026 05:48:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:50e:b0:3a8:1350:ba47 with SMTP id adf61e73a8af0-3b4977b58e6mr8944108637.47.1780577331731;
        Thu, 04 Jun 2026 05:48:51 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:51 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Thu,  4 Jun 2026 18:18:23 +0530
Message-Id: <20260604124823.3467457-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
References: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mEnB4L93mWA_LubHVm7BmfZ1Tuqqof2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfXy2NLgp1fwOOb
 h9Whbw8fnOMqS+EGFdcK2wjKF8SDiXGe1eaj3sGhvqXrxn3GRDyt5dq2HbwzyjCq7i024NI44gn
 aeolr2PSJiOzgTeGYrK9StXyywV+C0KYWZDqzJ6pR79sAKdwsU4dyURw1Blq/pq4fmmAQOo3PHF
 dyIBlz4nD0UnDmr9kIrHWisirmdG8CVa3H7qzd9vhHrW65j/jWWR3gtKgms4KFGBazdKm9Ous4O
 sWJSNgXqBoqPTTkTpTiUJW08z3elUcz/JQx454yWMmX33OBk1YcWTJdDQp9hVBdaj28Rz3OBOiO
 hRCc6I2bIE4ZD0Mxcl9a4dzIEwaDN4JupvunnE/VZNEtikwSRRYTfzsi9c16TZSvSdL9AZvz/yk
 rfY24Gy1tLecu1KUM2aRxmKXQ1AFNWRf23HDFwV41G5IwRs4GZYllNGDhu/NllnNM9mT8gqFVZA
 +buO0wYDHmSafD/sJrg==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a217434 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3zrE_5izju647JJH3MQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: mEnB4L93mWA_LubHVm7BmfZ1Tuqqof2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5952bd6638ae..97e917338d58 100644
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

