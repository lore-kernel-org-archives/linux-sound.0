Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F014A8E;
	Mon,  5 Jan 2026 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.203.221.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767581567; cv=none; b=W4GR1vJOhDrToD2OwTmfg1FH4kF2JoUspm0blEQEHrh0+YarIySUkyIUFlZ+xm78HqrAhTyA7qfK7zEdkzNX0XzIEqcVZuR6F6b3phG0CPUq9+merqwUHbS2SJ5LUN/oQJ00d8W1fRsGrzqxOuerMs6mmEUziaUbmjC9KHTHQoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767581567; c=relaxed/simple;
	bh=Ihi1/3FQbf8+c123/VfTZPL88wj1LxemPR2Lj4RLjvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqn4qqmtQbiBGn4kB1u3UgVUE6hlV0LoUNmBzsMWeA/UsUf3iFzaDMvlK2G2bAawn53Fhsne3mGzt6eEFoVrGVg9RI2rxMilIaJiuTeKQYruLwZDfqlKNa+7BXd4W+NDZ4yf63SvwlOxZm3oww6/vckbRqIL/sCdg/ULxkuXgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=IYDJEn4t; arc=none smtp.client-ip=159.203.221.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="IYDJEn4t"
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 44F87E27DD;
	Sun,  4 Jan 2026 18:52:45 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2fxmsRPZFyH; Sun,  4 Jan 2026 18:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1767581564; bh=Ihi1/3FQbf8+c123/VfTZPL88wj1LxemPR2Lj4RLjvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IYDJEn4tv4jPrFF9BdeCo/2dTGC0F8wqoOMfJXVFwK/usQIFrSZbvOd+cF27jIfw8
	 mYl0nIA1KaKZVbBINjWtxs+GNaUu9jaAErV5AYDuWv4fNXfG70k24vRdgZpwjJP+YN
	 sXwtPk+PlMktE3zVbL9J/SJoXvlYYf3cXMJR0IdRO8FyiHOSYZQ/jF4Ok2uxG8bNOS
	 fb+MnvoXB0Zdu4xYLTFCo7WSemhvhV0NhUhvZw+2RqN7761JETmhqitBBkLyyYT4dv
	 nYNMU7jGnpk7YGCrOiFgU5GuZM3Q1pfal0iEQWpApDiks2tCTMVzLZXnRWj7wTHXKK
	 lM84KVKnzx1NA==
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 05 Jan 2026 03:51:56 +0100
Subject: [PATCH 3/4] ASoC: wm8962: Don't report a microphone if it's
 shorted to ground on plug
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-wm8962-l5-fixes-v1-3-8e047171da2d@puri.sm>
References: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
In-Reply-To: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=Ihi1/3FQbf8+c123/VfTZPL88wj1LxemPR2Lj4RLjvk=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWyd02aNmP27Ei3p5zBmk+Czf5jq/Wz9cz4KaS
 lMJhfCqHKqJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVsndAAKCRDo8jXPO9vD
 /2R6EACubUuKKTMGrlaM2TbetEU35+tQ4jPWECzjBYkSbkyV0HAmbOACta3M8iWHj+MLbD4vCQX
 V/joWdu1sb8SGoU0n/vlBXPEhnb1cYZM2EOfP/d5OC2D8uhB+Z11gqGMK946t4e/7QcPZR9sA3a
 rsF2O7/IdM4v3yukGNHJFNxBQrkNYl+MfmNy7Us6vOmj3pvTDzwfH2Np3Z0ZGDrxe4NwsCYHbi/
 ekRWzW00RI4hRRycL5j8Fj9xh4+r1TyG1p311TXbODIFjYmRKFeCdw01nl/+8Q0GXddvYx12i3D
 Zd7CctZwySfnaWaAVt6ujN7cb5sC30x3XqioyLiHVmf2jDAkwQwZN8tdQF3NwvLLMVz0lIavGnJ
 +QA2KZ0Isp6MHVUq+7Nyigmudb7oefu6mCx/zPHninBBYZq9ZiSSpZjVWxA+d568+q8LIPIdW0t
 XnsQrJ3nUi/Xae082HxUHNCBl6KoUOs5X1TAcYXypa26qtDNKLr5fYCpiX6heXbJtzTDIBCIuBa
 KiNZnIAbTKh7X3C5dO3P3RDTvF0tAOyObKmkM8EmHwDp53fpn121XlFot9oytZIt45vRGnLheNm
 XiZ6Dg4sxGO4wS723j0kIkhICGuGjD0oGhru0cZ27fQOhXWEffnGmH/sjbBl+p4Tsu6XnM91usR
 CNwzygfjjPQDFCA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

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

