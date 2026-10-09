Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621784DDB4C
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551615; cv=none; b=ovPsfdn/OVjD0/TzAVC4g3Sugwi5xh1NSm1FcZe+wLlRs+O6ZsX3X7AagG7j1mOfUhqhi4lkypSQSj94TNn0+K9nExiXG66v52KpYWBc14jOnEK85cylwcgD6LfwtAZA5IheUYawvTgNoQEu/oRc//dJKDA5kfcQYy5DOx5/kWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551615; c=relaxed/simple;
	bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTyhbLZzgZmDnHcWVMAb8YQaglXTx8v8fMXQ49Fmgo7wSLTlsFjrPG/REUFDCKZ6tfi0z6XqGMI1YH/XMJXgDNOOD9d62UGSoN29M2ybhefF2XVDNq3pExEU1sCW/Vwhb3pAfC4FPpJ4PO5dMRpJDkSxiN7OCGOTvi7NEELbxpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gm+TZFEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCts4h4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gm+TZFEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCts4h4U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4gPZ1336308
	for <linux-sound@vger.kernel.org>; Fri, 9 Oct 2026 13:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=; b=Gm+TZFEuM6+nCu+i
	4brH74Mnws8MgL1+eIpNPFaYq8m6wRji9gKvliZlx1D/PwQ7mcNT4+wzWcNjs4MS
	3SKiEcoBa1ubdJZ7Fs6SsDft3eds6jLGTmQzZyVZAlAcsycI8060L72KKf5K88b2
	ogeWLLvt4i5TDsbXv5nOlDpwHPgq50oTJ4jjWJ3LrM0uGtku+jX6kYkGJ3OJB/OK
	We2YFK4G17Cg3+QW3TGmpwhPTn/Zgul3TvlLZfBJo7jtol1JusDl8ViYAzb60PM4
	6AyGd9r44mSx1ZOWyB0/0kh7zy8RnDlgwfo9sw1dNPv8fAGGFLsIsBMMMnSFSIJC
	mDc4SQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgkuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 13:13:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so1406668b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551612; x=1792156412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=LCts4h4UEaMUr0MROVCQ4gH92V/mS3+o8OIFPVPGFdFGATxBPkUwC06VavX37GyYQS
         1XpEhJdc/arLJOxUs+Y77n0AeFQz+nw9aUCXyrdQ6NV1jzofW7s6nkYRydUMFZ/ob8zT
         KWnN0dojJgaWzLmNKxvJxXdwhOWbIGYozHd3yNehcwBjSJhCd7l5Pm1HVsCDWTA6VOfM
         5tr8IfMcL50pqTsiaOke5e6RglDbIPAoI1agDneHpIJhFdSRQLqpvAb7FNMuhCbLxG8/
         PgKDpu7dMWdytaFrmYTJZ8G/Zu9jHe/xTVyCPMY5Oy7/8U8Ong10nhX3I9ep6k+fziTG
         0j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551612; x=1792156412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=pPZ2q1bkgyVfwV0xEz8pCZI21GK94LK85pV5YyQn6IkIjnwzTn16HbSH7jAOo2LZvQ
         uKpOP0BJkVhV3jf8NdAsjVIKKVtaf4q/o1Ly7bZrxdlhg0KGRPJfHZf8oRuoMv5gyK9/
         HnohdzwiMMsq7GWLqr2Ozx8hpiz3IUqTumLCTiftCNLfWWb7w7P+T6MMxBKgTfa/uUEJ
         5Fk0+lJqpoSx4AFW0k6wBSJOINlQBfK55sdIGBt8IXNpuSWjpo/iQ37q+n61CUvaktRs
         FnwwmHtTgfnlZuLJZtRwBENKhnEbGm2ppXBfvUwufn41Kb7oKoOUz9S+LGlUurQdtu8r
         EYvg==
X-Forwarded-Encrypted: i=1; AKwUvBxskYzifEhaTTbxKgVZQ3NqWzk3fLml2iV+swW4yigro7yrMYgO81/udvPh5qvwS274zDopsodBMUyeCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+OB5uG17kaiPFuCt9rCD6FmnWk5M0OsJyBkegtP9KTKBIT3VU
	qCCT5CMsT1ZEuFGbDV2dw6wuFQjvKtSZKkyNE4ZpqNErUhXhklhNNRtltIoI/EcC3vqrU7/xwdL
	hO1CIUuN8+EG8nzrAg0dcAFsh/yn2KLypca443IcxwJ+sDJxIqIUnYHvG3VwF0CjEiA==
X-Gm-Gg: AYBFou2ViaepqVJGe4wt21QrNIuO2qkg+R0lhmy/QoFiv4wAw6T2OTUhHHvf44mJCeF
	p18vYcKOmjKSb54oQujkphx+PBsZ4QcYuwxh+LlpE9SZB05xNyFw9zH90xsP1jNVoQUm6det9js
	2xYt5p3Cip24JC3pYHeTBfCAYCs5SmxqvmF6gIgR/03BkEH3r9EnprlezyOfAgSzShaTrloXgDw
	NdesPvKD8ULdjIOWA/5TIqU9mbNDUijK/Wm3ix8T3ZK4AEDvM4zt784LVvStYe/i+zKMI7Ng+zv
	4nQJ/68Qaiw31bhGFBPbkktfpILnAndVh514sCDHUE36GOcX5mP8rmUyJxccZjujKnZI+G4x9U2
	pxVhRWQjCMrGe2ABwV2+BsNJaMAUQj19UH5Og
X-Received: by 2002:a05:6a00:148b:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-897d4da001dmr1112669b3a.23.1791551611898;
        Fri, 09 Oct 2026 06:13:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:148b:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-897d4da001dmr1112640b3a.23.1791551611411;
        Fri, 09 Oct 2026 06:13:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:49 +0530
Subject: [PATCH v3 3/7] ASoC: codec: pcm1681: Add TDM support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-3-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=2096;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
 b=3ScPKzIVVT1eAuET9LkmRhmrjVKlmZP1mVyPtyRNy+K5LKlssV4/8R1U0OPFC44kvcXZPUsTX
 i9YEZ/rvH9JDwp0Lv5EUC1KX5ZBb5pfId0GdPKw8I2hYbY6mq6BYyWz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX5oxGzexFFQjc
 qw/AMqJZuy28MStvHSL0y7SxxmoiNjncWJuhhGxPjna8ud6Q8JOqEy6EPddsBmVxLNhgUj7K7QJ
 Hx/0/F4nBYqFVds4rFiKLLfrFhdaqHk=
X-Proofpoint-ORIG-GUID: fj3Oiwhg_T1sdG9UIBsAO7phHjIhRX76
X-Proofpoint-GUID: fj3Oiwhg_T1sdG9UIBsAO7phHjIhRX76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXzyQoX6eCZeU6
 HV0QILRgUJRxfNL7igh4EH8ll4myAwYjKPDtOk9qQ9QMXfpj+w5V5yy/mIXP1U9JLjtAm0+cgYA
 hoMyT8jYVlecYinsKYEJAgi6T2YMbYDbAo+5B8VBmxFTpd3oIYWkvqbnV+R+Z9yXO13Eb+ZAPl/
 GkxLOKlFnlNNh7sR6swxyonyt9cO/GRVjo/CayWbVKU8OgZgaMDKOJadfZE9GgMs7A6r9yQD6Kq
 ukrHN8HIlcwLI6hxaHPZvt1a6/8Yb++sfbiyT7a+46DdsxRFOgn7OcSwWlD6FhKgHXaVJVOhl+D
 x0RNQRZf+iZXWppgnyjaR5E3Yp/XVkIvCMGAJUslZhonv7GOEfq4cqGl7xQrFbuEG8Ie9TDsk8v
 zYRDd3JAc0afu3hdE27+HozRO9Q818APTMzrueXv6xA8gEVXOmv7O4r2JBgqi8W/Cj7eHOB1FhW
 ReurTQ2YzuG3vEJ18Kw==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8e87d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4Rug7fo5hNcZ0wX2R6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

The PCM1681 selects the audio interface format using FMT[3:0] in the
format register. The driver currently supports only I2S, left-justified,
and right-justified formats, preventing a machine driver from selecting
TDM mode.
 
Add support for SND_SOC_DAIFMT_DSP_A and program the PCM1681 I2S TDM
format when it is selected. Also advertise DSP_A in the selectable DAI
formats.
 
While adding TDM support, correct the reset default for the format
register from 0x06 to 0x05. The current default does not match the
hardware reset value. Although this has no effect while regmap caching
is disabled, it could cause the TDM format write to be skipped if
regmap caching is enabled in the future.
 
The existing I2S, left-justified, and right-justified formats remain
unchanged.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index a1ccf1edf..3675b2236 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -53,7 +53,7 @@ static const struct reg_default pcm1681_reg_defaults[] = {
 	{ 0x06,	0xff },
 	{ 0x07,	0x00 },
 	{ 0x08,	0x00 },
-	{ 0x09,	0x06 },
+	{ 0x09,	0x05 },
 	{ 0x0A,	0x00 },
 	{ 0x0B,	0xff },
 	{ 0x0C,	0x0f },
@@ -217,6 +217,9 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	case SND_SOC_DAIFMT_LEFT_J:
 		val = 0x05;
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		val = 0x06;
+		break;
 	default:
 		dev_err(component->dev, "Invalid DAI format\n");
 		return -EINVAL;
@@ -232,7 +235,8 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 static const u64 pcm1681_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
-	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J |
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
 
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,

-- 
2.34.1

