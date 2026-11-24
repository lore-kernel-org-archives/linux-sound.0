Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541554;
	b=bUWn4nF0tkmPf+FX/i9KiSyrVjySuavF+J/Kft/rKBS1pRyAyFRcn9DxWh7uJ7EgqhWM
	 4CxgxztaOqOEd9sFLWYvxr9gA9quIQ1IIOfdo0HIIlqyAWpfh8NTI3bwZOxNVwJBxr5ew
	 inbwSYt/Y9rzT8AakvdiMINwda5TJ82Fj6FeHhfEnNcCfi/C5GRiFFxeyBpMIndHAZkF6
	 qeV3G17zCkZi7QSyOG46sHDJ2HV/c+gpCMa+fozI529EL0zDVRf7HegSrw2h4Bt4vP813
	 d6KEHYEwZqRV/kEnILVoATXKoZ2hN4Dn5+jQnE5AWKSFFo3MPNjqRvNo4ts9kSIcBYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/YQyq5n0n8e2pwT7Rh0Dw/hzZ28jEkt14trcTZRHEKM=;
	b=LBkjYZ2pvnuo8DZ0s/FmzY90mpbNjVFjaz8BKva3i1iS00xVuoF/mruuYZISuvXtOkyh
	 yXyFDrrBKvb7bhnGTRlXl/X8/XSmxdmP/taHoeZ+8lo0lg7pL4brGEzPiuMDEHEWZ6vZs
	 qShW0u05OR3SIf1O0HDqGl2aGyfRTaCbva8Lnv+GkbhWf7uADSaAMGCo8K9IzuO7UuLeg
	 W4DKApTP9qKvyckzuo1H/pifVBFk9ywUtwPMEW+qtwvpUx2sxLn+v2Cs6DXYvBqtt7R8A
	 iITj04/c3tOA4HxploBNluwYO+VQYkBLBQimwTdnFZjrGKvFE7KEY9Y8CBCi7HnlyYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dkBSD53p;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5584760A5BD1
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5584760A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dkBSD53p
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a32576da88so2798996f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541551; x=1796146351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YQyq5n0n8e2pwT7Rh0Dw/hzZ28jEkt14trcTZRHEKM=;
        b=dkBSD53p6wln92wSr73D7ovFju3Hf3Sgv+VruI9vMA4r76HqGjBEYBAFd/YAYzwW2F
         oatnAWtAx7q7sq+30GJrDPgrpcpCgH4HEqC9Yu9CHT8kjruFhedVvaN45tme96x1nNv3
         a9z+2kf2uATgys4ikYzydUskL/CjzwfHxyArmaH7jMoDg3AhLavsJ5oxxNmLg08OS1cj
         S8syuYYofNnzH0S2WrZjeiXQ1Ru/U1Id6KYwaj/lCIAKsxd/xIeUNN8JCXZ7I5GoplYG
         NzJ2xj3bbsTYCu3OyFNvZPlqqY3lTOlsb0K+pFPfBHaG0lztCVzyuCWa03kvkdDoOlRU
         67qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541551; x=1796146351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YQyq5n0n8e2pwT7Rh0Dw/hzZ28jEkt14trcTZRHEKM=;
        b=aeFm/Hxya1bvrzKmUu/Sh14alZXaw2zv/K6bbnpD1vm+83tDRn/20pDbib3Xly/A9b
         kJzU7LZKJ+Rn02M72D5681CgxP8Ge+B16MAVG/QnoERbphfHG2Q4FpqDYabH5epNV7ve
         fyTDz0hSI7zB7kmWIPU/NSnctqNoan/pYvRvubF0WDOwAk+Ge5L9dd7zoLmisY7Evyc4
         hCZ2Fq6dk4xwtVVuhJ9IEgI5kKzcQVpkh0/o19kstEOypZ/6s0m5Rf7ZtZvTcOpdgw7T
         TYjrpJxEtLou45R5pI2zMvs9XIHiEXLofpAXsaD4Vt+1noo3RaUPLCr8crKJeYDdcLaa
         Qmug==
X-Gm-Message-State: APuU4Z/swS3FZd8tFVIy3ftYAIpZNoMD8ZS4v6NFftioNYrOCywtGWLA
	Dq+QzYcGsXGLWLV5FUd5A9uNf+6G3JpsKWXN4zV8dYb2uLZ+R4sVhHNJDHmHUzKpKbU=
X-Gm-Gg: AZFdTZexJrd9pLF89B8csL+BjT6lJ2UtC37QxlJ7PDxBFJNxXDgwRY7O3O6GUt1KwLS
	dgx+a9r0MgPafq2lu/3nj5Uy8AaDGLMcF4BLpSq+H6JM3QKQD9AaiONtpW39jH+97482Xt5w3Tn
	FVyTzeY4HBhQG0pUW8uUMqUcQJ5iNA9Ox4pjWc9OizieMyhpbiy8+soLSlhKD0ZeQ1beY4Z1xl+
	L3mFSPn18rPRKkiCd3BJcutG02P+GE/Qq/4k2vCJzZML6MP/gs5/RTFuRPCp3tob21EUfxKmNzo
	lkhbG47jK8xZg72SvHepH1nzsjYigqWTMApwTK8rPd9HgYrRFyZ0YdTS1c7PwUAt+1N/PWDBGbw
	QQIajThnnOAoyYWLi7SR4ibo9TtPq9C5EVEN7EowaI1YklsjXnclP/KlKi5Ahf6LYDqo4DZGpLw
	/TCVquxO9Ywsi8bg5/cOhHmECp8wZIyOunsWY8G3ZcZ/HiZXRduaHy6t0Hknjdy1ChYy+ZAt5kA
	xdAbv2lLholtQrPYzKlRZQ9/Coyjx49qgVRTgswQt0BMuwAh5XvJTaiciBXEYf4JQJD+5igij47
	HnhHu/xKJ7vs6hEJEavsCl20WkLlbK2Ocmzef9oxqKTrgTxByg==
X-Received: by 2002:a05:6000:40da:b0:4b7:83a0:6c06 with SMTP id ffacd0b85a97d-4b783a06c89mr4113793f8f.15.1795541550352;
        Tue, 24 Nov 2026 09:32:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:18 +0100
Subject: [PATCH v2 11/19] ASoC: qcom: lpass: prepare to handle multiple
 lpaifs for i2s
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
Message-Id: <20261124-topic-sm8650-el2-v2-11-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=38436;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1BQ614y4TxwqGbTr6gLisAtXSk6feNMM5qIxXBui/eE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcof7Fb7t/irEcpErMV6OmSu1o5iPSY8rzQ3QYGA
 ee8oNJWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHwAKCRB33NvayMhJ0VT+D/
 46eTpATDmUAwH95aQB1CDDsng/qRp3/JEO1k+DannXUf+Q5v7Xb0Cwp1tjNrXnQuNLNRRL2Uoy5gPh
 zftPOVe+sd9VWoWP0sDN7LSaSysMKbOP444/l6r0R0ZxWnoM2biVGFMyzLODfRiQjT+d1eV+cVQ8T3
 kskktngRMxJrLUdCfHE+8FdacJaeFqL8hGMu9y2yA9pbcnUELyBNTyUF6kc4P0WTtYmhnOfMepDwll
 f4Q/4TRcIIyGy4V5Dq3jyXi5ZsvIB9rT22tts/k7UDpYIWSY80SZBSoRCrkbIGH4Uh8bwJuv7jlYDb
 Dlp6+cnrYUgy/2YhqRRYMkXlULOo2a75xF26XIjAKVZnv2k+7sqp0Lb6Q7Tkmk/d7+bpJVnsG1jtOA
 zTr+vn2j0FzzQswe+gjflDJ3gokfyAAK7RZ9WZbmT0S2FYAvMPKB6tqQ9E2Rk/WTObfb4hU3VP/r7g
 Fzp+VCOhQ4O461R+pqJBzxUEUV8jM4xiisNy6k6OP77c2NFz1N6MPCaiEFG8l40dc/59wm6IgEqM/j
 XYDMG839MCk3imdxwJvpR3HaCU9EiK5X1Rj+ySApp8pwbQG0vgs9/gTl+zzbArB2TP/2tzx/nwuutK
 nxHpt+vk5S7fTFLuPdYH2C3xJJRLgSEmM44eWc3Euu0RMASCcNH6CnrfG6Rg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MI2S ports are spread amonst the different LPAIFs, but today
we consider all 8 possible MI2S ports are available on the core
LPAIF.

In order to support more complex mappings, start by moving the
lpaif struct into a table so we can probe more LPAIFs for
MI2S ports later on.

And since the MI2S_SENARY & MI2S_SEPTENARY indexes are not
following the Quinary index, we need to add an helper to
map the DAI id to the actual MI2S port index.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c  |   9 +-
 sound/soc/qcom/lpass-cpu.c      | 216 +++++++++++++++++++++++-----------------
 sound/soc/qcom/lpass-platform.c | 121 ++++++++++++++--------
 sound/soc/qcom/lpass-sc7180.c   |  10 +-
 sound/soc/qcom/lpass-sc7280.c   |  10 +-
 sound/soc/qcom/lpass.h          |  59 +++++++++--
 6 files changed, 271 insertions(+), 154 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index d07ef2bb382a..5f5d49c70e22 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -124,16 +124,17 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					   int direction, unsigned int dai_id)
 {
 	const struct lpass_variant *v = drvdata->variant;
+	unsigned long *ch_map = &drvdata->lpaif[0].dma_ch_bit_map;
 	int chan = 0;
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+		chan = find_first_zero_bit(ch_map,
 					v->rdma_channels);
 
 		if (chan >= v->rdma_channels)
 			return -EBUSY;
 	} else {
-		chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+		chan = find_next_zero_bit(ch_map,
 					v->wrdma_channel_start +
 					v->wrdma_channels,
 					v->wrdma_channel_start);
@@ -142,14 +143,14 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 			return -EBUSY;
 	}
 
-	set_bit(chan, &drvdata->dma_ch_bit_map);
+	set_bit(chan, ch_map);
 
 	return chan;
 }
 
 static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
 {
-	clear_bit(chan, &drvdata->dma_ch_bit_map);
+	clear_bit(chan, &drvdata->lpaif[0].dma_ch_bit_map);
 
 	return 0;
 }
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index db7a0752edb2..b4620fc99e26 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -70,9 +70,11 @@ static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		unsigned int freq, int dir)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+
 	int ret;
 
-	ret = clk_set_rate(drvdata->mi2s_osr_clk[dai->driver->id], freq);
+	ret = clk_set_rate(drvdata->mi2s_osr_clk[port_id], freq);
 	if (ret)
 		dev_err(dai->dev, "error setting mi2s osrclk to %u: %d\n",
 			freq, ret);
@@ -84,17 +86,18 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
 	int ret;
 
-	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
+	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
 		return ret;
 	}
-	ret = clk_prepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	ret = clk_prepare(drvdata->mi2s_bit_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
-		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+		clk_disable_unprepare(drvdata->mi2s_osr_clk[port_id]);
 		return ret;
 	}
 	return 0;
@@ -104,39 +107,41 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
-	unsigned int id = dai->driver->id;
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
+	unsigned int intf = drvdata->mi2s_intf[port_id];
 
-	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+	clk_disable_unprepare(drvdata->mi2s_osr_clk[port_id]);
 	/*
 	 * Ensure LRCLK is disabled even in device node validation.
 	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
 	 * suspend.
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
+		regmap_fields_write(lpaif->i2sctl->spken, intf, LPAIF_I2SCTL_SPKEN_DISABLE);
 	else
-		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
+		regmap_fields_write(lpaif->i2sctl->micen, intf, LPAIF_I2SCTL_MICEN_DISABLE);
 
 	/*
 	 * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
 	 * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
 	 * lpass_cpu_daiops_prepare.
 	 */
-	if (drvdata->mi2s_was_prepared[dai->driver->id]) {
-		drvdata->mi2s_was_prepared[dai->driver->id] = false;
-		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+	if (drvdata->mi2s_was_prepared[port_id]) {
+		drvdata->mi2s_was_prepared[port_id] = false;
+		clk_disable(drvdata->mi2s_bit_clk[port_id]);
 	}
 
-	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	clk_unprepare(drvdata->mi2s_bit_clk[port_id]);
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
-	unsigned int id = dai->driver->id;
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
+	unsigned int intf = drvdata->mi2s_intf[port_id];
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
@@ -150,14 +155,14 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return bitwidth;
 	}
 
-	ret = regmap_fields_write(i2sctl->loopback, id,
+	ret = regmap_fields_write(lpaif->i2sctl->loopback, intf,
 				 LPAIF_I2SCTL_LOOPBACK_DISABLE);
 	if (ret) {
 		dev_err(dai->dev, "error updating loopback field: %d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_fields_write(i2sctl->wssrc, id,
+	ret = regmap_fields_write(lpaif->i2sctl->wssrc, intf,
 				 LPAIF_I2SCTL_WSSRC_INTERNAL);
 	if (ret) {
 		dev_err(dai->dev, "error updating wssrc field: %d\n", ret);
@@ -179,16 +184,16 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = regmap_fields_write(i2sctl->bitwidth, id, regval);
+	ret = regmap_fields_write(lpaif->i2sctl->bitwidth, intf, regval);
 	if (ret) {
 		dev_err(dai->dev, "error updating bitwidth field: %d\n", ret);
 		return ret;
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		mode = drvdata->mi2s_playback_sd_mode[id];
+		mode = drvdata->mi2s_playback_sd_mode[port_id];
 	else
-		mode = drvdata->mi2s_capture_sd_mode[id];
+		mode = drvdata->mi2s_capture_sd_mode[port_id];
 
 	if (!mode) {
 		dev_err(dai->dev, "no line is assigned\n");
@@ -250,7 +255,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = regmap_fields_write(i2sctl->spkmode, id,
+		ret = regmap_fields_write(lpaif->i2sctl->spkmode, intf,
 					 LPAIF_I2SCTL_SPKMODE(mode));
 		if (ret) {
 			dev_err(dai->dev, "error writing to i2sctl spkr mode: %d\n",
@@ -258,13 +263,13 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		if (channels >= 2)
-			ret = regmap_fields_write(i2sctl->spkmono, id,
+			ret = regmap_fields_write(lpaif->i2sctl->spkmono, intf,
 						 LPAIF_I2SCTL_SPKMONO_STEREO);
 		else
-			ret = regmap_fields_write(i2sctl->spkmono, id,
+			ret = regmap_fields_write(lpaif->i2sctl->spkmono, intf,
 						 LPAIF_I2SCTL_SPKMONO_MONO);
 	} else {
-		ret = regmap_fields_write(i2sctl->micmode, id,
+		ret = regmap_fields_write(lpaif->i2sctl->micmode, intf,
 					 LPAIF_I2SCTL_MICMODE(mode));
 		if (ret) {
 			dev_err(dai->dev, "error writing to i2sctl mic mode: %d\n",
@@ -272,10 +277,10 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		if (channels >= 2)
-			ret = regmap_fields_write(i2sctl->micmono, id,
+			ret = regmap_fields_write(lpaif->i2sctl->micmono, intf,
 						 LPAIF_I2SCTL_MICMONO_STEREO);
 		else
-			ret = regmap_fields_write(i2sctl->micmono, id,
+			ret = regmap_fields_write(lpaif->i2sctl->micmono, intf,
 						 LPAIF_I2SCTL_MICMONO_MONO);
 	}
 
@@ -285,7 +290,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = clk_set_rate(drvdata->mi2s_bit_clk[id],
+	ret = clk_set_rate(drvdata->mi2s_bit_clk[port_id],
 			   rate * bitwidth * 2);
 	if (ret) {
 		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
@@ -300,8 +305,9 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
-	unsigned int id = dai->driver->id;
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
+	unsigned int intf = drvdata->mi2s_intf[port_id];
 	int ret = -EINVAL;
 
 	switch (cmd) {
@@ -321,20 +327,20 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		 *     it.
 		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			ret = regmap_fields_write(i2sctl->spken, id,
+			ret = regmap_fields_write(lpaif->i2sctl->spken, intf,
 						 LPAIF_I2SCTL_SPKEN_ENABLE);
 		} else  {
-			ret = regmap_fields_write(i2sctl->micen, id,
+			ret = regmap_fields_write(lpaif->i2sctl->micen, intf,
 						 LPAIF_I2SCTL_MICEN_ENABLE);
 		}
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
 
-		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		ret = clk_enable(drvdata->mi2s_bit_clk[port_id]);
 		if (ret) {
 			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
-			clk_disable(drvdata->mi2s_osr_clk[id]);
+			clk_disable(drvdata->mi2s_osr_clk[port_id]);
 			return ret;
 		}
 		break;
@@ -346,17 +352,17 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		 * device suspend.
 		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			ret = regmap_fields_write(i2sctl->spken, id,
+			ret = regmap_fields_write(lpaif->i2sctl->spken, intf,
 						 LPAIF_I2SCTL_SPKEN_DISABLE);
 		} else  {
-			ret = regmap_fields_write(i2sctl->micen, id,
+			ret = regmap_fields_write(lpaif->i2sctl->micen, intf,
 						 LPAIF_I2SCTL_MICEN_DISABLE);
 		}
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
 
-		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+		clk_disable(drvdata->mi2s_bit_clk[port_id]);
 
 		break;
 	}
@@ -368,8 +374,9 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
-	unsigned int id = dai->driver->id;
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
+	unsigned int intf = drvdata->mi2s_intf[port_id];
 	int ret;
 
 	/*
@@ -379,9 +386,9 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 	 * (ex: to drop start up pop noise before capture starts).
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
+		ret = regmap_fields_write(lpaif->i2sctl->spken, intf, LPAIF_I2SCTL_SPKEN_ENABLE);
 	else
-		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
+		ret = regmap_fields_write(lpaif->i2sctl->micen, intf, LPAIF_I2SCTL_MICEN_ENABLE);
 
 	if (ret) {
 		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
@@ -393,13 +400,13 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 	 * be called multiple times. It's paired with the clk_disable in
 	 * lpass_cpu_daiops_shutdown.
 	 */
-	if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
-		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+	if (!drvdata->mi2s_was_prepared[port_id]) {
+		ret = clk_enable(drvdata->mi2s_bit_clk[port_id]);
 		if (ret) {
 			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
 			return ret;
 		}
-		drvdata->mi2s_was_prepared[dai->driver->id] = true;
+		drvdata->mi2s_was_prepared[port_id] = true;
 	}
 	return 0;
 }
@@ -409,8 +416,9 @@ static int lpass_cpu_daiops_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_
 	int ret;
 	struct snd_soc_dai_driver *drv = dai->driver;
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	unsigned int port_id = mi2s_port_id(dai->id);
 
-	if (drvdata->mi2s_playback_sd_mode[dai->id] == LPAIF_I2SCTL_MODE_QUAD01) {
+	if (drvdata->mi2s_playback_sd_mode[port_id] == LPAIF_I2SCTL_MODE_QUAD01) {
 		ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				lpass_quad_chmaps, drv->playback.channels_max, 0,
 				NULL);
@@ -424,11 +432,13 @@ static int lpass_cpu_daiops_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_
 static int lpass_cpu_daiops_probe(struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	unsigned int port_id = mi2s_port_id(dai->driver->id);
+	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
 	int ret;
 
 	/* ensure audio hardware is disabled */
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id), 0);
+	ret = regmap_write(lpaif->map,
+			LPAIF_I2SCTL_REG(drvdata->variant, drvdata->mi2s_intf[port_id]), 0);
 	if (ret)
 		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
 
@@ -578,7 +588,7 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	return false;
 }
 
-static struct regmap_config lpass_cpu_regmap_config = {
+static const struct regmap_config lpass_cpu_regmap_config = {
 	.name = "lpass_cpu",
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -1133,9 +1143,12 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 
 	/* Allow all channels by default for backwards compatibility */
 	for (i = 0; i < data->variant->num_dai; i++) {
-		id = data->variant->dai_driver[i].id;
-		data->mi2s_playback_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
-		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
+		if (is_mi2s_port_id(data->variant->dai_driver[i].id)) {
+			unsigned int port_id = mi2s_port_id(data->variant->dai_driver[i].id);
+
+			data->mi2s_playback_sd_mode[port_id] = LPAIF_I2SCTL_MODE_8CH;
+			data->mi2s_capture_sd_mode[port_id] = LPAIF_I2SCTL_MODE_8CH;
+		}
 	}
 
 	for_each_child_of_node(dev->of_node, node) {
@@ -1150,13 +1163,18 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->codec_dma_enable = 1;
 			if (is_wsa_cdc_dma_port(id))
 				data->wsa_enable = 1;
-		} else {
-			data->mi2s_playback_sd_mode[id] =
+		} else if (is_mi2s_port_id(id)) {
+			unsigned int port_id = mi2s_port_id(id);
+
+			data->mi2s_playback_sd_mode[port_id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
 							    "qcom,playback-sd-lines");
-			data->mi2s_capture_sd_mode[id] =
+			data->mi2s_capture_sd_mode[port_id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
 						    "qcom,capture-sd-lines");
+		} else {
+			dev_err(dev, "invalid dai id: %d\n", id);
+			continue;
 		}
 	}
 }
@@ -1187,6 +1205,45 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	return 0;
 }
 
+static int lpass_cpu_init_lpaif(struct platform_device *pdev, int idx,
+				const char *reg_name)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	const struct lpass_variant *v = drvdata->variant;
+	struct lpass_lpaif *lpaif = &drvdata->lpaif[idx];
+	struct regmap_config cfg = lpass_cpu_regmap_config;
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource_byname(pdev, reg_name);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	cfg.max_register = LPAIF_WRDMAPER_REG(v, v->wrdma_channels +
+					      v->wrdma_channel_start);
+
+	lpaif->drvdata = drvdata;
+	lpaif->map = devm_regmap_init_mmio(dev, base, &cfg);
+	if (IS_ERR(lpaif->map)) {
+		dev_err(dev, "error initializing %s regmap: %ld\n",
+			reg_name, PTR_ERR(lpaif->map));
+		return PTR_ERR(lpaif->map);
+	}
+
+	/* Allocation for i2sctl regmap fields */
+	lpaif->i2sctl = devm_kzalloc(dev, sizeof(*lpaif->i2sctl), GFP_KERNEL);
+	if (!lpaif->i2sctl)
+		return -ENOMEM;
+
+	/* Initialize bitfields for dai I2SCTL register */
+	ret = lpass_cpu_init_i2sctl_bitfields(dev, lpaif->i2sctl, lpaif->map);
+	if (ret)
+		dev_err(dev, "error init %s i2sctl field: %d\n", reg_name, ret);
+
+	return ret;
+}
+
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata;
@@ -1194,7 +1251,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	struct resource *res;
 	const struct lpass_variant *variant;
 	struct device *dev = &pdev->dev;
-	int ret, i, dai_id;
+	int ret, i, port_id;
 
 	dsp_of_node = of_parse_phandle(pdev->dev.of_node, "qcom,adsp", 0);
 	if (dsp_of_node) {
@@ -1283,21 +1340,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
-	drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-lpaif");
-	if (IS_ERR(drvdata->lpaif))
-		return PTR_ERR(drvdata->lpaif);
-
-	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
-						variant->wrdma_channels +
-						variant->wrdma_channel_start);
+	drvdata->num_lpaif = 1;
 
-	drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
-			&lpass_cpu_regmap_config);
-	if (IS_ERR(drvdata->lpaif_map)) {
-		dev_err(dev, "error initializing regmap: %ld\n",
-			PTR_ERR(drvdata->lpaif_map));
-		return PTR_ERR(drvdata->lpaif_map);
-	}
+	ret = lpass_cpu_init_lpaif(pdev, 0, "lpass-lpaif");
+	if (ret)
+		return ret;
 
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif = devm_platform_ioremap_resource_byname(pdev, "lpass-hdmiif");
@@ -1324,41 +1371,32 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < variant->num_dai; i++) {
-		dai_id = variant->dai_driver[i].id;
-		if (dai_id == LPASS_DP_RX || is_cdc_dma_port(dai_id))
+		if (!is_mi2s_port_id(variant->dai_driver[i].id))
 			continue;
 
-		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
+		port_id = mi2s_port_id(variant->dai_driver[i].id);
+
+		drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
+		drvdata->mi2s_intf[port_id] = port_id;
+
+		drvdata->mi2s_osr_clk[port_id] = devm_clk_get_optional(dev,
 					     variant->dai_osr_clk_names[i]);
-		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
+		drvdata->mi2s_bit_clk[port_id] = devm_clk_get(dev,
 						variant->dai_bit_clk_names[i]);
-		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
+		if (IS_ERR(drvdata->mi2s_bit_clk[port_id])) {
 			dev_err(dev,
 				"error getting %s: %ld\n",
 				variant->dai_bit_clk_names[i],
-				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
-			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
+				PTR_ERR(drvdata->mi2s_bit_clk[port_id]));
+			return PTR_ERR(drvdata->mi2s_bit_clk[port_id]);
 		}
-		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
+		if (drvdata->mi2s_playback_sd_mode[port_id] ==
 			LPAIF_I2SCTL_MODE_QUAD01) {
 			variant->dai_driver[i].playback.channels_min = 4;
 			variant->dai_driver[i].playback.channels_max = 4;
 		}
 	}
 
-	/* Allocation for i2sctl regmap fields */
-	drvdata->i2sctl = devm_kzalloc_obj(&pdev->dev, struct lpaif_i2sctl);
-	if (!drvdata->i2sctl)
-		return -ENOMEM;
-
-	/* Initialize bitfields for dai I2SCTL register */
-	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
-						drvdata->lpaif_map);
-	if (ret) {
-		dev_err(dev, "error init i2sctl field: %d\n", ret);
-		return ret;
-	}
-
 	if (drvdata->hdmi_port_enable) {
 		ret = lpass_hdmi_init_bitfields(dev, drvdata->hdmiif_map);
 		if (ret) {
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 99a7ce9ed769..dc7007155e95 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -194,23 +194,26 @@ static int lpass_platform_alloc_wsa_dmactl_fields(struct device *dev,
 }
 
 static int lpass_platform_alloc_dmactl_fields(struct device *dev,
-					 struct regmap *map)
+					      struct lpass_lpaif *lpaif)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	const struct lpass_variant *v = drvdata->variant;
+	struct regmap *map = lpaif->map;
 	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
 	int rval;
 
-	drvdata->rd_dmactl = devm_kzalloc_obj(dev, struct lpaif_dmactl);
-	if (drvdata->rd_dmactl == NULL)
+	lpaif->rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					GFP_KERNEL);
+	if (!lpaif->rd_dmactl)
 		return -ENOMEM;
 
-	drvdata->wr_dmactl = devm_kzalloc_obj(dev, struct lpaif_dmactl);
-	if (drvdata->wr_dmactl == NULL)
+	lpaif->wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					GFP_KERNEL);
+	if (!lpaif->wr_dmactl)
 		return -ENOMEM;
 
-	rd_dmactl = drvdata->rd_dmactl;
-	wr_dmactl = drvdata->wr_dmactl;
+	rd_dmactl = lpaif->rd_dmactl;
+	wr_dmactl = lpaif->wr_dmactl;
 
 	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
 					    &v->rdma_intf, 6);
@@ -250,6 +253,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct lpass_pcm_data *data;
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int port_id;
 
 	data = kzalloc_obj(*data);
 	if (!data)
@@ -270,8 +274,9 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		map = drvdata->lpaif_map;
-		drvdata->substream[dma_ch] = substream;
+		port_id = mi2s_port_id(dai_id);
+		map = drvdata->mi2s_lpaif[port_id]->map;
+		drvdata->mi2s_lpaif[port_id]->substream[dma_ch] = substream;
 		break;
 	case LPASS_DP_RX:
 		map = drvdata->hdmiif_map;
@@ -350,12 +355,14 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	const struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
 	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int port_id;
 
 	data = runtime->private_data;
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		drvdata->substream[data->dma_ch] = NULL;
+		port_id = mi2s_port_id(dai_id);
+		drvdata->mi2s_lpaif[port_id]->substream[data->dma_ch] = NULL;
 		break;
 	case LPASS_DP_RX:
 		drvdata->hdmi_substream[data->dma_ch] = NULL;
@@ -389,13 +396,15 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpaif_dmactl *dmactl = NULL;
+	unsigned int port_id;
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+		port_id = mi2s_port_id(cpu_dai->driver->id);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			dmactl = drvdata->rd_dmactl;
+			dmactl = drvdata->mi2s_lpaif[port_id]->rd_dmactl;
 		else
-			dmactl = drvdata->wr_dmactl;
+			dmactl = drvdata->mi2s_lpaif[port_id]->wr_dmactl;
 		break;
 	case LPASS_DP_RX:
 		dmactl = drvdata->hdmi_rd_dmactl;
@@ -468,10 +477,12 @@ static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map = NULL;
+	unsigned int port_id;
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		map = drvdata->lpaif_map;
+		port_id = mi2s_port_id(cpu_dai->driver->id);
+		map = drvdata->mi2s_lpaif[port_id]->map;
 		break;
 	case LPASS_DP_RX:
 		map = drvdata->hdmiif_map;
@@ -499,8 +510,6 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	struct snd_pcm_runtime *rt = substream->runtime;
-	struct lpass_pcm_data *pcm_data = rt->private_data;
 	const struct lpass_variant *v = drvdata->variant;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
@@ -508,8 +517,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	struct lpaif_dmactl *dmactl;
 	int id;
 	int bitwidth;
-	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
 	unsigned int dai_id = cpu_dai->driver->id;
+	int ret, dma_port;
 
 	dmactl = __lpass_get_dmactl_handle(substream, component);
 	id = __lpass_get_id(substream, component);
@@ -559,6 +568,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
+		dma_port = drvdata->mi2s_intf[dai_id] + v->dmactl_audif_start;
 		ret = regmap_fields_write(dmactl->intf, id,
 						LPAIF_DMACTL_AUDINTF(dma_port));
 		if (ret) {
@@ -1038,6 +1048,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	unsigned int reg, val, mask;
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int port_id;
 
 	mask = LPAIF_IRQ_ALL(chan);
 	switch (dai_id) {
@@ -1053,7 +1064,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
-		map = drvdata->lpaif_map;
+		port_id = mi2s_port_id(dai_id);
+		map = drvdata->mi2s_lpaif[port_id]->map;
 		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 		val = 0;
 	break;
@@ -1129,12 +1141,13 @@ static irqreturn_t lpass_dma_interrupt_handler(
 
 static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 {
-	struct lpass_data *drvdata = data;
+	struct lpass_lpaif *lpaif = data;
+	struct lpass_data *drvdata = lpaif->drvdata;
 	const struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	int rv, chan;
 
-	rv = regmap_read(drvdata->lpaif_map,
+	rv = regmap_read(lpaif->map,
 			LPAIF_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
 	if (rv) {
 		pr_err("error reading from irqstat reg: %d\n", rv);
@@ -1143,9 +1156,9 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 
 	/* Handle per channel interrupts */
 	for (chan = 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
-		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan]) {
+		if (irqs & LPAIF_IRQ_ALL(chan) && lpaif->substream[chan]) {
 			rv = lpass_dma_interrupt_handler(
-						drvdata->substream[chan],
+						lpaif->substream[chan],
 						drvdata, chan, irqs);
 			if (rv != IRQ_HANDLED)
 				return rv;
@@ -1336,6 +1349,7 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
+	int i;
 
 	if (drvdata->hdmi_port_enable) {
 		map = drvdata->hdmiif_map;
@@ -1343,9 +1357,11 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 		regcache_mark_dirty(map);
 	}
 
-	map = drvdata->lpaif_map;
-	regcache_cache_only(map, true);
-	regcache_mark_dirty(map);
+	for (i = 0; i < drvdata->num_lpaif; i++) {
+		map = drvdata->lpaif[i].map;
+		regcache_cache_only(map, true);
+		regcache_mark_dirty(map);
+	}
 
 	return 0;
 }
@@ -1354,7 +1370,7 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map;
-	int ret;
+	int i, ret;
 
 	if (drvdata->hdmi_port_enable) {
 		map = drvdata->hdmiif_map;
@@ -1364,10 +1380,15 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 			return ret;
 	}
 
-	map = drvdata->lpaif_map;
-	regcache_cache_only(map, false);
+	for (i = 0; i < drvdata->num_lpaif; i++) {
+		map = drvdata->lpaif[i].map;
+		regcache_cache_only(map, false);
+		ret = regcache_sync(map);
+		if (ret)
+			return ret;
+	}
 
-	return regcache_sync(map);
+	return 0;
 }
 
 static int lpass_platform_copy(struct snd_soc_component *component,
@@ -1422,39 +1443,51 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 
 };
 
-int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
+static int lpass_platform_init_lpaif(struct platform_device *pdev, int idx,
+				     const char *irq_name, unsigned long irqflags)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_lpaif *lpaif = &drvdata->lpaif[idx];
 	const struct lpass_variant *v = drvdata->variant;
 	int ret;
 
-	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
-	if (drvdata->lpaif_irq < 0)
+	lpaif->irq = platform_get_irq_byname(pdev, irq_name);
+	if (lpaif->irq < 0)
 		return -ENODEV;
 
 	/* ensure audio hardware is disabled */
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
+	ret = regmap_write(lpaif->map, LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
 	if (ret) {
-		dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
+		dev_err(&pdev->dev, "error writing to %s irqen reg: %d\n",
+			irq_name, ret);
 		return ret;
 	}
 
-	ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
-			lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
-			"lpass-irq-lpaif", drvdata);
+	ret = devm_request_irq(&pdev->dev, lpaif->irq, lpass_platform_lpaif_irq,
+			       irqflags, irq_name, lpaif);
 	if (ret) {
-		dev_err(&pdev->dev, "irq request failed: %d\n", ret);
+		dev_err(&pdev->dev, "%s irq request failed: %d\n", irq_name, ret);
 		return ret;
 	}
 
-	ret = lpass_platform_alloc_dmactl_fields(&pdev->dev,
-						 drvdata->lpaif_map);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"error initializing dmactl fields: %d\n", ret);
+	ret = lpass_platform_alloc_dmactl_fields(&pdev->dev, lpaif);
+	if (ret)
+		dev_err(&pdev->dev, "error initializing %s dmactl fields: %d\n",
+			irq_name, ret);
+
+	return ret;
+}
+
+int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	const struct lpass_variant *v = drvdata->variant;
+	int ret;
+
+	ret = lpass_platform_init_lpaif(pdev, 0, "lpass-irq-lpaif",
+			IRQF_TRIGGER_RISING);
+	if (ret)
 		return ret;
-	}
 
 	if (drvdata->codec_dma_enable) {
 		ret = regmap_write(drvdata->rxtx_lpaif_map,
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index e623aee74499..8c727fbfef98 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -89,14 +89,16 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 		}
 		set_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
 	} else {
+		unsigned long *ch_map = &drvdata->lpaif[0].dma_ch_bit_map;
+
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+			chan = find_first_zero_bit(ch_map,
 						v->rdma_channels);
 
 			if (chan >= v->rdma_channels)
 				return -EBUSY;
 		} else {
-			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+			chan = find_next_zero_bit(ch_map,
 					v->wrdma_channel_start +
 					v->wrdma_channels,
 					v->wrdma_channel_start);
@@ -105,7 +107,7 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 				return -EBUSY;
 		}
 
-		set_bit(chan, &drvdata->dma_ch_bit_map);
+		set_bit(chan, ch_map);
 	}
 	return chan;
 }
@@ -115,7 +117,7 @@ static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, u
 	if (dai_id == LPASS_DP_RX)
 		clear_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
 	else
-		clear_bit(chan, &drvdata->dma_ch_bit_map);
+		clear_bit(chan, &drvdata->lpaif[0].dma_ch_bit_map);
 
 	return 0;
 }
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index ffcfc0e2a515..6f9094eb8eb4 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -111,18 +111,20 @@ static int sc7280_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					  int direction, unsigned int dai_id)
 {
 	const struct lpass_variant *v = drvdata->variant;
+	unsigned long *ch_map;
 	int chan = 0;
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+		ch_map = &drvdata->lpaif[0].dma_ch_bit_map;
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+			chan = find_first_zero_bit(ch_map,
 						   v->rdma_channels);
 
 			if (chan >= v->rdma_channels)
 				return -EBUSY;
 		} else {
-			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+			chan = find_next_zero_bit(ch_map,
 						  v->wrdma_channel_start +
 						  v->wrdma_channels,
 						  v->wrdma_channel_start);
@@ -130,7 +132,7 @@ static int sc7280_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 			if (chan >= v->wrdma_channel_start + v->wrdma_channels)
 				return -EBUSY;
 		}
-		set_bit(chan, &drvdata->dma_ch_bit_map);
+		set_bit(chan, ch_map);
 		break;
 	case LPASS_DP_RX:
 		chan = find_first_zero_bit(&drvdata->hdmi_dma_ch_bit_map,
@@ -174,7 +176,7 @@ static int sc7280_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, u
 {
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
-		clear_bit(chan, &drvdata->dma_ch_bit_map);
+		clear_bit(chan, &drvdata->lpaif[0].dma_ch_bit_map);
 		break;
 	case LPASS_DP_RX:
 		clear_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 46ae02e67403..78125048b064 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -20,6 +20,7 @@
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
 #define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
+#define LPASS_MAX_LPAIF				(1)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
 #define LPASS_MAX_CDC_DMA_CHANNELS		(8)
@@ -40,6 +41,26 @@
 			return -EINVAL;         \
 	} while (0)
 
+static inline bool is_mi2s_port_id(int dai_id)
+{
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline int mi2s_port_id(int dai_id)
+{
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+		return dai_id;
+	default:
+		return 0;
+	}
+}
+
 static inline bool is_cdc_dma_port(int dai_id)
 {
 	switch (dai_id) {
@@ -104,6 +125,26 @@ struct lpaif_dmactl {
 	struct regmap_field *codec_fs_delay;
 };
 
+struct lpass_data;
+
+/* LPAIF instance hosting MI2S interfaces with their own DMAs and interrupt */
+struct lpass_lpaif {
+	struct lpass_data *drvdata;
+	struct regmap *map;
+	int irq;
+
+	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
+	struct lpaif_i2sctl *i2sctl;
+	struct lpaif_dmactl *rd_dmactl;
+	struct lpaif_dmactl *wr_dmactl;
+
+	/* bit map to keep track of static channel allocations */
+	unsigned long dma_ch_bit_map;
+
+	/* used it for handling interrupt per dma channel */
+	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
+};
+
 /* Both the CPU DAI and platform drivers will access this data */
 struct lpass_data {
 
@@ -133,8 +174,15 @@ struct lpass_data {
 	int codec_dma_enable;
 	int wsa_enable;
 
+	/* LPAIF instances, 0 is the core "lpass-lpaif" one */
+	struct lpass_lpaif lpaif[LPASS_MAX_LPAIF];
+	int num_lpaif;
+
+	/* LPAIF instance and interface index of each MI2S port */
+	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
+	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+
 	/* low-power audio interface (LPAIF) registers */
-	void __iomem *lpaif;
 	void __iomem *hdmiif;
 	void __iomem *rxtx_lpaif;
 	void __iomem *va_lpaif;
@@ -144,14 +192,12 @@ struct lpass_data {
 	u32 va_cdc_dma_lpm_buf;
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
-	struct regmap *lpaif_map;
 	struct regmap *hdmiif_map;
 	struct regmap *rxtx_lpaif_map;
 	struct regmap *va_lpaif_map;
 	struct regmap *wsa_lpaif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
-	int lpaif_irq;
 	int hdmiif_irq;
 	int rxtxif_irq;
 	int vaif_irq;
@@ -161,14 +207,12 @@ struct lpass_data {
 	const struct lpass_variant *variant;
 
 	/* bit map to keep track of static channel allocations */
-	unsigned long dma_ch_bit_map;
 	unsigned long hdmi_dma_ch_bit_map;
 	unsigned long rxtx_dma_ch_bit_map;
 	unsigned long va_dma_ch_bit_map;
 	unsigned long wsa_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
-	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
 	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
@@ -178,10 +222,7 @@ struct lpass_data {
 	struct clk_bulk_data *clks;
 	int num_clks;
 
-	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
-	struct lpaif_i2sctl *i2sctl;
-	struct lpaif_dmactl *rd_dmactl;
-	struct lpaif_dmactl *wr_dmactl;
+	/* Regmap fields of HDMI DMACTL registers bitfields */
 	struct lpaif_dmactl *hdmi_rd_dmactl;
 
 	/* Regmap fields of CODEC DMA CTRL registers */

-- 
2.34.1

