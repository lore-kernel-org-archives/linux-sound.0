Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF42314A8D
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029316; cv=none; b=ZOiN3P3oaohEGtWc3BDj4j5+KQ9so6h2HKMMAKn084fC2+dssXOJRmZee0JOxMl7/k3aOo22Wv0Z2gLSedUjF75/hKufI6h5ijG0NzSylOPUzJiV/ZNkn1NqANTKC6jOEihjBP21i+NPcufknw69HdP2ySnQmOpwhZqjmJSTtWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029316; c=relaxed/simple;
	bh=cNZmh6AjGmVuI6dqRdL9kt7zMECo7WrVHLth+4kAagU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4r4CNvjYcuuR7q+tgdN+NGMSP0fsVq19Fd5kMnU32qUm3PX2EWtvg8UwLLJ7s6sxCG0Wr4/0ECnJni4UbPpJMFm18XPJWmsBKy+sHWGKqkF9rAOmATAd4Ej1gV7BPBNEGhJzSLyR8aweMugvfJp153UfdBUQyn9zCiEUT7s1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUISKL4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUISKL4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAAdlJ012749
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcPEY4Ke5nuiKZr0aJIk8Q1LmBCWPFe9PnpH5t+9CaA=; b=oEUISKL49KqfUR1U
	8PCy5m5higQofpGx9VHECZMaj8nB+FJOkkuh31hJWM8XCRDmEFOlAibaqMvNWBTd
	wmrILNTTL+odLqbQfbvloT28uqO//mJuwyRgZgIqjq+V3HCvScapRN3M16xYUGBj
	ESp9IweAid/xSkHjYwfnLiV2c5nfs3kqwXel4uJgpZGNpIOVCrhf3Pr9XXUBA337
	FKAyrOrGYihzujZeMp9ll1RYmOWkrowx88eICRN+WBmrtZjcJoDPGvrJdBDvFrhs
	LbU4k+wyQ1sn7iJ2f+Ooyysy+tBfCpC6EbjOdUHcstwmcFtg179M+jc28kSsElCG
	tIP8zQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072ry3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:28:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-770c244009aso64420646d6.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 06:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029311; x=1758634111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcPEY4Ke5nuiKZr0aJIk8Q1LmBCWPFe9PnpH5t+9CaA=;
        b=ATGLOCjzgvMdFgdzCvJpPFWVdTB1YKD2p3w+eKj/Koiivf6kqTyg50uRmjGD9QD2kX
         zMZC1QOn6OSfm/fZJJEU+ENo3aQgsr4qvp9zDnjD72HE9nRmSNDPbmqJQ2Xb0VBhjKGV
         4yVtnLrnFfsC5l+kDRFB60mV7iJadAVUwtoMOABbhl96W+jF0cpgsSHbxBfU0srgT4mv
         tG16ueRTZwPN9kJ518FgIPxW7YpBrXbmclGNbCfebbYLqS+A1Pv/4r8pPUzklTFc+hTH
         Du5eCvVpXPWoicivSv5vrk5kq3DWQgCUyvXa90zGC5LHl9j5QA2cjv4oWeQTZEflcF40
         IXbg==
X-Forwarded-Encrypted: i=1; AJvYcCV81hsHHNJU3hkzdQwclaHSSkDHdKLF5v5Bl/Mp7cw6BJfBciXP9OGxf5cfG9oPuVIneZGT+B5lW3RKqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7gfwiJ8ymcWy0ECRplNZIAYox/jUFbr64g6RtQv74kGZGw8Xc
	l5mKXqz/iQrhSGpDyKNWqkKzXysgUPITZebP+KCjt+LwyiIMRREvJSbazb/iUgyofdl2uqtOVcn
	99KSPRJyUbN5IAjRXb9XaFl0DDBdFfGCr+z8Eum40+gG3uHmk130qAQG0qKKHYm15SA==
X-Gm-Gg: ASbGncsleqk/Xt86kjwYtFdAEow6T8cjNpmPvsP5pNKmDkDBFR7zinmCw5MAky+hpUW
	VpLBEnzRgkCRmbTCO5oWmCWSXevjsCpNXsB8IiemjhtIfm169t2PL7WjK7nWMS0TQJEcBWTL0mx
	iS3Su8k7GRGyAtC1LkDwwDw5RA+qJW620fwb+ypLLsjf7pjdEQ8pMHFKyp+bg95R0gb7xTnkDu/
	hzRxTYNOYQKdxpr+VwRvCml2PcftPiBuJ+gdcEhIZHKWZKx9lXENQpADD39cBi47NWrAqEPeXZ+
	J6wi4pvWhIBIIBNDkUlIns7bPFo89HEXAKj7DRletEa7MaCbIQFZzMWncBsD2WAj5is=
X-Received: by 2002:ad4:5bc9:0:b0:70d:6df4:1b21 with SMTP id 6a1803df08f44-767c5fbea36mr184871716d6.62.1758029310765;
        Tue, 16 Sep 2025 06:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4K6xfkI1Ksw/7b17XodhPiyVnLomocyJrvt2hEYJpdLNG4U0tk9auJ0DVkHvIe0632tInog==
X-Received: by 2002:ad4:5bc9:0:b0:70d:6df4:1b21 with SMTP id 6a1803df08f44-767c5fbea36mr184871316d6.62.1758029310240;
        Tue, 16 Sep 2025 06:28:30 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e9a591a41csm11531787f8f.7.2025.09.16.06.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:28:29 -0700 (PDT)
Message-ID: <7f0c54a3-642a-4516-8f9a-3c10f5e3b8a6@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 14:28:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add PM4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        christophe.jaillet@wanadoo.fr
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfXz3sB0sQSO+Ah
 FrcEJT6EkyPJMDXQJDfkDDlN3UrVCNpSrQzBSsPv0h1hVXNETKSEpirPJETUz07gJ5VQEiYdJE/
 E6vs4TauoAx5r0EyJtRRBfeTeGdd1ekHoagL3vpxSZ8XzxlJeGUaPXyQSwROWwmyYlCY/MzuiWA
 lPqBJiJMfugV5dXAooQBT/EROvt1kkVBIcijeKRiFR5zRiDNOQ5GqyPSLD6vkqw9hI9jU9F0AgQ
 J0JhlOgicD/FF1idHVoUu+1QU2RHNF3E2WHsor0/30UcgcpFME/QmB9o825T5zbT0Ge0Mzo87lG
 8YKE9G6T+l6r1h2ZPNUCXVstf0Jz45+AZ2DJQi3cvZINHyKTqQeNS0w7iBh6BEl8DSdHN5WjWPg
 RPIRvFPa
X-Proofpoint-GUID: i-KfctBxyJ6_GchGlJgmqCaVnBuuqFGA
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c965ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=GUb2KgM1ivsW4YjGMDAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i-KfctBxyJ6_GchGlJgmqCaVnBuuqFGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025



On 9/15/25 5:27 PM, Alexey Klimov wrote:
> PMICs like PM4125 have in-built audio codec IC. The series here
> adds support for this codec driver: DT bindings and codec driver
> itself that consists mainly of two parts: soundwire devices and
> codec part itself.
> 
> This audio codec can be found on platforms like QCM2290 and
> on Qualcomm QRB2210 RB1 board.
> 
> We are working on this together with Srini
> (srinivas.kandagatla@oss.qualcomm.com or srini@kernel.org).
> 
> This driver also has a bit limited support for concurrent playback,
> since line out path is connected to left input channel.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> 
Thanks Alexey for these patches,

I have now tested this series for headset playback, record and lineout.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

---
> Changes in v4:
> - clean SDW ports/channels as suggested by Srini;
> - Srini implemented refcounting for global mbias (we didn't manage to make it proper DAPM widget);
> - patch for qcom,spmi-pmic.yaml moved to separate commit
> and "contains" is removed there;
> - rx_clk_cnt removed;
> - HPH{R,L}_COMP kcontrols fixed;
> - removed unneeded kcontrols (LO Switch, DMIC Switches, MBHC Switch);
> - removed "RDAC3", NULL, "RX1";
> - pass dev pointer to pm4125_get_micb_vout_ctl_val();
> - Link to v3: https://lore.kernel.org/r/20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org
> 
> Changes in v3:
> -- added qcom,pm4125-codec compatible to qcom,spmi-pmic.yaml
>    as suggested by Krzysztof;
> -- added braces around if-else branch in pm4125_probe, removed coma in
>    pm4125_slave_id[] as suggested by Christophe Jaillet;
> -- slightly re-ordered header files in pm4125.c;
> -- reworked how driver deals with regulators after Christophe Jaillet
>    noted that it is broken, devm_regulator_bulk_get_enable() is used,
>    it looks like there is no need for regulator_bulk_{disable,free};
> -- PDM watchdog irqs are moved to separate (new) widgets
>    as suggested by Srini, therefore audio routing and events for
>    HPH{L,R},LO and ERA PGAs are changed;
> -- extended pr_err() msg in pm4125_get_micb_vout_ctl_val();
> -- small styling code adjustment in pm4125_get_compander();
> -- added/reworked pm4125_bind() to add error paths
>    as suggested by Christophe Jaillet;
> -- removed of_node_put() in pm4125_add_slave_components() after Krzysztof
>    pointed out that of_node_put() is out of place, it looks like
>    of_parse_phandle() gets the node and component_release_of() will
>    do of_node_put() on dev release so no need for of_node_put();
> -- Link to v2: https://lore.kernel.org/r/20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org
> 
> Changes in v2:
> 
> -- added rxclk dapm widget, fixed/changed RX1/RX2 widgets;
> -- added comment for pm4125_wd_handle_irq();
> -- registers access permission routines have been reworked;
> -- changed pm4125_sdw_* functions to static inline;
> -- cleaned a bit pm4125_{rx,tx}_sdw_channels;
> -- got rid of most of hardcoded magic numbers (for the remaining regs+values I don't have documentation);
> -- updated commit messages;
> -- pm4125_tx_sdw_ports has been updated;
> -- removed of_match_ptr() and OF ifdef;
> -- removed couple of pm_runtime_mark_last_busy() calls;
> -- removed swap_gnd_mic;
> -- removed __pm4125_codec_enable_micbias_pullup();
> -- reordered sequence of calls in pm4125_probe() to make it a bit more logical;
> -- removed excessive regulator_bulk_free() and in error path in _probe();
> -- re-aligned for 100-chars length;
> -- removed of_node_get(), replaced with of_node_put();
> -- corrected some dev_err() messages;
> -- corrected some comments;
> -- removed legacy "WCD" from stream_name, replaced with "PM4125";
> -- removed null callbacks from struct wcd_mbhc_cb;
> -- removed "HPH Type" and "HPH{L,R} Impedance";
> -- pm4125_codec_enable_micbias() has been updated;
> -- pm4125_micbias_control() and pm4125_codec_enable_adc have been implemented;
> -- pm4125_codec_enable_dmic() has been updated;
> -- cleaned struct pm4125_priv;
> -- some rework to pm4125_handle_post_irq() and pm4125_regmap_irq_chip;
> -- updated Kconfig+Makefile (to make things be in sorting order);
> -- new patch: adding new files to MAINTAINERS file;
> 
> For dt bindings:
> -- I think all requested comments from Krzysztof were implemented;
> -- squashed qcom,spmi-pmic change into previous patch to avoid warnings on dtbs check;
> 
> Not done:
> -- Mark suggested to look at reimplementing this as a child mfd device from
> MFD PMIC without device tree description.
> 
> - Link to v1: https://lore.kernel.org/r/20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org
> 
> ---
> Alexey Klimov (4):
>       dt-bindings: sound: add bindings for pm4125 audio codec
>       dt-bindings: mfd: qcom,spmi-pmic: add qcom,pm4125-codec compatible
>       ASoC: codecs: add new pm4125 audio codec driver
>       MAINTAINERS: add Qualcomm PM4125 audio codec to drivers list
> 
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    6 +
>  .../bindings/sound/qcom,pm4125-codec.yaml          |  134 ++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   79 +
>  MAINTAINERS                                        |    2 +
>  sound/soc/codecs/Kconfig                           |   18 +
>  sound/soc/codecs/Makefile                          |    8 +
>  sound/soc/codecs/pm4125-sdw.c                      |  545 ++++++
>  sound/soc/codecs/pm4125.c                          | 1780 ++++++++++++++++++++
>  sound/soc/codecs/pm4125.h                          |  307 ++++
>  9 files changed, 2879 insertions(+)
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> change-id: 20250626-pm4125_audio_codec_v1-02ca7a300ddc
> 
> Best regards,

