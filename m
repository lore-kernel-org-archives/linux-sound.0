Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21064355F46
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070226; cv=none; b=pdqz2+gQAJGA2MBS3xOfQ2HUW50pVl06HwaJ7SB0IczmF/NtPkCpgvkw3w6QFGV2FZ+nuCaKbIOyM9Brz7/LF3z1FMZf7nUYOuZsezgcAitKQfDa3lrStvfgHPqEkOPdNsx68O+LsmVpei4+s3GXeyC7KgzQdv9KieSzlR8meow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070226; c=relaxed/simple;
	bh=EypEwZqDJrmJfCSNQLvIDdsPJdsMZpNBzjQHWYZ6PHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJw749zx3t2x1lUhGwYIpbifnHLzseUDkYTb4ZygNRkmZhpJUc9WIuiD3mT8fHUpiDQ3BW5oA/X2K7Ie69GU0AAR6uvSA/4y/7nL10OWmcSqL5DV/8vgUCOoS+CaSo1TTkeb44eEUv6ORXOw9oUGSRBp3MUl7DukxerowvMU1rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6Fmmmng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iI/kCrI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6Fmmmng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iI/kCrI5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7053t1978710
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYszOwYMu9woHfuro6hh/8mQgNvNJfM3qxEOc3C2e2s=; b=M6Fmmmngt3+lBGIA
	vC0gzic3VH8zvfZTyNnrHRBa26fWMJN23l+D7+3Ff1S9QDSQmUsx+xxMrdhQo3j0
	/tvi4jju5Iw44tPpLkwKbShkYcSHfKzxJLYhglSdCziNyngxfpW8rxbaF9bwyUFn
	/vFGVvxWLrcd76dn+3BQt8PbAAJRaKzV4Y4wjbLHlVnMaY+0fsLffuIZ5yMZKpgq
	MO0TFd5VzLnLAr59seaUQ9zpWMIosxb1Z/FwTVGw32oqu4ECy8bCBb3tm4LjUzo2
	/3p/o+hRIn8QdMBQipI4LwWkujQEPsqshJff/wdr/6+cjxh+cGxCtK1X1GvJqsjE
	96BujQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0j6tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3538527a12.3
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070222; x=1790675022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYszOwYMu9woHfuro6hh/8mQgNvNJfM3qxEOc3C2e2s=;
        b=iI/kCrI58arMGgPnBpCQjgAKd+UXoS3+2ZMMGaD07FZE5kk65bHgCVTnahbYkb8Ocr
         /XKcFMapZETt60VEGRjSipjl73FRf/7/vriTJUQrmjFCM6RdefyUkxxcMjijFlEhL3q3
         mhrV0v9WfwYWTR4zUTcg62qwr3xW5kKt3eeFEH6ZLVT8GW1ix+awgf+FyLMtxIoX1f5j
         EHz+nYV2lxG0Nd2YbHALPiIFAUk3XeCeVXVVc/sbm5WPyHw7firx4brdbtoqRIZ3Rr3z
         tnEic2MIPTcxr4zJzSUNerHYCuH6k505HysQS4/6F4jxUficAapxJbfSxV0iyfARUg00
         JpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070222; x=1790675022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYszOwYMu9woHfuro6hh/8mQgNvNJfM3qxEOc3C2e2s=;
        b=kut69dnyHueeK2ZDBqshLbUB5bP3Vf/8D11MdNZNXcZMwFszDT6+rsPteSawH73N0Z
         49oUqC7/whJj1ohcxaulLr5ZWsLaPQecQiiSyRPk61ZviadcpG6FVhe34KiEnU2t780F
         P5HrgrhiTdWRq7LRfXcLylgMRm+K73/rvQujzuYuKtKZ8G8Xs+BrewDmVu/1U5XxI6rH
         Zm9mWsHvZteCDCvMetrWafDoLuJcFhfFxb+kZ1mjLwZSH4HB8A2CtSvLhdx3eGOIwEwq
         wKznvt/tXUOT97cbcx5reF/Q0okJgNUr41M4/W+HGgxmqWXop+e1FnKnqX/P2A/NPX3K
         vbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLBq6YhuLIR0q3sKj4CpP08Wch1dQ8kdQAAZuJA7SG0RST53d8iE5oa4FfTe0bkuDW810oSB7eg19cQA==@vger.kernel.org
X-Gm-Message-State: AFuF++m5w67uw9Hh+RQKsc6pdm06RsfKIC7Qu/UXWAC3nWvdzbMcTR0q
	qr5T+g+QA/IzhOEzQvQ9aNfUWnpum5ZMiB6PscLTS6ni0jaDlFX/vFbxew+JV6Rzikr60ge2fMn
	3outbZIrcUH/6v/QcRNMYVJyz6p4qc2UzmAb6k58rn7yKpWUlQ97x7E6Ma0p9KpTLGQ==
X-Gm-Gg: AYBFou0/Gm7hVX8bAi3kF+jQKBys+n8ozdiLqVXfDMAt3paRXzK1jtrP5ybG8HFWa5K
	Hibxs4YJYKcmufTMKoVHDQ4uuvLIWbUjO6p1+yJblC8kvDRwI238JtpsQ88MMz03st7NP1gES+L
	432/QCWb+7/BD4oevof5VTB+s1s4StDkmJZPp88RVrgVjX+NoxVvBCqvlwKlGCsKxsFCptvv+gG
	kCkbV+REHCpX+AWS6fjme9BGE0p54fKWMGFOCEGTRBKMduEtp7PgaLwJDXT0MULcI0dUigEpHYW
	FsXrgW+BHYAxzsrgRBu5X1IbnHf2lowt8qJ4tTyQnj97t0SXvVq1TsNqp2mljq7XajgqlC9+b9A
	lcohHHFeQNfbgFkOTAOtuCyRRFWhraDTG0QU=
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr786248637.22.1790070222117;
        Tue, 22 Sep 2026 02:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr786212637.22.1790070221602;
        Tue, 22 Sep 2026 02:43:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:34 +0530
Subject: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=9620;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EypEwZqDJrmJfCSNQLvIDdsPJdsMZpNBzjQHWYZ6PHE=;
 b=Y3CGqAaUq0e6KuzxUlEBDMkwLdRr9CQDy+n07yBJ4FqN3rE0fR9xR3i5IHL0oAaLWcijvZ4IM
 hAV8OzqR+7uA5fmI1KAVw2HIC0IL6XehMUv7vpJ7J2yV4C/rI4RXaml
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: IVDV7ky3DG3_29gEkOC_3tCTcygQtUgc
X-Proofpoint-GUID: IVDV7ky3DG3_29gEkOC_3tCTcygQtUgc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX6RMTuws1Z2FA
 EmObaBlrZQK6kwvMeDaX76mCiy/HKnocwxR6sKKURnFYy3o9Fxi3AyiCzrM5h+G+ncz2YYo02Ol
 iETvEPh9S+M3waqNnF16MHZD8SoKzSv/5DQXtBAIV7yo8b0+gMV7FWlTQayjK7q7f/kXv+5y/fv
 8AQ3ZkVlzjg6yJKlSxtB32Y4G/SGj6/ppQ5/MXm5/p6T/sio+iJ9BQrUhfYbxcvLVpn8q/MxL2F
 Q96Dx7I0tu1r/021x/IBG5iKy2JUNl8WIBY7oUEziEfcGIKh7lB/KrRbB2X1I3JONFRpfQFDIAi
 6MXvSD/erOGljnI8zLsWYLMzxmoiVZ1G5hGDaImF4thxlll+qKyzHpai3Hh5kn58+gaZ3XLH+ix
 pArzHZ65dlGDoKRD5l6yn30umzr+EB1Vqm+awoIwk8JaLRKI8rprBNWAt8tSUSHICrgwknawvGN
 Nf5Ks7eNmxMJm/hTLpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX+5y9/h6gjgee
 5vGLKsetei151IvjaDLY3GPRCQARpl3XEhuRZL2GH9LKUb+kz3CNEHcR+AcXf9jG6GrWrqhZ/8S
 3LwxChfSwzobZFwZzX8LdNIzfC+vyKs=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab24dce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zFky0nD_-0bCEmkCyRUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

Update the decimator source selection logic to switch between DMIC and
SMIC sources based on the active input path.

The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
the SoundWire mic mux, so a mixer write to the mux that is not part of the
active path can leave it stale. Program it from the resolved mux state
when the decimator is enabled, so capture does not depend on the order in
which userspace restores the two controls.

Add a helper to detect whether a decimator is using a SoundWire microphone
input. Use this information to skip DMIC-specific HPF programming sequences
when the decimator is configured for an SMIC source.

This enables VA decimators to capture audio from either DMIC or SoundWire
microphone inputs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 144 +++++++++++++++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 02dc3346924f..79abbdd158b7 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -794,10 +794,22 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (val != 0)
-		snd_soc_component_update_bits(component, mic_sel_reg,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+	if (val != 0) {
+		/*
+		 * SMIC enums use shift 0 (lower nibble of CFG0),
+		 * DMIC enums use shift 4 (upper nibble of CFG0).
+		 * Use e->shift_l to distinguish them without relying
+		 * on widget name comparisons.
+		 */
+		if (e->shift_l == 0)
+			snd_soc_component_update_bits(component, mic_sel_reg,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
+		else
+			snd_soc_component_update_bits(component, mic_sel_reg,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+	}
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
@@ -978,6 +990,16 @@ static int va_macro_enable_dmic(struct snd_soc_dapm_widget *w,
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
@@ -987,7 +1009,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -1004,6 +1025,17 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
+		 * mux, so a mixer write to the mux that is not part of the
+		 * active path can leave it stale. Program it from the mux
+		 * state DAPM resolved for this decimator.
+		 */
+		snd_soc_component_update_bits(comp, dec_cfg_reg,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+					      is_amic_enabled(comp, decimator) ?
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
 		snd_soc_component_update_bits(comp,
 			dec_cfg_reg, CDC_VA_ADC_MODE_MASK,
 			va->dec_mode[decimator] << CDC_VA_ADC_MODE_SHIFT);
@@ -1018,9 +1050,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
 					      CDC_VA_TX_PATH_CLK_EN);
-		snd_soc_component_update_bits(comp, hpf_gate_reg,
-					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
-					      CDC_VA_TX_HPF_ZERO_GATE);
+		if (!is_amic_enabled(comp, decimator))
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+						      CDC_VA_TX_HPF_ZERO_GATE);
 
 		usleep_range(1000, 1010);
 		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
@@ -1046,7 +1079,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1246,6 +1278,39 @@ static const char * const adc_mux_text[] = {
 	"VA_DMIC", "SWR_MIC"
 };
 
+static const char * const smic_mux_text[] = {
+	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_MIC0", "SWR_MIC1",
+	"SWR_MIC2", "SWR_MIC3", "SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
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
@@ -1381,6 +1446,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
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
@@ -1525,6 +1595,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
 	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
 	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
 
+	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
+	{"VA SMIC MUX0", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX0", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX0", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX0", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
+	{"VA SMIC MUX1", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX1", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX1", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX1", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
+	{"VA SMIC MUX2", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX2", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX2", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX2", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
+	{"VA SMIC MUX3", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX3", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX3", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX3", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_MIC7"},
+
 	{ "VA DMIC0", NULL, "DMIC0 Pin" },
 	{ "VA DMIC1", NULL, "DMIC1 Pin" },
 	{ "VA DMIC2", NULL, "DMIC2 Pin" },

-- 
2.34.1

