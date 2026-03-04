Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D083D6CCA
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654374; cv=none; b=BL4Zr0rUaIajPM/UxxaIEnKeLg4rPFSpf7iHJWB3MSFwbw+7QiaBbg8Cq0pSgluhuTrBjUNf9tv0dIPJXq0NTpbOzmdVrrYKwgztnijqKEoxV53SUwkeoVTh5d4PVqBLLWPYVqVLmzsvO1VW8rqdG9DcAk8RTjdEEFTVITeJlLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654374; c=relaxed/simple;
	bh=Atswd7XoWexAHoA656Zx8+pkzN3C1wZOHJtIQAxglfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpEhG65IczBIig5aqsLqwAuj3LvN9ffDYjAZCZI1+TBh85fnVyU+4/cL5qBB8x4j++4OmeXAkAQ9KNlRWhmqbYIikgCoAiWiHL98xRvT3s2aOfHEF+BrKemCTVHzXkUfVhH8pozjfzkW2sMOqbqdaII5sLfllNwZVRcvwTsJPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF392ueY; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF392ueY"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb40277a8bso758530585a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654372; x=1773259172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTnNNwyMSp+7AFSV4aUBjViYsyPkYU8KkKPKkk0kktU=;
        b=GF392ueY/E66dXqdfQlsZpDJMBVdpVtZGAX+te5s5zZe/slKarZw7P26VkwhPL+ssW
         hh6TGoIZj2IlmNgOSNWyJSwzZt/Xk1iVqYait2Vn2KWDCvEO6tOZD9jepZgvL5GDUSQB
         LUwcERdFDkv+aLSHvDx2ltnDGKuJuXOEefnYTxN5wDUlqClzbChzWvY77nzlys++kKG6
         KJgZxnrp/rcyj7Y7rVk5cX9PCRh+CqxDU/nAuVOKFg2ABZPaisPvpMu37uO762GDgV2h
         JVe2ZIVdEgdD7W+TE2e0YhAXteYHY7ZJjPqjDWTYz7SPML5ljH3ZPs6Vjd9uTb7aHNp1
         8I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654372; x=1773259172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTnNNwyMSp+7AFSV4aUBjViYsyPkYU8KkKPKkk0kktU=;
        b=Vg25KsZCG1DWuxfz5SRWCbYavKaWJukfDljZfqGi4nHANm3D6/Yb05F7oLckHdYRU5
         TKAxFZIU4MHTirRKeIohtG/jZJTZJGXqkmwtXOrAs4/1V1bqcOC6E46/dU2qlhIWVx3I
         XU5XkEKZORWKSU0BnJsTT6k7rny9/93yS6PiVOQXxvcnmgJmPcjcKw3lB+xmEWD8DL4N
         /sXTBOzn+z6PYNfC+tPzMSyTNYU8pmeGB3Oy5DueVx++rO/JftOYYSaKTuXE0GQsWkS/
         juoz2FcKA8s2R8YDzgBIIto0tVngmcEx+vUt6B5GSXwc7VTpDERgzH0eKMJhgEsG0699
         WdSA==
X-Forwarded-Encrypted: i=1; AJvYcCVBTURs2tTlAgp62GZeF4UWxTip+L7rRgI/0JHivHV94bwVMGvq788cmG75BOUsXRrL7Ycpd+u4LxLO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxll2fw+aFBej8OjGQWh9Jqckw9vwCfKosZXse/GFdwlsFbeMLV
	G65mXIGc0b6Link0U9rH72hkx52EyZ/2oFLNbT/ySCCKlqSo+eJIBuMl
X-Gm-Gg: ATEYQzx3Nl3QbDIBemMfxxj7Yhujr3lIgEls7AJu9199wmi+IUUsFn7BOr7k3hECueN
	Yo7BpvD5Wa875ngnkHVAfcmeyEbsqTpTcDwatObBjHD/bW511DNb4G8fb8mhPQKT8zbq0KBsHn+
	mYFjyckCCxZLfvIlEH2tuRmxAsGYbQsS7yvf4Nz62dgzhDG7n3e6SFMu+lX8gXWWL+AmdItTHic
	EpOiMZ+tc9sUMBh6ynj2V4QDwGOeFcsu5l9Lik1BdyzhthxT0AZgjexo5wCKFz+/T4Wgf56ZPTp
	gHCmyY1NGac8BX6x0VaUbpxpx0UxX+/Wwsgs8l7/th5lTiqCk2V9xpDYjiHHzZPk/t31Eirg6FG
	RqVYB0VB8K9IJgnGch75vE4lv3Ci4VwHM9YMkatmTUjcrhNwo2KH8vFTPtNHpwr4S9iD9ULFp9L
	pM6umHwjRFP6/y7s3rRA1wqEoMOw==
X-Received: by 2002:a05:620a:470c:b0:8c9:f9c2:118e with SMTP id af79cd13be357-8cd5af1bd5fmr372427385a.32.1772654372065;
        Wed, 04 Mar 2026 11:59:32 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a1fcb781fsm10577136d6.23.2026.03.04.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:59:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 09/11] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Wed,  4 Mar 2026 14:58:13 -0500
Message-ID: <20260304195815.52347-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal MI2S ports are connected to a WCD codec which may support
headphones. Register the headphone jack on codecs connected to the
playback port, INT_MI2S_RX.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..aa5ba282166d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -226,6 +226,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case INT0_MI2S_RX:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.53.0

