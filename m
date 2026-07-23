Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E650A3A5448
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784784629; cv=none; b=F7ffYp7ZWJ2UIy/JFNZvEwdICgaw2cOw87Uu3TXbrXf6nEscyqgiFIuwZyOubS1mWp2scdOMStEekzZXaUiEo8ukXZCErsV4548OmMZlxcN3WT5X+5LzV9OE3Ohx/jYfCmzjW8Mqa9xPla/bA9Kjhqnl3UOlh3VUF8I+o3ZxHQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784784629; c=relaxed/simple;
	bh=cIDAJnuOBt+rwzyUW445QgCOtd1xWXtIDuEa5qHVxuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJpzHafeJvFxstJaWSyuknN9UIw1+OOIF+iYIRUfuffrGll8y1PE9tZ8A0/rtEDft0TX1vjkhQ4Hhb5brIsz8Uifc8LFMzyf4inT/RVWHSbuNVmedK2ROH45ZATrKx8vfIzx2qDMoqroJJsCzCKMOTTt7uGc0uEWw7zo/+WZdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BRmqeCpj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BRmqeCpj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so129707f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 22:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784784624; x=1785389424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gbqp/BETAuL10zK/QjDMLkNML3uJVDKQA/suEZyhESk=;
        b=BRmqeCpjSVNdEj6nHWnmi4Q/XwPbvH9X34lcTVxJoFOaK+Eouk1npKGylPDHCIDvEs
         nRbrmgpAdoL3tmTw/IBd9WegajohRP9dILImR180nPnUZOnvFu7Peoupu2YAaUeZBvox
         l6VDR66nLRHO0aedTMzHzPDsUTN00qYEziQt6BT9OP4rXUx0d+NMfM78882mkS9UTs6T
         4WrWIXyYILce+vNAmzRimZUwrJTT1owbSet2D+dElZ5Li3YOLl+J6XyS9ht0b7Ww/+0G
         V6yL8Jyz9aQB4I67EgdNzVfD1GDrL5CS06iQMTy4vEQBfgj7K6hPGynFECR/BKAY/NTX
         gCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784784624; x=1785389424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gbqp/BETAuL10zK/QjDMLkNML3uJVDKQA/suEZyhESk=;
        b=iqMiXsNOF0NBvwvG3TjAA6Bvh67UDENDHfhIsGEjRFwc2sOZdM82sapnAbYRlN44b2
         cM8+ARaDb+TwUYBA8GeHvSQ7mS4MfqnbFs+Vbz20k6f43eKJO5NedzMVd3T/Rb9vo7c9
         AJyxwW/NWoOhipXKd042XTJok4IA7bi2RtNQ8jGuQkjrHH6XzvxxLdHDTNrVMWppLJNi
         C8QboH1eMM9MrXULKONKCZujvP/6QbGh1Se0CG597DI/7XIlF1XZFgkKBrqH2JmcCdvL
         00ylBXKFam0QgKn7b+qU9eNbAATST/UjXGk7HIUBInV884+akWsUSALuWd9JaBDusuKM
         jNEA==
X-Forwarded-Encrypted: i=1; AHgh+RriExD61Eko7nEw66nUNeQnNjGFpkLDCIlRpcKU6X+KKognK1DGV2eRD+2rRFecZkoZ17N2EizSg0Fmsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwxd2E6+EHgaJ6QmWGa3mayTc+NNaUcw7PHBlCYxHhJzAwhvBD
	x9PCUcrK+gIwwz/d19ffok1Pmesk1B4MlYlY9afK0kFy4/4EbMS2OO/4JVRJkzVhEbc=
X-Gm-Gg: AR+sD11wA46UKQEYP62UAivTuLye04tLkDBHrBRdh0IzQV7/sNtGORAdMGmSMCy+d52
	5/qC6IbJbZbj/gs+qpQ+C01rGkCErDe+7TohslKvBysrYfLGaxe9kj3QM3tMaZTqmWw1rMrHlnU
	GW2sC25vuoeaNbt2s9PO5y4zJrhpOMdGju4xoVlLDtnElWWC5MWH1iTVK2v7driEaWXp8lUrhuu
	qFtS+lolJKv0xsUXAr5X6m3P2IwVQQ2EOU6VfT1lE/hIxQNBvz8xNL+xTgymc9WeGNoLo89WDgq
	576dcGPR0Lq/fIPhOlMFh8DtxU0jvzvv+xZdMDR19aqr009lO5km+PYYTyB536xQjGdr4LUZcyf
	UVvO15eCyx8uQokQ7Lh8yMjqpxYMnOQ2ig38zO2CoxfgfA9XSYJaSDDJo1n5146IFibCBDtlJkg
	uE8Fm/BH8=
X-Received: by 2002:a05:6000:402a:b0:47f:4c9b:99b1 with SMTP id ffacd0b85a97d-47f8d754483mr1814550f8f.32.1784784624091;
        Wed, 22 Jul 2026 22:30:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85bc62basm11851732f8f.13.2026.07.22.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:30:23 -0700 (PDT)
Date: Thu, 23 Jul 2026 07:30:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id
 arrays
Message-ID: <amGhHDDlwMdool_q@monoceros>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
 <0f625961-8e2d-4ed9-ab5a-fd95bcb4c87a@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oygi6rynka5zevcn"
Content-Disposition: inline
In-Reply-To: <0f625961-8e2d-4ed9-ab5a-fd95bcb4c87a@intel.com>


--oygi6rynka5zevcn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id
 arrays
MIME-Version: 1.0

Hello Cezary,

On Wed, Jul 22, 2026 at 07:55:26PM +0200, Cezary Rojewski wrote:
> On 7/20/2026 8:23 AM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
>=20
> >   sound/soc/au1x/db1200.c                |  2 +-
> >   sound/soc/codecs/adau7118-hw.c         |  2 +-
> >   sound/soc/codecs/bt-sco.c              | 10 +++-------
> >   sound/soc/codecs/wcd934x.c             |  6 ++----
> >   sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---
> >   sound/soc/intel/avs/boards/da7219.c    |  6 ++----
> >   sound/soc/intel/avs/boards/dmic.c      |  6 ++----
> >   sound/soc/intel/avs/boards/es8336.c    |  6 ++----
> >   sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
> >   sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
> >   sound/soc/intel/avs/boards/max98357a.c |  6 ++----
> >   sound/soc/intel/avs/boards/max98373.c  |  6 ++----
> >   sound/soc/intel/avs/boards/max98927.c  |  6 ++----
> >   sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
> >   sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----
> >   sound/soc/intel/avs/boards/probe.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt274.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt286.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt298.c     |  2 +-
> >   sound/soc/intel/avs/boards/rt5514.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5640.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5663.c    |  2 +-
> >   sound/soc/intel/avs/boards/rt5682.c    |  2 +-
> >   sound/soc/intel/avs/boards/ssm4567.c   |  2 +-
> >   sound/soc/samsung/i2s.c                |  2 +-
>=20
> This change is outstanding when compared to patches 1-4 which follow the
> per-driver approach.  I'd expect one driver per scope e.g.: Intel's avs
> split away from the rest.

Well, patches 1 and 2 primarily follow the one patch per type of change
approach that happen to only affect one driver each. In the v1 thread I
was asked to split out split out the amd/acp bits which resulted in
patches 3 and 4. (And just now I notice you also replied and asked to
split out intel/avs, too, which I missed. Sorry!)

Conceptually I think one commit per driver is the right approach[1] but
most maintainers/reviewers seem to favour one commit adapting one thing
for all drivers in a subsystem. And in my experience no matter how you
make it, you get a reply to change.

Will split out intel/avs for v3 and maybe hit the sweet spot then.

> Nitpick: s/ASOC/ASoC/

Fixed in my tree, so will be correct in v3.

Best regards
Uwe

[1] My reason for that is the "one atomic change per patch" philosophy
    that allows to document who reviewed/acked what in a fine-grained
    way and allows selective reverting and backporting as needed.
    The downside is that the number of patches explodes, but git is able
    to handle that just fine in my experience. "commit count" is missing
    in https://markcarrigan.net/2026/06/18/the-museum-of-meaningless-metric=
s/

--oygi6rynka5zevcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphpusACgkQj4D7WH0S
/k4QMAgAiodEGJ+3wdZbbFha1cyeXY/4KnGWZwIGS91iUn/fGAugHIQjGusXDdlf
MK7Bm5B6RFc0nJmVRuK+dlVyvBjWnDiaqrcvEgW5iiGHt0e2d4B2yEu7aNVj1PDs
wuPQOThaBv7yf9NP9ddxiGofvSIuKVv7TxVf+Qf/OQjSyYseX57zpPS9h19m71vl
aVVtSUNPiwoeUnQWkRsq/qWZgnOeUrQTyXQekkv7uz1N43QnOnmb3m3iBX+mI1AN
TAfJQ2rTyMYEyIZfvwHe4nD5Nz4TpjStRk1BmH/HE8616DR4stk5Ts4tvSv1f6KT
qRSBSo9+7iG4nv7Avnq6gwIf7pTisw==
=tSnN
-----END PGP SIGNATURE-----

--oygi6rynka5zevcn--
