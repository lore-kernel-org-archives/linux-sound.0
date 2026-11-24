Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541554;
	b=RhI4jjuWWPwoc1Tk/udhyaSZ2EBhoGYyYPuE3IrmX+euCP2zBNiJMzzX/WjbNWT2i9UZ
	 Dzd1dfkfckkVSsYdF1e1SLdPu7J3Ubk3PFOytEOCfi21Qsx+VCKOZ8KIe5NAyEaz2ALh6
	 ZCgmFLgQqlhG3TXZbmfOsDyS9yQccpl04w3mvvHSpKg6n0BoJA1EJAsxUnAGd1SSswMUI
	 ulH1M+ozaN0YU7DUHdma15/7LYJUjwaI9SHxV1Gl5RLia+OevFfHhp8N44U9g7e43EUAH
	 ruzraHBGuz7Aay9OLqW8BYbgeId/Mc6VO/jfTPnZyPxDgWC6jg04Fr6dQubdUQuC+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
	b=d0GG0OlDrTAgk5CpkT8ntlJXg9e/OLYYQqxW3rG7yvZNAYRldC57aSdYHL0ZNvQpXJ1d
	 YoV6L5IdFlkTxipJ927TLYhLccwSjRA+P3s/3YZWTt9t4AbNVqJuNzfhTqmk4ZyPI7oMt
	 ExUNlpLeduC0TmrYibTRpX78AbfHyS0WassHwDHNyE7/pjaMHic4gNT/NWrz8CXOJvL1S
	 qdP7Q0QNCUTQf5dNKp5WgEuP8KwMb3t1ryeo39w7GUNusHc6ErbQKTG0rcbyp0HFoTswL
	 LjbmwMnbnMkJU5lIFwf755r3n9ddP9HYwh5yg6+raI2I6qGEJAB19QXkHxT4n3zRigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1760A5BDC
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C1760A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49a92144733so2362837f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541553; x=1796146353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=Hw84uXTW5QzwYORsvT3bCENub/kymeSn9FubY6WW3pY+KTXS95TEVXvk3aMmWV7/T5
         L/E0jCVfH35jtcYFGIiCwMe2GBrxexE22wBj7RotWUGXn9Ih8ZpOrCSwxhgXTEWYzASk
         NNNe3l2CYhMkgELGoRZtRjk+fShw6yq4VosL0RTw6mCVUR6tHXrdlfhlRfvRfZEFxv2r
         /QgBzaTjmLHaY/+9c1xbtpbrL4Biojgz4y1gZ2OeQTm5IHi+wGnRyr4gdEUdE7yHPU3N
         73DKZ+DxDCGOZdqFkVcFSRyin/ozBRcgWVm6vPQVnONT0QngTz69fb/9UZ2wH+qsoJ2E
         HtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541553; x=1796146353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=HbNHDKHf7pb4gL98In+4yiz3GcARlLtlzgqAN98w8lt/j12XzbM+M8SdrczB9DQe9n
         8LQdKKmZ6XMrzM/X4Qzu0X68Nyh4PaiBWEpP/EDtlQvjO7WG+5B1IeXdDFSdbqax6Ixv
         AibVDCeq7XV/NRX0p9J3GMDpCrbv4Jsygm4Aob3cbegiGt7ky8LOHsR0yINt+09f+enx
         utQmEFpif9gymgn6nRBonaDaLxh2Vyd4+GGldgFTVbCERwqFxny2brahDxgpKGYEfiUE
         KOte1gajrjHM9bZ8Qw5MTFB56LxgibzVkJXoiZfOuXde4CmboEjd19NDYonD+O+6QiMp
         Hj7g==
X-Gm-Message-State: APuU4Z/QrRDePfD7CkE39fOmhZR722viJ0GfdVNwjgi8b6k/VIEtMczJ
	wu45VUGGGRPm1inzwKqieNARQTR5eWR0elyZfJQna33dgMDkGivGxcqtB3DwDl7pgzI=
X-Gm-Gg: AZFdTZfpOoo9qoWGPL2UsRtZ2+CTyeXOIITq+B3lvYFkGcxNCzDAN68IIq1JhHVxN1d
	QPp+IBUfbEyA2TYyQrh+gwAzsFu/xfJIf7PXjNruVrB+dspYe0ghdCOIgn7Wz8SlSZWf/6Ll/tP
	NS5oClJy2F3nBWQ1h+JGiEhD00OPQedMv006I983+Ect4uy+5f5wIv280ahW2e8nURrchpd0yjM
	iooQz4sz5ZpxKo0ya10Cx7NtH49YMbooGwd31e8GCNNGYCIzu92laQnB3SO/wXTA6Z/eu/GkOyY
	i4CvMqBOYkRJvz3Oo195IXeWy++sj22hTVk3idZMRRX1E8OiK9IlwU0f/vbKlmdCZ9BXzLXGGsm
	TRTZppDsEanecNlGYIMNGZg0NVrn7TbWglHjKfPDO3V4aRS5Hsicf41EiZgAnuON5QmX+zKpGsg
	IxltdQ80JjkQ8I5YTkwkCQ3+nPfR2RzDLfdok4Gu8wV0ftAfR0UEOSTg4Xc2Xafo8x+QZMQ9s/l
	5TqRWV3EnbYlZr20Zr7HfFIa6H+UEwADzELsQ6+Br5gbqjgk1NGjSn99+3sUG9ku7GGzn4kYEfE
	Gw1ilyeHd57N9WNcRf4nZpJ9ODYFv1AQ0s5femXmvzkD0qKNDuO1Qdzg6N+CdPWvn7XWPw2/
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id ffacd0b85a97d-4abb683bca6mr29226251f8f.40.1795541552768;
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:21 +0100
Subject: [PATCH v2 14/19] ASoC: qcom: lpass: support LPM memory type for
 I2S LPAIFs
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
Message-Id: <20261124-topic-sm8650-el2-v2-14-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UX1Tne2tKvwx98oB7eZ/uqM9X8LAabEMp74ho5pRl64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcohpXLNvWL3V+lBQmfD676YMbuAgG9ra+C6YI+m
 1L9KO0uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIQAKCRB33NvayMhJ0ZHtD/
 40aEIUN4VVreY09hOgfTQLQtRL4HgwM2k2llV8ULvXQYQhAqogNznOG5E1HvO23H/kH/xaCnvtVxNs
 VYWpxQO4La+MX5pWteY6lC7QrHundZl1dsU1+ayFc/0hILypl39hnl/Bq2rvnTc1lpsrE87PuGraEB
 UXazbn23+Kz7JOzLDepF86k9LlswPnZ+rnYeA15UdblMxSRI0KuNY7npHWaRp9vbwT1QC0kIV7X/EE
 rs6Gqcn+pZoom7DMjoJERoclsbIuRRt8zeiRoD0MaY5pIB3Gpbq3WJaRTzM4JX/j/AbE+vikxH3MRK
 yl775Nd1btB2582Xki/EvtHBldRbuBSfZvUavTp/ML37dSIP5lnACOLm/qDmfO+cTeAZ5CIj/2YVSe
 POhWhHk+iNTj8ELQFxWPpsHXhK0t+DFwAASC/OdvOiwCMb2RDbFu0d/IG4uKeyzea7IeQZ2G5U5EW8
 Hh1svmNDhVj02IvL4KSjkekGPv188k0YKrZlIpsyj+w8leu7JSxvMaJVRgaWzA6/O4riKsGTUrJxsL
 GOkrfzqK1T8cxeCBDiWX88juu/06zybtZb3LMqsbaEG1Pn0ZYieAc5OMHGuioDIj6y7TFhqmwMBZKi
 vJOv9KA3WbNqpomO3TiWD5/33pmZX1wNCfWPmZ45iR8/zoFGAj2KdTYREvlQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
like the RXTX/VA/WSA codec handlers, so add a way to describe
which LPM memory is used for each LPAIF in the MI2S
descriptor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c |  1 +
 sound/soc/qcom/lpass.h     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 902ad6554510..a83507c2cd55 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1437,6 +1437,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						&drvdata->lpaif[lpaif_idx];
 					drvdata->mi2s_intf[port_id] =
 						desc->port_desc[lpaif_port].intf;
+					drvdata->mi2s_lpm[port_id] = desc->lpm_type;
 				}
 			}
 		} else {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 70d64bf3f073..71f1274dfa89 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -153,10 +153,17 @@ struct mi2s_port_desc {
 	unsigned int id;	/* DAI ID */
 };
 
+enum lpass_lpm {
+	LPASS_LPM_NONE = 0,	/* DMA buffer in DDR */
+	LPASS_RXTX_CDC_LPM,	/* CODEC LPM */
+	LPASS_VA_CDC_LPM,	/* VA LPM */
+};
+
 /* Extended LPAIF MI2S layout */
 struct lpaif_mi2s_desc {
 	const char *reg_name;
 	const char *irq_name;
+	enum lpass_lpm lpm_type;
 	struct mi2s_port_desc *port_desc;
 	unsigned int port_desc_count;
 };
@@ -197,6 +204,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	enum lpass_lpm mi2s_lpm[LPASS_MAX_MI2S_PORTS];
 	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
@@ -261,6 +269,19 @@ struct lpass_data {
 	struct lpass_sstream_ctl *sstream_ctl;
 };
 
+static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai_id)
+{
+	unsigned int port_id;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		return drvdata->mi2s_lpm[port_id] != LPASS_LPM_NONE;
+	}
+	return false;
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

