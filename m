Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE0315D1
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727888069; cv=none; b=heOwukn87r5m7RqTZEaMqsl6pxJneUPgWiuV+8rcoHnecWMAaZOHGRZyqXQs0S8Kp+gcs7DgsJLLy+4cmL5atIDfwVTYpQucE+hYM2gVnY7RW7c2pautsRB3fawECYfI5ZhpZmSkq78k7W2VSwpz5CdWYuwGJ38WZxAtuv2tD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727888069; c=relaxed/simple;
	bh=+YeeQ4xnlzOHP+A4u5xDPshiePPruw4fYsJO9K382KA=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=PkGaeajRu8aKufIwYgGEfMfC3WumdZku9NF9ahkg9Uz+9XuN4f3B5VCwFPi8jaz+E+tO9WfNaLs255yQ9GA9QdKMFxEC0TZ8ab+sXuWUKfmMVsT3GFmjK1IzMl9m+IfMIQzjaNHRx3Ucr+Q95//UNZ/sEsP0DPfibOvs5W3pciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=eNJ2UrTy; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eNJ2UrTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1727888058; x=1728147258;
	bh=ucKdwaqna1B8xoymzZHIN1Kqlw4g7/QHmb4SEO4z7Ok=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eNJ2UrTyybTFoC0LPMEqOJWfBAnLDu5G3OxVOGvbW/4GUbSZmMBZv2b8nSz6u6TTf
	 34m/GllRMgt3/gODqYzpONNAvIDwZp6IwnYmpFUZXbKATRP8ER0P1O9dHM3TC7vblW
	 8oD015YIuxFYBD3wumseiy8lQAOjf5Xz3IYzTcLojnEgwtc34YYRL1yTub14ezKslB
	 3htEc5hrbIexyXJuysZl1dYM5xfPKwWZPELpCkWKvkvZN9DmPakS5f0dT5d+s9uzY4
	 qhf3LQT15leiC4rQveF2jgdWTj5x1/Cl0SMtMq8+OBjLyusVlPMvG2GGwJmVYH+1RO
	 gIQIAP4GR4Cbg==
Date: Wed, 02 Oct 2024 16:54:13 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Incorrect automatic ALSA card ID when unicode is at play
Message-ID: <yk3WTvKkwheOon_LzZlJ43PPInz6byYfBzpKkbasww1yzuiMRqn7n6Y8vZcXB-xwFCu_vb8hoNjv7DTNwH5TWjpEuiVsyn9HPCEXqwF4120=@protonmail.com>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: d586403b7677f11222e703c615894baba9b6f4f4
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi


When `snd_card::id` is not specified explicitly it is determined automatica=
lly
in `sound/core/init.c:snd_card_register()` as follows:

  if (*card->id) {
    // ...
  } else {
    /* create an id from either shortname or longname */
    const char *src;

    src =3D *card->shortname ? card->shortname : card->longname;
    snd_card_set_id_no_lock(card, src,
                                  retrieve_id_from_card_name(src));
  }

However, `snd_card_set_id_no_lock()`, or more specifically the `copy_valid_=
id_string()`
function that it calls does not seem to copy very well with utf-8.

For example, based on the report at https://gitlab.freedesktop.org/pipewire=
/pipewire/-/issues/4135
where `card->shortname=3D"Redmi =E7=94=B5=E8=84=91=E9=9F=B3=E7=AE=B1"`, `ca=
rd->id` will be set to \xE7\xE8\xE9\xE7,
which are the first bytes of the symbols in the suffix "=E7=94=B5=E8=84=
=91=E9=9F=B3=E7=AE=B1" because only those
bytes of the string satisfy the `isalnum()` check in `copy_valid_id_string(=
)`.

I am not sure what kind of 8-bit character set `isalnum()` is basing these =
results on, but
it certainly does not mix well with utf-8 in this scenario at least.


Regards,
Barnab=C3=A1s P=C5=91cze
