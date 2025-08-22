Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A15278E5D
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882920; cv=none; b=d3h+946e7K6qZdhSVdQxs08O4QpG3uPd7PVFbjYVr0A/MM2bKWm9cacvJjZmcErwcT8wSgLv3hvwaGY34jMzOecqX5wXt3HlVmPJPmt6ty9oDwzsrNCWKJYMIFzmxTKsyJzMFIKExHE5pEeQsv5bym+FEA8wpqmGovkzD+AO6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882920; c=relaxed/simple;
	bh=NxFxH1PVJ8Nv0cTYQx5eobKGNaG3ah2F+6A//LoAzKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BgfboSq59QqQd/CFjAlg7B7TIHGbZqnkybEkNguu+ny+d9KteWK9jLJgZ84in5lrxNgIcpA04I2dFs/v+z6dNEDL/68n43lJ4OyCwsLJJt3WaLc2D/8gP2L/rcEll61Dlj7k0dg5VgmQuWf8W5mhAbastsql6f6PgcyoQE8br8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp3eIFrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp3eIFrK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MEL9Ii009226
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yYwBae6Xgid
	mPtjoDgfyrfegas7X3oCKUAh6mAOW99o=; b=Fp3eIFrKYMmEYLEzLt3RrtD9SuJ
	OYvD5kcLR3fLxIs/kCvsiC1bemUZexVLvW1/jwK8rku4TP7G8PKgY6YEMdpMtSod
	NBfbxawkS4NUjUviTZ6Zi6VL+Q3H9Nxb6cdyx3v8MYaEx/7DJDh1VVfZaesIyXYA
	BK9LsncwgMOftemUruKOOc+ArVNrReASlw4sLZQ548Id9nz1p/vA394NmGeG5SSi
	aODjBpXpE+Gc3CLY5Bn6oOCp1gsghhPRPGtHPKGxH5qhM9hNpfC3Qy9Vp/OH4o+N
	nME5JtgUQ392E6spotrDvwwHcTorKBWY8TJjje/IZtXP9EOKgIjfl4kOHKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pt7vggx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3251961140bso1103677a91.2
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882905; x=1756487705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYwBae6XgidmPtjoDgfyrfegas7X3oCKUAh6mAOW99o=;
        b=Ijgkl6UX2g8W+CcbD535VcC8QfyidosxbX73e3FLQkWiJBx25qV4DwvSgjksVQHjCA
         RY2nuTsZXzaEsOthgG/PtyOj09+gF6wYTvqVINY5mISzIcDY/SYGrH6S9Io+ij9WjSjw
         ubi2OM5IhYCcx6IiT8p7bbp20kZabf/sl1CIGy+MPa2GR4OO/g4/aFcY79lWJNjXZHZ5
         xb5KQVQh6H3Gw2nOV0Ld5s9+sTAnkkDClM+UyXUAWzD9ia6fnLSzGHOcV7ccKxXqw5Eg
         ljKa830cmEHrYoo1ZWZnUxhn62IUHzx8beLYHkT/tyxieHk6yDziRwTJ3ygYlXpdyfCc
         w34w==
X-Gm-Message-State: AOJu0Yw1k4bxemnE2r/EFhC9zzzrBHhAkAMjGBGnEVR2DZRt4gQy1tRN
	18ry7wGBBaol7w/5b1rl8XKoNojGc+Pb+vz5V8h4lSZensGQzbDyjEmYyj72OVG+YA1q5+SMomT
	8iJo/A6Mex4yt0/BALDU6oMdRmXDZKNvAvhIuHJA272ppH5Jel2rYYWOpLYTh2SmWIA==
X-Gm-Gg: ASbGncthXCQl85quLsIkOYY/KupHJ/IkZBqXLvyVOpvT0FPwZYsXREOGtW8iI3/96vO
	SACP3fF9ok5SMidFq48wDniaArlpsbqGsOdApUo9kK989quVm+ficXBjWOeiGVeRpg7uPy4hRbZ
	GHFXiSHEiu/BIO9WfLCEqUr9fGhKbbbIR96Oq1ftSuPOyR8vcBRXb6Gi8KWH8/eQs+ElWDpg2/n
	VXdFAybqsJmFRlioQBGOheyQGuVP9NxACIER8gu4A9OVtvi9HUtApOtXuLd8OdB0wb+8tslEJ1W
	yAOxvTKrr6r9pajKkn+lJ7fA/GPp220dbew6Pamf8TPRmKeVFeK0Wd8U8hgZOrNoW6ubQCU8VtA
	6
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr5539854a91.19.1755882905393;
        Fri, 22 Aug 2025 10:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3iOOqhGrWXgR2JO7VR3W11A0aVF7Bxe/6lQtQ8/h7CuPINehM98MxMjz1rao7k09JmOjHEA==
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr5539823a91.19.1755882904950;
        Fri, 22 Aug 2025 10:15:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Fri, 22 Aug 2025 22:44:39 +0530
Message-Id: <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ao/rySZV c=1 sm=1 tr=0 ts=68a8a5a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KhSO6HZblKlzq0T7JtwA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 2RY7UjIGo6VVbqaquode1cz6xuj4ex5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDEyOCBTYWx0ZWRfX6NjbPGenfCwH
 7n8pCKIfBMmX0it2dvT+H6UYbgZsbacyzxUrFGDYaqbsBXbxGE9QfapZTljpCEjwPzQEzfiiYAW
 Vt4CO/4OoUJqPcWtPEQ6PKIk6SnBa0CT+QfpVLE3Lx7D8y1qsIVZxnno1KrJ7QSEi8xW5T8i3+8
 Y0kAtqPs1kHwCAOHQvN/f7TNaKx3hwHsvgUxf/tdJ4a+PKkJfgXqy+t7dfTAeKayITFqLVhcjPu
 E2cKm4EMVQmF40v4y+QwIhgUnhBkugFwPX23ihDvdNRjHS1VLSCbq2gVs67HVTMNdGbEianEkif
 Hzjq5TYPE+4/akai7jn1y2SPJTj44zfIjZ5ywfc5TmmQehqmze+TKVft4tMLjQ7OVifcqvX3/io
 QpIgGm0fZVysiBNenOowrV0IOwIQJg==
X-Proofpoint-GUID: 2RY7UjIGo6VVbqaquode1cz6xuj4ex5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508220128

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..6d7b1a4b0b2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1

