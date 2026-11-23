Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477264;
	b=IvjX6JJUkDjd4S5J7Tp4t4JPzic490lov/tSiztyv5HypIP1C9Zo+3pqfu5XHHREXO+E
	 cG5ZAaILSwsypwjjjm+w+9Sh2LY/3RjStxYgrfIt9uRKQqjFuNlF6CoNo5+ZHC5waXdIk
	 +KO/zBK3suiNURC+NoE1o9vkIDXdf8TQCosv6MYIFJJCY/xqpayRZxcJC//YiT8yVCmcd
	 mFWsB/WCFcKsa3SuDrUKkFupa1qOGJGkJBPljY9O1//MdDab8CyzDTAwvF9AZxLoLWO2b
	 ygSHvPRklaMGGWykEswQXz8YbCe3CPvImeRYFouUNUUwrw03K2+eLFxm+c5lzw1REoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
	b=O8NPTIsD++hkjdr6WUf6S9D2336+zgBrHgiG/hle7UNEHyOKSf/gvWLNdn/4VkJVG5lU
	 81U6TDXSrT2mOi+Jg9HFSxczqeCOYgql+qZhXu7ZXR74cTnwm0/XjgJO9J+jA5ZTtXt87
	 cJeQVoVLcuwNw9BjO6JPhpHdTP0wQbYz5I1S8P4Ptb5IMaNPZ3QA/KNxWRAKywc7121xx
	 Gek5Rl63SIdbx7gTOl9YcdAtt9lgBN7P21i5LanGWP2kPyiPfR5cSxL/6JwS1QxQFs3yW
	 RJVefWSFFoaDAiUMn9HKDPGPdYIRCq2bEChybZTaQV4ZMlOErhBb1RSWLl4Zp0+y81Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+pGi9aP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D0606A33C
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417D0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+pGi9aP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so28210255e9.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477261; x=1796082061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
        b=b+pGi9aPHPJjAG60XPnEw4aJ2JauOkRfeYWtlxYPPL8XLvdIbaEVB5Da6wWxZx22CY
         fCvTGb0VaF74uc5irX+t4oGsYZdkKFohf0Jcy5B3cavSXYQWZVJe/FJeCr8hpukWOAt+
         P6JHOP3rR8x1+2vOQvDKmFbtT0KGMMCOj+nuuo6Dvklb2/vQ5k1zA+H1hW/tFxmoHVht
         q7zD2YlqPNR0baJyPzTuBmrZWO7EaQrWpkIlBBU+E5ls5PVKPPPvfvomFqvFQY3baSPA
         VL2cDhKqGKJTGMmd4G9MDQkuyiQeBEJyAGF/ADHEb2RlKXppyuYkzwzj1CLx4duSrmrR
         prOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477261; x=1796082061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3uATgv51kR5GwvABS02h/EcZTNE+WES21lxt1thsvA=;
        b=njL2SiyLyD8piXMrslDsQh2LRddGHNJyL3sSjzdgChLzoxiqlifHINvewnLd9M4hWF
         Xf/jLBAiZmuNiy3dQSwEayaww7NJoZa4sWeXAuDF7N6XBvGsf6LkQV8wplKStrLAjBr1
         mnMkiz8hfkQ/9g+g+iCnBeD8mll5ygmHAJJHg/lySpGMJ6X3+4ZNoT79/RzwQuWI+x5S
         f7yHx4UtxF2s0QWJDBXUXI9KlXeVxRHY1oWNyoVYwVp1OIoaL6MOzt/gc59sFTWpXbRH
         UXVp8McHxBYKobkMLc2cXL7mjp0uHc+fPA2P0kbjWGMCOLBKZOthTMIkpCPkbuY36hLO
         OYnA==
X-Forwarded-Encrypted: i=1; AL+hErFyAtsYKFNosCUt+4dC4qLJN5/GzI6Guny9gULsoHF9HSDkKl0eBxU30iRmkNOdW2NfiUmLRBxj0zCo6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SID3/aJ8L9aIwFoL3k0sIXmDP3HoP9HMB/qDWEWjc+zm76+38
	oysb/Gwk6RxypRegsQfDwSR3kUHvfnWlsyVZQjCXdr/iC62Ll2U78bk=
X-Gm-Gg: AZFdTZdNm2kEvx2fNfKqsrlTZISr4W7Xud21bxn3E5Kh/wCrX3DrH1iQFh3xrPiwX9n
	VstnLWibKR+wgjSAU6BvwL11aV9LzpKY903yE3mBkNF65tKYNFLIO7Hc18NX5PrsWNWPj7kJRT9
	snEXdQJKMb+NV2mIVc3kigLVL4fCaFfs+abYprsB2is5Ku97wTChZbWFJBeDAUtH7tgzVj07ku5
	GiyLtqwL/uzzzEwoY+iwfcmExcGA6Og94fxNnP9Uvo80M4loGzphaJAFgefYHcm/dLhhnUUIEkX
	7lGng+tTgN8wF1DnsaEoiL+oEawTShzoO9iIyT82HVIblTV6A95seUnpCNMP36TpFPHV3K4AhKQ
	uLt4l43jGzQVWZVGJfRU2HeWn0Fr0tXXHd6HwNbSvb/yonBWq2qjlJPdJBui/9u18AHEKymF48w
	5kOSY192dGM0RD2IkrEU/KDfEhK9PnWZPf+3Dil/2BalIxTYyTOv7fx9Qs9v+9bYh0ab6ERwRsr
	ByXlzY8WkF+CKvSwEErVPbjG8/1arqq3JZVml8BjO5kL21tC+iaDtXflh9bwou2b9dP/lhi88KY
	7vHmd4wAzNktuPL8cfzdCtVplPBi5U3fGd8mkHZBAmMhN0Jq8s3aIw==
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr264518435e9.11.1795477261465;
        Mon, 23 Nov 2026 15:41:01 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:01 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
Date: Tue, 24 Nov 2026 00:40:47 +0100
Message-Id: <20261123234050.150364-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
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

The HPR and LOL output routing selection registers (Page 1, Registers 13
and 14) support routing the opposite DAC channel's negative
reconstruction filter terminal as well as bridging the HPL and LOR
output amplifier stages for mono differential configurations:
- AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
- AIC32X4_HPRROUTE bit 0: HPL output driver to HPR
- AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
- AIC32X4_LOLROUTE bit 0: LOR output driver to LOL

Add the corresponding DAPM mixer controls and routes, sourcing HPL/LOR
bridging from the HPL Power and LOR Power PGA widgets so the upstream
driver stage is powered when bridged.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 875d934bb5c8d..f39856d0b1f19 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -323,12 +323,16 @@ static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
 };
 
 static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lol_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LOLROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_LOLROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("LOR Switch", AIC32X4_LOLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lor_output_mixer_controls[] = {
@@ -495,14 +499,18 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPL Power", NULL, "HPL Output Mixer"},
 	{"HPL", NULL, "HPL Power"},
 
+	{"LOL Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"LOL Output Mixer", "L_DAC Switch", "Left DAC"},
+	{"LOL Output Mixer", "LOR Switch", "LOR Power"},
 
 	{"LOL Power", NULL, "LOL Output Mixer"},
 	{"LOL", NULL, "LOL Power"},
 
 	/* Right Output */
+	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
+	{"HPR Output Mixer", "HPL Switch", "HPL Power"},
 
 	{"HPR Power", NULL, "HPR Output Mixer"},
 	{"HPR", NULL, "HPR Power"},
-- 
2.25.1

