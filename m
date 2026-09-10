Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32DC415B87
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033676; cv=none; b=aaBxosIHkSrT10QTwmg8mz/egwkLlcxjtEQTpuw78KXEjhS621uFzHbV296XcZp8NV/9CjYeaS2rUxZMguLLPVOLPvvX7J7k7L/4K/0Qmi04hhGJE2F/WTiLBFYW2IJ5M6wormrhuvHBxAh9VwpJmJfCozTnjFz1Bm5AlN29+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033676; c=relaxed/simple;
	bh=KP1B8jmPIOUAYbYtsBM367GDomMQVaWtZeTmopGWkOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iM0kkj7wMedqJoPV3E5ABkwDqm4MWxa9mQ6mjDhzDGZ/9O8LkpR24xBgDznS8XLELAvMfLgR13IffyD4lxhrtiloIDmpY+ik00sx+YCxp4DU/xxj8OoHvrjw2S9a/eVaVEnIqqyaaUT3+A2yHFBTzWaNztLBYnenR1TqZj7APm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuvZc2MH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=az0OYXyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuvZc2MH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="az0OYXyp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A96J013486533
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVUqAvMiB9JAsaFJB5FKDKFdZN1MylnMLuxwGAm+HZg=; b=FuvZc2MHQ9cEvqGF
	84p70F59o6lOnIrTiMfDyuov0CLj4b1L+NniK/J06FL0qINneXSry620vsx5IVUu
	wTSa5yeO9UYwJnP0tNKxfnQolqu75dP1IuW/xNIcVXQVFpyDAe/7JL60B52Sbf8c
	lz371/RCXWoGDvvhJU+sdmRUKThkdwueCZhTmvWCAi6cQX91jURtNoKA/LYcy4MK
	noXbuD3YVFfwG/2/K21jnyuFVtYX9Jqsxpp48Q3yXHgET+5SieypTdGbKvOAsIou
	D99ezdB5rh0X7XatOHCFXDVHgwPcHi5SKxR6VyPkx1eyuwpZtoOIK3tPRMjiRwEf
	YrFR5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r7f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so7240534a12.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033669; x=1789638469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVUqAvMiB9JAsaFJB5FKDKFdZN1MylnMLuxwGAm+HZg=;
        b=az0OYXypBTQZbWUHPh6lcRXfrMEnSEmdfgufpIKntZLnUBkR/vDH7+J/cLCO49oSIY
         5iL+rAYwsFviUZGNpE5gWTmJtKqRZyp9zbiVCG68ebEc7QIAKXtbEfUXnu23dgZ0BRDK
         p+iEq3aTv0jFzqA/oY+vVITYIcX7D0V+3ERFuh/ipAgDn2yCvRlWNjuHPwRAGjsSwzfI
         jKdpSYofni3JnibVUWD5Cnp1nwDsKzP7a0aDpDgM308VXTo5ZQbrpHO3/31myqEolEqU
         xicQ/cAWzrjrVypuu0PXAxbBFOQgIy8VC0VW6jddn2+IaZUHdzcv4LReHiamzGe3rKlH
         hSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033669; x=1789638469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVUqAvMiB9JAsaFJB5FKDKFdZN1MylnMLuxwGAm+HZg=;
        b=SBEo8Q7Kxdq2nKR73uySFxBnIcxF89aBxielAfKNx+vBBuZnNzxQMjcvDvFPmFfg+i
         8ddYAsmX+l42w8fwFUSWVAUCSX9IDwcxqUVICJnpZaOx1d3sG9hHtuGXYLW9uJE3fu2H
         BH117NXDyCXWc03fJ94OF9uC26B51geIkxoFzbM/PDYBH5uhIyDKvNn/5phKrblEzAZp
         OLA1w6889L/0zTyoAdMejXQqWHS1q6J2LBX0yrS0d9x7c+QbqP2XFvcXB80cXADgJ86q
         gDGUpOWO9BnmzGpzQUHApVTAVdismITiR8GD4jGltkQtSMGuIDbeRsHIqgHqaMizQny8
         hLJA==
X-Forwarded-Encrypted: i=1; AKwUvBzkdQlXuNSwXM6AwgYJGaJsWfsbOWS8SMBXINPO3jNlsA1KxoHb38KulJb22MVlIK74aefCwcqRcN89EA==@vger.kernel.org
X-Gm-Message-State: AFuF++nHTL5+v0NoqZ7ulv2PAlVbzE6l2r4krfMnMAJcT3xYJC5n+HAK
	mXdsa249uXwpF6wWb4GWPj/CZDgbIFYD5hldwZ+F4PofdO2+fp9aAH5JDtrsWWPwvsC6ouoiHe2
	xBdBfdWVjKGnB3sJ6BMDJtC9gd3MABmSAnduzXfN88OSbq9Kir8CiTMsR7DPIy1eHfQ==
X-Gm-Gg: AYBFou0OtN2133Wd7uF1+2Ra58SMX/Y651dQMcrkzwuSM7xCrErKn1o9Q7b37PsmXfN
	F0opu3CEZ6mVK1s3lpp2jtwNG1097Qzf1i8IDpt6/za388u+9Oz/67oqTerZbc+bJ3Yh4hg3Kxy
	ekdQNHMh4GAx4WzrC0pVO8xBOqrIzx32zbUjsykU4g5Pu+QNhDRyR/ya/Ep7FhCgYZLxeLBmlec
	ufQy/h8rH7f/F1K+6SulcodvIL+DRJlab+nn2Yo5ofz1W3ddmYcULpgboBN6Cxv4Qr8ZJ+HunIs
	eZodOwmCur7Vh2ObV5bGSAtwNwN2jZNlatLIAoDBcsnhY4YwuWvIGUK38D/YOJ2flhVxR9KzQv2
	bkIiVS2wzJOtAdemDZjv/7olniWYqBR+9uAqr
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr59783245a91.25.1789033669251;
        Thu, 10 Sep 2026 02:47:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr59783179a91.25.1789033668684;
        Thu, 10 Sep 2026 02:47:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:48 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:57 +0530
Subject: [PATCH v2 6/6] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone mux support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-6-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=8793;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KP1B8jmPIOUAYbYtsBM367GDomMQVaWtZeTmopGWkOM=;
 b=tAoTM+NNc/wOj/T59GNUa+VqadjqjnW8oz62MbPnezTia2VDh+NvlXtgv9MBcXpS27Bh0eIR+
 4VtMR48cZwbA6lX76SRcHj9IZ/nYWGC5ljEFbzx5AV7rYWlKKgm9Dne
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: Fd8SrgfrqpyvZlvz2M1NZ93ojRCNHCA4
X-Proofpoint-ORIG-GUID: Fd8SrgfrqpyvZlvz2M1NZ93ojRCNHCA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX3OMuwjTMbbds
 nVGEhzr0uW6F2+w32/6InTHYqPFXOBqbpUfgkMrnPy7+NuBeKLi7Y2VEKk26w/r004IObaUFBhR
 m1hMeznAPYI+MtjfBblKoTlKshqOOSF5ABIN8leevsxZm2V1lIsCZNkVCGJoVU4oM7NO4aSgQEY
 XO1RAOek2fDBIqziLFWvpaaqYWKpajbGIbs7Dqvh43ltCk7FxaZ/kwziugoPCviXpJ6tTzSnRAf
 0MDm8DWAqki8p5RFN22G/GTi1x8mugsJnrKZVmAfRPlMPgTtFR96cDs/WwrsCmZj07B7oDRXjAv
 UPjHDVMkf+2F/+yKLJUXM8D7XsrloJacpQYxCBxdaB0+R9G4P6NkLBSy/cickPXxQNWnpts1FOW
 fxacdRAz2e4qX4jJOtcOd+em4Ejm78p+7ULsywDpPPHBOpNPWCl2utcM7XxBYLAHNkpchkRfaV6
 fsYGxq8Fycbtrc+hT1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX92FyYRTPPZwT
 Gkdy7rdHwyw2pkkMFJw32hmhUnhqlt3TTs0wfwtMVWAEKrIifxdB/WynY35xLj+UUFE4+XF2fxp
 mvIfDKPXr8y/yqvNqSyahcRzmeNDjlY=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa27cc6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=76V9-zZnIusTmnIAdMMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

Update the decimator source selection logic to switch between DMIC and
SMIC sources based on the active input path.

Add a helper to detect whether a decimator is using a SoundWire microphone
input. Use this information to skip DMIC-specific HPF programming sequences
when the decimator is configured for an SMIC source.

This enables VA decimators to capture audio from either DMIC or SoundWire
microphone inputs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 124 ++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8353921f7..46f35a984 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -249,6 +249,7 @@ enum {
 	VA_MACRO_CLK_DIV_16,
 };
 
+
 #define VA_NUM_CLKS_MAX		3
 
 struct va_macro {
@@ -756,10 +757,16 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (val != 0)
-		snd_soc_component_update_bits(component, mic_sel_reg,
+	if (val != 0) {
+		if (strstr(widget->name, "SMIC"))
+			snd_soc_component_update_bits(component, mic_sel_reg,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
+		else
+			snd_soc_component_update_bits(component, mic_sel_reg,
 					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
 					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+	}
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
@@ -940,6 +947,16 @@ static int va_macro_enable_dmic(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static bool is_amic_enabled(struct snd_soc_component *comp, int decimator)
+{
+	u16 adc_mux_reg;
+
+	adc_mux_reg = CDC_VA_INP_MUX_ADC_MUX0_CFG1 +
+		      VA_MACRO_ADC_MUX_CFG_OFFSET * decimator;
+
+	return snd_soc_component_read(comp, adc_mux_reg) & BIT(0);
+}
+
 static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *kcontrol, int event)
 {
@@ -949,7 +966,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -980,7 +996,8 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
 					      CDC_VA_TX_PATH_CLK_EN);
-		snd_soc_component_update_bits(comp, hpf_gate_reg,
+		if (!is_amic_enabled(comp, decimator))
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
 					      CDC_VA_TX_HPF_ZERO_GATE);
 
@@ -994,21 +1011,20 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 						      CF_MIN_3DB_150HZ << 5);
 
 			snd_soc_component_update_bits(comp, hpf_gate_reg,
-				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
-				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
+					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
+					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
 
 			/*
 			 * Minimum 1 clk cycle delay is required as per HW spec
 			 */
 			usleep_range(1000, 1010);
 
-			snd_soc_component_update_bits(comp,
-				hpf_gate_reg,
-				CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
-				0x0);
+			if (!is_amic_enabled(comp, decimator))
+				snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
+						      0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1208,6 +1224,39 @@ static const char * const adc_mux_text[] = {
 	"VA_DMIC", "SWR_MIC"
 };
 
+static const char * const smic_mux_text[] = {
+	"ZERO", "SWR_MIC0", "SWR_MIC1", "SWR_MIC2", "SWR_MIC3",
+	"SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(va_smic0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text);
+
+static const struct snd_kcontrol_new va_smic0_mux = SOC_DAPM_ENUM_EXT("va_smic0",
+			 va_smic0_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic1_mux = SOC_DAPM_ENUM_EXT("va_smic1",
+			 va_smic1_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic2_mux = SOC_DAPM_ENUM_EXT("va_smic2",
+			 va_smic2_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic3_mux = SOC_DAPM_ENUM_EXT("va_smic3",
+			 va_smic3_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
 static SOC_ENUM_SINGLE_DECL(va_dec0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG1,
 		   0, adc_mux_text);
 static SOC_ENUM_SINGLE_DECL(va_dec1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG1,
@@ -1343,6 +1392,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("VA DMIC MUX2", SND_SOC_NOPM, 0, 0, &va_dmic2_mux),
 	SND_SOC_DAPM_MUX("VA DMIC MUX3", SND_SOC_NOPM, 0, 0, &va_dmic3_mux),
 
+	SND_SOC_DAPM_MUX("VA SMIC MUX0", SND_SOC_NOPM, 0, 0, &va_smic0_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX1", SND_SOC_NOPM, 0, 0, &va_smic1_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX2", SND_SOC_NOPM, 0, 0, &va_smic2_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX3", SND_SOC_NOPM, 0, 0, &va_smic3_mux),
+
 	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd-micb", 0, 0),
 	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
 	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
@@ -1397,6 +1451,14 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("VA SWR_MIC5"),
 	SND_SOC_DAPM_INPUT("VA SWR_MIC6"),
 	SND_SOC_DAPM_INPUT("VA SWR_MIC7"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT0"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT1"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT2"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT3"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT4"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT5"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT6"),
+	SND_SOC_DAPM_INPUT("VA SWR_INPUT7"),
 
 	SND_SOC_DAPM_MUX_E("VA DEC0 MUX", SND_SOC_NOPM, VA_MACRO_DEC0, 0,
 			   &va_dec0_mux, va_macro_enable_dec,
@@ -1487,6 +1549,46 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
 	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
 	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
 
+	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
+	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_INPUT0"},
+	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_INPUT1"},
+	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_INPUT2"},
+	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_INPUT3"},
+	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_INPUT4"},
+	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_INPUT5"},
+	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_INPUT6"},
+	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_INPUT7"},
+
+	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
+	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_INPUT0"},
+	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_INPUT1"},
+	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_INPUT2"},
+	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_INPUT3"},
+	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_INPUT4"},
+	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_INPUT5"},
+	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_INPUT6"},
+	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_INPUT7"},
+
+	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
+	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_INPUT0"},
+	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_INPUT1"},
+	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_INPUT2"},
+	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_INPUT3"},
+	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_INPUT4"},
+	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_INPUT5"},
+	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_INPUT6"},
+	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_INPUT7"},
+
+	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
+	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_INPUT0"},
+	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_INPUT1"},
+	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_INPUT2"},
+	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_INPUT3"},
+	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_INPUT4"},
+	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_INPUT5"},
+	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_INPUT6"},
+	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_INPUT7"},
+
 	{ "VA DMIC0", NULL, "DMIC0 Pin" },
 	{ "VA DMIC1", NULL, "DMIC1 Pin" },
 	{ "VA DMIC2", NULL, "DMIC2 Pin" },

-- 
2.34.1

