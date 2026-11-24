Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494865;
	b=T8sg/BoaUEhvk97s4UruTGvdhCqIskQMvU6qWXPAbV05oF18sO0g1IdXcnsbh6sBMy6o
	 ntRjCxbKE+4CAD1CbQKbunPxupYNSsb3zMy9pLPDuwy7DUHwr87B/KRVrLlbfqof4UG46
	 aQ5arRHHZmO2iHbYmFTRYNPINEhKurLOh0Uf595Th5J8egejeCSyql2z8guLK6lWxPTdN
	 yvsOgQM7d4+xC2ScodzWY1m9oewAr1BIZWSWSMmGZkAAuPfThuWfks7ME1gpf2VPYxNSF
	 55sImHRk1AHkD3YdD1GC89RAnMwe7Tik7ORa8f0Yad4WpnO/ifjh9YyRViaf5BooOGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=/e6yF19zcnnSZ5kweRiKxTKNHNpF97qUwlGZCKVgLTI=;
	b=3Eik5i1XOXSKY4ak32gxuwVPOi/fciDrfsY678QyvH+g+XGH8e3xlo9bqvW3WeeFPzZ9
	 /Hzy26X8xNGfXW4XAsMxu1btfMCb5PBehPEJN9OLjkK6lZaIdSl0UXNnOpzleXVZvBK/o
	 YVhwQPGViXNABrQqCXDr3O/rXO5JsZI5HoQ/bsaXx8acmGi05KgeSoTkCMsy/6uschJl7
	 sbloQzCAu4wk4tv48pl/v80DkOHy7y66zgI73FkAOxCn2byFgoM/cfoyCBXHCjWqsJjFF
	 +R3fw3pIPbXszrIkuDdtIQ/lmkt+G7kgitDQUFkqsQcAolNJn8MK1VBAUGYu0CzqSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BA606A322
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 04:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655BA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso4219494d50.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 20:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494864; x=1796099664;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/e6yF19zcnnSZ5kweRiKxTKNHNpF97qUwlGZCKVgLTI=;
        b=FxKDdvbZw5tyBT5iESMNXg6oRHCkObRJNK4lZFE56LqGpTmnOVRe+VjX+R3fN+mV+J
         5RwORqHfaivJFaQrMBYw3wPi3xD1ITdOZufkK5zHdmhgapRjiUUPD3tnjFxRwGX6x9N9
         PdDhOhT2zJ9A1+vHd5u9ndF33BsYbKQjxbFaSWvOj1y1JUsmnqvHyLTggfQFzkhmBZnV
         gOMpJsMC6fh8ObNpvxpuzA3mZVoPtTRsRjudE0AJxbfija7zEk7mo1JiDFQvxcKPQpnd
         ZNh63h4zbT7DjhhdGoKeVtpL36UZUMi/EoUnc56+n6deEHn3dzx9moeXtuTtReNQCxPl
         UTjA==
X-Gm-Message-State: APuU4Z/JmP1QiH/+QyXPCCLlYIApHKsttFWTE160y9A3T+NLju6pPW4I
	hiSnL/oEy3t+lKeFHayYFcfGgwWVv7iyUjdvlfHxgMlj/BMgljI3G/Gf
X-Gm-Gg: AZFdTZd9lxuPlbWlGUAnE0B49ia2oymVrg9sqilTS7gFPzTQhZPgbTVFZFbD965y4r3
	EVfeoZ4lu6/Y8cnYLKoxGyT5L0ODmaxz38wAmgGzNgu/EO99u7nvJlrqVRblM6LPbJQYSogsDVl
	LfjFCeMnaxUkPbUk+G7QleqwI1Nfr5z1sr+/mGAL9HUeQCtu1Jid7K0LJJ4gN7PhbKWHEf8610P
	QoW+AA8IcvOpCTxi8BpPiEEGfleoBks/Y58toop6j+nvaHWHyECvr+5L3JTVXv8qMfJQ5c0PhGR
	Y9DKiYivn0Ol1EpWpgFqJgBD9jt+z+TRtYZbbogr94Lb3DDCT6kaMPdm5t04+Kik47q/0rn8fz9
	AzIUpHd3fNrzcAuOVe0d5MZid7lLj3gnkj3ZHADfE2f/AynlEQSvdiRz3BERJsZQdZh5CbxQ2Qp
	d9XsHIp9tvVJkhE03UwbF8uD96peTuNYJvw2GJ033YaEVoH4vohrHu1fb0Yo6a/PA1+ONUcidGr
	K3gajuf9zcuZ0QxDLooJ8KnQUy/cHfw2aO2mt4ZBGwN1TZk30k9p0GmoLucUc530IfTJi44iF1e
	pGl+7J/83R6pYfYWTrl48gNfaoHwFDW6wY9mYKruGb6pLDnzlP+Ak5NrwHPBC7A2WRy4jntLxHt
	2BjPd7K3+9L3Oa0c9osUZwUaBZEd5PdAHCuMrvUKpmekaX6oEvE4pzKwgsBgbOWCf7PFyUCaW2L
	qlUWVOVfJTveWwXBrrH1CDig9VxV8=
X-Received: by 2002:a05:690c:f16:b0:8b0:a01e:2ce2 with SMTP id 00721157ae682-8b518ec3105mr54040937b3.15.1795494864418;
        Mon, 23 Nov 2026 20:34:24 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb0a2sm53106397b3.27.2026.11.23.20.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:34:24 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH v2 0/2] ASoC: ti: omap-mcbsp: TDM slots for generic cards
Date: Mon, 23 Nov 2026 23:34:19 -0500
Message-Id: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22NQQ6CMBBFr0Jm7RhaoYgr72FYlDJIVSjp1EZDu
 LuAcefyJf+/NwGTt8RwSibwFC1bNywgdwmYTg9XQtssDDKVSgiRo+v1iL2pecTQ9MgPF7AgUuK
 QHaVUNSzP0VNrX5v1Un2Zn/WNTFhV66KzHJx/b9ko1t2voP4WosAUlSnbQuss17I8B3pofd83F
 KGa5/kDEdJeA8kAAAA=
X-Change-ID: 20261115-omap-mcbsp-tdm-slot-7ee61348226b
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

With simple-audio-card or audio-graph-card, McBSP as clock provider runs
its bit clock at the full SRG input, since only a machine driver can set
its divider. Patch 2 adds set_tdm_slot() so these cards can ask for a
frame of slots x slot_width bit clocks; patch 1 lets the divider use all
8 bits of CLKGDV.

The ADV7513 in the test takes S32_LE only with a companion adv7511
patch:
https://lore.kernel.org/r/20261116-adv7511-s32-v1-1-40ae8228db42@telaak.dev

---
Changes in v2:
- 2/2: hw_params() checks the stream against the slots and the sysclk
  (Mark).
- 2/2: rates are limited at open only for a sysclk set outside a stream,
  as simple-audio-card does at init; a sysclk a card sets in hw_params()
  is checked there (Mark).
- 2/2: both directions share the SRG, so the second is held to the
  first's rate and sysclk until the first's hw_free().
- 2/2: channels are pinned to the active slots, non-empty TX and RX masks
  need the same weight, and unsupported slots are reported.
- 2/2: a sysclk from the internal fclk must be that clock's rate, so
  simple-card's mclk-fs (rate x fs) is refused instead of misprogrammed.
- 2/2: dropped Jarkko's Acked-by since the patch changed.
- 1/2: commit message wording only; keeps Jarkko's Acked-by.
- Not supported: dai-tdm-slot-width-map switching.
- Not tested on hardware: full duplex and a sysclk set in hw_params();
  the test board has playback only.
- Link to v1: https://patch.msgid.link/20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev

---
Joseph Telaak (2):
      ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
      ASoC: ti: omap-mcbsp: Implement set_tdm_slot

 sound/soc/ti/omap-mcbsp-priv.h |  15 +-
 sound/soc/ti/omap-mcbsp.c      | 334 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 345 insertions(+), 4 deletions(-)
---
base-commit: 2c0f21bfcda98db49f6476ff9b042402e5f20d3e
change-id: 20261115-omap-mcbsp-tdm-slot-7ee61348226b

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

