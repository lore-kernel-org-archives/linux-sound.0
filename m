Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5F33DEF2;
	Tue, 11 Aug 2026 20:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480235; cv=none; b=KeCms8pUBgW4jGes+lDdc3NNiWsRFArZxjZXWZrR+3fKZ7Yh7vm1lMTo07arSlg9iO5ZUikQD2xxFvy0Lc/8L90HfcngnD8JobnQNh17ZyC31ktfUZc8cbiJEHyS8ANSOb411B3hpb9GKKxAMyyg5xBVU44Vb1Yd+f7c6P/rUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480235; c=relaxed/simple;
	bh=ZR6ku0g0j30k8N3m3AA5Qb2bmhVECC87W3zp6suvI4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ITsUMDljfdnGr5z/LNfFKb/Ovq04CzAOB/iJ9uFmGf7yzpTkHqiwgjzOw05xt3H+Jf0kVIVjZvu/B3mGCrbf0VSy+KponwYL4NoEH71yZxO9OcaiP0UzNOTvoALe7Y9r9YTD0PyGedRa8b9HHSLaSP8EK8mQzmBLWY5Vq/cOSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=No5yYqKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="No5yYqKG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B221DC2BCC7;
	Tue, 11 Aug 2026 20:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786480234;
	bh=ZR6ku0g0j30k8N3m3AA5Qb2bmhVECC87W3zp6suvI4E=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=No5yYqKGjyiYCFFFRVUvlkgOpNykukAgnGgHStmPiWgqOssbwU8bNw6KMKg2sUENl
	 vRkVsuMid4nwqCGXpMAEGFB1pHwDCoPqwgnHqOq0g2XkwaO7SRGg7WcoTv0BT1YNfB
	 L9iE7mFELNIXhGoxf5ytcdJIe0WoyhehKVL/ScQwv6YwiuJT8yti2IQQ+rVNfhuFI4
	 Zb6hcO8KQ6gCSmi9ZtAFfmjX/fe6aTWs8y9jRmHdj8x3jdoOsbwGzzC6jfem6wX0so
	 nCGRDdBlpX8+NFk9fhZhAhKNVy6QgQnl98dNy98eixb2qXIA6XeMCAucZIxdxhcwDS
	 8rWb2HNlfs8Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD5DC5B56A;
	Tue, 11 Aug 2026 20:30:34 +0000 (UTC)
From: Robin Snyders via B4 Relay <devnull+robin.snyders.xyz@kernel.org>
Date: Tue, 11 Aug 2026 22:30:19 +0200
Subject: [PATCH] ASoC: q6afe-dai: make DISPLAY_PORT_RX a playback widget
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-q6afe-display-port-v1-1-3bc8f2f38bdf@snyders.xyz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB1IImjsVcRFGic6YDVm0tIi3
 r3B5Vv8f4JQYhJ4VCck+rDwvhXougK/uG0m5KkYjDKtslqjvJ8vzni0LhBOLHF1P4x7yuh6720
 TOmVsA6WPiQJ/7/cwXtcfgRZFEWsAAAA=
X-Change-ID: 20260811-submit-q6afe-display-port-a9cc83f70283
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 Robin Snyders <robin@snyders.xyz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786480230; l=1488;
 i=robin@snyders.xyz; s=default; h=from:subject:message-id;
 bh=ysCl82UHZPMn2kZSyN9OZ4adN2czfiNR23FtgwOeyOY=;
 b=Lwg5vZVhKYn9am5sgQ5j+a1vgWVIlwtz7NY8vNJJ+PAB7FjBSn+eXHaetXgMh1mUnBNvN8iwK
 Y5/n6vUYSxGBATxf9pIDK5gCGxC8GmjAq+todqOhxGS0zwnlOtZJUJm
X-Developer-Key: i=robin@snyders.xyz; a=ed25519;
 pk=Mdk5dNn+Tkcy7BWexDxBLR/s1BNz8WdqDPnr3qtYBIU=
X-Endpoint-Received: by B4 Relay for robin@snyders.xyz/default with
 auth_id=938
X-Original-From: Robin Snyders <robin@snyders.xyz>
Reply-To: robin@snyders.xyz

From: Robin Snyders <robin@snyders.xyz>

DISPLAY_PORT_RX is a receive port, so audio flows into it from a front end
and out to the display. Every other receive port in this file is declared
with SND_SOC_DAPM_AIF_IN, while transmit ports use SND_SOC_DAPM_AIF_OUT.

Declaring DISPLAY_PORT_RX as an output reverses the DAPM graph around it
and prevents a playback path from powering the port. Starting a stream
then leaves the AFE port stopped.

Declare it as an input like the other receive ports. Also pass NULL for
the stream name instead of the string "NULL".

Signed-off-by: Robin Snyders <robin@snyders.xyz>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 920345609d2c..f98ff598c072 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -980,7 +980,7 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_7", NULL,
 						0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("DISPLAY_PORT_RX", "NULL", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("DISPLAY_PORT_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("WSA_CODEC_DMA_RX_0", "NULL",
 		0, SND_SOC_NOPM, 0, 0),

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260811-submit-q6afe-display-port-a9cc83f70283

Best regards,
-- 
Robin Snyders <robin@snyders.xyz>


