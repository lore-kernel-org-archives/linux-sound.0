Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97303B52EE;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353905; cv=none; b=bZH70V8t0mile/STY2tzSYbBBbk9Nri/2Rt7rr2JcIocuW+SFUKIjdpypJoqMjbr05/8xgy5lVddhQokCL9AA4h0QNrdWwNSWCg3OqsFAdhPKSnxf+s1G+ZOCiqj1MKHTOdhges3Noh56ney/TBW88fgzcQIFTy+7frWoDsriKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353905; c=relaxed/simple;
	bh=S6SwjapL6Sr9/IbJ7rrZAYnSKNf3afhv0TwIlTG9IBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrscAJ16fwLqv85xms0sXdQvQazMcYWnnxt33AHug8q0dFdzEmk8IWKCTLzpb2WZhO8hpzVB+wdb+wPZnoaXprCkGVxvTtCT4etFer1ogqTy3LmCVKzDmwkIz5Yuhtd7HVZwwIJNjfM1bqoL2Dc4PpznhivieEMDexMNugvErtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RN5YFKKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RN5YFKKy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90E99C2BCF7;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353904;
	bh=S6SwjapL6Sr9/IbJ7rrZAYnSKNf3afhv0TwIlTG9IBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RN5YFKKyBSnn/Jr8l+jnUvKy6TXi7G/HgW4e3XDGAdTPHp3NaUO5O8nvlt8lUWRWs
	 3lU9cwMhNPRN5qq8DXxR0d2DyF8ZLywWGVzPXvyDsNHJecdx0MyOYz1/Rdh7qPodGf
	 R2h3wJ2m5RnUXJ6L1GKYTik5Rm/yByyMDQYPrQjsDfZS5YRs90BDE0RsPa8RWb5YVJ
	 6u2/joru4wDsvQoAP91997EgMtRMEvCIt5w+ArrujbKvDFqNbq71VeeSGVijIxIgVw
	 QDrNM3daUTFe79z/X5sfXq9Yp5Isa1S2Pze70Wnq/IPyIoRcrAc3PoKp+ALnHkBf5j
	 gfus2poMYwFZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715E7C54F5C;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
From: =?utf-8?q?Dawid_Wro=CC=81bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Wed, 29 Jul 2026 21:38:13 +0200
Subject: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol
 accesses
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-worktree-lpass-tx-macro-enum-fix-v1-2-0cf02c681332@dawidwrobel.com>
References: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
In-Reply-To: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=8Yk0u1wDnW2l7FgMe28BRHKq1O/VXudd7zwK2CDuI+E=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWRlha1f8+9Y1M9bkx3iBSck8DQovol7mz5hv23w/2qxq
 em3BDJCOkpZGMS4GGTFFFn00oL2WAW//P7uxe9wmDmsTCBDGLg4BWAiyVkMfwV5mTOE9l9+7bBN
 5ahhzttP823awi6b5Phri+w626K2vouRYXfQhK2ecyqq/Y9O3r2r98X8b8ZCnO1imekbLp/sdng
 0hxkA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The "EAR SPKR PA Gain" control is enumerated, but
wsa_macro_ear_spkr_pa_gain_get() and _put() access its value
through ucontrol->value.integer.value[0] (a long) instead of
ucontrol->value.enumerated.item[0] (an unsigned int).

This same pattern was fixed in the sibling drivers by
commit bcfe5f76cc40 ("ASoC: codecs: rx-macro: fix accessing array
out of bounds for enum type") and
commit 0ea5eff7c606 ("ASoC: codecs: va-macro: fix accessing array
out of bounds for enum type"), but wsa-macro was missed.

On 64-bit kernels built with CONFIG_SND_CTL_DEBUG, the elem value
sanity check catches the 4 bytes written past the enumerated item
and every read of this control fails with -EINVAL (access overflow).

Fixes: 809bcbcecebf ("ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..c88d13c0770b 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2064,7 +2064,7 @@ static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = wsa->ear_spkr_gain;
+	ucontrol->value.enumerated.item[0] = wsa->ear_spkr_gain;
 
 	return 0;
 }
@@ -2075,7 +2075,7 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	wsa->ear_spkr_gain =  ucontrol->value.integer.value[0];
+	wsa->ear_spkr_gain =  ucontrol->value.enumerated.item[0];
 
 	return 0;
 }

-- 
2.55.0


