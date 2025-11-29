Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B0C30F958
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424971; cv=none; b=W2JRszZpTQV6clIqHgbZvpA/v1Ka0N79K2mD8Zhus4t/Hg1lWk8T51Gt/ncL5g45fZQukXHm+NemLe2r2M1pSE16bgia4W/kpwmw+G5G5F6b0TTBaKhBAYWVQZi5xw8BzHQMlIdDUKqknV2/BmgOAu+1/Mqu45G+zzrQXQWXLIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424971; c=relaxed/simple;
	bh=aWK8HW93NbPO0VINqLWvyngHL+dlE6K0GHcYstgm2IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnPuQvf3zoXZQf5YblZ/l/0bS8mCXAB0ah2vUCxnvSA/yf+u0RGWFEekI6x4Hnz4aaU+HwlUhxdLnYMG9VnvHOb2VhKfFirtC1tJHRplH75ZZZAUbXLmCPsOEIx08c4Mwac4/ZRnr6azHNaRbXAMDlgiXZL4MQa4MSlQyD/taIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+541Q9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuaXtpIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+541Q9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuaXtpIu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT9uYoL2853187
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=; b=E+541Q9vWPNUnj6z
	udsWpbRfG6Gv7aSxA+RJl61u/UDrgkBa7siQHsiojZiWBPzu/UKtBB3kAE8aayKY
	Y9CCYEAGH4AdGL0stHCX0D1F/IhOqljaiKyRXwZZUsLhMboJ1TK7Zu3OpTn1cMJb
	bKKOuihqxdgpJskTwvfXW/6mUBYyN0ahpWsdKmzKyqWWYFEBlgHesqfRxnRF+0HV
	ZKMhg5JaFdARpEiL9TEtWdWC/PIaEQTm4auCxnUxPHTk6yiODPG8HkFTIUl1DyRN
	UJnsnnbnNkRcbwcWueIIFDa3+zW7K7zmW5FpeM8ub8E74ffwgoosRn/JowWiwwWh
	MczK/Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs78rr5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5597ace71e0so3593489e0c.1
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 06:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424968; x=1765029768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=;
        b=GuaXtpIuHNKxjrXk7aRbLyhvyZHNYjNaLZiwjDVocWYNePQ10/IuJ1UZCg8NPlxb/q
         pnXWa6Xgq3puwoiVokE5kHDFUxsocEiwxcnpN+hFfpW5VyNhyfV8BCZnSuL1NJuAwySq
         bmzp+PMY/UydJMKO952G8oIga8WExj4HMSuVkTwcIzCLKxLKUAY9Pk6U62kCTyKQjgA2
         KCTCj6Z/iudH+w3eSVE2r4jelvFOj50V3upVcktDERk5e0PVGlSj3go92tpHJ7YbByBm
         drICBEMuP7E3LiS9u0EjL1GE/Eb+BxUtX3BQ9vY0j7ZkDzP3SXkwnL151veaj3IrGGAw
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424968; x=1765029768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=;
        b=P2lvzDrCVKr0ZF58/wQWPjQOGyXEuj1eKxb76dNloxQNykdIX1t9Un0/UIqCsZyZaz
         FhFCXl15Qakof4UeKL1GoetsCHay7Chl5PB26D9ZFRz5zRZXe3ut+r2WdwAR87Idll+m
         wV16Hc7IXRzPIbNFBZp9PB1tyZlvDCUtZhE+L57WhPKpp4omqSK0amgOFJUgzB9NjGUT
         +c/YQbilARw6jKUDshdZqnbLePAtqmZ8pEqjZE+d5+fSHhSg9ZaT4hdbzjZN2lg/2gtk
         bOUCufell3cj+Zyc4EIhyso5QrY1XKJ9afhl6BmiSgsdFjyr8BMy0JGi51hSOEBlK0E7
         4iUg==
X-Gm-Message-State: AOJu0Yy7VuWSxPmll5TaCD42QUCykiCDCRiHuxRGwkcvXQf3iPLcQcMb
	Ae4FS4msjBfobYREIxlcSqgyyXD4KmzSVpg+pMYYi4ul6BzixGhzPyA/TZUNFCogvuTpfWrnLAP
	YW8e4fVCdJlroVjRwW9OhjDslywrhkghylP1snJc+m3Lrt0lKlJuy52Xkce59/l8Xlg==
X-Gm-Gg: ASbGnctWj3wbPTbxokgu4HVG6HsYSZqSlzG3QhWQ6bzKLROEXVwoY6zN+ZA3Hku3+fA
	x+S3o9kwwrU5Wg5oJDTHqycROubmz+c9khDbb78BAnCu9bdpXtEsQ9LhocZbzrDhfc5nhXUzCYP
	55u8DDOEZf7kEO9bCM5tCEk79ODzVFlti+Nejq3uzPwgUqVU0yEbJ0+tTN13QVht6tObkEzQm2S
	K5NCUrr+2O1Wx+TLhRd7zAFHrIRl/zuLrIkP7ao0BdFSzzF6QreZJ0kYyJQbQMCKekKu6uHVxmN
	NgfJDnf30NLYuwE8zkgfFlVScQUExqYzmLUuXQMzY/H0YM4BK6u3eiJsMRL4LfJUSvPa9/iQ2DQ
	2sXc/6q8C3hvS7s/ZORyutDsFE+CSPd6yOw==
X-Received: by 2002:a05:6102:370d:b0:5db:331e:4c1f with SMTP id ada2fe7eead31-5e22426accamr7311811137.16.1764424968496;
        Sat, 29 Nov 2025 06:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU98LIvFQ/kkWGpQqGkLrFs1nmiN3rrv194/Srub0dhElVvkfxp33hoIe5XJl3qEbZJStJCQ==
X-Received: by 2002:a05:6102:370d:b0:5db:331e:4c1f with SMTP id ada2fe7eead31-5e22426accamr7311742137.16.1764424968073;
        Sat, 29 Nov 2025 06:02:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:35 +0100
Subject: [PATCH 5/6] ASoC: qcom: topology: Constify pointed
 snd_soc_tplg_dapm_widget
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-5-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aWK8HW93NbPO0VINqLWvyngHL+dlE6K0GHcYstgm2IE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz9Ct56OKgiHXO4G8+WRGY7uM10bETkgsDRt
 1hvzjCNUq2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8/QAKCRDBN2bmhouD
 1yUGD/wI4wntZqbkUekoZVu5KlrHFsu3CICW4HZSdUtHxPqBA/Y7AzmKSB47OEQvz2KITJuBQmB
 eA7UkMbbOo2gRvm2ev9+RXKSXjiKruGYerk6TWDZ1FJjsPyPbu3NbLA+IcL+OU5GIonk7420KQ/
 6+dqikAR3QbI3+1oQzZHEOaOMHnwko1uFZ9U6EDoigXoqWiragMNzoqSSRku0qlIrhy4QcZKKyx
 fKVTKY/HKDBeq7RRlEHvlEyyeQTM2gaOtu4KESqKRJ7RDsYDU901jejp0OaSZweozGeKm11yUt4
 eLNLR1lis6aF+AzLlOIlBMS7b8RfKtPoaROsV4WRP+NNpSzse2RSbYS8S5gGfJUBhtyb3SyzrVh
 FEN2z6bnXJCvF9mNuFJZIhpei8X4GyJOQRA0YtSNxCeeLaCiIlkKVU6rsu24nLO9iuhGk4HKDcg
 iU+jCX/R0osDHeBXu+KjUz7Bdi34hYCuLR9UxS86G5mg9fzPW7YG19YFUfL2hGbtuYODtrnPgN4
 UpbuiwRH/e3Yo9CmsFxiESorX5JwKWnWU/pylBXWdHNI+Ts/7XaxnEsJ63bfFLBMTRFnOfcoWNY
 ebaWVVThjq4GcDX3UMjMM3NuN+oLFNs+1ytouhGWRUKqPmtlC1/6hH9NIFlp/RSj557xjknaG63
 LEE2jWjvR3akXDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Mvz7qwpD3NUNZY6C2cgH5kmxJazxYq7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX+KEqMyvStMzn
 1aTsmpBXipl7aF4An/QGmtqXYLs16nYVx0Ev276hToYYm19kqvwv8S9tCZ38Gs+2vg/SIf0k0eP
 DDdcTYAXn+X+XS96a9jIDcjMomZzdYOs7r66rywRu1Z8IEahU6fZypYV5LL0sYANjOyIc6yMwSZ
 L42NbdEwt/RaDFxGhuyDBtW5YWp/IM3Y2CYJcOCniX04MgMyeJIh/ITf9OSmZkEVx6DNjEJGQ6c
 psaBt0RI949iYCmnCMTt3M9q9xYuDaU73V6lvoblgColfYFZiWBHgqNWBZ2dILnXgZ7zZe3OT2F
 BYsRhJgwAOeAVq6uorNwnNMnasUoyseGpFniKXlIZUcc8GHtBAJJMBS6wOKyhMqmtoLcFg7+fZI
 ZsUgz3+ONW4rZgp1eMTeUx3n5NiejQ==
X-Authority-Analysis: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=692afd09 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LmhyXBtnI0SQ4MprW8YA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Mvz7qwpD3NUNZY6C2cgH5kmxJazxYq7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290113

Several functions in topology.c receive pointers to 'struct
snd_soc_tplg_dapm_widget' and do not modify their contents.  Constify
the pointers for self-explanatory code (pointed memory is not modified
by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index fdf144461cfb..b1a8d82b2234 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -590,7 +590,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 
 static int audioreach_widget_load_module_common(struct snd_soc_component *component,
 						int index, struct snd_soc_dapm_widget *w,
-						struct snd_soc_tplg_dapm_widget *tplg_w)
+						const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct q6apm *apm = dev_get_drvdata(component->dev);
 	struct audioreach_container *cont;
@@ -620,7 +620,7 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 
 static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *component,
 					      int index, struct snd_soc_dapm_widget *w,
-					      struct snd_soc_tplg_dapm_widget *tplg_w)
+					      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	const struct snd_soc_tplg_vendor_array *mod_array;
@@ -778,7 +778,7 @@ static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
 
 static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
-					 struct snd_soc_tplg_dapm_widget *tplg_w)
+					 const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
@@ -818,10 +818,10 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 
 static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 					int index, struct snd_soc_dapm_widget *w,
-					struct snd_soc_tplg_dapm_widget *tplg_w)
+					const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_value_elem *w_elem;
-	struct snd_soc_tplg_vendor_array *w_array;
+	const struct snd_soc_tplg_vendor_value_elem *w_elem;
+	const struct snd_soc_tplg_vendor_array *w_array;
 	struct snd_ar_control *scontrol;
 	struct q6apm *data = dev_get_drvdata(component->dev);
 	struct snd_soc_dobj *dobj;
@@ -886,7 +886,7 @@ static const struct snd_soc_tplg_widget_events audioreach_widget_ops[] = {
 
 static int audioreach_widget_load_pga(struct snd_soc_component *component,
 				      int index, struct snd_soc_dapm_widget *w,
-				      struct snd_soc_tplg_dapm_widget *tplg_w)
+				      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;

-- 
2.48.1

