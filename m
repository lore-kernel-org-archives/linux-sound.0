Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795496533;
	b=s06xU0IFSZuUJ5Wt4VcUi+JqIkb5TzaUeetHS2R/gRxG6jhoVWNB29zOKCG6011sv+at
	 jDsGSNLg9S+X3atXR+Kw+O+AoxKcA+xHctZcv+3n0IeaOq8XPXXismZ9ZaBcGBUMjAqmM
	 gswOXbuDp0KaT6pK8HXneDuluf6RogBry6XS8DN20CaLnd3AVbnjAHtSL5UrWx4Q++tuf
	 dbvQMG93fSJX/Sr4DAkxkW88jyKhfJYcieGE6Ep0rpIU8aUv9aCGdusJFvvq9qMmpENTs
	 JY/1ldnnVanTOw/rWxK1UjLKHvBxJIsPRCF/BAPRCPbErokWHnYcQTw8p9Fz8U201XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496533;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FGmaBKjTw7sbJX8afks/yYiQG4z/9NW2BJ5SkSn85gg=;
	b=iRrXP5USiR65/X9ivul3SI48vBkOUUJTU1nfdG5BXrNeudsuYP2jswm7PJUCkurxehbn
	 RYyfkc4I73z2+CyWE8hrg4FmyRXzlN67xhrkNQcfkYeerllZlPCUebo4k5tu6DCfCTxdg
	 Ya5jWc9VVM7MkDahGsmto+w5wnTBiZ/qU8Xej8Gfxn5iCWsL7UHShfNKDkRcPAcjx6wae
	 127+hZVWRymCSm046VbDJVvrP730IrtUhMfTaP5cd7I2m77tRdB073z7/reSWt2NaCXGA
	 gyDQ9Qo8GpzBB6qsd9U7iLN4LPoezLYaZJcmwdLdH0MwtN0xhe3hcne7CY8f9QN/AQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLI0SNvr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A80606A31E;
	Tue, 24 Nov 2026 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLI0SNvr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795496532;
	b=O2I93kund2tLPHy+wdq2+MLBosAA3wJ9hjepGfZGv39c2in7+jwJ7xDy1Vpn7Zvi+U4x
	 b3k+M8EN3zMcja01a7Qvv9B98NYxsWWNn/BEICfeV8oDiigl2H1xG92tdrzefYT91aZ00
	 Y6LyJxcwsPMRPHoyriHwfDOMdb7s8DfGlR20GYobPlNgtIhP/NZZeXq1/o4Kn+w/hk27C
	 2DWb+7zkDJdIN0VtDFNjoizs6ZYQy+EUN3OnBmZHw0FcjUv2ToefzkglCGdYCrVJGGHdK
	 nGkavrGh/tzGceJJa5qT/c7n1q92gMEqmIPwB+CLVeBPpVTtsH215cn5np7Jd4YnU2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795496532;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FGmaBKjTw7sbJX8afks/yYiQG4z/9NW2BJ5SkSn85gg=;
	b=yTEdNO1MMBqxmbNAfwxp6TqHgftXIUYflh5bho+cgXchHns7sEiLNKkE3tnK2dshN+IO
	 XMXKcWkK3tNgDKe7qRCbhZhs27l1rLvwGVnm0UfOvqryIUZjXaEUw3vt50tWcLXhHdhH5
	 1uSJX8tiHh0goE9xGExDUc4R0UUsaG3Mbxk4dRji/Nbx9xTc+qDCgDSrUE4OwyNup1K5W
	 KVZIrro8+W9f43HXue8PlxXbRuToGJduaIg+9neg9TnnRL4J3+DNojERHZMfI3ZimTjOu
	 CErRxRiCiiePoZTBHZluYhg31HAdoiEeiWervvJBACElFT2nhpkUgshQ9Q86eXrSpJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A0B31F000C0;
	Tue, 24 Nov 2026 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795496532;
	bh=FGmaBKjTw7sbJX8afks/yYiQG4z/9NW2BJ5SkSn85gg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LLI0SNvrIMZj9olcZcU4V0l7fzrWpqKhlGlEsvUYDGt1MFbwRIVBr7m7a6yP1ydF0
	 XOeGo3NqihPowRvrt2zRLRQt4qWm4J1EIiSNsGHcNW6dkSw49rKbWafrelvUrpaNa0
	 3JTs4V+kn397Uk9t6yl80E0W6KTVE0niw26SimAsdT6Eb8oHI4GxKtfau09isBh6CC
	 gP3thPfjLli8Y8V02Fz1FeUp8wpFigHWhcA+HBbMKCLeTuVVK5as8uhG8tGbkr+ZlM
	 6RqXiSkh6yXMJ3h83ydaf6Zh2h76Q9XUQEoQTy7EMtjVP+yaBDJE79A/mkpQk3xI9K
	 pZIyLoNLraT+A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 621FC4C899;
	Tue, 24 Nov 2026 05:02:07 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 05:02:06 +0000
Subject: [PATCH] ASoC: arizona: Disable jack detection when the component
 is removed
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
Message-Id: <20261124-arizona-jack-remove-v1-1-11d8ec426a41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE4aBWsC/yXMQQ6CMBBA0auQWTuJLWIoVzEsSjvoYGzJFAiBc
 HeLLt/i/x0SCVOCpthBaOHEMWSoSwHuZcOTkH026Ku+K6VvaIW3GCwO1r1R6BMXws6Yuipd5Y2
 vIZejUM/r7/po/05zN5CbzhUcxxdFtCX+dwAAAA==
X-Change-ID: 20261124-arizona-jack-remove-b99853c5d9d8
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, hansg@kernel.org, 
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, 
 tiwai@suse.com, linux-kernel@vger.kernel.org, perex@perex.cz
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795496526; l=4168;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=Oaisq3p6rMX4Q4Ds45HjON9EqUYd1zTuwXtIopcCDBc=;
 b=W/TJdv9E2ClGOA9zfIwOOmaePJa8iiYkWfjXwl00iovCeloLkIo8L9WHN/i0JBQjSRFQHxFxN
 UxddUZBWLmGAx9GkkY5JZH+GC4rePJXUIZlWLhg0MMwGpK0+WOaGzWr
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

The wm5102, wm5110, wm8997 and wm8998 codecs start jack detection when
the machine driver calls snd_soc_component_set_jack().
arizona_jack_enable_jack_detect() then requests the jack, MICDET and
HPDET interrupts of the arizona MFD with the codec's struct arizona_priv
as the cookie, and keeps the snd_soc_jack pointer in info->jack. Only
set_jack(NULL) frees these interrupts and cancels the detection works.

Nothing calls set_jack(NULL) on teardown. The component_remove
callbacks don't, and neither does bytcr_wm5102, the only machine driver
that sets a jack on these codecs. The interrupts belong to the MFD, so
they stay registered after the card or the codec goes away:

- When the card is unbound, the snd_soc_jack in the machine driver's
  private data is freed, but jack detection stays active and can still
  report events to it.
- When the codec is unbound, its private data, which contains struct
  arizona_priv, is freed while the interrupts still use it as cookie.

A later headphone plug or unplug can then run the handlers, or the
works they queue, on freed memory.

Before commit 37dbabf14ff6 ("ASoC: arizona: Make the wm5102, wm5110,
wm8997 and wm8998 drivers use the new jack library"), jack detection
was done by the extcon-arizona driver, which freed these interrupts and
cancelled the works in its own remove callback.

Disable jack detection in the component_remove callbacks. The component
is removed both when the card and when the codec is unbound, and
disabling does nothing if no jack is set. When the card is bound again,
the machine driver sets the jack again.

Found with a static analysis tool and checked by hand.

Fixes: 37dbabf14ff6 ("ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use the new jack library")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on x86_64 (W=1, no new warnings). I don't have hardware
with these codecs.
---
 sound/soc/codecs/wm5102.c | 2 ++
 sound/soc/codecs/wm5110.c | 2 ++
 sound/soc/codecs/wm8997.c | 2 ++
 sound/soc/codecs/wm8998.c | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 762e81979cb8..43df7cb46b59 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -1982,6 +1982,8 @@ static void wm5102_component_remove(struct snd_soc_component *component)
 {
 	struct wm5102_priv *priv = snd_soc_component_get_drvdata(component);
 
+	arizona_jack_set_jack(component, NULL, NULL);
+
 	wm_adsp2_component_remove(&priv->core.adsp[0], component);
 
 	priv->core.arizona->dapm = NULL;
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index faa85d88a489..c772f4380ae7 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2340,6 +2340,8 @@ static void wm5110_component_remove(struct snd_soc_component *component)
 	struct wm5110_priv *priv = snd_soc_component_get_drvdata(component);
 	int i;
 
+	arizona_jack_set_jack(component, NULL, NULL);
+
 	for (i = 0; i < WM5110_NUM_ADSP; ++i)
 		wm_adsp2_component_remove(&priv->core.adsp[i], component);
 
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index f041dfc905a4..aa9f23ddd997 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1077,6 +1077,8 @@ static void wm8997_component_remove(struct snd_soc_component *component)
 {
 	struct wm8997_priv *priv = snd_soc_component_get_drvdata(component);
 
+	arizona_jack_set_jack(component, NULL, NULL);
+
 	priv->core.arizona->dapm = NULL;
 }
 
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 1158e9ca40a1..47adbcd80e07 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1301,6 +1301,8 @@ static void wm8998_component_remove(struct snd_soc_component *component)
 {
 	struct wm8998_priv *priv = snd_soc_component_get_drvdata(component);
 
+	arizona_jack_set_jack(component, NULL, NULL);
+
 	priv->core.arizona->dapm = NULL;
 }
 




