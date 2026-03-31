Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC943A75A2
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985980; cv=none; b=dOcBHIXRszL28MgjLtxVI+DUDD3Do33ZCYc5vkYEOQpt3tMXQzQHjQdcNAoe7CeqjRxESblxz9bBjzWPKSXwFHue4UzNkqBepNK6vDLa1tPXKQkh59OxT2+KtDfFmWustRCHnu/tOe14QPsrJ7PVG74cP9IgIcnhd1xq5Lx4nD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985980; c=relaxed/simple;
	bh=BXCnnROK5Jr7XSfuacF1JCL6R1HVhObmmDQUVuRBs40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdOHA9dSrc9mrYH3BJGwiXaXhr/Y++7LYuEAr8uGZBTIpOoEbUXHcMVcTBqRBDkhk+CTgdQdgvYjYxLdtoDKqCd+xLqC+ZSmCmRpMWGX4IEgi/VYnDkuv0f2HzRLF8G3GmrcoN8QQ9dK7omyl0tpp0Zy2Ke7SFv8w4cyQYrGfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLlZmuDm; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLlZmuDm"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfd44fa075so836592685a.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985978; x=1775590778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=iLlZmuDmZuYHLup5n1GYlUrLgsG30yGWK1dmRvP9LHymIEkH5TrKxqjw0MMaaF+bSt
         KvzmyNyiCX3ezrH0WDV0IcffG1JMIXli3QGZ9jes3jQ5QqxWa0UzsqxyT14iZ8pNRtic
         Y/OnmJ6wrKdaovJ9sC4e0itZfHR1JioQsclm473l4nyEPN1d4O7EMBI704pOVhXNC1Hi
         YLWThWz+rPeG3Csvv0b+3T3Ay5Oyq631dgOjuuHOhXtzzD/WaersolRfQSWpC5xVyvHd
         ByiKOmkEskOJ4+g5aUjQd4N5LprhKptx2MgwExqMkob/dGTQcA1yXPfAj5f9v9xhknQe
         b5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985978; x=1775590778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=ZjJuprjCv2l0W5S2/q/GhlHVunWRq5BlbAapdj4TQ6ZrNw8srh6gubj3UZAQpBdh6j
         3JHShRfb3IXg4heprTk2gTWNU6BbiV4IFz6RZo2lgUZYXK3/nefclyiDYkvMz0ZRXZDM
         a2uVxqD6xu3BhGpvuS68+KfICe7X9/8py0pPf7ROuVQSXEfmTRU5T7mmPLlSztx3X5qh
         AVj4ZGvElOUXLfQ/cuZlfvZVMG6C0BN7sAZHdEijZUooWMzWJzTZB/fF12zEiZ8THTqx
         q4nZUICh5Yec5I0Ld5ADUYopSePM1szbxHL51yFDg8B+ZXtRT7LKWdNPS+0PrLjLqtii
         jp1w==
X-Forwarded-Encrypted: i=1; AJvYcCUh/LDPUBRA5pi15bSC0QD/lbT+1T8jKFS4Gj3MJ2b/LhGuwujCIstljVBcjbPcxvX8KeWKhNg5o6f9RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyumCdYhoZRZZ/MwOAfghuqSrsa4Ljl3SARObXa0Ffg6BDtDM3F
	Xh4Rjq3fl30R9wX3iY7AxyWFNnUl7px0+47auLKMxIGgbRamOMyzXJHN
X-Gm-Gg: ATEYQzyte7pvH4fUUQxDzzzLvteD+GsJ6ZdYf6Bm6AMSYhlfBgwc33fxFPGtJG78/zZ
	wUo4Z4zHppf8MXzC0D4oIeHpMrVbQqN4CkMWJHLeKppkbFoF9fF3L7VYA1dRc6nJVgBjqG7ujdf
	HaW3I3Wss+oFu3TugWJkcpNstdExvI88LLGw51B14cRZJFH6NN1zkk9GeKWWTIvmBr3Uf+NlCxj
	sGKj0LabI/6nmff1WubRHxBwh27fFZbDIWPgP9N9HReIzsC7luDm1g2Zp+U/H71rU4QeLS/xZoo
	R4IPZzltPSXiMr7ng4xbAhH9tj3+YHZwaqYJuYnxgM8HGSguXGt0NR91qxwgS0C+CudbNFPXsDa
	wAz9PCc1loOOAU0AXIqIazEzGemBJ3zgSc6GGFzb5RfCMlixhxiX/Yzqcz6iesc3Y2Y13bMV61p
	/ISsELrXEH8Yp6Kn0LsFKQqatv
X-Received: by 2002:a05:620a:4503:b0:8cf:c75d:2a0b with SMTP id af79cd13be357-8d1b5ab70cemr159538285a.6.1774985978137;
        Tue, 31 Mar 2026 12:39:38 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806d7e5sm1155303985a.36.2026.03.31.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:37 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Tue, 31 Mar 2026 15:39:34 -0400
Message-ID: <20260331193939.40636-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
index cf1f3a767cee..7e2a8745594d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case INT0_MI2S_RX:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.53.0

