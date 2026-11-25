Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596761;
	b=RUQP6OWzdm31hiCg226UDt50OG8+F+FRE4yUw7qRPb/1Q15N1MTdajlbPVW/7gC+VCDN
	 VZl+KVh4+udfMegWB6gM+e0bvOhlzz3WSTHb9Vh8b2CdD6IWVpGRxm3MbGfd94/kMlfxu
	 51huthRwOs4zPYdwy5dgmfSHQpchCsKVdDek5j/yUiNWvwJ0lH+z59Wew6t8Bqk4ZeTz2
	 +/+5TgVoLMKnLUUaNKBrSx5uQbBlWG7jtJb/B1oNTI9hxLpsSr3HIhKsmEaIMM/NIPwFz
	 EgJnD2MVlQMkBiFHZMe0VGhW+Li8pjHttMdNWRe13iJbaWPBpId61EibUxEeOJr/jHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596761;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aX+LjGWi0gPGPA9sZkOZtJrQ4n9T/6iee9o4+vTj098=;
	b=osQrh+yAp657aOA9CMPSpuFhexjYiTQWD8hJpt7+As/jOi7qvplHJQt1VElPxjdqC1+Y
	 xAbzw4RQAGaCwQOH/l+vNO376KQHK5ycK69CbF/Ku1vLdhRDxYervqydzrb4u0bHths+8
	 Bx2xhuAAc3fsONGexdMIN5S7zKA1j+T0W+8u7uJ5uL5jbdydMOA2fRmVQnt6H/Rc/PEoe
	 +HxLjaiWsepnJGWJXuz3wXYzUuf2j4m9Ca0X03hksnlOOo7p5by978D/Zrwa2OxZQIxhH
	 5fHGIlu1jR20izETCoN3+kxwUnfNcetvDbzHe/jHXbc48+h4tlClC+9vWEhXzqqYb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi5NsSkI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34717606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi5NsSkI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A29D1F000C6;
	Wed, 25 Nov 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596760;
	bh=aX+LjGWi0gPGPA9sZkOZtJrQ4n9T/6iee9o4+vTj098=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xi5NsSkIN4EdrCKsVLBRm6JBr43YdLS+6VetibmrZQoM7qzPp3khXDYqf0B3JRMqs
	 swbqltAx7fgwANKD2sv2jcU1XLLOXJK72nG2PU/q9QLpgJgFTq64jiiwAhz1AgRbnG
	 +9tIerIY1TkQ1xQq2VZXBCbevHVp+KmLH8nbe+rXqjxuQxcz5EzIEKm+rPPNyLkMev
	 US40HhtxGONJbLNFLyKzWiQ7b4Wq+pI0mTfvjvyVK5qH42Jtwa4Yeo5vW9vYych96A
	 IDxpBndkoqEmdO+eAPKUHd/uyugpsgzIRHSDPe77/lbQA6TDMMvmYQ1FWrGHcgYDRf
	 p1bcgvY2uxrCw==
Message-ID: <sashiko-outbox-232953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ALSA: core: Reject zero major number
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125084324.4151-1-sreekuttan2156239@gmail.com>
References: <87o6bd8ijb.wl-tiwai@suse.de>
 <20261125084324.4151-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:52:40 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: core: using snd_ecards_limit for cards_limit breaks
  snd_request_card()
--

commit 09efa67fd5336064a9c9600571b9d55c3d75ea0a
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: core: Reject zero major number

This commit rejects a zero major number in alsa_sound_init() and replaces
the static major and cards_limit variables with snd_major and
snd_ecards_limit via module_param_named().

> diff --git a/sound/core/sound.c b/sound/core/sound.c
> index ba226aa7affd3..746a5e254cbb8 100644
> --- a/sound/core/sound.c
> +++ b/sound/core/sound.c
> @@ -18,28 +18,25 @@
>  #include <linux/kmod.h>
>  #include <linux/mutex.h>
> =20
> -static int major =3D CONFIG_SND_MAJOR;
> -int snd_major;
> +int snd_major =3D CONFIG_SND_MAJOR;
>  EXPORT_SYMBOL(snd_major);
> =20
> -static int cards_limit =3D 1;
> +/* this one holds the actual max. card number currently available.
> + * as default, it's identical with cards_limit option.  when more
> + * modules are loaded manually, this limit number increases, too.
> + */
> +int snd_ecards_limit =3D 1;
> +EXPORT_SYMBOL(snd_ecards_limit);
> =20
>  MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
>  MODULE_DESCRIPTION("Advanced Linux Sound Architecture driver for soundca=
rds.");
>  MODULE_LICENSE("GPL");
> -module_param(major, int, 0444);
> +module_param_named(major, snd_major, int, 0444);
>  MODULE_PARM_DESC(major, "Major # for sound driver.");
> -module_param(cards_limit, int, 0444);
> +module_param_named(cards_limit, snd_ecards_limit, int, 0444);
>  MODULE_PARM_DESC(cards_limit, "Count of auto-loadable soundcards.");
>  MODULE_ALIAS_CHARDEV_MAJOR(CONFIG_SND_MAJOR);
> =20
> -/* this one holds the actual max. card number currently available.
> - * as default, it's identical with cards_limit option.  when more
> - * modules are loaded manually, this limit number increases, too.
> - */
> -int snd_ecards_limit;
> -EXPORT_SYMBOL(snd_ecards_limit);
> -
>  #ifdef CONFIG_SND_DEBUG
>  struct dentry *sound_debugfs_root;
>  EXPORT_SYMBOL_GPL(sound_debugfs_root);
> @@ -61,7 +58,7 @@ void snd_request_card(int card)
>  {
>  	if (snd_card_locked(card))
>  		return;
> -	if (card < 0 || card >=3D cards_limit)
> +	if (card < 0 || card >=3D snd_ecards_limit)
>  		return;
>  	request_module("snd-card-%i", card);
>  }

[Severity: Medium]
Does replacing cards_limit with snd_ecards_limit raise the auto-load limit
at runtime and mutate the cards_limit module parameter?

snd_card_init() increases snd_ecards_limit whenever a card is registered
at an index at or above it:

sound/core/init.c:snd_card_init() {
	...
			if (idx >=3D snd_ecards_limit)
				snd_ecards_limit =3D idx + 1; /* increase the limit */
	...
}

Once a second card or a card with an explicit index >=3D cards_limit is
registered, snd_ecards_limit grows to idx + 1 and is never lowered on
disconnect.  snd_request_card() will then invoke
request_module("snd-card-%i", card) for unoccupied or disconnected card
slots above the configured cards_limit, and
/sys/module/snd/parameters/cards_limit will report the mutated runtime
high-water mark instead of the configured limit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125084324.4151=
-1-sreekuttan2156239@gmail.com?part=3D1
