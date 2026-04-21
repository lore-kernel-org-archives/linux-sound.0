Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13B33A5E89
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773303; cv=none; b=FsuDGIXxTeoIVN+s/Hjya6Utdw+FtzZlTlHQpQ8puswC9tDKtev7YfZVXIX1kSET03mizAIJ4Od1Fsmj0SJ+eDpbJSX2bB7z3ibnf6UyU+g7BvuaaoacI5iiDrF0L3aD3OE+AlTFFX2TlLL+EMMeg7FXwX/HsVXzEd6Pnnvh1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773303; c=relaxed/simple;
	bh=CwoLwDLMBPfKyLaft+bymm+TkRKlmSB9AD65JRStfdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EeoMMMpmZdXOpU8cMwCJnVAOZc9MbIgBd7G94H5m++ALll+mPrLivysE4YLHtE2uhxYkD6BIzSBr37NG069v5/C/wsveXao06KYds/vesu8pRaZllZqiFUOYQU/HSm/TLB2UJ3Ax/EqoKaYcekh71Eajg/Ri/u3vF2s2nmLjres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ez8ZKgCj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ez8ZKgCj"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 251C43F7FD
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776773299;
	bh=fsfTQiRtIm976+XbmKgLhWGDL/jFLHll8YOhFaza+e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=Ez8ZKgCjp+uVYgMTh0Tyu24v/h48QGmzGEVZnxiP7nbd4PIExnOoVzRXpiLrdagmz
	 iO/u2uy6vg4xp/Su6/tTnoE57FIy0LL8D9VPJPveFyJjySbybjhU//qIbw7y9177vB
	 0+qEzW/uBXJblLmvSI/gA9zbQNBJgLJLWPHOsvmaavDk28c/FS6c6t+i55dvZXxl4d
	 y/615k0E1CFKyz9DieAzG1uRXdIlBuhkM7zUlP/dEiE3RO0Ax1cE4w6WGeK3jqCdlQ
	 odwubjqS9dj7kaeXWMEgoUQFfVKdCIbWmmwYHmJHDXMH3JAzsg66wxU/xifhGz29iG
	 yDxLCFInWPqnFSo1hC7f+IOBm01xVn6voMKukhTTvsE2T9SNRyjRR7GQ231aJ/yL9R
	 kNSZ2cM4Io/39XPlhPPjCwmdOuYyBT86Z6GnHqSW2GqizMPwEIt7DYtMdSF+Cc2adq
	 Rqg+qauH0bUdLwM8iPZ+OUW2fMS7fWU8zvARLwTUq1F0yFA2U1DPRhNAgAgf0EEH0i
	 4BIq+Dzh2LNPSM9ZV3yYNWTKcl7IReOGlYsG6j8P3KmGEnsEENTcChVDYzs2vMzd6L
	 v3yQpi2Cb1qlB9Md4NbEwm1gsdven5+UBZSR44kpx9CLXH0Z8nJBGCQMhFUl3qfLAx
	 JU5e4mwMVp6ZSp6RO4Eskl34=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48a5523fd53so4544295e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 05:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773299; x=1777378099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsfTQiRtIm976+XbmKgLhWGDL/jFLHll8YOhFaza+e0=;
        b=djbXQhhQBkfLdMfgwgovGuGla9TqHbOyMW7onQiUMCr3+XNg81/gZzSmQax+f42JQ+
         Fm/nedY1i9qlaYR1JVz9lt5wu64JJeherAqPZERj1B6VPba5JOaou1nNlt7pk1Z+s/W7
         Ja4fv4vxHTAIbDSvLju1oAtkKXGZ5viyS5G+c7ifBqsHfIBtLpHafh6pNaosp8FAhz/8
         zvEWHgfy90bfycV3fA0woOz8JC/lQIDVXEb2080Zjmr1v7qaEZmXP60jqYNZvCnW3AuX
         CgR+xjZkMaxpOitT52CsAgA476hmdyoZCO/SP3Ea82OMgJBHWsrwn9Ts5R6HMKIin7yZ
         MxIQ==
X-Gm-Message-State: AOJu0YzUnIGnXvSUVBdtKY1muEKkroXg8GF/uf0qFoeFAbYHomJbZeTc
	jlwAXlUNo6QRYii/HtbZotJnUTPmL6cQyINVJvQ9nzSfrf4P8Zp2x6UBWI8Y8Ixu6VixA42oflp
	QOJ7X9hyXGt1fFVxjCMYhUkiBfJjQlXQaU5bRR0k8rFEOmkRY1UVGZviPN6WnxW9t7FDEVmNTeS
	1B354f
X-Gm-Gg: AeBDieuzXGqvrmlrUWEIqBy1xuzZ0U+q0KA6ZgFAYO99nQD5QLpGDbff3kknDmsQfoj
	fMJ+a5PmRfMi0iv7k/Zit43aaCslIjoYyYtFXjnKkuV+oXCBWfaOTKRhcgnaAXQCAda8VsdjELU
	KdgLbH327dt02oA4aDDotNNyQeErJ0etMH8XM+vcpBYJ5DabJPmVnI9a+Q2esRNvt3j45gpfxkh
	OTm78N/pzJewjsXYbUATPvzTryJQ/dX+kn62ZpbAZcOl9lGWidgyaMwDIRiFqaBQQEKjOZdYNV/
	Dn6/8gSLCS268AbdJ/MKayVGCyuSpyGFck8OdkFmCZ0v9Ya2/nMZv+TPPQMvb6I9pCslxMq5rZ4
	5YFyoVuez3gOFl8YdbazFGLGyOnDS9WxaYZsAOzCnls1fRw==
X-Received: by 2002:a05:600c:3b97:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488fb769dbfmr277691065e9.18.1776773298648;
        Tue, 21 Apr 2026 05:08:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3b97:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488fb769dbfmr277690535e9.18.1776773298187;
        Tue, 21 Apr 2026 05:08:18 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:3426:4001:8efc:6f26:5d61:2375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm606795305e9.3.2026.04.21.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:08:17 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Tue, 21 Apr 2026 14:07:58 +0200
Subject: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
X-B4-Tracking: v=1; b=H4sIAJ1o52kC/x3MSQqAMAxA0atI1gbSUAe8irgoNmrAiVZFEO9uc
 fkW/z8QJahEaLIHglwadVsTTJ5BP7l1FFSfDExckmWDt5GaDBG60+uGsy564FBKVQg5b5khpXu
 QQe9/23bv+wFoMbjiZgAAAA==
X-Change-ID: 20260421-x1e80100-audio-limit-f6e75e0ad422
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Tobias Heider <tobias.heider@canonical.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=CwoLwDLMBPfKyLaft+bymm+TkRKlmSB9AD65JRStfdQ=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBp52iwUcba0y38cU9vJREG+WxxGCjSKvwRmzeLv
 /KgNKwLPVyJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCaedosAAKCRATSY8DLM/p
 2jD2D/sHaRKwGXN/x4yDL8ncNVMWh5b+KlbaVoD9lHS5pL2+f5QY8d2goXEuHlEhQGwMuZ3oFG8
 C2nunQFE2yGpwrhYdg6En2CRC/6c2qaQVdWzd+oMYHttU2Al7uZOAuN7yzFJV0twTMyBKG+wWBV
 Q5rgYAbqLDumvk2NQWMicG7KmdgHH8YlcXWjbveNttnfk/YTpMe/Q0hklfMu0+5pcc3HiFLP0io
 qnd6TpofTeoT+DhMv4cHN4JsyuKbqrtVappJVwwm3AsLJeHX1c0j0O70T2tCDCjv08ttE58Jwig
 slDVHYTPG3fSf+FKwM4EekaI8ZE0Gh9l4VCTWefa/NQIVO9B3G2GPfimk1ZxhczK1St8A16cC0J
 moNUjxG0h4Vgs1QGPP2LJ+ggamp0fHj0pYmCEV9ar1SNs5Etb5b3juJojZsIB3zQKHvOk+ISyHE
 g+qNM0OI1hIa3/aJLLjMpOJnIywzY5ZGKMYZkeEnTYrGwWoWXbM6XTbgfMX68N06hf3SwgxPAMB
 b7l7SPujr+3ft4pR00m1OxpahuJC0Ki7cBY9GpCq0jKaqZO2EPWaCbfzDHW28reCTVQK+/Ok2fs
 8jApUu6WkI6X/9hgB/nBYcXsNqced07ZAQD79OY0aSBHeNM3fZ8s9sLx0hcuhzkqww0MLuU1t51
 3RPCgVGZ1J6nyEA==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA

Limit the digital gain and PA volumes to a combined -3 dB in the machine
driver to reduce the risk of speaker damage until we have active speaker
protection in place (or higher safe levels have been established).

Based on commit c481016bb4f8 ("ASoC: qcom: sc8280xp: limit speaker
volumes") which addressed the same issue on the sc8280x SoC with some
minor changes as explained below.

The Digital Volume behaves identical to sc8280x, both use the same
lpass-wsa-macro.
For PA x1e80100 machines use wsa884x amplifiers which expose a linear
scale from -9 dB to 9 dB with a 1.5 dB step size giving us
0 dB = -9 dB + 6 * 1.5 dB.

On x1e80100 there are two different speaker topologies we need to handle:
  2-Speakers: SpkrLeft, Spkr Right
  4-Speakers: WooferLeft, WooferRight, TweeterLeft, TweeterRight

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
On x1e80100 laptops like the Lenovo T14s Gen 6 most of the audio
enablement work has landed upstream at this point meaning it works
out of the box on any Linux system.
One unresolved problem is that there isn't a solution for active
speaker protection yet and the current default seems to be unsafe.

With the current defaults it is trivial to crank up the volume to
a point where the T14s will hit what I believe is a hardware
protection that shuts down the speakers entirely until the next
reboot. I am worried that this means there is also a risk cause
permanent hardware damage with the default settings.

This patch adopts the same limits we currently use for sc8280x to
x1e80100. With this applied I can't trigger the same shutoff I
described above.
---
 sound/soc/qcom/x1e80100.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index a3f4785c4bbe62e7e027deb6d810e0a0275d81c2..94ed3ade0dafb489adef3474b71d9d2487ee3890 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -27,10 +27,27 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack = NULL;
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferRight PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterRight PA Volume", 6);
+		break;
 	case DISPLAY_PORT_RX_0:
 		dp_pcm_id = 0;
 		dp_jack = &data->dp_jack[dp_pcm_id];

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260421-x1e80100-audio-limit-f6e75e0ad422

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>

