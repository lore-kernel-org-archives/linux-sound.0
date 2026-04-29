Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860523183B;
	Wed, 29 Apr 2026 01:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426749; cv=none; b=mNk4cIUUWEKn8pncJRiQq+hZICdMT6s+HvbwfFHfH6B/rQF0FZrl1OW8XMl/UDKttig2a8C7nSyj6zjUNTln4WhoPcyUQSbOPBytCf2JHxUnkLFgZ/SM8qOM2Zmu4NB6YQreZM6JhwTdDs68TQmbOsuv5Y3p+2G10I4R7Umx2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426749; c=relaxed/simple;
	bh=fqs712JSCd2q2Oqmt1LbqXOCERM/xXmlTc8QrXeirL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpDI8RterJDeukwMO5gTCAe/+gcBSbay2Z59wOzW+Grho0koXYzsL12Xy/N+dpC1S3lmOmKXZWB+Ghs02yHXL5rp3EmLzppKDDtmYoM5zLmeHSkSTXW+k0drAW2olPQcHD5LOxgvxk4hzqtM4DXcJAIYIFz+sJBLiC7cD1hwSnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Ux5Ml9QA; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Ux5Ml9QA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426744;
	bh=umt9s+fWxPSHuP81XZcEF9uKcHi4dTg/6NHhQ9slX2A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ux5Ml9QAvRYWiIiN35of9j/C4ZTcGQ6f6dRG+wZdRmGJfTZcBYZAbJOZCV1u+/SFM
	 Ydn1IwEk45gMf7Bjn8KsbZuMSXbLwnGFuWOek499KLCdXJ8Ol6DnLpOxfQJaSQ8ZKQ
	 4uLIZ3tlnCXbC3tXlElLVWNZoZLLQxaYiFMIN7yo=
X-QQ-mid: esmtpgz13t1777426738tdd87611e
X-QQ-Originating-IP: vWIv63VhrF74ROnm/3QKqWXpoDGEYGEsALkQyVl99SY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:38:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10487816630640131910
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:46 +0800
Subject: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX is
 running
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1471;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=fqs712JSCd2q2Oqmt1LbqXOCERM/xXmlTc8QrXeirL0=;
 b=dOkNR7ewgmOY2VvQT0HJotglsEmMZlVysXzc+cYHBp6B84ugDG50p8cS5glYCM8tWSKL89oW4
 GPOpMOXWpanDhly6ItJjrKyqP673diM7Q2lOO/kPQfEvnQtFmta0DYt
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPVgWQkf6XGksJ3xgJaYfoTzYb//cGREN3mcLLVDKxOw4FgzyLLrNYQ5
	RMPWMQXQJP8miOcgN09ILcQrYZxydMCdzETBrvKWb+Mu4NkU9KDTeDgDdLy8I3gKfRGLzjr
	ABDt5o9jdePjmR931eys6TSNLifOlXNYqSN8n3UAfCkbNgtjlU41VuQVSiQcVzK3q4O6Jzk
	V0Qx+CAbMxo0k2g1pqm4sjcdB3nydEbvtf/JAMpmHCTzFT1ntLFakYcN7MUq74wjfz6PF3X
	GUA6wi0MWPvQbN3310Vpu7mTmhawlhAdraeCsiEcazgYvOEZ/BtpOUPiVd4OAvGsXSzw4Yh
	q36tFXC/YD3Bx109TB74ZouyVgpRUqubF0yer4rPnt7NAog1BfnWhk3zgTglH/JYL/G9kgZ
	5PEcwdVlOC3Pe1vCaoSBNRCrfvEwmCDLW+Z2JR5+ARnsyf553N5LxCIXoZLkQkj7U/ynCGh
	pVFzVPuBRJkQQQ4Xk+YW0FxNG1u36PsKiMY61KMOeMmqM5cLiD9QJRySEDNop7N+D/Bt0mM
	fqjG9kybuov4Vx5R4VOJLSCKWLvqAGauxE4pl3FG9SvRjgX6nmMRH/vOFsOEUld5D4JQego
	unqAEDTtlVp8Ls9xwoVFmN3AJjHP2HUJkcwNWsrMhl1zwpLX2el3T04+sqdPbLpTAukyhCr
	WWt/fT7LcA1djogNSX5tVj2Kir0hWFj3JhTzEbawB/dZwKohd1mWQ7NQ90BULjGyT31F6wi
	fHNVVduk2GuBQFVLB3kWMyPBe/hD2dJXG3MTD1lxZKktQ6dh8dFB1SHfF+eL5LSZMFdDAWf
	10IktGAyRsH9VEsEcPb4mnBJSPnpVzFLGD+dicEuO+L7E3/PBo1B9PRkVlr+LmftOLQ2X3a
	YkpWELfI1Otd81B9nMEyXdgRDkXEM3PsGSXCONWrCyVG+lvhjBwbwHpC6qLDYCbACNWe/ZQ
	12v/0Glm/mr4PqNcWS4Euu1DB9BM5w9WJ304vX8fqJPyj/tT60T1TbLhFAhAY6l4d3Mmv+e
	blx9Ac9xoBkL+IzG085ylQLWGn2TD+r6KC4CrVaY4+GlFAcoDWk39HEcSeR1RcUsMfj1157
	91wNQbkY1Pu8BunGBrsh9WyoWjhyH6JbuV8yuE9fTtaDVtkKv6QFfUikooM4KSTPIr5s+zX
	m3IG
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

When TX is already running (SSCR_SSE is set), the hw_params callback
returns early before setting up DMA parameters for the RX stream. This
prevents the capture path from configuring its DMA data properly.

Move the SSCR_SSE check after DMA parameter setup and format
constraints, so both TX and RX streams get their DMA configuration
regardless of whether the hardware is already enabled. The early return
now only skips the register writes that would disrupt an active stream.

Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..5c878f02cc93 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -117,10 +117,6 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 val;
 	int ret;
 
-	val = readl(i2s->base + SSCR);
-	if (val & SSCR_SSE)
-		return 0;
-
 	dma_data = &i2s->playback_dma_data;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -180,6 +176,10 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	}
 
+	val = readl(i2s->base + SSCR);
+	if (val & SSCR_SSE)
+		return 0;
+
 	val = readl(i2s->base + SSCR);
 	val &= ~SSCR_DW_32BYTE;
 	val |= data_width;

-- 
2.54.0

