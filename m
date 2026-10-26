Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019453;
	b=yvdkCCir3SREh9q+X8Miv3hwaSNsAKRMWDrl+co48vJ60nXxEE0Tt/6HdHDsfGQXRhu/
	 WFJ6VXqJcvCnkly9pebKsp1KF/vLwxP7gMax3/piLq1fLReO/nCkN+bHzw2jswERf7yPI
	 T8nO81IRGCYOCmA4S9dBNHrBoHHsMgF35kxSedjZIDh9vAVlGYOCR3TGLJSkaArxFJS9i
	 lCYUWT7+8QvTKnnnCzCyzX43qweC8Q57WFrsFkdVDRiS7wZFC/123MDy2Jqj+a1HYPeS7
	 U5z/DF3atYQ/X4rj0kJ2dGocOhEZ0fgI7q3ksZP4DqECkd+azq1PO0wda688j5Uc4HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3knUpnSrCqfcqTPX+dRD/x725E5UaCgLW1U4Qnf8KN4=;
	b=KfXRA2V773vTnK8pHCwcsyYpKrB9uLRapE/igSs6jyMgICwkQk4is2CY2siUlkBKm7/i
	 XL20POmtV/AD7pHbScxZw5m0XuG5QPcKNZ9DhIZ6E3UjerE7QWHQ25ZQ8N71D8SsKt2Bg
	 Pjz2MWm+idEc4HcOFQxhsq82PWchz2NdiAj8yUJu/C6nEXi85eOFg2EUQrh+VoyoCcnA/
	 esxA21xt2X8ybzqjIvb4SIDhc1nM8KDBxj8eJUBxI7y7P6C7OM3B+R8TeQ7pRmlVwdKkg
	 kT+4ibts41XovGp7PrPAjD/QaqQuzT6NJbDfG42l00BytTtMcHnn1vw5Xh1TRUBi1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NA0/E6Kw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A27606A31F
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA0/E6Kw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5A51F01825;
	Mon, 26 Oct 2026 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793019453;
	bh=3knUpnSrCqfcqTPX+dRD/x725E5UaCgLW1U4Qnf8KN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NA0/E6KwLgoN64VhV/vXWWg+4J7pO/GFbR5pDpES3mVrP/hkersw3GM1yWc0ssSoy
	 VBJDglsSLC9Syv880vXiVMNpXIUikVql/u7E8E8CFv0AAv7fKzZTtBLfSVxDG8ewq/
	 MHY2DyEPk/xPIS1f7Fo3w+8jFuJQU8LEx+/N/wva+/sfwEz/eoeGDd9jyLL9t+YbR5
	 RBg0wtHCEbaJ7nR5seXdOw0lPBbP8qR7VJ4aPWzZSnDwvADZJvFQWab47AYQ+i3nWi
	 2pLwT1OklMkIURjIlMpXLue8sjbZBYkrKosATN7Cq59qCafq4OdK4JBp26gvTI4kma
	 BrLrMdkN5lgqQ==
Message-ID: <sashiko-outbox-185252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: wm8994: drain all delayed works on component
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026112212.2519775-5-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
 <20261026112212.2519775-5-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:57:32 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: wm8994: uninitialized mic_work cancel in wm8994_component_re=
move()
--

commit fac5aa258b308d77c115320a9d762e1310e3f8f2
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: wm8994: drain all delayed works on component remove

This commit cancels jackdet_bootstrap, mic_complete_work, mic_work, and
open_circuit_work synchronously in wm8994_component_remove() after freeing
IRQs and before releasing firmware.

> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index 6b91e02f130b3..59b9cdcd5fc6a 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4636,6 +4636,10 @@ static void wm8994_component_remove(struct snd_soc=
_component *component)
>  			free_irq(wm8994->micdet_irq, wm8994);
>  		break;
>  	}
> +	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
> +	cancel_delayed_work_sync(&wm8994->mic_complete_work);
> +	cancel_delayed_work_sync(&wm8994->mic_work);

[Severity: High]
In sound/soc/codecs/wm8994.c, wm8994_component_probe() only initializes
wm8994->mic_work when control->type is WM8994 or WM1811:

	switch (control->type) {
	case WM8994:
		INIT_DELAYED_WORK(&wm8994->mic_work, wm8994_mic_work);
		break;
	case WM1811:
		INIT_DELAYED_WORK(&wm8994->mic_work, wm1811_mic_work);
		break;
	default:
		break;
	}

When control->type is WM8958, wm8994->mic_work is left zero-initialized
with work.func =3D=3D NULL and an uninitialized timer.

Won't calling cancel_delayed_work_sync(&wm8994->mic_work) unconditionally
in wm8994_component_remove() on a WM8958 device trigger WARN_ON(!work->func)
via __cancel_work_sync() -> __flush_work(), as well as an uninitialized
timer warning in timer_delete() when debug objects are enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026112212.2519=
775-1-tristmd@gmail.com?part=3D4
