Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AA335BD8
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420423; cv=none; b=CHSEmBcRGPFxBAYU3po/gSqWwlyXpcX4lJkez4MlABugKeOjpJu/c75roDCfxKSdJUHtVcRiOaXU5IzhN9A5dPl7OHmyk6rvXe1MztAjIYlKN4sl98v3aUlQ77q05eq0N8L6fjOk38u+s0R4LfGQuTIG2qux62+o62SaXkrOz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420423; c=relaxed/simple;
	bh=vmg0oYOxevk5nWCek+pJEZ1daibBK7o4kDXZ315AyTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elMlM20mPEuBOjtcLIEASGCfI77A03JRocQjoXCh7FkrwUNkpJDpr7C9ys4J4ypMQtyogCiY0yBIq2wJmx8ve2qfUIWO1FBFjGZ1kzrAuBbfJ3cqpiBbUoDQOCit2H1lsA82Gs9XmSGv4nG2AmoWbnwOLe5BIDG4qq6DdWfdIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsMI1YeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsMI1YeW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M2RY002327
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qv++HabcA9y
	4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=; b=GsMI1YeWCpjDMjfMazHAqet5DzD
	sVM987n0ADM805jh+AE9gZt1ky+LlFmkObQVMvgFZCUSCe5tzDxerjwMMBzMvwBk
	fuBXhuRzYrcDbfYIlfty9GrJrp6Hpw2ncniYAZh6Wg3Jdysw9NuJSTeobbJPq+0y
	byrq+oRria7UsrmaTeB9nAVAqngTlWEtrpr9g24QBZWKR2NS/Eik2EwFx3BsE+25
	2+NDtxBo/80mNhw4yaMsdJ5zAY3RFEaSp5IWZA1dkrJCP80SeFjRXduOD/TIhSV2
	JqpB8BJdP5/nGUr7QZqxSRwbTv+Ysj29Zuo2xqdB8ouWEDqINB3BRlFVlrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg00eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72108a28f05so219379736d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420419; x=1758025219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv++HabcA9y4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=;
        b=IqDqxp4+LgsTEHgx4Q5UcD+/fbO5URJUgz+9FN8u7ydVjuXGPFWdfSm31UTTuTY/Ze
         j/Kwar4c4KA7sJDejIHsMpBjUJGFL0CAePj6fzHIItVgsMlsmuFr+9geuBOM3dfQTpZf
         nK7VWc8sGHeSBxrmXIx1B9YJOu6nzLqLLgmCD9ISJd4foPfQjkRWy+sXl1DYnrUV+eM7
         4189+ixmMAUZBOGyXAXQKpruX5Tyo7ITF2s5EfhR0RdtLDYQ63gpZ0DGgV7ozzK3VRdK
         /Rngi2AyxZzKzLWlAl9trwSr1OFDxiwDsAgxu9pHj4dCAfKRamTuHywKQnUIJgbPn8yg
         JVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS40Kn10BTizjGJVKYhCPFw7aXt6RZposV/0qR/twHa3AgVghyorcoGSvpFYyON2PR8ddI2t1gYWgavA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYYIfqadqQklRS9Em9pMstRJw8/4Eke6l0v2JZ6D3uiCeDHv4M
	oZ/AjkTIVD0ihguyiI4KUkZ5mKft+vp0D7Z71GxCOn1iJJRKIOsRGYFQPp2NKbEiMOMuwMyRh3h
	TZLbIskPkDqNRKNtewPChfnx9Ibc850zWiy9fvljq/Od8irYzvFUK7jLXCBfFEE2THQ==
X-Gm-Gg: ASbGncsY+UKHyvb4+jFx7lQQ/1VqvShLAIlmfQ/m0eHGsF2Db7i2gmGFJEmypKnDcos
	06gOtjIiS08EUOTMqf/K80zqkMFRhRs2GSDBL5P5hFx5luzOxvXFocREk1nfwDiKztjfjveRxHg
	JRKJ1jbBjMuScMBiefI7ETQ4X7dG+L91v16rSorq2O99mmZ4RoA4o9PPC8lg1ddxaszeMm6oXaG
	by7LcuSOdh9c6sQHzzLWq3NKIHhdo2owCOhWw3nkCAkkkjKSwHEC6CMKi6B5m+3GfzCWmdH+wxB
	WIunc7rw+NddCC9Z2tFd9cjy1gw8uifTYtmOhxaCzk6eBAxnJmWYpw==
X-Received: by 2002:a05:6214:c4b:b0:72a:c6e:c716 with SMTP id 6a1803df08f44-7393ca97abcmr130511956d6.31.1757420418675;
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjdb+VN3e5HFiDLcN4GJoLNoIuWhH6jlimmrGYroWFErjQGM2HSwWtl3GgLtlVDVdSH+RylA==
X-Received: by 2002:a05:6214:c4b:b0:72a:c6e:c716 with SMTP id 6a1803df08f44-7393ca97abcmr130511316d6.31.1757420418043;
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v5 01/13] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Tue,  9 Sep 2025 13:19:42 +0100
Message-ID: <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9aUUBxjE0pb4IGfpE6MGkq4piiAB03XR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX8sYss8YZDcCw
 RMy3Gtm+ax4jHHq8NMXfryxyL3WtN7VYLjS0R3wRfIuPQq2eWPbSDgHnAiNWMwKVAqY+xG6jyxD
 hQfCEnPwQZL5gi5ZsTq3HYwBBGgDyxxrVXNE21l2uC1w5djLVFI2OzxkMITcp79cbWsLkABmV34
 vfsGVED38GsUgCCRgMHMgwA5cEJeXi87/UTzZ4WUpUBffh0SNuEdCs1JJJw8h8vJymzVtNuSOy9
 fQN0eR4NL9v+p+VgCjx+JGQlbvTQs9E3XVQ05uVTsPiitHTO22aTAPjMpbz248dF6TKTqj75qaA
 6N8U2HYKACKYD2lFgUDvDl2mMt05mhOfz139yDhMZE/iRrxAxn1qUS0+AiuqAlAUbWJSpc4Ntlt
 vVHSR5Bs
X-Proofpoint-GUID: 9aUUBxjE0pb4IGfpE6MGkq4piiAB03XR
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c01b84 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

For some reason we endup with setting soundwire port for
HPHL_COMP and HPHR_COMP as zero, this can potentially result
in a memory corruption due to accessing and setting -1 th element of
port_map array.

Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b0a8cc314e0..de2dff3c56d3 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
 		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
 
-	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
-	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
 
 	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
-- 
2.50.0

