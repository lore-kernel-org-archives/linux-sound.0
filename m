Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EE31ED7F;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582140; cv=none; b=Hwjt1c1TNsUPJCLXJJ7WXhuoU+KBvJ7jIEoGNxayz6LGVrSZr0rAd0YizmbfYnMKScUjlXPcNdoblTyqywbFr94LNVJ3JRqyn0HVu/tqVUc6jKfLPFeoI2cH8aVHxrVRiRvywqSDXhgbKkpVkB1V/TbxK2eWpSiltZ4DTjCBdxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582140; c=relaxed/simple;
	bh=8FfGrSg6H3pMB94xW+1y5Oxc5TI5MP4zF40+FjbXThA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f684bfqKeVmHoRuoupdXumYoZCLuqHKZPqB37uWsFiaD4MhQvZeG9TpK0ruum2e4sgvWno9Vee4k1BQOQKVJzE3goaFj+dlFPcdsuh9m0HdV0RxkEup8opaz/m7bDOdK2wjjRUrvdDRjXgRv8jBDjMk1GYPPSxXFtpvU/Yhgy/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af9wyIac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af9wyIac"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76CD2C2BCAF;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767582140;
	bh=8FfGrSg6H3pMB94xW+1y5Oxc5TI5MP4zF40+FjbXThA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Af9wyIacqHp7iMxUbBZITvBDC7+1lGNkwhUvhVVF++5UBfiH4uMUJanYXj+htUtNv
	 8F42oK9ZvzeH7aEREDfN1HW4/+cUGFc2cuewUii88S+9sSdLAaKHcGAxfxPkZwOjLf
	 6yp6R92yWCiSFLWsWfj57iY9xU7cM+OOEts+ltGsgB8GcfXJdgaeCWSwhoHTCrIXhn
	 a2rR87ZR7rOuS1eM7imC7aZAHUXLYrpgg1S9Yh0+7IM5+peMxqxx2Glr7rp5iWiz+S
	 v1GXodhJCaZiryXCya6Q98Nrgi+4blO7Z9Z+LPtb2TceQTL4qy2wkeRONWvq9nIJxP
	 dgroWcrcx1wNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA31C2A077;
	Mon,  5 Jan 2026 03:02:20 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 04:02:10 +0100
Subject: [PATCH RESEND 3/4] ASoC: wm8962: Don't report a microphone if it's
 shorted to ground on plug
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-3-f4f4eeacf089@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=Ihi1/3FQbf8+c123/VfTZPL88wj1LxemPR2Lj4RLjvk=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWym6ai/WV0raWlCpeuwKy523q725Tu4P4N8Nh
 OwH1lYL7R6JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVspugAKCRDo8jXPO9vD
 /yeCD/9tWXBcouUQDNLf7cbS+4mOoaW1ESCxMuroGhxIfZiVfQqH5IFIG5uYG8hsUSasSqfVw65
 0oZPDVQGGA9+Oj8XlUb3fwqREW9Z14wp570QWasYHlHsT3bsd1/K/+8SpGCTsFxSowSMY8iJfsK
 rbM0gpBOnAHR8sQWUEBVsryVuMmM5puA9fj+Q3L62wVrgas4K0/oPcBsRHiUw8F7dz/mK1cPwhE
 egX9Rf1dh/tRkJSZci42lOauGbaFfVBc9iVcR8j0FSf0R9mkbTzgHdURsApkvqh92gqPxa7/Jip
 LXOiPJ2FFK1oTDhwiVFtEG0YNZYkiZ9TrGSgJ6ScBUpL43l+uy7sgCe0bQ4u3wnUEPuvYbCxF6A
 2I7KIOJc+EtpZKjv01msAdNe4Hck9cHCzYBvlmRP1eVgG1rHRtTCg9OGWyHO1kVpJorw+bcktnU
 0xFojry8K/1KEVMJCmZK8YB1H9i4SR2/xmUTGGfare/v2JK3a7JTtEER2kuh2aRp0L0geLczNzI
 /MfsDnm66jhyOZgDY48XNQtULZHit6LHIMLcGNPO8nZBgzHpKQvR1B4LlH1DC3tmCfRfatl38tN
 iiEfkXf0ru8evoDAnL9ac324RRCxsgyLIaDiVij5az8woOhhGY5BWbHZganenET+j1eSiEnqrSl
 DkykNT584BRejDw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

This usually means that a TRS plug with no microphone pin has been plugged
into a TRRS socket. Cases where a user is plugging in a microphone while
pressing a button will be handled via incoming interrupt after the user
releases the button, so the microphone will still be detected once it
becomes usable.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 843b8c6b40a4..dd73b4dc1b97 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -67,6 +67,8 @@ struct wm8962_priv {
 	struct mutex dsp2_ena_lock;
 	u16 dsp2_ena;
 
+	int mic_status;
+
 	struct delayed_work mic_work;
 	struct snd_soc_jack *jack;
 
@@ -3082,8 +3084,16 @@ static void wm8962_mic_work(struct work_struct *work)
 	if (reg & WM8962_MICSHORT_STS) {
 		status |= SND_JACK_BTN_0;
 		irq_pol |= WM8962_MICSCD_IRQ_POL;
+
+		/* Don't report a microphone if it's shorted right after
+		 * plugging in, as this may be a TRS plug in a TRRS socket.
+		 */
+		if (!(wm8962->mic_status & WM8962_MICDET_STS))
+			status = 0;
 	}
 
+	wm8962->mic_status = status;
+
 	snd_soc_jack_report(wm8962->jack, status,
 			    SND_JACK_MICROPHONE | SND_JACK_BTN_0);
 

-- 
2.52.0


