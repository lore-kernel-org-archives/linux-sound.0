Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689810;
	b=M9cWuBDXGl5b5YvcxKlF9NVx7bd4kamvcjRo2pceo1qTf4o0wW4VZb6Y/do9FOn+1nw4
	 G+jwegZ+QXoZPKxTJQWTuqF+vCUZI/vu7+NFkSTHv0tReLxQStQU2EtJT1YjY1OwHJGN3
	 odYNwecI/A5uV8SbUrzu8uLUScfsGV6/v87RJam5CDyhs3cnjEDjONawHsSOorGaM26Nx
	 5xnsZVxdLccMSS8Rz8UfYU5azLgjK8nBO0odK8iTC9Ev/UoSh5v2RQxIGDlZXGebKoR38
	 O0dPUGl2U45RDJBzMHtGAA0rf5iygl1pTLSNCFe63hjObGoRUN8XD4afJ8rglCMlpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689810;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n1cltkEBgogJKqHsl4CQcsyfsPJR7rrSSpL+XzoJX9w=;
	b=5GDXij3wMAmYO7em5EJZqVU+DaDVQKZyYBaOC85jN7J2WLEEDJR3jkTM1Okb0fpUNvjg
	 y/59W8yX9iql5orNsvPxfNC2sGJAfaqyRWIPQh3HtVqSP6wBXr8DPA4Q7BDeVAO9P3pch
	 QMbW0ty959x05cLuhM/TKlgfZ3dKQL7e+/k++1c7EbkPJK7c6JVIBa3bFIiwfWjGoE+6r
	 5/a6YAbKdDJXSntry2tm8BAOaiUlhztgK7YBphUapS4+61moxbyTQH7LGlFe2+F1qnIL6
	 bsA6/5/dTG00+ZSkwDqJscz/6uWVmoNZ+xWoq6G56BcwltiBOaKbQ/Mu1fUFn56WoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asZ7s53P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DF606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asZ7s53P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998C1F000C4;
	Thu, 26 Nov 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689809;
	bh=n1cltkEBgogJKqHsl4CQcsyfsPJR7rrSSpL+XzoJX9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asZ7s53P911TBGsWbFWK3gO9hbSKxo5EnYBrBpADzGYGqY2Lkzl5wXiDMJxo3rcBF
	 uCDG2ba9XKssKBgOjytNUcOFFWctBlp+2XBWiFtu97chSW0vvgWG6jYQ2Jc41whJm3
	 X5OuOlYrNpgYJuZZCwKo9PfeBQKcECulKmNAP+OeYkVyMH/bC8aAvdL4e5COj92uXM
	 JUn1A/959xzaW5YmUqJG7OK2VF/X9+inWhjdHV/chU69GmGGH9t6UIfDAXL3YrY3wC
	 5wCD6x8iIcLa6f1YnTnpxBJfFaJegFNm5vYEX8k6WcDYqcAdaZkiokrqsgkDe7TWGV
	 bG8CAsquEXa3Q==
Message-ID: <sashiko-outbox-235311@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: Clear the parsed ELD on unplug
Reply-To: sashiko-reviews@lists.linux.dev
To: Roy <rongh7426@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126103757.655758-1-rongh7426@gmail.com>
References: <20261126103757.655758-1-rongh7426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:43:29 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ASoC: hdmi-codec: data races in ELD structures handling [1]
--

commit b249243bd16fd50e607cc3aaff9399c455c37747
Author: Roy <rongh7426@gmail.com>

ASoC: hdmi-codec: Clear the parsed ELD on unplug

This commit clears hcp->eld_parsed in plugged_cb() when an HDMI sink is
unplugged so that the eld#N procfs file does not report stale monitor data.

> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index bc59da295370c..ff4fa9fbbf68c 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -973,6 +973,7 @@ static void plugged_cb(struct device *dev, bool plugg=
ed)
>  	} else {
>  		hdmi_codec_jack_report(hcp, 0);
>  		memset(hcp->eld, 0, sizeof(hcp->eld));
> +		memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));
>  	}
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can plugged_cb() race with
hdmi_codec_startup(), print_eld_info(), and hdmi_eld_ctl_get() on hcp->eld
and hcp->eld_parsed [1]?

plugged_cb() updates and clears both ELD structures without holding
hcp->lock, while hdmi_codec_startup() mutates them under hcp->lock:

CPU0                                CPU1
plugged_cb()                        hdmi_codec_startup()
                                      guard(mutex)(&hcp->lock);
  hcp->hcd.ops->get_eld(...)          hcp->hcd.ops->get_eld(...)
  snd_parse_eld(...)                  snd_parse_eld(...)  <-- data race

print_eld_info() and hdmi_eld_ctl_get() also read hcp->eld_parsed and
hcp->eld without acquiring hcp->lock, so a concurrent hotplug event can
expose partially updated ELD state (such as a non-zero sad_count before the
SAD array is populated or while it is being zeroed) and corrupt procfs or
ALSA control output.

[1] https://sashiko.dev/#/bug/linux-80b0f2ca-0e91-4822-89fb-4074f7b4e06b

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126103757.6557=
58-1-rongh7426@gmail.com?part=3D1
