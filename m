Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD62D35C180;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353904; cv=none; b=Alemj6KNDPTXPlHOzx6krzdonC2zT57qZ/RRr5JnE8Xp2z9sX55+5ThMo+mTtDR1mm8tLDy8YqIIzeiLhV+EWsLdOFljcs5UpuZA+glVgdVPruecqG4FAA3IQXhqfhq3n+7wXUwwECB/DL21M5qZCC/muOfOQShzR8Qy+GDAD2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353904; c=relaxed/simple;
	bh=ZYZmuq0m76WHCc/dQQAmgA+qJA0Ak7vtr5glJHZ/bGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFUein6BRVLv8XQZHNQsAhWUfmpEtZ5Crp+repnbEBls7i2aMk/mFMa4nbpwKaW4H1N46/uFze3mErQviOaijvZke9mFX14bW55tzSHG/nZ2Cx+RMBqkt8zzNrESKUUWALgUOrJlTOl3REljNXRgjdnUcNLjzAhaBb5vlTXAHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qioNOA3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qioNOA3B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CE60C2BCF5;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353904;
	bh=ZYZmuq0m76WHCc/dQQAmgA+qJA0Ak7vtr5glJHZ/bGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qioNOA3BUmIz1pCqnQEWyEWpUDLSfXM/DEhuY6dhDGfzMVjXEuc0MgGN8Btz2lC6c
	 t016pDn03kLGMbJRg/QUUFL7yVRb61P2c1h/9Vu6xWguXu8HWYOfV7osLa2BioPOFt
	 vrA+RUHFrN+Pb+e9b/s292xHHE6fa/8Uromgtj5HAxHSQ22Wu/SYtUqnuQ3RwiC5Nu
	 fFTR/8IdwWw0NQQrEWAkhAB+iDnzCN0kP66/UBb3mIymL8G3lB71KZJJY9nfcrwMWn
	 KB5gA8IdPCRIzoFP+Y+gp0vFaZlHAs1YYrrJBfCLgl7ARddpQHiuPLtX6o2PUB9xfr
	 EkM9V8CdgpTcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA80C54F55;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
From: =?utf-8?q?Dawid_Wro=CC=81bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Wed, 29 Jul 2026 21:38:12 +0200
Subject: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: Fix enum kcontrol
 accesses
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-worktree-lpass-tx-macro-enum-fix-v1-1-0cf02c681332@dawidwrobel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=usKlUZk8Gbi7MNwGBOhnkRdcHYsrePO3qmnGNX840tQ=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWRlha1fGfNKcrYtm0NBiJ3d9IY3Ra/KdBfcvy5udVGZe
 dNf5omTOkpZGMS4GGTFFFn00oL2WAW//P7uxe9wmDmsTCBDGLg4BWAinC8Z/scJtWy1lC3OZj+T
 z3/3R6SK4BeruYXiGzb4t6vF7k7eeJHhn+lai+0rP2VXbl37Sq/K3OaihNm8ReXxvz+uF6s65vv
 VjwEA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The "DEC0 MODE" to "DEC7 MODE" controls are enumerated, but
tx_macro_dec_mode_get() and tx_macro_dec_mode_put() access their
value through ucontrol->value.integer.value[0] (a long) instead of
ucontrol->value.enumerated.item[0] (an unsigned int).

This same pattern was fixed in the sibling drivers by
commit bcfe5f76cc40 ("ASoC: codecs: rx-macro: fix accessing array
out of bounds for enum type") and
commit 0ea5eff7c606 ("ASoC: codecs: va-macro: fix accessing array
out of bounds for enum type"), but tx-macro was missed.

On 64-bit kernels built with CONFIG_SND_CTL_DEBUG, the elem value
sanity check catches the 4 bytes written past the enumerated item
and every read of these controls fails with -EINVAL:

  snd-sm8250 sound: control 2:0:0:DEC0 MODE:0: access overflow

Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..0cbf50647ff5 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1075,7 +1075,7 @@ static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = tx->dec_mode[path];
+	ucontrol->value.enumerated.item[0] = tx->dec_mode[path];
 
 	return 0;
 }
@@ -1084,7 +1084,7 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	int value = ucontrol->value.integer.value[0];
+	int value = ucontrol->value.enumerated.item[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);

-- 
2.55.0


