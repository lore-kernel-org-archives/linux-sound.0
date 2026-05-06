Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F663B0AC8
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100205; cv=none; b=B7CiyCIbVDIDoj1/H5UP1BtR7/bx04F285AGeflrxc0WBuydtJWGun6NMbvNDBXxLb32/FJbyZ0nfOcI9YXhnJJnmtL8Nb9V2JIxsfEOkpte3PGiWMaU/IXd+N4BqrWPREqRuix8swEnhVLN82yrxWPQ+UFLqukEITe1ieSXlPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100205; c=relaxed/simple;
	bh=KK4PCBaRdORX6zmggbvhDPAyBW9xmTKLJ7Lr4HzmAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xi8ZBOWkJUSExnMnpJ7QkE9gVcVHDv7z+gZxGC9VM/ZB+u/NJjQgnbaZin+F/O/78a5jnjYnVpC1w92qzR0WxPClwZKZIRa1KcV50FEf/aGtlaM/pk1OvvILPp2q2Gp3I77Ay8Sy04njWALKPPQSuIXhH7/Jb9Zou5Pi5g0SUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=pwSb404N; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="pwSb404N"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZApfdz3ALUTL6N7BA3ZFZeFOe0Ov8S9Lcryp9JLM2M=;
	b=pwSb404Ncyky1c/VDBuTSk1jeQ14hmKYkGvGvd3oP00kD8PBTWx7Xh77OeWDbc7rhKx0g0
	Sv8UctKkMjisAbn3D45ZEbDh2ZBhGhgbqaRTm6pJis3mCmv7N1uuR0NJPHY7mrMHXzhd+O
	1KD7WTch+QWPp/lsuBqY8ce8NMQhMnWR1IF7XR67E/W0AaT+wnD08EWkjKGdqb6P7fDQH9
	4pgCwd537XtBSRRGdVRSR2HsdemYNAoifLhOPCiV0Gm5vDhIRf82pOugGsfoNx2ZPMisM9
	aBgZYoP4PTEJQX37YC+55TCzw3cRLY+5mmtJnxUyD9usj7NM3UGv2xD4Mqi95Q==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
Date: Wed,  6 May 2026 17:33:04 -0300
Message-ID: <20260506204142.659778-4-val@packett.cool>
In-Reply-To: <20260506204142.659778-1-val@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add support for the SENARY_MI2S_RX DAI which is used on some devices to
send audio data to speaker amplifiers.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..a675913da943 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SENARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

