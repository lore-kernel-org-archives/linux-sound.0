Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40687353EEB
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786488608; cv=none; b=UnJt2fVBjhGnSTcpTvXPhtt11tmlluxFJeakWAtedHhbC2d9AvbR0fW0PQINPQ6T171oPQii9apXRBwwwC+jTHDcklMxlMLTgqmTYowalnu417b8u7WEzUAH6ijw6RbUzoQoPSRvnh8nxeAwzkyVCnXRqJAksGLSMcf+QfWKs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786488608; c=relaxed/simple;
	bh=XvCe5/kxol9uxG/XZvN3oMiqgmphzn4bwF2McWiPNYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=j16cee8iYGVJQTpRnYrD0u+0IqpGBzMWGU3GeLxa8arQN3zikHUAKYGm3QdGh3SwekpCE8E1gv2kMUlQGfubsV02vpKGjWXjVSzD/ODjmd9QKGISbwM25+TvyVkU8LV/TXbOJn4OVTGhlSQirXGqeNXbnHe4vGZ1tSk4XdyaYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyders.xyz; spf=pass smtp.mailfrom=snyders.xyz; dkim=pass (2048-bit key) header.d=snyders.xyz header.i=@snyders.xyz header.b=wvSway1f; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyders.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snyders.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=snyders.xyz header.i=@snyders.xyz header.b="wvSway1f"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKRf40zFDzcwv;
	Wed, 12 Aug 2026 00:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=snyders.xyz;
	s=20251118; t=1786488603;
	bh=XvCe5/kxol9uxG/XZvN3oMiqgmphzn4bwF2McWiPNYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=wvSway1ff40nIQiXZSNuurvD1XHqrp/RZqejqRo+4GkJZeqQR3hQdxmUM2Eousjcq
	 Bpjrd7yMu45Qe10i5PX4Rjpm33mG4tmyGLRjV9GxjCn3K91/a9lRjQ+4ZaKbjHF5sJ
	 HKSnKulZDF3kMRyq7TY0LXv5VCBR+Sgj3HivpcqesBjHpURLX8D39YK/htVCF0p0al
	 lzbkPRIzpL5cyKFh6QlMyrYqGqEd5dpw1n/dI+L+vQSeGmWnhvWoMTGQwwiR6KdIsN
	 0PaL0ANG214ujE5+BqxBBv7DpvTulxQZRmHv7J8B3/5JNclplAP4mmkJiCDXN1xXYZ
	 Rit3SA3HvKt6w==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKRf26596zfT;
	Wed, 12 Aug 2026 00:50:02 +0200 (CEST)
From: Robin Snyders <robin@snyders.xyz>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>,
	Robin Snyders <robin@snyders.xyz>
Subject: Re: [PATCH] ASoC: q6afe-dai: make DISPLAY_PORT_RX a playback widget
In-Reply-To:
 <20260811-submit-q6afe-display-port-v1-1-3bc8f2f38bdf@snyders.xyz>
References: <20260811-submit-q6afe-display-port-v1-1-3bc8f2f38bdf@snyders.xyz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Aug 2026 00:49:46 +0200
Message-ID: <178648858640.3471590.18184750436169014545.q6afe-withdrawal-resend@snyders.xyz>
X-Infomaniak-Routing: alpha

Resending as plain text because vger rejected the list copies of my
previous withdrawal reply due to a connector-generated HTML alternative.

Please withdraw this patch.

After a closer audit, I cannot substantiate the functional claim in the
commit message. For this widget, AIF_IN and AIF_OUT use the same DAPM
power check and sequencing, the explicit q6afe_dapm_routes entry already
defines the route direction, and the widget is SND_SOC_NOPM with no event.
The change makes the declaration consistent with the other RX widgets,
but I have no evidence that it changes runtime behaviour or fixes the AFE
start failure described in the submission.

I do not want this merged under an incorrect bug-fix rationale. I will
resubmit only if I can demonstrate a material effect.

Sorry for the noise.

Robin
