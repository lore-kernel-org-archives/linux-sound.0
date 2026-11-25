Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595929;
	b=DPGhQNgol9h7vuq+l9nAVjcI4dT5u9RbVyo8BXUqM8m3Kr+lx+KJe/4KmPgY1grXkj/W
	 62LZn88ynNsHSgQ8FI/pjXe1/pQ5rnA6IggEXkVEXXNzMLFkvDFbwvoFt52v1sigtjlT4
	 2layLhNJkDiFOxS5OFwxVNUnfAtn9uvnWPvdOyDM375TS61fmbSWvU9Y2WlTSNy7xYW/j
	 uaB+lN7YxqC00OCoWyGZp0obgB3tm0DNEetYoPtbLw4fJvJE7v1PWgNwuZ2nFtr2v6Tnc
	 WA45MIuxOkFOVgtLieExkGY4GNLGuYB6Li7nuRTsdGavWroQHEA6ww9/ln04XoNZBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595929;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VRNENHmmLaE4ERrb7Y3NNse4tykbKVN1wscaZwdMndM=;
	b=NNTkgKqq8g3qDpGhiGBfsst6juCqUbR11VeTBDiKj3WrJaVOvrLf3hEIAcPEHI+Fl8Tc
	 Z6uooKvlfW0tdo6ifEtIgUcCaD5nxgCoukl8wMuVGgSdJH4c/RJnz7D6ONlPz1HeThqRE
	 EOIFnHSHEZwChUokwsL5MOGBjefmG/Jh3DyMCR0BAqMn0wSREpVQ2voIxYKkBHF7+uxkQ
	 SRuZoL8Zp8aUYy1Z3M4+XqoK+l4MJKZ4/3SX0aGRBrlTLGsIkWfcrMGAx+BCEyJph88EC
	 hyDFCtcWAisLU6ZfEx7E+JYEINtLMIdStgV27bISOTrogYBZL9AtEkT9P0sLL25Ysfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHxPGpc2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01B6606A6AC
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHxPGpc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297A01F0093C;
	Wed, 25 Nov 2026 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595929;
	bh=VRNENHmmLaE4ERrb7Y3NNse4tykbKVN1wscaZwdMndM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHxPGpc2fzMaIcnFkXi+Rs+xdLid6rRYmz1hwi8CTtO5THOwvDcsbeH2QxCeU775P
	 2RXOCz/XHx/Mc4/u9toIdjyz+ZEedfBv3smHRgIYdWSKRGjdvenypcHqqKstCucQuz
	 V8tikohl/w/gt/Srbj+GA4ZP3k2Mr69nUTBgKZBrHTRwg8pJzHABf9YWIMklmTqyY9
	 HOZEgoN3I+3Zvf5Y/90bBa6tTn2HyS7aYK192J/HZBPXT87PXTTnfPRo/b+vFd9b2i
	 eKMKnf8MIMEB7TMbQHCieeFXrClMWAKqeA/CFhDWJADhuJhk31LZP+uu/BkJa9ZV36
	 HpUnjTozgNIlw==
Message-ID: <sashiko-outbox-232917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: core: Reject zero major number
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125083053.3917-1-sreekuttan2156239@gmail.com>
References: <87o6bd8ijb.wl-tiwai@suse.de>
 <20261125083053.3917-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:38:48 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ALSA: core: undeclared identifier major in alsa_sound_exit()
- [Medium] ALSA: core: merging cards_limit with snd_ecards_limit breaks
  autoload limit
--

commit 9a3f490adfcc49e86e9645ef8d568109e4bac5c8
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: core: Reject zero major number

This commit rejects a zero major number in alsa_sound_init() before calling
register_chrdev(), removes the static major and cards_limit variables, and
binds the module parameters directly to snd_major and snd_ecards_limit.

> diff --git a/sound/core/sound.c b/sound/core/sound.c
> index ba226aa7affd3..ff459d8f8aa78 100644
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
Does replacing cards_limit with snd_ecards_limit break the auto-load card
limit?

As noted in the comment above snd_ecards_limit, snd_card_init() raises
snd_ecards_limit whenever a card is registered at an index >=3D
snd_ecards_limit:

sound/core/init.c:snd_card_init() {
    ...
		if (!err) {
			set_bit(idx, snd_cards_lock);		/* lock it */
			if (idx >=3D snd_ecards_limit)
				snd_ecards_limit =3D idx + 1; /* increase the limit */
		}
    ...
}

Once a card is registered at an index above the configured cards_limit,
snd_ecards_limit grows to idx + 1.  snd_request_card() will then call
request_module("snd-card-%i", card) for any free or unloaded slot up to the
new snd_ecards_limit instead of stopping at the configured cards_limit, and
/sys/module/snd/parameters/cards_limit will report the mutated runtime
value.

[ ... ]

> @@ -442,18 +439,19 @@ static int __init alsa_sound_init(void)
>  {
>  	int err;
> =20
> -	snd_major =3D major;
> -	snd_ecards_limit =3D cards_limit;
> +	if (!snd_major)
> +		return -EINVAL;
> =20
> -	err =3D register_chrdev(major, "alsa", &snd_fops);
> +	err =3D register_chrdev(snd_major, "alsa", &snd_fops);
>  	if (err < 0) {
> -		pr_err("ALSA core: unable to register native major device number %d\n"=
, major);
> +		pr_err("ALSA core: unable to register native major device number %d\n",
> +		       snd_major);
>  		return err;
>  	}
> =20
>  	err =3D snd_info_init();
>  	if (err < 0) {
> -		unregister_chrdev(major, "alsa");
> +		unregister_chrdev(snd_major, "alsa");
>  		return err;
>  	}

[Severity: High]
Does alsa_sound_exit() fail to compile now that major is removed?

sound/core/sound.c:alsa_sound_exit() {
    ...
	snd_info_done();
	unregister_chrdev(major, "alsa");
}

alsa_sound_exit() still passes major instead of snd_major to
unregister_chrdev(), causing an undeclared identifier build error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125083053.3917=
-1-sreekuttan2156239@gmail.com?part=3D1
