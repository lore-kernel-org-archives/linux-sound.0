Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304613;
	b=x6qP7uZv5aL2Rjqgt4SvYbMSaFbjlh3xejN71g8ufZFl6OtCEsiniIMXOLNSZstbBgcr
	 /D6xEVJkW2Qw+ynl6c1lU2Dvm30AYYp8QXr9uaCcNSjqOrlkMlXC9b7hZBaFDxnWZNq8t
	 Ee1h+nG0IDL4Fcn/cSTMxkwNdifRzsKIzX/kReDynACW7b5gJu1o0wlXJye5c6PFi2rc3
	 tyCcYvJcGOR2VQ3ArCCiDFEsUx46MSQbzViAzdwWoJojA1n/gGbpmlws2iuSwCCMTHflD
	 tvEG8gTE9L4zC7WncA7iFVVPfPkkRFBl6t1c1PdLrfG0WVrX1729dCP8on3a0oAk9xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
	b=RfcxT4611YF0CKsvVRe+LpoT1iT8VBkO3y+pwg+lhvA2NNQcwdQ8e5xHrZss2ktkJzVB
	 7MjOCRB/nJQk7za2WqPiJVE7IuTfbeH5gTX4puxsRltZQpLy8p2OTUSLV+8sUgfC30TDz
	 njDk6x6nwoqwowOyfyi1bWTN7QGhn0ge6eg+M3mhvODvFimOSioanQpuV2vCkmsxTYD2g
	 MxXjWJhn2Klz4EV+J6auTk1vQsSGs/1yhzjtNLKbeubet+qix2aE6rx9EAQYI237VB9gn
	 +vu+ckTEDCG6a8GIrWbOqprDx72z6E9K13k5akKhlFnrqrU2Okr7jhCROMK2pRidklg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yvt9jK/M";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E568606A336
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E568606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvt9jK/M
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so1550103c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304612; x=1794909412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=yvt9jK/MB0foe2S1knc3VkPPSy1xTMr0MqRecg+KGnLCGVRqgDK5oBdudS5ZO93AUl
         QmJpw6lWnvdPeiSxBJZHQPKJjFykpp0j4pu1UEZ9iCxlV8h6KRuLbYAYULNLbHuqCeZz
         yRKJR7bRdr7S9ByqObxmUbMrFGomCQatJ1+j4SWVk4Z8CDp+HrGgRAvx3U4b9NQWTc1t
         Ps/8W6tl2ZrFqYrE/qv4oOi0X0MKuRKu1NaAJ/lREI0//ZnQY+k1TARlzpD8iikTVdIq
         HUBvaAcNJXao1tG2cTveFlLlxUeJeK+4bPF5sMPbMPbS4bK2QYXNR7twjRaB05d95ue4
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304612; x=1794909412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=KYUxZ0aqaIQkQj3x1rvrKar7y0LkeLhDnl5BnF1IE+YDl1kZnLs49ODQE9lgWAm2KP
         YfgpjPpVTb9NSiSRppgwWy7O/9Oy+Z5LN2Kuqb/RMC+CTG2dHgRkF/CsUX5TyZeOyxHN
         fvMq3pxGKKL3M/0G6VnTo4Rzh0JBg+jkXggL0sPEMw0pA9V7GPXIUVg+ghz5mgUSEGkc
         QgIMIl1iYR4p5iWcSNTQhMQ+IknxwxJZGdfl6XylwDDx9hJnPNMHSKveGik699iVmHaQ
         GLyb0jRbBfq0ze3CQMJZkJ9vkRub7P+d35p+ZyMHtZ2vD3AXPvD9xPEnco9SAqmTIyCu
         CzDA==
X-Forwarded-Encrypted: i=1; AL+hErHAnP2P0E48ky5sKBmDd+al2RYiev+jN/WYSJKu3pEtDU7y7MNXcApRn5w9dcHCZqbJj1a8zcf1Nj2/sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lBx9Cn4uXdsFK02dLLJhbTwvR4iVHk8Jj+TkcGVyUlefL+9cc
	FZtiHx6PzGxj6mnaKUsBkzZlEk7gyao1+nZ/J/NfTu6223OuGhOk29nh
X-Gm-Gg: AYBFou0893KLdtZjmp4z/VM9Vpua3UTl0EXcUVZr2SN6MArmbcbLtRaoNDnl3Nl1/lw
	NITv/QrImxuAlC/uS5MhtHHv7+yjvfjdwFwjepikd7otnRIAv5Wgnfsu0GcRmh2nOE0EgxL1u8A
	ZbPONyGUdDmmSVTC2h9P1E0bDbGVPCtRtuDvVWrC4sMQhfiHgmPNGQgDDef7Qct5wCTJp8qUOQY
	bOVi1lwkFq9nDiQn2RrRbgsjiztiROKPXCqpGk8BQ9mpALH61n0WyVFtbQokImcx9ZHPmIv/ZAx
	Otqpegaufqa95uCfxYjpHLvnVnwPVCjGcD3MXcMMgWlLKx+GmHgHxMEhsc98rEMmbGljB87U5yI
	zxAGVC9VF9A5CT0w/DTQ8CDarE01Q9/L7r/rrUDCMdJbVqBTm2HWnuADeo23wwUPcliFXLf11BD
	/folRKZF5ggyWnU2xiLuqYRSMuWdpNYpnnsWxlapRHXHv0TCm6weqnkxOb1NXruufRCXtoCAiVY
	MlJB4bqCzz8zQ320GH+OYn1FYHIHAdCO6MDlJggYWmtwyzU/SKRHhuBdLVA9Fd6bZWMoUoGJD3Z
	ekCT0Ym31f1KRylxwl1t6kuBPWrDcXxEVZRttKK+CHxvt+c47N1yeGmfnMsie3cfJXFNmMBcdO3
	ceERnzdNiGRf5L8dNS0DWEkFxqwIqeAuzIgh5O2sxS9rKnY5hRuuR5yiwnEggXefPhQ==
X-Received: by 2002:a05:7022:ec86:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b3b60090d1mr3491485c88.30.1794304611890;
        Tue, 10 Nov 2026 01:56:51 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:51 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Tue, 10 Nov 2026 16:55:22 +0700
Message-ID: <20261110095525.504660-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
is one serial data line carrying a left/right pair, so the maximum
number of audio channels is 2 * (N + 1).

The current code uses 1 << (N + 1), which only produces the correct
result for N < 2. For N >= 2, it overestimates the maximum number of
audio channels.

Use 2 * (N + 1) for both playback and capture.

Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 6a25d2a69ea7..c5773f191db7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -605,7 +605,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->playback.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->playback.channels_max =
-				1 << (COMP1_TX_CHANNELS(comp1) + 1);
+				2 * (COMP1_TX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->playback.formats = formats[idx];
 		dw_i2s_dai->playback.rates = rates;
 	}
@@ -619,7 +619,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->capture.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->capture.channels_max =
-				1 << (COMP1_RX_CHANNELS(comp1) + 1);
+				2 * (COMP1_RX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->capture.formats = formats[idx];
 		dw_i2s_dai->capture.rates = rates;
 	}
-- 
2.43.0

