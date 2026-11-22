Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364104;
	b=lMelS67J61xFYlVWMwT1th2voF6Sir8pymauaQcoycKDH1pr4kvBgATs4P+6j3VNdGbG
	 1y6zGRT/zJ7jYiaefSV9y9I+DRUYNO7aXxPFlTpO9L+AwjdgsdEt1S1OygxwIocYXC1gn
	 iuCpUk9p+4KItCqpa3ydxw3ju8jQId836pN4+MCWwPLz9Iw+cmoy+CgZce0K2T8D5SMH5
	 S7Cy7jUWI2p0eEk/RC/s2CU2HVDmjHGDX2JybHhhY3fWHFrhaG7BwbtYgDhp14bKGM6MR
	 uHng1sz4A//pxC31eKtAJphjGInzr4Hexq504n8hP3oRS9hSC04dByAzqyG5Gp2+1gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
	b=5dDTWY92qLvxwxRGur0Av2NOnU9NsQOu2u5kxIgWfIo05s6DD2XE10w3bINDQjJf+cH9
	 Iupeatj44nSV2gf7rbhJddEP4e2IVA3FUhiKy1R1J6Hu5zleSCOUAeevjqFzysj2hUjRd
	 tLfscvlh6+JRZyXps8QM4XrfS+7zOxZXRi0JPvupAI3DRFBDLUjoNqEwbA12WtObPA2CF
	 L9/XgNHehDMViCz6r1TAd2lIBu7VshmFIjfE26R0PA0D19Zhn0kNPWt165znj34s3elEc
	 iSUhJkGckwYYhQVwtC9siZ6orECOMJK8cuPwVbbSeGllKhxP4GqY1i/NBaHYl7eyM+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAXM7EUN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hq+v6HYv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B267606A6A9
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B267606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAXM7EUN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hq+v6HYv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQMvN279455
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VGMpmYFw4Uf
	nxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=; b=jAXM7EUNyUC/5RdkM1csfu0uccO
	vfu4XxecAxr1IPBRoSFxSC4vhkYqcfSOQG5dnxxX/zk8GJRj1xtY0q81lsCLnIgy
	DOFNLMPHR9P+tuHG2ure/uE4B6O3HeryilLtzuC70u0KL97ckH0Ts6o/MLh/BNl7
	OpaNO/HlCifutfgxIy5RFjV8BDdGq8HOMEC6qlQijqqlJLNz1a9qgOyTin++dqi2
	mg8qsm1MEPepFNWu7CzgCE+i7NV0TodujOub+TsgLJnfiR66bt2qfWqF7eE/FsJm
	XLpuXDI9ZKMQWJVU/f0B7yiZYGEIDeQOt4cFWwcuVkHqzV/jcHtDp0B+mfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6kteg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso469573585a.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364101; x=1795968901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
        b=hq+v6HYvrjQsUFjhdcCvHn2X7bjLGv170fv7dD3/hHp8DsA+cJ1U3+LIMGvmEWdLNN
         P9ArtuDPceDVqK0ht99s+zz8avMJRaJ7ojnZyOSjal42jL7lTkhV2GcTC7UHrgJIx8uA
         idKxJI9wrRpTu7vOZ0DwBCfvk5Mv+Iwno72nQQ/I39SjJ86ycTZIOvXWGX9UBlLcB5Cw
         tS85XHmypTXBy2WbEHnHyJmW3Ndj9nSfqYz69MjupFkU8fydX1GvWT0fBoob0H/qFDVi
         cGP5fT4FLlxiwlPL3OSsHvVzsaCq9QdGQZAkOdLwVHn7GywEKXigciWuaP8VvtyUUepf
         Jgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364101; x=1795968901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGMpmYFw4UfnxcucMFcKMjnTRYxX2/t+/qg0TbI8UdM=;
        b=N494scvfvZyBXr0R6Q8V8YKtPB1zna+bGHHvnO7Ggzy7v1p4k7eCm6+sW3foc7lI6Y
         yN7s9QOmRMOrmKUMDFmcths4TnS34DQ3qD5+CP50A4aOptigVVhOElhmGKNixFXKU2ll
         kCD22htmapYE94SbDaRtT+LMQfIawiLzV3jt7zV8N+c6dVQJTwqK1xU/6KuwmFdhKt4k
         /CjDqOzsugymfFCKTadkH762jXLIlbXwj6RAx/+ss1n+rsB1ZSzWujDPKkw3aWOKS8JG
         MlAG3W2/APyeFnC9nvMcQOniMs61mh9aw7OfYQIZweWqbr9ZzQEPMq/Uwo3VUZYhw1ow
         9lUw==
X-Forwarded-Encrypted: i=1; AL+hErE7lNNrj93hKDCAexvYIdkFmsUFE0ERi5U/gLAVoNQOdzwlYXlG/E0j4Hnxq3Klyary0agDHEreEo3Gqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+uXQlr0kiMuliSZYQ4e+/t7UFCcSVyTAdVLi0RJbw/NocZdh9
	qb5fiIhu53HZWVLc/9JM6raDi2HszPfN2FsqwbrjZX/b7PBCy0//JfHweMzQyOzzQPpN2Ikdpx5
	r+4FuHLXDx8Oah/v8kcilusgicAkB3vDaHdvL/n1+j+TyATSL8gBWD4qF9pHu+NVAuExH4SxSUw
	==
X-Gm-Gg: AZFdTZdWatQO2ix4Tocmioe7xhxpBrlKnht5Xb7IO4i4yekz1CJwszE2fhFMbnyRGd5
	ESNTcJoI9pcuvdcuS3PhJwDMEbOPEKQ4XyW/ppRaYW9xqgUy/MGpYHSULNdzdmeLSZ5YUBXuU17
	opGKohyDG4kmEMPMOb4vm8Obwn7158+FuTDl0It49eXnZFOFypvls/hZZciTsKTUJkT9AShhGKc
	qbWOxFsQ45GjKAkiAwFI6KaH71oRh5ZIlZux1SCcfp7PoYO4uKk3ppHs7Hvmd/dzRiF5Yus+2vq
	h9xefJXgKYTvSC3BVnaRAGXk//dTYoJnqh56Bx50Bt4cC2VGuZ4h0T1h5HJGXnbmZDMtO35iY3F
	1mh0zf2LsG+AkeUVBivwxgt+zEWpdPoewyHNhyuZoneRute0pxOyvNwvNYujPtDoF
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr1480046585a.83.1795364101190;
        Sun, 22 Nov 2026 08:15:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr1480041785a.83.1795364100743;
        Sun, 22 Nov 2026 08:15:00 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 07/24] ASoC: codecs: wsa883x: add VI sense capture DAI
Date: Sun, 22 Nov 2026 16:14:20 +0000
Message-ID: <20261122161437.5994-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KRKZBCpBRfemx0RhpX03jRlkHhLVwVnw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX1v4cQ05DZIgk
 zKA+UYOqC1tbPcZCcbN9gziWdEtXoCTR7aAA8dRw/UrKq5QUj7gzbyqzmGbje5Gqo673NDohSQI
 zK56ErtqMzPddqzZB12ua27oJ9yEd0U=
X-Proofpoint-ORIG-GUID: KRKZBCpBRfemx0RhpX03jRlkHhLVwVnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6+hYKM68eydW
 R9nYlsny9fPiMT8VvzEz11e0ru1twuegPBCsm3KbPDZ57K/PWgX2bfc6WXv7IlYl/nTztujtURY
 4NRZI0MUQI6ysXbc1eQYLkmy9YSG57WCl5Ns9jLWmsxtsf03fHfct0kc7BQ3rvZ0UXuUO14QbOj
 QbAgodRCau8teqaFac/m6cfswAKD9EkHwZNrqADvrcanLpYZsdtNw5vyLis246nR23vv/68zK49
 oTiP2kTcSMHsIUauwzEcKkM0EhNUTgwyKQNpxY4MnDuSGQFhuaGvS/PKvU4KkP8T7PrLzc8sW6U
 d8P5AfTQ/y0HCBSrdm0omtXIqHWlo06kFOdVJZLl3cKZFr8SfJ8mvzNQuG0XL4fFgCNkV2PEugC
 cUcyTC1Afk4/AL/MmcUmyzGsFnZTTdyiA4fDz63G+Gr7vKNv42NSpkciuQVVkK5IRaPTC9Ayxvg
 1d94B+QlVclEFO+53RA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b031506 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oWCxSNl6vTUgLWVSTv0A:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker's VISENSE port carries the voltage and current sense data
the ADSP speaker protection VI module needs, but it was described as
a sink port alongside the playback ports and had no DAI, so nothing
could capture from it.

Move VISENSE into the source port mask with its own dpn property,
give it a capture DAI with its own ops and stream runtime, and skip
it when wsa883x_hw_params() builds the playback port list so the two
streams are configured independently.

Each VISENSE frame word carries the voltage sense in its low half
and the current sense in its high half, so this is a two channel
port; a single channel mask would deliver only half the pair to the
DSP. Matches what Qualcomm's own driver uses for both wsa883x and
wsa884x.

Also install a bus_config handler that programs SCP_HOST_CLK_DIV2 on
the next-bank slot: wsa883x needs this to agree with the controller
on the bus clock divider once a VI stream is enabled.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 77 +++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 64391d654a08..6de669288d6a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -437,6 +437,8 @@
 #define WSA883X_VERSION_1_0 0
 #define WSA883X_VERSION_1_1 1
 
+#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m)	(0xE0 + 0x10 * (m))
+
 #define WSA883X_MAX_SWR_PORTS   4
 #define WSA883X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -468,8 +470,11 @@ struct wsa883x_priv {
 	struct regulator *vdd;
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
@@ -522,7 +527,7 @@ enum {
 static const struct soc_enum wsa_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa_dev_mode_text), wsa_dev_mode_text);
 
-/* 4 ports */
+/* 3 sink ports, VISENSE is a source port */
 static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 	[WSA883X_PORT_DAC] = {
 		.num = WSA883X_PORT_DAC + 1,
@@ -548,14 +553,17 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA883X_PORT_VISENSE] = {
+};
+
+static struct sdw_dpn_prop wsa_src_dpn_prop[] = {
+	{
 		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
@@ -1125,8 +1133,16 @@ static int wsa883x_port_prep(struct sdw_slave *slave,
 	return 0;
 }
 
+static int wsa883x_bus_config(struct sdw_slave *slave,
+			      struct sdw_bus_params *params)
+{
+	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
+	return 0;
+}
+
 static const struct sdw_slave_ops wsa883x_slave_ops = {
 	.update_status = wsa883x_update_status,
+	.bus_config = wsa883x_bus_config,
 	.port_prep = wsa883x_port_prep,
 };
 
@@ -1335,6 +1351,25 @@ static const struct snd_soc_component_driver wsa883x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa883x_audio_map),
 };
 
+static int wsa883x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
+
+	wsa883x->vi_port_config = wsa883x_pconfig[WSA883X_PORT_VISENSE];
+	wsa883x->vi_sconfig.frame_rate = params_rate(params);
+	/* VISENSE carries the V and I sense pair */
+	wsa883x->vi_sconfig.ch_count = 2;
+	wsa883x->vi_sconfig.bps = 1;
+	wsa883x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa883x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa883x->slave, &wsa883x->vi_sconfig,
+				    &wsa883x->vi_port_config, 1,
+				    wsa883x->vi_sruntime);
+}
+
 static int wsa883x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1344,6 +1379,9 @@ static int wsa883x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa883x->active_ports = 0;
 	for (i = 0; i < WSA883X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA883X_PORT_VISENSE)
+			continue;
 		if (!wsa883x->port_enable[i])
 			continue;
 
@@ -1363,7 +1401,10 @@ static int wsa883x_hw_free(struct snd_pcm_substream *substream,
 {
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
 
-	sdw_stream_remove_slave(wsa883x->slave, wsa883x->sruntime);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		sdw_stream_remove_slave(wsa883x->slave, wsa883x->vi_sruntime);
+	else
+		sdw_stream_remove_slave(wsa883x->slave, wsa883x->sruntime);
 
 	return 0;
 }
@@ -1373,7 +1414,10 @@ static int wsa883x_set_sdw_stream(struct snd_soc_dai *dai,
 {
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(dai->dev);
 
-	wsa883x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa883x->vi_sruntime = stream;
+	else
+		wsa883x->sruntime = stream;
 
 	return 0;
 }
@@ -1401,6 +1445,12 @@ static int wsa883x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa883x_vi_dai_ops = {
+	.hw_params = wsa883x_vi_hw_params,
+	.hw_free = wsa883x_hw_free,
+	.set_stream = wsa883x_set_sdw_stream,
+};
+
 static const struct snd_soc_dai_ops wsa883x_dai_ops = {
 	.hw_params = wsa883x_hw_params,
 	.hw_free = wsa883x_hw_free,
@@ -1423,6 +1473,19 @@ static struct snd_soc_dai_driver wsa883x_dais[] = {
 		},
 		.ops = &wsa883x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA883X_RATES | WSA883X_FRAC_RATES,
+			.formats = WSA883X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 352800,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa883x_vi_dai_ops,
+	},
 };
 
 static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
@@ -1636,9 +1699,11 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 					WSA883X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA883X_PORT_BOOST, 0);
+	pdev->prop.source_ports = BIT(WSA883X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa883x_reset_deassert(wsa883x);
-- 
2.53.0

