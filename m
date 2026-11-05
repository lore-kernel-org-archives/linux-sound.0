Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877082;
	b=ZDqONRihttKtl5+Gn5U28mY70pRDKnpS99GFqF2qiSgXlxUnPcXCl5E7oistn8MlCptw
	 MZGGKX5qcNMWbe5lSqwe3pMoVjj+YsHCMbW5pcRmE22x04GdSH2JFP0Wa61QOJOShlWqX
	 sJaEcK9uT3jwnY98bFpkVPDxOyZDriRkjFe6l+PGhTAow275orPlRgk9JJcGRtfg8+AG/
	 KjWBekplUUjPEzalGZ7SRhWGuoTZsxWUTJh08/WRP+mdVPYrk4eAo5ydvrvcEWrCIQdHL
	 r4sVt4WqQqUCPAJm7H7PsDcyKz7M43BC3HQ3aQX1whvXJGSi12C70CffDz+J8TYr1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yTeOtlEwEsdphaMgGiefGlXdYAMFcQOLa4q1x12qI/0=;
	b=iAIDLhu0EdCeHdiwGv2YNosUTIyIvrAj1tJCCH9F2og25Q11mRBsnvFoErv4QHJzrTfG
	 MxVQwaHHybaDGGZTqMk0XK80SaBj06faDEqamXM+w0yUGOiHwAU0FfUEtfsbJUwcmW6aK
	 2Dkd+4rtzLmyG0naEYREo/LTioTHkhlPbEeE9MBkFEVu5VDhEXyMZQKmjNeBnl6UPUyuz
	 6TnkuHHO6cTbqvv0ScUTiefC2/iQfYzqEd4iLedlUaNEnPncki7cbrEInxozaNfWdmbKd
	 VLhMiSa4OYSYt3NwMmWnMkkaWVSYKnwYM1YabwbXzu6sLHKLWGXQxpVT3JgL6SvQuEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AfnLivhw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdbatgpI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F4606A333
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 11:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75F4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AfnLivhw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdbatgpI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3L7D3193503
	for <linux-sound@vger.kernel.org>; Thu, 5 Nov 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTeOtlEwEsdphaMgGiefGlXdYAMFcQOLa4q1x12qI/0=; b=AfnLivhwo+aejHlw
	Bn8+oZL/AfCKHHXQ01c11km9Q23PTVMZlZXW3Ed8Nnv3fWiNxot6QAqVYA5JPMU5
	gSf5M3DaRvMPqbagiedIlUm4vdoPkSLLE++mbogvW6VLzYAh5dDxNT0wT44Gc0Ri
	uKfnrNt/eHnnIoA2fn9OKZ7zEV+VMwNzqZnTw3vnAEACvvfrSooQ32SDWB3ywasu
	/AyOhvdqi8+UxeTR2+oDOV9T/5k5DI5RjM1C9Ydwg3jtEZ1NmRYZ/FriYrgNZcoy
	mznrTmRDcu1y4wTqs6H/PaMkyBUojOapK0xwMm2PsQVnnXfUySdqVDxe6TuYaDkl
	xS00Yg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr10q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 11:11:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3197662a91.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877080; x=1794481880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTeOtlEwEsdphaMgGiefGlXdYAMFcQOLa4q1x12qI/0=;
        b=TdbatgpIChLGCHtULyrx2M2KXr4qE0e8l6+UAExvCO4I3qnb4kCqd1VNwHwfyouEQ8
         z7g2ho4hK3l/DqbkDqEcZP2H2YzIbo4X6LJLxj2ucKUtCWn/HG4njXkMbHsMVF/ZrqDj
         g576KSETzQN0iGB1D51dpL+QozYHsIS9Ge+uR6B0jKxjyfHA5xa58HRFOWxR6zKJ7dq4
         6UdN/1My0ZwPglNtYgHmFep3amR17/0UNKE4c+PZhY9Hwxi7Z2WZIp+HToyGHI0DWFqs
         sgK9mcYP/otwH+zkkiY9CFAARe+LTM8ClJnFA35As6QHTIABwLFdS28Fr1x74sYOPH+/
         BXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877080; x=1794481880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTeOtlEwEsdphaMgGiefGlXdYAMFcQOLa4q1x12qI/0=;
        b=SnOqZl5U9Yg4hJSiDMY8zmKXMkqeq0t0IYx2FK0i/Y5mVq3f109M6itKSjJcDUe3+Q
         LeZVo386rcHBEMEpcmsrw4+5qBtTizTtByvbcIO+9RLAXcHeZtYwV/vb03QKiHPlSIMy
         Ksxa06cwysz9UrT5KJVg3INmiZfAbHPeNH/eTya0yrXlGAzTDg8D0PEBw+JyLgUC9rF8
         fvjQYCByveNczAbOeDv1LPwDKrUoh5F1ne1FtEB5Km9Zl3hbfptvbkcnwpxqc7+CB8Sb
         1NsQSPT7+fk2e1hiSzMDIXJWiIefLuMELRgH3hp6MCnBWnBf35aN25iwki3baq1s0Jk0
         cZiw==
X-Forwarded-Encrypted: i=1; AKwUvByGYRODcuy6X+AcaUZUdhIT7h8Wx1tEOIq1/OCcw5hr0zqDi+Kz2P+4hSfrRWNOY/NCI6wLbaaoZrAcvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1h9pmRYVwc6RKnU79a2QbXh/ptRiXPnwthtaXRedgd2AGoy0R
	oTr1WCWKDf+myfcu3WIsvzHFg9qcsY4lqjRAJjDp7Sin2ySUau3r5FQwmi8FHeJS+0Rs8odS2Sm
	OP1rhE6J+Ja08K8BaQ6fHVOlUQr1L6hKrZnobFurIZvTFcdoQeHeQJpN4NiUjAJ2g0Q==
X-Gm-Gg: AYBFou0yvs2JAmpPCtUahz0pC8ofGwtnKAYgZecptcunErb0Z3zPBvv7lFi12IK2pph
	ptf7hCKtkUHCwqnSVbvynCG3+081nEUgTnq7SopSCWZ+NJLMJ961Z6UAi5ZLj1p+2ERqmrKMrcw
	afh4XA4kuEByc5ErY3Fql25d9WT2vsItPp4iBk9EUlB1BVIhIRtGztdwbSuOrOm1jlV/rk4xUZR
	URG3bkfpQr2omdA8iS6CR0nk+GESQ6ptOXQBC/m2+HHp5vTOJhURKF+xQ+rxH3Hi82FdnI7TdN+
	Yfub/FsFgfJkA9CbmKACrMTZjazNWn3tFfYCiHc1yh84r3XoJJOTiG1P7ojUEczMu5uWa+Lpoy0
	LjQfT74gys3gfydp1GXRoKFKqYm42DOe1z9sy7RKnSduXRarthRYP27M9jWdIezrtWpaR+EOXHD
	Ffdkr0jlqr
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr16929822a91.11.1793877080188;
        Thu, 05 Nov 2026 03:11:20 -0800 (PST)
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr16929797a91.11.1793877079749;
        Thu, 05 Nov 2026 03:11:19 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm3384737a91.9.2026.11.05.03.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:19 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:40:42 +0530
Subject: [PATCH v2 v2 1/2] ASoC: qcom: sdm845: apply the SLIMbus channel
 map to wcd934x only
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-soundwire_channel_map-v2-1-5efe2021552a@oss.qualcomm.com>
References: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
In-Reply-To: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877069; l=3154;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=JSfDc/6E+r4Pn4wRWJrxLZb6uJq2H75D5ou2M9jNEQ4=;
 b=UzezXvAV2WmzKNy38hVn4UaFG5rPcieMoqExIUd6YST8RU2SbGOKr2VQZc6ZBdheI15M7BCP0
 j/QKQgNz4MLD7zTK8alrk91xEqxcDShoCQMNcEsj6SVDy5T1B+a5+Bu
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec6459 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NB-e7y6OY_xqT0WZjLQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: vQIp-JYYjSF7qhGCEdumSAl-EWwnqL7k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXyjeaPmM68X0L
 YtVS7fgAOVKFBhZQaGL2zvug3foa6mWvrDJvqUG1Ny6QV8uO0zUs56QU1KbJCcQZ4LbY6UA7RKV
 WRVrh9n2y4Qu92W5UvF+SuI8FTZH0U0=
X-Proofpoint-GUID: vQIp-JYYjSF7qhGCEdumSAl-EWwnqL7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX9a4ne1UjUnEM
 ufgoBlBmG80g8Fu+Bn9j/HV6GWCzDpkkNXjI7OiNiSc9jGZUGVpWLTl7GDgeDByfZZaJCLAtcNc
 jbIfhT+iRZe2jCWN2gwrnTynpFFlDrafWlqqWQq0EAv7YMn2jJbh2VsdzJ0CXPSJEuCF6HyZsaX
 ykOdZZ+42nn2HdbD6hnNpqh4lm+1C0XP2bYnXQIRU2WV8K9p8BqGMX+MqffdpVr3tHJDjQjy9CR
 wdmSjxxLc6cfIII1nxIYU4TJy1qleXETptO9LE8EQUylf9gCc3mkbzoY8B2s59NRBIFVSq72cKh
 y8ltoqdxkXWjlMESWIuiBvfGk0AFDwCH/xmaO5QAgpy99ExzVj1dWxo6dyaDpevyq3EfGq+IP7L
 99NWsghyWzUW/6hlSP/9CGIx9ZxguLL7j6V6CdrppLBkCVPtCfYv3V87Ka2lmTGcN2gUb1bR2TN
 Q+zWFgVf1ONKmdJ/51w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

On sdm845 boards the SLIMbus backends are described in DT with several
codec DAIs on the same DAI link. The SLIM playback link lists the two
WSA881x speakers and the SoundWire master embedded in wcd934x next to
the wcd934x SLIMbus AIF:

	codec {
		sound-dai = <&left_spkr>, <&right_spkr>,
			    <&swm 0>, <&wcd9340 AIF1_PB>;
	};

sdm845_dai_init() walks all codec DAIs of such a link and calls
snd_soc_dai_set_channel_map() on each of them with the hardcoded wcd934x
SLIMbus channel numbers, 128..143 for TX and 144..156 for RX. Those
channel numbers are only meaningful for a codec attached over SLIMbus,
and programming them into the SoundWire master DAI configures bogus port
channel masks on it.

So far this has been harmless only because neither the qcom SoundWire
master nor the WSA881x codecs implement .set_channel_map, so the call
returns -ENOTSUPP and is silently ignored. It starts corrupting the
SoundWire port configuration as soon as the master DAI implements that
op, which the next patch does.

The channel map is not the only wcd934x specific setup in this loop. The
codec MCLK rate (WCD934X_DEFAULT_MCLK_RATE) and the headset jack belong
to wcd934x as well and are broadcast to the SoundWire DAIs for the same
reason, relying on them returning -ENOTSUPP.

Match the wcd934x codec explicitly by its driver name and skip the other
codec DAIs of the link, so that each codec only gets the setup that is
meant for it.

The bus type of the DAI device cannot be used to tell these codecs
apart: wcd934x is a SLIMbus device driven by an MFD driver that creates
the ASoC component and the SoundWire master as platform children of it
(wcd934x_devices[] in drivers/mfd/wcd934x.c), so both DAIs live on the
platform bus with the same SLIMbus parent.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sdm845.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 85951397cb2b..7137c9c14d8f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -234,6 +234,19 @@ static void sdm845_jack_free(struct snd_jack *jack)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
+/*
+ * The SLIMbus backends list the wcd934x codec, the SoundWire master
+ * embedded in wcd934x and its SoundWire speaker codecs as codec DAIs of
+ * the same DAI link.  Only the wcd934x DAIs take the SLIMbus channel map
+ * and the codec clock and jack setup below.
+ */
+static bool sdm845_dai_is_wcd934x(struct snd_soc_dai *dai)
+{
+	struct device_driver *drv = dai->dev->driver;
+
+	return drv && !strcmp(drv->name, "wcd934x-codec");
+}
+
 static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
@@ -301,6 +314,9 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			return 0;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			if (!sdm845_dai_is_wcd934x(codec_dai))
+				continue;
+
 			rval = snd_soc_dai_set_channel_map(codec_dai,
 							  ARRAY_SIZE(tx_ch),
 							  tx_ch,

-- 
2.34.1

