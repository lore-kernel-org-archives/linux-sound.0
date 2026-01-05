Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D331ED7A;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582140; cv=none; b=nSS9HjyCRUHmnR+WjGUhLEHwT9fR4lhCklJP0KBp7pC/qlnk5eSyo/U+y0ajd4cmueyfAps/+YpX27/pN33DoFLz3alJ1r5NKrnOEvzM0jyRuFCj2XUOJiELsyTaySGeBLhCyhFGq/UFgne/dox/lUmaS2CfOF8VFcj1tzuUHqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582140; c=relaxed/simple;
	bh=CTAYLAHsfHqJLcUihGHg3uFhYQmPcsVKmrcI3ybfFz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eikqYPvrL78F4fbkUETruy1Rj2qYAvpP/fHN/UiCTBQQ07NOtlENh1lf+KEhNP407p1dKVCDX//ViWCRmmWOyTdd0O/rEo6YFa/+BD7OB/cCFJP9jwOyUb6xK/eRjOnISt9H4fzZDVUttDf87P+nWcdJFaB83WEgZ4dpOCqdjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwaBX+oE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwaBX+oE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B44BC116C6;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767582140;
	bh=CTAYLAHsfHqJLcUihGHg3uFhYQmPcsVKmrcI3ybfFz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DwaBX+oEPhS5JtPrf9umJxr12gaayWPvgCTAc/6U9Oqxhg3IfdmwdR1e8sZqo2pBH
	 /6E9BCd8RM27LAUJ5oYr7XXpcoVZl7EHGnm+tX+CqWANq/8FdSiEjZrLYNuaLQhvn7
	 3O69xxvXYlk2/QskCPtsbZqB8H6HYVJBIE6ZgJFTZARxsnqkOcynzYjDD6HaKv2zUc
	 RDCSGmAJ8SaTJe3XVRdVoMs6pg18elY6r97WeK1zjIlHu723s1D4/AIRIz80zj17js
	 Ds98NIdtHQYpWchQtDU0sL3mlfSvBHWSYGBVtOTobtaaGA3VaYkyWFSUKHNo7cDeZk
	 7cJvoAMMMB9Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D953C2A062;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 04:02:09 +0100
Subject: [PATCH RESEND 2/4] ASoC: wm8962: Don't disable SYSCLK if it's
 enabled via DAPM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-2-f4f4eeacf089@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=zi9x3EPPEK4Yh40bqI+3+mLaNvPm7zKYWzZHed95l70=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWym6PnwEVZ9Qtq8KimokKQk+8unH/eXMqoTqA
 B15OHY4o6+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVspugAKCRDo8jXPO9vD
 /0dYEACIX5JzcG+olaDmbJpsvi2Ub2/q3G3+k5Iu7PrAJjK+nSAVYCAti7yyyb0Zx9UwFB2t+k3
 ZMAMQmdz2jW02WDxzN6vySrjtD42PAVAim6VWOgREVggF22sJNrzWQL4FqGyrfmNuGE82krvzgX
 5OldYSUVQAuvN9sKj4++X0MSNGxywGpaUArGWYS15rBG2piecnj5V2r1QWUqm3p97DeSnkWRC7T
 qJugYYeKj+aTi3QZDFw2lHvLJY4MQBbQj0ut4Vo9dOXLF0ZVzagk4IOq+Zw9JZ4HubgNbhR0pZv
 6JR5x8I/pI9wXysFlQc9Gdc+udCLaGIQcojrlwrf9WJ/3JsLafPv9u+CcnEp5px3h7u6axOk6yp
 MR3GmLAIcbnsARKPU8jp4JbgrwiqF6rWKnvqzlFNUqnsaJoPhhGDte5z2/7AicdLBmEUYzSTpfP
 Sr0ufgO7x3kjJcLYC3pymCusxlO24M8/0K02C3CZbi2HEMEXipEKEDgeciMsFF331UlbCcMt4WZ
 xpHq5ILUYF/UomB95ioSAEhJg2bJAsrhzGTYZMdIGQEiReQyu+fz1HU6PJ294OIgy7WcSiUvcpe
 IUZOEgNp6lyERBs7OXfE115HL3ix5NUameDMPjRIM3pvMFyDIsrXaYQX1qIh/5SZYo/p6FENOY/
 7H6hCghmIPetgdw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

If SYSCLK pin is enabled via DAPM, wm8962_configure_bclk may turn it off
behind DAPM's back, making it assume that the clock is still enabled even
if it actually isn't, which can end up with it not being enabled for
playback or capture when it's needed.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 1040740fc80f..843b8c6b40a4 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2520,7 +2520,8 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 	usleep_range(500, 1000);
 	dspclk = snd_soc_component_read(component, WM8962_CLOCKING1);
 
-	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON)
+	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON
+	    && !snd_soc_dapm_get_pin_status(dapm, "SYSCLK"))
 		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
 				WM8962_SYSCLK_ENA_MASK, 0);
 

-- 
2.52.0


