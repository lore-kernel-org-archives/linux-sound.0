Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552862D7391
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068845; cv=none; b=pCylqu2h3a5YMfmRrmTw9+NWxVkjra/jIBUXMVBlnzWqEwUuyLYDo5I3tAaHDt2IXMr+0CH3VdcyDnRskas9z6jE4T8m08lja9Tfr1BEzHQHtobT8lWD+SGwGFlMerkee1xPeBkOgE62urqskn6mt2Vz7u9NpKWonyox0Zgiw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068845; c=relaxed/simple;
	bh=DHutDMB1AlF6Zj+BlaAR1mMwCOp39dMu529S9tVIn4I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=on5VWP+fK856nuT5qF3QDY8yslFTOUcpad0raEDELkX2r3wYgFZdfPEyGR8AhlU3KBrBYz2Rv6Lp2yx6GbOswyWsAxhe7VDlQBs/PrTGl+6h0BnuxfdBTRSd/OZYJ/OkoSiQpb9zPUePf1rbhTPV0kR9AB4JOtfrylllhnWfNrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJP4jSIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJP4jSIu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856dIxb023895
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KTOjmQ5YZcnfoxX/wtE01OBjnG7ULxjk3k9
	cqZBH8gs=; b=dJP4jSIu6c3uON0HzdfCG0a+5pCTjSo1FfK89E6u8+n6lx+mIDX
	5SooKQuMNZ+ZmXjRfk/cTKmQ8PN/dQ5ZEsVtQzSc3MjBEG3J5mQceDjyob4fpZ8Q
	Uzhyx4XRbUdHD8lrEz1zgUa4l7+SB/IyDeFaHZT6Y2XZT1KE4ehTUJoJTT0lWhDg
	YN7I3YJrsCGj5i3PVN4JwA1HedAUkf4vO4+VtqRG0IOY+AkhgfAUCA4p3u4RwA4z
	TFeKOBhVFsHHGOa+sCeU3FvQGUVELOlx5qbtpmcCJMOEYgbxyJh3nG+709yfgG8Y
	cM5DQT4EB8yPOF+htYMckvTzE6xLP8FrdzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ftpf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:40:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724688833bso2183121b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068843; x=1757673643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTOjmQ5YZcnfoxX/wtE01OBjnG7ULxjk3k9cqZBH8gs=;
        b=oXXSN0aJbvZz1ceUYg/tt0bnACGAbYNAQKKjQ2LT0whVKpTpuM8D9fnKzDsXMPVvfk
         Z6+7oam3lN0Rs/4S/qBxF7Igj6WQI5q1OH57ke1JSVBZk7SkjovBjpfkzX4AQXIOlpmE
         SpReLoiwFZlLDZ8Ir9U+P4HoHxLgG39CrfRZg371MwjnK4ZsnT4RR86fsO2RimFQNFmX
         wnQdlOWnMnuENkfVdbh7iaHwh/VLdBnzkAEXt2e/3eWCSjJE8EZAlLOxEhTgJDwMAlBw
         yXk0aTutCcYd99NCWakdQqTtBohG+EwAA76pVWxoKhT+p+PpYjOB/smebpthWpTByHoC
         ePhg==
X-Gm-Message-State: AOJu0YwRhe/Pa6SElNcwbtMILj6G+D5evKogUb33oyKXVsk8fdWpnUWd
	qyqhZZQ/jxshFb+WAbGde6G/oCi2yuovK0e+La9FXoNq5+oCuYofgwYik3RjWXkzW5AEdvNB5yC
	QumzEJ2nvOC52Wn9p0kX1t1oJ1zGYG7QXQ6ptVjoI9cOQgdCsuMNKm4FmFYIxIZSfCw==
X-Gm-Gg: ASbGnctNnNz+lmjhP4KOKNHGhEu40c3QwyI/cirqLhujiNDVGd2LleV1hTi7pNoNPkv
	eST93gSIlnlHr2xeSWT9saFFZ2P7q+fTfqOsNYyN+8mmqz2UuRB9ozZjuItG3D8M/VGOkWvk1Z/
	WW2c2jRw0ZXhnpF5F55XgOpBgqceTpk6ppO3OzPKqSHEQbdCmlgp6V1dq1uRC9ZQli9Mf9SQZPG
	xlE+cqqjWshK6oVMh8tL6kSaQNuzQdNIpF8KLwm3TaqFgmforBb9+i5JmLr/UhDsJ8M7S1/BqwQ
	Bn+TDUU5Cua+SMsSqUexRvcO5AKK9A2Ua6bO165Z5LxyETo+Awwrl8NopSSQhZzgzg1jQRwoq6D
	0
X-Received: by 2002:a05:6a00:b81:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-7723e342758mr26414381b3a.19.1757068842635;
        Fri, 05 Sep 2025 03:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kvOTKtPmkE+qtmPs0DrM1pO5RsX4xLOd6KiyukaWHCJEsYx5miSGaqT9A7ydir/6LOnzww==
X-Received: by 2002:a05:6a00:b81:b0:772:301a:fbb6 with SMTP id d2e1a72fcca58-7723e342758mr26414356b3a.19.1757068842221;
        Fri, 05 Sep 2025 03:40:42 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21993859b3a.17.2025.09.05.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:40:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] ASoC: qcom: Fix lpaif_type and DAI configuration for I2S interface
Date: Fri,  5 Sep 2025 16:10:17 +0530
Message-Id: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/FdA9Q7lFQc1
 9o6RWXksOWfAh0V0MfJ65S6At7wxhevHJ1tVjSvadZYVMqu1igyE5ub2gFIgbSvqlPFVU7CQ9LQ
 Iqs0BADPUv1zSCgPVDZIVw2lLXdeuanNZ4iO4ZG3YRijZT3fWLPZTFvVBIedQDlsO1Sa++qIsr5
 d1eXUzju8BGmRA6uM/QNyLK3Vk5L/s4i8fWVQHFMjsI1Mjw6E0Sq+uKOhufKHxOGlKZ3ri0sSNP
 xF+txyTrfrddmDV98/LoWdsXiO3FaEjYWbwgpWc5MIGrxBcFXKwj0yz++I8xz1R0rtsbNsrwK21
 yL4uXMV+dNgHlf9nQQDdCGRl6hCQzsmz5J9W76keahR0fbjyny65Ma2kt+tZgMOb5KGHLaAPRfQ
 gchD7u6I
X-Proofpoint-ORIG-GUID: 3PV30Sc-jG6M83LDGtB5R49SbVePG-Sj
X-Proofpoint-GUID: 3PV30Sc-jG6M83LDGtB5R49SbVePG-Sj
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68babe2b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=KhSO6HZblKlzq0T7JtwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Fix the
CPU DAI format misconfiguration encountered during I2S
stream setup. Tested on Lemans evk platform.

changes in [v2]:
	- Used snd_soc_dai_set_fmt() API to set the current clock settings,
	  instead of the default WS source setting, as suggested by Srinivas Kandagatla.

Mohammad Rafi Shaik (3):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
  ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 3 +++
 3 files changed, 5 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1

