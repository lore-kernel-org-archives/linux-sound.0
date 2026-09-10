Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E634A0924
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052601; cv=none; b=T+kbLSQ8g2xm0K86LFzKwE1ZqKtHnwt164nYKiwnu/1LS5AiV6RLpSRrekeb7rpa4TPBvI7Nw7Gx/8qwmx8g+3E6ayCHJUn1XywtE2UB+ibyEoznbpHoHPTxeOMMCgFzEbL76iH9BZpU915EbCztrT+BNHJi8yoPzGiUCXZ3vSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052601; c=relaxed/simple;
	bh=gavmw53/qKFkQUKWZaxHaEfUpbny4/RhZrJskrOqgK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP0lUaJkFukc6THkQsw+3ps3mpChZCjxyuLEfdlitaoy0iSgEfwBnNSLKJTgQDF++dPGboEGc/CVB8JlZVkuXHr7k9NNu2ho6oApWvJwbZmOl7qh+m0yPSq5CbrY5Llm5WyZT+BBgmxWIOWSyPkquFI9O7DcxQStuVxqH8CXaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egHYRjQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/+c9sva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egHYRjQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/+c9sva"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7joh1242004
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=; b=egHYRjQ5c9dk857m
	1GVsrFIPz3quNeTzgIqXmil0cUdFvf7h7n9PmetE3uefTLfiZPRN3UwklzVkwzFL
	MJyVdxyR9ofchopekrSUBEqHUnwpawuVdx/t+MpdGZQGUqndTKTF5+Iw0BjW0Vj6
	gH3/fNsBmWLWdVWYDFjmSntqLFtrbrtVih45lrTNNRcKJFNFyy+kngVPRSQhWCwP
	gayKOtNztwUhJ92JinuAAqQC9cNO698N925d6z+DvgZXU8T6HIVXYrmh/1wzciZK
	Tq6ZB+WZ9ajDzN/NZzmINDsJivCFEBzn0Va1/ntIfb/xEEAkJajHdZby0XSGz9ya
	DWZA8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjsytd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc39363cc88so7445140a12.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052598; x=1789657398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=S/+c9svaWmqDuL2zsRlHmSo/lQxmcKKygEA4iqQ1VpukJdxmqoxKMtjdDGYW3gkp3v
         m+Z9vpQ9118uI2tFdWp+7xvvv9iYM5505+VZE/LgosJ9gAQWamkoNMhR3iOmEKD1p5dm
         CEwRQ5JL3ZhND2VPrNXwGNxSmWtjb4GoQvD1Altpk+90dHjl9kbJr0MpRFb2V5l8VUKF
         q0Eykh7G+1OTjBLC6TLdck6hJZrUR8jHwjZ4WBweudGY5JwV0Q0NQkhjeGPXmfzJqjG8
         877LbtnXS8M7olAq/g9e/LlVmIQEcY7bUtiXni8MnYi/FAhp1v7J1ap6OLBIcASgPf49
         PCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052598; x=1789657398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=WDUdzXrbdxvhQHgolHLrC86U7EIDrsmupPlFz4Uxz7sENv6n6rwJBbaXuNwhc5xohE
         up6+jcZxjXEIxZI0d6gSEruye1swI5LF0OIRAnBJcSyZaG346at+gpIOHbFwd81OWbDD
         zxVJoSEpcUccDd/OiVjzpxcjOE7T5uBxCDVqc3qsqh4avo5MesyPAkyjkNVrRTfwhPj4
         MHfO7Yloib8vIziU+6VDkkdJjGzHd0XATt5ZVuSvOjUvzdzihhixGNpRXeA1do8m+tYB
         N54HcEdEevzegLsuFU+iBa+DCyWCltnuR1ALCrgh7dGJeOaAtZOtar+nB37lf9GZ9F07
         U3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwxoCqAa/djyP4joWv9UvQQQ1OXG4boD9kkaNeqQv2rxWVMToF2RK53xfyv1njDUioHgMkOSDYRFcKtyg==@vger.kernel.org
X-Gm-Message-State: AFuF++ldhG+hVt7UZdT3iRQfIYyjMHQ81IFTudkt1RDsAfy41/CALhkd
	b/2RH9eGb2njjIOkEvSUVkA74ovMN0VzG2uMkdMEMhKXSNRJ04ut6tbG/Ai5o2yR1ghjTTtfk50
	EtnzSKrYjmKPHiFPZK98HsO+Z+FdHBjsuYtcuocsQtdsoqqIg6zmjrSBW3WGpItmEmQ==
X-Gm-Gg: AYBFou0QYvVQlKEXHkB0EhfBozQwcugUzqEPSiX7kraD18yPw3BJErkIod2pQpJtlGN
	9CZtg48/65ZUr198bJD/r6NoaHykTDbGGR5eotrdrgG2V5DmdvU+CIo47jXkoANPTJAqq0u7TuJ
	B4IAjLrd6DHQrfeEK+39mVA/DTTqH0sVVcdo4WTcIZGoWgCmLukbbudtyWVNrt15a7VT1dwL/Vo
	7cNiYwBYeLM81fVJp2MFrEnRtjUESgUy6ftTlZx4mSzYsIhDBB4Z8oMExA2yQrMv0ftVkP0+cgo
	izHvGB/4IHfwsiCwH1xaiHDz46mtiwknkYweLwUXMYdpLpnR29ADXp22Js74cEQb4XSY6VjBKgg
	Or4ATxiKMvFt2Gp7S88rsQzqLP01z
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70721102637.8.1789052597882;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70720959637.8.1789052597255;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:16 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:40 +0530
Subject: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX4obosruSTe8j
 RUCthkY2eprq3SVIxXn8cx/LffzQleF7mMMnAnYU6DCrvgCheo1gCv7te5pupFs2J6Dangde6iM
 j27L8es8vmOZW7iUtuEketXjsv14R3g=
X-Proofpoint-GUID: Fvkz51XXQeu36K5_bxetWBA5qTWt7-i9
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2c6b7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6P8UuP444nAwg2htitIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX8PVEmPrHgVDV
 e6Hf0utKwguSW4nUMUXSaMFfx/glTH8UXyPNCIllRCK6AfvtPj90pewzkvQhJZzKKxm6CyqIQ6W
 ECrNvQUcQWTVwhu4Apl4ujSKBSospbXo+JRZNKMaYWGdFRCk8jeAPu9kPNOF1d5rBM0v0zP97fM
 6k80GA3Gxhz3PVgGet3tZKU6xiok6i54qL9NZxvx7IS9zWTJTSnAmlmAqZj7jIC3e0+3fIX7lB6
 /QLY/RaxgR768qojbHzFf2IhbtbaWfq4BVjqLwpybjRifV0bG6SO87MtGPrK4gGx0cfw1nlMUqu
 /fH6gB/yh0LjkVnW3mnzSazTZawMIBEb8OTudYH39F72NPzJ7SC52UxpCczHBVJOFjGxI4OYzY9
 AZkhwl6UrWy1EEan4K3dz0pIir9K+oUR+C+MXyzT9x0KgCm6IWRNoINTTquGmNHEhIeC5VaViLR
 fzYEUHJJZaiHE9gkOYg==
X-Proofpoint-ORIG-GUID: Fvkz51XXQeu36K5_bxetWBA5qTWt7-i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra CQM EVK board.
The Shikra CQM platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components.

The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
via the cpu_dai_fmt field introduced in the preceding patch.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 452296a9e67d..f9fed5c37c7f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -58,6 +58,11 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -521,6 +526,15 @@ static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.cpu_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP,
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -587,6 +601,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

