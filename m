Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746153;
	b=TmGwp22nkQ3JrIjSYEqsepWCNSckmThDlC4/yyWqyeXb2Q1GoxvFbt0+Olesv4PtZAHj
	 uLo4BgCfdlqJTCn83bN7o5YzDLMUWngWBPYTgRxfrPIzc9p8vQn3i59avvySvb09CAt/x
	 /sFcOpGjF6b2JG+D5xcOO5kRgCC4UOIyNFm2HtOQ0aT5lswmEcuMln9lXYDR8Kbq199CF
	 D7hsveo4cOzZm5d55ZHia+46ey7KxWCbnEvTJICdK8tPHrEAu1exbXlgKNTD+V1ouDB2G
	 0a+9nXZRW5BSrc3+DrOmaNigvNuevDG9eT+jfcH+D2tepBdtyZZaiK85XE7D+lAf/uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
	b=uki7HZFgVx91SBphkDZwz91DwUfF2vx67ZJjR6E6U6ZygzorCXhGaEAnH8LOzNtBkV+J
	 F3R0f4XgBu4/wsz5nJQq3SDU/PAJf0ZvHXhW+1J0Y2qiKYzbiFqeU4pTX7vXEehnBHwyt
	 itggV9eUl8+cy+A59UPp5ScxXFG1nO0MndpN7zwYHie1mUk46/7cziDiJUDol8Kjt3f8D
	 qIHglu0FG6JzP+0ttjouJajr1O9hk6uHuXU2xMiM1eMd+8WqXIBaKerfI1pjW2ZerZ4hb
	 Qdt9rPX8AfWcLQv5yfqPzA06aAPXldpWqogefZF+PrtHUSVP6CiYOLKUrrQfTkAyEUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrvQw4yJ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B356606A31E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B356606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrvQw4yJ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso479747a91.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746152; x=1793350952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
        b=PrvQw4yJzcrEcUpIH2yGDATjupfz0mfO4kdnoptPrhzPF2ChL5mjYKmWKMutbBa0gz
         NY/cSW5SxB+49afcl4wEvs3GuM/ZmssSGNqE0enWZPyGxvPaOvyZ1Lwkz7arPHfutgUv
         Gv1/j7UwHEcc/QT3tNm1X8579frKp1Fy3+HnOTruUpw7W4AFYovUVeyDTbYmLkMVj9oK
         d6cRU9FvgmXVzxhpKwCHNVKBOYFXKaoOMvEwrQyl6ji0jmfQn9DWPbPJAV5ohhQyXn5g
         4/XuhvbiHl6LPHuvQ4rxiNEewcEHOdRMD5sAIjtTj3sAOxde/WJ2BTf6ll+TFujQvT99
         A4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746152; x=1793350952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
        b=TfBngGCV89GMnMZryp4oCk/xvvtF9pvw1nYyeebXWGHlrPGgn8pCjlUq9ehGGbnTFY
         syVuAu86zHlMvvgCblKHCh/wvrOyPSPTEnfAQHHdEBWLBuhAHNzNqd/nF363/pAlRXRg
         KWG9fTQ9bcmTSm1DAsfZL+gsmk6x9tBWQLosZslbHUzZ648WnNJSlU3FYrFUSOdjM6Jt
         rXqt25PygS0Xpb74ItuaOpAkHOC65ONhCYluizP57Mzz6RDyAv59x4SnWBkzwMHSiAk1
         kZ1uEKdvrjT+SN+qXcvFF6m8jHb5C/lPsTba3pYWacmuQLGOSnHYQOkfXiik+Ep7i+Ld
         6K4A==
X-Forwarded-Encrypted: i=1; AKwUvBxfSkgDdPZKHASjwQxhjX3YdBSLMEEivNUFGMY49t/Cgzlgr/FPuc93LDnjr9A1/+9ISyZXuEq23AXl7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIow/Dq8LY3p2OUK5wJbmYWG/XFunDkxEA+Nomwpu7FrSSvG/4R
	1IIUiBulVIrl3m9e0W48UGsf1nh4SDnSR5Su39h6Kvko7/aRInMFQnXX
X-Gm-Gg: AYBFou2O6wNQ9nM/kSBrQdze9CEThbCx3st9d2u+HVY84yBVRhSHoUIUN1N6Q4MRdbo
	A82Ylov8yISjAHFrJzbMiMuvmMDKrM+BB3DP5O+7FRMeqL4E6SVej+lVFoBRToDAa6FOd68tZ4E
	39RQNE4rRIddO+BrjoCz4YFfA2bkVBBfq3AEHSFf19G+qoTHVswc3o/RZf/NItDSydPrq1nyYIa
	msJNqiqmc8oWYpJsYzx1oXG6szquMlq0tPun2Jcy378Ilh1BBO0uTJhVeg+saLBRr5Ua7gaejMG
	MrYrBFvlUY4Iw68oCa1oA7vLDYTjYYYEPvjwZjwEUTNyzRxOHK7fLIPcwclXzS4nRttx+gEXq9X
	xiNZ1Z4cK59PjEK9Kz2gw1c8jd/2rJsBWamtUxwwInEr/mf5VRS/zakNaDmDOzp1eGo6vsESP7u
	ZRzoFDTHGGrbdeTtNxp+4TGptuEeeliFLWoEIY/AzAkHFmeqdLtiyZ1Qk9LkNbcHKPHc9/5rrQw
	n7CrkwbX/ggGtCwhC4s7tPgUjq27laGVNUZ+LTxsUsMDKZgzygdTeIu/J+2wuEiWZvJI85vwzl7
	pQ4sPWiJ+G/8kUf2MfDaK90tvZZZS8g1VKdjveL6FBgWmA6UPBJdzh99WjulzT9w8tgWpyU=
X-Received: by 2002:a17:90b:2785:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3adce45d4b2mr1018251a91.44.1792746151727;
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: codecs: si476x: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:55 +0700
Message-ID: <20261023090157.518032-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/si476x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index 9b904450ab8a..1738377d7d7c 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -193,6 +193,12 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 	}
 
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	err = 0;
 out:
 	si476x_core_unlock(core);
 
-- 
2.43.0

